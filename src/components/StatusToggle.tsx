"use client";

import { useState, useTransition } from "react";
import { createClient } from "@/lib/supabase/client";
import type { ConceptStatus } from "@/lib/supabase/types";

const STATUSES: { value: ConceptStatus; label: string }[] = [
  { value: "not_started", label: "Not started" },
  { value: "in_progress", label: "In progress" },
  { value: "done", label: "Done" },
];

const STATUS_STYLES: Record<ConceptStatus, string> = {
  not_started: "bg-slate-800 text-slate-400 border-slate-700",
  in_progress: "bg-amber-500/10 text-amber-400 border-amber-500/40",
  done: "bg-emerald-500/10 text-emerald-400 border-emerald-500/40",
};

const ACTIVE_STYLES: Record<ConceptStatus, string> = {
  not_started: "bg-slate-600 text-white border-slate-500",
  in_progress: "bg-amber-500 text-slate-950 border-amber-400",
  done: "bg-emerald-500 text-slate-950 border-emerald-400",
};

export function StatusToggle({
  table,
  id,
  status,
}: {
  table: "concepts" | "projects";
  id: string;
  status: ConceptStatus;
}) {
  const [current, setCurrent] = useState(status);
  const [isPending, startTransition] = useTransition();
  const [error, setError] = useState<string | null>(null);

  function setStatus(next: ConceptStatus) {
    if (next === current) return;
    const previous = current;
    setCurrent(next);
    setError(null);

    startTransition(async () => {
      const supabase = createClient();
      const { error } = await supabase
        .from(table)
        .update({ status: next })
        .eq("id", id);

      if (error) {
        setCurrent(previous);
        setError("Failed to save");
      }
    });
  }

  return (
    <div className="flex items-center gap-1.5">
      <div className="inline-flex rounded-md border border-slate-800 p-0.5">
        {STATUSES.map((s) => (
          <button
            key={s.value}
            type="button"
            disabled={isPending}
            onClick={() => setStatus(s.value)}
            title={s.label}
            className={`rounded-[5px] border px-2 py-0.5 text-xs font-medium transition-colors disabled:opacity-60 ${
              current === s.value
                ? ACTIVE_STYLES[s.value]
                : `border-transparent ${STATUS_STYLES[s.value]} hover:brightness-125`
            }`}
          >
            {s.value === "not_started" ? "—" : s.value === "in_progress" ? "◐" : "✓"}
          </button>
        ))}
      </div>
      {error && <span className="text-xs text-red-400">{error}</span>}
    </div>
  );
}
