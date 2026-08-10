"use client";

import { useRef, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { PyodideEditor, type PyodideEditorHandle } from "@/components/PyodideEditor";
import type { Challenge } from "@/lib/supabase/types";

const SUMMARY_RE = /^(\d+)\/(\d+) tests passed$/m;

export function ChallengeRunner({ challenge }: { challenge: Challenge }) {
  const [showHint, setShowHint] = useState(false);
  const [result, setResult] = useState<"passed" | "failed" | null>(null);
  const [challengeStatus, setChallengeStatus] = useState(challenge.status);
  const [saveError, setSaveError] = useState(false);

  const editorRef = useRef<PyodideEditorHandle>(null);

  async function handleComplete(output: string) {
    setSaveError(false);
    const match = output.match(SUMMARY_RE);
    const allPassed = Boolean(match && match[1] === match[2]);
    setResult(allPassed ? "passed" : "failed");

    const nextStatus = allPassed
      ? "done"
      : challengeStatus === "not_started"
        ? "in_progress"
        : challengeStatus;

    if (isSupabaseConfigured() && editorRef.current) {
      const supabase = createClient();
      const { error } = await supabase
        .from("challenges")
        .update({
          status: nextStatus,
          code_snapshot: editorRef.current.getCode(),
          completed_at: nextStatus === "done" ? new Date().toISOString() : challenge.completed_at,
        })
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

      <PyodideEditor
        ref={editorRef}
        initialCode={challenge.code_snapshot || challenge.starter_code}
        editorLabel="Your solution"
        consoleLabel="Test output"
        runButtonLabel="Run Tests ▶"
        buildRunCode={(code) => `${code}\n${challenge.test_code}`}
        onComplete={handleComplete}
        extraControls={
          <>
            {result === "passed" && (
              <span className="text-sm font-medium text-emerald-400">All tests passed 🎉</span>
            )}
            {result === "failed" && (
              <span className="text-sm font-medium text-red-400">Not quite -- check the output</span>
            )}
            {saveError && (
              <span className="text-xs text-red-400">
                Result computed locally, but saving your progress failed -- try running again.
              </span>
            )}
          </>
        }
      />
    </div>
  );
}
