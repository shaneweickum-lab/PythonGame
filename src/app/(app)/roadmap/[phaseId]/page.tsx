import Link from "next/link";
import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { NotConfiguredNotice } from "@/components/NotConfiguredNotice";
import { StatusToggle } from "@/components/StatusToggle";
import { ProgressBar } from "@/components/ProgressBar";
import { JournalEntryForm } from "@/components/JournalEntryForm";
import { JournalEntryList } from "@/components/JournalEntryList";
import type { Challenge, Concept, Phase, Project } from "@/lib/supabase/types";

const CHALLENGE_STATUS_LABEL: Record<Challenge["status"], string> = {
  not_started: "Not started",
  in_progress: "In progress",
  done: "Solved",
};

export default async function PhaseDetailPage({
  params,
}: PageProps<"/roadmap/[phaseId]">) {
  if (!isSupabaseConfigured()) {
    return (
      <div className="space-y-6">
        <Link href="/roadmap" className="text-xs text-slate-500 hover:text-slate-300">
          ← Back to roadmap
        </Link>
        <NotConfiguredNotice />
      </div>
    );
  }

  const { phaseId } = await params;
  const supabase = await createClient();

  const [
    { data: phase },
    { data: concepts },
    { data: projects },
    { data: challenges },
    { data: journalEntries },
  ] = await Promise.all([
    supabase.from("phases").select("*").eq("id", phaseId).single(),
    supabase.from("concepts").select("*").eq("phase_id", phaseId).order("order_index"),
    supabase.from("projects").select("*").eq("phase_id", phaseId).order("project_type"),
    supabase.from("challenges").select("*").eq("phase_id", phaseId).order("order_index"),
    supabase
      .from("journal_entries")
      .select("*")
      .eq("phase_id", phaseId)
      .order("created_at", { ascending: false }),
  ]);

  if (!phase) {
    notFound();
  }

  const typedPhase = phase as Phase;
  const typedConcepts = (concepts ?? []) as Concept[];
  const typedProjects = (projects ?? []) as Project[];
  const typedChallenges = (challenges ?? []) as Challenge[];
  const items = [...typedConcepts, ...typedProjects, ...typedChallenges];
  const done = items.filter((i) => i.status === "done").length;

  const microByConcept = new Map(
    typedProjects.filter((p) => p.project_type === "micro").map((p) => [p.concept_id, p]),
  );
  const integrativeProjects = typedProjects.filter((p) => p.project_type !== "micro");

  return (
    <div className="space-y-8">
      <div>
        <Link href="/roadmap" className="text-xs text-slate-500 hover:text-slate-300">
          ← Back to roadmap
        </Link>
        <div className="mt-2 flex items-start justify-between gap-4">
          <div>
            <h1 className="text-2xl font-semibold text-slate-100">
              Phase {typedPhase.order_index}: {typedPhase.title}
            </h1>
            {typedPhase.summary && (
              <p className="mt-1 max-w-2xl text-sm text-slate-400">
                {typedPhase.summary}
              </p>
            )}
          </div>
        </div>
        <ProgressBar done={done} total={items.length} className="mt-4 max-w-md" />
      </div>

      <section>
        <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-slate-500">
          Concepts &amp; Micro-Projects
        </h2>
        <ul className="space-y-2">
          {typedConcepts.map((c) => {
            const micro = microByConcept.get(c.id);
            return (
              <li
                key={c.id}
                className="rounded-md border border-slate-800 bg-slate-900 px-3 py-2"
              >
                <div className="flex items-center justify-between gap-3">
                  <span className="text-sm text-slate-200">{c.title}</span>
                  <StatusToggle table="concepts" id={c.id} status={c.status} />
                </div>
                {micro && (
                  <div className="mt-2 flex items-center justify-between gap-3 rounded-md border border-slate-800 bg-slate-950/60 px-3 py-2">
                    <div>
                      <span className="text-xs font-medium text-slate-300">
                        🔧 {micro.title}
                      </span>
                      {micro.description && (
                        <p className="mt-0.5 text-xs text-slate-500">{micro.description}</p>
                      )}
                    </div>
                    <StatusToggle table="projects" id={micro.id} status={micro.status} />
                  </div>
                )}
              </li>
            );
          })}
          {typedConcepts.length === 0 && (
            <li className="text-sm text-slate-500">No concepts for this phase.</li>
          )}
        </ul>
      </section>

      <section>
        <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-slate-500">
          Mini-Project & Spine Milestone
        </h2>
        <ul className="space-y-2">
          {integrativeProjects.map((p) => (
            <li
              key={p.id}
              className="rounded-md border border-slate-800 bg-slate-900 px-3 py-3"
            >
              <div className="flex items-center justify-between gap-3">
                <div>
                  <span className="text-sm font-medium text-slate-200">{p.title}</span>
                  <span className="ml-2 rounded bg-slate-800 px-1.5 py-0.5 text-[10px] uppercase tracking-wide text-slate-400">
                    {p.project_type}
                  </span>
                </div>
                <StatusToggle table="projects" id={p.id} status={p.status} />
              </div>
              {p.description && (
                <p className="mt-1 text-xs text-slate-500">{p.description}</p>
              )}
              {p.project_type === "spine" && (
                <Link
                  href="/spine"
                  className="mt-2 inline-block text-xs text-emerald-400 hover:text-emerald-300"
                >
                  View in Spine Project log →
                </Link>
              )}
            </li>
          ))}
          {integrativeProjects.length === 0 && (
            <li className="text-sm text-slate-500">No projects for this phase.</li>
          )}
        </ul>
      </section>

      <section>
        <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-slate-500">
          Coding Challenges
        </h2>
        <ul className="space-y-2">
          {typedChallenges.map((challenge) => (
            <li key={challenge.id}>
              <Link
                href={`/challenges/${challenge.id}`}
                className="flex items-center justify-between gap-3 rounded-md border border-slate-800 bg-slate-900 px-3 py-2 hover:border-slate-700 hover:bg-slate-800/60"
              >
                <span className="text-sm text-slate-200">{challenge.title}</span>
                <span className="text-xs text-slate-500">
                  {CHALLENGE_STATUS_LABEL[challenge.status]}
                </span>
              </Link>
            </li>
          ))}
          {typedChallenges.length === 0 && (
            <li className="text-sm text-slate-500">No challenges for this phase.</li>
          )}
        </ul>
      </section>

      <section>
        <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-slate-500">
          Journal
        </h2>
        <div className="mb-4">
          <JournalEntryForm phaseId={typedPhase.id} />
        </div>
        <JournalEntryList entries={journalEntries ?? []} />
      </section>
    </div>
  );
}
