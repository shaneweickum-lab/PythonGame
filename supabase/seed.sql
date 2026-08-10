-- Seed data: Python Zero-to-Expert roadmap (Phases 1-9)
-- Phase ids are fixed literals so concepts/projects/flashcards can reference
-- them directly without lookup subqueries.

insert into phases (id, order_index, title, summary, is_spine_track) values
  ('00000000-0000-0000-0000-000000000001', 1, 'Syntax Fluency',
   'Core syntax, variables, control flow, functions, and basic I/O -- becoming fluent enough to write simple scripts without friction.', true),
  ('00000000-0000-0000-0000-000000000002', 2, 'Data Structures',
   'Lists, dicts, sets, tuples, comprehensions, and choosing the right structure for the job.', true),
  ('00000000-0000-0000-0000-000000000003', 3, 'OOP',
   'Classes, inheritance, composition, dunder methods, and thinking in objects.', true),
  ('00000000-0000-0000-0000-000000000004', 4, 'Pythonic Idioms & Stdlib',
   'Writing idiomatic Python: generators/iterators, context managers, decorators, and key standard library modules.', true),
  ('00000000-0000-0000-0000-000000000005', 5, 'Engineering Discipline',
   'Testing, type hints, packaging, virtual environments, linting, and version-control habits that make code maintainable.', true),
  ('00000000-0000-0000-0000-000000000006', 6, 'Systems-Level Thinking',
   'Concurrency, performance, memory model, persistence, and networking basics.', true),
  ('00000000-0000-0000-0000-000000000007', 7, 'Domain Specialization',
   'Going deep in one applied area -- web backend, data, or automation -- and building a portfolio-grade project.', true),
  ('00000000-0000-0000-0000-000000000008', 8, 'Interview-Ready Fundamentals',
   'Algorithms, data structure complexity, and communicating solutions clearly under interview conditions.', true),
  ('00000000-0000-0000-0000-000000000009', 9, 'Capstone',
   'Bring everything together into one polished, deployed, well-tested project that represents your full skill level.', true)
on conflict (id) do nothing;

-- Concepts

insert into concepts (phase_id, title, notes) values
  ('00000000-0000-0000-0000-000000000001', 'Variables, types & dynamic typing', null),
  ('00000000-0000-0000-0000-000000000001', 'Control flow (if/elif/else, while, for)', null),
  ('00000000-0000-0000-0000-000000000001', 'Functions, arguments & scope', null),
  ('00000000-0000-0000-0000-000000000001', 'Strings & f-string formatting', null),
  ('00000000-0000-0000-0000-000000000001', 'Basic I/O and error handling with try/except', null),

  ('00000000-0000-0000-0000-000000000002', 'Lists, tuples & slicing', null),
  ('00000000-0000-0000-0000-000000000002', 'Dictionaries & sets', null),
  ('00000000-0000-0000-0000-000000000002', 'List/dict/set comprehensions', null),
  ('00000000-0000-0000-0000-000000000002', 'Nested data structures', null),
  ('00000000-0000-0000-0000-000000000002', 'collections module (Counter, defaultdict, namedtuple)', null),

  ('00000000-0000-0000-0000-000000000003', 'Classes, instances & __init__', null),
  ('00000000-0000-0000-0000-000000000003', 'Inheritance & composition', null),
  ('00000000-0000-0000-0000-000000000003', 'Dunder/magic methods (__str__, __eq__, __len__)', null),
  ('00000000-0000-0000-0000-000000000003', 'Class methods, static methods & properties', null),
  ('00000000-0000-0000-0000-000000000003', 'Abstract base classes & protocols', null),

  ('00000000-0000-0000-0000-000000000004', 'Iterators & generators (yield)', null),
  ('00000000-0000-0000-0000-000000000004', 'Context managers (with, contextlib)', null),
  ('00000000-0000-0000-0000-000000000004', 'Decorators', null),
  ('00000000-0000-0000-0000-000000000004', 'itertools & functools', null),
  ('00000000-0000-0000-0000-000000000004', 'pathlib, datetime, json', null),

  ('00000000-0000-0000-0000-000000000005', 'Unit testing with pytest', null),
  ('00000000-0000-0000-0000-000000000005', 'Type hints & static checking (mypy)', null),
  ('00000000-0000-0000-0000-000000000005', 'Virtual environments & dependency management', null),
  ('00000000-0000-0000-0000-000000000005', 'Linting/formatting (ruff/black) & pre-commit', null),
  ('00000000-0000-0000-0000-000000000005', 'Git workflow discipline (branches, commits, PRs)', null),

  ('00000000-0000-0000-0000-000000000006', 'Concurrency: threading vs multiprocessing vs asyncio', null),
  ('00000000-0000-0000-0000-000000000006', 'Performance profiling & optimization', null),
  ('00000000-0000-0000-0000-000000000006', 'Memory model & garbage collection basics', null),
  ('00000000-0000-0000-0000-000000000006', 'Working with databases (SQLite/Postgres, an ORM)', null),
  ('00000000-0000-0000-0000-000000000006', 'Networking & APIs (requests, basic sockets)', null),

  ('00000000-0000-0000-0000-000000000007', 'Choosing a specialization track (web/data/automation/CLI)', null),
  ('00000000-0000-0000-0000-000000000007', 'Core framework for that track (FastAPI/Flask, pandas, Typer/Click)', null),
  ('00000000-0000-0000-0000-000000000007', 'Data validation & serialization (Pydantic or equivalent)', null),
  ('00000000-0000-0000-0000-000000000007', 'Deployment basics for the chosen track', null),
  ('00000000-0000-0000-0000-000000000007', 'Reading & contributing to an open-source project in the domain', null),

  ('00000000-0000-0000-0000-000000000008', 'Big-O analysis & complexity tradeoffs', null),
  ('00000000-0000-0000-0000-000000000008', 'Core algorithms (sorting, searching, recursion, two-pointer, sliding window)', null),
  ('00000000-0000-0000-0000-000000000008', 'Classic data structures (stacks, queues, trees, graphs, heaps)', null),
  ('00000000-0000-0000-0000-000000000008', 'Structured problem-solving (clarify -> approach -> code -> test)', null),
  ('00000000-0000-0000-0000-000000000008', 'Mock interviews & explaining tradeoffs out loud', null),

  ('00000000-0000-0000-0000-000000000009', 'Project scoping & planning', null),
  ('00000000-0000-0000-0000-000000000009', 'Architecture & design decision documentation', null),
  ('00000000-0000-0000-0000-000000000009', 'Full test coverage & CI/CD', null),
  ('00000000-0000-0000-0000-000000000009', 'Deployment & monitoring', null),
  ('00000000-0000-0000-0000-000000000009', 'Writing it up (README, demo, retrospective)', null);

-- Projects (mini-project + spine milestone per phase)

insert into projects (phase_id, title, description, project_type) values
  ('00000000-0000-0000-0000-000000000001', 'Command-line unit converter',
   'A small script converting between units (length, weight, temperature) using functions and basic I/O.', 'mini'),
  ('00000000-0000-0000-0000-000000000001', 'Ledger v0: single-file logger',
   'A single-file script that appends expense entries to a text file and prints a running total.', 'spine'),

  ('00000000-0000-0000-0000-000000000002', 'Word frequency analyzer',
   'Read a text file and report the most common words using dicts/Counter.', 'mini'),
  ('00000000-0000-0000-0000-000000000002', 'Ledger v1: structured records',
   'Refactor storage into a list of dict records; add filtering and sorting by category.', 'spine'),

  ('00000000-0000-0000-0000-000000000003', 'Shape library',
   'A small library of shapes (circle, rectangle, triangle) with area/perimeter via inheritance.', 'mini'),
  ('00000000-0000-0000-0000-000000000003', 'Ledger v2: object model',
   'Rewrite as Transaction/Account classes with encapsulated behavior and dunder methods.', 'spine'),

  ('00000000-0000-0000-0000-000000000004', 'Timing/logging decorator library',
   'A small utility library of decorators for timing, retrying, and logging function calls.', 'mini'),
  ('00000000-0000-0000-0000-000000000004', 'Ledger v3: idiomatic I/O',
   'Switch storage to pathlib + json, add a generator-based transaction stream, and a @logged decorator on commands.', 'spine'),

  ('00000000-0000-0000-0000-000000000005', 'Tested & typed mini-project',
   'Add a pytest suite, full type hints, and a CI config to an earlier mini-project.', 'mini'),
  ('00000000-0000-0000-0000-000000000005', 'Ledger v4: engineering hardening',
   'Add pytest coverage, type hints, packaging (pyproject.toml), and a CI workflow.', 'spine'),

  ('00000000-0000-0000-0000-000000000006', 'Concurrent URL fetcher',
   'An async script that fetches multiple URLs concurrently and aggregates results.', 'mini'),
  ('00000000-0000-0000-0000-000000000006', 'Ledger v5: persistence & concurrency',
   'Move storage to SQLite, add an async import job, and profile/optimize the hot path.', 'spine'),

  ('00000000-0000-0000-0000-000000000007', 'Specialization-track service',
   'Build a small service/app in your chosen track (e.g. a FastAPI endpoint) with one real feature end-to-end.', 'mini'),
  ('00000000-0000-0000-0000-000000000007', 'Ledger v6: exposed service',
   'Expose Ledger as a FastAPI service (or packaged CLI) with a real deployment target.', 'spine'),

  ('00000000-0000-0000-0000-000000000008', 'Algorithm problem set',
   'Solve and write clean solutions for 15 classic algorithm problems with complexity notes.', 'mini'),
  ('00000000-0000-0000-0000-000000000008', 'Ledger v7: efficient reporting',
   'Add an efficient reporting feature (e.g. top-N categories) with explicit complexity analysis and tests.', 'spine'),

  ('00000000-0000-0000-0000-000000000009', 'Capstone design doc',
   'Write a design doc for your capstone project before writing any code for it.', 'mini'),
  ('00000000-0000-0000-0000-000000000009', 'Ledger v8: capstone',
   'A polished, tested, deployed Ledger app with docs, CI/CD, and a written retrospective on its evolution across all phases.', 'spine');

-- Flashcards

insert into flashcards (phase_id, question, answer) values
  ('00000000-0000-0000-0000-000000000001', 'What is the output of type(3/2) in Python 3?', '<class ''float''> -- the / operator always performs true division and returns a float.'),
  ('00000000-0000-0000-0000-000000000001', 'How do you catch multiple exception types in one except clause?', 'except (TypeError, ValueError):'),
  ('00000000-0000-0000-0000-000000000001', 'What is the difference between == and is?', '== compares value equality; is compares object identity.'),
  ('00000000-0000-0000-0000-000000000001', 'What does f"{x!r}" insert into the string?', 'The repr() of x instead of str(x).'),

  ('00000000-0000-0000-0000-000000000002', 'What is the average-case time complexity of a dict lookup by key?', 'O(1).'),
  ('00000000-0000-0000-0000-000000000002', 'What does a dict comprehension {k: v for k, v in items} produce?', 'A new dictionary built from the given key/value pairs.'),
  ('00000000-0000-0000-0000-000000000002', 'What is the difference between list.append(x) and list.extend(x)?', 'append adds x as a single element; extend adds each item from the iterable x.'),
  ('00000000-0000-0000-0000-000000000002', 'What is a defaultdict useful for?', 'Auto-initializing missing keys with a default factory, avoiding manual KeyError checks.'),

  ('00000000-0000-0000-0000-000000000003', 'What does @staticmethod indicate about a method?', 'It does not receive self or cls -- it behaves like a plain function namespaced inside the class.'),
  ('00000000-0000-0000-0000-000000000003', 'What is the difference between inheritance and composition?', 'Inheritance models an is-a relationship; composition models has-a by holding references to other objects.'),
  ('00000000-0000-0000-0000-000000000003', 'What happens if a class defines __eq__ without __hash__?', 'Instances become unhashable by default, since Python sets __hash__ to None.'),
  ('00000000-0000-0000-0000-000000000003', 'What is the purpose of @property?', 'It exposes a method as an attribute, enabling computed or validated access without changing the calling API.'),

  ('00000000-0000-0000-0000-000000000004', 'What keyword turns a function into a generator?', 'yield'),
  ('00000000-0000-0000-0000-000000000004', 'What does a context manager''s __exit__ receive if an exception occurred in the with-block?', 'The exception type, value, and traceback.'),
  ('00000000-0000-0000-0000-000000000004', 'What does functools.lru_cache do?', 'Memoizes a function''s return values keyed by its arguments.'),
  ('00000000-0000-0000-0000-000000000004', 'What is the difference between itertools.chain and list concatenation?', 'chain lazily iterates over multiple iterables without building an intermediate combined list in memory.'),

  ('00000000-0000-0000-0000-000000000005', 'What is the purpose of a virtual environment?', 'Isolate a project''s dependencies from the system Python and other projects.'),
  ('00000000-0000-0000-0000-000000000005', 'What does a pytest fixture do?', 'Provides reusable setup/teardown data or state that gets injected into test functions.'),
  ('00000000-0000-0000-0000-000000000005', 'What does -> None in a function signature communicate?', 'A type hint that the function is expected to return nothing.'),
  ('00000000-0000-0000-0000-000000000005', 'Why keep commits small and focused?', 'They are easier to review, bisect, and revert without pulling in unrelated changes.'),

  ('00000000-0000-0000-0000-000000000006', 'Why does threading not speed up CPU-bound Python code much?', 'The GIL allows only one thread to execute Python bytecode at a time.'),
  ('00000000-0000-0000-0000-000000000006', 'When is asyncio a better fit than threading?', 'For high-concurrency I/O-bound workloads where tasks spend most of their time waiting, not computing.'),
  ('00000000-0000-0000-0000-000000000006', 'What tool would you use to find which function is slowest in a script?', 'A profiler, e.g. cProfile.'),
  ('00000000-0000-0000-0000-000000000006', 'What does an ORM give you over raw SQL strings?', 'A mapping between Python objects and rows, with query building and reduced injection risk.'),

  ('00000000-0000-0000-0000-000000000007', 'What problem does Pydantic solve?', 'Declarative data validation and parsing with type hints, raising clear errors on bad input.'),
  ('00000000-0000-0000-0000-000000000007', 'What is the difference between a library and a framework?', 'A library is code you call; a framework calls your code within its own control flow and structure.'),
  ('00000000-0000-0000-0000-000000000007', 'Why read open-source code in your specialization?', 'To learn idiomatic patterns, real-world architecture decisions, and codebase conventions beyond tutorials.'),
  ('00000000-0000-0000-0000-000000000007', 'What is one common way to deploy a small Python service?', 'Containerize it (Docker) and run it on a PaaS or VM behind a process manager.'),

  ('00000000-0000-0000-0000-000000000008', 'What is the time complexity of binary search?', 'O(log n).'),
  ('00000000-0000-0000-0000-000000000008', 'When would you choose a heap over a sorted list for a "top-k" problem?', 'When you need efficient repeated insert/extract-min operations -- O(log n) each -- instead of re-sorting the whole collection.'),
  ('00000000-0000-0000-0000-000000000008', 'What is the space-time tradeoff behind memoization?', 'Trading extra memory (cached results) for avoiding repeated computation, often turning exponential recursion into polynomial time.'),
  ('00000000-0000-0000-0000-000000000008', 'What should you do first when given an interview problem?', 'Clarify the input/output constraints and edge cases before writing any code.'),

  ('00000000-0000-0000-0000-000000000009', 'Why write a design doc before a capstone project?', 'It forces scoping and surfaces architectural decisions before code makes them expensive to change.'),
  ('00000000-0000-0000-0000-000000000009', 'What belongs in a project retrospective?', 'What worked, what you would change, and what you learned technically and about your own process.'),
  ('00000000-0000-0000-0000-000000000009', 'What is the difference between CI and CD?', 'CI (continuous integration) automatically builds/tests every change; CD (continuous deployment/delivery) automatically ships passing changes.'),
  ('00000000-0000-0000-0000-000000000009', 'Why does a capstone project matter more than any single phase''s mini-project?', 'It demonstrates you can integrate everything -- design, code quality, testing, deployment -- into one coherent, working system.');
