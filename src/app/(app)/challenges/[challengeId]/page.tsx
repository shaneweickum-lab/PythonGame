import Link from "next/link";
import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { NotConfiguredNotice } from "@/components/NotConfiguredNotice";
import { ChallengeRunner } from "@/components/ChallengeRunner";
import { CHALLENGE_CONTENT_COLUMNS, mergeChallenges } from "@/lib/progress";
import type { ChallengeContent, ChallengeProgress, Phase } from "@/lib/supabase/types";

export default async function ChallengeDetailPage({
  params,
}: PageProps<"/challenges/[challengeId]">) {
  if (!isSupabaseConfigured()) {
    return (
      <div className="space-y-6">
        <Link href="/challenges" className="text-xs text-slate-500 hover:text-slate-300">
          ← Back to challenges
        </Link>
        <NotConfiguredNotice />
      </div>
    );
  }

  const { challengeId } = await params;
  const supabase = await createClient();

  const [{ data: challenge }, { data: challengeProgress }] = await Promise.all([
    supabase.from("challenges").select(CHALLENGE_CONTENT_COLUMNS).eq("id", challengeId).single(),
    supabase.from("challenge_progress").select("*").eq("challenge_id", challengeId),
  ]);

  if (!challenge) {
    notFound();
  }

  const typedChallenge = mergeChallenges(
    [challenge as ChallengeContent],
    (challengeProgress ?? []) as ChallengeProgress[],
  )[0];

  let phase: Phase | null = null;
  if (typedChallenge.phase_id) {
    const { data } = await supabase
      .from("phases")
      .select("*")
      .eq("id", typedChallenge.phase_id)
      .single();
    phase = (data as Phase) ?? null;
  }

  return (
    <div className="space-y-6">
      <div>
        <Link href="/challenges" className="text-xs text-slate-500 hover:text-slate-300">
          ← Back to challenges
        </Link>
        <h1 className="mt-2 text-2xl font-semibold text-slate-100">{typedChallenge.title}</h1>
        {phase && (
          <p className="mt-1 text-sm text-slate-400">
            Phase {phase.order_index}: {phase.title}
          </p>
        )}
      </div>

      <ChallengeRunner challenge={typedChallenge} />
    </div>
  );
}
