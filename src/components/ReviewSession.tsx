"use client";

import { useState } from "react";
import Link from "next/link";
import { createClient } from "@/lib/supabase/client";
import { scheduleNextReview, type ReviewGrade } from "@/lib/sm2";
import type { Flashcard } from "@/lib/supabase/types";

const GRADE_BUTTONS: { grade: ReviewGrade; label: string; style: string }[] = [
  { grade: "again", label: "Again", style: "bg-red-600 hover:bg-red-500" },
  { grade: "hard", label: "Hard", style: "bg-orange-600 hover:bg-orange-500" },
  { grade: "good", label: "Good", style: "bg-emerald-600 hover:bg-emerald-500" },
  { grade: "easy", label: "Easy", style: "bg-sky-600 hover:bg-sky-500" },
];

export function ReviewSession({ initialCards }: { initialCards: Flashcard[] }) {
  const [queue, setQueue] = useState(initialCards);
  const [revealed, setRevealed] = useState(false);
  const [reviewedCount, setReviewedCount] = useState(0);
  const [grading, setGrading] = useState(false);
  const [gradeError, setGradeError] = useState<string | null>(null);

  const current = queue[0];
  const totalStarted = initialCards.length;

  async function submitGrade(chosenGrade: ReviewGrade) {
    if (!current || grading) return;
    setGrading(true);
    setGradeError(null);

    const update = scheduleNextReview(current, chosenGrade, new Date());

    const supabase = createClient();
    const { error } = await supabase
      .from("flashcards")
      .update({
        ease_factor: update.ease_factor,
        interval_days: update.interval_days,
        next_review_at: update.next_review_at,
        last_reviewed_at: new Date().toISOString(),
      })
      .eq("id", current.id);

    setGrading(false);

    if (error) {
      setGradeError("Failed to save this grade -- try again.");
      return;
    }

    setQueue((q) => q.slice(1));
    setReviewedCount((c) => c + 1);
    setRevealed(false);
  }

  if (totalStarted === 0) {
    return (
      <div className="rounded-lg border border-slate-800 bg-slate-900 px-4 py-8 text-center">
        <p className="text-sm text-slate-400">No flashcards are due right now.</p>
        <Link
          href="/"
          className="mt-3 inline-block text-sm font-medium text-emerald-400 hover:text-emerald-300"
        >
          Back to dashboard →
        </Link>
      </div>
    );
  }

  if (!current) {
    return (
      <div className="rounded-lg border border-slate-800 bg-slate-900 px-4 py-8 text-center">
        <p className="text-lg font-medium text-slate-100">Review complete 🎉</p>
        <p className="mt-1 text-sm text-slate-400">
          You reviewed {reviewedCount} card{reviewedCount === 1 ? "" : "s"}.
        </p>
        <Link
          href="/"
          className="mt-3 inline-block text-sm font-medium text-emerald-400 hover:text-emerald-300"
        >
          Back to dashboard →
        </Link>
      </div>
    );
  }

  return (
    <div className="space-y-4">
      <div className="text-xs text-slate-500">
        {reviewedCount} reviewed · {queue.length} remaining
      </div>

      <div className="min-h-[220px] rounded-lg border border-slate-800 bg-slate-900 p-6">
        <div className="text-xs font-semibold uppercase tracking-wide text-slate-500">
          Question
        </div>
        <p className="mt-2 text-lg text-slate-100">{current.question}</p>

        {revealed && (
          <>
            <div className="mt-5 text-xs font-semibold uppercase tracking-wide text-slate-500">
              Answer
            </div>
            <p className="mt-2 text-base text-emerald-300">{current.answer}</p>
          </>
        )}
      </div>

      {!revealed ? (
        <button
          type="button"
          onClick={() => setRevealed(true)}
          className="rounded-md bg-slate-700 px-4 py-2 text-sm font-medium text-white hover:bg-slate-600"
        >
          Show answer
        </button>
      ) : (
        <div className="space-y-2">
          <div className="flex flex-wrap gap-2">
            {GRADE_BUTTONS.map((b) => (
              <button
                key={b.grade}
                type="button"
                disabled={grading}
                onClick={() => submitGrade(b.grade)}
                className={`rounded-md px-4 py-2 text-sm font-medium text-white disabled:opacity-50 ${b.style}`}
              >
                {b.label}
              </button>
            ))}
          </div>
          {gradeError && <p className="text-xs text-red-400">{gradeError}</p>}
        </div>
      )}
    </div>
  );
}
