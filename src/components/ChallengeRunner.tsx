"use client";

import { useEffect, useRef, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { getPyodide } from "@/lib/pyodide";
import type { Challenge } from "@/lib/supabase/types";
import type { PyodideAPI } from "pyodide";

type LoadStatus = "loading" | "ready" | "error";

const SUMMARY_RE = /^(\d+)\/(\d+) tests passed$/m;

export function ChallengeRunner({ challenge }: { challenge: Challenge }) {
  const [status, setStatus] = useState<LoadStatus>("loading");
  const [loadError, setLoadError] = useState<string | null>(null);
  const [code, setCode] = useState(challenge.code_snapshot || challenge.starter_code);
  const [output, setOutput] = useState("");
  const [running, setRunning] = useState(false);
  const [showHint, setShowHint] = useState(false);
  const [result, setResult] = useState<"passed" | "failed" | null>(null);
  const [challengeStatus, setChallengeStatus] = useState(challenge.status);
  const [saveError, setSaveError] = useState(false);

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

  async function runTests() {
    const pyodide = pyodideRef.current;
    if (!pyodide || running) return;

    setRunning(true);
    setOutput("");
    setResult(null);
    setSaveError(false);

    let collected = "";
    const appendLine = (msg: string) => {
      collected += msg + "\n";
      setOutput(collected);
    };
    pyodide.setStdout({ batched: appendLine });
    pyodide.setStderr({ batched: appendLine });

    let allPassed = false;
    try {
      await pyodide.runPythonAsync(`${code}\n${challenge.test_code}`);
      const match = collected.match(SUMMARY_RE);
      allPassed = Boolean(match && match[1] === match[2]);
      setResult(allPassed ? "passed" : "failed");
    } catch (err) {
      appendLine(err instanceof Error ? err.message : String(err));
      setResult("failed");
    } finally {
      setRunning(false);
    }

    const nextStatus = allPassed
      ? "done"
      : challengeStatus === "not_started"
        ? "in_progress"
        : challengeStatus;

    if (isSupabaseConfigured()) {
      const supabase = createClient();
      const { error } = await supabase
        .from("challenges")
        .update({ status: nextStatus, code_snapshot: code })
        .eq("id", challenge.id);

      if (error) {
        setSaveError(true);
      }
    }
    setChallengeStatus(nextStatus);
  }

  const difficultyStyle =
    challenge.difficulty === "easy"
      ? "bg-emerald-500/10 text-emerald-400"
      : challenge.difficulty === "medium"
        ? "bg-amber-500/10 text-amber-400"
        : "bg-red-500/10 text-red-400";

  return (
    <div className="space-y-4">
      <div className="rounded-lg border border-slate-800 bg-slate-900 p-4">
        <div className="flex flex-wrap items-center gap-2">
          <span className={`rounded px-2 py-0.5 text-xs font-medium uppercase ${difficultyStyle}`}>
            {challenge.difficulty}
          </span>
          {challengeStatus === "done" && (
            <span className="rounded bg-emerald-500/10 px-2 py-0.5 text-xs font-medium text-emerald-400">
              Solved
            </span>
          )}
        </div>
        <p className="mt-3 text-sm text-slate-200">{challenge.prompt}</p>

        {challenge.hint && (
          <div className="mt-3">
            <button
              type="button"
              onClick={() => setShowHint((h) => !h)}
              className="text-xs font-medium text-emerald-400 hover:text-emerald-300"
            >
              {showHint ? "Hide hint" : "Show hint"}
            </button>
            {showHint && (
              <p className="mt-2 rounded-md bg-slate-800/60 px-3 py-2 text-xs text-slate-400">
                {challenge.hint}
              </p>
            )}
          </div>
        )}
      </div>

      {status === "loading" && (
        <div className="rounded-md border border-slate-800 bg-slate-900 px-4 py-3 text-sm text-slate-400">
          Loading Python runtime...
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
            Your solution
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
              onClick={runTests}
              disabled={status !== "ready" || running}
              className="rounded-md bg-emerald-600 px-4 py-1.5 text-sm font-medium text-white hover:bg-emerald-500 disabled:opacity-50"
            >
              {running ? "Running tests..." : "Run Tests ▶"}
            </button>
            {result === "passed" && (
              <span className="text-sm font-medium text-emerald-400">All tests passed 🎉</span>
            )}
            {result === "failed" && (
              <span className="text-sm font-medium text-red-400">Not quite -- check the output</span>
            )}
          </div>
          {saveError && (
            <p className="text-xs text-red-400">
              Result computed locally, but saving your progress failed -- try running again.
            </p>
          )}
        </div>

        <div className="space-y-2">
          <label className="text-xs font-semibold uppercase tracking-wide text-slate-500">
            Test output
          </label>
          <pre className="h-80 w-full overflow-auto rounded-md border border-slate-800 bg-black p-3 font-mono text-sm whitespace-pre-wrap text-slate-200">
            {output || (running ? "" : "Run the tests to see results here.")}
          </pre>
        </div>
      </div>
    </div>
  );
}
