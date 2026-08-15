# Future plan: a VS Code extension for PyTorch/TensorFlow

Status: **not started -- planning only.** This document exists so the idea
doesn't have to be re-derived from scratch in a future session. Nothing here
has been built yet.

## Why this exists

The in-browser Playground runs Python via Pyodide (WebAssembly), and Pyodide
has no build of PyTorch or TensorFlow -- confirmed against the pinned
`pyodide-lock.json` during the ML track's build. That's why Phases 10-16
teach deep learning concepts from scratch in NumPy instead of via a real
framework: there's no way to `import torch` in a browser sandbox.

Real PyTorch/TensorFlow requires a real local Python process with those
packages pip-installed. Rather than trying to turn this platform into its
own desktop app to get that (Electron, a bundled Python runtime, etc.), the
plan is to piggyback on VS Code: build a VS Code extension that renders the
curriculum in a Webview and runs/grades code against the learner's actual
local Python interpreter. VS Code already solves cross-platform packaging,
auto-update, a marketplace, and "does this machine have Python" tooling (via
the official Python extension) -- none of that has to be built from zero.

## Guiding principle: reuse, don't fork

The extension should be a second **client** for the same curriculum, not a
second curriculum. Concretely:

- **Same Supabase project, same tables.** `phases`/`concepts`/`projects`/
  `challenges` stay the single source of truth. The extension reads/writes
  them over the same REST API the Next.js app already uses.
- **Same auto-grading convention.** Challenges already follow one contract:
  run the learner's code, then `test_code`, print `PASS:`/`FAIL:` lines per
  case, end with a line matching `^(\d+)/(\d+) tests passed$`. That
  convention is runtime-agnostic -- `ChallengeRunner.tsx` parses it after a
  Pyodide run today; the extension would parse the identical output after a
  local `python` run. No new grading model to invent.
- **Same lesson content format.** `lesson_content`'s markdown-lite
  convention (intro + code fence, `## Why it matters`, `## Common mistakes`,
  `## Key points`) is simple enough to render in a Webview with the same
  logic `MarkdownLite` already implements. Worth extracting that parser
  (and the PASS/FAIL-line regex) into a small shared package the web app
  and the extension both import, so there's one implementation instead of
  two that can drift.

## What's new (the parts that don't already exist)

1. **New curriculum content**: a PyTorch/TensorFlow track (e.g. Phases
   17-18) written the same way every other phase was -- concepts, lesson
   content, micro-projects, auto-graded challenges -- but these challenges
   assume a real `torch`/`tensorflow` import will work, which only the
   extension's local-Python execution can provide. The web app should know
   not to offer these via the in-browser Playground; simplest option is an
   additive column (e.g. `challenges.requires_local_runtime boolean`, or a
   `runtime` enum if more than one non-Pyodide runtime ever shows up) so the
   existing `ChallengeRunner` can show "Open in VS Code extension" instead
   of a broken Run button for these specific rows. This is additive to the
   existing schema, not a redesign of it.
2. **Auth from inside VS Code.** The extension needs to act as an
   authenticated Supabase client for the same account. Two options:
   - *Fast path for an MVP*: a "generate an extension token" action added to
     the web app (Achievements or a new Settings page), which the user
     pastes into the extension once. Cheap to build, not a great first-run
     experience.
   - *Proper solution*: a real sign-in flow using VS Code's URI handler
     (`vscode://<publisher>.<extension>/callback`) so clicking "Sign in"
     opens the browser, completes Supabase auth, and redirects back into
     VS Code with a session -- the same pattern most editor extensions for
     hosted services use. More work, much better UX; do this once the MVP
     has proven the rest of the pipeline works.
3. **Local code execution.** Instead of `pyodide.runPythonAsync`, the
   extension writes the learner's code + that challenge's `test_code` to a
   temp file (or pipes via stdin) and runs it through a local interpreter.
   Reuse the official Python extension's API to find the active
   interpreter/venv rather than guessing a `python`/`python3` path. Capture
   stdout/stderr exactly like `PyodideEditor` does today, parse the same
   summary line, then call the same status-update endpoint the web app's
   `ChallengeRunner`/`StatusToggle` already call, so progress made in the
   extension shows up on the web dashboard (and vice versa) automatically.
4. **Environment onboarding.** Unlike Pyodide (bundled, zero setup), a
   learner's machine may not have Python, or may not have `torch`/
   `tensorflow` installed. Before the first deep-learning lesson, the
   extension should check the active interpreter for those imports and, if
   missing, walk the learner through creating a venv and running the right
   `pip install` command rather than failing with a confusing traceback.
5. **Webview UI.** A read-only-at-first curriculum browser (phase list ->
   concept -> lesson content -> challenges), matching the web app's
   `/learn/[conceptId]` page closely enough that switching between the two
   surfaces doesn't feel like a different product.
6. **Packaging & distribution.** `vsce package` to produce a `.vsix`;
   sideload it for early testing, then publish to the VS Code Marketplace
   under a publisher account once it's stable.

## Suggested phasing (whenever this gets picked up)

- **Phase 0 (prerequisite, not extension work)**: the current web platform
  and curriculum should feel done first -- this is a second product surface
  sharing data with the first, not a replacement for it, so it's cheaper to
  build once the shared schema/content it depends on has stopped changing.
  Also write the actual PyTorch/TensorFlow lesson + challenge content as
  new phases in Supabase, same as every other phase this project has
  shipped.
- **Phase 1 (MVP)**: extension scaffold, paste-a-token auth, a Webview that
  renders the new deep-learning phases read-only, a "Run Tests" button that
  shells out to the local interpreter and reuses the existing PASS/FAIL
  parsing, and a write-back call to Supabase on success. Scope: just the
  new PyTorch/TensorFlow phases, nothing else.
- **Phase 2**: replace token-paste with the real URI-handler sign-in flow;
  add the environment-onboarding assistant (venv creation, pip install
  guidance); bring the Webview up to visual/content parity with
  `/learn/[conceptId]` (Why it matters / Common mistakes / micro-project).
- **Phase 3**: expand the extension to the *entire* curriculum, not just
  the deep-learning phases, so it becomes a genuine alternative client
  rather than a deep-learning-only companion tool. Consider a status-bar
  item showing level/streak, mirroring the web dashboard's gamification.
- **Phase 4 (stretch)**: Marketplace publish and polish; consider a
  devcontainer/Docker option for learners who don't want to manage a local
  Python environment at all, as a turnkey alternative to the manual venv
  setup from Phase 2.

## Open questions to resolve before Phase 1 starts

- Token-paste vs. URI-handler auth for the MVP -- token-paste is faster to
  ship but worth confirming that's an acceptable first cut before building
  it, since it's real (if temporary) UX debt.
- Exact schema shape for "this challenge needs a local runtime" -- a single
  boolean is probably enough unless a second non-Pyodide runtime shows up
  later, in which case an enum would've been the better call from the
  start. Worth deciding deliberately rather than defaulting to whichever is
  fastest to migrate.
- Whether `MarkdownLite` and the PASS/FAIL-parsing regex get extracted into
  a shared package before or after the extension's first version -- doing
  it first avoids ever having two implementations, but it's pure
  refactoring work with no user-visible payoff on its own.
- How much of local code execution needs sandboxing. Pyodide's WASM sandbox
  disappears once code runs against a real local interpreter -- that's
  expected and fine (it's the user's own machine running their own code,
  the same trust model as any local dev workflow), but worth stating
  explicitly so it's a deliberate design acceptance, not an oversight.
