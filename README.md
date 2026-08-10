# Python Mastery Tracker

A personal learning dashboard for tracking progress through a structured,
zero-to-expert Python roadmap: a phase-by-phase roadmap with concepts and
projects, auto-graded coding challenges, an in-browser Python playground,
a spine-project log, spaced repetition flashcards, and a journal.

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
# schema
supabase/migrations/0001_init_schema.sql
supabase/migrations/0002_add_challenges.sql
# seed data (Phases 1-9, then their coding challenges)
supabase/seed.sql
supabase/seed_challenges.sql
```

All four files have been validated against a local Postgres instance, and
every challenge's reference solution was run end-to-end through Pyodide to
confirm its tests actually pass.

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
- `/roadmap`, `/roadmap/[phaseId]` -- phase list and detail, with status
  toggles that persist immediately
- `/challenges`, `/challenges/[challengeId]` -- auto-graded coding
  exercises per phase; write a solution, hit Run Tests, and it's marked
  solved automatically when every case passes
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
