"use client";

import { useState } from "react";
import Link from "next/link";
import { StatusToggle } from "@/components/StatusToggle";
import { ProgressBar } from "@/components/ProgressBar";
import type { Concept, Phase, Project } from "@/lib/supabase/types";

export function PhaseCard({
  phase,
  concepts,
  projects,
  defaultOpen = false,
}: {
  phase: Phase;
  concepts: Concept[];
  projects: Project[];
  defaultOpen?: boolean;
}) {
  const [open, setOpen] = useState(defaultOpen);

  const items = [...concepts, ...projects];
  const done = items.filter((i) => i.status === "done").length;
  const total = items.length;

  return (
    <div className="rounded-lg border border-slate-800 bg-slate-900">
      <button
        type="button"
        onClick={() => setOpen((o) => !o)}
        className="flex w-full items-center justify-between gap-4 px-4 py-3 text-left"
      >
        <div className="flex items-center gap-3">
          <span className="text-xs font-mono text-slate-500">
            {String(phase.order_index).padStart(2, "0")}
          </span>
          <div>
            <div className="font-medium text-slate-100">{phase.title}</div>
            {phase.summary && (
              <div className="mt-0.5 max-w-2xl text-xs text-slate-500">
                {phase.summary}
              </div>
            )}
          </div>
        </div>
        <div className="flex shrink-0 items-center gap-4">
          <ProgressBar done={done} total={total} className="w-40" />
          <span className="text-slate-500">{open ? "▾" : "▸"}</span>
        </div>
      </button>

      {open && (
        <div className="border-t border-slate-800 px-4 py-4 space-y-5">
          <div>
            <h3 className="mb-2 text-xs font-semibold uppercase tracking-wide text-slate-500">
              Concepts
            </h3>
            <ul className="space-y-1.5">
              {concepts.map((c) => (
                <li
                  key={c.id}
                  className="flex items-center justify-between gap-3 rounded-md px-2 py-1 hover:bg-slate-800/50"
                >
                  <span className="text-sm text-slate-200">{c.title}</span>
                  <StatusToggle table="concepts" id={c.id} status={c.status} />
                </li>
              ))}
              {concepts.length === 0 && (
                <li className="text-sm text-slate-500">No concepts yet.</li>
              )}
            </ul>
          </div>

          <div>
            <h3 className="mb-2 text-xs font-semibold uppercase tracking-wide text-slate-500">
              Projects
            </h3>
            <ul className="space-y-1.5">
              {projects.map((p) => (
                <li
                  key={p.id}
                  className="flex items-center justify-between gap-3 rounded-md px-2 py-1 hover:bg-slate-800/50"
                >
                  <div>
                    <span className="text-sm text-slate-200">{p.title}</span>
                    <span className="ml-2 rounded bg-slate-800 px-1.5 py-0.5 text-[10px] uppercase tracking-wide text-slate-400">
                      {p.project_type}
                    </span>
                  </div>
                  <StatusToggle table="projects" id={p.id} status={p.status} />
                </li>
              ))}
              {projects.length === 0 && (
                <li className="text-sm text-slate-500">No projects yet.</li>
              )}
            </ul>
          </div>

          <Link
            href={`/roadmap/${phase.id}`}
            className="inline-block text-xs font-medium text-emerald-400 hover:text-emerald-300"
          >
            View phase detail & journal →
          </Link>
        </div>
      )}
    </div>
  );
}
