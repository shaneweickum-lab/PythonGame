"use client";

import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { useSearchParams } from "next/navigation";
import CodeMirror from "@uiw/react-codemirror";
import { python } from "@codemirror/lang-python";
import { indentUnit } from "@codemirror/language";
import { oneDark } from "@codemirror/theme-one-dark";
import { keymap } from "@codemirror/view";
import type { EditorView } from "@codemirror/view";
import { indentWithTab } from "@codemirror/commands";

import { Sketch } from "@/lib/bamboo/sandbox";
import { lint } from "@/lib/bamboo/linter";
import { EXAMPLES } from "@/lib/bamboo/examples-manifest";
import {
  bambooStorage,
  sanitizeName,
  downloadFile,
  readUploadedFile,
  fetchModuleSourceLookup,
} from "@/lib/bambooStorage";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { BambooReference } from "@/components/bamboo/BambooReference";
import type { BambooFile } from "@/lib/supabase/types";

const DEFAULT_SOURCE = `def setup():
    background(255, 255, 255)

def draw():
    stroke(34, 139, 34)
    for i in range(8):
        forward(100)
        turn(45)
`;

type LintIssue = { line: number | null; rule: string; severity: string; message: string };
type OutputTab = "canvas" | "terminal" | "reference";
type FriendlyError = { message: string; line: number | null };
type TerminalLine = { text: string; isError?: boolean };

const configured = isSupabaseConfigured();

export function BambooEditor() {
  const searchParams = useSearchParams();
  const [code, setCode] = useState(DEFAULT_SOURCE);
  const [filename, setFilename] = useState("main.bs");
  const [currentFileId, setCurrentFileId] = useState<string | null>(null);
  const [currentProjectId, setCurrentProjectId] = useState<string | null>(null);
  const [files, setFiles] = useState<BambooFile[]>([]);
  const [projectFiles, setProjectFiles] = useState<BambooFile[]>([]);
  const [status, setStatus] = useState("Ready. Press Run or Ctrl/Cmd+Enter.");
  const [activeTab, setActiveTab] = useState<OutputTab>("canvas");
  const [canvasError, setCanvasError] = useState<FriendlyError | null>(null);
  const [terminalLines, setTerminalLines] = useState<TerminalLine[]>([]);
  const [terminalPrompt, setTerminalPrompt] = useState<string | null>(null);
  const [terminalInputValue, setTerminalInputValue] = useState("");
  const [lintIssues, setLintIssues] = useState<LintIssue[]>([]);
  const [examplesOpen, setExamplesOpen] = useState(false);
  const [fullscreen, setFullscreen] = useState(() => searchParams.get("fullscreen") === "1");

  const containerRef = useRef<HTMLDivElement>(null);
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const sketchRef = useRef<Sketch | null>(null);
  const editorViewRef = useRef<EditorView | null>(null);
  const terminalResolveRef = useRef<((v: string) => void) | null>(null);
  const terminalOutputRef = useRef<HTMLDivElement>(null);
  const fileUploadRef = useRef<HTMLInputElement>(null);

  // Stable snapshots so callbacks below don't need to be recreated (and
  // stay accurate) on every keystroke -- mirrors the pattern already used
  // by PyodideEditor for the same reason. Synced in an effect (not during
  // render) since refs may only be written outside of render.
  const codeRef = useRef(code);
  const filenameRef = useRef(filename);
  const currentFileIdRef = useRef(currentFileId);
  const currentProjectIdRef = useRef(currentProjectId);
  const activeTabRef = useRef(activeTab);
  const filesRef = useRef(files);
  const projectFilesRef = useRef(projectFiles);

  useEffect(() => {
    codeRef.current = code;
    filenameRef.current = filename;
    currentFileIdRef.current = currentFileId;
    currentProjectIdRef.current = currentProjectId;
    activeTabRef.current = activeTab;
    filesRef.current = files;
    projectFilesRef.current = projectFiles;
  });

  useEffect(() => {
    if (canvasRef.current && !sketchRef.current) {
      sketchRef.current = new Sketch(canvasRef.current);
    }
    return () => {
      sketchRef.current?.stop();
    };
  }, []);

  // Plain (non-memoized) async helpers -- called both from the mount/
  // project-change effects below (inlined via .then() so the effect body
  // itself never calls setState synchronously) and from event handlers
  // further down (Save, Delete, Rename, add-project-file, ...).
  async function refreshFileList() {
    if (!configured) return;
    try {
      setFiles(await bambooStorage.listFiles());
    } catch {
      setStatus("Couldn't load your saved sketches.");
    }
  }

  async function refreshProjectFiles(projectId: string | null) {
    if (!configured || !projectId) {
      setProjectFiles([]);
      return;
    }
    try {
      setProjectFiles(await bambooStorage.listProjectFiles(projectId));
    } catch {
      setProjectFiles([]);
    }
  }

  useEffect(() => {
    if (!configured) return;
    bambooStorage
      .listFiles()
      .then((list) => {
        setFiles(list);
        // Deep link from "Open in new tab" (?file=<id>) -- open it once we
        // know it's actually in the list, rather than racing openFile()
        // against this same fetch.
        const fileId = searchParams.get("file");
        if (fileId && list.some((f) => f.id === fileId)) {
          openFile(fileId);
        }
      })
      .catch(() => setStatus("Couldn't load your saved sketches."));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    function onFullscreenChange() {
      if (!document.fullscreenElement) setFullscreen(false);
    }
    document.addEventListener("fullscreenchange", onFullscreenChange);
    return () => document.removeEventListener("fullscreenchange", onFullscreenChange);
  }, []);

  useEffect(() => {
    // Nothing to clear when there's no project: the project-chips row below
    // is already gated on `currentProjectId` being set, so stale data here
    // is simply never read until a real project fetch replaces it.
    if (!configured || !currentProjectId) return;
    bambooStorage
      .listProjectFiles(currentProjectId)
      .then(setProjectFiles)
      .catch(() => setProjectFiles([]));
  }, [currentProjectId]);

  useEffect(() => {
    const t = setTimeout(() => {
      try {
        const result = lint(code);
        setLintIssues(
          result.syntaxError
            ? [{ line: result.syntaxError.line, severity: "warning", message: result.syntaxError.message, rule: "syntax" }]
            : result.issues,
        );
      } catch {
        setLintIssues([]);
      }
    }, 300);
    return () => clearTimeout(t);
  }, [code]);

  useEffect(() => {
    if (terminalOutputRef.current) {
      terminalOutputRef.current.scrollTop = terminalOutputRef.current.scrollHeight;
    }
  }, [terminalLines]);

  function appendTerminalLine(text: string, isError = false) {
    setTerminalLines((lines) => [...lines, { text, isError }]);
  }

  function resetTerminal() {
    setTerminalLines([]);
    setTerminalPrompt(null);
    setTerminalInputValue("");
    terminalResolveRef.current = null;
  }

  function submitTerminalInput(e: React.FormEvent) {
    e.preventDefault();
    const value = terminalInputValue;
    const prompt = terminalPrompt ?? "";
    appendTerminalLine(`${prompt}${value}`);
    setTerminalPrompt(null);
    setTerminalInputValue("");
    const resolve = terminalResolveRef.current;
    terminalResolveRef.current = null;
    resolve?.(value);
  }

  const runSketch = useCallback(async () => {
    const projectId = currentProjectIdRef.current;
    const fileId = currentFileIdRef.current;
    if (fileId && configured) {
      try {
        await bambooStorage.saveFile(fileId, codeRef.current);
      } catch {
        // fall through and run the in-memory code anyway
      }
    }
    setCanvasError(null);
    resetTerminal();

    const wasReference = activeTabRef.current === "reference";
    const mode: "canvas" | "terminal" = activeTabRef.current === "terminal" ? "terminal" : "canvas";
    if (wasReference) setActiveTab("canvas");

    const mainSource =
      projectId && fileId !== projectId ? await bambooStorage.getFile(projectId) : codeRef.current;
    const getModuleSource = projectId ? await fetchModuleSourceLookup(projectId) : () => null;

    const sketch = sketchRef.current;
    if (!sketch) return;

    if (mode === "terminal") {
      sketch.run(mainSource, {
        mode: "terminal",
        getModuleSource,
        onError: (err: FriendlyError) => {
          const where = err.line ? `Line ${err.line}: ` : "";
          appendTerminalLine(`${where}${err.message}`, true);
          setTerminalPrompt(null);
        },
        onPrint: (text: string) => appendTerminalLine(text),
        onInputRequest: (prompt: string, resolve: (v: string) => void) => {
          terminalResolveRef.current = resolve;
          setTerminalPrompt(prompt);
        },
      });
    } else {
      sketch.run(mainSource, {
        mode: "canvas",
        getModuleSource,
        onError: (err: FriendlyError) => setCanvasError(err),
        onPrint: (text: string) => appendTerminalLine(text),
      });
    }
  }, []);

  function stopSketch() {
    sketchRef.current?.stop();
    setTerminalPrompt(null);
    setStatus("Stopped.");
  }

  async function toggleFullscreen() {
    const next = !fullscreen;
    setFullscreen(next);
    try {
      if (next && containerRef.current && document.fullscreenElement !== containerRef.current) {
        await containerRef.current.requestFullscreen();
      } else if (!next && document.fullscreenElement) {
        await document.exitFullscreen();
      }
    } catch {
      // Native Fullscreen API unavailable or denied (e.g. iOS Safari,
      // embedded contexts) -- the CSS-overlay fullscreen above still
      // applies, so the IDE still fills the browser window either way.
    }
  }

  function openInNewTab() {
    const params = new URLSearchParams({ mode: "bamboo", fullscreen: "1" });
    if (configured && currentFileIdRef.current) {
      params.set("file", currentFileIdRef.current);
    }
    window.open(`/playground?${params.toString()}`, "_blank", "noopener,noreferrer,width=1000,height=900");
  }

  function newFile() {
    sketchRef.current?.stop();
    setCanvasError(null);
    setCurrentFileId(null);
    setCurrentProjectId(null);
    setFilename("main.bs");
    setCode(DEFAULT_SOURCE);
    setStatus("New sketch.");
  }

  async function openFile(id: string) {
    const entry = filesRef.current.find((f) => f.id === id);
    if (!entry) return;
    sketchRef.current?.stop();
    setCanvasError(null);
    setCurrentFileId(id);
    setCurrentProjectId(entry.project_id);
    setFilename(entry.name);
    try {
      setCode(await bambooStorage.getFile(id));
    } catch {
      setStatus("Couldn't load that file.");
      return;
    }
    setStatus(`Opened ${entry.name}.`);
  }

  const saveCurrent = useCallback(async () => {
    const name = sanitizeName(filenameRef.current);
    setFilename(name);
    try {
      const fileId = currentFileIdRef.current;
      if (fileId) {
        await bambooStorage.saveFile(fileId, codeRef.current);
        const entry = filesRef.current.find((f) => f.id === fileId);
        if (entry && entry.name !== name) await bambooStorage.renameFile(fileId, name);
      } else {
        const entry = await bambooStorage.createFile(name, codeRef.current);
        setCurrentFileId(entry.id);
        setCurrentProjectId(entry.project_id);
      }
      await refreshFileList();
      setStatus(`Saved ${name}.`);
    } catch {
      setStatus("Failed to save -- check your connection and try again.");
    }
  }, []);

  async function saveAs() {
    const name = sanitizeName(filenameRef.current);
    setFilename(name);
    try {
      const entry = await bambooStorage.createFile(name, codeRef.current);
      setCurrentFileId(entry.id);
      setCurrentProjectId(entry.project_id);
      await refreshFileList();
      downloadFile(name, codeRef.current);
      setStatus(`Saved a copy as ${name} and downloaded it.`);
    } catch {
      setStatus("Failed to save a copy.");
    }
  }

  async function renameCurrent() {
    const fileId = currentFileIdRef.current;
    if (!fileId) {
      setStatus("Save this sketch first, then you can rename it.");
      return;
    }
    try {
      const entry = await bambooStorage.renameFile(fileId, filenameRef.current);
      setFilename(entry.name);
      await refreshFileList();
      setStatus(`Renamed to ${entry.name}.`);
    } catch {
      setStatus("Failed to rename.");
    }
  }

  async function deleteCurrent() {
    const fileId = currentFileIdRef.current;
    const projectId = currentProjectIdRef.current;
    if (!fileId) {
      setStatus("Nothing to delete -- this sketch isn't saved yet.");
      return;
    }
    const isMainFile = fileId === projectId;
    const siblings = isMainFile ? projectFilesRef.current.filter((f) => f.id !== projectId) : [];
    const confirmMsg = siblings.length
      ? `Delete "${filenameRef.current}" and its ${siblings.length} other project file(s)? This can't be undone.`
      : `Delete "${filenameRef.current}"? This can't be undone.`;
    if (!window.confirm(confirmMsg)) return;
    try {
      for (const sibling of siblings) await bambooStorage.deleteFile(sibling.id);
      await bambooStorage.deleteFile(fileId);
      await refreshFileList();
      newFile();
      setStatus("Deleted.");
    } catch {
      setStatus("Failed to delete.");
    }
  }

  async function switchProjectFile(id: string) {
    if (id === currentFileIdRef.current) return;
    if (currentFileIdRef.current) {
      try {
        await bambooStorage.saveFile(currentFileIdRef.current, codeRef.current);
      } catch {
        // continue switching even if the outgoing save failed
      }
    }
    const entry = projectFilesRef.current.find((f) => f.id === id);
    if (!entry) return;
    setCurrentFileId(id);
    setFilename(entry.name);
    try {
      setCode(await bambooStorage.getFile(id));
    } catch {
      setStatus("Couldn't load that file.");
      return;
    }
    setStatus(`Switched to ${entry.name}.`);
  }

  async function addProjectFile() {
    const projectId = currentProjectIdRef.current;
    if (!projectId) return;
    if (currentFileIdRef.current) {
      try {
        await bambooStorage.saveFile(currentFileIdRef.current, codeRef.current);
      } catch {
        // continue even if the outgoing save failed
      }
    }
    const existingNames = new Set(projectFilesRef.current.map((f) => f.name.toLowerCase()));
    let n = 1;
    let name = "module.bs";
    while (existingNames.has(name.toLowerCase())) {
      n += 1;
      name = `module${n}.bs`;
    }
    const moduleName = name.replace(/\.bs$/i, "");
    const starter = `# A new file in this project. Define functions here, then use them\n# from another file with 'import ${moduleName}' or\n# 'from ${moduleName} import example'.\n\ndef example():\n    return 0\n`;
    try {
      const entry = await bambooStorage.createProjectFile(projectId, name, starter);
      setCurrentFileId(entry.id);
      setFilename(entry.name);
      setCode(starter);
      await refreshProjectFiles(projectId);
      await refreshFileList();
      setStatus(`Created ${entry.name}.`);
    } catch {
      setStatus("Failed to create the new file.");
    }
  }

  async function handleFileUpload(e: React.ChangeEvent<HTMLInputElement>) {
    const file = e.target.files?.[0];
    e.target.value = "";
    if (!file) return;
    const text = await readUploadedFile(file);
    sketchRef.current?.stop();
    setCanvasError(null);
    setCurrentFileId(null);
    setCurrentProjectId(null);
    setFilename(sanitizeName(file.name));
    setCode(text);
    setStatus(`Loaded ${file.name} from disk. Save to keep it in your sketch list.`);
  }

  async function loadExample(example: (typeof EXAMPLES)[number]) {
    sketchRef.current?.stop();
    setCanvasError(null);
    setExamplesOpen(false);
    setStatus(`Loading "${example.title}"...`);

    let contents: { name: string; content: string }[];
    try {
      contents = await Promise.all(
        example.files.map(async (f) => {
          const res = await fetch(f.path);
          if (!res.ok) throw new Error(`couldn't fetch ${f.path} (${res.status})`);
          return { name: f.name, content: await res.text() };
        }),
      );
    } catch (err) {
      setStatus(`Couldn't load "${example.title}": ${err instanceof Error ? err.message : String(err)}`);
      return;
    }

    const [entryFile, ...siblingFiles] = contents;

    if (siblingFiles.length > 0 && !configured) {
      setStatus(
        `"${example.title}" is a multi-file project, which needs Supabase configured for this session to load correctly.`,
      );
      return;
    }

    if (siblingFiles.length === 0) {
      setCurrentFileId(null);
      setCurrentProjectId(null);
      setFilename(entryFile.name);
      setCode(entryFile.content);
      setStatus(
        configured ? `Loaded example "${example.title}". Save it to keep a copy.` : `Loaded example "${example.title}".`,
      );
    } else {
      try {
        const entry = await bambooStorage.createFile(entryFile.name, entryFile.content);
        for (const sibling of siblingFiles) {
          await bambooStorage.createProjectFile(entry.project_id, sibling.name, sibling.content);
        }
        setCurrentFileId(entry.id);
        setCurrentProjectId(entry.project_id);
        setFilename(entry.name);
        setCode(entryFile.content);
        await refreshFileList();
        setStatus(`Loaded example "${example.title}" as a new saved project.`);
      } catch {
        setStatus(`Couldn't save "${example.title}" as a project -- try again.`);
        return;
      }
    }

    setActiveTab(example.mode === "terminal" ? "terminal" : "canvas");
  }

  function jumpToLine(line: number) {
    const view = editorViewRef.current;
    if (!view) return;
    const clamped = Math.min(Math.max(1, line), view.state.doc.lines);
    const lineInfo = view.state.doc.line(clamped);
    view.dispatch({
      selection: { anchor: lineInfo.from, head: lineInfo.to },
      scrollIntoView: true,
    });
    view.focus();
  }

  const editorExtensions = useMemo(
    () => [python(), indentUnit.of("    "), keymap.of([indentWithTab])],
    [],
  );

  function handleEditorKeyDown(e: React.KeyboardEvent) {
    const mod = e.ctrlKey || e.metaKey;
    if (mod && e.key === "Enter") {
      e.preventDefault();
      runSketch();
    } else if (mod && e.key.toLowerCase() === "s") {
      e.preventDefault();
      saveCurrent();
    }
  }

  return (
    <div
      ref={containerRef}
      className={
        fullscreen
          ? "fixed inset-0 z-50 flex h-screen flex-col gap-4 overflow-hidden bg-slate-950 p-4"
          : "space-y-4"
      }
    >
      {!configured && (
        <div className="shrink-0 rounded-md border border-amber-500/40 bg-amber-500/10 px-3 py-2 text-xs text-amber-300">
          Supabase isn&apos;t configured for this session -- you can still write, run, and explore
          examples, but saving sketches and multi-file projects need it. See .env.local.example.
        </div>
      )}

      <div className="flex shrink-0 flex-wrap items-center gap-2">
        <input
          value={filename}
          onChange={(e) => setFilename(e.target.value)}
          spellCheck={false}
          aria-label="Sketch file name"
          className="w-40 rounded-md border border-slate-700 bg-slate-800 px-2 py-1.5 text-sm text-slate-200"
        />
        <button type="button" onClick={newFile} className="rounded-md border border-slate-700 px-3 py-1.5 text-xs text-slate-200 hover:bg-slate-800">
          New
        </button>
        <button type="button" onClick={saveCurrent} disabled={!configured} className="rounded-md border border-slate-700 px-3 py-1.5 text-xs text-slate-200 hover:bg-slate-800 disabled:opacity-40">
          Save
        </button>
        <button type="button" onClick={saveAs} className="rounded-md border border-slate-700 px-3 py-1.5 text-xs text-slate-200 hover:bg-slate-800">
          Save As
        </button>
        <button
          type="button"
          onClick={() => fileUploadRef.current?.click()}
          className="rounded-md border border-slate-700 px-3 py-1.5 text-xs text-slate-200 hover:bg-slate-800"
        >
          Open
        </button>
        <input ref={fileUploadRef} type="file" accept=".bs,text/plain" hidden onChange={handleFileUpload} />
        <button type="button" onClick={renameCurrent} disabled={!configured} className="rounded-md border border-slate-700 px-3 py-1.5 text-xs text-slate-200 hover:bg-slate-800 disabled:opacity-40">
          Rename
        </button>
        <button
          type="button"
          onClick={deleteCurrent}
          disabled={!configured}
          className="rounded-md border border-slate-700 px-3 py-1.5 text-xs text-slate-200 hover:bg-slate-800 border-red-900 text-red-300 hover:bg-red-950/40 disabled:opacity-40"
        >
          Delete
        </button>

        <div className="relative">
          <button
            type="button"
            onClick={() => setExamplesOpen((o) => !o)}
            aria-haspopup="true"
            aria-expanded={examplesOpen}
            className="rounded-md border border-slate-700 px-3 py-1.5 text-xs text-slate-200 hover:bg-slate-800"
          >
            Examples ▾
          </button>
          {examplesOpen && (
            <div className="absolute left-0 z-20 mt-1 max-h-80 w-72 overflow-y-auto rounded-md border border-slate-700 bg-slate-900 p-1 shadow-xl">
              {EXAMPLES.map((example) => (
                <button
                  key={example.id}
                  type="button"
                  onClick={() => loadExample(example)}
                  className="block w-full rounded-md px-2 py-1.5 text-left hover:bg-slate-800"
                >
                  <div className="text-sm font-medium text-slate-200">{example.title}</div>
                  <div className="text-xs text-slate-500">{example.description}</div>
                </button>
              ))}
            </div>
          )}
        </div>

        {configured && (
          <select
            value=""
            onChange={(e) => {
              if (e.target.value) openFile(e.target.value);
            }}
            className="rounded-md border border-slate-700 bg-slate-800 px-2 py-1.5 text-sm text-slate-200"
          >
            <option value="">My sketches...</option>
            {files.map((f) => (
              <option key={f.id} value={f.id}>
                {f.name}
              </option>
            ))}
          </select>
        )}

        <div className="ml-auto flex items-center gap-2">
          <button
            type="button"
            onClick={openInNewTab}
            title="Open this sketch in a new browser tab -- handy for putting the editor and the output side by side"
            className="rounded-md border border-slate-700 px-3 py-1.5 text-xs text-slate-200 hover:bg-slate-800"
          >
            ⧉ Open in new tab
          </button>
          <button
            type="button"
            onClick={toggleFullscreen}
            title={fullscreen ? "Exit fullscreen" : "Fill the browser window with the IDE"}
            className="rounded-md border border-slate-700 px-3 py-1.5 text-xs text-slate-200 hover:bg-slate-800"
          >
            {fullscreen ? "⤡ Exit fullscreen" : "⛶ Fullscreen"}
          </button>
        </div>
      </div>

      {currentProjectId && (
        <div className="flex shrink-0 flex-wrap items-center gap-1.5">
          {projectFiles.map((f) => (
            <button
              key={f.id}
              type="button"
              onClick={() => switchProjectFile(f.id)}
              title={f.id === currentProjectId ? `${f.name} (entry point)` : f.name}
              className={`rounded-full border px-3 py-1 text-xs ${
                f.id === currentFileId
                  ? "border-emerald-500 bg-emerald-500/10 text-emerald-300"
                  : "border-slate-700 text-slate-400 hover:bg-slate-800"
              }`}
            >
              {f.name}
            </button>
          ))}
          <button
            type="button"
            onClick={addProjectFile}
            title="Add a new file to this project"
            className="rounded-full border border-dashed border-slate-700 px-3 py-1 text-xs text-slate-500 hover:bg-slate-800"
          >
            +
          </button>
        </div>
      )}

      <div className={`grid gap-4 lg:grid-cols-2 ${fullscreen ? "min-h-0 flex-1" : ""}`}>
        <div className={`space-y-2 ${fullscreen ? "flex h-full min-h-0 flex-col" : ""}`}>
          <div
            onKeyDown={handleEditorKeyDown}
            className={`overflow-hidden rounded-md border border-slate-700 focus-within:border-emerald-500 [&_.cm-editor]:h-full [&_.cm-scroller]:font-mono [&_.cm-scroller]:text-sm ${fullscreen ? "min-h-0 flex-1" : ""}`}
          >
            <CodeMirror
              value={code}
              onChange={(value) => setCode(value)}
              height={fullscreen ? "100%" : "24rem"}
              theme={oneDark}
              basicSetup={{ tabSize: 4 }}
              extensions={editorExtensions}
              onCreateEditor={(view) => {
                editorViewRef.current = view;
              }}
            />
          </div>

          {lintIssues.length > 0 && (
            <div className="rounded-md border border-slate-800 bg-slate-900">
              <div className="flex items-center justify-between border-b border-slate-800 px-3 py-1.5 text-xs font-semibold uppercase tracking-wide text-slate-500">
                <span>Lint</span>
                <span>{lintIssues.length}</span>
              </div>
              <ul className="max-h-32 divide-y divide-slate-800 overflow-y-auto">
                {lintIssues.map((issue, i) => (
                  <li key={i}>
                    <button
                      type="button"
                      onClick={() => issue.line != null && jumpToLine(issue.line)}
                      className="flex w-full items-start gap-2 px-3 py-1.5 text-left text-xs hover:bg-slate-800/60"
                    >
                      {issue.line != null && (
                        <span className="shrink-0 font-mono text-slate-500">Line {issue.line}</span>
                      )}
                      <span className={issue.severity === "warning" ? "text-amber-300" : "text-slate-300"}>
                        {issue.message}
                      </span>
                    </button>
                  </li>
                ))}
              </ul>
            </div>
          )}

          <div className="flex flex-wrap items-center gap-3">
            <button type="button" onClick={runSketch} className="rounded-md bg-emerald-600 px-4 py-1.5 text-sm font-medium text-white hover:bg-emerald-500">
              Run ▶
            </button>
            <button type="button" onClick={stopSketch} className="rounded-md border border-slate-700 px-4 py-1.5 text-sm text-slate-200 hover:bg-slate-800">
              Stop ■
            </button>
            <span className="text-xs text-slate-500" role="status">
              {status}
            </span>
          </div>
        </div>

        <div className={`space-y-2 ${fullscreen ? "flex h-full min-h-0 flex-col" : ""}`}>
          <div className="flex shrink-0 gap-1 rounded-md border border-slate-800 bg-slate-900 p-1" role="tablist">
            {(["canvas", "terminal", "reference"] as const).map((tab) => (
              <button
                key={tab}
                type="button"
                role="tab"
                aria-selected={activeTab === tab}
                onClick={() => setActiveTab(tab)}
                className={`flex-1 rounded px-3 py-1.5 text-sm font-medium capitalize ${
                  activeTab === tab ? "bg-emerald-600 text-white" : "text-slate-400 hover:bg-slate-800"
                }`}
              >
                {tab}
              </button>
            ))}
          </div>

          <div
            style={fullscreen ? undefined : { height: "24rem" }}
            className={`overflow-hidden rounded-md border border-slate-800 bg-black ${fullscreen ? "min-h-0 flex-1" : ""}`}
          >
            {activeTab === "canvas" && (
              <div className="flex h-full flex-col">
                <div className="flex flex-1 items-center justify-center overflow-auto p-2">
                  <canvas ref={canvasRef} width={480} height={480} className="max-w-full rounded bg-white" />
                </div>
                {canvasError && (
                  <div className="border-t border-red-900 bg-red-950/40 px-3 py-2 text-xs text-red-300">
                    {canvasError.line ? `Line ${canvasError.line}: ` : ""}
                    {canvasError.message}
                  </div>
                )}
              </div>
            )}

            {activeTab === "terminal" && (
              <div className="flex h-full flex-col">
                <div
                  ref={terminalOutputRef}
                  className="flex-1 overflow-y-auto p-3 font-mono text-sm whitespace-pre-wrap text-slate-200"
                >
                  {terminalLines.map((line, i) => (
                    <div key={i} className={line.isError ? "text-red-400" : undefined}>
                      {line.text}
                    </div>
                  ))}
                </div>
                {terminalPrompt !== null && (
                  <form onSubmit={submitTerminalInput} className="flex items-center gap-2 border-t border-slate-800 px-3 py-2">
                    <span className="font-mono text-sm text-slate-400">{terminalPrompt}</span>
                    <input
                      autoFocus
                      value={terminalInputValue}
                      onChange={(e) => setTerminalInputValue(e.target.value)}
                      spellCheck={false}
                      className="flex-1 bg-transparent font-mono text-sm text-slate-100 outline-none"
                    />
                  </form>
                )}
              </div>
            )}

            {activeTab === "reference" && (
              <div className="h-full overflow-y-auto bg-slate-950">
                <BambooReference />
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
