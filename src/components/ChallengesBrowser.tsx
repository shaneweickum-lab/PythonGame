"use client";

import { useMemo, useState } from "react";
import Link from "next/link";
import type { Challenge, ChallengeDifficulty, ConceptStatus, Phase } from "@/lib/supabase/types";

const DIFFICULTY_STYLE: Record<ChallengeDifficulty, string> = {
  easy: "bg-emerald-500/10 text-emerald-400",
  medium: "bg-amber-500/10 text-amber-400",
  hard: "bg-red-500/10 text-red-400",
};

const STATUS_STYLE: Record<ConceptStatus, string> = {
  not_started: "bg-slate-800 text-slate-400",
  in_progress: "bg-amber-500/10 text-amber-400",
  done: "bg-emerald-500/10 text-emerald-400",
};

const STATUS_LABEL: Record<ConceptStatus, string> = {
  not_started: "Not started",
  in_progress: "In progress",
  done: "Solved",
};

const DIFFICULTY_OPTIONS: { value: ChallengeDifficulty | "all"; label: string }[] = [
  { value: "all", label: "All" },
  { value: "easy", label: "Easy" },
  { value: "medium", label: "Medium" },
  { value: "hard", label: "Hard" },
];

const STATUS_OPTIONS: { value: ConceptStatus | "all"; label: string }[] = [
  { value: "all", label: "All" },
  { value: "not_started", label: "Not started" },
  { value: "in_progress", label: "In progress" },
  { value: "done", label: "Solved" },
];

function PillGroup<T extends string>({
  options,
  value,
  onChange,
}: {
  options: { value: T; label: string }[];
  value: T;
  onChange: (v: T) => void;
}) {
  return (
    <div className="flex flex-wrap gap-1.5">
      {options.map((opt) => (
        <button
          key={opt.value}
          type="button"
          onClick={() => onChange(opt.value)}
          className={`rounded-full border px-3 py-1 text-xs font-medium transition-colors ${
            value === opt.value
              ? "border-emerald-500/70 bg-emerald-500/10 text-emerald-400"
              : "border-slate-800 bg-slate-900 text-slate-400 hover:border-slate-700 hover:text-slate-200"
          }`}
        >
          {opt.label}
        </button>
      ))}
    </div>
  );
}

function PhaseGroup({
  phase,
  challenges,
  open,
  onToggle,
}: {
  phase: Phase;
  challenges: Challenge[];
  open: boolean;
  onToggle: () => void;
}) {
  const done = challenges.filter((c) => c.status === "done").length;

  return (
    <div className="rounded-lg border border-slate-800 bg-slate-900">
      <button
        type="button"
        onClick={onToggle}
        className="flex w-full items-center justify-between gap-4 px-4 py-3 text-left"
      >
        <div className="flex items-center gap-3">
          <span className="text-xs font-mono text-slate-500">
            {String(phase.order_index).padStart(2, "0")}
          </span>
          <span className="font-medium text-slate-100">{phase.title}</span>
        </div>
        <div className="flex shrink-0 items-center gap-3 text-xs text-slate-500">
          <span className="font-mono tabular-nums">
            {done}/{challenges.length}
          </span>
          <span>{open ? "▾" : "▸"}</span>
        </div>
      </button>

      {open && (
        <ul className="space-y-2 border-t border-slate-800 p-3">
          {challenges.map((challenge) => (
            <li key={challenge.id}>
              <Link
                href={`/challenges/${challenge.id}`}
                className="flex items-center justify-between gap-3 rounded-lg border border-slate-800 bg-slate-950/40 px-4 py-3 hover:border-slate-700 hover:bg-slate-800/60"
              >
                <span className="text-sm font-medium text-slate-200">{challenge.title}</span>
                <span className="flex shrink-0 items-center gap-2">
                  <span
                    className={`rounded px-2 py-0.5 text-xs font-medium uppercase ${DIFFICULTY_STYLE[challenge.difficulty]}`}
                  >
                    {challenge.difficulty}
                  </span>
                  <span
                    className={`rounded px-2 py-0.5 text-xs font-medium ${STATUS_STYLE[challenge.status]}`}
                  >
                    {STATUS_LABEL[challenge.status]}
                  </span>
                </span>
              </Link>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

export function ChallengesBrowser({
  phases,
  challenges,
}: {
  phases: Phase[];
  challenges: Challenge[];
}) {
  const [query, setQuery] = useState("");
  const [difficulty, setDifficulty] = useState<ChallengeDifficulty | "all">("all");
  const [status, setStatus] = useState<ConceptStatus | "all">("all");
  const [manuallyOpen, setManuallyOpen] = useState<Set<string>>(() => {
    const firstUnfinishedPhaseId = phases.find((phase) =>
      challenges.some((c) => c.phase_id === phase.id && c.status !== "done"),
    )?.id;
    return new Set(firstUnfinishedPhaseId ? [firstUnfinishedPhaseId] : []);
  });

  const filtersActive = query.trim() !== "" || difficulty !== "all" || status !== "all";

  const normalizedQuery = query.trim().toLowerCase();
  const filtered = useMemo(
    () =>
      challenges.filter((c) => {
        if (difficulty !== "all" && c.difficulty !== difficulty) return false;
        if (status !== "all" && c.status !== status) return false;
        if (normalizedQuery && !c.title.toLowerCase().includes(normalizedQuery)) return false;
        return true;
      }),
    [challenges, difficulty, status, normalizedQuery],
  );

  function toggle(phaseId: string) {
    setManuallyOpen((prev) => {
      const next = new Set(prev);
      if (next.has(phaseId)) next.delete(phaseId);
      else next.add(phaseId);
      return next;
    });
  }

  const groups = phases
    .map((phase) => ({
      phase,
      items: filtered.filter((c) => c.phase_id === phase.id),
    }))
    .filter((g) => g.items.length > 0);

  return (
    <div className="space-y-6">
      <div className="space-y-3 rounded-lg border border-slate-800 bg-slate-900 p-4">
        <input
          type="search"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Search challenges by title..."
          className="w-full rounded-md border border-slate-700 bg-slate-800 px-3 py-2 text-sm text-slate-100 outline-none placeholder:text-slate-500 focus:border-emerald-500"
        />
        <div className="flex flex-wrap items-center gap-x-6 gap-y-2">
          <div className="flex items-center gap-2">
            <span className="text-xs font-semibold uppercase tracking-wide text-slate-500">
              Difficulty
            </span>
            <PillGroup options={DIFFICULTY_OPTIONS} value={difficulty} onChange={setDifficulty} />
          </div>
          <div className="flex items-center gap-2">
            <span className="text-xs font-semibold uppercase tracking-wide text-slate-500">
              Status
            </span>
            <PillGroup options={STATUS_OPTIONS} value={status} onChange={setStatus} />
          </div>
        </div>
      </div>

      <div className="flex items-center justify-between gap-3 text-xs text-slate-500">
        <span>
          {filtersActive
            ? `${filtered.length} of ${challenges.length} challenges match`
            : `${groups.length} phase${groups.length === 1 ? "" : "s"} with challenges`}
        </span>
        {!filtersActive && groups.length > 0 && (
          <div className="flex gap-3">
            <button
              type="button"
              onClick={() => setManuallyOpen(new Set(phases.map((p) => p.id)))}
              className="font-medium text-emerald-400 hover:text-emerald-300"
            >
              Expand all
            </button>
            <button
              type="button"
              onClick={() => setManuallyOpen(new Set())}
              className="font-medium text-emerald-400 hover:text-emerald-300"
            >
              Collapse all
            </button>
          </div>
        )}
      </div>

      <div className="space-y-3">
        {groups.map(({ phase, items }) => (
          <PhaseGroup
            key={phase.id}
            phase={phase}
            challenges={items}
            open={filtersActive || manuallyOpen.has(phase.id)}
            onToggle={() => toggle(phase.id)}
          />
        ))}

        {groups.length === 0 && (
          <p className="rounded-lg border border-slate-800 bg-slate-900 px-4 py-6 text-center text-sm text-slate-400">
            No challenges match your filters.
          </p>
        )}
      </div>
    </div>
  );
}
