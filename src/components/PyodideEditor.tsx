"use client";

import { useEffect, useImperativeHandle, useRef, useState, forwardRef } from "react";
import CodeMirror from "@uiw/react-codemirror";
import { python } from "@codemirror/lang-python";
import { indentUnit } from "@codemirror/language";
import { oneDark } from "@codemirror/theme-one-dark";
import { keymap } from "@codemirror/view";
import { indentWithTab } from "@codemirror/commands";
import { getPyodide } from "@/lib/pyodide";
import type { PyodideAPI } from "pyodide";

type LoadStatus = "loading" | "ready" | "error";

export type PyodideEditorHandle = {
  getCode: () => string;
};

const EDITOR_EXTENSIONS = [python(), indentUnit.of("    "), keymap.of([indentWithTab])];

export const PyodideEditor = forwardRef<
  PyodideEditorHandle,
  {
    initialCode: string;
    editorLabel?: string;
    consoleLabel?: string;
    height?: string;
    runButtonLabel?: string;
    extraControls?: React.ReactNode;
    /** Transforms the edited code into what actually runs (e.g. appending a test harness). Defaults to running the edited code as-is. */
    buildRunCode?: (code: string) => string;
    /** Called after each run finishes (pass or fail) with the full collected stdout/stderr text. */
    onComplete?: (output: string) => void;
  }
>(function PyodideEditor(
  {
    initialCode,
    editorLabel = "Editor",
    consoleLabel = "Console",
    height = "20rem",
    runButtonLabel = "Run ▶",
    extraControls,
    buildRunCode,
    onComplete,
  },
  ref,
) {
  const [status, setStatus] = useState<LoadStatus>("loading");
  const [loadError, setLoadError] = useState<string | null>(null);
  const [code, setCode] = useState(initialCode);
  const [output, setOutput] = useState("");
  const [running, setRunning] = useState(false);

  const pyodideRef = useRef<PyodideAPI | null>(null);

  useImperativeHandle(ref, () => ({ getCode: () => code }));

  useEffect(() => {
    getPyodide()
      .then((pyodide) => {
        pyodideRef.current = pyodide;
        setStatus("ready");
      })
      .catch((err) => {
        setLoadError(err instanceof Error ? err.message : String(err));
        setStatus("error");
      });
  }, []);

  async function runCode() {
    const pyodide = pyodideRef.current;
    if (!pyodide || running) return;

    setRunning(true);
    setOutput("");

    let collected = "";
    const appendLine = (msg: string) => {
      collected += msg + "\n";
      setOutput(collected);
    };
    pyodide.setStdout({ batched: appendLine });
    pyodide.setStderr({ batched: appendLine });

    const runCode = buildRunCode ? buildRunCode(code) : code;
    try {
      await pyodide.loadPackagesFromImports(runCode);
      await pyodide.runPythonAsync(runCode);
    } catch (err) {
      appendLine(err instanceof Error ? err.message : String(err));
    } finally {
      setRunning(false);
      onComplete?.(collected);
    }
  }

  return (
    <div className="space-y-4">
      {status === "loading" && (
        <div className="rounded-md border border-slate-800 bg-slate-900 px-4 py-3 text-sm text-slate-400">
          Loading Python runtime... this is a few MB and only happens once per
          session.
        </div>
      )}
      {status === "error" && (
        <div className="rounded-md border border-red-900 bg-red-950/40 px-4 py-3 text-sm text-red-300">
          Failed to load Pyodide{loadError ? `: ${loadError}` : "."}
        </div>
      )}

      <div className="grid gap-4 lg:grid-cols-2">
        <div className="space-y-2">
          <label className="text-xs font-semibold uppercase tracking-wide text-slate-500">
            {editorLabel}
          </label>
          <div className="overflow-hidden rounded-md border border-slate-700 focus-within:border-emerald-500 [&_.cm-editor]:h-full [&_.cm-scroller]:font-mono [&_.cm-scroller]:text-sm">
            <CodeMirror
              value={code}
              onChange={(value) => setCode(value)}
              height={height}
              theme={oneDark}
              basicSetup={{ tabSize: 4 }}
              extensions={EDITOR_EXTENSIONS}
            />
          </div>
          <div className="flex flex-wrap items-center gap-3">
            <button
              type="button"
              onClick={runCode}
              disabled={status !== "ready" || running}
              className="rounded-md bg-emerald-600 px-4 py-1.5 text-sm font-medium text-white hover:bg-emerald-500 disabled:opacity-50"
            >
              {running ? "Running..." : runButtonLabel}
            </button>
            {extraControls}
          </div>
        </div>

        <div className="space-y-2">
          <label className="text-xs font-semibold uppercase tracking-wide text-slate-500">
            {consoleLabel}
          </label>
          <pre
            style={{ height }}
            className="w-full overflow-auto rounded-md border border-slate-800 bg-black p-3 font-mono text-sm whitespace-pre-wrap text-slate-200"
          >
            {output || (running ? "" : "Output will appear here.")}
          </pre>
        </div>
      </div>
    </div>
  );
});
