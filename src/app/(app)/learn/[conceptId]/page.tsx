import Link from "next/link";
import { notFound } from "next/navigation";
import { createClient } from "@/lib/supabase/server";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { NotConfiguredNotice } from "@/components/NotConfiguredNotice";
import { StatusToggle } from "@/components/StatusToggle";
import { MarkdownLite } from "@/components/MarkdownLite";
import { LessonPlayground } from "@/components/LessonPlayground";
import { ChallengeRunner } from "@/components/ChallengeRunner";
import type { Challenge, Concept, Phase, Project } from "@/lib/supabase/types";

const FALLBACK_STARTER = "# Try some Python here\n";

function firstCodeExample(lessonContent: string | null): string {
  if (!lessonContent) return FALLBACK_STARTER;
  const match = lessonContent.match(/```\w*\n([\s\S]*?)```/);
  return match ? match[1].replace(/\n$/, "") + "\n" : FALLBACK_STARTER;
}

export default async function LearnConceptPage({
  params,
}: PageProps<"/learn/[conceptId]">) {
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

  const { conceptId } = await params;
  const supabase = await createClient();

  const { data: concept } = await supabase
    .from("concepts")
    .select("*")
    .eq("id", conceptId)
    .single();

  if (!concept) {
    notFound();
  }

  const typedConcept = concept as Concept;

  const [{ data: phase }, { data: microProject }, { data: challenges }] = await Promise.all([
    supabase.from("phases").select("*").eq("id", typedConcept.phase_id).single(),
    supabase
      .from("projects")
      .select("*")
      .eq("concept_id", typedConcept.id)
      .eq("project_type", "micro")
      .maybeSingle(),
    supabase
      .from("challenges")
      .select("*")
      .eq("concept_id", typedConcept.id)
      .order("order_index"),
  ]);

  const typedPhase = phase as Phase | null;
  const typedMicroProject = microProject as Project | null;
  const typedChallenges = (challenges ?? []) as Challenge[];

  return (
    <div className="space-y-8">
      <div>
        <Link
          href={typedPhase ? `/roadmap/${typedPhase.id}` : "/roadmap"}
          className="text-xs text-slate-500 hover:text-slate-300"
        >
          ← Back to {typedPhase ? `Phase ${typedPhase.order_index}: ${typedPhase.title}` : "roadmap"}
        </Link>
        <div className="mt-2 flex items-center justify-between gap-4">
          <h1 className="text-2xl font-semibold text-slate-100">{typedConcept.title}</h1>
          <StatusToggle table="concepts" id={typedConcept.id} status={typedConcept.status} />
        </div>
      </div>

      <section>
        {typedConcept.lesson_content ? (
          <MarkdownLite content={typedConcept.lesson_content} />
        ) : (
          <p className="text-sm text-slate-400">Lesson content coming soon.</p>
        )}
      </section>

      <section>
        <LessonPlayground starterCode={firstCodeExample(typedConcept.lesson_content)} />
      </section>

      {typedMicroProject && (
        <section>
          <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-slate-500">
            Micro-Project
          </h2>
          <div className="rounded-lg border border-slate-800 bg-slate-900 px-4 py-3">
            <div className="flex items-center justify-between gap-3">
              <span className="text-sm font-medium text-slate-200">
                🔧 {typedMicroProject.title}
              </span>
              <StatusToggle
                table="projects"
                id={typedMicroProject.id}
                status={typedMicroProject.status}
              />
            </div>
            {typedMicroProject.description && (
              <p className="mt-1 text-xs text-slate-500">{typedMicroProject.description}</p>
            )}
          </div>
        </section>
      )}

      {typedChallenges.length > 0 && (
        <section>
          <h2 className="mb-3 text-sm font-semibold uppercase tracking-wide text-slate-500">
            Solidify It -- {typedChallenges.length} Challenges
          </h2>
          <div className="space-y-8">
            {typedChallenges.map((challenge, i) => (
              <div key={challenge.id}>
                <div className="mb-2 text-xs font-mono text-slate-500">
                  Challenge {i + 1} of {typedChallenges.length}
                </div>
                <ChallengeRunner challenge={challenge} />
              </div>
            ))}
          </div>
        </section>
      )}
    </div>
  );
}
