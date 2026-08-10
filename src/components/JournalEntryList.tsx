"use client";

import { useTransition } from "react";
import { useRouter } from "next/navigation";
import { createClient } from "@/lib/supabase/client";
import type { JournalEntry } from "@/lib/supabase/types";

export function JournalEntryList({
  entries,
  phaseTitles,
}: {
  entries: JournalEntry[];
  phaseTitles?: Record<string, string>;
}) {
  const [isPending, startTransition] = useTransition();
  const router = useRouter();

  function remove(id: string) {
    startTransition(async () => {
      const supabase = createClient();
      await supabase.from("journal_entries").delete().eq("id", id);
      router.refresh();
    });
  }

  if (entries.length === 0) {
    return (
      <p className="rounded-lg border border-slate-800 bg-slate-900 px-4 py-6 text-sm text-slate-400">
        No journal entries yet.
      </p>
    );
  }

  return (
    <ul className="space-y-3">
      {entries.map((entry) => (
        <li
          key={entry.id}
          className="rounded-lg border border-slate-800 bg-slate-900 px-4 py-3"
        >
          <div className="mb-1 flex items-center justify-between gap-3">
            <div className="flex items-center gap-2 text-xs text-slate-500">
              <span>
                {new Date(entry.created_at).toLocaleString(undefined, {
                  dateStyle: "medium",
                  timeStyle: "short",
                })}
              </span>
              {phaseTitles && entry.phase_id && phaseTitles[entry.phase_id] && (
                <span className="rounded bg-slate-800 px-1.5 py-0.5 text-slate-400">
                  {phaseTitles[entry.phase_id]}
                </span>
              )}
            </div>
            <button
              type="button"
              disabled={isPending}
              onClick={() => remove(entry.id)}
              className="text-xs text-slate-500 hover:text-red-400 disabled:opacity-50"
            >
              Delete
            </button>
          </div>
          <p className="whitespace-pre-wrap text-sm text-slate-200">
            {entry.content}
          </p>
        </li>
      ))}
    </ul>
  );
}
