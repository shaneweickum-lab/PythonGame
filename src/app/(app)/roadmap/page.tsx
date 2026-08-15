import { createClient } from "@/lib/supabase/server";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { NotConfiguredNotice } from "@/components/NotConfiguredNotice";
import { PhaseCard } from "@/components/PhaseCard";
import type { Concept, Phase, Project } from "@/lib/supabase/types";

type Tier = {
  id: string;
  label: string;
  description: string;
  match: (orderIndex: number) => boolean;
};

const TIERS: Tier[] = [
  {
    id: "beginner",
    label: "Beginner",
    description: "Syntax fluency and the core data structures every script relies on.",
    match: (i) => i >= 1 && i <= 2,
  },
  {
    id: "intermediate",
    label: "Intermediate",
    description: "Object-oriented design, idiomatic Python, engineering discipline, and systems-level thinking.",
    match: (i) => i >= 3 && i <= 6,
  },
  {
    id: "advanced",
    label: "Advanced",
    description: "Domain specialization, the capstone, and a full machine-learning track from NumPy through neural networks.",
    match: (i) => i === 7 || i === 9 || i >= 10,
  },
  {
    id: "algorithms",
    label: "Algorithms",
    description: "Data structures, complexity, and communicating solutions clearly -- interview-ready fundamentals.",
    match: (i) => i === 8,
  },
];

export default async function RoadmapPage() {
  if (!isSupabaseConfigured()) {
    return (
      <div className="space-y-6">
        <div>
          <h1 className="text-2xl font-semibold text-slate-100">Roadmap</h1>
          <p className="mt-1 text-sm text-slate-400">
            Zero to expert, phase by phase. Expand a phase to toggle progress
            on its concepts and projects.
          </p>
        </div>
        <NotConfiguredNotice />
      </div>
    );
  }

  const supabase = await createClient();

  const [{ data: phases }, { data: concepts }, { data: projects }] =
    await Promise.all([
      supabase.from("phases").select("*").order("order_index"),
      supabase.from("concepts").select("*").order("order_index"),
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
        <>
          <nav className="flex flex-wrap gap-2 text-xs">
            {TIERS.map((tier) => (
              <a
                key={tier.id}
                href={`#${tier.id}`}
                className="rounded-full border border-slate-800 bg-slate-900 px-3 py-1 font-medium text-slate-300 hover:border-slate-700 hover:text-white"
              >
                {tier.label}
              </a>
            ))}
          </nav>

          <div className="space-y-10">
            {TIERS.map((tier) => {
              const tierPhases = typedPhases.filter((p) => tier.match(p.order_index));
              if (tierPhases.length === 0) return null;

              return (
                <section key={tier.id} id={tier.id} className="scroll-mt-4 space-y-3">
                  <div>
                    <h2 className="text-sm font-semibold text-slate-100">{tier.label}</h2>
                    <p className="mt-0.5 text-xs text-slate-500">{tier.description}</p>
                  </div>
                  <div className="space-y-3">
                    {tierPhases.map((phase) => (
                      <PhaseCard
                        key={phase.id}
                        phase={phase}
                        concepts={typedConcepts.filter((c) => c.phase_id === phase.id)}
                        projects={typedProjects.filter((p) => p.phase_id === phase.id)}
                      />
                    ))}
                  </div>
                </section>
              );
            })}
          </div>
        </>
      )}
    </div>
  );
}
