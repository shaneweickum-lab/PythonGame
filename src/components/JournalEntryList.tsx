"use client";

import { useState, useTransition } from "react";
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
        <JournalEntryItem
          key={entry.id}
          entry={entry}
          phaseLabel={
            phaseTitles && entry.phase_id ? phaseTitles[entry.phase_id] : undefined
          }
        />
      ))}
    </ul>
  );
}

function JournalEntryItem({
  entry,
  phaseLabel,
}: {
  entry: JournalEntry;
  phaseLabel?: string;
}) {
  const [editing, setEditing] = useState(false);
  const [content, setContent] = useState(entry.content);
  const [isPending, startTransition] = useTransition();
  const [error, setError] = useState<string | null>(null);
  const router = useRouter();

  function remove() {
    startTransition(async () => {
      const supabase = createClient();
      await supabase.from("journal_entries").delete().eq("id", entry.id);
      router.refresh();
    });
  }

  function save() {
    const trimmed = content.trim();
    if (!trimmed) return;
    setError(null);

    startTransition(async () => {
      const supabase = createClient();
      const { error } = await supabase
        .from("journal_entries")
        .update({ content: trimmed })
        .eq("id", entry.id);

      if (error) {
        setError("Failed to save changes");
        return;
      }

      setEditing(false);
      router.refresh();
    });
  }

  return (
    <li className="rounded-lg border border-slate-800 bg-slate-900 px-4 py-3">
      <div className="mb-1 flex items-center justify-between gap-3">
        <div className="flex items-center gap-2 text-xs text-slate-500">
          <span>
            {new Date(entry.created_at).toLocaleString(undefined, {
              dateStyle: "medium",
              timeStyle: "short",
            })}
          </span>
          {phaseLabel && (
            <span className="rounded bg-slate-800 px-1.5 py-0.5 text-slate-400">
              {phaseLabel}
            </span>
          )}
        </div>
        {!editing && (
          <div className="flex items-center gap-3">
            <button
              type="button"
              disabled={isPending}
              onClick={() => setEditing(true)}
              className="text-xs text-slate-500 hover:text-emerald-400 disabled:opacity-50"
            >
              Edit
            </button>
            <button
              type="button"
              disabled={isPending}
              onClick={remove}
              className="text-xs text-slate-500 hover:text-red-400 disabled:opacity-50"
            >
              Delete
            </button>
          </div>
        )}
      </div>

      {editing ? (
        <div className="space-y-2">
          <textarea
            value={content}
            onChange={(e) => setContent(e.target.value)}
            rows={3}
            className="w-full resize-none rounded-md border border-slate-700 bg-slate-800 px-3 py-2 text-sm text-slate-100 outline-none focus:border-emerald-500"
          />
          <div className="flex items-center gap-3">
            <button
              type="button"
              onClick={save}
              disabled={isPending || !content.trim()}
              className="rounded-md bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-emerald-500 disabled:opacity-50"
            >
              {isPending ? "Saving..." : "Save"}
            </button>
            <button
              type="button"
              onClick={() => {
                setContent(entry.content);
                setEditing(false);
                setError(null);
              }}
              disabled={isPending}
              className="text-xs text-slate-400 hover:text-slate-200 disabled:opacity-50"
            >
              Cancel
            </button>
            {error && <span className="text-xs text-red-400">{error}</span>}
          </div>
        </div>
      ) : (
        <p className="whitespace-pre-wrap text-sm text-slate-200">{entry.content}</p>
      )}
    </li>
  );
}
