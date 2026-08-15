import { createClient } from "@/lib/supabase/server";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { NotConfiguredNotice } from "@/components/NotConfiguredNotice";
import { ProgressBar } from "@/components/ProgressBar";
import { PROJECT_CONTENT_COLUMNS, mergeProjects } from "@/lib/progress";
import type { Phase, Project, ProjectContent, ProjectProgress } from "@/lib/supabase/types";

const STATUS_LABEL: Record<Project["status"], string> = {
  not_started: "Not started",
  in_progress: "In progress",
  done: "Done",
};

const STATUS_STYLE: Record<Project["status"], string> = {
  not_started: "bg-slate-800 text-slate-400",
  in_progress: "bg-amber-500/10 text-amber-400",
  done: "bg-emerald-500/10 text-emerald-400",
};

export default async function SpinePage() {
  if (!isSupabaseConfigured()) {
    return (
      <div className="space-y-6">
        <div>
          <h1 className="text-2xl font-semibold text-slate-100">Spine Project</h1>
          <p className="mt-1 text-sm text-slate-400">
            One growing project, tracked across every phase of the roadmap.
          </p>
        </div>
        <NotConfiguredNotice />
      </div>
    );
  }

  const supabase = await createClient();

  const [{ data: phases }, { data: spineProjects }, { data: projectProgress }] = await Promise.all([
    supabase.from("phases").select("*").order("order_index"),
    supabase
      .from("projects")
      .select(PROJECT_CONTENT_COLUMNS)
      .eq("project_type", "spine")
      .order("phase_id"),
    supabase.from("project_progress").select("*"),
  ]);

  const typedPhases = (phases ?? []) as Phase[];
  const typedProjects = mergeProjects(
    (spineProjects ?? []) as ProjectContent[],
    (projectProgress ?? []) as ProjectProgress[],
  );
  const projectByPhase = new Map(typedProjects.map((p) => [p.phase_id, p]));

  const orderedEntries = typedPhases
    .map((phase) => ({ phase, project: projectByPhase.get(phase.id) }))
    .filter((entry) => entry.project);

  const done = orderedEntries.filter((e) => e.project!.status === "done").length;

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold text-slate-100">Spine Project</h1>
        <p className="mt-1 text-sm text-slate-400">
          One growing project, tracked across every phase of the roadmap.
          Read-only -- update status and code from the phase pages or the
          playground.
        </p>
      </div>

      <ProgressBar done={done} total={orderedEntries.length} className="max-w-md" />

      <ol className="relative space-y-4 border-l border-slate-800 pl-6">
        {orderedEntries.map(({ phase, project }) => (
          <li key={project!.id} className="relative">
            <span
              className={`absolute -left-[29px] top-1.5 h-3 w-3 rounded-full border-2 border-slate-950 ${
                project!.status === "done" ? "bg-emerald-500" : "bg-slate-600"
              }`}
            />
            <div className="rounded-lg border border-slate-800 bg-slate-900 p-4">
              <div className="flex flex-wrap items-center justify-between gap-2">
                <div className="text-xs font-mono text-slate-500">
                  Phase {phase.order_index} · {phase.title}
                </div>
                <span
                  className={`rounded px-2 py-0.5 text-xs font-medium ${STATUS_STYLE[project!.status]}`}
                >
                  {STATUS_LABEL[project!.status]}
                </span>
              </div>
              <div className="mt-1 text-base font-medium text-slate-100">
                {project!.title}
              </div>
              {project!.description && (
                <p className="mt-1 text-sm text-slate-400">{project!.description}</p>
              )}
              {project!.notes && (
                <p className="mt-2 text-sm italic text-slate-500">{project!.notes}</p>
              )}
              {project!.code_snapshot && (
                <details className="mt-3">
                  <summary className="cursor-pointer text-xs font-medium text-emerald-400 hover:text-emerald-300">
                    View saved code
                  </summary>
                  <pre className="mt-2 max-h-64 overflow-auto rounded-md border border-slate-800 bg-black p-3 font-mono text-xs whitespace-pre-wrap text-slate-200">
                    {project!.code_snapshot}
                  </pre>
                </details>
              )}
            </div>
          </li>
        ))}

        {orderedEntries.length === 0 && (
          <p className="rounded-lg border border-slate-800 bg-slate-900 px-4 py-6 text-sm text-slate-400">
            No spine milestones yet. Seed the roadmap to populate this view.
          </p>
        )}
      </ol>
    </div>
  );
}
