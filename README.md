# Python Mastery Tracker

A personal learning dashboard for tracking progress through a structured,
zero-to-expert Python roadmap: a phase-by-phase curriculum of 75 concepts
(strings, f-strings, tuples, OOP, decorators, and everything between,
heaviest in the true-fundamentals phases) each paired with its own
micro-project, on top of one integrative mini-project and a running
spine-project milestone per phase, auto-graded coding challenges, an
in-browser Python playground, spaced repetition flashcards, and a journal.

## Stack

- Next.js (App Router) + TypeScript + Tailwind CSS
- Supabase (Postgres + Auth, single-user)
- Pyodide (Python via WebAssembly, runs entirely in the browser)
- Deploys to Vercel

## Setup

### 1. Install dependencies

```bash
npm install
```

This also copies the Pyodide runtime from `node_modules/pyodide` into
`public/pyodide/` via a `postinstall` script (see
`scripts/copy-pyodide-assets.mjs`) so the playground doesn't depend on a
CDN at runtime.

### 2. Create a Supabase project

Create a project at [supabase.com](https://supabase.com), then apply the
schema and seed data from the SQL editor (or the Supabase CLI):

```bash
# schema, in order
supabase/migrations/0001_init_schema.sql
supabase/migrations/0002_add_challenges.sql
supabase/migrations/0003_project_concept_link.sql
supabase/migrations/0004_lessons_and_concept_challenges.sql
# seed data, in order
supabase/seed.sql                              # phases, original 9 mini/spine projects, flashcards
supabase/seed_challenges.sql                    # 18 phase-level auto-graded challenges
supabase/seed_curriculum_expanded.sql           # 75 concepts + their micro-projects
supabase/seed_lessons_and_concept_challenges.sql # lesson content + 4 challenges per concept (300 total)
```

All files have been validated against a local Postgres instance, and every
challenge's reference solution -- all 318 of them, phase-level and
concept-level -- was run end-to-end through Pyodide to confirm its tests
actually pass.

**`seed_curriculum_expanded.sql` replaces the `concepts` table contents**
(it `DELETE`s the original ~45 broad concepts and inserts the expanded set
of 75, each linked to its own micro-project). It does not touch mini/spine
projects, challenges, flashcards, or journal entries. If you've already
been using the app and marked progress on the original concepts, that
progress is lost when you run it -- run it once, early, rather than
re-running it later. `seed_lessons_and_concept_challenges.sql` only adds
lesson content and new challenge rows -- it's safe to run (once) any time
after the concepts it references exist.

### 3. Configure environment variables

```bash
cp .env.local.example .env.local
```

Fill in `NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` from
your project's API settings.

### 4. Create your login

This is a single-user app using Supabase Auth (email/password). Create your
one user from the Supabase dashboard (Authentication -> Users -> Add user),
or enable sign-ups and use `supabase.auth.signUp()` once from the browser
console, then sign in at `/login`.

### 5. Run it

```bash
npm run dev
```

Without a configured Supabase project, `/login` and `/playground` still
work (the playground's "save to project" list will just be empty); every
other page requires a live database.

## Project structure

- `/` -- dashboard: overall progress, next unfinished item, due flashcards
- `/roadmap`, `/roadmap/[phaseId]` -- phase list and detail; every concept
  shows its own status toggle plus, when one exists, its linked
  micro-project nested right underneath, followed by that phase's
  integrative mini-project and spine milestone
- `/learn/[conceptId]` -- a concept's dedicated lesson page: written
  explanation with code examples, an embedded playground pre-seeded with
  the lesson's first example to practice in, the concept's micro-project,
  and up to 4 auto-graded challenges to solidify it
- `/challenges`, `/challenges/[challengeId]` -- auto-graded coding
  exercises (phase-level and concept-level); write a solution, hit Run
  Tests, and it's marked solved automatically when every case passes
- `/playground` -- Pyodide-powered Python editor and console
- `/spine` -- read-only log of the spine project's evolution across phases
- `/review` -- SM-2-style spaced repetition flashcard review
- `/journal` -- reflections across all phases

## Notes

- `src/proxy.ts` (Next.js 16's renamed `middleware.ts`) gates every route
  behind auth once Supabase is configured, and refreshes the session.
- `src/lib/pyodide.ts` loads `pyodide.mjs` as a genuine browser ES module
  import rather than letting the bundler process the `pyodide` npm
  package -- its internal Node-detection code contains a dynamic
  `require`/`import` that Turbopack/webpack can't statically analyze.
- Challenges are graded by running the learner's code followed by that
  challenge's `test_code` in the same Pyodide session. The convention is
  one `PASS:`/`FAIL:` line per case and a final `<passed>/<total> tests
  passed` summary line, which `ChallengeRunner` parses to auto-update
  status -- no separate "submit" step.
- `projects.project_type` is `'micro'` (one per concept, reinforces that
  concept specifically), `'mini'` (one per phase, integrates everything
  learned in it), or `'spine'` (the running cross-phase project). Micro
  projects set `concept_id`; mini/spine projects leave it null.
- `concepts.order_index` controls display order within a phase (concepts
  are taught in sequence, not alphabetically).
- `concepts.lesson_content` uses a small hand-written markdown subset
  (`##` headings, ` ```-fenced ` code blocks, `- ` lists, `` `inline code` ``)
  rendered by `MarkdownLite` -- not a full markdown parser, just enough
  for hand-authored lessons without pulling in a dependency.
- `PyodideEditor` is the shared run/console/loading core behind
  `PlaygroundClient`, `LessonPlayground`, and `ChallengeRunner` -- it
  takes a `buildRunCode` hook to transform edited code before executing
  (challenges append their test harness) and an `onComplete` hook to
  react to the full output (challenges parse pass/fail from it).
