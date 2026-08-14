-- Foundations deepening: two new zero-assumed-knowledge prerequisite
-- concepts before "Variables & dynamic typing" (what code/an interpreter
-- is, syntax vs. runtime errors, indentation/block structure), plus a
-- light-touch revision pass on 6 of the existing 14 Phase 1 lessons so
-- their vocabulary lines up with the new foundation (the other 8 needed
-- no change). Existing Phase 1 concepts shift from order_index 1-14 to
-- 3-16 to make room.
--
-- Every new challenge's reference solution was run end-to-end through
-- Python to confirm its test_code actually passes before being included.
--
-- Run this AFTER supabase/seed_ml_track.sql.

-- Make room: shift the existing 14 Phase 1 concepts down by 2
update concepts set order_index = order_index + 2
  where phase_id = '00000000-0000-0000-0000-000000000001' and order_index between 1 and 14;

-- The two new prerequisite concepts

insert into concepts (id, phase_id, order_index, title) values
  ('10000000-0000-0000-0000-000000000131', '00000000-0000-0000-0000-000000000001', 1, 'What is code, and how does Python run it?'),
  ('10000000-0000-0000-0000-000000000132', '00000000-0000-0000-0000-000000000001', 2, 'Indentation & Python''s block structure')
on conflict (id) do nothing;

-- Their lesson content

update concepts set lesson_content = $py$Source code is just text -- the .py file you write, in plain Python syntax, before anything runs it. On its own a .py file does nothing; it needs Python's interpreter, a program that reads your source code top to bottom and carries out each instruction in order, to actually run it.

```python
print("Starting up...")
print("Doing some work")
print("Done!")
```

Save that in a file named hello.py, then run it from a terminal (also called the console) with `python hello.py` (or `python3 hello.py`). Each line runs in the order it's written, and `print()` is your most basic feedback tool -- it writes whatever you hand it out to the console so you can see what's happening.

This is different from typing directly into a Python REPL (the interactive prompt you get by running `python` with no filename), which reads and runs one line at a time and shows you each result immediately. A script is a saved sequence of instructions run as a whole, top to bottom; the REPL is for quick one-off experiments that don't get saved.

Not all mistakes fail the same way. A syntax error means Python can't even understand your code's structure well enough to start running it -- a missing colon, an unclosed quote -- and it's caught before a single line executes. A runtime error means the code was valid, started running, and then failed partway through, like adding a number to text.

## Why it matters

Everything you'll build in Python -- from a five-line script to a real application -- runs the exact same way: the interpreter reads your source code top to bottom and executes it, and print() is how you'll check your assumptions the entire time you're learning, long before you have real debugging tools.

## Common mistakes

- Assuming a .py file "does" something just by existing -- nothing runs until you invoke it with the interpreter (`python your_file.py`).
- Confusing a syntax error with a runtime error -- a syntax error stops Python from running *any* of the file, even lines before the mistake; a runtime error means some lines already ran successfully before the crash.
- Typing code meant for a script into the REPL (or vice versa) and being confused by different behavior -- the REPL echoes each expression's value automatically, a script only shows output you explicitly `print()`.
- Forgetting that `print()` output goes to the console/terminal you ran the script from -- not a popup window or a file, unless you wrote it there yourself.

## Key points

- Source code is just text; the interpreter is what actually reads and runs it, top to bottom.
- A script is a saved file run as a whole; the REPL runs one line at a time interactively.
- `print()` sends output to the console -- your main feedback tool while learning.
- Syntax errors are caught before anything runs; runtime errors happen partway through execution.$py$ where id = '10000000-0000-0000-0000-000000000131';
update concepts set lesson_content = $py$Python uses indentation -- consistent leading whitespace -- to mark which lines belong to a code block, instead of curly braces `{}` or an explicit `end` keyword like some other languages use. A line ending in a colon `:` announces that an indented block follows underneath it.

```python
if 2 > 1:
    print("This line is inside the block")
    print("So is this one")
print("This line is not indented, so it's outside the block")
```

You haven't learned what `if` actually does yet -- that's coming soon -- this example is only here to show the *shape*: a header line ending in `:`, followed by one or more lines indented underneath it. Every line indented to the same level is part of that same block; the moment a line goes back to the original indentation, the block has ended.

The convention in Python is 4 spaces per indentation level. Nothing forces exactly 4, but consistency is what actually matters -- every line in the same block must be indented by the exact same amount, using the same kind of whitespace. Mixing tabs and spaces in the same block is a classic source of confusing errors, since two lines can look identical but not actually match.

## Why it matters

Indentation isn't just a style preference in Python the way it is in most other languages -- it's the actual syntax that defines where a code block starts and stops, so getting it wrong doesn't just look messy, it changes what your program does or stops it from running at all.

## Common mistakes

- Mixing tabs and spaces in the same block -- they can look identical in some editors but Python treats them as different characters, which often raises an `IndentationError` (or worse, runs but groups lines into the wrong block).
- Indenting a line that shouldn't be indented, or forgetting to indent a line that should be -- both produce either an `IndentationError` or, more dangerously, code that runs without crashing but groups the wrong lines into a block.
- Using an inconsistent number of spaces between lines meant to be in the same block (3 spaces on one line, 4 on the next) -- Python requires them to match exactly within a block.
- Forgetting the colon `:` at the end of a header line -- this is a syntax error, since Python expects a block to follow and the colon is what announces it.

## Key points

- Indentation -- not braces or keywords -- is what marks a code block in Python.
- A colon `:` at the end of a line announces that an indented block follows.
- The convention is 4 spaces per level; never mix tabs and spaces.
- Inconsistent indentation raises an `IndentationError`, or silently changes which block a line belongs to.$py$ where id = '10000000-0000-0000-0000-000000000132';

-- Their micro-projects

insert into projects (phase_id, concept_id, title, description, project_type) values
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000131', 'Your First Script', 'Create a file named hello.py with at least three print() statements introducing yourself (your name, one fact about you, one goal for learning Python), then run it from a terminal with python hello.py and confirm the output shows in the console in the order you wrote it. Then break it once on purpose -- delete a closing quote -- run it again, read the syntax error message, and fix it back.', 'micro'),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000132', 'Two Blocks, One File', 'In a new script, write one if block (you can copy the shape from the lesson, like if 1 < 2:) with two indented print() lines inside it, then one plain print() line after it that is NOT indented. Run the script and confirm all three lines print. Then deliberately indent that last line by one space so it no longer matches the block above it, run it again, and read the IndentationError.', 'micro');

-- Their challenges

insert into challenges (phase_id, concept_id, order_index, title, difficulty, prompt, hint, starter_code, test_code) values
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000131', 1, 'What Would Print Show?', 'easy', 'Write to_console_text(value) that returns the exact text print(value) would display -- the string form of value. E.g. for the number 5 that''s "5", for True that''s "True".', 'str(value) converts anything to the string print() would show.', $py$def to_console_text(value):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 4
_call_desc = 'to_console_text(5)'
_actual = to_console_text(5)
_expected = "5"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'to_console_text(3.5)'
_actual = to_console_text(3.5)
_expected = "3.5"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'to_console_text(True)'
_actual = to_console_text(True)
_expected = "True"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'to_console_text("hi")'
_actual = to_console_text("hi")
_expected = "hi"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000131', 2, 'Running Top to Bottom', 'easy', 'Python''s interpreter runs a script''s lines in the order they''re written. Write steps_in_order(step1, step2, step3) that returns the three steps joined into one string in that same order, separated by '' -> ''.', 'Use '' -> ''.join([step1, step2, step3]), or plain string concatenation with +.', $py$def steps_in_order(step1, step2, step3):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = "steps_in_order('open file', 'read data', 'print result')"
_actual = steps_in_order("open file", "read data", "print result")
_expected = "open file -> read data -> print result"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "steps_in_order('first', 'second', 'third')"
_actual = steps_in_order("first", "second", "third")
_expected = "first -> second -> third"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "steps_in_order('wake up', 'eat', 'sleep')"
_actual = steps_in_order("wake up", "eat", "sleep")
_expected = "wake up -> eat -> sleep"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000131', 3, 'Fix the Runtime Crash', 'medium', 'Calling len() on a number raises a runtime error (TypeError) -- the code parses fine, but fails while running. Write safe_length(value) that returns len(value) when that works, and returns -1 instead of letting the program crash when it doesn''t.', 'Wrap the len(value) call in a try/except TypeError block.', $py$def safe_length(value):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 4
_call_desc = "safe_length('hello')"
_actual = safe_length("hello")
_expected = 5
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "safe_length(42)"
_actual = safe_length(42)
_expected = -1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "safe_length('')"
_actual = safe_length("")
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "safe_length(3.14)"
_actual = safe_length(3.14)
_expected = -1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000132', 1, 'Count the Indent Level', 'easy', 'Write indent_width(line) that returns how many leading spaces a line of code has -- its indentation level as a number of spaces.', 'len(line) - len(line.lstrip('' '')) counts only the leading spaces.', $py$def indent_width(line):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 4
_call_desc = "indent_width('    print(x)')"
_actual = indent_width("    print(x)")
_expected = 4
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "indent_width('print(x)')"
_actual = indent_width("print(x)")
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "indent_width('        print(x)')"
_actual = indent_width("        print(x)")
_expected = 8
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "indent_width('  print(x)')"
_actual = indent_width("  print(x)")
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000132', 2, 'Same Indentation Level?', 'easy', 'Write same_indent(line_a, line_b) that returns True if both lines have the exact same number of leading spaces, and False otherwise.', 'Compare len(line) - len(line.lstrip('' '')) for each line.', $py$def same_indent(line_a, line_b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 4
_call_desc = "same_indent('    x = 1', '    y = 2')"
_actual = same_indent("    x = 1", "    y = 2")
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "same_indent('  x = 1', '    y = 2')"
_actual = same_indent("  x = 1", "    y = 2")
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "same_indent('x = 1', 'y = 2')"
_actual = same_indent("x = 1", "y = 2")
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "same_indent('        a', '    b')"
_actual = same_indent("        a", "    b")
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000132', 3, 'Build an Indented Block', 'medium', 'Write make_block(header, body_lines) that returns a single string: the header line, followed by every line in body_lines, each indented by exactly 4 spaces, all joined together with newlines -- mirroring a real header + indented block.', 'Add ''    '' in front of each body line, then ''\n''.join() the header and the indented lines together.', $py$def make_block(header, body_lines):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = "make_block('if is_ready:', [\"print('go')\", \"print('set')\"])"
_actual = make_block("if is_ready:", ["print('go')", "print('set')"])
_expected = "if is_ready:\n    print('go')\n    print('set')"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "make_block('while running:', ['step()'])"
_actual = make_block("while running:", ["step()"])
_expected = "while running:\n    step()"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "make_block('def greet():', [\"print('hi')\", 'return None'])"
_actual = make_block("def greet():", ["print('hi')", "return None"])
_expected = "def greet():\n    print('hi')\n    return None"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000132', 4, 'Detect Mismatched Indentation', 'hard', 'Write has_consistent_block(lines) that returns True if every line in the list lines has the same number of leading spaces as the first line, and False if any of them differ.', 'Compute the first line''s indent width, then check every other line''s width matches it.', $py$def has_consistent_block(lines):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 5
_call_desc = "has_consistent_block(['    a', '    b', '    c'])"
_actual = has_consistent_block(["    a", "    b", "    c"])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "has_consistent_block(['    a', '  b', '    c'])"
_actual = has_consistent_block(["    a", "  b", "    c"])
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "has_consistent_block(['a', 'b'])"
_actual = has_consistent_block(["a", "b"])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "has_consistent_block(['    a'])"
_actual = has_consistent_block(["    a"])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "has_consistent_block(['  a', '  b', '   c'])"
_actual = has_consistent_block(["  a", "  b", "   c"])
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$);

-- Revisions to 6 of the existing 14 lessons for zero-knowledge framing

update concepts set lesson_content = $py$Variables in Python are just names bound to values -- there's no need to
declare a type ahead of time. The same name can point to an int, then
later a string; Python figures out the type from the value itself.

```python
score = 10        # int
score = "ten"     # now a str -- totally legal
print(type(score))
```

Use `type()` to check what kind of value a variable currently holds.
Reassigning a variable doesn't change the type of anything else that
happened to point to the old value -- names and values are separate
things.

## Why it matters

Dynamic typing is why you can write `total = 0` and later `total += price` without ever declaring a type, but it's also why a bug -- like a function expecting a number silently getting a string -- can slip through unnoticed until it actually runs. This flexibility is exactly why Python code, config values, and JSON/API data can flow between variables without type declarations getting in the way.

## Common mistakes

- Assuming Python "remembers" the old type after reassignment -- `score = "ten"` genuinely changes what's stored in `score`; there's no lingering int underneath.
- Confusing `=` (assignment) with `==` (comparison) -- `if score = 10:` is a syntax error, and beginners often reach for `=` when they meant to check equality.
- Assuming two variables that happen to hold the same value stay linked, e.g. `x = 5; y = x; x = 6` -- `y` is still `5`; reassigning `x` never changes `y` for immutable types like `int`/`str`.
- Naming a variable the same as a built-in (`list = [1, 2, 3]`, `str = "hi"`) -- it runs, but shadows the built-in for the rest of your code and causes confusing errors later when you try to call `list()` or `str()`.

## Key points

- Variable names are just labels; the *value* has a type, not the name.
- Reassignment can change a variable's type at any time.
- Common types you'll use constantly: `int`, `float`, `str`, `bool`.
$py$ where id = '10000000-0000-0000-0000-000000000001';
update concepts set lesson_content = $py$`print()` writes text to the console, and `#` starts a comment that Python
ignores entirely -- comments exist for the humans reading the code, not
the interpreter.

```python
# This script greets the user.
name = "Ada"
print("Hello,", name)          # print can take multiple arguments
print("Hello, " + name + "!")  # or build one string yourself
```

By default `print()` joins its arguments -- the values you give it
inside the parentheses -- with a space and ends with a newline. Both of
those are configurable with the `sep` and `end` keyword arguments
(arguments you set by name, like `sep=", "`) if you ever need something
different.

## Why it matters

print() is the main way beginners get feedback on what their code is actually doing -- checking a variable's value, tracing which branch ran -- before they know how to use a real debugger. Comments matter because reading code later (yours in six months, or a teammate's) is harder than writing it, and a good comment saves someone from re-deriving your intent from scratch.

## Common mistakes

- Trying to comment out several lines with one `#` -- it only comments to the end of that line; each line needs its own `#`.
- Concatenating mixed types with `+` in a `print()` call, e.g. `print("Age: " + 25)` -- raises `TypeError` because `+` won't silently convert an int to a str; use a comma or an f-string instead.
- Writing comments that just restate the code (`x = x + 1  # add one to x`) instead of explaining why -- that's noise, not documentation.
- Forgetting that `print()` returns `None` -- writing `x = print("hi")` and then trying to use `x` as if it held the printed text.

## Key points

- Comments start with `#` and run to the end of the line.
- `print()` accepts multiple arguments, separated by commas.
- Good comments explain *why*, not *what* -- the code already says what.
$py$ where id = '10000000-0000-0000-0000-000000000002';
update concepts set lesson_content = $py$Strings come with a large set of built-in methods for the transformations
you'll need constantly: changing case, trimming whitespace, swapping
substrings, and breaking a string apart or gluing pieces back together.

```python
s = "  Hello, World!  "
print(s.strip())              # 'Hello, World!'
print(s.strip().lower())      # 'hello, world!'
print(s.replace("World", "Python"))
print("a,b,c".split(","))     # ['a', 'b', 'c']
print("-".join(["a", "b"]))   # 'a-b'
```

Every one of these returns a *new* string -- strings are immutable, so
none of them modify `s` in place.

## Why it matters

Cleaning and reshaping text -- trimming whitespace from user input, splitting a CSV line, normalizing case before comparing -- is one of the most common things real scripts do before any "real" logic runs, so these methods get used on nearly every line that touches text.

## Common mistakes

- Calling `s.strip()` (or `.replace()`, `.upper()`, etc.) and expecting it to modify `s` -- it doesn't; strings are immutable, so you must reassign: `s = s.strip()`.
- Assuming `.strip()` removes spaces from the middle of a string -- it only trims from the two ends, not internal whitespace.
- Using `.split(" ")` and expecting it to behave like plain `.split()` -- `"a  b".split(" ")` (two spaces) produces `['a', '', 'b']`, while `.split()` with no argument collapses any run of whitespace instead.
- Calling `.join()` on the wrong object -- it's a string method that takes the list, e.g. `"-".join(["a", "b"])`, not `["a", "b"].join("-")`.

## Key points

- `.strip()` trims whitespace (or specified characters) from both ends.
- `.split(sep)` breaks a string into a list; `sep.join(list)` reverses it.
- Chaining methods (`s.strip().lower()`) is idiomatic -- the natural, expected style in Python -- and very common.
$py$ where id = '10000000-0000-0000-0000-000000000005';
update concepts set lesson_content = $py$f-strings are the modern, readable way to build strings that mix in
variables and expressions -- an expression being any piece of code that
produces a value, like `age + 1` or just a variable name on its own.
Prefix a string with `f` and drop any expression inside curly braces --
Python evaluates it and inserts the result.

```python
name = "Ada"
age = 36
print(f"{name} is {age} years old")
print(f"Next year: {age + 1}")
print(f"Pi is about {3.14159:.2f}")   # format spec: 2 decimal places
```

## Why it matters

f-strings are how most modern Python code builds any string that includes a variable -- log messages, error text, generated filenames -- and they're what you'll see throughout real codebases instead of older `%`-formatting or `.format()` calls.

## Common mistakes

- Putting quotes around a name inside the braces, like `f"{'name'}"` -- that prints the literal text `name`, because it's now a string literal inside the expression, not a reference to the variable.
- Reusing the same quote character inside and outside the f-string on older Python versions (pre-3.12), e.g. `f"{d["key"]}"` -- can cause a syntax error; nest single quotes inside double quotes (or vice versa) to be safe.
- Assuming a format spec like `{value:.2f}` changes the underlying value's precision -- it only affects how the value is displayed, not what's stored in the variable.
- Cramming complex logic or method calls inside `{}` because it's technically legal -- it makes the string hard to read; pull the expression out into its own variable first.

## Key points

- Anything inside `{}` is a real Python expression, not just a variable name.
- A format spec after a colon controls things like decimal places
  (`:.2f`) or padding/alignment (`:>10`).
- Adding `!r` inserts a value's `repr()` instead of its `str()` --
  useful for seeing quotes around strings while debugging.

## Common mistake

Forgetting the `f` prefix means the braces print literally instead of
being evaluated:

```python
name = "Ada"
print("{name}")   # prints the literal text {name}
print(f"{name}")   # prints Ada
```
$py$ where id = '10000000-0000-0000-0000-000000000006';
update concepts set lesson_content = $py$`if` runs a block only when its condition is true; `elif` checks another
condition if the previous ones were false; `else` catches everything
else. Only the first matching branch runs.

```python
score = 85
if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
else:
    grade = "F"
print(grade)   # 'B'
```

## Why it matters

if/elif/else is the backbone of decision-making code -- validating a form field, branching game logic, choosing which response to return -- and most "wrong branch ran" bugs trace back to condition order or a missing case here.

## Common mistakes

- Writing several separate `if` statements when `elif` was intended -- with independent `if`s, more than one block can run even though only one was supposed to.
- Putting a broad condition before a more specific one it already covers, e.g. checking `score >= 70` before `score >= 90` -- the first true branch wins, so the more specific one below it never gets reached.
- Forgetting the colon `:` at the end of the `if`/`elif`/`else` line, or misindenting the block underneath -- both are common syntax errors (bad indentation specifically often raises `IndentationError`).
- Writing `if condition == True:` instead of using the condition directly.

## Key points

- Conditions are checked top to bottom; the first `True` one wins and the
  rest are skipped.
- `elif` is optional and repeatable; `else` is optional and always last.
- Python has no `switch` statement -- a chain of `elif`s (or a dict
  lookup) does the job.
$py$ where id = '10000000-0000-0000-0000-000000000009';
update concepts set lesson_content = $py$`try`/`except` lets your program handle a runtime error -- one that only
shows up while the code is running, like dividing by zero -- gracefully
instead of crashing. Code that might fail goes in `try`; if a matching
exception (Python's signal that a runtime error has occurred) is raised,
the corresponding `except` block runs instead of the crash propagating.

```python
def safe_divide(a, b):
    try:
        return a / b
    except ZeroDivisionError:
        return None

print(safe_divide(10, 2))   # 5.0
print(safe_divide(10, 0))   # None -- handled, not a crash
```

You can catch multiple exception types, add an `else` (runs if no
exception occurred) and a `finally` (always runs, error or not).

## Why it matters

Real programs deal with unreliable input and external failures constantly -- a file that doesn't exist, a user typing letters where a number was expected, a network call timing out -- and try/except is how you keep a program running (or fail on purpose and gracefully) instead of crashing on the first bad input.

## Common mistakes

- Using a bare `except:` to catch "anything" -- it also silently swallows real bugs (like a typo causing `NameError`) along with the error you meant to handle, making problems far harder to find.
- Wrapping far more code than necessary inside `try` -- it becomes unclear which line can actually raise, and unrelated errors can get caught by accident.
- Catching an exception and doing nothing, `except Exception: pass` -- the program keeps running, but the underlying problem is now invisible and often causes confusing behavior further downstream.
- Assuming try/except fixes the error rather than just handling it -- `except ZeroDivisionError: return None` doesn't make `10 / 0` valid, it just lets your code respond to that specific failure instead of crashing.
- Expecting `try`/`except` to catch a syntax error -- it can't; a syntax error means Python couldn't even parse the code, so nothing inside `try` ever starts running in the first place.

## Key points

- Catch specific exception types (`ValueError`, `ZeroDivisionError`,
  etc.) rather than a bare `except:` whenever you can -- it's easy to
  accidentally hide real bugs otherwise.
- `except (TypeError, ValueError):` catches either type in one clause.
- An uncaught exception still crashes the program -- try/except only
  helps for the errors you actually anticipate and handle.
$py$ where id = '10000000-0000-0000-0000-000000000014';
