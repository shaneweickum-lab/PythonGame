import { createClient } from "@/lib/supabase/server";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { NotConfiguredNotice } from "@/components/NotConfiguredNotice";
import { LevelCard } from "@/components/LevelCard";
import { StreakCard } from "@/components/StreakCard";
import { BadgeGrid } from "@/components/BadgeGrid";
import { computeGamification } from "@/lib/gamification";
import type { Challenge, Concept, JournalEntry, Phase, Project } from "@/lib/supabase/types";

export default async function AchievementsPage() {
  if (!isSupabaseConfigured()) {
    return (
      <div className="space-y-6">
        <div>
          <h1 className="text-2xl font-semibold text-slate-100">Achievements</h1>
          <p className="mt-1 text-sm text-slate-400">
            Your level, streak, and earned badges.
          </p>
        </div>
        <NotConfiguredNotice />
      </div>
    );
  }

  const supabase = await createClient();

  const [{ data: phases }, { data: concepts }, { data: projects }, { data: challenges }, { data: journalEntries }] =
    await Promise.all([
      supabase.from("phases").select("*").order("order_index"),
      supabase.from("concepts").select("*"),
      supabase.from("projects").select("*"),
      supabase.from("challenges").select("*"),
      supabase.from("journal_entries").select("*"),
    ]);

  const { xp, level, streak, badges } = computeGamification({
    phases: (phases ?? []) as Phase[],
    concepts: (concepts ?? []) as Concept[],
    projects: (projects ?? []) as Project[],
    challenges: (challenges ?? []) as Challenge[],
    journalEntries: (journalEntries ?? []) as JournalEntry[],
  });

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-2xl font-semibold text-slate-100">Achievements</h1>
        <p className="mt-1 text-sm text-slate-400">
          Your level, streak, and earned badges.
        </p>
      </div>

      <div className="grid gap-4 sm:grid-cols-2">
        <section className="rounded-lg border border-slate-800 bg-slate-900 p-5">
          <LevelCard level={level} />
        </section>
        <section className="rounded-lg border border-slate-800 bg-slate-900 p-5">
          <StreakCard streak={streak} />
        </section>
      </div>

      <section className="rounded-lg border border-slate-800 bg-slate-900 p-5">
        <h2 className="mb-3 text-xs font-semibold uppercase tracking-wide text-slate-500">
          XP breakdown
        </h2>
        <div className="grid grid-cols-3 gap-4 text-center">
          <div>
            <div className="text-xl font-semibold text-slate-100">{xp.concepts.toLocaleString()}</div>
            <div className="mt-0.5 text-xs text-slate-500">from concepts</div>
          </div>
          <div>
            <div className="text-xl font-semibold text-slate-100">{xp.projects.toLocaleString()}</div>
            <div className="mt-0.5 text-xs text-slate-500">from projects</div>
          </div>
          <div>
            <div className="text-xl font-semibold text-slate-100">{xp.challenges.toLocaleString()}</div>
            <div className="mt-0.5 text-xs text-slate-500">from challenges</div>
          </div>
        </div>
      </section>

      <section className="rounded-lg border border-slate-800 bg-slate-900 p-5">
        <BadgeGrid badges={badges} />
      </section>
    </div>
  );
}
