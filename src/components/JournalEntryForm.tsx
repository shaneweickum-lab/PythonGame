"use client";

import { useRouter } from "next/navigation";
import { useState, useTransition } from "react";
import { createClient } from "@/lib/supabase/client";
import type { Phase } from "@/lib/supabase/types";

export function JournalEntryForm({
  phaseId = null,
  phases,
  placeholder = "What did you learn or struggle with?",
}: {
  phaseId?: string | null;
  phases?: Phase[];
  placeholder?: string;
}) {
  const [content, setContent] = useState("");
  const [selectedPhaseId, setSelectedPhaseId] = useState<string>("");
  const [isPending, startTransition] = useTransition();
  const [error, setError] = useState<string | null>(null);
  const router = useRouter();

  function submit() {
    const trimmed = content.trim();
    if (!trimmed) return;
    setError(null);

    const targetPhaseId = phases ? selectedPhaseId || null : phaseId;

    startTransition(async () => {
      const supabase = createClient();
      const { error } = await supabase
        .from("journal_entries")
        .insert({ content: trimmed, phase_id: targetPhaseId });

      if (error) {
        setError("Failed to save entry");
        return;
      }

      setContent("");
      router.refresh();
    });
  }

  return (
    <div className="space-y-2">
      <textarea
        value={content}
        onChange={(e) => setContent(e.target.value)}
        placeholder={placeholder}
        rows={3}
        className="w-full resize-none rounded-md border border-slate-700 bg-slate-800 px-3 py-2 text-sm text-slate-100 outline-none focus:border-emerald-500"
      />
      <div className="flex flex-wrap items-center gap-3">
        {phases && (
          <select
            value={selectedPhaseId}
            onChange={(e) => setSelectedPhaseId(e.target.value)}
            className="rounded-md border border-slate-700 bg-slate-800 px-2 py-1.5 text-xs text-slate-200"
          >
            <option value="">General (no phase)</option>
            {phases.map((p) => (
              <option key={p.id} value={p.id}>
                Phase {p.order_index}: {p.title}
              </option>
            ))}
          </select>
        )}
        <button
          type="button"
          onClick={submit}
          disabled={isPending || !content.trim()}
          className="rounded-md bg-emerald-600 px-3 py-1.5 text-xs font-medium text-white hover:bg-emerald-500 disabled:opacity-50"
        >
          {isPending ? "Saving..." : "Add entry"}
        </button>
        {error && <span className="text-xs text-red-400">{error}</span>}
      </div>
    </div>
  );
}
