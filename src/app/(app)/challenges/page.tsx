import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { NotConfiguredNotice } from "@/components/NotConfiguredNotice";
import { ProgressBar } from "@/components/ProgressBar";
import type { Challenge, Phase } from "@/lib/supabase/types";

const DIFFICULTY_STYLE: Record<Challenge["difficulty"], string> = {
  easy: "bg-emerald-500/10 text-emerald-400",
  medium: "bg-amber-500/10 text-amber-400",
  hard: "bg-red-500/10 text-red-400",
};

const STATUS_STYLE: Record<Challenge["status"], string> = {
  not_started: "bg-slate-800 text-slate-400",
  in_progress: "bg-amber-500/10 text-amber-400",
  done: "bg-emerald-500/10 text-emerald-400",
};

const STATUS_LABEL: Record<Challenge["status"], string> = {
  not_started: "Not started",
  in_progress: "In progress",
  done: "Solved",
};

export default async function ChallengesPage() {
  if (!isSupabaseConfigured()) {
    return (
      <div className="space-y-6">
        <div>
          <h1 className="text-2xl font-semibold text-slate-100">Challenges</h1>
          <p className="mt-1 text-sm text-slate-400">
            Auto-graded coding exercises, tied to each phase of the roadmap.
          </p>
        </div>
        <NotConfiguredNotice />
      </div>
    );
  }

  const supabase = await createClient();
  const [{ data: phases }, { data: challenges }] = await Promise.all([
    supabase.from("phases").select("*").order("order_index"),
    supabase.from("challenges").select("*").order("order_index"),
  ]);

  const typedPhases = (phases ?? []) as Phase[];
  const typedChallenges = (challenges ?? []) as Challenge[];
  const done = typedChallenges.filter((c) => c.status === "done").length;

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold text-slate-100">Challenges</h1>
        <p className="mt-1 text-sm text-slate-400">
          Auto-graded coding exercises, tied to each phase of the roadmap.
          Solve them right in the browser -- tests run automatically.
        </p>
      </div>

      <ProgressBar done={done} total={typedChallenges.length} className="max-w-md" />

      <div className="space-y-6">
        {typedPhases.map((phase) => {
          const phaseChallenges = typedChallenges.filter((c) => c.phase_id === phase.id);
          if (phaseChallenges.length === 0) return null;

          return (
            <div key={phase.id}>
              <h2 className="mb-2 text-xs font-semibold uppercase tracking-wide text-slate-500">
                Phase {phase.order_index}: {phase.title}
              </h2>
              <ul className="space-y-2">
                {phaseChallenges.map((challenge) => (
                  <li key={challenge.id}>
                    <Link
                      href={`/challenges/${challenge.id}`}
                      className="flex items-center justify-between gap-3 rounded-lg border border-slate-800 bg-slate-900 px-4 py-3 hover:border-slate-700 hover:bg-slate-800/60"
                    >
                      <span className="text-sm font-medium text-slate-200">
                        {challenge.title}
                      </span>
                      <span className="flex items-center gap-2">
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
            </div>
          );
        })}

        {typedChallenges.length === 0 && (
          <p className="rounded-lg border border-slate-800 bg-slate-900 px-4 py-6 text-sm text-slate-400">
            No challenges yet. Run supabase/seed_challenges.sql against your
            Supabase project to load them.
          </p>
        )}
      </div>
    </div>
  );
}
