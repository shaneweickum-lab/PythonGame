import Link from "next/link";
import { createClient } from "@/lib/supabase/server";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { NotConfiguredNotice } from "@/components/NotConfiguredNotice";
import { StatusToggle } from "@/components/StatusToggle";
import { ProgressBar } from "@/components/ProgressBar";
import type { Concept, Phase } from "@/lib/supabase/types";

export default async function FoundationsPage() {
  if (!isSupabaseConfigured()) {
    return (
      <div className="space-y-6">
        <div>
          <h1 className="text-2xl font-semibold text-slate-100">Foundations</h1>
          <p className="mt-1 text-sm text-slate-400">
            Never written a line of code before? Start here.
          </p>
        </div>
        <NotConfiguredNotice />
      </div>
    );
  }

  const supabase = await createClient();

  const { data: firstPhase } = await supabase
    .from("phases")
    .select("*")
    .order("order_index")
    .limit(1)
    .maybeSingle();

  const typedPhase = firstPhase as Phase | null;

  if (!typedPhase) {
    return (
      <div className="space-y-6">
        <h1 className="text-2xl font-semibold text-slate-100">Foundations</h1>
        <p className="text-sm text-slate-400">
          No roadmap data yet -- run the seed files described in the README.
        </p>
      </div>
    );
  }

  const { data: concepts } = await supabase
    .from("concepts")
    .select("*")
    .eq("phase_id", typedPhase.id)
    .order("order_index");

  const typedConcepts = (concepts ?? []) as Concept[];
  const done = typedConcepts.filter((c) => c.status === "done").length;
  const allDone = typedConcepts.length > 0 && done === typedConcepts.length;

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-2xl font-semibold text-slate-100">Foundations</h1>
        <p className="mt-1 max-w-2xl text-sm text-slate-400">
          Never written a line of code before? Start here. These {typedConcepts.length} short
          lessons walk through Python&apos;s core syntax one idea at a time -- variables, printing,
          numbers, strings, conditionals, loops, functions, and error handling -- in the order
          they build on each other. Each one teaches a single concept, gives you a playground to
          try it yourself, and finishes with a few small challenges to lock it in. No prior
          programming experience assumed.
        </p>
      </div>

      <section className="rounded-lg border border-slate-800 bg-slate-900 p-5">
        <div className="flex items-center justify-between gap-3">
          <h2 className="text-xs font-semibold uppercase tracking-wide text-slate-500">
            Your progress
          </h2>
          {allDone && (
            <Link
              href="/challenges"
              className="text-xs font-medium text-emerald-400 hover:text-emerald-300"
            >
              You&apos;re ready -- head to Coding Challenges →
            </Link>
          )}
        </div>
        <ProgressBar done={done} total={typedConcepts.length} className="mt-3" />
      </section>

      <section>
        <h2 className="mb-3 text-xs font-semibold uppercase tracking-wide text-slate-500">
          The path, in order
        </h2>
        <ol className="space-y-2">
          {typedConcepts.map((c, i) => (
            <li
              key={c.id}
              className="flex items-center gap-3 rounded-md border border-slate-800 bg-slate-900 px-3 py-2.5"
            >
              <span className="flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-slate-800 font-mono text-xs text-slate-400">
                {i + 1}
              </span>
              <Link
                href={`/learn/${c.id}`}
                className="flex-1 text-sm text-slate-200 hover:text-emerald-400 hover:underline"
              >
                {c.title}
              </Link>
              <StatusToggle table="concepts" id={c.id} status={c.status} />
            </li>
          ))}
          {typedConcepts.length === 0 && (
            <li className="text-sm text-slate-500">No concepts seeded yet.</li>
          )}
        </ol>
      </section>

      <section className="rounded-lg border border-slate-800 bg-slate-900 p-5">
        <h2 className="text-sm font-semibold text-slate-100">What&apos;s next?</h2>
        <p className="mt-1 text-sm text-slate-400">
          Once these are done, every concept here already has its own mini challenges baked in --
          but the full challenge library has hundreds more across every difficulty, and the{" "}
          <Link href="/roadmap" className="text-emerald-400 hover:text-emerald-300">
            roadmap
          </Link>{" "}
          keeps going from data structures through OOP, idiomatic Python, and beyond.
        </p>
        <div className="mt-3 flex flex-wrap gap-3">
          <Link
            href="/challenges"
            className="rounded-md bg-emerald-600 px-4 py-1.5 text-sm font-medium text-white hover:bg-emerald-500"
          >
            Coding Challenges →
          </Link>
          <Link
            href={`/roadmap/${typedPhase.id}`}
            className="rounded-md border border-slate-700 px-4 py-1.5 text-sm text-slate-200 hover:bg-slate-800"
          >
            View this phase on the roadmap
          </Link>
        </div>
      </section>
    </div>
  );
}
