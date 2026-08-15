import { createClient } from "@/lib/supabase/server";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { NotConfiguredNotice } from "@/components/NotConfiguredNotice";
import { ProgressBar } from "@/components/ProgressBar";
import { ChallengesBrowser } from "@/components/ChallengesBrowser";
import type { Challenge, Phase } from "@/lib/supabase/types";

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

      {typedChallenges.length === 0 ? (
        <p className="rounded-lg border border-slate-800 bg-slate-900 px-4 py-6 text-sm text-slate-400">
          No challenges yet. Run supabase/seed_challenges.sql against your
          Supabase project to load them.
        </p>
      ) : (
        <ChallengesBrowser phases={typedPhases} challenges={typedChallenges} />
      )}
    </div>
  );
}
