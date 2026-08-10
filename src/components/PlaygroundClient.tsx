"use client";

import { useEffect, useRef, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { getPyodide } from "@/lib/pyodide";
import type { PyodideAPI } from "pyodide";

const STARTER_CODE = `print("Hello, Python!")

for i in range(5):
    print(i ** 2)
`;

type LoadStatus = "loading" | "ready" | "error";

type ProjectOption = {
  id: string;
  title: string;
};

export function PlaygroundClient() {
  const [status, setStatus] = useState<LoadStatus>("loading");
  const [loadError, setLoadError] = useState<string | null>(null);
  const [code, setCode] = useState(STARTER_CODE);
  const [output, setOutput] = useState("");
  const [running, setRunning] = useState(false);
  const [projects, setProjects] = useState<ProjectOption[]>([]);
  const [selectedProjectId, setSelectedProjectId] = useState("");
  const [saveState, setSaveState] = useState<"idle" | "saving" | "saved" | "error">("idle");

  const pyodideRef = useRef<PyodideAPI | null>(null);

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

  useEffect(() => {
    if (!process.env.NEXT_PUBLIC_SUPABASE_URL) return;
    const supabase = createClient();
    supabase
      .from("projects")
      .select("id, title")
      .order("title")
      .then(({ data }) => {
        if (data) setProjects(data as ProjectOption[]);
      });
  }, []);

  async function runCode() {
    const pyodide = pyodideRef.current;
    if (!pyodide || running) return;

    setRunning(true);
    setOutput("");

    pyodide.setStdout({ batched: (msg) => setOutput((o) => o + msg + "\n") });
    pyodide.setStderr({ batched: (msg) => setOutput((o) => o + msg + "\n") });

    try {
      await pyodide.runPythonAsync(code);
    } catch (err) {
      setOutput((o) => o + (err instanceof Error ? err.message : String(err)) + "\n");
    } finally {
      setRunning(false);
    }
  }

  async function saveToProject() {
    if (!selectedProjectId) return;
    setSaveState("saving");
    const supabase = createClient();
    const { error } = await supabase
      .from("projects")
      .update({ code_snapshot: code })
      .eq("id", selectedProjectId);

    setSaveState(error ? "error" : "saved");
    if (!error) {
      setTimeout(() => setSaveState("idle"), 2000);
    }
  }

  return (
    <div className="space-y-4">
      <div>
        <h1 className="text-2xl font-semibold text-slate-100">Playground</h1>
        <p className="mt-1 text-sm text-slate-400">
          Runs entirely in your browser via Pyodide (Python compiled to
          WebAssembly) -- no server execution involved.
        </p>
      </div>

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
            Editor
          </label>
          <textarea
            value={code}
            onChange={(e) => setCode(e.target.value)}
            spellCheck={false}
            className="h-80 w-full resize-y rounded-md border border-slate-700 bg-slate-900 p-3 font-mono text-sm text-slate-100 outline-none focus:border-emerald-500"
          />
          <div className="flex items-center gap-3">
            <button
              type="button"
              onClick={runCode}
              disabled={status !== "ready" || running}
              className="rounded-md bg-emerald-600 px-4 py-1.5 text-sm font-medium text-white hover:bg-emerald-500 disabled:opacity-50"
            >
              {running ? "Running..." : "Run ▶"}
            </button>

            <select
              value={selectedProjectId}
              onChange={(e) => setSelectedProjectId(e.target.value)}
              className="rounded-md border border-slate-700 bg-slate-800 px-2 py-1.5 text-sm text-slate-200"
            >
              <option value="">Save to project...</option>
              {projects.map((p) => (
                <option key={p.id} value={p.id}>
                  {p.title}
                </option>
              ))}
            </select>
            <button
              type="button"
              onClick={saveToProject}
              disabled={!selectedProjectId || saveState === "saving"}
              className="rounded-md border border-slate-700 px-3 py-1.5 text-sm text-slate-200 hover:bg-slate-800 disabled:opacity-50"
            >
              {saveState === "saving"
                ? "Saving..."
                : saveState === "saved"
                  ? "Saved ✓"
                  : saveState === "error"
                    ? "Failed"
                    : "Save"}
            </button>
          </div>
        </div>

        <div className="space-y-2">
          <label className="text-xs font-semibold uppercase tracking-wide text-slate-500">
            Console
          </label>
          <pre className="h-80 w-full overflow-auto rounded-md border border-slate-800 bg-black p-3 font-mono text-sm whitespace-pre-wrap text-slate-200">
            {output || (running ? "" : "Output will appear here.")}
          </pre>
        </div>
      </div>
    </div>
  );
}
