import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { NotConfiguredNotice } from "@/components/NotConfiguredNotice";
import { ProgressBar } from "@/components/ProgressBar";
import type { Concept, Phase, Project } from "@/lib/supabase/types";

type UnfinishedItem = {
  kind: "concept" | "project";
  id: string;
  title: string;
  phaseId: string;
  phaseTitle: string;
  phaseOrder: number;
};

export default async function DashboardPage() {
  if (!isSupabaseConfigured()) {
    return (
      <div className="space-y-8">
        <div>
          <h1 className="text-2xl font-semibold text-slate-100">Dashboard</h1>
          <p className="mt-1 text-sm text-slate-400">
            Your progress through the Python zero-to-expert roadmap.
          </p>
        </div>
        <NotConfiguredNotice />
      </div>
    );
  }

  const supabase = await createClient();

  const [{ data: phases }, { data: concepts }, { data: projects }, { count: dueCount }] =
    await Promise.all([
      supabase.from("phases").select("*").order("order_index"),
      supabase.from("concepts").select("*"),
      supabase.from("projects").select("*"),
      supabase
        .from("flashcards")
        .select("*", { count: "exact", head: true })
        .lte("next_review_at", new Date().toISOString()),
    ]);

  const typedPhases = (phases ?? []) as Phase[];
  const typedConcepts = (concepts ?? []) as Concept[];
  const typedProjects = (projects ?? []) as Project[];

  const totalItems = typedConcepts.length + typedProjects.length;
  const doneItems =
    typedConcepts.filter((c) => c.status === "done").length +
    typedProjects.filter((p) => p.status === "done").length;

  const phaseById = new Map(typedPhases.map((p) => [p.id, p]));

  const unfinished: UnfinishedItem[] = [
    ...typedConcepts.map((c) => ({
      kind: "concept" as const,
      id: c.id,
      title: c.title,
      phaseId: c.phase_id,
      phaseTitle: phaseById.get(c.phase_id)?.title ?? "",
      phaseOrder: phaseById.get(c.phase_id)?.order_index ?? Infinity,
      status: c.status,
      titleSort: c.title,
      typeSort: 0,
    })),
    ...typedProjects.map((p) => ({
      kind: "project" as const,
      id: p.id,
      title: p.title,
      phaseId: p.phase_id,
      phaseTitle: phaseById.get(p.phase_id)?.title ?? "",
      phaseOrder: phaseById.get(p.phase_id)?.order_index ?? Infinity,
      status: p.status,
      titleSort: p.title,
      typeSort: 1,
    })),
  ]
    .filter((item) => item.status !== "done")
    .sort((a, b) => {
      if (a.phaseOrder !== b.phaseOrder) return a.phaseOrder - b.phaseOrder;
      if (a.typeSort !== b.typeSort) return a.typeSort - b.typeSort;
      return a.titleSort.localeCompare(b.titleSort);
    });

  const nextItem = unfinished[0];

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-2xl font-semibold text-slate-100">Dashboard</h1>
        <p className="mt-1 text-sm text-slate-400">
          Your progress through the Python zero-to-expert roadmap.
        </p>
      </div>

      <section className="rounded-lg border border-slate-800 bg-slate-900 p-5">
        <h2 className="text-xs font-semibold uppercase tracking-wide text-slate-500">
          Overall progress
        </h2>
        <ProgressBar done={doneItems} total={totalItems} className="mt-3" />
      </section>

      <div className="grid gap-4 sm:grid-cols-2">
        <section className="rounded-lg border border-slate-800 bg-slate-900 p-5">
          <h2 className="text-xs font-semibold uppercase tracking-wide text-slate-500">
            Next unfinished item
          </h2>
          {nextItem ? (
            <div className="mt-3">
              <div className="text-sm text-slate-500">
                Phase {nextItem.phaseOrder} · {nextItem.phaseTitle} ·{" "}
                {nextItem.kind === "concept" ? "Concept" : "Project"}
              </div>
              <div className="mt-1 text-lg font-medium text-slate-100">
                {nextItem.title}
              </div>
              <Link
                href={`/roadmap/${nextItem.phaseId}`}
                className="mt-3 inline-block text-sm font-medium text-emerald-400 hover:text-emerald-300"
              >
                Go to phase →
              </Link>
            </div>
          ) : (
            <p className="mt-3 text-sm text-slate-400">
              Everything is marked done. 🎉
            </p>
          )}
        </section>

        <section className="rounded-lg border border-slate-800 bg-slate-900 p-5">
          <h2 className="text-xs font-semibold uppercase tracking-wide text-slate-500">
            Flashcards due
          </h2>
          <div className="mt-3 text-3xl font-semibold text-slate-100">
            {dueCount ?? 0}
          </div>
          <Link
            href="/review"
            className="mt-3 inline-block text-sm font-medium text-emerald-400 hover:text-emerald-300"
          >
            {dueCount && dueCount > 0 ? "Start review →" : "Go to review →"}
          </Link>
        </section>
      </div>

      <section>
        <h2 className="mb-3 text-xs font-semibold uppercase tracking-wide text-slate-500">
          Quick links
        </h2>
        <div className="grid gap-3 sm:grid-cols-3">
          {[
            { href: "/playground", label: "Playground", desc: "Run Python in the browser" },
            { href: "/spine", label: "Spine Project", desc: "One project, every phase" },
            { href: "/journal", label: "Journal", desc: "All reflections in one place" },
          ].map((link) => (
            <Link
              key={link.href}
              href={link.href}
              className="rounded-lg border border-slate-800 bg-slate-900 p-4 hover:border-slate-700 hover:bg-slate-800/60"
            >
              <div className="text-sm font-medium text-slate-100">{link.label}</div>
              <div className="mt-1 text-xs text-slate-500">{link.desc}</div>
            </Link>
          ))}
        </div>
      </section>
    </div>
  );
}
