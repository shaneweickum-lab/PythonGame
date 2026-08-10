import { createClient } from "@/lib/supabase/server";
import { PhaseCard } from "@/components/PhaseCard";
import type { Concept, Phase, Project } from "@/lib/supabase/types";

export default async function RoadmapPage() {
  const supabase = await createClient();

  const [{ data: phases }, { data: concepts }, { data: projects }] =
    await Promise.all([
      supabase.from("phases").select("*").order("order_index"),
      supabase.from("concepts").select("*").order("title"),
      supabase.from("projects").select("*").order("title"),
    ]);

  const typedPhases = (phases ?? []) as Phase[];
  const typedConcepts = (concepts ?? []) as Concept[];
  const typedProjects = (projects ?? []) as Project[];

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold text-slate-100">Roadmap</h1>
        <p className="mt-1 text-sm text-slate-400">
          Zero to expert, phase by phase. Expand a phase to toggle progress on
          its concepts and projects.
        </p>
      </div>

      {typedPhases.length === 0 ? (
        <p className="rounded-lg border border-slate-800 bg-slate-900 px-4 py-6 text-sm text-slate-400">
          No phases yet. Run the seed script against your Supabase project to
          load the roadmap.
        </p>
      ) : (
        <div className="space-y-3">
          {typedPhases.map((phase) => (
            <PhaseCard
              key={phase.id}
              phase={phase}
              concepts={typedConcepts.filter((c) => c.phase_id === phase.id)}
              projects={typedProjects.filter((p) => p.phase_id === phase.id)}
            />
          ))}
        </div>
      )}
    </div>
  );
}
