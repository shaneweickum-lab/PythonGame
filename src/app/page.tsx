import Link from "next/link";

const FEATURES = [
  {
    icon: "🗺️",
    title: "16 phases, zero to ML",
    body:
      "132 concepts start at what code even is and end at neural networks built from scratch in NumPy. Every concept ships with its own micro-project.",
  },
  {
    icon: "🧩",
    title: "820 auto-graded challenges",
    body:
      "Write real code, hit Run Tests, and get an instant PASS/FAIL breakdown -- easy through hard, across every phase.",
  },
  {
    icon: "🏆",
    title: "XP, levels, streaks, badges",
    body:
      "Gamification computed live from what you've actually finished -- no separate checklist to keep in sync.",
  },
  {
    icon: "▶️",
    title: "A real playground, in the browser",
    body:
      "Full Python via WebAssembly (numpy, pandas, scikit-learn and more), plus BambooScript -- a canvas/turtle-graphics language of its own. No installs.",
  },
];

const TIERS = [
  { label: "Beginner", body: "What code even is, syntax fluency, and the core data structures." },
  { label: "Intermediate", body: "OOP, idiomatic Python, engineering discipline, systems thinking." },
  { label: "Advanced", body: "Domain specialization, a capstone, and a full ML track." },
  { label: "Algorithms", body: "Data structures, complexity, and interview-ready fundamentals." },
];

export default function LandingPage() {
  return (
    <div className="flex flex-1 flex-col">
      <header className="border-b border-slate-800">
        <div className="mx-auto flex max-w-5xl items-center justify-between px-4 py-4">
          <span className="text-sm font-semibold tracking-tight text-slate-100">
            🐍 Python Mastery Tracker
          </span>
          <Link
            href="/login"
            className="rounded-md bg-emerald-600 px-4 py-1.5 text-sm font-medium text-white hover:bg-emerald-500"
          >
            Sign in
          </Link>
        </div>
      </header>

      <main className="flex-1">
        <section className="mx-auto max-w-3xl px-4 py-20 text-center">
          <h1 className="text-3xl font-semibold tracking-tight text-slate-100 sm:text-5xl">
            Zero to machine learning, one Python lesson at a time.
          </h1>
          <p className="mt-5 text-balance text-base text-slate-400 sm:text-lg">
            A structured, phase-by-phase curriculum that assumes nothing --
            not even that you&apos;ve seen a line of code -- and carries you all
            the way through building ML algorithms from scratch. Lessons,
            micro-projects, auto-graded challenges, and a real in-browser
            playground, all in one place.
          </p>
          <div className="mt-8 flex flex-wrap items-center justify-center gap-3">
            <Link
              href="/login"
              className="rounded-md bg-emerald-600 px-5 py-2.5 text-sm font-medium text-white hover:bg-emerald-500"
            >
              Sign in to continue
            </Link>
            <a
              href="#features"
              className="rounded-md border border-slate-700 px-5 py-2.5 text-sm font-medium text-slate-200 hover:bg-slate-900"
            >
              See how it works
            </a>
          </div>
        </section>

        <section id="features" className="border-t border-slate-800 bg-slate-900/40">
          <div className="mx-auto max-w-5xl px-4 py-16">
            <div className="grid gap-5 sm:grid-cols-2">
              {FEATURES.map((f) => (
                <div
                  key={f.title}
                  className="rounded-lg border border-slate-800 bg-slate-900 p-5"
                >
                  <div className="text-2xl">{f.icon}</div>
                  <h3 className="mt-3 text-sm font-medium text-slate-100">{f.title}</h3>
                  <p className="mt-1.5 text-sm text-slate-400">{f.body}</p>
                </div>
              ))}
            </div>
          </div>
        </section>

        <section className="border-t border-slate-800">
          <div className="mx-auto max-w-5xl px-4 py-16">
            <h2 className="text-center text-xs font-semibold uppercase tracking-wide text-slate-500">
              The path
            </h2>
            <div className="mt-6 grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
              {TIERS.map((tier, i) => (
                <div key={tier.label} className="relative rounded-lg border border-slate-800 bg-slate-900 p-5">
                  <span className="font-mono text-xs text-slate-600">
                    {String(i + 1).padStart(2, "0")}
                  </span>
                  <h3 className="mt-1 text-sm font-medium text-emerald-400">{tier.label}</h3>
                  <p className="mt-1.5 text-xs text-slate-400">{tier.body}</p>
                </div>
              ))}
            </div>
          </div>
        </section>

        <section className="border-t border-slate-800 bg-slate-900/40">
          <div className="mx-auto max-w-3xl px-4 py-16 text-center">
            <h2 className="text-xl font-semibold text-slate-100">Ready to pick up where you left off?</h2>
            <p className="mt-2 text-sm text-slate-400">
              Sign in to see your progress, streak, and next unfinished lesson.
            </p>
            <Link
              href="/login"
              className="mt-6 inline-block rounded-md bg-emerald-600 px-5 py-2.5 text-sm font-medium text-white hover:bg-emerald-500"
            >
              Sign in
            </Link>
          </div>
        </section>
      </main>

      <footer className="border-t border-slate-800 px-4 py-6 text-center text-xs text-slate-600">
        🐍 Python Mastery Tracker
      </footer>
    </div>
  );
}
