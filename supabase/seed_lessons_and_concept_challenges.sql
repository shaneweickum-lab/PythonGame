-- Lesson content for every concept, and 4 auto-graded challenges per
-- concept (300 total), tied to it via challenges.concept_id.
--
-- Every challenge's reference solution was run end-to-end through Pyodide
-- (see build_and_validate.py / phaseN_content.py during development) and
-- confirmed to pass its own test_code before being included here.
--
-- Run this AFTER supabase/seed_curriculum_expanded.sql (concepts must
-- already exist with the ids this file references).

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

By default `print()` joins its arguments with a space and ends with a
newline. Both of those are configurable with the `sep` and `end`
keyword arguments if you ever need something different.

## Key points

- Comments start with `#` and run to the end of the line.
- `print()` accepts multiple arguments, separated by commas.
- Good comments explain *why*, not *what* -- the code already says what.
$py$ where id = '10000000-0000-0000-0000-000000000002';
update concepts set lesson_content = $py$Python has two main number types you'll use constantly: `int` (whole
numbers) and `float` (decimals). The arithmetic operators cover the
usual `+ - * /`, plus a few Python-specific ones.

```python
print(7 / 2)   # 3.5   -- true division, always returns a float
print(7 // 2)  # 3     -- floor division, drops the remainder
print(7 % 2)   # 1     -- modulo, the remainder itself
print(2 ** 5)  # 32    -- exponentiation
```

Operator precedence works like normal math (`**` before `* /` before
`+ -`), and parentheses override it exactly like you'd expect.

## Key points

- `/` always gives a float, even `4 / 2` is `2.0`.
- `//` and `%` are a pair: `a == (a // b) * b + (a % b)`.
- `**` is exponentiation, not `^` (that's a different, bitwise operator).
$py$ where id = '10000000-0000-0000-0000-000000000003';
update concepts set lesson_content = $py$Strings are sequences of characters, and like any sequence they support
indexing (`s[0]`) and slicing (`s[1:4]`). Indexes start at 0, and
negative indexes count from the end.

```python
s = "Python"
print(s[0])      # 'P'
print(s[-1])     # 'n'  -- last character
print(s[1:4])    # 'yth' -- up to but not including index 4
print(s[:3])     # 'Pyt' -- from the start
print(s + "ic")  # concatenation: 'Pythonic'
```

Strings are immutable -- slicing and concatenation always build a *new*
string rather than changing the original.

## Key points

- `s[start:stop]` includes `start`, excludes `stop`.
- `s[::-1]` reverses a string (step of -1).
- Concatenating with `+` in a loop is fine for a handful of strings, but
  gets slow for many -- that's what `str.join()` is for later on.
$py$ where id = '10000000-0000-0000-0000-000000000004';
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

## Key points

- `.strip()` trims whitespace (or specified characters) from both ends.
- `.split(sep)` breaks a string into a list; `sep.join(list)` reverses it.
- Chaining methods (`s.strip().lower()`) is idiomatic and very common.
$py$ where id = '10000000-0000-0000-0000-000000000005';
update concepts set lesson_content = $py$f-strings are the modern, readable way to build strings that mix in
variables and expressions. Prefix a string with `f` and drop any
expression inside curly braces -- Python evaluates it and inserts the
result.

```python
name = "Ada"
age = 36
print(f"{name} is {age} years old")
print(f"Next year: {age + 1}")
print(f"Pi is about {3.14159:.2f}")   # format spec: 2 decimal places
```

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
update concepts set lesson_content = $py$`bool` has exactly two values, `True` and `False`, and they're what
comparison operators (`== != < > <= >=`) produce. Logical operators
(`and`, `or`, `not`) combine booleans -- and short-circuit, meaning they
stop evaluating as soon as the result is decided.

```python
age = 20
has_ticket = True
print(age >= 18 and has_ticket)   # True
print(age < 18 or has_ticket)     # True (has_ticket alone decides it)
print(not has_ticket)             # False
```

## Key points

- `and`/`or` return one of their actual operands, not just True/False --
  `"" or "default"` evaluates to `"default"`.
- Chained comparisons work naturally: `0 <= x < 10`.
- Almost anything can be used where a bool is expected -- empty
  collections/strings/0 are "falsy", everything else is "truthy".
$py$ where id = '10000000-0000-0000-0000-000000000007';
update concepts set lesson_content = $py$`input()` pauses a script and waits for the user to type something,
returning it as a string once they press Enter. Since it's always a
string, you'll often need to convert it (with `int()`, `float()`, etc.)
before using it as a number.

```python
name = input("What's your name? ")
age = int(input("How old are you? "))
print(f"Hi {name}, next year you'll be {age + 1}")
```

Because this app runs Python inside a browser (no real terminal),
`input()` isn't interactive here the way it is on your own machine --
but the concept and the functions below work identically once you're
running scripts locally.

## Key points

- `input()` always returns a `str` -- convert it explicitly when you need a number.
- Give `input()` a prompt string so the person knows what to type.
- Converting bad input (e.g. `int("abc")`) raises `ValueError` -- that's
  what the next concept, error handling, is for.
$py$ where id = '10000000-0000-0000-0000-000000000008';
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

## Key points

- Conditions are checked top to bottom; the first `True` one wins and the
  rest are skipped.
- `elif` is optional and repeatable; `else` is optional and always last.
- Python has no `switch` statement -- a chain of `elif`s (or a dict
  lookup) does the job.
$py$ where id = '10000000-0000-0000-0000-000000000009';
update concepts set lesson_content = $py$A `while` loop keeps running its body as long as its condition stays
true. It's the right tool when you don't know in advance how many
times you'll need to loop -- unlike `for`, which iterates a known
sequence.

```python
n = 10
steps = 0
while n != 1:
    n = n // 2 if n % 2 == 0 else n * 3 + 1
    steps += 1
print(steps)
```

Watch out for infinite loops: if the condition never becomes false, the
loop never stops. `break` exits a loop immediately; `continue` skips to
the next iteration's condition check.

## Key points

- The condition is checked *before* each iteration, including the first.
- Something inside the loop must eventually make the condition false
  (or you need a `break`).
- `while True:` with an internal `break` is a common, deliberate pattern.
$py$ where id = '10000000-0000-0000-0000-000000000010';
update concepts set lesson_content = $py$`for` iterates directly over a sequence's items -- a string, a list, or
a `range()` of numbers -- which is Python's usual way to loop a known
number of times.

```python
for i in range(5):
    print(i)          # 0 1 2 3 4

for letter in "abc":
    print(letter)      # a b c

for i in range(2, 10, 2):
    print(i)           # 2 4 6 8
```

`range(stop)`, `range(start, stop)`, and `range(start, stop, step)` are
all valid -- `stop` is always excluded, just like slicing.

## Key points

- `for x in sequence` gives you each *item*, not an index -- use
  `enumerate(sequence)` when you need both.
- `range()` is lazy -- it doesn't build a full list in memory.
- `break` and `continue` work the same as in `while` loops.
$py$ where id = '10000000-0000-0000-0000-000000000011';
update concepts set lesson_content = $py$`def` defines a reusable block of code. Parameters are the names it
expects as input; `return` sends a value back to the caller (a function
with no `return` implicitly returns `None`).

```python
def celsius_to_fahrenheit(c):
    return c * 9 / 5 + 32

def greet(name, greeting="Hello"):   # default parameter value
    return f"{greeting}, {name}!"

print(celsius_to_fahrenheit(100))   # 212.0
print(greet("Ada"))                  # 'Hello, Ada!'
print(greet("Bo", "Hey"))           # 'Hey, Bo!'
```

## Key points

- Parameters with defaults must come after ones without defaults.
- `return` exits the function immediately with that value.
- Calling `f()` and `f` (without parentheses) are very different --
  the second is the function object itself, not a call.
$py$ where id = '10000000-0000-0000-0000-000000000012';
update concepts set lesson_content = $py$A variable created inside a function is *local* -- it only exists while
that function runs, and it doesn't affect a variable of the same name
outside it. To modify a variable defined outside the function, you'd
need the `global` keyword (used sparingly in practice).

```python
counter = 0

def increment():
    counter = 1        # this creates a NEW local variable, doesn't touch the outer one
    return counter

print(increment())   # 1
print(counter)        # still 0 -- untouched
```

```python
counter = 0

def increment_global():
    global counter
    counter += 1        # now this really does modify the outer variable

increment_global()
print(counter)   # 1
```

## Key points

- Reading an outer (global) variable from inside a function works
  automatically; *assigning* to it does not, unless you use `global`.
- Prefer passing values in as parameters and returning results over
  reaching for `global` -- it keeps functions predictable.
- Each function call gets its own fresh set of local variables.
$py$ where id = '10000000-0000-0000-0000-000000000013';
update concepts set lesson_content = $py$`try`/`except` lets your program handle an error gracefully instead of
crashing. Code that might fail goes in `try`; if a matching exception is
raised, the corresponding `except` block runs instead of propagating the
crash.

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

## Key points

- Catch specific exception types (`ValueError`, `ZeroDivisionError`,
  etc.) rather than a bare `except:` whenever you can -- it's easy to
  accidentally hide real bugs otherwise.
- `except (TypeError, ValueError):` catches either type in one clause.
- An uncaught exception still crashes the program -- try/except only
  helps for the errors you actually anticipate and handle.
$py$ where id = '10000000-0000-0000-0000-000000000014';
update concepts set lesson_content = $py$A list is an ordered, mutable collection -- you can change it in place
after creating it, unlike a string. Access items by index, and assign
to an index to change that item.

```python
groceries = ["milk", "eggs", "bread"]
groceries[1] = "cheese"          # mutate in place
groceries.append("butter")       # add to the end
print(groceries)                  # ['milk', 'cheese', 'bread', 'butter']
print(len(groceries))             # 4
```

## Key points

- Lists can hold mixed types, though most real lists hold one kind of thing.
- `list[i] = value` replaces an existing item; it doesn't insert a new one.
- `in` checks membership: `"milk" in groceries`.
$py$ where id = '10000000-0000-0000-0000-000000000015';
update concepts set lesson_content = $py$Slicing a list works exactly like slicing a string: `items[start:stop:step]`
returns a *new* list, leaving the original untouched.

```python
songs = ["A", "B", "C", "D", "E"]
print(songs[:3])     # ['A', 'B', 'C']
print(songs[-2:])    # ['D', 'E']
print(songs[::2])    # ['A', 'C', 'E']
print(songs[::-1])   # ['E', 'D', 'C', 'B', 'A']
```

Slicing never raises an error for out-of-range indexes -- it just clips
to whatever's actually there, which is handy for "give me up to N items"
logic.

## Key points

- A slice is always a copy -- mutating the slice never affects the original list.
- Omitting `start` or `stop` defaults to the beginning/end.
- A negative `step` walks backward, which is how you reverse a list.
$py$ where id = '10000000-0000-0000-0000-000000000016';
update concepts set lesson_content = $py$Lists come with mutating methods for adding, removing, and reordering
items in place -- most of them return `None`, since they modify the
list directly rather than building a new one.

```python
scores = [40, 10, 30]
scores.append(20)        # [40, 10, 30, 20]
scores.sort()             # [10, 20, 30, 40] -- sorts in place
lowest = scores.pop(0)    # removes and returns 10
scores.remove(40)         # removes the first 40 it finds by value
print(scores)              # [20, 30]
```

`sorted(scores)` (a builtin, not a method) returns a *new* sorted list
instead of sorting in place -- reach for that when you need to keep the
original order too.

## Key points

- `.append(x)` adds one item; `.extend(iterable)` adds many.
- `.pop()` removes and returns the last item; `.pop(i)` removes at index `i`.
- `.sort(reverse=True)` sorts descending; `.sort(key=...)` sorts by a computed value.
$py$ where id = '10000000-0000-0000-0000-000000000017';
update concepts set lesson_content = $py$A tuple is like a list, but immutable -- once created, it can't be
changed. That makes tuples useful for fixed-size groupings (like
coordinates) and as dictionary keys, which lists can never be.

```python
point = (3, 4)
x, y = point            # unpacking
print(x, y)              # 3 4

# point[0] = 10          # TypeError -- tuples don't support item assignment
```

A one-item tuple needs a trailing comma -- `(5,)`, not `(5)` (which is
just the integer 5 in parentheses).

## Key points

- Tuples support indexing and slicing just like lists, but never mutation.
- Multiple return values are actually tuples under the hood.
- Because they're immutable and hashable, tuples of hashable items can be dict keys or set members.
$py$ where id = '10000000-0000-0000-0000-000000000018';
update concepts set lesson_content = $py$A dict maps keys to values -- Python's built-in hash table. Access,
add, or update a value with `d[key]`; use `.get()` to look something up
without risking a `KeyError` if it's missing.

```python
contacts = {"Ada": "555-0100", "Bo": "555-0200"}
contacts["Cy"] = "555-0300"      # add a new entry
contacts["Ada"] = "555-9999"     # update an existing one
print(contacts.get("Zed"))        # None, no KeyError
print(contacts.get("Zed", "?"))   # '?' -- a default
del contacts["Bo"]                 # remove an entry
```

## Key points

- `d[key]` raises `KeyError` if `key` isn't present; `.get(key)` doesn't.
- Keys must be hashable (strings, numbers, tuples of those) -- not lists.
- As of Python 3.7+, dicts remember insertion order.
$py$ where id = '10000000-0000-0000-0000-000000000019';
update concepts set lesson_content = $py$Iterating a dict directly gives you its keys; `.items()` gives
key-value pairs, and `.values()` gives just the values -- all the
common ways you'll actually loop over one.

```python
inventory = {"apples": 10, "bananas": 5}
for item in inventory:                     # keys
    print(item)
for item, qty in inventory.items():        # key + value
    print(item, qty)
print(sum(inventory.values()))              # 15
print(list(inventory.keys()))               # ['apples', 'bananas']
```

## Key points

- `.items()` is the one to reach for whenever you need both key and value.
- `.keys()` and `.values()` return *views*, not lists -- they stay in sync with the dict.
- `.update(other_dict)` merges another dict's entries in, overwriting matching keys.
$py$ where id = '10000000-0000-0000-0000-000000000020';
update concepts set lesson_content = $py$A set is an unordered collection of unique, hashable items -- great for
membership tests and comparing groups of things. Duplicate items are
automatically collapsed to one.

```python
class_a = {"Ada", "Bo", "Cy"}
class_b = {"Bo", "Dee"}

print(class_a & class_b)   # {'Bo'} -- intersection
print(class_a | class_b)   # union: everyone in either class
print(class_a - class_b)   # {'Ada', 'Cy'} -- only in class_a
print("Ada" in class_a)     # True -- O(1) membership check
```

## Key points

- `set()` (not `{}`, that's an empty dict) creates an empty set.
- `&`, `|`, `-`, and `^` (symmetric difference) mirror mathematical set operations.
- Checking membership in a set is much faster than in a list for large collections.
$py$ where id = '10000000-0000-0000-0000-000000000021';
update concepts set lesson_content = $py$A comprehension builds a new collection in one expression instead of a
multi-line loop -- the same idea works for lists, dicts, and sets, and
all of them can include an optional `if` filter.

```python
squares = [n ** 2 for n in range(6)]                  # list
evens_only = [n for n in range(10) if n % 2 == 0]     # with a filter
lengths = {word: len(word) for word in ["a", "bb"]}   # dict
vowels = {ch for ch in "hello world" if ch in "aeiou"}  # set
```

Read a comprehension right to left after the first expression: "for
each `n` in `range(6)`, compute `n ** 2`."

## Key points

- Prefer a comprehension over a manual loop+append when the logic fits
  on one readable line -- past that, a regular loop is clearer.
- The `if` clause filters *before* the expression runs, not after.
- Nested comprehensions exist but get hard to read fast -- use sparingly.
$py$ where id = '10000000-0000-0000-0000-000000000022';
update concepts set lesson_content = $py$Real-world data is rarely flat -- a list of dicts, a dict of lists, or
deeper combinations show up constantly (this is exactly what JSON
looks like). The trick is just chaining the access patterns you already
know, one level at a time.

```python
students = [
    {"name": "Ada", "grades": [90, 85, 95]},
    {"name": "Bo", "grades": [70, 75]},
]
for student in students:
    avg = sum(student["grades"]) / len(student["grades"])
    print(student["name"], avg)
```

## Key points

- Access nested structures one step at a time: `students[0]["grades"][1]`.
- A list comprehension can reach into nested data too:
  `[s["name"] for s in students]`.
- When something's structure is unclear, `print()` it (or a small slice
  of it) before writing code that assumes its shape.
$py$ where id = '10000000-0000-0000-0000-000000000023';
update concepts set lesson_content = $py$The `collections` module has a few tools that make very common patterns
much shorter. `Counter` counts things; `defaultdict` auto-creates
missing keys with a default value; `namedtuple` gives a tuple named
fields.

```python
from collections import Counter, defaultdict, namedtuple

counts = Counter("mississippi")
print(counts.most_common(1))    # [('i', 4)]

groups = defaultdict(list)
groups["fruits"].append("apple")   # no KeyError, list auto-created

Point = namedtuple("Point", ["x", "y"])
p = Point(3, 4)
print(p.x, p.y)                     # 3 4
```

## Key points

- `Counter(iterable)` is a dict subclass with counting built in --
  `.most_common(n)` returns the top n as `(item, count)` pairs.
- `defaultdict(factory)` calls `factory()` to create a value the first
  time a key is missing, instead of raising `KeyError`.
- `namedtuple` fields work by both name (`p.x`) and index (`p[0]`).
$py$ where id = '10000000-0000-0000-0000-000000000024';
update concepts set lesson_content = $py$A class is a blueprint; calling it like a function creates an *instance*
-- a distinct object you can attach data to. Two instances of the same
class are still different objects, even with identical attributes.

```python
class Pet:
    pass

fido = Pet()
rex = Pet()
fido.name = "Fido"
rex.name = "Rex"
print(fido is rex)        # False -- separate objects
print(fido.name, rex.name)  # Fido Rex
```

## Key points

- `ClassName()` creates a new instance; each call makes a distinct object.
- Attributes can be attached to an instance directly, though normally
  you'll set them in `__init__` (the next concept).
- `isinstance(obj, ClassName)` checks whether an object is an instance
  of a class.
$py$ where id = '10000000-0000-0000-0000-000000000025';
update concepts set lesson_content = $py$`__init__` is the method Python calls automatically right after creating
a new instance -- it's where you set up the instance's starting
attributes from whatever arguments were passed in. `self` refers to the
instance being created.

```python
class BankAccount:
    def __init__(self, owner, balance=0):
        self.owner = owner
        self.balance = balance

acc = BankAccount("Ada", 100)
print(acc.owner, acc.balance)   # Ada 100
```

## Key points

- `self` is always the first parameter of an instance method, and Python
  passes it automatically -- you never pass it yourself when calling.
- Attributes set with `self.x = ...` belong to that specific instance.
- `__init__` never returns a value (implicitly returns `None`); its job
  is to set up `self`, not compute a result.
$py$ where id = '10000000-0000-0000-0000-000000000026';
update concepts set lesson_content = $py$An instance method is a function defined inside a class that operates
on `self` -- reading or changing that particular instance's state.
Calling `account.deposit(50)` is really Python calling
`BankAccount.deposit(account, 50)` behind the scenes.

```python
class BankAccount:
    def __init__(self, balance=0):
        self.balance = balance

    def deposit(self, amount):
        self.balance += amount

    def withdraw(self, amount):
        self.balance -= amount

acc = BankAccount(100)
acc.deposit(50)
acc.withdraw(30)
print(acc.balance)   # 120
```

## Key points

- Every instance method needs `self` as its first parameter to access the instance's own attributes.
- Methods can return a value, mutate `self`'s attributes, or both.
- Calling `acc.deposit(50)` and `BankAccount.deposit(acc, 50)` do the exact same thing.
$py$ where id = '10000000-0000-0000-0000-000000000027';
update concepts set lesson_content = $py$A class attribute belongs to the class itself, shared by every instance
(unless an instance shadows it with its own attribute of the same
name). A `@classmethod` receives the class (`cls`) instead of an
instance, and is a common way to track things across every instance.

```python
class BankAccount:
    bank_name = "First Python Bank"    # class attribute, shared
    accounts_created = 0

    def __init__(self, owner):
        self.owner = owner
        BankAccount.accounts_created += 1

    @classmethod
    def total_accounts(cls):
        return cls.accounts_created

BankAccount("Ada")
BankAccount("Bo")
print(BankAccount.total_accounts())   # 2
```

## Key points

- Class attributes are defined directly in the class body, not in `__init__`.
- `@classmethod` methods take `cls`, not `self`, and are called on the class or an instance.
- Mutating a class attribute through an instance (`self.x = ...`) creates
  a new *instance* attribute instead -- use the class name to actually
  change the shared value.
$py$ where id = '10000000-0000-0000-0000-000000000028';
update concepts set lesson_content = $py$A `@staticmethod` is a function that lives inside a class for
organizational purposes but doesn't need `self` or `cls` -- it doesn't
touch instance or class state at all. It's useful for a helper that's
conceptually related to the class but doesn't depend on any particular
instance.

```python
class BankAccount:
    @staticmethod
    def calculate_interest(balance, rate):
        return balance * rate

print(BankAccount.calculate_interest(1000, 0.05))   # 50.0 -- no instance needed
```

## Key points

- Call a static method on the class directly, or on an instance -- both work identically.
- If a method doesn't use `self` or `cls`, it's a candidate for `@staticmethod`.
- Static methods are really just regular functions namespaced under a class for organization.
$py$ where id = '10000000-0000-0000-0000-000000000029';
update concepts set lesson_content = $py$A subclass inherits everything from its parent class, and can override
specific methods to change or extend behavior. `super()` calls the
parent's version of a method, so you can build on it instead of
duplicating it.

```python
class BankAccount:
    def __init__(self, balance=0):
        self.balance = balance

    def withdraw(self, amount):
        self.balance -= amount

class SavingsAccount(BankAccount):
    def __init__(self, balance=0, min_balance=100):
        super().__init__(balance)
        self.min_balance = min_balance

    def withdraw(self, amount):
        if self.balance - amount < self.min_balance:
            raise ValueError("would go below minimum balance")
        super().withdraw(amount)
```

## Key points

- `class Child(Parent):` establishes the relationship; `isinstance(obj, Parent)` is true for both.
- Overriding a method replaces the parent's version for that subclass, unless you call `super()`.
- `super().__init__(...)` is the standard way to run the parent's setup before adding your own.
$py$ where id = '10000000-0000-0000-0000-000000000030';
update concepts set lesson_content = $py$Composition builds a class out of other objects rather than through
inheritance -- a `Car` *has an* `Engine`, rather than *is an* `Engine`.
It's often more flexible than inheritance: you can swap out the parts
independently.

```python
class Engine:
    def start(self):
        return "Vroom!"

class Car:
    def __init__(self):
        self.engine = Engine()   # composition: Car HAS an Engine

    def start(self):
        return self.engine.start()

print(Car().start())   # Vroom!
```

## Key points

- Composition models "has-a"; inheritance models "is-a" -- pick whichever
  actually describes the real relationship.
- A composed object's methods are reached through an attribute
  (`self.engine.start()`), not inherited directly.
- Composition tends to be easier to change later, since the parts aren't
  tightly bound to a class hierarchy.
$py$ where id = '10000000-0000-0000-0000-000000000031';
update concepts set lesson_content = $py$Dunder ("double underscore") methods let your class hook into Python's
built-in behavior -- `print()`, `==`, `len()`, and more all check for a
corresponding dunder method on your class.

```python
class BankAccount:
    def __init__(self, owner, balance):
        self.owner = owner
        self.balance = balance

    def __str__(self):
        return f"{self.owner}'s account: ${self.balance}"

    def __eq__(self, other):
        return self.balance == other.balance

acc1 = BankAccount("Ada", 100)
print(acc1)                              # Ada's account: $100 -- uses __str__
print(acc1 == BankAccount("Bo", 100))    # True -- uses __eq__
```

## Key points

- `__str__` controls what `print(obj)` and `str(obj)` show.
- `__eq__` controls what `==` does between two instances -- without it, `==` just checks identity.
- `__len__` lets `len(obj)` work; `__lt__`/`__gt__` etc. enable comparison operators like `<`.
$py$ where id = '10000000-0000-0000-0000-000000000032';
update concepts set lesson_content = $py$`@property` turns a method into something accessed like a plain
attribute (no parentheses), which lets you add validation or computed
values without changing how callers use your class. Pair it with a
matching `@x.setter` to control assignment too.

```python
class BankAccount:
    def __init__(self, balance):
        self._balance = balance

    @property
    def balance(self):
        return self._balance

    @balance.setter
    def balance(self, value):
        if value < 0:
            raise ValueError("balance can't be negative")
        self._balance = value

acc = BankAccount(100)
print(acc.balance)     # 100 -- reads like an attribute
acc.balance = 50        # runs the setter's validation
```

## Key points

- The underlying value is usually stored with a leading underscore
  (`self._balance`) to distinguish it from the public `balance` property.
- A property with no setter is effectively read-only from outside the class.
- This lets you start with a plain attribute and add validation later
  without breaking anyone's existing code.
$py$ where id = '10000000-0000-0000-0000-000000000033';
update concepts set lesson_content = $py$An abstract base class (ABC) defines methods that subclasses *must*
implement, without providing a body itself -- it's a contract. Python's
`abc` module raises an error if you try to instantiate a class that
hasn't implemented all its abstract methods.

```python
from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self):
        ...

class Circle(Shape):
    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return 3.14159 * self.radius ** 2

# Shape()          # TypeError -- can't instantiate an ABC directly
print(Circle(2).area())   # 12.56636
```

## Key points

- `Shape(ABC)` plus `@abstractmethod` on a method makes that method
  mandatory for any concrete subclass.
- Trying to instantiate a subclass that's missing an abstract method
  also raises `TypeError`.
- This is how you guarantee "anything called a Shape has an `area()`"
  across a whole codebase.
$py$ where id = '10000000-0000-0000-0000-000000000034';
update concepts set lesson_content = $py$Anything you can `for ... in` is an *iterable* -- it has an `__iter__`
that returns an *iterator*, an object with a `__next__` that produces
one value at a time and raises `StopIteration` when it's done. `for`
loops do this automatically; you can also build the protocol yourself.

```python
class Countdown:
    def __init__(self, start):
        self.current = start

    def __iter__(self):
        return self

    def __next__(self):
        if self.current <= 0:
            raise StopIteration
        self.current -= 1
        return self.current + 1

for n in Countdown(3):
    print(n)   # 3 2 1
```

## Key points

- `iter(obj)` calls `__iter__`; `next(it)` calls `__next__`.
- A `for` loop is really just repeatedly calling `next()` and catching `StopIteration` for you.
- An object can be its own iterator by having `__iter__` return `self`.
$py$ where id = '10000000-0000-0000-0000-000000000035';
update concepts set lesson_content = $py$A generator function uses `yield` instead of `return` -- calling it
doesn't run the body immediately, it returns a lazy generator object
that produces values one at a time, on demand, pausing between each
`yield`.

```python
def countdown(n):
    while n > 0:
        yield n
        n -= 1

for x in countdown(3):
    print(x)     # 3 2 1

gen = countdown(2)
print(next(gen))  # 2 -- runs until the first yield
print(next(gen))  # 1 -- resumes right after that yield
```

## Key points

- Generators never build the whole sequence in memory -- great for
  large or even infinite sequences.
- A generator can only be iterated once; after it's exhausted, it's done.
- `(x for x in range(10))` is a generator *expression* -- the
  comprehension syntax, but lazy.
$py$ where id = '10000000-0000-0000-0000-000000000036';
update concepts set lesson_content = $py$A context manager guarantees setup and cleanup happen together, even
if an error occurs in between -- `with open(...) as f:` is the classic
example, always closing the file. You can write your own with a class
(`__enter__`/`__exit__`) or the simpler `@contextmanager` decorator.

```python
from contextlib import contextmanager
import time

@contextmanager
def timer():
    start = time.time()
    yield
    print(f"Took {time.time() - start:.4f}s")

with timer():
    total = sum(range(1_000_000))
```

## Key points

- `__enter__` runs at the start of `with`; `__exit__` always runs at the end, error or not.
- `@contextmanager` splits a generator function at its single `yield`:
  code before it is `__enter__`, code after is `__exit__`.
- Context managers are how Python guarantees cleanup without a manual try/finally everywhere.
$py$ where id = '10000000-0000-0000-0000-000000000037';
update concepts set lesson_content = $py$A decorator is a function that wraps another function, adding behavior
before/after the original call without changing its source. `@decorator`
above a function definition is shorthand for `func = decorator(func)`.

```python
def log_calls(func):
    def wrapper(*args, **kwargs):
        print(f"Calling {func.__name__}")
        result = func(*args, **kwargs)
        print(f"{func.__name__} returned {result}")
        return result
    return wrapper

@log_calls
def add(a, b):
    return a + b

add(2, 3)   # prints the two log lines, then returns 5
```

## Key points

- The `wrapper` function is what actually replaces the original --
  it usually calls the original inside itself via `func(*args, **kwargs)`.
- `*args, **kwargs` in the wrapper let it forward any arguments,
  regardless of the wrapped function's signature.
- A decorator can also take its own arguments, via an extra layer of nested functions.
$py$ where id = '10000000-0000-0000-0000-000000000038';
update concepts set lesson_content = $py$`itertools` is a stdlib module of fast, memory-efficient building blocks
for working with iterators -- combining, chaining, grouping, and slicing
them without building intermediate lists.

```python
import itertools

print(list(itertools.chain([1, 2], [3, 4])))       # [1, 2, 3, 4]
print(list(itertools.product([1, 2], ["a", "b"])))  # [(1,'a'),(1,'b'),(2,'a'),(2,'b')]
print(list(itertools.combinations([1, 2, 3], 2)))   # [(1,2),(1,3),(2,3)]
print(list(itertools.islice(range(100), 3)))        # [0, 1, 2]
```

## Key points

- `chain(*iterables)` walks multiple iterables as if they were one, lazily.
- `combinations(iterable, r)` gives every r-length combination (order doesn't matter, no repeats); `permutations` cares about order.
- `islice` slices any iterator (even an infinite one) the way `[:n]` slices a list.
$py$ where id = '10000000-0000-0000-0000-000000000039';
update concepts set lesson_content = $py$`functools` has a handful of tools for working with functions
themselves: `lru_cache` memoizes results, `reduce` folds a sequence
down to one value, and `partial` pre-fills some of a function's
arguments.

```python
from functools import lru_cache, reduce, partial

@lru_cache
def fib(n):
    return n if n < 2 else fib(n - 1) + fib(n - 2)

total = reduce(lambda acc, x: acc + x, [1, 2, 3, 4], 0)   # 10

def power(base, exponent):
    return base ** exponent
square = partial(power, exponent=2)
print(square(5))   # 25
```

## Key points

- `@lru_cache` only helps for pure functions -- same input, same output, every time.
- `reduce(func, iterable, initial)` applies `func` cumulatively, left to right.
- `partial(func, *args, **kwargs)` returns a new callable with some arguments already locked in.
$py$ where id = '10000000-0000-0000-0000-000000000040';
update concepts set lesson_content = $py$`pathlib.Path` represents filesystem paths as objects instead of raw
strings, with methods for joining, inspecting, and manipulating them
that work the same way across operating systems.

```python
from pathlib import Path

p = Path("data") / "reports" / "2024.csv"   # / joins path segments
print(p.name)         # '2024.csv'
print(p.suffix)       # '.csv'
print(p.stem)         # '2024'
print(p.parent)       # data/reports
```

## Key points

- `/` between `Path` objects (or a `Path` and a string) joins path
  segments -- much nicer than manual string concatenation.
- `.name`, `.suffix`, `.stem`, and `.parent` all read a path apart
  without touching the actual filesystem.
- `Path.cwd()`, `.exists()`, `.is_file()`, and `.glob(pattern)` are the
  common ones that *do* touch the filesystem.
$py$ where id = '10000000-0000-0000-0000-000000000041';
update concepts set lesson_content = $py$The `datetime` module represents dates and times as objects you can
compare, subtract, and format -- much more reliable than working with
raw strings.

```python
from datetime import date, timedelta

today = date(2024, 3, 15)
birthday = date(1990, 6, 20)
age_years = today.year - birthday.year
if (today.month, today.day) < (birthday.month, birthday.day):
    age_years -= 1
print(age_years)   # 33

next_week = today + timedelta(days=7)
print(next_week)    # 2024-03-22
```

## Key points

- Subtracting two `date`/`datetime` objects gives you a `timedelta`, with `.days` etc.
- Adding a `timedelta` to a date shifts it forward (or backward, if negative).
- `.strftime(fmt)` formats a date as a string; `datetime.strptime(s, fmt)` parses one.
$py$ where id = '10000000-0000-0000-0000-000000000042';
update concepts set lesson_content = $py$`json.dumps` converts a Python value (dict, list, str, number, bool,
`None`) into a JSON-formatted string; `json.loads` parses one back.
This is the standard way Python programs read and write JSON --
config files, API payloads, saved state.

```python
import json

config = {"name": "Ada", "active": True, "tags": ["admin", "beta"]}
raw = json.dumps(config)
print(raw)                    # '{"name": "Ada", "active": true, "tags": ["admin", "beta"]}'

parsed = json.loads(raw)
print(parsed["name"])          # 'Ada'
print(parsed == config)        # True -- round-trips cleanly
```

## Key points

- JSON's `true`/`false`/`null` map to Python's `True`/`False`/`None`.
- `json.dumps(obj, indent=2)` pretty-prints with indentation, handy for readability.
- Not every Python object is JSON-serializable -- only the basic types above, plus nested combinations of them.
$py$ where id = '10000000-0000-0000-0000-000000000043';
update concepts set lesson_content = $py$The `re` module matches patterns in text -- useful for validation,
extraction, and search-and-replace beyond what plain string methods can
do. Patterns use a small, dense syntax: `\d` for a digit, `+` for "one
or more", `*` for "zero or more", and more.

```python
import re

text = "Call 555-0100 or 555-0200"
numbers = re.findall(r"\d{3}-\d{4}", text)
print(numbers)   # ['555-0100', '555-0200']

match = re.search(r"(\d{3})-(\d{4})", text)
print(match.group(1))   # '555' -- the first captured group
```

## Key points

- `re.findall(pattern, text)` returns every non-overlapping match as a list.
- `re.search` finds the first match anywhere; `re.match` only matches at the very start of the string.
- Parentheses in a pattern create capture groups, accessible via `.group(n)`.
$py$ where id = '10000000-0000-0000-0000-000000000044';
update concepts set lesson_content = $py$pytest discovers functions named `test_*` and runs each one -- a plain
`assert` that's `True` means pass; an `assert` that's `False` (or any
exception) means fail, with pytest showing exactly what was compared.

```python
def is_even(n):
    return n % 2 == 0

def test_is_even():
    assert is_even(4) is True
    assert is_even(3) is False
```

Run `pytest` in a terminal and it finds every `test_*` function in your
project automatically -- no manual test-runner code needed. This app's
playground can't invoke the real `pytest` command, but the `assert`
statements themselves run exactly the same either way.

## Key points

- A good test asserts something that would actually fail if the code
  under test had a bug -- not just something trivially true.
- pytest reports every failing assertion with the actual vs expected values automatically.
- Test *behavior*, not implementation details, so tests survive refactoring.
$py$ where id = '10000000-0000-0000-0000-000000000045';
update concepts set lesson_content = $py$Type hints document what types a function expects and returns --
`def greet(name: str) -> str:`. Python doesn't enforce them at runtime
by itself, but a static checker like `mypy` reads them and flags
mismatches before you ever run the code.

```python
def add(a: int, b: int) -> int:
    return a + b

# mypy would flag this as an error without running anything:
# add("2", "3")   # Argument 1 has incompatible type "str"; expected "int"
```

This app's playground can't run the real `mypy` CLI, but you can inspect
a function's declared hints directly at runtime via `__annotations__`,
which is what the exercises below do.

## Key points

- Hints are documentation *and* input for tools like mypy -- Python itself mostly ignores them at runtime.
- `Optional[int]` (or `int | None`) means "an int, or None".
- `func.__annotations__` is a dict of every parameter's (and the return value's) declared type.
$py$ where id = '10000000-0000-0000-0000-000000000046';
update concepts set lesson_content = $py$A virtual environment is an isolated Python installation for one
project, so its dependencies don't collide with any other project's.
`pip` installs packages into whichever environment is currently active.

```bash
python -m venv .venv          # create an isolated environment
source .venv/bin/activate     # activate it (Windows: .venv\Scripts\activate)
pip install requests           # installs into .venv, not system-wide
pip freeze > requirements.txt  # record exact versions for reproducibility
```

This app's playground can't create real virtual environments or run
pip (no filesystem or subprocess access in the browser sandbox), but the
exercises below work with the *data* around dependency management --
parsing and building requirements-file-style text -- which is the part
you'll actually script against.

## Key points

- Always work inside an activated virtual environment for project work --
  installing packages system-wide leads to version conflicts across projects.
- `requirements.txt` (one `package==version` per line) is the classic way
  to pin and share exact dependency versions.
- `pip install -r requirements.txt` installs everything listed, at the pinned versions.
$py$ where id = '10000000-0000-0000-0000-000000000047';
update concepts set lesson_content = $py$A linter (like `ruff`) flags likely bugs and style issues; a formatter
(like `black`) rewrites code into one consistent style automatically.
`pre-commit` runs tools like these automatically before every commit, so
issues get caught before they're even pushed.

```python
# A linter would flag this:
import os   # unused import
x = 1
x = 1  # duplicate assignment, probably a mistake

# A formatter would normalize spacing/quotes consistently across a whole codebase
```

This app's playground can't run the real `ruff`/`black` binaries, but
Python's built-in `ast` module lets you inspect code's structure --
which is genuinely how tools like these are built under the hood. The
exercises below use it to catch one class of real lint issue: unused
imports.

## Key points

- Linters catch *likely bugs* (unused variables, unreachable code);
  formatters only change *style* (spacing, quotes), never behavior.
- Running these automatically via `pre-commit` means style debates and
  easy-to-catch bugs never make it into a review at all.
- Consistent formatting across a codebase makes diffs in code review
  about actual logic changes, not incidental whitespace.
$py$ where id = '10000000-0000-0000-0000-000000000048';
update concepts set lesson_content = $py$`logging` is the standard way to record what a program is doing --
better than scattering `print()` everywhere, because it supports
severity levels and can be redirected without touching your code.

```python
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

logger.debug("won't show at INFO level")
logger.info("starting import job")
logger.warning("skipped 3 malformed rows")
logger.error("failed to connect to database")
```

## Key points

- Levels, low to high severity: `DEBUG`, `INFO`, `WARNING`, `ERROR`, `CRITICAL`.
- `basicConfig(level=X)` sets the minimum level that actually gets shown --
  anything below it is silently skipped.
- `logging.getLogger(__name__)` gives each module its own named logger,
  useful for filtering large codebases' output.
$py$ where id = '10000000-0000-0000-0000-000000000049';
update concepts set lesson_content = $py$`pyproject.toml` is the modern, standard place to declare a Python
project's metadata (name, version, dependencies) and build
configuration, replacing the older `setup.py`.

```toml
[project]
name = "my-tool"
version = "0.1.0"
dependencies = [
    "requests>=2.28",
    "click>=8.0",
]
```

This app's playground can't run a real build tool against a
`pyproject.toml` file, but the exercises below work with the same
metadata as plain Python dicts -- the structure a TOML parser would
hand you after reading the file.

## Key points

- `[project]` is the standard table for name/version/dependencies; other
  tables configure specific build backends.
- Version specifiers like `>=2.28` (at least that version) and `==1.0.0`
  (exactly that version) control how strictly a dependency is pinned.
- Packaging your own code turns "a folder of scripts" into something
  installable with `pip install .` elsewhere.
$py$ where id = '10000000-0000-0000-0000-000000000050';
update concepts set lesson_content = $py$Good git habits -- small commits, clear messages, feature branches --
make a project's history actually useful later, when you (or a
teammate) needs to understand why something changed.

```
git checkout -b add-user-search
# ... make focused changes ...
git add src/search.py
git commit -m "Add case-insensitive user search"
git push -u origin add-user-search
# open a pull request, get it reviewed, merge
```

This app's playground can't run real git commands, but the exercises
below work with the same kind of data git itself manages -- commit
message strings and simple diff-like structures.

## Key points

- A good commit message explains *why*, in the imperative mood ("Add X", not "Added X" or "Adding X").
- One commit should represent one logical change -- easy to review, easy to revert if it's wrong.
- A feature branch keeps `main` always in a working state while you're mid-change.
$py$ where id = '10000000-0000-0000-0000-000000000051';
update concepts set lesson_content = $py$Three different tools for "doing more than one thing," each suited to a
different bottleneck. `threading` and `asyncio` both help with
*I/O-bound* work (waiting on network/disk); `multiprocessing` helps with
*CPU-bound* work, since it's the only one of the three that sidesteps
the GIL by using separate processes.

```python
import asyncio

async def fetch(url):
    await asyncio.sleep(0.1)   # simulates waiting on the network
    return f"data from {url}"

async def fetch_all(urls):
    return await asyncio.gather(*(fetch(u) for u in urls))

# All three fetches happen concurrently, not one after another
results = asyncio.run(fetch_all(["a", "b", "c"]))
```

## Key points

- The GIL (Global Interpreter Lock) means only one thread runs Python
  bytecode at a time -- `threading` helps with waiting, not computing.
- `asyncio` is single-threaded cooperative concurrency: tasks yield
  control at `await` points instead of being preempted.
- `multiprocessing` runs on genuinely separate processes (and CPU cores),
  the right choice when the bottleneck is computation, not waiting.
$py$ where id = '10000000-0000-0000-0000-000000000052';
update concepts set lesson_content = $py$Guessing where a program spends its time is unreliable -- a profiler
measures it directly. `cProfile` records how many times each function
was called and how long it took, in aggregate.

```python
import cProfile

def slow_function():
    return sum(range(10**6))

profiler = cProfile.Profile()
profiler.enable()
slow_function()
profiler.disable()
profiler.print_stats(sort="cumulative")
```

## Key points

- Profile before optimizing -- intuition about "the slow part" is
  wrong surprisingly often.
- `cProfile` measures *time and call count per function*, not per line
  (`line_profiler` is a separate tool for that level of detail).
- Once you know which function is actually slow, that's the one worth
  optimizing -- everything else is likely not worth the effort.
$py$ where id = '10000000-0000-0000-0000-000000000053';
update concepts set lesson_content = $py$CPython tracks how many references point to each object; when that
count hits zero, the object is freed immediately. A separate cyclic
garbage collector handles the one case reference counting can't --
objects that reference each other in a cycle with nothing else pointing
to them.

```python
import sys, gc, weakref

x = [1, 2, 3]
print(sys.getrefcount(x))   # 2: x itself, plus the temporary arg reference

ref = weakref.ref(x)
del x
gc.collect()
print(ref())   # None -- the object is gone, and the weak reference doesn't keep it alive
```

## Key points

- `sys.getrefcount(obj)` is always at least 1 higher than you'd expect,
  since passing `obj` into the function call itself creates a temporary reference.
- A `weakref.ref(obj)` lets you check on an object without keeping it alive yourself.
- `gc.collect()` forces an immediate cycle-collection pass -- mostly useful for demonstrations; in real programs it runs automatically.
$py$ where id = '10000000-0000-0000-0000-000000000054';
update concepts set lesson_content = $py$`sqlite3` is a full relational database built into Python's standard
library -- no server to run, everything lives in one file (or, as
below, entirely in memory). The same SQL and cursor-based API pattern
applies whether you're using SQLite or a bigger database like Postgres.

```python
import sqlite3

conn = sqlite3.connect(":memory:")
conn.execute("CREATE TABLE users (id INTEGER, name TEXT)")
conn.execute("INSERT INTO users VALUES (?, ?)", (1, "Ada"))
conn.commit()

row = conn.execute("SELECT name FROM users WHERE id = ?", (1,)).fetchone()
print(row)   # ('Ada',)
```

An ORM (like SQLAlchemy or Django's) maps rows to Python objects
automatically, so you write `user.name` instead of `row[1]` -- but under
the hood, it's still running SQL through a connection exactly like this.

## Key points

- Always use `?` placeholders for values, never string-formatting SQL directly -- that's how SQL injection happens.
- `.fetchone()` gets a single row (or `None`); `.fetchall()` gets every matching row as a list.
- `:memory:` databases are perfect for tests -- fast, and thrown away automatically when the connection closes.
$py$ where id = '10000000-0000-0000-0000-000000000055';
update concepts set lesson_content = $py$HTTP requests have a well-defined structure -- a method, a URL
(possibly with query parameters), headers, and sometimes a body. The
`requests` library (or `urllib` in the standard library) builds and
sends these; parsing the pieces is plain string/data work you can do
without any library at all.

```python
from urllib.parse import urlencode

params = {"q": "python", "page": "2"}
query_string = urlencode(sorted(params.items()))
url = f"https://example.com/search?{query_string}"
print(url)   # https://example.com/search?page=2&q=python
```

This app's playground can't make real network calls (no `requests`
library, and the browser sandbox restricts arbitrary cross-origin
fetches), so the exercises below work with the structure of requests
and responses directly -- URLs, headers, retry logic -- which is
exactly what you're manipulating when you do use `requests` for real.

## Key points

- A query string is just `key=value` pairs joined with `&`, with special
  characters percent-encoded -- `urlencode` does that encoding for you.
- HTTP headers are `Name: value` pairs, one per line, ending the header
  block with a blank line before the body.
- Real network calls fail sometimes even when your code is correct --
  retry logic (with a limit!) is a standard, expected part of production code.
$py$ where id = '10000000-0000-0000-0000-000000000056';
update concepts set lesson_content = $py$Sockets are the low-level building block underneath every network
connection -- HTTP, and everything else, is built on top of them. At
this level, you're just sending and receiving raw bytes, which is why
protocols need a way to know where one message ends and the next
begins ("framing").

```python
# A minimal length-prefixed framing scheme:
def frame_message(message):
    length = f"{len(message):04d}"
    return length + message

def parse_framed(framed):
    length = int(framed[:4])
    return framed[4:4 + length]

framed = frame_message("hello")
print(framed)               # '0005hello'
print(parse_framed(framed))  # 'hello'
```

This app's playground can't open real sockets (no OS-level networking
in the browser sandbox), so the exercises below implement the same
framing and message-handling logic a real socket server would use,
just without an actual socket underneath.

## Key points

- TCP delivers a stream of bytes with no built-in concept of "messages" --
  application protocols add framing (length prefixes, or a delimiter) on top.
- A real echo server just sends back whatever it receives, unmodified -- the
  simplest possible thing you can build on a socket.
- A server handling multiple clients needs to track each connection
  separately -- broadcasting means sending the same data to every one of them.
$py$ where id = '10000000-0000-0000-0000-000000000057';
update concepts set lesson_content = $py$After the fundamentals, going deep in one applied area -- web backend,
data, automation, whatever fits your interests and goals -- turns
general Python skill into something you can point at and say "I build
this." The choice matters less than actually going deep somewhere.

```python
my_interests = {"apis", "databases", "automation"}
web_backend_track = {"apis", "databases", "http", "auth"}
data_track = {"pandas", "statistics", "visualization"}

overlap = len(my_interests & web_backend_track)   # 2
```

## Key points

- A track is a *default*, not a life sentence -- skills transfer far
  more than people expect between web/data/automation/etc.
- Depth in one area teaches you things breadth never will: how a real
  system is actually put together, not just its syntax.
- Weigh a track by both interest and market/opportunity -- either alone is an incomplete signal.
$py$ where id = '10000000-0000-0000-0000-000000000058';
update concepts set lesson_content = $py$Every web framework's core job is the same: match an incoming request's
path to the right handler function. FastAPI/Flask do this with
decorators (`@app.get("/users/{id}")`); underneath, it's just a lookup
table and some pattern matching.

```python
routes = {"/": "home", "/about": "about_page"}

def match_route(routes, path):
    return routes.get(path)

print(match_route(routes, "/about"))   # 'about_page'
```

This app's playground doesn't have FastAPI/Flask/pandas/Typer installed
(they're not part of Pyodide's default runtime here), so the exercises
below implement the same core mechanics -- routing, dispatch, simple
CLI parsing -- directly, which is exactly what those frameworks do
underneath their decorators.

## Key points

- A router is fundamentally a mapping from "what the request looks
  like" to "which function handles it."
- Path parameters (`/users/{id}`) mean the router has to do pattern
  matching, not just an exact dictionary lookup.
- A CLI framework (Typer/Click) does the same job for command-line
  arguments that a web framework does for URLs.
$py$ where id = '10000000-0000-0000-0000-000000000059';
update concepts set lesson_content = $py$Pydantic validates incoming data against a declared model (checking
required fields, types, and constraints) and serializes model instances
back to plain dicts/JSON -- exactly the pattern that keeps "bad data"
from silently propagating through an application.

```python
# What a Pydantic model looks like in a real project:
# from pydantic import BaseModel
# class User(BaseModel):
#     name: str
#     age: int

# The same idea, hand-rolled:
def validate_user(data):
    return isinstance(data.get("name"), str) and isinstance(data.get("age"), int)
```

This app's playground doesn't have Pydantic installed, so the exercises
below hand-roll the same validation/serialization patterns Pydantic
automates for you in a real project.

## Key points

- Validate at the boundary (where external data enters your system) --
  once it's past that check, the rest of your code can trust its shape.
- "Serialization" just means turning a model instance back into a plain
  dict/JSON -- the inverse of validation/parsing.
- Default values mean a field doesn't have to be present in the input
  at all to end up with a sensible value.
$py$ where id = '10000000-0000-0000-0000-000000000060';
update concepts set lesson_content = $py$A `Dockerfile` describes how to build a container image, line by line --
each instruction (`FROM`, `RUN`, `COPY`, `EXPOSE`, `CMD`) adds a layer or
configures the final image.

```dockerfile
FROM python:3.12-slim
COPY . /app
RUN pip install -r /app/requirements.txt
EXPOSE 8000
CMD ["python", "/app/main.py"]
```

This app's playground obviously can't build or run real containers, so
the exercises below parse Dockerfile-shaped text directly -- the same
structure a real `docker build` reads through when it processes yours.

## Key points

- `FROM` sets the base image everything else builds on top of.
- Each `RUN` becomes its own image layer -- fewer, combined `RUN` lines
  generally means a smaller, faster-to-build image.
- `EXPOSE` documents which ports the container listens on; it doesn't
  actually publish them -- that's `docker run -p` at runtime.
$py$ where id = '10000000-0000-0000-0000-000000000061';
update concepts set lesson_content = $py$Reading real, working codebases teaches idioms and architecture
decisions that tutorials rarely cover -- and Python's own `ast` module
lets you inspect a file's structure programmatically, the same way a
linter or an IDE's "jump to definition" feature does.

```python
import ast

source = open("some_module.py").read()
tree = ast.parse(source)
functions = [node.name for node in ast.walk(tree) if isinstance(node, ast.FunctionDef)]
print(functions)
```

## Key points

- Start reading a new codebase from its tests -- they show how the
  code is actually meant to be used, often more clearly than the code itself.
- A good first open-source contribution is usually small: a
  documentation fix, a test for an untested edge case, a tiny bug fix.
- `ast.walk(tree)` visits every node in a parsed file -- exactly how
  tools that analyze code (linters, formatters, IDEs) work under the hood.
$py$ where id = '10000000-0000-0000-0000-000000000062';
update concepts set lesson_content = $py$Big-O describes how an algorithm's work grows as its input grows --
not exact timing, but the *shape* of the growth curve. O(1) stays flat;
O(n) grows in a straight line; O(n^2) grows much faster than either.

```python
def constant(items):
    return items[0]                    # O(1) -- always one step

def linear(items):
    return sum(items)                   # O(n) -- one step per item

def quadratic(items):
    return [(a, b) for a in items for b in items]   # O(n^2) -- n steps per item
```

## Key points

- Big-O ignores constant factors and lower-order terms -- O(n) and
  O(3n + 100) are both just "O(n)."
- A nested loop over the same input is the classic sign of O(n^2) --
  watch for it.
- An algorithm that's technically faster can still be slower in
  practice for small inputs, because of overhead Big-O doesn't capture.
$py$ where id = '10000000-0000-0000-0000-000000000063';
update concepts set lesson_content = $py$Sorting and searching are the two building blocks behind an enormous
share of algorithm problems. Knowing how a basic sort actually moves
elements (not just calling `.sort()`) makes reasoning about correctness
and complexity much easier.

```python
def binary_search(sorted_items, target):
    low, high = 0, len(sorted_items) - 1
    while low <= high:
        mid = (low + high) // 2
        if sorted_items[mid] == target:
            return mid
        elif sorted_items[mid] < target:
            low = mid + 1
        else:
            high = mid - 1
    return -1
```

## Key points

- Binary search needs a *sorted* input -- it's O(log n) because each
  comparison eliminates half the remaining possibilities.
- Bubble sort and selection sort are both O(n^2) -- fine to know how
  they work, not what you'd reach for in real production code.
- `sorted()`/`.sort()` use Timsort under the hood, O(n log n) -- always
  the right default choice in real code.
$py$ where id = '10000000-0000-0000-0000-000000000064';
update concepts set lesson_content = $py$A recursive function calls itself on a smaller version of the same
problem, with a *base case* that stops the recursion. Every recursive
call needs to make genuine progress toward that base case, or it never
terminates.

```python
def factorial(n):
    if n <= 1:              # base case
        return 1
    return n * factorial(n - 1)   # recursive case: smaller problem

print(factorial(5))   # 120
```

## Key points

- Every recursive function needs a base case (or several) that returns
  directly, without recursing further.
- Each recursive call should work on a strictly smaller version of the
  problem -- otherwise it never reaches the base case.
- Deep recursion has a real cost (Python's default recursion limit is
  ~1000) -- an equivalent loop is sometimes the more practical choice.
$py$ where id = '10000000-0000-0000-0000-000000000065';
update concepts set lesson_content = $py$A stack is LIFO (last in, first out) -- think a stack of plates. A
queue is FIFO (first in, first out) -- think a checkout line. Python
lists work fine as stacks (`.append`/`.pop`); for a proper efficient
queue, `collections.deque` is the right tool (`list.pop(0)` is O(n)).

```python
stack = []
stack.append(1)
stack.append(2)
print(stack.pop())   # 2 -- last one in, first one out

from collections import deque
queue = deque()
queue.append(1)
queue.append(2)
print(queue.popleft())   # 1 -- first one in, first one out
```

## Key points

- Stacks are the natural fit for anything "undo"-shaped, or matching
  nested structure (parentheses, function call frames).
- Queues fit anything processed in arrival order -- task queues, BFS traversal.
- A queue can be built from two stacks (a classic exercise) -- useful
  for understanding *why* the two structures behave differently.
$py$ where id = '10000000-0000-0000-0000-000000000066';
update concepts set lesson_content = $py$A tree is a graph with no cycles and one root -- each node connects to
its children, with no way back up except by returning from recursion.
A graph relaxes that: any node can connect to any other, including
cycles.

```python
class Node:
    def __init__(self, value, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right

def max_depth(node):
    if node is None:
        return 0
    return 1 + max(max_depth(node.left), max_depth(node.right))
```

Graphs are commonly represented as an adjacency list -- a dict mapping
each node to a list of its neighbors -- and explored with breadth-first
search (BFS, level by level) or depth-first search (DFS, all the way
down one path before backtracking).

## Key points

- Tree algorithms are almost always naturally recursive -- "the answer
  for this node depends on the answer for its children."
- BFS finds the *shortest* path in an unweighted graph; DFS doesn't
  guarantee that, but uses less memory for deep graphs.
- A `visited` set is essential for graph traversal -- without one, a
  cycle sends you into an infinite loop.
$py$ where id = '10000000-0000-0000-0000-000000000067';
update concepts set lesson_content = $py$A heap keeps the smallest (or largest) item quickly accessible without
fully sorting everything -- insert and remove-min are both O(log n).
Python's `heapq` module turns a plain list into a min-heap.

```python
import heapq

scores = [5, 1, 9, 3, 7]
heapq.heapify(scores)          # reorders in place into heap order
print(heapq.heappop(scores))    # 1 -- always the smallest

top_3 = heapq.nlargest(3, [5, 1, 9, 3, 7])
print(top_3)                     # [9, 7, 5]
```

## Key points

- `heapq` is always a *min*-heap -- for a max-heap, negate values on the
  way in and out, or just use `heapq.nlargest`.
- `nlargest(k, iterable)`/`nsmallest(k, iterable)` are the direct tools
  for "top-k" problems -- more efficient than sorting the whole thing.
- A heap is the right structure whenever you need repeated
  insert/remove-min, and don't need the rest of the data sorted.
$py$ where id = '10000000-0000-0000-0000-000000000068';
update concepts set lesson_content = $py$Two pointers walking through a sequence (from both ends, or one
trailing the other) often turn an O(n^2) brute-force scan into O(n). A
sliding window is the same idea specialized to "a contiguous chunk of a
fixed or growing/shrinking size."

```python
def has_pair_with_sum(sorted_nums, target):
    left, right = 0, len(sorted_nums) - 1
    while left < right:
        total = sorted_nums[left] + sorted_nums[right]
        if total == target:
            return True
        elif total < target:
            left += 1
        else:
            right -= 1
    return False
```

## Key points

- Two pointers typically need a *sorted* input to know which direction
  to move each pointer.
- A sliding window keeps a running result as it expands/contracts,
  instead of recomputing everything for every position from scratch.
- Both techniques get an O(n^2) or worse brute-force solution down to O(n).
$py$ where id = '10000000-0000-0000-0000-000000000069';
update concepts set lesson_content = $py$The habit that matters most in an interview (and in real debugging)
isn't knowing every algorithm -- it's a repeatable process: clarify the
problem, state an approach and its complexity, code it, then test it
against edge cases, narrating each step out loud.

```
1. Clarify: "Can the input be empty? Are there duplicates? Negative numbers?"
2. Approach: "I'll use a hash set for O(1) lookups, giving O(n) overall."
3. Code: (write it)
4. Test: empty input, single item, all duplicates, the given example
```

## Key points

- Clarifying constraints *before* coding avoids building the wrong
  solution to a subtly different problem than the one actually asked.
- Always state the complexity of your approach out loud -- it shows
  you're thinking about tradeoffs, not just getting to *an* answer.
- Test edge cases explicitly (empty, single item, all-same) even if the
  main example already passes.
$py$ where id = '10000000-0000-0000-0000-000000000070';
update concepts set lesson_content = $py$A scope doc forces you to write down the problem, who it's for, what's
actually in v1, and -- just as important -- what's explicitly *not* in
v1. Skipping this step is how projects balloon in the middle of
building them.

```python
scope = {
    "problem": "Track personal Python learning progress",
    "users": ["me"],
    "features": ["roadmap", "playground", "flashcards"],
    "non_goals": ["multi-user support", "mobile app"],
}
```

## Key points

- Explicit non-goals are as valuable as the goals -- they're what you
  point to later when someone (often yourself) suggests scope creep.
- A feature list you can actually finish beats an ambitious one you can't.
- Effort estimates are wrong less often when they're broken into small
  pieces instead of one big guess.
$py$ where id = '10000000-0000-0000-0000-000000000071';
update concepts set lesson_content = $py$A quick architecture sketch -- even ASCII boxes and arrows -- forces
you to name the pieces and how they depend on each other *before* code
makes those decisions expensive to change. Dependencies between
components form a graph, and that graph needs to be acyclic (a cycle
means "A needs B which needs A," which usually signals a design
problem).

```python
architecture = {
    "web_app": ["api", "database"],
    "api": ["database"],
    "database": [],
}
```

## Key points

- An Architecture Decision Record (ADR) captures a decision, its
  context, and its consequences -- so future-you knows *why*, not just *what*.
- A dependency graph with a cycle can't be built in any single valid
  order -- that's exactly what topological sort detects and resolves.
- "Which component does this belong in?" is worth asking before writing
  code, not after it's already tangled into the wrong place.
$py$ where id = '10000000-0000-0000-0000-000000000072';
update concepts set lesson_content = $py$CI (continuous integration) runs your test suite automatically on
every push; CD (continuous deployment/delivery) automatically ships
changes that pass. Coverage measures what fraction of your code those
tests actually exercise -- a useful signal, though 100% coverage
doesn't guarantee correctness.

```yaml
# A typical CI pipeline, as a sequence of steps:
steps:
  - lint
  - test
  - build
  - deploy
```

## Key points

- High coverage on code nobody runs in production is much less
  valuable than moderate coverage on your riskiest, most-used logic.
- A CI pipeline should fail fast -- lint and unit tests before the
  slower build/deploy steps, not after.
- CD without solid tests just means shipping bugs to production
  automatically instead of manually.
$py$ where id = '10000000-0000-0000-0000-000000000073';
update concepts set lesson_content = $py$Deploying is only half the job -- you need to know when something's
actually wrong afterward. A health check endpoint reports whether a
service is functioning; alerting rules decide when a metric crossing a
line should page someone (and when it's just noise).

```python
def health_check(db_ok, cache_ok):
    return {"status": "healthy"} if db_ok and cache_ok else {"status": "unhealthy"}

print(health_check(True, True))    # {'status': 'healthy'}
print(health_check(True, False))   # {'status': 'unhealthy'}
```

## Key points

- A health check should verify the things that actually matter for the
  service to function (its database connection, critical dependencies) --
  not just "the process is running."
- Alerting on a single noisy blip causes alert fatigue; requiring a
  metric to stay bad for a few consecutive checks avoids crying wolf.
- Rolling deployments update instances in small batches so a bad
  release only affects part of your traffic at any moment.
$py$ where id = '10000000-0000-0000-0000-000000000074';
update concepts set lesson_content = $py$A capstone isn't finished until someone else (including future-you) can
understand it without asking you directly -- that's what a README, a
demo, and a written retrospective are for.

```markdown
## Installation
pip install -e .

## Usage
python -m myproject --help

## Retrospective
- Went well: the test suite caught 3 real bugs before deploy
- To improve: I'd design the data model before writing any code next time
```

## Key points

- A README's job is letting a stranger go from zero to running your
  project -- installation and usage are the two sections that matter most.
- A retrospective is honest specifically about what you'd change --
  "everything went great" teaches you (and readers) nothing.
- Writing things down forces clarity that stays in your head otherwise -- if you
  can't explain a decision in a sentence, it might not be as settled as it feels.
$py$ where id = '10000000-0000-0000-0000-000000000075';

insert into challenges (phase_id, concept_id, order_index, title, difficulty, prompt, hint, starter_code, test_code) values
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', 1, 'Type Detective', 'easy', 'Write what_type(value) that returns the name of value''s type as a string (e.g. "int", "str").', 'type(value).__name__ gives you the type''s name as a string.', $py$def what_type(value):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 4
_call_desc = 'what_type(5)'
_actual = what_type(5)
_expected = "int"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'what_type("hi")'
_actual = what_type("hi")
_expected = "str"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'what_type(3.14)'
_actual = what_type(3.14)
_expected = "float"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'what_type(True)'
_actual = what_type(True)
_expected = "bool"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', 2, 'Swap Values', 'easy', 'Write swap(a, b) that returns a and b in reversed order as a tuple (b, a), without using a temporary variable.', 'Python lets you return multiple values as a tuple directly: return b, a.', $py$def swap(a, b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'swap(1, 2)'
_actual = swap(1, 2)
_expected = (2, 1)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'swap("x", "y")'
_actual = swap("x", "y")
_expected = ("y", "x")
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', 3, 'Same Value, Different Type', 'medium', 'Write to_int_if_possible(value) that returns int(value) if that conversion works, otherwise returns value unchanged.', 'Wrap the conversion in try/except, catching both ValueError and TypeError.', $py$def to_int_if_possible(value):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 4
_call_desc = 'to_int_if_possible("42")'
_actual = to_int_if_possible("42")
_expected = 42
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'to_int_if_possible("abc")'
_actual = to_int_if_possible("abc")
_expected = "abc"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'to_int_if_possible(3.9)'
_actual = to_int_if_possible(3.9)
_expected = 3
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'to_int_if_possible(None)'
_actual = to_int_if_possible(None)
_expected = None
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', 4, 'Running Total With Reassignment', 'medium', 'Write running_total(numbers) that starts a variable at 0 and reassigns it as it adds each number, returning the final total.', 'total = 0, then for each n in numbers: total = total + n.', $py$def running_total(numbers):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 4
_call_desc = 'running_total([1, 2, 3])'
_actual = running_total([1, 2, 3])
_expected = 6
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'running_total([])'
_actual = running_total([])
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'running_total([10])'
_actual = running_total([10])
_expected = 10
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'running_total([-1, -2])'
_actual = running_total([-1, -2])
_expected = -3
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000002', 1, 'Multi-Line Banner', 'easy', 'Write banner(text) that returns text surrounded above and below by a line of dashes the same length as text, joined with newlines.', '''-'' * len(text) makes a dash line as long as text; join three lines with ''\n''.join([...]).', $py$def banner(text):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'banner("Hi")'
_actual = banner("Hi")
_expected = '--\nHi\n--'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'banner("Python")'
_actual = banner("Python")
_expected = '------\nPython\n------'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000002', 2, 'Custom Separator Join', 'easy', 'Write join_with(words, separator) that returns the words joined together using separator between each one -- like print()''s sep, but returned as a string instead of printed.', 'separator.join(words) does exactly this.', $py$def join_with(words, separator):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'join_with(["a", "b", "c"], "-")'
_actual = join_with(["a", "b", "c"], "-")
_expected = 'a-b-c'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'join_with(["x", "y"], ", ")'
_actual = join_with(["x", "y"], ", ")
_expected = 'x, y'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000002', 3, 'Strip Comments', 'medium', 'Write strip_comment(line) that removes everything from the first ''#'' onward in a line of code, then strips trailing whitespace. A line with no ''#'' is returned unchanged (still stripped).', 'Use line.split(''#'', 1)[0] to keep only the part before the first ''#'', then .rstrip().', $py$def strip_comment(line):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'strip_comment("x = 1  # set x")'
_actual = strip_comment("x = 1  # set x")
_expected = 'x = 1'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'strip_comment("y = 2")'
_actual = strip_comment("y = 2")
_expected = 'y = 2'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'strip_comment("# just a comment")'
_actual = strip_comment("# just a comment")
_expected = ''
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000002', 4, 'Line Counter (No Comments)', 'medium', 'Write count_code_lines(lines) that returns how many entries in the list lines are actual code -- not blank, and not starting with ''#'' (ignoring leading whitespace).', 'A line counts if line.strip() is non-empty and doesn''t start with ''#''.', $py$def count_code_lines(lines):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'count_code_lines(["x = 1", "# comment", "", "y = 2"])'
_actual = count_code_lines(["x = 1", "# comment", "", "y = 2"])
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'count_code_lines(["# only comments", "  # indented"])'
_actual = count_code_lines(["# only comments", "  # indented"])
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000003', 1, 'Tip Split', 'easy', 'Write split_bill(total, people) that returns each person''s share of total, evenly split, rounded to 2 decimal places.', 'round(total / people, 2).', $py$def split_bill(total, people):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'split_bill(30, 3)'
_actual = split_bill(30, 3)
_expected = 10.0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'split_bill(50, 4)'
_actual = split_bill(50, 4)
_expected = 12.5
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'split_bill(10, 3)'
_actual = split_bill(10, 3)
_expected = 3.33
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000003', 2, 'Is It Even?', 'easy', 'Write is_even(n) that returns True if n is even, False otherwise, using the modulo operator.', 'n % 2 == 0 is True exactly when n is even.', $py$def is_even(n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 4
_call_desc = 'is_even(4)'
_actual = is_even(4)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_even(7)'
_actual = is_even(7)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_even(0)'
_actual = is_even(0)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_even(-3)'
_actual = is_even(-3)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000003', 3, 'Digits and Remainder', 'medium', 'Write hours_and_minutes(total_minutes) that returns a tuple (hours, minutes) representing total_minutes broken into whole hours and the leftover minutes.', 'Floor division gives the hours, modulo gives what''s left over.', $py$def hours_and_minutes(total_minutes):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'hours_and_minutes(90)'
_actual = hours_and_minutes(90)
_expected = (1, 30)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'hours_and_minutes(45)'
_actual = hours_and_minutes(45)
_expected = (0, 45)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'hours_and_minutes(125)'
_actual = hours_and_minutes(125)
_expected = (2, 5)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000003', 4, 'Compound Interest', 'medium', 'Write compound_interest(principal, rate, years) that returns principal grown by rate (as a decimal, e.g. 0.05 for 5%) compounded once per year for years years, rounded to 2 decimals.', 'The formula is principal * (1 + rate) ** years.', $py$def compound_interest(principal, rate, years):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'compound_interest(1000, 0.05, 2)'
_actual = compound_interest(1000, 0.05, 2)
_expected = 1102.5
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'compound_interest(100, 0.1, 1)'
_actual = compound_interest(100, 0.1, 1)
_expected = 110.0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000004', 1, 'Initials Extractor', 'easy', 'Write initials(first, last) that returns the first letters of first and last, uppercased, joined with a period, like ''A.L''.', 'Index [0] gets the first character; .upper() uppercases it.', $py$def initials(first, last):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'initials("ada", "lovelace")'
_actual = initials("ada", "lovelace")
_expected = 'A.L'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'initials("Grace", "hopper")'
_actual = initials("Grace", "hopper")
_expected = 'G.H'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000004', 2, 'Reverse a String', 'easy', 'Write reverse(s) that returns s reversed, using slicing (no loops, no reversed()).', 's[::-1] steps backward through the whole string.', $py$def reverse(s):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'reverse("hello")'
_actual = reverse("hello")
_expected = 'olleh'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'reverse("")'
_actual = reverse("")
_expected = ''
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'reverse("a")'
_actual = reverse("a")
_expected = 'a'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000004', 3, 'Middle Slice', 'medium', 'Write middle(s) that returns the middle third of s using slicing (length divided by 3, rounded down, for each third).', 'Compute third = len(s) // 3, then slice s[third:third*2].', $py$def middle(s):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'middle("abcdefghi")'
_actual = middle("abcdefghi")
_expected = 'def'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'middle("123456")'
_actual = middle("123456")
_expected = '34'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000004', 4, 'Is Palindrome', 'medium', 'Write is_palindrome(s) that returns True if s reads the same forwards and backwards.', 'Compare s to its reverse: s == s[::-1].', $py$def is_palindrome(s):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'is_palindrome("racecar")'
_actual = is_palindrome("racecar")
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_palindrome("hello")'
_actual = is_palindrome("hello")
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_palindrome("")'
_actual = is_palindrome("")
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000005', 1, 'Normalize Whitespace', 'easy', 'Write normalize(s) that strips leading/trailing whitespace and lowercases s.', 'Chain .strip() and .lower().', $py$def normalize(s):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'normalize("  HELLO  ")'
_actual = normalize("  HELLO  ")
_expected = 'hello'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'normalize("Already Fine")'
_actual = normalize("Already Fine")
_expected = 'already fine'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000005', 2, 'Word Count', 'easy', 'Write word_count(sentence) that returns how many words are in sentence, splitting on whitespace.', 'len(sentence.split()) -- split() with no arguments handles any run of whitespace.', $py$def word_count(sentence):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'word_count("the quick brown fox")'
_actual = word_count("the quick brown fox")
_expected = 4
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'word_count("  extra   spaces  ")'
_actual = word_count("  extra   spaces  ")
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'word_count("")'
_actual = word_count("")
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000005', 3, 'Title Case Names', 'medium', 'Write format_name(full_name) that takes a lowercase, comma-separated ''last, first'' string and returns ''First Last'' with both parts capitalized.', 'Split on '', '', then use .capitalize() on each part and rebuild in first-last order.', $py$def format_name(full_name):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'format_name("lovelace, ada")'
_actual = format_name("lovelace, ada")
_expected = 'Ada Lovelace'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'format_name("hopper, grace")'
_actual = format_name("hopper, grace")
_expected = 'Grace Hopper'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000005', 4, 'Redact Word', 'medium', 'Write redact(text, word) that replaces every occurrence of word in text with asterisks of the same length, case-sensitively.', 'text.replace(word, ''*'' * len(word)).', $py$def redact(text, word):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'redact("the secret code is secret", "secret")'
_actual = redact("the secret code is secret", "secret")
_expected = 'the ****** code is ******'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'redact("hello world", "world")'
_actual = redact("hello world", "world")
_expected = 'hello *****'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000006', 1, 'Receipt Line', 'easy', 'Write format_line(item, price) that returns a string like ''Coffee: $3.50'' using an f-string with two decimal places.', 'Use a format spec of :.2f inside the f-string braces.', $py$def format_line(item, price):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'format_line("Coffee", 3.5)'
_actual = format_line("Coffee", 3.5)
_expected = 'Coffee: $3.50'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'format_line("Tea", 2)'
_actual = format_line("Tea", 2)
_expected = 'Tea: $2.00'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000006', 2, 'Padded Table Row', 'easy', 'Write padded_row(name, score) that returns name left-padded to width 10 followed by score, right-aligned to width 5, using format specs.', 'Use :<10 for left-align and :>5 for right-align inside the f-string.', $py$def padded_row(name, score):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'padded_row("Ada", 95)'
_actual = padded_row("Ada", 95)
_expected = 'Ada          95'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'padded_row("Bo", 7)'
_actual = padded_row("Bo", 7)
_expected = 'Bo            7'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000006', 3, 'Percentage Formatter', 'medium', 'Write format_percentage(fraction) that returns fraction (a value like 0.4567) formatted as a percentage string with one decimal place, like ''45.7%''.', 'The :.1% format spec multiplies by 100, rounds to 1 decimal, and appends a percent sign automatically.', $py$def format_percentage(fraction):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'format_percentage(0.4567)'
_actual = format_percentage(0.4567)
_expected = '45.7%'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'format_percentage(1)'
_actual = format_percentage(1)
_expected = '100.0%'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'format_percentage(0)'
_actual = format_percentage(0)
_expected = '0.0%'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000006', 4, 'Debug Repr', 'medium', 'Write debug_repr(label, value) that returns a string like "label = ''text''" for strings (showing quotes via !r) but "label = 42" for non-strings (no quotes).', 'Use f"{label} = {value!r}" -- !r calls repr(), which already adds quotes around strings and leaves numbers as-is.', $py$def debug_repr(label, value):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'debug_repr("name", "Ada")'
_actual = debug_repr("name", "Ada")
_expected = "name = 'Ada'"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'debug_repr("age", 36)'
_actual = debug_repr("age", 36)
_expected = 'age = 36'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000007', 1, 'Access Checker', 'easy', 'Write can_access(age, is_member) that returns True only if age is at least 18 AND is_member is True.', 'age >= 18 and is_member.', $py$def can_access(age, is_member):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'can_access(20, True)'
_actual = can_access(20, True)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'can_access(20, False)'
_actual = can_access(20, False)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'can_access(15, True)'
_actual = can_access(15, True)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000007', 2, 'In Range', 'easy', 'Write in_range(x, low, high) that returns True if x is between low and high inclusive, using a chained comparison.', 'low <= x <= high works directly as one expression.', $py$def in_range(x, low, high):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'in_range(5, 1, 10)'
_actual = in_range(5, 1, 10)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'in_range(0, 1, 10)'
_actual = in_range(0, 1, 10)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'in_range(10, 1, 10)'
_actual = in_range(10, 1, 10)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000007', 3, 'First Truthy', 'medium', 'Write first_truthy(a, b) that returns a if it''s truthy, otherwise returns b -- without using if/else.', 'or naturally returns its first truthy operand, or the last one if both are falsy: a or b.', $py$def first_truthy(a, b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'first_truthy("", "default")'
_actual = first_truthy("", "default")
_expected = 'default'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'first_truthy("value", "default")'
_actual = first_truthy("value", "default")
_expected = 'value'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'first_truthy(0, 5)'
_actual = first_truthy(0, 5)
_expected = 5
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000007', 4, 'Exactly One', 'medium', 'Write exactly_one(a, b) that returns True if exactly one of a and b is True (not both, not neither).', 'This is the definition of XOR: (a or b) and not (a and b).', $py$def exactly_one(a, b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'exactly_one(True, False)'
_actual = exactly_one(True, False)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'exactly_one(True, True)'
_actual = exactly_one(True, True)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'exactly_one(False, False)'
_actual = exactly_one(False, False)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000008', 1, 'Parse Age Input', 'easy', 'Write parse_age(raw) that takes a string like input() would return and returns it converted to an int.', 'int(raw) converts a numeric string to an int.', $py$def parse_age(raw):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'parse_age("25")'
_actual = parse_age("25")
_expected = 25
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'parse_age("0")'
_actual = parse_age("0")
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000008', 2, 'Greeting Builder', 'easy', 'Write build_greeting(name) that mimics what you''d print after reading name from input() -- return ''Hello, <name>! Welcome.''', 'An f-string with name inserted does this directly.', $py$def build_greeting(name):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'build_greeting("Ada")'
_actual = build_greeting("Ada")
_expected = 'Hello, Ada! Welcome.'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'build_greeting("Bo")'
_actual = build_greeting("Bo")
_expected = 'Hello, Bo! Welcome.'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000008', 3, 'Yes/No Parser', 'medium', 'Write parse_yes_no(raw) that returns True for ''y'' or ''yes'' (any case), False for ''n'' or ''no'' (any case), and None for anything else.', 'Normalize with raw.strip().lower() first, then compare against the two sets of accepted words.', $py$def parse_yes_no(raw):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'parse_yes_no("Y")'
_actual = parse_yes_no("Y")
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'parse_yes_no(" no ")'
_actual = parse_yes_no(" no ")
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'parse_yes_no("maybe")'
_actual = parse_yes_no("maybe")
_expected = None
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000008', 4, 'Menu Choice Validator', 'medium', 'Write valid_choice(raw, options) that parses raw as an int and returns True if that number is a valid 1-based index into options, False otherwise (including if raw isn''t a number at all).', 'Try int(raw) in a try/except, then check 1 <= n <= len(options).', $py$def valid_choice(raw, options):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'valid_choice("2", ["a", "b", "c"])'
_actual = valid_choice("2", ["a", "b", "c"])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'valid_choice("5", ["a", "b", "c"])'
_actual = valid_choice("5", ["a", "b", "c"])
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'valid_choice("x", ["a", "b"])'
_actual = valid_choice("x", ["a", "b"])
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000009', 1, 'Grade Converter', 'easy', 'Write letter_grade(score) that returns ''A'' for 90+, ''B'' for 80-89, ''C'' for 70-79, and ''F'' below that.', 'Check from the highest threshold down using if/elif/else.', $py$def letter_grade(score):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 4
_call_desc = 'letter_grade(95)'
_actual = letter_grade(95)
_expected = 'A'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'letter_grade(82)'
_actual = letter_grade(82)
_expected = 'B'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'letter_grade(71)'
_actual = letter_grade(71)
_expected = 'C'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'letter_grade(50)'
_actual = letter_grade(50)
_expected = 'F'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000009', 2, 'FizzBuzz One Number', 'easy', 'Write fizzbuzz_one(n) that returns ''Fizz'' if n is divisible by 3, ''Buzz'' if by 5, ''FizzBuzz'' if by both, else str(n).', 'Check divisibility by 15 (both) before checking 3 or 5 alone.', $py$def fizzbuzz_one(n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 4
_call_desc = 'fizzbuzz_one(15)'
_actual = fizzbuzz_one(15)
_expected = 'FizzBuzz'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'fizzbuzz_one(9)'
_actual = fizzbuzz_one(9)
_expected = 'Fizz'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'fizzbuzz_one(10)'
_actual = fizzbuzz_one(10)
_expected = 'Buzz'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'fizzbuzz_one(7)'
_actual = fizzbuzz_one(7)
_expected = '7'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000009', 3, 'Triangle Classifier', 'medium', 'Write triangle_type(a, b, c) that returns ''equilateral'' if all three sides are equal, ''isosceles'' if exactly two are equal, and ''scalene'' if none are.', 'Check the all-equal case first, then whether any pair matches.', $py$def triangle_type(a, b, c):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'triangle_type(5, 5, 5)'
_actual = triangle_type(5, 5, 5)
_expected = 'equilateral'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'triangle_type(5, 5, 3)'
_actual = triangle_type(5, 5, 3)
_expected = 'isosceles'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'triangle_type(3, 4, 5)'
_actual = triangle_type(3, 4, 5)
_expected = 'scalene'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000009', 4, 'Leap Year Check', 'medium', 'Write is_leap_year(year) that returns True if year is a leap year: divisible by 4, but not by 100 unless also divisible by 400.', 'if year % 4 != 0: not leap. elif year % 100 != 0: leap. else: leap only if year % 400 == 0.', $py$def is_leap_year(year):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 4
_call_desc = 'is_leap_year(2000)'
_actual = is_leap_year(2000)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_leap_year(1900)'
_actual = is_leap_year(1900)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_leap_year(2024)'
_actual = is_leap_year(2024)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_leap_year(2023)'
_actual = is_leap_year(2023)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000010', 1, 'Countdown List', 'easy', 'Write countdown(n) that returns a list counting down from n to 1 (inclusive), built with a while loop.', 'Start a result list and an index at n; while index > 0, append it and decrement.', $py$def countdown(n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'countdown(5)'
_actual = countdown(5)
_expected = [5, 4, 3, 2, 1]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'countdown(1)'
_actual = countdown(1)
_expected = [1]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'countdown(0)'
_actual = countdown(0)
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000010', 2, 'Digit Sum Iterations', 'easy', 'Write digital_root(n) that repeatedly sums n''s digits with a while loop until the result is a single digit, then returns it.', 'While n >= 10: n = sum of int(d) for d in str(n).', $py$def digital_root(n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'digital_root(9999)'
_actual = digital_root(9999)
_expected = 9
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'digital_root(38)'
_actual = digital_root(38)
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'digital_root(5)'
_actual = digital_root(5)
_expected = 5
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000010', 3, 'Collatz Steps', 'medium', 'Write collatz_steps(n) that returns how many steps it takes for the Collatz sequence (n -> n/2 if even, else 3n+1) to reach 1.', 'Loop while n != 1, applying the rule and counting steps each time.', $py$def collatz_steps(n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'collatz_steps(1)'
_actual = collatz_steps(1)
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'collatz_steps(6)'
_actual = collatz_steps(6)
_expected = 8
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'collatz_steps(27)'
_actual = collatz_steps(27)
_expected = 111
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000010', 4, 'First Power Of Two Over', 'medium', 'Write first_power_of_two_over(limit) that returns the smallest power of two strictly greater than limit.', 'Start power = 1, and while power <= limit: power *= 2.', $py$def first_power_of_two_over(limit):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'first_power_of_two_over(10)'
_actual = first_power_of_two_over(10)
_expected = 16
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'first_power_of_two_over(1)'
_actual = first_power_of_two_over(1)
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'first_power_of_two_over(100)'
_actual = first_power_of_two_over(100)
_expected = 128
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000011', 1, 'Multiplication Table Row', 'easy', 'Write times_table(n, up_to) that returns a list of n * i for i from 1 to up_to inclusive.', 'for i in range(1, up_to + 1): append n * i.', $py$def times_table(n, up_to):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'times_table(3, 5)'
_actual = times_table(3, 5)
_expected = [3, 6, 9, 12, 15]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'times_table(7, 3)'
_actual = times_table(7, 3)
_expected = [7, 14, 21]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000011', 2, 'Sum of Evens', 'easy', 'Write sum_of_evens(n) that returns the sum of all even numbers from 0 to n inclusive, using a for loop with a step of 2.', 'range(0, n + 1, 2) already only visits even numbers.', $py$def sum_of_evens(n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'sum_of_evens(10)'
_actual = sum_of_evens(10)
_expected = 30
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'sum_of_evens(1)'
_actual = sum_of_evens(1)
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'sum_of_evens(0)'
_actual = sum_of_evens(0)
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000011', 3, 'Enumerate Positions', 'medium', 'Write positions_of(items, target) that returns a list of every index where target appears in items, using enumerate.', 'for i, item in enumerate(items): if item == target: collect i.', $py$def positions_of(items, target):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'positions_of(["a", "b", "a", "c"], "a")'
_actual = positions_of(["a", "b", "a", "c"], "a")
_expected = [0, 2]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'positions_of([1, 2, 3], 5)'
_actual = positions_of([1, 2, 3], 5)
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000011', 4, 'FizzBuzz Range', 'medium', 'Write fizzbuzz_range(n) that returns a list of FizzBuzz strings for 1 through n, using a for loop over range.', 'Reuse the same Fizz/Buzz/FizzBuzz logic as before, inside a loop building a list.', $py$def fizzbuzz_range(n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'fizzbuzz_range(5)'
_actual = fizzbuzz_range(5)
_expected = ['1', '2', 'Fizz', '4', 'Buzz']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'fizzbuzz_range(3)'
_actual = fizzbuzz_range(3)
_expected = ['1', '2', 'Fizz']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000012', 1, 'Unit Converter Functions', 'easy', 'Write celsius_to_fahrenheit(c) that returns c converted to Fahrenheit using c * 9/5 + 32.', 'Just implement the formula directly and return it.', $py$def celsius_to_fahrenheit(c):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'celsius_to_fahrenheit(0)'
_actual = celsius_to_fahrenheit(0)
_expected = 32.0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'celsius_to_fahrenheit(100)'
_actual = celsius_to_fahrenheit(100)
_expected = 212.0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'celsius_to_fahrenheit(-40)'
_actual = celsius_to_fahrenheit(-40)
_expected = -40.0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000012', 2, 'Default Greeting', 'easy', 'Write greet(name, greeting=''Hello'') that returns f''{greeting}, {name}!'', using greeting''s default when not provided.', 'Define the parameter as greeting=''Hello'' directly in the signature.', $py$def greet(name, greeting='Hello'):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'greet("Ada")'
_actual = greet("Ada")
_expected = 'Hello, Ada!'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'greet("Bo", "Hey")'
_actual = greet("Bo", "Hey")
_expected = 'Hey, Bo!'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000012', 3, 'Multiple Return Values', 'medium', 'Write min_max(numbers) that returns a tuple (minimum, maximum) of the values in numbers.', 'Python lets a function return multiple values as a tuple: return min(numbers), max(numbers).', $py$def min_max(numbers):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'min_max([3, 1, 4, 1, 5])'
_actual = min_max([3, 1, 4, 1, 5])
_expected = (1, 5)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'min_max([7])'
_actual = min_max([7])
_expected = (7, 7)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000012', 4, 'Function As Argument', 'medium', 'Write apply_twice(func, value) that calls func on value, then calls func again on that result, and returns the final value.', 'return func(func(value)) -- functions are values too, so you can pass them around and call them.', $py$def apply_twice(func, value):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'apply_twice(lambda x: x + 3, 10)'
_actual = apply_twice(lambda x: x + 3, 10)
_expected = 16
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'apply_twice(lambda x: x * 2, 5)'
_actual = apply_twice(lambda x: x * 2, 5)
_expected = 20
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000013', 1, 'Local Shadowing', 'easy', 'Write shadow_demo(x) that creates a local variable named x set to x + 1 and returns it, without affecting anything outside the function (this is naturally true -- just implement it).', 'Parameters are already local; just reassign x = x + 1 and return it.', $py$def shadow_demo(x):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'shadow_demo(5)'
_actual = shadow_demo(5)
_expected = 6
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'shadow_demo(0)'
_actual = shadow_demo(0)
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000013', 2, 'Score Tracker (Closure-Free)', 'easy', 'Write add_score(scores, new_score) that appends new_score to the scores list and returns the updated list (mutating a list passed in doesn''t need ''global'').', 'Lists are mutated in place with .append(); no global needed since you''re not reassigning the name scores itself.', $py$def add_score(scores, new_score):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'add_score([1, 2], 3)'
_actual = add_score([1, 2], 3)
_expected = [1, 2, 3]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'add_score([], 10)'
_actual = add_score([], 10)
_expected = [10]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000013', 3, 'Global Counter', 'medium', 'A module-level variable `counter` starts at 0. Write increment_counter() that uses the global keyword to increase counter by 1 each call and returns the new value.', 'Declare global counter inside the function before modifying it.', $py$counter = 0

def increment_counter():
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'increment_counter()'
_actual = increment_counter()
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'increment_counter()'
_actual = increment_counter()
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'increment_counter()'
_actual = increment_counter()
_expected = 3
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000013', 4, 'Function-Local Accumulator', 'medium', 'Write sum_of_squares(numbers) that uses a local variable total (not global) to accumulate the sum of each number squared, returning the total.', 'total = 0 inside the function, then total += n ** 2 in a loop.', $py$def sum_of_squares(numbers):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'sum_of_squares([1, 2, 3])'
_actual = sum_of_squares([1, 2, 3])
_expected = 14
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'sum_of_squares([])'
_actual = sum_of_squares([])
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'sum_of_squares([5])'
_actual = sum_of_squares([5])
_expected = 25
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000014', 1, 'Safe Input Parser', 'easy', 'Write safe_int(raw) that returns int(raw), or None if raw can''t be converted to an int.', 'Wrap int(raw) in try/except ValueError.', $py$def safe_int(raw):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'safe_int("42")'
_actual = safe_int("42")
_expected = 42
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'safe_int("abc")'
_actual = safe_int("abc")
_expected = None
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'safe_int("-7")'
_actual = safe_int("-7")
_expected = -7
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000014', 2, 'Safe List Access', 'easy', 'Write safe_get(items, index) that returns items[index], or None if that index is out of range.', 'Catch IndexError around the access.', $py$def safe_get(items, index):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'safe_get([1, 2, 3], 1)'
_actual = safe_get([1, 2, 3], 1)
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'safe_get([1, 2, 3], 10)'
_actual = safe_get([1, 2, 3], 10)
_expected = None
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000014', 3, 'Multi-Exception Handler', 'medium', 'Write safe_average(numbers) that returns the average of numbers, or None if numbers is empty (ZeroDivisionError) or contains a non-number (TypeError).', 'Catch (ZeroDivisionError, TypeError) in one except clause around sum(numbers) / len(numbers).', $py$def safe_average(numbers):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'safe_average([2, 4, 6])'
_actual = safe_average([2, 4, 6])
_expected = 4.0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'safe_average([])'
_actual = safe_average([])
_expected = None
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'safe_average([1, "x"])'
_actual = safe_average([1, "x"])
_expected = None
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000014', 4, 'Retry Budget', 'medium', 'Write parse_first_valid(values) that returns the first value in values that int() can successfully parse, skipping ones that raise ValueError, or None if none work.', 'Loop over values, try int(v) inside a try/except ValueError, continuing on failure and returning on success.', $py$def parse_first_valid(values):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'parse_first_valid(["abc", "12", "34"])'
_actual = parse_first_valid(["abc", "12", "34"])
_expected = 12
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'parse_first_valid(["x", "y"])'
_actual = parse_first_valid(["x", "y"])
_expected = None
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000015', 1, 'Shopping List Manager', 'easy', 'Write update_item(items, index, new_value) that replaces items[index] with new_value and returns the updated list.', 'Assign directly to items[index], then return items.', $py$def update_item(items, index, new_value):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'update_item(["milk", "eggs"], 1, "cheese")'
_actual = update_item(["milk", "eggs"], 1, "cheese")
_expected = ['milk', 'cheese']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'update_item([1, 2, 3], 0, 9)'
_actual = update_item([1, 2, 3], 0, 9)
_expected = [9, 2, 3]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000015', 2, 'Last Item Safely', 'easy', 'Write last_item(items) that returns the last item in items, or None if items is empty.', 'Check length first, then use items[-1].', $py$def last_item(items):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'last_item([1, 2, 3])'
_actual = last_item([1, 2, 3])
_expected = 3
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'last_item([])'
_actual = last_item([])
_expected = None
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'last_item(["only"])'
_actual = last_item(["only"])
_expected = 'only'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000015', 3, 'Insert At Position', 'medium', 'Write insert_sorted_int(items, value) that inserts value into items (a list of ints already sorted ascending) at the position that keeps it sorted, and returns the list.', 'Walk items to find the first index where items[i] > value, then use items.insert(i, value); if none found, append.', $py$def insert_sorted_int(items, value):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'insert_sorted_int([1, 3, 5], 4)'
_actual = insert_sorted_int([1, 3, 5], 4)
_expected = [1, 3, 4, 5]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'insert_sorted_int([1, 3, 5], 0)'
_actual = insert_sorted_int([1, 3, 5], 0)
_expected = [0, 1, 3, 5]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'insert_sorted_int([1, 3, 5], 9)'
_actual = insert_sorted_int([1, 3, 5], 9)
_expected = [1, 3, 5, 9]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000015', 4, 'In-Place Doubler', 'medium', 'Write double_in_place(numbers) that mutates numbers so every element is doubled (by index assignment, not by building a new list), and returns it.', 'Loop over range(len(numbers)) and assign numbers[i] = numbers[i] * 2.', $py$def double_in_place(numbers):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'double_in_place([1, 2, 3])'
_actual = double_in_place([1, 2, 3])
_expected = [2, 4, 6]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'double_in_place([])'
_actual = double_in_place([])
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'double_in_place([5])'
_actual = double_in_place([5])
_expected = [10]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000016', 1, 'Playlist Snippets', 'easy', 'Write first_and_last(items, n) that returns a tuple of (first n items, last n items) using slicing.', '(items[:n], items[-n:]) does both slices at once.', $py$def first_and_last(items, n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'first_and_last(["A", "B", "C", "D", "E"], 2)'
_actual = first_and_last(["A", "B", "C", "D", "E"], 2)
_expected = (['A', 'B'], ['D', 'E'])
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'first_and_last([1, 2, 3], 1)'
_actual = first_and_last([1, 2, 3], 1)
_expected = ([1], [3])
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000016', 2, 'Every Other Item', 'easy', 'Write every_other(items) that returns every other item starting from the first, using a step slice.', 'items[::2].', $py$def every_other(items):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'every_other([1, 2, 3, 4, 5])'
_actual = every_other([1, 2, 3, 4, 5])
_expected = [1, 3, 5]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'every_other(["a", "b"])'
_actual = every_other(["a", "b"])
_expected = ['a']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000016', 3, 'Reverse in Chunks', 'medium', 'Write reverse_pairs(items) that returns items reversed as a whole, but built using slicing (no reversed(), no .reverse()).', 'items[::-1] reverses the whole list in one slice.', $py$def reverse_pairs(items):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'reverse_pairs([1, 2, 3])'
_actual = reverse_pairs([1, 2, 3])
_expected = [3, 2, 1]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'reverse_pairs([])'
_actual = reverse_pairs([])
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000016', 4, 'Middle Chunk', 'medium', 'Write drop_ends(items) that returns items with the first and last element removed, using slicing. Return an empty list if items has 2 or fewer elements.', 'items[1:-1] drops the first and last item naturally, even for short lists.', $py$def drop_ends(items):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'drop_ends([1, 2, 3, 4, 5])'
_actual = drop_ends([1, 2, 3, 4, 5])
_expected = [2, 3, 4]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'drop_ends([1, 2])'
_actual = drop_ends([1, 2])
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'drop_ends([1])'
_actual = drop_ends([1])
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000017', 1, 'Leaderboard', 'easy', 'Write top_score(scores, new_score) that appends new_score to scores, sorts scores descending in place, and returns the new highest score.', 'scores.append(new_score), then scores.sort(reverse=True), then return scores[0].', $py$def top_score(scores, new_score):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'top_score([10, 50, 30], 20)'
_actual = top_score([10, 50, 30], 20)
_expected = 50
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'top_score([10, 50, 30], 100)'
_actual = top_score([10, 50, 30], 100)
_expected = 100
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000017', 2, 'Pop the Minimum', 'easy', 'Write pop_minimum(numbers) that removes and returns the smallest value in numbers.', 'Find it with min(), then use .remove() to take it out, then return it.', $py$def pop_minimum(numbers):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'pop_minimum([5, 1, 9, 3])'
_actual = pop_minimum([5, 1, 9, 3])
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'pop_minimum([7])'
_actual = pop_minimum([7])
_expected = 7
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000017', 3, 'Sort By Length', 'medium', 'Write sort_by_length(words) that sorts words in place by string length ascending, and returns it.', 'words.sort(key=len).', $py$def sort_by_length(words):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'sort_by_length(["banana", "kiwi", "fig"])'
_actual = sort_by_length(["banana", "kiwi", "fig"])
_expected = ['fig', 'kiwi', 'banana']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'sort_by_length(["a", "bb"])'
_actual = sort_by_length(["a", "bb"])
_expected = ['a', 'bb']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000017', 4, 'Move to Front', 'medium', 'Write move_to_front(items, value) that removes the first occurrence of value from items and reinserts it at index 0, returning the list.', 'items.remove(value) removes it, then items.insert(0, value) puts it back at the front.', $py$def move_to_front(items, value):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'move_to_front([1, 2, 3, 4], 3)'
_actual = move_to_front([1, 2, 3, 4], 3)
_expected = [3, 1, 2, 4]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'move_to_front(["a", "b", "c"], "c")'
_actual = move_to_front(["a", "b", "c"], "c")
_expected = ['c', 'a', 'b']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000018', 1, 'Coordinate Distance', 'easy', 'Write distance_from_origin(point) where point is an (x, y) tuple, returning sqrt(x**2 + y**2).', 'Unpack with x, y = point, then use (x**2 + y**2) ** 0.5.', $py$def distance_from_origin(point):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'distance_from_origin((3, 4))'
_actual = distance_from_origin((3, 4))
_expected = 5.0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'distance_from_origin((0, 0))'
_actual = distance_from_origin((0, 0))
_expected = 0.0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000018', 2, 'Farthest Point', 'easy', 'Write farthest_point(points) that returns the (x, y) tuple in points that is farthest from the origin.', 'Use max(points, key=lambda p: p[0]**2 + p[1]**2).', $py$def farthest_point(points):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'farthest_point([(1, 1), (5, 5), (2, 0)])'
_actual = farthest_point([(1, 1), (5, 5), (2, 0)])
_expected = (5, 5)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'farthest_point([(0, 0), (1, 0)])'
_actual = farthest_point([(0, 0), (1, 0)])
_expected = (1, 0)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000018', 3, 'Swap Via Tuple Unpacking', 'medium', 'Write sort_pair(a, b) that returns (a, b) reordered so the smaller value comes first, using tuple unpacking (a, b = b, a) if they''re out of order.', 'if a > b: a, b = b, a -- then return a, b.', $py$def sort_pair(a, b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'sort_pair(5, 2)'
_actual = sort_pair(5, 2)
_expected = (2, 5)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'sort_pair(1, 9)'
_actual = sort_pair(1, 9)
_expected = (1, 9)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000018', 4, 'Tuple as Dict Key', 'medium', 'Write mark_visited(visited, point) that adds the (x, y) tuple point to the set visited and returns whether it was newly added (True) or already present (False).', 'Check point in visited first, then add it, and return the negation of what you checked.', $py$def mark_visited(visited, point):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'mark_visited({(0, 0)}, (1, 1))'
_actual = mark_visited({(0, 0)}, (1, 1))
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'mark_visited({(0, 0)}, (0, 0))'
_actual = mark_visited({(0, 0)}, (0, 0))
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000019', 1, 'Contact Book', 'easy', 'Write add_or_update(contacts, name, phone) that sets contacts[name] = phone and returns the updated dict.', 'Assignment on a dict works for both adding a new key and updating an existing one.', $py$def add_or_update(contacts, name, phone):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'add_or_update({"Ada": "111"}, "Ada", "222")'
_actual = add_or_update({"Ada": "111"}, "Ada", "222")
_expected = {'Ada': '222'}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'add_or_update({}, "Bo", "333")'
_actual = add_or_update({}, "Bo", "333")
_expected = {'Bo': '333'}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000019', 2, 'Safe Lookup', 'easy', 'Write lookup_or_default(d, key, default) that returns d[key] if present, otherwise default -- without a KeyError.', 'd.get(key, default) does exactly this in one call.', $py$def lookup_or_default(d, key, default):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'lookup_or_default({"a": 1}, "a", 0)'
_actual = lookup_or_default({"a": 1}, "a", 0)
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'lookup_or_default({"a": 1}, "z", 0)'
_actual = lookup_or_default({"a": 1}, "z", 0)
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000019', 3, 'Remove and Report', 'medium', 'Write remove_contact(contacts, name) that deletes name from contacts if present and returns True, or returns False if name wasn''t there (without raising).', 'Check name in contacts first; only del it if the check passed.', $py$def remove_contact(contacts, name):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'remove_contact({"Ada": "1"}, "Ada")'
_actual = remove_contact({"Ada": "1"}, "Ada")
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'remove_contact({"Ada": "1"}, "Bo")'
_actual = remove_contact({"Ada": "1"}, "Bo")
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000019', 4, 'Invert a Dict', 'medium', 'Write invert(d) that returns a new dict with d''s values as keys and keys as values (assume all values are unique and hashable).', 'Build a new dict with a comprehension: {v: k for k, v in d.items()}.', $py$def invert(d):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'invert({"a": 1, "b": 2})'
_actual = invert({"a": 1, "b": 2})
_expected = {1: 'a', 2: 'b'}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'invert({})'
_actual = invert({})
_expected = {}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000020', 1, 'Inventory Report', 'easy', 'Write total_quantity(inventory) that returns the sum of all values in the inventory dict.', 'sum(inventory.values()).', $py$def total_quantity(inventory):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'total_quantity({"a": 10, "b": 5})'
_actual = total_quantity({"a": 10, "b": 5})
_expected = 15
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'total_quantity({})'
_actual = total_quantity({})
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000020', 2, 'Format Report Lines', 'easy', 'Write report_lines(inventory) that returns a list of ''<item>: <qty>'' strings, one per entry, in the dict''s iteration order.', '[f''{item}: {qty}'' for item, qty in inventory.items()].', $py$def report_lines(inventory):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'report_lines({"apples": 10})'
_actual = report_lines({"apples": 10})
_expected = ['apples: 10']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'report_lines({"a": 1, "b": 2})'
_actual = report_lines({"a": 1, "b": 2})
_expected = ['a: 1', 'b: 2']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000020', 3, 'Merge Inventories', 'medium', 'Write merge_inventory(base, incoming) that adds incoming''s quantities into base for matching items (summing), and adds any new items directly, returning base.', 'Loop over incoming.items(); use base[item] = base.get(item, 0) + qty.', $py$def merge_inventory(base, incoming):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'merge_inventory({"a": 10}, {"a": 5, "b": 3})'
_actual = merge_inventory({"a": 10}, {"a": 5, "b": 3})
_expected = {'a': 15, 'b': 3}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'merge_inventory({}, {"x": 1})'
_actual = merge_inventory({}, {"x": 1})
_expected = {'x': 1}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000020', 4, 'Items Below Threshold', 'medium', 'Write low_stock(inventory, threshold) that returns a sorted list of item names whose quantity is strictly below threshold.', '[item for item, qty in inventory.items() if qty < threshold], then sorted().', $py$def low_stock(inventory, threshold):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'low_stock({"a": 2, "b": 10, "c": 1}, 5)'
_actual = low_stock({"a": 2, "b": 10, "c": 1}, 5)
_expected = ['a', 'c']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'low_stock({"a": 10}, 5)'
_actual = low_stock({"a": 10}, 5)
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000021', 1, 'Class Roster Overlap', 'easy', 'Write in_both(class_a, class_b) that returns the set of names present in both class_a and class_b.', 'Set intersection: class_a & class_b.', $py$def in_both(class_a, class_b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'in_both({"Ada", "Bo"}, {"Bo", "Cy"})'
_actual = in_both({"Ada", "Bo"}, {"Bo", "Cy"})
_expected = {'Bo'}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'in_both({"a"}, {"b"})'
_actual = in_both({"a"}, {"b"})
_expected = set()
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000021', 2, 'Unique Letters', 'easy', 'Write unique_letters(word) that returns the number of distinct letters in word (case-insensitive).', 'len(set(word.lower())).', $py$def unique_letters(word):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'unique_letters("hello")'
_actual = unique_letters("hello")
_expected = 4
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'unique_letters("AaBb")'
_actual = unique_letters("AaBb")
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000021', 3, 'Only in First', 'medium', 'Write only_in_first(a, b) that returns the sorted list of items that are in set a but not in set b.', 'sorted(a - b).', $py$def only_in_first(a, b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'only_in_first({1, 2, 3}, {2, 3})'
_actual = only_in_first({1, 2, 3}, {2, 3})
_expected = [1]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'only_in_first({"x", "y"}, {"x"})'
_actual = only_in_first({"x", "y"}, {"x"})
_expected = ['y']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000021', 4, 'Deduplicate Preserving a Set', 'medium', 'Write has_duplicates(items) that returns True if items contains any repeated value, comparing its length to the length of the set built from it.', 'len(items) != len(set(items)).', $py$def has_duplicates(items):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'has_duplicates([1, 2, 2])'
_actual = has_duplicates([1, 2, 2])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'has_duplicates([1, 2, 3])'
_actual = has_duplicates([1, 2, 3])
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'has_duplicates([])'
_actual = has_duplicates([])
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000022', 1, 'Squares and Filters', 'easy', 'Write even_squares(n) that returns a list of squares of every even number from 0 to n inclusive, using one list comprehension.', '[i ** 2 for i in range(n + 1) if i % 2 == 0].', $py$def even_squares(n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'even_squares(6)'
_actual = even_squares(6)
_expected = [0, 4, 16, 36]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'even_squares(1)'
_actual = even_squares(1)
_expected = [0]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000022', 2, 'Word Lengths Dict', 'easy', 'Write word_lengths(words) that returns a dict mapping each word to its length, using a dict comprehension.', '{word: len(word) for word in words}.', $py$def word_lengths(words):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'word_lengths(["a", "bb", "ccc"])'
_actual = word_lengths(["a", "bb", "ccc"])
_expected = {'a': 1, 'bb': 2, 'ccc': 3}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'word_lengths([])'
_actual = word_lengths([])
_expected = {}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000022', 3, 'Unique Vowels', 'medium', 'Write unique_vowels(text) that returns the set of vowel characters (a, e, i, o, u) that appear anywhere in text, using a set comprehension.', '{ch for ch in text.lower() if ch in ''aeiou''}.', $py$def unique_vowels(text):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'unique_vowels("hello world")'
_actual = unique_vowels("hello world")
_expected = {'e', 'o'}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'unique_vowels("xyz")'
_actual = unique_vowels("xyz")
_expected = set()
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000022', 4, 'Flatten With Comprehension', 'medium', 'Write flatten(matrix) that returns a single flat list of every element in matrix (a list of lists), using one nested list comprehension.', '[item for row in matrix for item in row].', $py$def flatten(matrix):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'flatten([[1, 2], [3, 4]])'
_actual = flatten([[1, 2], [3, 4]])
_expected = [1, 2, 3, 4]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'flatten([[1], [], [2, 3]])'
_actual = flatten([[1], [], [2, 3]])
_expected = [1, 2, 3]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000023', 1, 'Student Averages', 'easy', 'Write average_grade(student) where student is a dict with a ''grades'' list, returning the average of those grades.', 'sum(student[''grades'']) / len(student[''grades'']).', $py$def average_grade(student):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'average_grade({"name": "Ada", "grades": [90, 85, 95]})'
_actual = average_grade({"name": "Ada", "grades": [90, 85, 95]})
_expected = 90.0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'average_grade({"grades": [100]})'
_actual = average_grade({"grades": [100]})
_expected = 100.0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000023', 2, 'Names Only', 'easy', 'Write names(students) where students is a list of dicts each with a ''name'' key, returning a list of just the names in order.', '[s[''name''] for s in students].', $py$def names(students):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'names([{"name": "Ada"}, {"name": "Bo"}])'
_actual = names([{"name": "Ada"}, {"name": "Bo"}])
_expected = ['Ada', 'Bo']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'names([])'
_actual = names([])
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000023', 3, 'Top Student', 'medium', 'Write top_student(students) that returns the name of the student (from a list of {''name'', ''grades''} dicts) with the highest average grade.', 'Use max(students, key=lambda s: sum(s[''grades'']) / len(s[''grades'']))[''name''].', $py$def top_student(students):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'top_student([{"name": "Ada", "grades": [90]}, {"name": "Bo", "grades": [70]}])'
_actual = top_student([{"name": "Ada", "grades": [90]}, {"name": "Bo", "grades": [70]}])
_expected = 'Ada'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000023', 4, 'Group By Grade Band', 'medium', 'Write group_by_pass(students, passing) where students is a list of {''name'', ''grades''} dicts, returning a dict {''pass'': [...names], ''fail'': [...names]} based on whether each student''s average grade is >= passing.', 'Build both lists in one loop, checking each student''s computed average against passing.', $py$def group_by_pass(students, passing):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'group_by_pass([{"name": "Ada", "grades": [90]}, {"name": "Bo", "grades": [50]}], 60)'
_actual = group_by_pass([{"name": "Ada", "grades": [90]}, {"name": "Bo", "grades": [50]}], 60)
_expected = {'pass': ['Ada'], 'fail': ['Bo']}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000024', 1, 'Word Frequency Counter', 'easy', 'Write most_common_word(text) that returns the single most common word in text (lowercased, split on whitespace) using collections.Counter.', 'Counter(text.lower().split()).most_common(1)[0][0].', $py$from collections import Counter

def most_common_word(text):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'most_common_word("the cat sat on the mat")'
_actual = most_common_word("the cat sat on the mat")
_expected = 'the'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'most_common_word("a a b")'
_actual = most_common_word("a a b")
_expected = 'a'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000024', 2, 'Group Words By First Letter', 'easy', 'Write group_by_first_letter(words) that returns a defaultdict(list) mapping each word''s first letter to a list of words starting with it.', 'groups = defaultdict(list); for w in words: groups[w[0]].append(w).', $py$from collections import defaultdict

def group_by_first_letter(words):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'group_by_first_letter(["apple", "avocado", "banana"])'
_actual = group_by_first_letter(["apple", "avocado", "banana"])
_expected = {'a': ['apple', 'avocado'], 'b': ['banana']}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000024', 3, 'Point Distance With namedtuple', 'medium', 'A Point namedtuple with fields x, y is provided as starter code. Write distance(p1, p2) that returns the Euclidean distance between two Points, accessed by .x/.y.', '((p1.x - p2.x) ** 2 + (p1.y - p2.y) ** 2) ** 0.5.', $py$from collections import namedtuple

Point = namedtuple('Point', ['x', 'y'])

def distance(p1, p2):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'distance(Point(0, 0), Point(3, 4))'
_actual = distance(Point(0, 0), Point(3, 4))
_expected = 5.0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'distance(Point(1, 1), Point(1, 1))'
_actual = distance(Point(1, 1), Point(1, 1))
_expected = 0.0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000024', 4, 'Character Frequency Rank', 'medium', 'Write top_n_chars(text, n) that returns the n most common characters in text (ignoring spaces) as a list of (char, count) tuples, using Counter.', 'Counter(text.replace('' '', '''')).most_common(n).', $py$from collections import Counter

def top_n_chars(text, n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'top_n_chars("aabbbc", 2)'
_actual = top_n_chars("aabbbc", 2)
_expected = [('b', 3), ('a', 2)]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'top_n_chars("xyz", 1)'
_actual = top_n_chars("xyz", 1)
_expected = [('x', 1)]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000025', 1, 'Two Pets', 'easy', 'Pet is an empty class. Write make_pets(name1, name2) that creates two Pet instances, sets a .name attribute on each, and returns them as a tuple.', 'Create each instance with Pet(), then set p.name = ... directly before returning.', $py$class Pet:
    pass

def make_pets(name1, name2):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

p1, p2 = make_pets("Fido", "Rex")
_check("p1.name == 'Fido'", p1.name, "Fido")
_check("p2.name == 'Rex'", p2.name, "Rex")
_check("p1 is not p2", p1 is not p2, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000025', 2, 'Instance Counter Without Class Methods', 'easy', 'Write make_n_pets(n) that creates n separate Pet() instances (Pet is provided, empty) and returns them in a list.', 'A list comprehension calling Pet() n times: [Pet() for _ in range(n)].', $py$class Pet:
    pass

def make_n_pets(n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

pets = make_n_pets(3)
_check("len(pets) == 3", len(pets), 3)
_check("all distinct instances", len(set(id(p) for p in pets)), 3)
_check("all are Pet instances", all(isinstance(p, Pet) for p in pets), True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000025', 3, 'Attribute Presence Check', 'medium', 'Write has_attribute(obj, name) that returns True if obj has an attribute called name, without raising if it doesn''t.', 'hasattr(obj, name) does exactly this.', $py$def has_attribute(obj, name):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

class Pet:
    pass

p = Pet()
p.name = "Fido"
_check("has_attribute(p, 'name')", has_attribute(p, "name"), True)
_check("has_attribute(p, 'age')", has_attribute(p, "age"), False)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000025', 4, 'Same Class, Different State', 'medium', 'Write oldest_pet(pets) that returns the Pet instance (each has an .age attribute) with the highest age.', 'max(pets, key=lambda p: p.age).', $py$def oldest_pet(pets):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

class Pet:
    pass

young = Pet()
young.age = 2
old = Pet()
old.age = 9
result = oldest_pet([young, old])
_check("oldest_pet picks the older one", result is old, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000026', 1, 'Bank Account Init', 'easy', 'Write BankAccount''s __init__(self, owner, balance=0) so it stores owner and balance as instance attributes.', 'self.owner = owner and self.balance = balance.', $py$class BankAccount:
    def __init__(self, owner, balance=0):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

acc = BankAccount("Ada", 100)
_check("acc.owner == 'Ada'", acc.owner, "Ada")
_check("acc.balance == 100", acc.balance, 100)
default_acc = BankAccount("Bo")
_check("default balance is 0", default_acc.balance, 0)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000026', 2, 'Point With Defaults', 'easy', 'Write Point''s __init__(self, x=0, y=0) storing both as instance attributes.', 'self.x = x and self.y = y.', $py$class Point:
    def __init__(self, x=0, y=0):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

p = Point(3, 4)
_check("p.x == 3", p.x, 3)
_check("p.y == 4", p.y, 4)
origin = Point()
_check("default x is 0", origin.x, 0)
_check("default y is 0", origin.y, 0)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000026', 3, 'Derived Attribute at Init Time', 'medium', 'Write Rectangle''s __init__(self, width, height) storing width, height, AND an area attribute computed once at creation time.', 'Set self.width, self.height, then self.area = width * height, all inside __init__.', $py$class Rectangle:
    def __init__(self, width, height):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

r = Rectangle(3, 4)
_check("r.width == 3", r.width, 3)
_check("r.height == 4", r.height, 4)
_check("r.area == 12", r.area, 12)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000026', 4, 'Validated Init', 'medium', 'Write Temperature''s __init__(self, celsius) that raises ValueError if celsius is below -273.15 (absolute zero), otherwise stores it as self.celsius.', 'if celsius < -273.15: raise ValueError(...) before assigning self.celsius.', $py$class Temperature:
    def __init__(self, celsius):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

t = Temperature(20)
_check("t.celsius == 20", t.celsius, 20)
_raised = False
try:
    Temperature(-300)
except ValueError:
    _raised = True
_check("raises ValueError below absolute zero", _raised, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000027', 1, 'Bank Account Operations', 'easy', 'Add deposit(self, amount) and withdraw(self, amount) methods to BankAccount that add to / subtract from self.balance.', 'self.balance += amount and self.balance -= amount, no return needed.', $py$class BankAccount:
    def __init__(self, balance=0):
        self.balance = balance

    def deposit(self, amount):
        # TODO
        pass

    def withdraw(self, amount):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

acc = BankAccount(100)
acc.deposit(50)
_check("balance after deposit", acc.balance, 150)
acc.withdraw(30)
_check("balance after withdraw", acc.balance, 120)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000027', 2, 'Counter Increment Method', 'easy', 'Add an increment(self, by=1) method to Counter that adds by to self.count and returns the new count.', 'self.count += by, then return self.count.', $py$class Counter:
    def __init__(self):
        self.count = 0

    def increment(self, by=1):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

c = Counter()
_check("first increment", c.increment(), 1)
_check("increment by 5", c.increment(5), 6)
_check("count attribute updated", c.count, 6)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000027', 3, 'Method Calling Another Method', 'medium', 'Add area(self) and is_square(self) methods to Rectangle -- is_square should return True if width == height, using self.width/self.height (not calling area()).', 'area returns self.width * self.height; is_square returns self.width == self.height.', $py$class Rectangle:
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def area(self):
        # TODO
        pass

    def is_square(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

r1 = Rectangle(4, 4)
r2 = Rectangle(3, 5)
_check("r1.area() == 16", r1.area(), 16)
_check("r1.is_square() is True", r1.is_square(), True)
_check("r2.is_square() is False", r2.is_square(), False)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000027', 4, 'Method Mutating a List Attribute', 'medium', 'Add add_item(self, item) and total(self) methods to Cart -- add_item appends to self.items (a list of (name, price) tuples), total returns the sum of all prices.', 'self.items.append(item); total sums price for name, price in self.items.', $py$class Cart:
    def __init__(self):
        self.items = []

    def add_item(self, item):
        # TODO
        pass

    def total(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

cart = Cart()
cart.add_item(("Coffee", 3.5))
cart.add_item(("Bagel", 2.5))
_check("cart has 2 items", len(cart.items), 2)
_check("total is 6.0", cart.total(), 6.0)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000028', 1, 'Account Counter', 'easy', 'Add a class attribute accounts_created starting at 0, incremented in __init__ each time a BankAccount is made, and a classmethod total_accounts(cls) returning it.', 'BankAccount.accounts_created += 1 inside __init__; the classmethod just returns cls.accounts_created.', $py$class BankAccount:
    accounts_created = 0

    def __init__(self, owner):
        self.owner = owner
        # TODO: increment accounts_created

    @classmethod
    def total_accounts(cls):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

BankAccount("Ada")
BankAccount("Bo")
BankAccount("Cy")
_check("total_accounts() == 3", BankAccount.total_accounts(), 3)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000028', 2, 'Shared Configuration', 'easy', 'Add a class attribute interest_rate = 0.02 to SavingsAccount, and a method apply_interest(self) that adds balance * interest_rate to self.balance.', 'Reference the class attribute as self.interest_rate (reads fall back to the class if there''s no instance override).', $py$class SavingsAccount:
    interest_rate = 0.02

    def __init__(self, balance):
        self.balance = balance

    def apply_interest(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

acc = SavingsAccount(100)
acc.apply_interest()
_check("balance after interest", round(acc.balance, 2), 102.0)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000028', 3, 'Alternate Constructor', 'medium', 'Add a classmethod from_string(cls, data) to Point that parses a ''x,y'' string (e.g. ''3,4'') and returns a new Point instance with those coordinates as ints.', 'Split data on '','', convert both parts to int, and return cls(x, y).', $py$class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    @classmethod
    def from_string(cls, data):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

p = Point.from_string("3,4")
_check("p.x == 3", p.x, 3)
_check("p.y == 4", p.y, 4)
_check("p is a Point", isinstance(p, Point), True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000028', 4, 'Instance Shadowing a Class Attribute', 'medium', 'Write make_custom(name, rate) that creates a SavingsAccount(balance=100) then sets its OWN instance-level interest_rate to rate (shadowing the class attribute), and returns the instance.', 'Setting acc.interest_rate = rate creates a new instance attribute without touching the shared class attribute.', $py$class SavingsAccount:
    interest_rate = 0.02

    def __init__(self, balance):
        self.balance = balance

def make_custom(name, rate):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

custom = make_custom("Ada", 0.10)
_check("custom.interest_rate == 0.10", custom.interest_rate, 0.10)
_check("class attribute unchanged", SavingsAccount.interest_rate, 0.02)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000029', 1, 'Interest Calculator', 'easy', 'Add a staticmethod calculate_interest(balance, rate) to BankAccount that returns balance * rate.', 'No self/cls parameter at all -- just balance and rate.', $py$class BankAccount:
    @staticmethod
    def calculate_interest(balance, rate):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("via class", BankAccount.calculate_interest(1000, 0.05), 50.0)
acc_style_call = BankAccount.calculate_interest
_check("callable directly", acc_style_call(200, 0.1), 20.0)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000029', 2, 'Validation Helper', 'easy', 'Add a staticmethod is_valid_amount(amount) to BankAccount that returns True if amount is a positive number.', 'return amount > 0 -- no self or cls needed.', $py$class BankAccount:
    @staticmethod
    def is_valid_amount(amount):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("positive amount", BankAccount.is_valid_amount(50), True)
_check("negative amount", BankAccount.is_valid_amount(-10), False)
_check("zero amount", BankAccount.is_valid_amount(0), False)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000029', 3, 'Static Method Used Inside an Instance Method', 'medium', 'Add a staticmethod round_currency(amount) returning round(amount, 2), and use it inside deposit(self, amount) to round self.balance after adding amount.', 'Inside deposit, call self.round_currency(...) or BankAccount.round_currency(...) -- both work.', $py$class BankAccount:
    def __init__(self, balance=0):
        self.balance = balance

    @staticmethod
    def round_currency(amount):
        # TODO
        pass

    def deposit(self, amount):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

acc = BankAccount(10.005)
acc.deposit(0.001)
_check("balance rounded to 2 decimals", acc.balance, 10.01)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000029', 4, 'Static Factory Helper', 'medium', 'Add a staticmethod parse_amount(raw) to BankAccount that strips a leading ''$'' if present and returns the rest converted to float.', 'raw.lstrip(''$'') removes a leading dollar sign if there is one, then float(...) converts it.', $py$class BankAccount:
    @staticmethod
    def parse_amount(raw):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("with dollar sign", BankAccount.parse_amount("$42.50"), 42.5)
_check("without dollar sign", BankAccount.parse_amount("10"), 10.0)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000030', 1, 'Savings Account Subclass', 'easy', 'Write SavingsAccount(BankAccount) with __init__(self, balance, min_balance) that calls super().__init__(balance) then stores min_balance.', 'super().__init__(balance) runs BankAccount''s setup; then set self.min_balance = min_balance.', $py$class BankAccount:
    def __init__(self, balance=0):
        self.balance = balance

class SavingsAccount(BankAccount):
    def __init__(self, balance, min_balance):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

acc = SavingsAccount(500, 100)
_check("inherited balance", acc.balance, 500)
_check("own min_balance", acc.min_balance, 100)
_check("is a BankAccount", isinstance(acc, BankAccount), True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000030', 2, 'Overriding a Method', 'easy', 'Write Dog(Animal) that overrides speak(self) to return ''Woof!'' (Animal.speak returns ''...'').', 'Just define speak(self) again in Dog, without calling super() here.', $py$class Animal:
    def speak(self):
        return '...'

class Dog(Animal):
    def speak(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("Dog().speak()", Dog().speak(), "Woof!")
_check("Animal().speak() unaffected", Animal().speak(), "...")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000030', 3, 'Extending Behavior With super()', 'medium', 'Write SavingsAccount.withdraw(self, amount) that raises ValueError if balance - amount would go below self.min_balance, otherwise calls super().withdraw(amount).', 'Check the condition first, raise if it fails, otherwise delegate to super().withdraw(amount).', $py$class BankAccount:
    def __init__(self, balance=0):
        self.balance = balance

    def withdraw(self, amount):
        self.balance -= amount

class SavingsAccount(BankAccount):
    def __init__(self, balance, min_balance):
        super().__init__(balance)
        self.min_balance = min_balance

    def withdraw(self, amount):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

acc = SavingsAccount(500, 100)
acc.withdraw(300)
_check("balance after allowed withdrawal", acc.balance, 200)
_raised = False
try:
    acc.withdraw(200)
except ValueError:
    _raised = True
_check("raises when going below minimum", _raised, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000030', 4, 'Multi-Level isinstance', 'medium', 'Write describe(account) that returns ''premium'' if account is a PremiumSavingsAccount, ''savings'' if it''s a SavingsAccount (but not premium), and ''basic'' otherwise. Classes are provided.', 'Check the most specific subclass first with isinstance, since PremiumSavingsAccount IS also a SavingsAccount.', $py$class BankAccount:
    pass

class SavingsAccount(BankAccount):
    pass

class PremiumSavingsAccount(SavingsAccount):
    pass

def describe(account):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("premium account", describe(PremiumSavingsAccount()), "premium")
_check("plain savings account", describe(SavingsAccount()), "savings")
_check("basic account", describe(BankAccount()), "basic")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000031', 1, 'Car Has an Engine', 'easy', 'Write Car''s __init__ to create self.engine = Engine(), and start(self) to delegate to self.engine.start().', 'self.engine = Engine() in __init__; start just returns self.engine.start().', $py$class Engine:
    def start(self):
        return 'Vroom!'

class Car:
    def __init__(self):
        # TODO
        pass

    def start(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

car = Car()
_check("car.start() delegates", car.start(), "Vroom!")
_check("car has an engine attribute", isinstance(car.engine, Engine), True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000031', 2, 'Swap a Component', 'easy', 'Write upgrade_engine(car, new_engine) that replaces car''s engine attribute with new_engine and returns car.', 'car.engine = new_engine, then return car.', $py$def upgrade_engine(car, new_engine):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

class Engine:
    def start(self):
        return "Vroom!"

class TurboEngine:
    def start(self):
        return "VROOOOM!"

class Car:
    def __init__(self):
        self.engine = Engine()

    def start(self):
        return self.engine.start()

car = Car()
upgrade_engine(car, TurboEngine())
_check("car uses the new engine", car.start(), "VROOOOM!")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000031', 3, 'Composed Object Reporting', 'medium', 'Write Playlist''s __init__(self, songs) storing songs (a list of Song objects, each with .title and .duration), and total_duration(self) summing every song''s duration.', 'self.songs = songs; total_duration returns sum(s.duration for s in self.songs).', $py$class Playlist:
    def __init__(self, songs):
        # TODO
        pass

    def total_duration(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

class Song:
    def __init__(self, title, duration):
        self.title = title
        self.duration = duration

playlist = Playlist([Song("A", 180), Song("B", 200)])
_check("total_duration sums correctly", playlist.total_duration(), 380)
_check("songs stored as given", len(playlist.songs), 2)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000031', 4, 'Nested Composition Access', 'medium', 'Write starter_horsepower(car) that reaches through car.engine.horsepower and returns it (Car composes an Engine which has a .horsepower attribute).', 'Just chain the attribute access: return car.engine.horsepower.', $py$def starter_horsepower(car):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

class Engine:
    def __init__(self, horsepower):
        self.horsepower = horsepower

class Car:
    def __init__(self, horsepower):
        self.engine = Engine(horsepower)

car = Car(300)
_check("reaches nested attribute", starter_horsepower(car), 300)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000032', 1, 'Printable Accounts', 'easy', 'Add __str__(self) to BankAccount returning "<owner>''s account: $<balance>".', 'Use an f-string: f"{self.owner}''s account: ${self.balance}".', $py$class BankAccount:
    def __init__(self, owner, balance):
        self.owner = owner
        self.balance = balance

    def __str__(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

acc = BankAccount("Ada", 100)
_check("str(acc)", str(acc), "Ada's account: $100")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000032', 2, 'Equality By Value', 'easy', 'Add __eq__(self, other) to BankAccount comparing balance only (self.balance == other.balance).', 'return self.balance == other.balance.', $py$class BankAccount:
    def __init__(self, owner, balance):
        self.owner = owner
        self.balance = balance

    def __eq__(self, other):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("equal balances", BankAccount("Ada", 100) == BankAccount("Bo", 100), True)
_check("different balances", BankAccount("Ada", 100) == BankAccount("Bo", 50), False)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000032', 3, 'Custom Length', 'medium', 'Add __len__(self) to Playlist returning the number of songs in self.songs.', 'return len(self.songs).', $py$class Playlist:
    def __init__(self, songs):
        self.songs = songs

    def __len__(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

playlist = Playlist(["A", "B", "C"])
_check("len(playlist) == 3", len(playlist), 3)
_check("empty playlist", len(Playlist([])), 0)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000032', 4, 'Ordering With __lt__', 'medium', 'Add __lt__(self, other) to BankAccount so accounts can be sorted by balance ascending (self.balance < other.balance).', 'Implementing __lt__ alone is enough for sorted()/sort() to work.', $py$class BankAccount:
    def __init__(self, owner, balance):
        self.owner = owner
        self.balance = balance

    def __lt__(self, other):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

accounts = [BankAccount("Ada", 300), BankAccount("Bo", 100), BankAccount("Cy", 200)]
ordered = sorted(accounts)
_check("sorted ascending by balance", [a.owner for a in ordered], ["Bo", "Cy", "Ada"])
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000033', 1, 'Validated Balance', 'easy', 'Turn balance into a @property backed by self._balance, with a setter that raises ValueError if the new value is negative.', 'Getter returns self._balance; setter checks value < 0 before assigning.', $py$class BankAccount:
    def __init__(self, balance):
        self._balance = balance

    @property
    def balance(self):
        # TODO
        pass

    @balance.setter
    def balance(self, value):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

acc = BankAccount(100)
_check("reads like an attribute", acc.balance, 100)
acc.balance = 50
_check("setter updates value", acc.balance, 50)
_raised = False
try:
    acc.balance = -10
except ValueError:
    _raised = True
_check("setter rejects negative", _raised, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000033', 2, 'Read-Only Computed Property', 'easy', 'Add a read-only property full_name(self) to Person that returns f''{self.first} {self.last}'' (no setter).', 'Just @property with a getter -- no setter means assignment raises AttributeError automatically.', $py$class Person:
    def __init__(self, first, last):
        self.first = first
        self.last = last

    @property
    def full_name(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

p = Person("Ada", "Lovelace")
_check("full_name computed", p.full_name, "Ada Lovelace")
_raised = False
try:
    p.full_name = "Someone Else"
except AttributeError:
    _raised = True
_check("no setter means read-only", _raised, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000033', 3, 'Property Depending on Another Attribute', 'medium', 'Add a property fahrenheit(self) to Temperature that computes from self.celsius (celsius * 9/5 + 32), and a setter that converts a Fahrenheit value back and stores it in self.celsius.', 'Getter: self.celsius * 9 / 5 + 32. Setter: self.celsius = (value - 32) * 5 / 9.', $py$class Temperature:
    def __init__(self, celsius):
        self.celsius = celsius

    @property
    def fahrenheit(self):
        # TODO
        pass

    @fahrenheit.setter
    def fahrenheit(self, value):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

t = Temperature(100)
_check("fahrenheit getter", t.fahrenheit, 212.0)
t.fahrenheit = 32
_check("fahrenheit setter updates celsius", t.celsius, 0.0)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000033', 4, 'Lazy Computed Property', 'medium', 'Add a property description(self) to Product returning f''{self.name} (${self.price:.2f})'', computed fresh every access from self.name/self.price (not cached).', 'Just build and return the f-string in the getter -- no caching needed since the inputs might change.', $py$class Product:
    def __init__(self, name, price):
        self.name = name
        self.price = price

    @property
    def description(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

p = Product("Coffee", 3.5)
_check("description reflects current state", p.description, "Coffee ($3.50)")
p.price = 4
_check("description updates when price changes", p.description, "Coffee ($4.00)")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000034', 1, 'Shape Interface', 'easy', 'Shape is an ABC with an abstractmethod area(). Implement Circle(Shape) with __init__(self, radius) and area(self) returning 3.14159 * radius ** 2.', 'Circle must implement area() to be instantiable at all.', $py$from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self):
        ...

class Circle(Shape):
    def __init__(self, radius):
        # TODO
        pass

    def area(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

c = Circle(2)
_check("area computed correctly", round(c.area(), 2), 12.57)
_check("Circle is a Shape", isinstance(c, Shape), True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000034', 2, 'Cannot Instantiate Without Implementing', 'easy', 'Shape is an ABC with abstractmethod area(). Leave Square(Shape) WITHOUT implementing area() -- write is_instantiable() that returns True if Square() succeeds, False if it raises TypeError.', 'Try Square() in a try/except TypeError to check instantiability, without editing Square itself.', $py$from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self):
        ...

class Square(Shape):
    pass

def is_instantiable():
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("Square without area() can't be made", is_instantiable(), False)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000034', 3, 'Multiple Concrete Implementations', 'medium', 'Implement Rectangle(Shape) and Triangle(Shape) (Shape is provided) so total_area(shapes) -- summing area() over a mixed list -- works correctly. Rectangle takes (width, height); Triangle takes (base, height) with area = 0.5 * base * height.', 'Each subclass just needs its own __init__ and area() implementing the ABC''s contract.', $py$from abc import ABC, abstractmethod

class Shape(ABC):
    @abstractmethod
    def area(self):
        ...

class Rectangle(Shape):
    def __init__(self, width, height):
        # TODO
        pass

    def area(self):
        # TODO
        pass

class Triangle(Shape):
    def __init__(self, base, height):
        # TODO
        pass

    def area(self):
        # TODO
        pass

def total_area(shapes):
    return sum(s.area() for s in shapes)
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

shapes = [Rectangle(3, 4), Triangle(6, 4)]
_check("total_area mixes shape types", total_area(shapes), 24.0)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000034', 4, 'Protocol-Style Duck Typing', 'medium', 'Write can_quack(obj) that returns True if obj has a callable ''quack'' attribute -- Python''s informal alternative to a formal ABC, sometimes called duck typing.', 'hasattr(obj, ''quack'') and callable(obj.quack).', $py$def can_quack(obj):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

class Duck:
    def quack(self):
        return "Quack!"

class Rock:
    pass

_check("Duck can quack", can_quack(Duck()), True)
_check("Rock cannot quack", can_quack(Rock()), False)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000035', 1, 'Custom Countdown Iterator', 'easy', 'Implement Countdown''s __iter__(self) (returns self) and __next__(self) (counts down from self.current to 1, then raises StopIteration).', 'Decrement self.current, return it if it''s still > 0 before the decrement, else raise StopIteration.', $py$class Countdown:
    def __init__(self, start):
        self.current = start

    def __iter__(self):
        # TODO
        pass

    def __next__(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("list(Countdown(3))", list(Countdown(3)), [3, 2, 1])
_check("list(Countdown(0))", list(Countdown(0)), [])
total = 0
for n in Countdown(4):
    total += n
_check("used directly in a for loop", total, 10)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000035', 2, 'Manual next() Calls', 'easy', 'Write first_two(iterable) that returns a list of the first two values pulled from iter(iterable) using next(), without using a for loop or slicing.', 'it = iter(iterable), then [next(it), next(it)].', $py$def first_two(iterable):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'first_two([1, 2, 3, 4])'
_actual = first_two([1, 2, 3, 4])
_expected = [1, 2]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'first_two("abcd")'
_actual = first_two("abcd")
_expected = ['a', 'b']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000035', 3, 'Iterator That Raises Properly', 'medium', 'Implement Repeater(value, times) whose __next__ yields value exactly times times then raises StopIteration -- used via list(Repeater(...)).', 'Track a count in __init__, increment it each __next__ call, raise StopIteration once it reaches times.', $py$class Repeater:
    def __init__(self, value, times):
        self.value = value
        self.times = times
        self.count = 0

    def __iter__(self):
        return self

    def __next__(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("Repeater('x', 3)", list(Repeater("x", 3)), ["x", "x", "x"])
_check("Repeater('y', 0)", list(Repeater("y", 0)), [])
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000035', 4, 'Exhausted Iterator', 'medium', 'Write sum_twice(numbers) that converts numbers to an iterator with iter(), sums it once, then tries summing the SAME iterator object again -- returning a tuple (first_sum, second_sum). (This demonstrates that iterators are single-use.)', 'it = iter(numbers); first = sum(it); second = sum(it) -- the second sum will be 0 since it''s exhausted.', $py$def sum_twice(numbers):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'sum_twice([1, 2, 3])'
_actual = sum_twice([1, 2, 3])
_expected = (6, 0)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'sum_twice([])'
_actual = sum_twice([])
_expected = (0, 0)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000036', 1, 'Fibonacci Generator', 'easy', 'Write fibonacci(n) as a generator yielding the first n Fibonacci numbers, starting 0, 1, 1, 2, 3...', 'Keep two running values a, b = 0, 1; yield a, then a, b = b, a + b, n times.', $py$def fibonacci(n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'fibonacci(5)'
_actual = list(fibonacci(5))
_expected = [0, 1, 1, 2, 3]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'fibonacci(1)'
_actual = list(fibonacci(1))
_expected = [0]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'fibonacci(0)'
_actual = list(fibonacci(0))
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000036', 2, 'Infinite Counter, Limited', 'easy', 'Write counter_from(start) as a generator yielding start, start+1, start+2, ... forever. (Test it by taking a limited number of values, since it never stops on its own.)', 'while True: yield n; n += 1.', $py$def counter_from(start):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

import itertools
_check("first 4 values from 10", list(itertools.islice(counter_from(10), 4)), [10, 11, 12, 13])
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000036', 3, 'Generator With a Filter', 'medium', 'Write even_only(numbers) as a generator that yields only the even values from the iterable numbers, in order.', 'for n in numbers: if n % 2 == 0: yield n.', $py$def even_only(numbers):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'even_only([1, 2, 3, 4, 5, 6])'
_actual = list(even_only([1, 2, 3, 4, 5, 6]))
_expected = [2, 4, 6]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'even_only([1, 3, 5])'
_actual = list(even_only([1, 3, 5]))
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000036', 4, 'Chained Generators', 'medium', 'Write pipeline(numbers) that returns a list built by piping numbers through a squaring generator then a generator that only keeps values over 10.', 'Define two small generator functions (or generator expressions) and feed one into the other before listing the result.', $py$def pipeline(numbers):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'pipeline([1, 2, 3, 4, 5])'
_actual = pipeline([1, 2, 3, 4, 5])
_expected = [16, 25]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'pipeline([1, 2])'
_actual = pipeline([1, 2])
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000037', 1, 'Class-Based Context Manager', 'easy', 'Implement Announcer''s __enter__(self) (prints ''Starting'' and returns self) and __exit__(self, *args) (prints ''Done'').', '__exit__ always takes exc_type, exc_value, traceback -- *args captures all three when you don''t need them.', $py$class Announcer:
    def __enter__(self):
        # TODO
        pass

    def __exit__(self, *args):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

with Announcer() as a:
    _check("__enter__ returns self", a, a)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000037', 2, 'Contextmanager Decorator', 'easy', 'Write a @contextmanager function silence_errors() that yields once, catching and swallowing any exception raised inside the with-block (so code after the with-block still runs).', 'Wrap the yield in try/except Exception: pass so any error inside the block is caught, not re-raised.', $py$from contextlib import contextmanager

@contextmanager
def silence_errors():
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_reached = False
with silence_errors():
    raise ValueError("boom")
_reached = True
_check("code after the with-block still runs", _reached, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000037', 3, 'Context Manager Tracking State', 'medium', 'Implement Transaction''s __enter__ (sets self.active = True, returns self) and __exit__ (sets self.active = False) so ''with Transaction() as t'' works and t.active reflects whether we''re inside the block.', '__enter__ flips active to True and returns self; __exit__ flips it back to False.', $py$class Transaction:
    def __init__(self):
        self.active = False

    def __enter__(self):
        # TODO
        pass

    def __exit__(self, *args):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

t = Transaction()
_check("inactive before", t.active, False)
with t:
    _check("active during", t.active, True)
_check("inactive after", t.active, False)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000037', 4, 'Exit Sees the Exception', 'medium', 'Implement ErrorLogger''s __exit__(self, exc_type, exc_value, traceback) to store exc_type in self.last_error (or None if no error occurred), and return True so the exception doesn''t propagate.', 'self.last_error = exc_type; returning True from __exit__ suppresses the exception.', $py$class ErrorLogger:
    def __init__(self):
        self.last_error = None

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

logger = ErrorLogger()
with logger:
    raise ValueError("boom")
_check("captured the exception type", logger.last_error, ValueError)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000038', 1, 'Logging Decorator', 'easy', 'Write @log_calls that wraps a function, printing ''Calling <name>'' before and returning the original result unchanged.', 'wrapper prints using func.__name__, then returns func(*args, **kwargs).', $py$def log_calls(func):
    def wrapper(*args, **kwargs):
        # TODO
        pass
    return wrapper

@log_calls
def add(a, b):
    return a + b
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("add(2, 3) still works", add(2, 3), 5)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000038', 2, 'Call Counter Decorator', 'easy', 'Write @count_calls that wraps a function, forwards args/return value unchanged, and tracks call count on wrapper.calls.', 'Set wrapper.calls = 0 once outside wrapper, increment it inside wrapper before calling func.', $py$def count_calls(func):
    def wrapper(*args, **kwargs):
        # TODO
        pass
    wrapper.calls = 0
    return wrapper

@count_calls
def add(a, b):
    return a + b
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("add(1, 2)", add(1, 2), 3)
_check("add(5, 5)", add(5, 5), 10)
add(2, 2)
_check("calls tracked", add.calls, 3)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000038', 3, 'Decorator With Arguments', 'medium', 'Write @repeat(n) -- a decorator factory -- so the decorated function runs n times per call, returning a list of the n results.', 'repeat(n) returns the actual decorator, which returns a wrapper that calls func n times and collects results in a list.', $py$def repeat(n):
    def decorator(func):
        def wrapper(*args, **kwargs):
            # TODO
            pass
        return wrapper
    return decorator

@repeat(3)
def roll():
    return 4
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("roll() runs 3 times", roll(), [4, 4, 4])
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000038', 4, 'Preserving Metadata With functools.wraps', 'medium', 'Fix double(func)''s wrapper so func.__name__ and its docstring are preserved on the wrapped function, using functools.wraps.', 'Add @functools.wraps(func) directly above the wrapper''s def line.', $py$import functools

def double(func):
    def wrapper(*args, **kwargs):
        return func(*args, **kwargs) * 2
    return wrapper

@double
def get_value():
    """Returns a fixed value."""
    return 21
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("still returns doubled value", get_value(), 42)
_check("name preserved", get_value.__name__, "get_value")
_check("docstring preserved", get_value.__doc__, "Returns a fixed value.")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000039', 1, 'Chain Multiple Lists', 'easy', 'Write chain_all(*lists) that returns a single flat list combining every list in lists, using itertools.chain.', 'list(itertools.chain(*lists)).', $py$import itertools

def chain_all(*lists):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'chain_all([1, 2], [3], [4, 5])'
_actual = chain_all([1, 2], [3], [4, 5])
_expected = [1, 2, 3, 4, 5]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'chain_all([], [1])'
_actual = chain_all([], [1])
_expected = [1]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000039', 2, 'All Pairings', 'easy', 'Write all_pairs(a, b) that returns every (x, y) pairing of one item from a and one from b, using itertools.product.', 'list(itertools.product(a, b)).', $py$import itertools

def all_pairs(a, b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'all_pairs([1, 2], ["a", "b"])'
_actual = all_pairs([1, 2], ["a", "b"])
_expected = [(1, 'a'), (1, 'b'), (2, 'a'), (2, 'b')]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000039', 3, 'Combinations Explorer', 'medium', 'Write pairings(items) that returns every possible 2-item combination of items (order within a pair doesn''t matter, no repeats), using itertools.combinations.', 'list(itertools.combinations(items, 2)).', $py$import itertools

def pairings(items):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'pairings([1, 2, 3])'
_actual = pairings([1, 2, 3])
_expected = [(1, 2), (1, 3), (2, 3)]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'pairings(["a", "b"])'
_actual = pairings(["a", "b"])
_expected = [('a', 'b')]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000039', 4, 'Take N From an Infinite Generator', 'medium', 'Write take(iterable, n) that returns the first n items from any iterable (even an infinite one) as a list, using itertools.islice.', 'list(itertools.islice(iterable, n)).', $py$import itertools

def take(iterable, n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

import itertools
def naturals():
    n = 1
    while True:
        yield n
        n += 1

_check("take 5 from infinite generator", take(naturals(), 5), [1, 2, 3, 4, 5])
_check("take from a finite list", take([1, 2, 3], 2), [1, 2])
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000040', 1, 'Memoized Fibonacci', 'easy', 'Write fib(n) decorated with @functools.lru_cache, returning the nth Fibonacci number recursively (fib(0)=0, fib(1)=1).', 'return n if n < 2 else fib(n - 1) + fib(n - 2), with @lru_cache on top.', $py$import functools

@functools.lru_cache
def fib(n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'fib(10)'
_actual = fib(10)
_expected = 55
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'fib(0)'
_actual = fib(0)
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'fib(1)'
_actual = fib(1)
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000040', 2, 'Reduce to a Product', 'easy', 'Write product(numbers) that returns the product of all numbers using functools.reduce (not a loop, not math.prod).', 'functools.reduce(lambda acc, x: acc * x, numbers, 1).', $py$import functools

def product(numbers):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'product([1, 2, 3, 4])'
_actual = product([1, 2, 3, 4])
_expected = 24
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'product([])'
_actual = product([])
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'product([5])'
_actual = product([5])
_expected = 5
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000040', 3, 'Partial Application', 'medium', 'Write make_multiplier(factor) that returns a callable (via functools.partial) which multiplies its input by factor.', 'def multiply(a, b): return a * b, then return functools.partial(multiply, factor) or functools.partial(multiply, b=factor) depending on argument order -- either works as long as calling it with one number multiplies correctly.', $py$import functools

def multiply(a, b):
    return a * b

def make_multiplier(factor):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

triple = make_multiplier(3)
_check("triple(5)", triple(5), 15)
_check("triple(0)", triple(0), 0)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000040', 4, 'Cache Hit Counting', 'medium', 'Write call_count(func_with_cache) that returns func_with_cache.cache_info().hits -- the number of times an lru_cache-wrapped function served a cached result instead of recomputing.', 'Every lru_cache-wrapped function has a .cache_info() method returning a named tuple with a .hits field.', $py$import functools

def call_count(func_with_cache):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

import functools

@functools.lru_cache
def square(x):
    return x * x

square(4)
square(4)
square(4)
_check("repeated calls produce cache hits", call_count(square) >= 2, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000041', 1, 'Build a Path', 'easy', 'Write build_path(folder, filename) that returns a Path joining folder and filename using the / operator, as a string.', 'str(Path(folder) / filename).', $py$from pathlib import Path

def build_path(folder, filename):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'build_path("data", "report.csv")'
_actual = build_path("data", "report.csv")
_expected = 'data/report.csv'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'build_path("a", "b.txt")'
_actual = build_path("a", "b.txt")
_expected = 'a/b.txt'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000041', 2, 'Extract Extension', 'easy', 'Write file_extension(path_str) that returns the file extension (with the dot) of path_str, using Path.suffix.', 'Path(path_str).suffix.', $py$from pathlib import Path

def file_extension(path_str):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'file_extension("report.csv")'
_actual = file_extension("report.csv")
_expected = '.csv'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'file_extension("archive.tar.gz")'
_actual = file_extension("archive.tar.gz")
_expected = '.gz'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'file_extension("noext")'
_actual = file_extension("noext")
_expected = ''
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000041', 3, 'Filename Without Extension', 'medium', 'Write base_name(path_str) that returns the filename without its extension, using Path.stem.', 'Path(path_str).stem.', $py$from pathlib import Path

def base_name(path_str):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'base_name("folder/report.csv")'
_actual = base_name("folder/report.csv")
_expected = 'report'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'base_name("data.json")'
_actual = base_name("data.json")
_expected = 'data'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000041', 4, 'Change Extension', 'medium', 'Write with_extension(path_str, new_ext) that returns path_str with its extension replaced by new_ext (which includes the dot, e.g. ''.json''), using Path.with_suffix.', 'str(Path(path_str).with_suffix(new_ext)).', $py$from pathlib import Path

def with_extension(path_str, new_ext):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'with_extension("data/report.csv", ".json")'
_actual = with_extension("data/report.csv", ".json")
_expected = 'data/report.json'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'with_extension("a.txt", ".md")'
_actual = with_extension("a.txt", ".md")
_expected = 'a.md'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000042', 1, 'Age Calculator', 'easy', 'Write age_in_years(today, birthdate) (both date objects) that returns the person''s age in whole years as of today.', 'Start with today.year - birthdate.year, then subtract 1 if today''s (month, day) is earlier in the year than birthdate''s.', $py$def age_in_years(today, birthdate):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

from datetime import date
_check("birthday already passed", age_in_years(date(2024, 3, 15), date(1990, 1, 1)), 34)
_check("birthday not yet reached", age_in_years(date(2024, 3, 15), date(1990, 6, 20)), 33)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000042', 2, 'Days Between Dates', 'easy', 'Write days_between(start, end) (both date objects) that returns how many days apart they are, as a positive int.', 'abs((end - start).days).', $py$def days_between(start, end):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

from datetime import date
_check("forward order", days_between(date(2024, 1, 1), date(2024, 1, 11)), 10)
_check("reversed order still positive", days_between(date(2024, 1, 11), date(2024, 1, 1)), 10)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000042', 3, 'N Days From Now', 'medium', 'Write add_days(start, n) that returns start (a date) shifted forward by n days, using timedelta.', 'start + timedelta(days=n).', $py$from datetime import timedelta

def add_days(start, n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

from datetime import date
_check("adding days", add_days(date(2024, 3, 15), 7), date(2024, 3, 22))
_check("negative n subtracts", add_days(date(2024, 3, 15), -15), date(2024, 2, 29))
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000042', 4, 'Format and Parse', 'medium', 'Write reformat_date(date_str) that parses date_str from ''YYYY-MM-DD'' format and returns it reformatted as ''DD/MM/YYYY''.', 'datetime.strptime(date_str, ''%Y-%m-%d'') to parse, then .strftime(''%d/%m/%Y'') to format.', $py$from datetime import datetime

def reformat_date(date_str):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'reformat_date("2024-03-15")'
_actual = reformat_date("2024-03-15")
_expected = '15/03/2024'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'reformat_date("1999-12-31")'
_actual = reformat_date("1999-12-31")
_expected = '31/12/1999'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000043', 1, 'Config Round-Trip', 'easy', 'Write round_trip(config) that serializes config to a JSON string with json.dumps, then parses it back with json.loads, returning the result.', 'json.loads(json.dumps(config)).', $py$import json

def round_trip(config):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'round_trip({"a": 1, "b": [1, 2]})'
_actual = round_trip({"a": 1, "b": [1, 2]})
_expected = {'a': 1, 'b': [1, 2]}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'round_trip({"active": True})'
_actual = round_trip({"active": True})
_expected = {'active': True}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000043', 2, 'Pretty Print', 'easy', 'Write pretty(data) that returns data serialized to JSON with 2-space indentation, using json.dumps(data, indent=2).', 'json.dumps(data, indent=2).', $py$import json

def pretty(data):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

import json
result = pretty({"a": 1})
_check("valid JSON", json.loads(result), {"a": 1})
_check("has newlines from indenting", "\n" in result, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000043', 3, 'Extract Nested Field', 'medium', 'Write get_user_email(raw_json) that parses raw_json (a JSON string) and returns data[''user''][''email''].', 'json.loads(raw_json)[''user''][''email''].', $py$import json

def get_user_email(raw_json):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'get_user_email(\'{"user": {"email": "ada@example.com"}}\')'
_actual = get_user_email('{"user": {"email": "ada@example.com"}}')
_expected = 'ada@example.com'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000043', 4, 'Safe JSON Parsing', 'medium', 'Write safe_parse(raw_json) that returns json.loads(raw_json), or None if raw_json isn''t valid JSON.', 'Catch json.JSONDecodeError around json.loads.', $py$import json

def safe_parse(raw_json):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'safe_parse(\'{"a": 1}\')'
_actual = safe_parse('{"a": 1}')
_expected = {'a': 1}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'safe_parse("not json")'
_actual = safe_parse("not json")
_expected = None
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000044', 1, 'Phone Number Finder', 'easy', 'Write find_phone_numbers(text) that returns a list of all phone numbers in the format XXX-XXXX found in text, using re.findall.', 'The pattern r"\d{3}-\d{4}" matches exactly that shape.', $py$import re

def find_phone_numbers(text):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'find_phone_numbers("Call 555-0100 or 555-0200")'
_actual = find_phone_numbers("Call 555-0100 or 555-0200")
_expected = ['555-0100', '555-0200']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'find_phone_numbers("no numbers here")'
_actual = find_phone_numbers("no numbers here")
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000044', 2, 'Extract Digits Only', 'easy', 'Write digits_only(text) that returns a string of every digit character found in text, in order, using re.findall and ''''.join.', '''''.join(re.findall(r''\d'', text)).', $py$import re

def digits_only(text):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'digits_only("a1b2c3")'
_actual = digits_only("a1b2c3")
_expected = '123'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'digits_only("no digits")'
_actual = digits_only("no digits")
_expected = ''
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000044', 3, 'Validate Simple Pattern', 'medium', 'Write is_valid_hex_color(s) that returns True if s matches a ''#'' followed by exactly 6 hex digits (0-9, a-f, A-F), using re.fullmatch.', 'r"#[0-9a-fA-F]{6}" with re.fullmatch checks the ENTIRE string matches, not just part of it.', $py$import re

def is_valid_hex_color(s):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'is_valid_hex_color("#1A2B3C")'
_actual = is_valid_hex_color("#1A2B3C")
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_valid_hex_color("#1A2")'
_actual = is_valid_hex_color("#1A2")
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_valid_hex_color("1A2B3C")'
_actual = is_valid_hex_color("1A2B3C")
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000044', 4, 'Capture Groups', 'medium', 'Write parse_log_line(line) that extracts a level and message from a line like ''[ERROR] disk full'' and returns them as a tuple (level, message), using a capture-group pattern with re.match.', 'r"\[(\w+)\] (.+)" captures the bracketed word and everything after it separately.', $py$import re

def parse_log_line(line):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'parse_log_line("[ERROR] disk full")'
_actual = parse_log_line("[ERROR] disk full")
_expected = ('ERROR', 'disk full')
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'parse_log_line("[INFO] all good")'
_actual = parse_log_line("[INFO] all good")
_expected = ('INFO', 'all good')
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000045', 1, 'Write a Real Assertion', 'easy', 'Write test_is_even() (pytest style) asserting is_even(4) is True and is_even(3) is False. is_even is provided and correct.', 'Two assert statements, one per case, following the naming convention test_<thing>.', $py$def is_even(n):
    return n % 2 == 0

def test_is_even():
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

test_is_even()
_check("test_is_even() runs without raising", True, True)

def is_even(n):
    return True

_raised = False
try:
    test_is_even()
except AssertionError:
    _raised = True
_check("test catches a broken implementation", _raised, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000045', 2, 'Test a Custom Exception', 'easy', 'Write test_divide_by_zero() asserting that calling divide(5, 0) raises ZeroDivisionError, using pytest.raises-style logic (a plain try/except is fine here).', 'Wrap the call in try/except ZeroDivisionError: pass, and assert False if no exception was raised (meaning the except never ran).', $py$def divide(a, b):
    return a / b

def test_divide_by_zero():
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

test_divide_by_zero()
_check("test_divide_by_zero() runs without raising", True, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000045', 3, 'Multiple Test Functions', 'medium', 'Write test_add() and test_subtract(), each asserting at least two cases about the provided add(a, b) and subtract(a, b) functions.', 'Two separate test_ functions, each with its own assert statements -- this is exactly how a real test file is organized.', $py$def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

def test_add():
    # TODO
    pass

def test_subtract():
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

test_add()
test_subtract()
_check("both test functions run cleanly", True, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000045', 4, 'Parametrized-Style Test', 'medium', 'Write test_square() that loops over a list of (input, expected) pairs and asserts square(input) == expected for each -- mimicking what @pytest.mark.parametrize does with plain Python.', 'A for loop over a list of tuples, with one assert per iteration, tests multiple cases without repeating the assert line.', $py$def square(n):
    return n * n

def test_square():
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

test_square()
_check("test_square() covers multiple cases without raising", True, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000046', 1, 'Type-Hinted Safe Divide', 'easy', 'Add type hints to safe_divide(a: float, b: float) -> float | None, and implement it to return a / b or None on division by zero.', 'Annotate both parameters as float and the return type as float | None.', $py$def safe_divide(a, b):
    # TODO: add type hints to the signature above, and implement
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("safe_divide(10, 2)", safe_divide(10, 2), 5.0)
_check("safe_divide(5, 0)", safe_divide(5, 0), None)
_check("return annotation present", 'return' in safe_divide.__annotations__, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000046', 2, 'Read Annotations', 'easy', 'Write annotation_names(func) that returns a sorted list of every parameter/return name that has a type annotation on func.', 'sorted(func.__annotations__.keys()).', $py$def annotation_names(func):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

def greet(name: str, times: int = 1) -> str:
    return name * times

_check("finds all annotated names", annotation_names(greet), ["name", "return", "times"])
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000046', 3, 'Optional Parameter', 'medium', 'Add type hints to find_user(users: dict, name: str) -> str | None, returning users.get(name).', 'The return type is str | None since the user might not be found.', $py$def find_user(users, name):
    # TODO: add type hints, and implement
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("found", find_user({"Ada": "admin"}, "Ada"), "admin")
_check("not found", find_user({"Ada": "admin"}, "Bo"), None)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000046', 4, 'Check Return Type Annotation', 'medium', 'Write has_return_annotation(func) that returns True if func declares a return type annotation at all.', '''return'' in func.__annotations__.', $py$def has_return_annotation(func):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

def with_hint() -> int:
    return 1

def without_hint():
    return 1

_check("has a return annotation", has_return_annotation(with_hint), True)
_check("has no return annotation", has_return_annotation(without_hint), False)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000047', 1, 'Parse Requirements File', 'easy', 'Write parse_requirements(text) that parses a requirements.txt-style string (one ''package==version'' per line) into a dict {package: version}.', 'Split text into lines, then split each non-empty line on ''==''.', $py$def parse_requirements(text):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'parse_requirements("requests==2.31.0\\nflask==3.0.0")'
_actual = parse_requirements("requests==2.31.0\nflask==3.0.0")
_expected = {'requests': '2.31.0', 'flask': '3.0.0'}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000047', 2, 'Build Requirements File', 'easy', 'Write build_requirements(packages) that turns a dict {package: version} into a requirements.txt-style string, one ''package==version'' line per entry, sorted by package name.', '''\n''.join(f''{name}=={version}'' for name, version in sorted(packages.items())).', $py$def build_requirements(packages):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'build_requirements({"flask": "3.0.0", "requests": "2.31.0"})'
_actual = build_requirements({"flask": "3.0.0", "requests": "2.31.0"})
_expected = 'flask==3.0.0\nrequests==2.31.0'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000047', 3, 'Detect Version Conflict', 'medium', 'Write find_conflicts(reqs_a, reqs_b) (both dicts of package -> version) that returns a sorted list of package names present in both dicts but with different pinned versions.', 'Loop over shared keys, checking reqs_a[name] != reqs_b[name].', $py$def find_conflicts(reqs_a, reqs_b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'find_conflicts({"a": "1.0"}, {"a": "2.0"})'
_actual = find_conflicts({"a": "1.0"}, {"a": "2.0"})
_expected = ['a']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'find_conflicts({"a": "1.0"}, {"a": "1.0"})'
_actual = find_conflicts({"a": "1.0"}, {"a": "1.0"})
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000047', 4, 'Merge Requirements, Preferring Newer', 'medium', 'Write merge_requirements(base, incoming) that returns a merged dict, where incoming''s version wins whenever a package appears in both (simulating an upgrade).', 'Start from a copy of base, then update it with incoming''s entries.', $py$def merge_requirements(base, incoming):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'merge_requirements({"a": "1.0", "b": "2.0"}, {"a": "1.5"})'
_actual = merge_requirements({"a": "1.0", "b": "2.0"}, {"a": "1.5"})
_expected = {'a': '1.5', 'b': '2.0'}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000048', 1, 'Find Unused Imports', 'easy', 'Write find_unused_imports(source) that parses source with ast, and returns a sorted list of module names imported via ''import x'' that are never referenced anywhere else in the source text.', 'ast.walk the parsed tree collecting ast.Import names, then check if each name appears in source outside of the import line itself (a simple count-based check is fine).', $py$import ast

def find_unused_imports(source):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'find_unused_imports("import os\\nimport sys\\nprint(sys.argv)")'
_actual = find_unused_imports("import os\nimport sys\nprint(sys.argv)")
_expected = ['os']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'find_unused_imports("import json\\nprint(json.dumps({}))")'
_actual = find_unused_imports("import json\nprint(json.dumps({}))")
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000048', 2, 'Detect Trailing Whitespace', 'easy', 'Write lines_with_trailing_whitespace(source) that returns a list of 1-based line numbers that have trailing whitespace -- something a formatter would silently strip.', 'Enumerate source.splitlines(), starting from 1, checking line != line.rstrip().', $py$def lines_with_trailing_whitespace(source):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'lines_with_trailing_whitespace("a = 1  \\nb = 2\\nc = 3   ")'
_actual = lines_with_trailing_whitespace("a = 1  \nb = 2\nc = 3   ")
_expected = [1, 3]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'lines_with_trailing_whitespace("clean = True")'
_actual = lines_with_trailing_whitespace("clean = True")
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000048', 3, 'Count Bare Except Clauses', 'medium', 'Write count_bare_excepts(source) that parses source with ast and returns how many except clauses catch everything (bare ''except:'', no specific exception type) -- a common lint warning.', 'ast.walk looking for ast.ExceptHandler nodes where node.type is None.', $py$import ast

def count_bare_excepts(source):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'count_bare_excepts("try:\\n    x = 1\\nexcept:\\n    pass")'
_actual = count_bare_excepts("try:\n    x = 1\nexcept:\n    pass")
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'count_bare_excepts("try:\\n    x = 1\\nexcept ValueError:\\n    pass")'
_actual = count_bare_excepts("try:\n    x = 1\nexcept ValueError:\n    pass")
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000048', 4, 'Longest Line Check', 'medium', 'Write lines_over_limit(source, limit) that returns a list of 1-based line numbers longer than limit characters -- what a ''line too long'' lint rule checks.', 'Enumerate source.splitlines(), starting from 1, checking len(line) > limit.', $py$def lines_over_limit(source, limit):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'lines_over_limit("short\\n" + "x" * 100, 10)'
_actual = lines_over_limit("short\n" + "x" * 100, 10)
_expected = [2]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'lines_over_limit("a\\nb\\nc", 10)'
_actual = lines_over_limit("a\nb\nc", 10)
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000049', 1, 'Capture Log Records', 'easy', 'Write log_levels_used(logger, messages) that logs each (level, text) pair in messages via logger.log(level, text), then returns how many messages were logged (just len(messages), to confirm every call succeeded without raising).', 'for level, text in messages: logger.log(level, text), then return len(messages).', $py$def log_levels_used(logger, messages):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

import logging
test_logger = logging.getLogger("test_logger")
_check("logs without raising", log_levels_used(test_logger, [(logging.INFO, "a"), (logging.WARNING, "b")]), 2)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000049', 2, 'Filter by Severity', 'easy', 'Write above_threshold(records, min_level) where records is a list of (level, message) tuples, returning only the messages (not the levels) whose level >= min_level.', '[msg for level, msg in records if level >= min_level].', $py$def above_threshold(records, min_level):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

import logging
records = [(logging.DEBUG, "d"), (logging.WARNING, "w"), (logging.ERROR, "e")]
_check("filters below WARNING", above_threshold(records, logging.WARNING), ["w", "e"])
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000049', 3, 'Format a Log Line', 'medium', 'Write format_log_line(level_name, module, message) that returns a string like ''[WARNING] mymodule: disk almost full'', mimicking a simple log formatter.', 'f"[{level_name}] {module}: {message}".', $py$def format_log_line(level_name, module, message):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'format_log_line("WARNING", "disk", "almost full")'
_actual = format_log_line("WARNING", "disk", "almost full")
_expected = '[WARNING] disk: almost full'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000049', 4, 'Count By Level', 'medium', 'Write count_by_level(records) where records is a list of (level_name, message) tuples, returning a dict counting how many records have each level_name.', 'Use collections.Counter on the level names, or build the dict manually with .get(name, 0) + 1.', $py$def count_by_level(records):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'count_by_level([("INFO", "a"), ("ERROR", "b"), ("INFO", "c")])'
_actual = count_by_level([("INFO", "a"), ("ERROR", "b"), ("INFO", "c")])
_expected = {'INFO': 2, 'ERROR': 1}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000050', 1, 'Validate Project Metadata', 'easy', 'Write has_required_fields(project) that returns True if the dict project has non-empty ''name'' and ''version'' keys.', 'Check both keys exist and their values are truthy: bool(project.get(''name'')) and bool(project.get(''version'')).', $py$def has_required_fields(project):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'has_required_fields({"name": "my-tool", "version": "0.1.0"})'
_actual = has_required_fields({"name": "my-tool", "version": "0.1.0"})
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'has_required_fields({"name": "my-tool"})'
_actual = has_required_fields({"name": "my-tool"})
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'has_required_fields({})'
_actual = has_required_fields({})
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000050', 2, 'Parse Dependency Specifiers', 'easy', 'Write parse_dependency(spec) that splits a string like ''requests>=2.28'' into a tuple (''requests'', ''>=2.28''), splitting right before the first digit or comparison operator.', 'Walk the string char by char; once you hit a non-letter/dash/underscore/dot character, that''s where the name ends.', $py$def parse_dependency(spec):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'parse_dependency("requests>=2.28")'
_actual = parse_dependency("requests>=2.28")
_expected = ('requests', '>=2.28')
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'parse_dependency("click==8.0")'
_actual = parse_dependency("click==8.0")
_expected = ('click', '==8.0')
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000050', 3, 'List Dependency Names', 'medium', 'Write dependency_names(project) that returns a sorted list of just the package names from project[''dependencies''] (a list of strings like ''requests>=2.28''), using parse_dependency (provided).', 'sorted(parse_dependency(dep)[0] for dep in project[''dependencies'']).', $py$def parse_dependency(spec):
    for i, ch in enumerate(spec):
        if not (ch.isalnum() or ch in '-_.'):
            return spec[:i], spec[i:]
    return spec, ''

def dependency_names(project):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'dependency_names({"dependencies": ["requests>=2.28", "click==8.0"]})'
_actual = dependency_names({"dependencies": ["requests>=2.28", "click==8.0"]})
_expected = ['click', 'requests']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000050', 4, 'Bump Version', 'medium', 'Write bump_patch_version(version) that takes a ''major.minor.patch'' string and returns it with the patch number incremented by 1.', 'Split on ''.'', convert the last part to int, add 1, rejoin with ''.''.', $py$def bump_patch_version(version):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'bump_patch_version("0.1.0")'
_actual = bump_patch_version("0.1.0")
_expected = '0.1.1'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'bump_patch_version("1.2.9")'
_actual = bump_patch_version("1.2.9")
_expected = '1.2.10'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000051', 1, 'Validate Commit Message Length', 'easy', 'Write is_good_summary_line(message) that returns True if the first line of message is non-empty and at most 50 characters (a common convention for commit summaries).', 'Take message.splitlines()[0], then check 0 < len(first_line) <= 50.', $py$def is_good_summary_line(message):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'is_good_summary_line("Add user search")'
_actual = is_good_summary_line("Add user search")
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_good_summary_line("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")'
_actual = is_good_summary_line("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_good_summary_line("")'
_actual = is_good_summary_line("")
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000051', 2, 'Imperative Mood Check', 'easy', 'Write starts_imperative(message) that returns False if the first word of message ends in ''ed'' or ''ing'' (common signs of non-imperative mood like ''Added'' or ''Adding''), True otherwise.', 'Get the first word with message.split()[0], then check its lowercase form doesn''t end with ''ed'' or ''ing''.', $py$def starts_imperative(message):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'starts_imperative("Add search feature")'
_actual = starts_imperative("Add search feature")
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'starts_imperative("Added search feature")'
_actual = starts_imperative("Added search feature")
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'starts_imperative("Adding search feature")'
_actual = starts_imperative("Adding search feature")
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000051', 3, 'Branch Name Validator', 'medium', 'Write is_valid_branch_name(name) that returns True if name is lowercase, contains no spaces, and uses only letters, digits, and hyphens.', 'Check name == name.lower(), '' '' not in name, and every character is alphanumeric or ''-''.', $py$def is_valid_branch_name(name):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'is_valid_branch_name("add-user-search")'
_actual = is_valid_branch_name("add-user-search")
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_valid_branch_name("Add User Search")'
_actual = is_valid_branch_name("Add User Search")
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_valid_branch_name("add_user_search")'
_actual = is_valid_branch_name("add_user_search")
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', '10000000-0000-0000-0000-000000000051', 4, 'Group Commits By Type', 'medium', 'Write group_by_prefix(messages) where messages are conventional-commit style strings like ''fix: handle empty input'', returning a dict mapping each prefix (''fix'', ''feat'', etc.) to a list of the messages with that prefix.', 'Split each message on '': '' once to get the prefix, grouping into a dict of lists.', $py$def group_by_prefix(messages):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'group_by_prefix(["fix: a", "feat: b", "fix: c"])'
_actual = group_by_prefix(["fix: a", "feat: b", "fix: c"])
_expected = {'fix': ['fix: a', 'fix: c'], 'feat': ['feat: b']}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000052', 1, 'Run Coroutines Concurrently', 'easy', 'mock_fetch(url) is a provided async function. Write async fetch_all(urls) that fetches every url concurrently using asyncio.gather, returning the results in the same order as urls.', 'return await asyncio.gather(*(mock_fetch(u) for u in urls)).', $py$import asyncio

async def mock_fetch(url):
    await asyncio.sleep(0)
    return f'data:{url}'

async def fetch_all(urls):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

result = await fetch_all(["a", "b", "c"])
_check("fetch_all returns results in order", list(result), ["data:a", "data:b", "data:c"])
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000052', 2, 'IO-Bound or CPU-Bound?', 'easy', 'Write is_io_bound(task) that returns True if task is one of ''network'', ''disk'', or ''database'' (typical IO-bound work), False otherwise (e.g. ''image-processing'', ''encryption'').', 'task in {''network'', ''disk'', ''database''}.', $py$def is_io_bound(task):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'is_io_bound("network")'
_actual = is_io_bound("network")
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_io_bound("encryption")'
_actual = is_io_bound("encryption")
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_io_bound("database")'
_actual = is_io_bound("database")
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000052', 3, 'Sequential Execution (Simulating the GIL)', 'medium', 'Write run_sequential(tasks) that calls each zero-argument function in tasks in order and returns a list of their results -- illustrating that even with threading, the GIL means Python bytecode still runs one line at a time.', '[task() for task in tasks].', $py$def run_sequential(tasks):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("runs tasks in order", run_sequential([lambda: 1, lambda: 2, lambda: 3]), [1, 2, 3])
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000052', 4, 'Sequential vs Concurrent Awaiting', 'medium', 'Write async ordered_results(coros) that awaits each coroutine in the list coros one at a time (in order), returning a list of their results -- contrast this with asyncio.gather''s concurrent behavior.', 'results = []; for c in coros: results.append(await c); return results.', $py$async def ordered_results(coros):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

import asyncio

async def mock_fetch(url):
    await asyncio.sleep(0)
    return f"data:{url}"

result = await ordered_results([mock_fetch("a"), mock_fetch("b")])
_check("awaits each coroutine in order", result, ["data:a", "data:b"])
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000053', 1, 'Profile a Function Call', 'easy', 'Write profile_calls(func) that profiles calling func() once with cProfile.Profile(), and returns the number of distinct functions recorded (len(profiler.getstats())).', 'profiler.enable(), call func(), profiler.disable(), then return len(profiler.getstats()).', $py$import cProfile

def profile_calls(func):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

def sample():
    return 1 + 1

_check("at least one function recorded", profile_calls(sample) >= 1, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000053', 2, 'Time a Function Call', 'easy', 'Write timed_call(func) that times calling func() with time.perf_counter(), returning a tuple (result, elapsed_seconds).', 'start = time.perf_counter(); result = func(); elapsed = time.perf_counter() - start; return result, elapsed.', $py$import time

def timed_call(func):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

result, elapsed = timed_call(lambda: 2 + 2)
_check("returns the function's result", result, 4)
_check("elapsed time is non-negative", elapsed >= 0, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000053', 3, 'Find the Slower Function', 'medium', 'Write slower_of(f1, f2) that times both zero-argument functions with time.perf_counter() and returns whichever one (the function object itself) took longer.', 'Time both the same way, then compare the two elapsed durations and return the corresponding function.', $py$import time

def slower_of(f1, f2):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

def fast():
    return sum(range(10))

def slow():
    return sum(range(3_000_000))

_check("correctly identifies the slower function", slower_of(fast, slow) is slow, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000053', 4, 'More Sub-Calls, More Profiled Entries', 'medium', 'Write count_profiled_functions(func) (same mechanics as profile_calls) that profiles func() and returns the number of distinct functions recorded.', 'Identical structure to profiling any function: enable, call, disable, then len(profiler.getstats()).', $py$import cProfile

def count_profiled_functions(func):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

def helper():
    return 1

def caller_with_helper():
    return helper() + helper()

def caller_without_helper():
    return 1 + 1

_check(
    "a function that calls helpers shows more profiled entries",
    count_profiled_functions(caller_with_helper) > count_profiled_functions(caller_without_helper),
    True,
)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000054', 1, 'Reference Count Basics', 'easy', 'Write has_multiple_references(obj) that returns True if sys.getrefcount(obj) is greater than 2 (accounting for the temporary reference from the function call itself).', 'sys.getrefcount(obj) > 2.', $py$import sys

def has_multiple_references(obj):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

a = [1, 2, 3]
b = a
_check("aliased object has multiple references", has_multiple_references(a), True)
_check("fresh object has no extra references", has_multiple_references([9]), False)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000054', 2, 'Force a Collection', 'easy', 'Write force_collect() that returns gc.collect() (the count of objects the collector found and freed).', 'return gc.collect().', $py$import gc

def force_collect():
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

result = force_collect()
_check("gc.collect() returns an int", isinstance(result, int), True)
_check("count is not negative", result >= 0, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000054', 3, 'Weak Reference Liveness', 'medium', 'Write is_alive(weak_ref) that returns True if the object a weakref.ref points to still exists (weak_ref() is not None).', 'weak_ref() is not None.', $py$def is_alive(weak_ref):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

import weakref, gc

class Widget:
    pass

obj = Widget()
ref = weakref.ref(obj)
_check("alive while referenced", is_alive(ref), True)
del obj
gc.collect()
_check("not alive after deletion", is_alive(ref), False)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000054', 4, 'Create, Release, Verify Collected', 'medium', 'Write was_collected(factory) that creates an object via factory(), wraps it in a weakref, deletes the local reference, forces a gc.collect(), and returns whether the object is now gone (True if collected).', 'obj = factory(); ref = weakref.ref(obj); del obj; gc.collect(); return ref() is None.', $py$import gc, weakref

def was_collected(factory):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

class Widget:
    pass

_check("simple object gets collected once released", was_collected(lambda: Widget()), True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000055', 1, 'Create Table and Insert', 'easy', 'Write setup_db() that creates an in-memory sqlite3 connection, creates a users(id INTEGER, name TEXT) table, inserts (1, ''Ada''), commits, and returns the connection.', 'conn.execute(...) for both the CREATE TABLE and INSERT, then conn.commit(), then return conn.', $py$import sqlite3

def setup_db():
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

conn = setup_db()
row = conn.execute("SELECT name FROM users WHERE id = 1").fetchone()
_check("inserted row is queryable", row, ("Ada",))
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000055', 2, 'Query With Parameters', 'easy', 'Write get_user_name(conn, user_id) that returns the name for user_id from the users table, or None if no such row exists. Use a parameterized query.', 'row = conn.execute(''SELECT name FROM users WHERE id = ?'', (user_id,)).fetchone(); return row[0] if row else None.', $py$def get_user_name(conn, user_id):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

import sqlite3
conn = sqlite3.connect(":memory:")
conn.execute("CREATE TABLE users (id INTEGER, name TEXT)")
conn.execute("INSERT INTO users VALUES (1, 'Ada')")
conn.commit()

_check("found user", get_user_name(conn, 1), "Ada")
_check("missing user", get_user_name(conn, 99), None)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000055', 3, 'Insert Many', 'medium', 'Write insert_users(conn, users) that inserts a list of (id, name) tuples into the users table using executemany, then commits.', 'conn.executemany(''INSERT INTO users VALUES (?, ?)'', users), then conn.commit().', $py$def insert_users(conn, users):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

import sqlite3
conn = sqlite3.connect(":memory:")
conn.execute("CREATE TABLE users (id INTEGER, name TEXT)")
conn.commit()

insert_users(conn, [(1, "Ada"), (2, "Bo")])
rows = conn.execute("SELECT id, name FROM users ORDER BY id").fetchall()
_check("both rows inserted", rows, [(1, "Ada"), (2, "Bo")])
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000055', 4, 'Simple ORM-Style Row Mapping', 'medium', 'Write rows_as_dicts(conn, query) that runs query on conn and returns a list of dicts keyed by column name (using cursor.description), the way an ORM turns rows into objects under the hood.', 'cursor = conn.execute(query); columns = [d[0] for d in cursor.description]; return [dict(zip(columns, row)) for row in cursor.fetchall()].', $py$def rows_as_dicts(conn, query):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

import sqlite3
conn = sqlite3.connect(":memory:")
conn.execute("CREATE TABLE users (id INTEGER, name TEXT)")
conn.execute("INSERT INTO users VALUES (1, 'Ada')")
conn.commit()

result = rows_as_dicts(conn, "SELECT id, name FROM users")
_check("rows mapped to dicts by column name", result, [{"id": 1, "name": "Ada"}])
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000056', 1, 'Build a Query String', 'easy', 'Write build_url(base, params) that appends params (a dict) to base as a query string using urllib.parse.urlencode, with keys in sorted order.', 'base + ''?'' + urlencode(sorted(params.items())).', $py$from urllib.parse import urlencode

def build_url(base, params):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'build_url("https://example.com/search", {"q": "python", "page": "2"})'
_actual = build_url("https://example.com/search", {"q": "python", "page": "2"})
_expected = 'https://example.com/search?page=2&q=python'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000056', 2, 'Parse a Mock Response', 'easy', 'Write parse_response(mock_response) where mock_response is a dict like {''status'': 200, ''body'': ''{"name": "Ada"}''}, returning json.loads(body)[''name''] if status is 200, else None.', 'Check mock_response[''status''] == 200 first, then json.loads(mock_response[''body''])[''name''].', $py$import json

def parse_response(mock_response):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'parse_response({"status": 200, "body": \'{"name": "Ada"}\'})'
_actual = parse_response({"status": 200, "body": '{"name": "Ada"}'})
_expected = 'Ada'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'parse_response({"status": 404, "body": ""})'
_actual = parse_response({"status": 404, "body": ""})
_expected = None
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000056', 3, 'Retry Logic Simulation', 'medium', 'Write fetch_with_retry(flaky_fetch, max_attempts) that calls flaky_fetch() up to max_attempts times, returning the first successful (non-exception) result, or re-raising the last exception if every attempt fails.', 'Loop up to max_attempts times in a try/except, returning on success; on the final failed attempt, let the exception propagate (re-raise).', $py$def fetch_with_retry(flaky_fetch, max_attempts):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_calls = {"count": 0}

def flaky():
    _calls["count"] += 1
    if _calls["count"] < 3:
        raise ConnectionError("temporary failure")
    return "success"

result = fetch_with_retry(flaky, 5)
_check("eventually succeeds", result, "success")
_check("retried the expected number of times", _calls["count"], 3)

_always_fails_calls = {"count": 0}
def always_fails():
    _always_fails_calls["count"] += 1
    raise ConnectionError("nope")

_raised = False
try:
    fetch_with_retry(always_fails, 3)
except ConnectionError:
    _raised = True
_check("re-raises after exhausting attempts", _raised, True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000056', 4, 'Parse Raw Headers', 'medium', 'Write parse_headers(raw) that parses a raw headers blob like ''Content-Type: application/json\r\nContent-Length: 42'' into a dict, splitting on ''\r\n'' then '': ''.', 'For each line split on ''\r\n'', split it once on '': '' to get the name and value.', $py$def parse_headers(raw):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'parse_headers("Content-Type: application/json\\r\\nContent-Length: 42")'
_actual = parse_headers("Content-Type: application/json\r\nContent-Length: 42")
_expected = {'Content-Type': 'application/json', 'Content-Length': '42'}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000057', 1, 'Message Framing', 'easy', 'Write frame_message(message) that prepends message''s length as a 4-digit zero-padded string, e.g. frame_message(''hi'') -> ''0002hi''.', 'f''{len(message):04d}'' + message.', $py$def frame_message(message):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'frame_message("hi")'
_actual = frame_message("hi")
_expected = '0002hi'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'frame_message("hello world")'
_actual = frame_message("hello world")
_expected = '0011hello world'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000057', 2, 'Parse a Framed Message', 'easy', 'Write parse_framed(framed) that reads the first 4 characters as a length, then returns exactly that many characters after it.', 'length = int(framed[:4]); return framed[4:4 + length].', $py$def parse_framed(framed):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'parse_framed("0002hi")'
_actual = parse_framed("0002hi")
_expected = 'hi'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'parse_framed("0011hello world")'
_actual = parse_framed("0011hello world")
_expected = 'hello world'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000057', 3, 'Echo Server Logic', 'medium', 'Write echo_framed(framed_message) that parses a framed message (using parse_framed, provided) and returns it re-framed identically -- exactly what a framing-aware echo server does with each message it receives.', 'Parse it to get the raw message, then frame_message it again before returning.', $py$def parse_framed(framed):
    length = int(framed[:4])
    return framed[4:4 + length]

def frame_message(message):
    return f'{len(message):04d}' + message

def echo_framed(framed_message):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'echo_framed("0005hello")'
_actual = echo_framed("0005hello")
_expected = '0005hello'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', '10000000-0000-0000-0000-000000000057', 4, 'Broadcast to Multiple Clients', 'medium', 'Write broadcast(client_names, message) that returns a dict mapping every name in client_names to message, simulating a server sending the same message to every connected client.', '{name: message for name in client_names}.', $py$def broadcast(client_names, message):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'broadcast(["alice", "bob"], "server restarting")'
_actual = broadcast(["alice", "bob"], "server restarting")
_expected = {'alice': 'server restarting', 'bob': 'server restarting'}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000058', 1, 'Score a Track Fit', 'easy', 'Write track_score(interests, track_requirements) (both sets) that returns how many items overlap between them.', 'len(interests & track_requirements).', $py$def track_score(interests, track_requirements):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'track_score({"apis", "databases"}, {"apis", "databases", "http"})'
_actual = track_score({"apis", "databases"}, {"apis", "databases", "http"})
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'track_score({"x"}, {"y"})'
_actual = track_score({"x"}, {"y"})
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000058', 2, 'Rank Tracks by Fit', 'easy', 'Write best_track(interests, tracks) where tracks is a dict {name: set_of_skills}, returning the track name whose skills overlap interests the most.', 'max(tracks, key=lambda name: len(interests & tracks[name])).', $py$def best_track(interests, tracks):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'best_track({"pandas", "stats"}, {"web": {"http", "apis"}, "data": {"pandas", "stats"}})'
_actual = best_track({"pandas", "stats"}, {"web": {"http", "apis"}, "data": {"pandas", "stats"}})
_expected = 'data'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000058', 3, 'Weighted Decision Matrix', 'medium', 'Write weighted_score(scores, weights) (both dicts of criterion -> number, same keys) returning the sum of scores[k] * weights[k] over every criterion, rounded to 2 decimal places.', 'round(sum(scores[k] * weights[k] for k in scores), 2) -- rounding avoids floating-point artifacts like 7.399999999999999.', $py$def weighted_score(scores, weights):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'weighted_score({"interest": 8, "demand": 6}, {"interest": 0.7, "demand": 0.3})'
_actual = weighted_score({"interest": 8, "demand": 6}, {"interest": 0.7, "demand": 0.3})
_expected = 7.4
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000058', 4, 'Meets Minimum Requirements', 'medium', 'Write meets_requirements(candidate_skills, required_skills) (both sets) returning True if every required skill is present in candidate_skills.', 'required_skills.issubset(candidate_skills), or equivalently required_skills <= candidate_skills.', $py$def meets_requirements(candidate_skills, required_skills):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'meets_requirements({"python", "sql", "apis"}, {"python", "sql"})'
_actual = meets_requirements({"python", "sql", "apis"}, {"python", "sql"})
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'meets_requirements({"python"}, {"python", "sql"})'
_actual = meets_requirements({"python"}, {"python", "sql"})
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000059', 1, 'Simple Route Matching', 'easy', 'Write match_route(routes, path) (routes is a dict {path: handler_name}) that returns the handler name for an exact match, or None.', 'routes.get(path).', $py$def match_route(routes, path):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'match_route({"/": "home", "/about": "about_page"}, "/about")'
_actual = match_route({"/": "home", "/about": "about_page"}, "/about")
_expected = 'about_page'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'match_route({"/": "home"}, "/missing")'
_actual = match_route({"/": "home"}, "/missing")
_expected = None
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000059', 2, 'Dispatch a Request', 'easy', 'Write dispatch(handlers, path) (handlers is a dict {path: callable}) that calls and returns the result of the matching handler, or None if no route matches.', 'handler = handlers.get(path); return handler() if handler else None.', $py$def dispatch(handlers, path):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

_check("dispatches to the right handler", dispatch({"/": lambda: "home page"}, "/"), "home page")
_check("no match returns None", dispatch({"/": lambda: "home page"}, "/nope"), None)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000059', 3, 'Path Parameter Extraction', 'medium', 'Write extract_param(route_pattern, path) where route_pattern is like ''/users/{id}'' and path is like ''/users/42'', returning the extracted value ''42''. Assume exactly one {param} segment, and both have the same number of ''/''-separated segments.', 'Split both on ''/'', then find the segment index where route_pattern''s part starts with ''{'', and return path''s segment at that same index.', $py$def extract_param(route_pattern, path):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'extract_param("/users/{id}", "/users/42")'
_actual = extract_param("/users/{id}", "/users/42")
_expected = '42'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'extract_param("/posts/{slug}", "/posts/hello-world")'
_actual = extract_param("/posts/{slug}", "/posts/hello-world")
_expected = 'hello-world'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000059', 4, 'Simple CLI Argument Parser', 'medium', 'Write parse_args(argv) that parses a list like [''--name'', ''Ada'', ''--verbose''] into a dict. A ''--key'' followed by a non-flag value becomes {''key'': value}; a ''--key'' at the end or immediately followed by another ''--flag'' becomes {''key'': True}.', 'Walk argv by index; when you see a ''--'' prefixed item, check whether the next item exists and isn''t itself ''--'' prefixed to decide value vs boolean flag.', $py$def parse_args(argv):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'parse_args(["--name", "Ada", "--verbose"])'
_actual = parse_args(["--name", "Ada", "--verbose"])
_expected = {'name': 'Ada', 'verbose': True}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'parse_args(["--debug"])'
_actual = parse_args(["--debug"])
_expected = {'debug': True}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000060', 1, 'Model to Dict', 'easy', 'Write model_dump(user) where user is an object with .name and .age attributes, returning {''name'': user.name, ''age'': user.age} -- mimicking Pydantic''s model_dump().', 'Just build the dict directly from the two attributes.', $py$def model_dump(user):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

class User:
    def __init__(self, name, age):
        self.name = name
        self.age = age

_check("dumps to a plain dict", model_dump(User("Ada", 36)), {"name": "Ada", "age": 36})
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000060', 2, 'Validate Required Fields', 'easy', 'Write validate_user(data) (a dict) that returns True only if it has a ''name'' key with a str value and an ''age'' key with an int value.', 'isinstance(data.get(''name''), str) and isinstance(data.get(''age''), int).', $py$def validate_user(data):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'validate_user({"name": "Ada", "age": 36})'
_actual = validate_user({"name": "Ada", "age": 36})
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'validate_user({"name": "Ada"})'
_actual = validate_user({"name": "Ada"})
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'validate_user({"name": 5, "age": 36})'
_actual = validate_user({"name": 5, "age": 36})
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000060', 3, 'Nested Model Validation', 'medium', 'Write validate_order(data) (a dict) that returns True only if it has ''item'' (a non-empty str) and ''quantity'' (an int greater than 0).', 'Check the type AND the extra constraint for each field (non-empty string, positive int).', $py$def validate_order(data):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'validate_order({"item": "Coffee", "quantity": 2})'
_actual = validate_order({"item": "Coffee", "quantity": 2})
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'validate_order({"item": "", "quantity": 2})'
_actual = validate_order({"item": "", "quantity": 2})
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'validate_order({"item": "Coffee", "quantity": 0})'
_actual = validate_order({"item": "Coffee", "quantity": 0})
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000060', 4, 'Apply Default Values', 'medium', 'Write apply_defaults(data, defaults) that returns a new dict where any key present in defaults but missing from data gets filled in from defaults; data''s own values always win when present.', 'Start from a copy of defaults, then update it with data (so data''s values overwrite defaults'' where both exist).', $py$def apply_defaults(data, defaults):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'apply_defaults({"name": "Ada"}, {"name": "Anonymous", "active": True})'
_actual = apply_defaults({"name": "Ada"}, {"name": "Anonymous", "active": True})
_expected = {'name': 'Ada', 'active': True}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000061', 1, 'Parse Dockerfile Directives', 'easy', 'Write parse_dockerfile(text) that returns a list of (instruction, args) tuples for each non-empty line, splitting each line on the first space.', 'For each non-empty line, use line.split('' '', 1) to get the instruction and the rest.', $py$def parse_dockerfile(text):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'parse_dockerfile("FROM python:3.12\\nEXPOSE 8000")'
_actual = parse_dockerfile("FROM python:3.12\nEXPOSE 8000")
_expected = [('FROM', 'python:3.12'), ('EXPOSE', '8000')]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000061', 2, 'Count RUN Layers', 'easy', 'Write count_run_layers(dockerfile_text) that returns how many lines start with ''RUN '' -- each one becomes its own image layer.', 'Count lines in dockerfile_text.splitlines() that start with ''RUN ''.', $py$def count_run_layers(dockerfile_text):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'count_run_layers("FROM x\\nRUN a\\nRUN b\\nCMD c")'
_actual = count_run_layers("FROM x\nRUN a\nRUN b\nCMD c")
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'count_run_layers("FROM x")'
_actual = count_run_layers("FROM x")
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000061', 3, 'Extract Base Image', 'medium', 'Write base_image(dockerfile_text) that returns the image name from the first ''FROM <image>'' line found.', 'Find the line starting with ''FROM '', then take everything after that prefix.', $py$def base_image(dockerfile_text):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'base_image("FROM python:3.12-slim\\nCOPY . /app")'
_actual = base_image("FROM python:3.12-slim\nCOPY . /app")
_expected = 'python:3.12-slim'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'base_image("COPY . /app")'
_actual = base_image("COPY . /app")
_expected = None
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000061', 4, 'Collect Exposed Ports', 'medium', 'Write exposed_ports(dockerfile_text) that returns a sorted list of int port numbers declared via ''EXPOSE <port>'' lines (there could be more than one).', 'Find every line starting with ''EXPOSE '', convert what follows to int, and sort the results.', $py$def exposed_ports(dockerfile_text):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'exposed_ports("EXPOSE 8000\\nEXPOSE 5432")'
_actual = exposed_ports("EXPOSE 8000\nEXPOSE 5432")
_expected = [5432, 8000]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'exposed_ports("FROM x")'
_actual = exposed_ports("FROM x")
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000062', 1, 'Count Functions in a Module', 'easy', 'Write count_functions(source) that parses source with ast and returns how many function definitions (at any level) it contains.', 'Use ast.walk(ast.parse(source)) and count ast.FunctionDef nodes.', $py$import ast

def count_functions(source):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'count_functions("def a():\\n    pass\\ndef b():\\n    pass")'
_actual = count_functions("def a():\n    pass\ndef b():\n    pass")
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'count_functions("x = 1")'
_actual = count_functions("x = 1")
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000062', 2, 'Find TODO Comments', 'easy', 'Write find_todos(source) that returns a list of 1-based line numbers of lines containing the text ''TODO''.', 'Enumerate source.splitlines(), starting from 1, checking ''TODO'' in line.', $py$def find_todos(source):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'find_todos("x = 1\\n# TODO fix this\\ny = 2")'
_actual = find_todos("x = 1\n# TODO fix this\ny = 2")
_expected = [2]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'find_todos("clean = True")'
_actual = find_todos("clean = True")
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000062', 3, 'Extract Function Docstrings', 'medium', 'Write function_docstrings(source) that returns a dict {function_name: docstring_or_None} for every top-level function in source, using ast.get_docstring.', 'Walk the tree''s top-level body (tree.body), and for each FunctionDef call ast.get_docstring(node).', $py$import ast

def function_docstrings(source):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'function_docstrings(\'def greet():\\n    """Say hello."""\\n    pass\\n\\ndef silent():\\n    pass\')'
_actual = function_docstrings('def greet():\n    """Say hello."""\n    pass\n\ndef silent():\n    pass')
_expected = {'greet': 'Say hello.', 'silent': None}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', '10000000-0000-0000-0000-000000000062', 4, 'Find the Largest Function', 'medium', 'Write largest_function(source) that returns the name of the top-level function with the most lines (using node.end_lineno - node.lineno).', 'Compare (node.end_lineno - node.lineno) across all top-level ast.FunctionDef nodes and return the name of the biggest one.', $py$import ast

def largest_function(source):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'largest_function("def small():\\n    pass\\n\\ndef big():\\n    x = 1\\n    y = 2\\n    z = 3\\n    return x + y + z")'
_actual = largest_function("def small():\n    pass\n\ndef big():\n    x = 1\n    y = 2\n    z = 3\n    return x + y + z")
_expected = 'big'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000063', 1, 'Classify Complexity', 'easy', 'Write classify(pattern_name) that maps known pattern names to their Big-O: ''constant'' -> ''O(1)'', ''single_loop'' -> ''O(n)'', ''binary_search'' -> ''O(log n)'', ''nested_loop'' -> ''O(n^2)''.', 'A dict lookup covers all four cases in one line.', $py$def classify(pattern_name):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'classify("single_loop")'
_actual = classify("single_loop")
_expected = 'O(n)'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'classify("nested_loop")'
_actual = classify("nested_loop")
_expected = 'O(n^2)'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'classify("binary_search")'
_actual = classify("binary_search")
_expected = 'O(log n)'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000063', 2, 'Count Nested Loop Operations', 'easy', 'Write operation_count(n) that returns how many times the innermost body of a double nested loop (for i in range(n): for j in range(n): ...) would run -- demonstrating O(n^2) concretely.', 'It''s just n * n -- but implement it by actually counting in a loop, not the formula, to see it directly.', $py$def operation_count(n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'operation_count(3)'
_actual = operation_count(3)
_expected = 9
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'operation_count(10)'
_actual = operation_count(10)
_expected = 100
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'operation_count(0)'
_actual = operation_count(0)
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000063', 3, 'Compare Growth Rates', 'medium', 'Write faster_growth(n) that returns ''n^2'' or ''2^n'', whichever value is larger for that specific n -- demonstrating that exponential growth eventually overtakes polynomial growth.', 'Compare n ** 2 to 2 ** n directly for the given n.', $py$def faster_growth(n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'faster_growth(3)'
_actual = faster_growth(3)
_expected = 'n^2'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'faster_growth(10)'
_actual = faster_growth(10)
_expected = '2^n'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'faster_growth(4)'
_actual = faster_growth(4)
_expected = '2^n'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000063', 4, 'Measure Linear Search Cost', 'medium', 'Write count_comparisons(items, target) that performs a linear search for target, returning how many comparisons it took (1 per item checked, stopping as soon as target is found).', 'Loop with an index, incrementing a counter each check, returning as soon as you find a match (or after the loop if not found).', $py$def count_comparisons(items, target):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'count_comparisons([5, 3, 8, 1], 8)'
_actual = count_comparisons([5, 3, 8, 1], 8)
_expected = 3
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'count_comparisons([5, 3, 8, 1], 5)'
_actual = count_comparisons([5, 3, 8, 1], 5)
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'count_comparisons([5, 3], 9)'
_actual = count_comparisons([5, 3], 9)
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000064', 1, 'Implement Bubble Sort', 'easy', 'Write bubble_sort(items) that returns a new sorted list using bubble sort (repeatedly swap adjacent out-of-order pairs), without using sorted()/.sort().', 'Nested loops: on each full pass, swap any adjacent pair that''s out of order; repeat until a pass makes no swaps.', $py$def bubble_sort(items):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'bubble_sort([5, 3, 8, 1])'
_actual = bubble_sort([5, 3, 8, 1])
_expected = [1, 3, 5, 8]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'bubble_sort([])'
_actual = bubble_sort([])
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'bubble_sort([1])'
_actual = bubble_sort([1])
_expected = [1]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000064', 2, 'Binary Search Index', 'easy', 'Write binary_search(sorted_items, target) returning the index of target in sorted_items (already sorted ascending), or -1 if not present -- implemented manually, not using ''in'' or .index().', 'Track low/high bounds, checking the midpoint each time and narrowing to one half.', $py$def binary_search(sorted_items, target):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'binary_search([1, 3, 5, 7, 9], 7)'
_actual = binary_search([1, 3, 5, 7, 9], 7)
_expected = 3
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'binary_search([1, 3, 5, 7, 9], 4)'
_actual = binary_search([1, 3, 5, 7, 9], 4)
_expected = -1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'binary_search([], 1)'
_actual = binary_search([], 1)
_expected = -1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000064', 3, 'Implement Selection Sort', 'medium', 'Write selection_sort(items) that returns a new sorted list using selection sort: repeatedly find the minimum of the unsorted remainder and swap it into place.', 'For each position i, find the index of the minimum value from i to the end, then swap it into position i.', $py$def selection_sort(items):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'selection_sort([5, 3, 8, 1])'
_actual = selection_sort([5, 3, 8, 1])
_expected = [1, 3, 5, 8]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'selection_sort([2, 1])'
_actual = selection_sort([2, 1])
_expected = [1, 2]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'selection_sort([])'
_actual = selection_sort([])
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000064', 4, 'Search Insert Position', 'medium', 'Write search_insert_position(sorted_items, target) that returns the index where target would be inserted into sorted_items to keep it sorted, using binary search (not a linear scan).', 'Standard binary search, but when the loop ends without finding target, ''low'' is exactly the correct insertion index.', $py$def search_insert_position(sorted_items, target):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'search_insert_position([1, 3, 5, 6], 5)'
_actual = search_insert_position([1, 3, 5, 6], 5)
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'search_insert_position([1, 3, 5, 6], 2)'
_actual = search_insert_position([1, 3, 5, 6], 2)
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'search_insert_position([1, 3, 5, 6], 7)'
_actual = search_insert_position([1, 3, 5, 6], 7)
_expected = 4
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000065', 1, 'Factorial Recursively', 'easy', 'Write factorial(n) recursively (no loops): factorial(0) is 1, and factorial(n) is n * factorial(n - 1) for n > 0.', 'Base case: if n <= 1: return 1. Recursive case: return n * factorial(n - 1).', $py$def factorial(n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'factorial(5)'
_actual = factorial(5)
_expected = 120
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'factorial(0)'
_actual = factorial(0)
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'factorial(1)'
_actual = factorial(1)
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000065', 2, 'Sum a List Recursively', 'easy', 'Write recursive_sum(items) that sums a list of numbers recursively, without using a loop or sum().', 'Base case: empty list sums to 0. Recursive case: items[0] + recursive_sum(items[1:]).', $py$def recursive_sum(items):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'recursive_sum([1, 2, 3, 4])'
_actual = recursive_sum([1, 2, 3, 4])
_expected = 10
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'recursive_sum([])'
_actual = recursive_sum([])
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'recursive_sum([5])'
_actual = recursive_sum([5])
_expected = 5
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000065', 3, 'Recursive Power', 'medium', 'Write power(base, exponent) that computes base ** exponent recursively (exponent is a non-negative int), without using **.', 'Base case: exponent == 0 returns 1. Recursive case: base * power(base, exponent - 1).', $py$def power(base, exponent):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'power(2, 10)'
_actual = power(2, 10)
_expected = 1024
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'power(5, 0)'
_actual = power(5, 0)
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'power(3, 3)'
_actual = power(3, 3)
_expected = 27
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000065', 4, 'Flatten Nested Lists Recursively', 'medium', 'Write flatten_recursive(nested) that flattens an arbitrarily nested list into one flat list, using recursion.', 'For each item, if it''s a list, recurse into it and extend the result; otherwise append it directly.', $py$def flatten_recursive(nested):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'flatten_recursive([1, [2, 3], [4, [5, 6]]])'
_actual = flatten_recursive([1, [2, 3], [4, [5, 6]]])
_expected = [1, 2, 3, 4, 5, 6]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'flatten_recursive([])'
_actual = flatten_recursive([])
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'flatten_recursive([1, [], [2]])'
_actual = flatten_recursive([1, [], [2]])
_expected = [1, 2]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000066', 1, 'Stack-Based Reversal', 'easy', 'Write reverse_with_stack(items) that reverses items using stack operations only (append/pop), not slicing or reversed().', 'Push every item onto a stack, then pop them all off -- they come off in reverse order.', $py$def reverse_with_stack(items):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'reverse_with_stack([1, 2, 3])'
_actual = reverse_with_stack([1, 2, 3])
_expected = [3, 2, 1]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'reverse_with_stack([])'
_actual = reverse_with_stack([])
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000066', 2, 'Queue-Based Rotation', 'easy', 'Write rotate_queue(items, n) that rotates items left by n positions, moving the front element to the back n times (using pop(0)/append, simulating a queue).', 'n times: pop the front element off and append it to the back.', $py$def rotate_queue(items, n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'rotate_queue([1, 2, 3, 4], 1)'
_actual = rotate_queue([1, 2, 3, 4], 1)
_expected = [2, 3, 4, 1]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'rotate_queue([1, 2, 3], 3)'
_actual = rotate_queue([1, 2, 3], 3)
_expected = [1, 2, 3]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000066', 3, 'Min Stack', 'medium', 'Implement MinStack''s push, pop, and get_min so get_min always returns the current minimum in O(1), by tracking minimums alongside the main stack.', 'Keep a second stack of running minimums, pushing min(value, current_min) each time so its top is always the overall minimum.', $py$class MinStack:
    def __init__(self):
        self.stack = []
        self.min_stack = []

    def push(self, value):
        # TODO
        pass

    def pop(self):
        # TODO
        pass

    def get_min(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

s = MinStack()
s.push(5)
s.push(2)
s.push(8)
_check("get_min tracks the minimum", s.get_min(), 2)
s.pop()
_check("get_min after popping 8", s.get_min(), 2)
s.pop()
_check("get_min after popping 2", s.get_min(), 5)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000066', 4, 'Queue via Two Stacks', 'medium', 'Implement TwoStackQueue''s enqueue and dequeue using two internal stacks (self.in_stack, self.out_stack) so it behaves as a FIFO queue.', 'enqueue just pushes onto in_stack. dequeue: if out_stack is empty, pour everything from in_stack into out_stack (reversing the order), then pop from out_stack.', $py$class TwoStackQueue:
    def __init__(self):
        self.in_stack = []
        self.out_stack = []

    def enqueue(self, value):
        # TODO
        pass

    def dequeue(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

q = TwoStackQueue()
q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
_check("dequeue returns in FIFO order", [q.dequeue(), q.dequeue(), q.dequeue()], [1, 2, 3])
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000067', 1, 'Binary Tree Max Depth', 'easy', 'Node has .value, .left, .right (None for empty). Write max_depth(node) returning the tree''s depth (an empty tree has depth 0).', 'Base case: node is None returns 0. Recursive case: 1 + max(depth of left, depth of right).', $py$class Node:
    def __init__(self, value, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right

def max_depth(node):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

tree = Node(1, Node(2, Node(4)), Node(3))
_check("depth of a 3-level tree", max_depth(tree), 3)
_check("depth of an empty tree", max_depth(None), 0)
_check("depth of a single node", max_depth(Node(1)), 1)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000067', 2, 'Count Tree Nodes', 'easy', 'Write count_nodes(node) that returns the total number of nodes in the binary tree rooted at node.', 'Base case: node is None returns 0. Recursive case: 1 + count_nodes(left) + count_nodes(right).', $py$class Node:
    def __init__(self, value, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right

def count_nodes(node):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

tree = Node(1, Node(2), Node(3, Node(4)))
_check("counts every node", count_nodes(tree), 4)
_check("empty tree has 0 nodes", count_nodes(None), 0)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000067', 3, 'Graph Reachability via BFS', 'medium', 'Write is_reachable(graph, start, end) where graph is an adjacency-list dict {node: [neighbors]}, returning True if end can be reached from start via BFS.', 'Use a queue (collections.deque) and a visited set; explore neighbors level by level, never revisiting a node.', $py$from collections import deque

def is_reachable(graph, start, end):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

graph = {"a": ["b"], "b": ["c"], "c": [], "d": []}
_check("reachable through a chain", is_reachable(graph, "a", "c"), True)
_check("unreachable node", is_reachable(graph, "a", "d"), False)
_check("same start and end", is_reachable(graph, "a", "a"), True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000067', 4, 'Tree Value Sum', 'medium', 'Write tree_sum(node) that returns the sum of every node''s value in the binary tree rooted at node.', 'Base case: node is None returns 0. Recursive case: node.value + tree_sum(left) + tree_sum(right).', $py$class Node:
    def __init__(self, value, left=None, right=None):
        self.value = value
        self.left = left
        self.right = right

def tree_sum(node):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

tree = Node(1, Node(2), Node(3, Node(4)))
_check("sums all node values", tree_sum(tree), 10)
_check("empty tree sums to 0", tree_sum(None), 0)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000068', 1, 'Top-K Scores', 'easy', 'Write top_k(scores, k) returning the k largest values in scores, using heapq.nlargest.', 'heapq.nlargest(k, scores).', $py$import heapq

def top_k(scores, k):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'top_k([5, 1, 9, 3, 7], 3)'
_actual = top_k([5, 1, 9, 3, 7], 3)
_expected = [9, 7, 5]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'top_k([1, 2], 5)'
_actual = top_k([1, 2], 5)
_expected = [2, 1]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000068', 2, 'Smallest K Values', 'easy', 'Write smallest_k(scores, k) returning the k smallest values in scores, using heapq.nsmallest.', 'heapq.nsmallest(k, scores).', $py$import heapq

def smallest_k(scores, k):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'smallest_k([5, 1, 9, 3, 7], 2)'
_actual = smallest_k([5, 1, 9, 3, 7], 2)
_expected = [1, 3]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'smallest_k([4], 3)'
_actual = smallest_k([4], 3)
_expected = [4]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000068', 3, 'Push and Pop the Minimum', 'medium', 'Write heap_push_pop(heap_list, value) that pushes value onto heap_list (already heap-ordered) with heapq.heappush, then pops and returns the smallest value with heapq.heappop.', 'heapq.heappush(heap_list, value), then return heapq.heappop(heap_list).', $py$import heapq

def heap_push_pop(heap_list, value):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'heap_push_pop([3, 5, 8], 1)'
_actual = heap_push_pop([3, 5, 8], 1)
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'heap_push_pop([3, 5, 8], 10)'
_actual = heap_push_pop([3, 5, 8], 10)
_expected = 3
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000068', 4, 'K Closest to Zero', 'medium', 'Write k_closest_to_zero(numbers, k) returning the k numbers from numbers closest to zero, using heapq.nsmallest with a key of abs.', 'heapq.nsmallest(k, numbers, key=abs).', $py$import heapq

def k_closest_to_zero(numbers, k):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'k_closest_to_zero([-5, 3, -1, 8, 2], 2)'
_actual = k_closest_to_zero([-5, 3, -1, 8, 2], 2)
_expected = [-1, 2]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'k_closest_to_zero([-10, 10], 1)'
_actual = k_closest_to_zero([-10, 10], 1)
_expected = [-10]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000069', 1, 'Two-Pointer Pair Sum', 'easy', 'Write has_pair_with_sum(sorted_nums, target) that returns True if any two numbers in sorted_nums (ascending) add up to target, using two pointers (not a nested loop).', 'Start pointers at both ends; move the low one up if the sum is too small, the high one down if too big.', $py$def has_pair_with_sum(sorted_nums, target):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'has_pair_with_sum([1, 2, 4, 7, 11], 9)'
_actual = has_pair_with_sum([1, 2, 4, 7, 11], 9)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'has_pair_with_sum([1, 2, 4, 7, 11], 20)'
_actual = has_pair_with_sum([1, 2, 4, 7, 11], 20)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000069', 2, 'Reverse In Place, Two Pointers', 'easy', 'Write reverse_in_place(chars) (a list) that reverses it in place by swapping from both ends inward, using two pointers, and returns it.', 'left starts at 0, right at len-1; swap and move both inward until they meet.', $py$def reverse_in_place(chars):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'reverse_in_place(["a", "b", "c", "d"])'
_actual = reverse_in_place(["a", "b", "c", "d"])
_expected = ['d', 'c', 'b', 'a']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'reverse_in_place([1])'
_actual = reverse_in_place([1])
_expected = [1]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000069', 3, 'Max Sum Subarray of Size K', 'medium', 'Write max_sum_subarray(nums, k) that returns the maximum sum of any contiguous subarray of length k, using a sliding window (not recomputing the sum from scratch each time).', 'Compute the first window''s sum directly, then slide by subtracting the element leaving and adding the one entering.', $py$def max_sum_subarray(nums, k):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'max_sum_subarray([2, 1, 5, 1, 3, 2], 3)'
_actual = max_sum_subarray([2, 1, 5, 1, 3, 2], 3)
_expected = 9
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'max_sum_subarray([1, 1, 1], 1)'
_actual = max_sum_subarray([1, 1, 1], 1)
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000069', 4, 'Longest Substring Without Repeats', 'medium', 'Write longest_unique_substring_length(s) returning the length of the longest substring of s with no repeating characters, using a sliding window with a set.', 'Expand the window''s right edge; whenever the new character is already in the window, shrink from the left until it''s not, tracking the best length seen.', $py$def longest_unique_substring_length(s):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'longest_unique_substring_length("abcabcbb")'
_actual = longest_unique_substring_length("abcabcbb")
_expected = 3
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'longest_unique_substring_length("bbbbb")'
_actual = longest_unique_substring_length("bbbbb")
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'longest_unique_substring_length("")'
_actual = longest_unique_substring_length("")
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000070', 1, 'Extract Stated Constraints', 'easy', 'Write extract_constraints(problem_statement) that returns a sorted list of which constraint keywords from [''sorted'', ''unique'', ''positive'', ''empty''] appear (case-insensitive) anywhere in problem_statement.', 'Lowercase problem_statement once, then check ''in'' for each keyword from the reference list.', $py$def extract_constraints(problem_statement):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'extract_constraints("Assume the input list is sorted and contains only positive numbers.")'
_actual = extract_constraints("Assume the input list is sorted and contains only positive numbers.")
_expected = ['positive', 'sorted']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'extract_constraints("No particular constraints here.")'
_actual = extract_constraints("No particular constraints here.")
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000070', 2, 'Missing Edge Cases', 'easy', 'Write missing_edge_cases(covered, required) (both sets of strings) returning a sorted list of edge cases in required that aren''t yet in covered.', 'sorted(required - covered).', $py$def missing_edge_cases(covered, required):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'missing_edge_cases({"empty", "single"}, {"empty", "single", "duplicates"})'
_actual = missing_edge_cases({"empty", "single"}, {"empty", "single", "duplicates"})
_expected = ['duplicates']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'missing_edge_cases({"a", "b"}, {"a", "b"})'
_actual = missing_edge_cases({"a", "b"}, {"a", "b"})
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000070', 3, 'Complexity Budget Check', 'medium', 'Write meets_complexity_budget(actual, budget, ranking) where ranking lists Big-O classes from best to worst, returning True if actual is at least as good as budget (appears at the same position or earlier in ranking).', 'ranking.index(actual) <= ranking.index(budget) -- a lower index means better (faster) in a best-to-worst ordered list.', $py$def meets_complexity_budget(actual, budget, ranking):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

ranking = ["O(1)", "O(log n)", "O(n)", "O(n log n)", "O(n^2)"]
_check("O(n) meets an O(n log n) budget", meets_complexity_budget("O(n)", "O(n log n)", ranking), True)
_check("O(n^2) does not meet an O(n) budget", meets_complexity_budget("O(n^2)", "O(n)", ranking), False)
_check("exact match meets its own budget", meets_complexity_budget("O(n)", "O(n)", ranking), True)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', '10000000-0000-0000-0000-000000000070', 4, 'Structured Explanation Template', 'medium', 'Write build_explanation(approach, complexity) returning the string ''Approach: <approach>. Complexity: <complexity>.'' -- a habit of always stating both explicitly.', 'f"Approach: {approach}. Complexity: {complexity}.".', $py$def build_explanation(approach, complexity):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
_call_desc = 'build_explanation("two pointers", "O(n)")'
_actual = build_explanation("two pointers", "O(n)")
_expected = 'Approach: two pointers. Complexity: O(n).'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000071', 1, 'Validate Scope Completeness', 'easy', 'Write is_complete_scope(scope) (a dict) that returns True if it has non-empty ''problem'' (str), ''users'' (list), and ''features'' (list) values.', 'Check all three keys are present and truthy (non-empty).', $py$def is_complete_scope(scope):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'is_complete_scope({"problem": "x", "users": ["me"], "features": ["a"]})'
_actual = is_complete_scope({"problem": "x", "users": ["me"], "features": ["a"]})
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_complete_scope({"problem": "x", "users": [], "features": ["a"]})'
_actual = is_complete_scope({"problem": "x", "users": [], "features": ["a"]})
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000071', 2, 'Count In-Scope Must-Haves', 'easy', 'Write in_scope_count(features, must_haves) (both lists) returning how many of must_haves are present in features.', 'sum(1 for item in must_haves if item in features).', $py$def in_scope_count(features, must_haves):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'in_scope_count(["a", "b", "c"], ["a", "c", "d"])'
_actual = in_scope_count(["a", "b", "c"], ["a", "c", "d"])
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'in_scope_count([], ["a"])'
_actual = in_scope_count([], ["a"])
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000071', 3, 'Flag Scope Creep', 'medium', 'Write scope_creep(original_features, current_features) (both sets) returning a sorted list of features present now that weren''t in the original scope.', 'sorted(current_features - original_features).', $py$def scope_creep(original_features, current_features):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'scope_creep({"a", "b"}, {"a", "b", "c", "d"})'
_actual = scope_creep({"a", "b"}, {"a", "b", "c", "d"})
_expected = ['c', 'd']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'scope_creep({"a"}, {"a"})'
_actual = scope_creep({"a"}, {"a"})
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000071', 4, 'Total Effort Estimate', 'medium', 'Write total_estimate(tasks) where tasks is a list of dicts each with an ''hours'' key, returning the sum of every task''s hours.', 'sum(task[''hours''] for task in tasks).', $py$def total_estimate(tasks):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'total_estimate([{"hours": 3}, {"hours": 5}])'
_actual = total_estimate([{"hours": 3}, {"hours": 5}])
_expected = 8
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'total_estimate([])'
_actual = total_estimate([])
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000072', 1, 'Validate ADR Structure', 'easy', 'Write is_valid_adr(doc) (a dict) returning True if it has non-empty ''title'', ''decision'', and ''consequences'' string values.', 'Check all three keys exist and are truthy.', $py$def is_valid_adr(doc):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'is_valid_adr({"title": "Use Postgres", "decision": "...", "consequences": "..."})'
_actual = is_valid_adr({"title": "Use Postgres", "decision": "...", "consequences": "..."})
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_valid_adr({"title": "Use Postgres"})'
_actual = is_valid_adr({"title": "Use Postgres"})
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000072', 2, 'Count Architecture Components', 'easy', 'Write component_count(architecture) where architecture is a dict {component: [dependencies]}, returning how many components it has.', 'len(architecture).', $py$def component_count(architecture):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'component_count({"a": [], "b": ["a"]})'
_actual = component_count({"a": [], "b": ["a"]})
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'component_count({})'
_actual = component_count({})
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000072', 3, 'Detect Circular Dependency', 'medium', 'Write has_circular_dependency(architecture) (dict of component -> list of dependencies) returning True if any dependency chain loops back on itself, using DFS.', 'Track nodes currently ''visiting'' (on the current DFS path) vs fully ''visited'' -- revisiting a ''visiting'' node means a cycle.', $py$def has_circular_dependency(architecture):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

cyclic = {"a": ["b"], "b": ["c"], "c": ["a"]}
acyclic = {"a": ["b"], "b": ["c"], "c": []}
_check("detects a real cycle", has_circular_dependency(cyclic), True)
_check("acyclic graph has no cycle", has_circular_dependency(acyclic), False)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000072', 4, 'Dependency Build Order', 'medium', 'Write build_order(architecture) (dict of component -> list of dependencies, acyclic) returning a list ordering every component so each one comes after all of its dependencies.', 'DFS from each node, recursing into dependencies first, then appending the node itself after -- a dependency always finishes (and gets appended) before the component that needed it.', $py$def build_order(architecture):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 0
def _check(desc, actual, expected):
    global _passed, _total
    _total += 1
    if actual == expected:
        _passed += 1
        print(f"PASS: {desc}")
    else:
        print(f"FAIL: {desc} -- got {actual!r}, expected {expected!r}")

architecture = {"app": ["db", "cache"], "db": [], "cache": []}
order = build_order(architecture)
positions = {name: i for i, name in enumerate(order)}
_check("db comes before app", positions["db"] < positions["app"], True)
_check("cache comes before app", positions["cache"] < positions["app"], True)
_check("every component is present exactly once", sorted(order), ["app", "cache", "db"])
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000073', 1, 'Coverage Percentage', 'easy', 'Write coverage_percent(covered_lines, total_lines) returning the percentage covered, rounded to 1 decimal place.', 'round(covered_lines / total_lines * 100, 1).', $py$def coverage_percent(covered_lines, total_lines):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'coverage_percent(85, 100)'
_actual = coverage_percent(85, 100)
_expected = 85.0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'coverage_percent(1, 3)'
_actual = coverage_percent(1, 3)
_expected = 33.3
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000073', 2, 'Meets Coverage Threshold', 'easy', 'Write meets_threshold(coverage_pct, minimum) returning True if coverage_pct is at least minimum.', 'coverage_pct >= minimum.', $py$def meets_threshold(coverage_pct, minimum):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'meets_threshold(85, 80)'
_actual = meets_threshold(85, 80)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'meets_threshold(75, 80)'
_actual = meets_threshold(75, 80)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000073', 3, 'Parse Pipeline Steps', 'medium', 'Write pipeline_steps(text) that parses a simplified pipeline listing (one ''- stepname'' per line) into a plain list of step names, e.g. ''- lint\n- test'' -> [''lint'', ''test''].', 'For each non-empty line, strip it and remove the leading ''- ''.', $py$def pipeline_steps(text):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'pipeline_steps("- lint\\n- test\\n- build")'
_actual = pipeline_steps("- lint\n- test\n- build")
_expected = ['lint', 'test', 'build']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'pipeline_steps("- deploy")'
_actual = pipeline_steps("- deploy")
_expected = ['deploy']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000073', 4, 'Validate Pipeline Order', 'medium', 'Write is_valid_order(steps, required_order) where required_order is a list of (before, after) pairs, returning True only if every pair''s ''before'' step appears earlier in steps than its ''after'' step.', 'For each (before, after) pair, compare steps.index(before) to steps.index(after).', $py$def is_valid_order(steps, required_order):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'is_valid_order(["lint", "test", "deploy"], [("lint", "test"), ("test", "deploy")])'
_actual = is_valid_order(["lint", "test", "deploy"], [("lint", "test"), ("test", "deploy")])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_valid_order(["deploy", "test"], [("test", "deploy")])'
_actual = is_valid_order(["deploy", "test"], [("test", "deploy")])
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000074', 1, 'Health Check Response', 'easy', 'Write health_check(is_db_connected, is_cache_connected) returning {''status'': ''healthy''} if both are True, else {''status'': ''unhealthy''}.', 'A simple conditional expression choosing between the two dict literals.', $py$def health_check(is_db_connected, is_cache_connected):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'health_check(True, True)'
_actual = health_check(True, True)
_expected = {'status': 'healthy'}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'health_check(True, False)'
_actual = health_check(True, False)
_expected = {'status': 'unhealthy'}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000074', 2, 'Uptime Percentage', 'easy', 'Write uptime_percent(total_minutes, downtime_minutes) returning the uptime percentage, rounded to 2 decimals.', 'round((total_minutes - downtime_minutes) / total_minutes * 100, 2).', $py$def uptime_percent(total_minutes, downtime_minutes):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'uptime_percent(1000, 10)'
_actual = uptime_percent(1000, 10)
_expected = 99.0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'uptime_percent(100, 0)'
_actual = uptime_percent(100, 0)
_expected = 100.0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000074', 3, 'Avoid Alert Fatigue', 'medium', 'Write should_alert(error_rate, threshold, consecutive_breaches, min_consecutive) returning True only if error_rate exceeds threshold AND consecutive_breaches is at least min_consecutive.', 'error_rate > threshold and consecutive_breaches >= min_consecutive.', $py$def should_alert(error_rate, threshold, consecutive_breaches, min_consecutive):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'should_alert(0.1, 0.05, 3, 3)'
_actual = should_alert(0.1, 0.05, 3, 3)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'should_alert(0.1, 0.05, 1, 3)'
_actual = should_alert(0.1, 0.05, 1, 3)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'should_alert(0.01, 0.05, 5, 3)'
_actual = should_alert(0.01, 0.05, 5, 3)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000074', 4, 'Rolling Deployment Batches', 'medium', 'Write deployment_batches(total_instances, batch_size) returning a list of batch sizes (each at most batch_size) summing to total_instances, simulating a rolling deploy plan.', 'Keep subtracting batch_size (or whatever''s left, if less) from the remaining total until it reaches 0.', $py$def deployment_batches(total_instances, batch_size):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'deployment_batches(10, 3)'
_actual = deployment_batches(10, 3)
_expected = [3, 3, 3, 1]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'deployment_batches(6, 3)'
_actual = deployment_batches(6, 3)
_expected = [3, 3]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'deployment_batches(0, 3)'
_actual = deployment_batches(0, 3)
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000075', 1, 'Validate README Sections', 'easy', 'Write has_required_sections(readme_text, required) (required is a list of header strings like ''## Installation'') returning True if every one appears somewhere in readme_text.', 'all(header in readme_text for header in required).', $py$def has_required_sections(readme_text, required):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'has_required_sections("## Installation\\ntext\\n## Usage\\ntext", ["## Installation", "## Usage"])'
_actual = has_required_sections("## Installation\ntext\n## Usage\ntext", ["## Installation", "## Usage"])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'has_required_sections("## Installation", ["## Installation", "## Usage"])'
_actual = has_required_sections("## Installation", ["## Installation", "## Usage"])
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000075', 2, 'Minimum Length Check', 'easy', 'Write meets_length(text, min_words) returning True if text has at least min_words words.', 'len(text.split()) >= min_words.', $py$def meets_length(text, min_words):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'meets_length("this is a short readme", 3)'
_actual = meets_length("this is a short readme", 3)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'meets_length("too short", 5)'
_actual = meets_length("too short", 5)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000075', 3, 'Extract a Section''s Content', 'medium', 'Write extract_section(readme_text, header) that returns the text between a ''## <header>'' line and the next ''## '' line (or the end of the text), stripped of leading/trailing whitespace.', 'Split on the header to find where the section starts, then split that remainder on the next ''## '' to find where it ends.', $py$def extract_section(readme_text, header):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'extract_section("## Installation\\npip install x\\n## Usage\\nrun it", "Installation")'
_actual = extract_section("## Installation\npip install x\n## Usage\nrun it", "Installation")
_expected = 'pip install x'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'extract_section("## Usage\\nrun it", "Usage")'
_actual = extract_section("## Usage\nrun it", "Usage")
_expected = 'run it'
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', '10000000-0000-0000-0000-000000000075', 4, 'Retrospective Sentiment Tally', 'medium', 'Write tally_retro(items) where items is a list of (''went_well'' or ''to_improve'', text) tuples, returning a dict counting how many of each category appear.', 'Count occurrences of the first element of each tuple, e.g. with collections.Counter or a manual dict.', $py$def tally_retro(items):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = 'tally_retro([("went_well", "a"), ("went_well", "b"), ("to_improve", "c")])'
_actual = tally_retro([("went_well", "a"), ("went_well", "b"), ("to_improve", "c")])
_expected = {'went_well': 2, 'to_improve': 1}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'tally_retro([])'
_actual = tally_retro([])
_expected = {'went_well': 0, 'to_improve': 0}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$);
