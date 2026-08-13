# Python Mastery Tracker

A personal learning platform for tracking progress through a structured,
zero-to-expert Python roadmap: a phase-by-phase curriculum of 75 concepts
(strings, f-strings, tuples, OOP, decorators, and everything between,
heaviest in the true-fundamentals phases) each paired with its own
micro-project, on top of one integrative mini-project and a running
spine-project milestone per phase, auto-graded coding challenges, an
in-browser Python playground, spaced repetition flashcards, a journal, and
gamification (XP/levels/streaks/achievements). The Playground also has a
BambooScript mode -- a Python-like language that draws to a canvas
(p5.js/Processing-style), ported in from the standalone BambooGrove IDE
project into this platform's own editor and account system.

## Stack

- Next.js (App Router) + TypeScript + Tailwind CSS
- Supabase (Postgres + Auth, single-user)
- Pyodide (Python via WebAssembly, runs entirely in the browser)
- BambooScript: a hand-written lexer/parser/transpiler + canvas runtime
  (`src/lib/bamboo/`), ported from the standalone BambooGrove IDE repo
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
supabase/migrations/0005_gamification.sql
supabase/migrations/0006_bamboo.sql
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

- `/` -- dashboard: level/XP, streak, overall progress, next unfinished
  item, due flashcards
- `/achievements` -- your level and XP breakdown, current/longest streak,
  and the full badge trophy case
- `/foundations` -- a welcoming, zero-experience-assumed entry point for
  people who've never coded: just Phase 1's 14 syntax concepts presented
  as an ordered path, with a progress bar and a closing link to
  `/challenges`. Not separate content -- it queries the same `concepts`
  rows Phase 1 already has (first phase by `order_index`), so there's one
  source of truth for the lessons regardless of which page you reach them
  from.
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
- `/playground` -- a mode switch between real Python (Pyodide) and
  BambooScript (canvas/turtle graphics, terminal mode, multi-file
  projects, a linter, and a bundled examples browser)
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
  for hand-authored lessons without pulling in a dependency. Every lesson
  follows the same section order: intro paragraph(s) with a code example,
  then `## Why it matters` (concrete real-world grounding), `## Common
  mistakes` (specific beginner pitfalls with fixes), and `## Key points`
  (a short recap) -- meant to make each lesson self-contained enough to
  teach the concept to someone new, not just refresh it.
- `PyodideEditor` is the shared run/console/loading core behind
  `PlaygroundClient`, `LessonPlayground`, and `ChallengeRunner` -- it
  takes a `buildRunCode` hook to transform edited code before executing
  (challenges append their test harness) and an `onComplete` hook to
  react to the full output (challenges parse pass/fail from it). It
  renders CodeMirror 6 (Python mode, oneDark theme) with Tab bound to a
  4-space indent instead of moving focus.
- The app is installable as a PWA: `src/app/manifest.ts` generates the
  web app manifest and `src/app/apple-icon.png` covers the iOS home
  screen icon (both generated from a source SVG via `sharp`, see git
  history -- there's no ongoing build step for them, they're committed
  as static assets). On screens below Tailwind's `md` breakpoint, the
  top nav (`NavLinks`) hides and a fixed bottom tab bar (`MobileTabBar`)
  takes over, matching a native mobile app's navigation pattern.
- Gamification (`src/lib/gamification.ts`) is computed live from current
  `status`/`completed_at` on concepts/projects/challenges plus journal
  entry timestamps -- there's no separate XP ledger or "badge unlocked"
  table. XP reflects how much of the curriculum is *currently* marked
  done (unmarking something removes its XP rather than double-counting
  effort), and badges are just boolean checks against that same data
  recomputed on every page load. `completed_at` (added in migration 0005)
  exists only so streaks know which calendar days had activity --
  `StatusToggle`/`ChallengeRunner` set it alongside `status` whenever
  something is marked done, and clear it if unmarked.
- **BambooScript** (`src/lib/bamboo/`) is a full port of the standalone
  BambooGrove IDE project: a hand-written lexer/parser/transpiler for a
  Python-like language, a canvas + turtle-graphics runtime, a Terminal
  mode (`print()`/genuinely-pausing `input()`), a multi-file module
  system, and a learner-focused linter -- copied over verbatim (framework-
  agnostic, no DOM coupling beyond a `<canvas>` element the `Sketch`
  class in `sandbox.js` is handed) rather than rewritten, so it stays a
  faithful, easy-to-update mirror of the upstream project. `sandbox.d.ts`
  is a companion type declaration for `sandbox.js` (plain JS, untyped) --
  without it, TypeScript infers an overly-narrow callback signature from
  the file's own default-parameter values.
  - `BambooEditor` (`src/components/bamboo/`) is the React shell replacing
    BambooGrove's original vanilla-JS `app.js`/`ide.html`: CodeMirror
    (Python mode reused for close-enough syntax highlighting) instead of
    the original textarea+overlay editor, but the same Canvas/Terminal/
    Reference tabs, lint panel, file toolbar, and examples browser.
  - Project storage moved from the original's `localStorage`-only design
    to Supabase (`bamboo_files`, migration 0006; `src/lib/bambooStorage.ts`)
    so sketches sync to the same account as everything else in this app.
    A project's own file list has to be fetched into memory *before*
    calling into the (synchronous) module-resolution code in
    `src/lib/bamboo/modules.js` -- `fetchModuleSourceLookup` does that
    fetch, then hands back a plain sync lookup function.
  - Bundled example `.bs` files live in `public/bamboo-examples/` (static,
    fetched at runtime, same as upstream) rather than in the database --
    they're bundled content, not user data.
  - Without Supabase configured, BambooScript still fully works for
    writing/running/linting/single-file examples; only Save/Open and
    multi-file example projects need it, matching how the rest of the
    app degrades gracefully.
  - `BambooEditor` has a Fullscreen toggle (a `fixed inset-0` overlay that
    hides the site's own nav, plus a best-effort real Fullscreen API call
    that's allowed to silently fail -- e.g. iOS Safari -- since the CSS
    overlay alone already fills the browser window) and an "Open in new
    tab" button, so the IDE and its output can each be maximized in
    separate browser windows and placed side by side. That button carries
    the current file id and a `fullscreen=1` flag via URL params
    (`/playground?mode=bamboo&fullscreen=1&file=<id>`), which
    `PlaygroundModeSwitch`/`BambooEditor` read on load to preselect the
    mode, open that saved file, and start already maximized.
