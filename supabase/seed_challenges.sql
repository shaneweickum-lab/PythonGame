-- Coding challenges seed data: 2 per phase, auto-graded via Pyodide in /challenges.
-- Reference solutions for every test_code below were run end-to-end through Pyodide
-- (see validate-challenges.mjs during development) and confirmed to pass all cases.

insert into challenges (phase_id, order_index, title, difficulty, prompt, hint, starter_code, test_code) values
  ('00000000-0000-0000-0000-000000000001', 1, 'Sum of Digits', 'easy', 'Write sum_of_digits(n) that returns the sum of the decimal digits of a non-negative integer n. sum_of_digits(123) should return 6.', 'You can convert n to a string with str(n) and iterate over its characters.', $py$def sum_of_digits(n):
    # TODO: return the sum of the digits of the non-negative integer n
    pass
$py$, $py$_cases = [(0, 0), (5, 5), (123, 6), (9999, 36), (1000000, 1)]
_passed = 0
for _n, _expected in _cases:
    _actual = sum_of_digits(_n)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: sum_of_digits({_n}) == {_expected}")
    else:
        print(f"FAIL: sum_of_digits({_n}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000001', 2, 'FizzBuzz List', 'easy', 'Write fizzbuzz(n) returning a list of strings for 1..n: ''Fizz'' if divisible by 3, ''Buzz'' if divisible by 5, ''FizzBuzz'' if both, otherwise the number itself as a string.', 'Check divisibility by 15 first (both 3 and 5), then 3, then 5, so you don''t need to check ''and'' conditions.', $py$def fizzbuzz(n):
    # TODO: return a list of strings from 1 to n following FizzBuzz rules
    pass
$py$, $py$_cases = [
    (1, ["1"]),
    (3, ["1", "2", "Fizz"]),
    (15, ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]),
]
_passed = 0
for _n, _expected in _cases:
    _actual = fizzbuzz(_n)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: fizzbuzz({_n}) matches expected output")
    else:
        print(f"FAIL: fizzbuzz({_n}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', 1, 'Remove Duplicates, Preserve Order', 'easy', 'Write dedupe(items) that returns a new list with duplicate values removed, keeping the first occurrence of each and preserving original order.', 'A set is great for O(1) ''have I seen this?'' checks, but you still need a list to preserve order.', $py$def dedupe(items):
    # TODO: return a new list with duplicates removed, preserving order
    pass
$py$, $py$_cases = [
    ([1, 2, 2, 3, 1], [1, 2, 3]),
    ([], []),
    (['a', 'a', 'b'], ['a', 'b']),
    ([5, 5, 5, 5], [5]),
]
_passed = 0
for _items, _expected in _cases:
    _actual = dedupe(_items)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: dedupe({_items!r}) == {_expected!r}")
    else:
        print(f"FAIL: dedupe({_items!r}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000002', 2, 'Most Common Word', 'medium', 'Write most_common_word(text) that lowercases text, splits it on whitespace, and returns the word that appears most often.', 'collections.Counter (or a plain dict) makes counting easy; max(dict, key=dict.get) finds the most frequent key.', $py$def most_common_word(text):
    # TODO: return the most frequent word in text (case-insensitive)
    pass
$py$, $py$_cases = [
    ("the cat sat on the mat the cat ran", "the"),
    ("a a b b b c", "b"),
    ("one", "one"),
]
_passed = 0
for _text, _expected in _cases:
    _actual = most_common_word(_text)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: most_common_word({_text!r}) == {_expected!r}")
    else:
        print(f"FAIL: most_common_word({_text!r}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', 1, 'Rectangle Class', 'easy', 'Implement the area() and perimeter() methods on the Rectangle class below.', 'area = width * height. perimeter = 2 * (width + height).', $py$class Rectangle:
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def area(self):
        # TODO
        pass

    def perimeter(self):
        # TODO
        pass
$py$, $py$_cases = [
    ((3, 4), 12, 14),
    ((5, 5), 25, 20),
    ((1, 10), 10, 22),
]
_passed = 0
_total = 0
for _dims, _area, _perim in _cases:
    r = Rectangle(*_dims)
    _total += 1
    if r.area() == _area:
        _passed += 1
        print(f"PASS: Rectangle{_dims}.area() == {_area}")
    else:
        print(f"FAIL: Rectangle{_dims}.area() returned {r.area()!r}, expected {_area!r}")
    _total += 1
    if r.perimeter() == _perim:
        _passed += 1
        print(f"PASS: Rectangle{_dims}.perimeter() == {_perim}")
    else:
        print(f"FAIL: Rectangle{_dims}.perimeter() returned {r.perimeter()!r}, expected {_perim!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000003', 2, 'Stack Class', 'medium', 'Implement push, pop, peek, and __len__ on the Stack class so it behaves as a standard LIFO stack backed by self.items.', 'push appends to the end of the list; pop and peek both look at the last element -- list.pop() and list[-1] do exactly that.', $py$class Stack:
    def __init__(self):
        self.items = []

    def push(self, item):
        # TODO
        pass

    def pop(self):
        # TODO: remove and return the top item
        pass

    def peek(self):
        # TODO: return the top item without removing it
        pass

    def __len__(self):
        # TODO
        pass
$py$, $py$_passed = 0
_total = 0
s = Stack()
s.push(1)
s.push(2)
s.push(3)

_total += 1
if len(s) == 3:
    _passed += 1
    print("PASS: len(s) == 3 after three pushes")
else:
    print(f"FAIL: len(s) returned {len(s)!r}, expected 3")

_total += 1
if s.peek() == 3:
    _passed += 1
    print("PASS: s.peek() == 3")
else:
    print(f"FAIL: s.peek() returned {s.peek()!r}, expected 3")

_total += 1
_popped = s.pop()
if _popped == 3:
    _passed += 1
    print("PASS: s.pop() == 3 (LIFO order)")
else:
    print(f"FAIL: s.pop() returned {_popped!r}, expected 3")

_total += 1
if len(s) == 2:
    _passed += 1
    print("PASS: len(s) == 2 after one pop")
else:
    print(f"FAIL: len(s) returned {len(s)!r}, expected 2")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', 1, 'Even Number Generator', 'easy', 'Write even_numbers(n) as a generator that yields every even number from 0 up to and including n.', 'Use `yield` inside a loop instead of building a list. range(0, n + 1, 2) already steps by 2.', $py$def even_numbers(n):
    # TODO: generator yielding even numbers from 0 up to and including n
    pass
$py$, $py$_cases = [
    (10, [0, 2, 4, 6, 8, 10]),
    (1, [0]),
    (0, [0]),
]
_passed = 0
for _n, _expected in _cases:
    _actual = list(even_numbers(_n))
    if _actual == _expected:
        _passed += 1
        print(f"PASS: list(even_numbers({_n})) == {_expected!r}")
    else:
        print(f"FAIL: list(even_numbers({_n})) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000004', 2, 'Call Counter Decorator', 'medium', 'Write a decorator count_calls that wraps a function, forwards its arguments and return value unchanged, and tracks how many times it''s been called on wrapper.calls.', 'Set wrapper.calls = 0 once, outside the inner function, then increment it each time wrapper runs before calling func(*args, **kwargs).', $py$def count_calls(func):
    def wrapper(*args, **kwargs):
        # TODO: increment a call counter and forward to func
        pass
    wrapper.calls = 0
    return wrapper
$py$, $py$@count_calls
def add(a, b):
    return a + b

_passed = 0
_total = 0

_total += 1
_r1 = add(1, 2)
if _r1 == 3:
    _passed += 1
    print("PASS: add(1, 2) == 3")
else:
    print(f"FAIL: add(1, 2) returned {_r1!r}, expected 3")

_total += 1
_r2 = add(5, 5)
if _r2 == 10:
    _passed += 1
    print("PASS: add(5, 5) == 10")
else:
    print(f"FAIL: add(5, 5) returned {_r2!r}, expected 10")

add(2, 2)

_total += 1
if add.calls == 3:
    _passed += 1
    print("PASS: add.calls == 3 after three calls")
else:
    print(f"FAIL: add.calls returned {add.calls!r}, expected 3")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', 1, 'Safe Divide', 'easy', 'Write safe_divide(a, b) that returns a / b, or None instead of raising when b is 0.', 'Wrap the division in a try/except ZeroDivisionError block.', $py$def safe_divide(a, b):
    # TODO: return a / b, or None on division by zero
    pass
$py$, $py$_cases = [
    ((10, 2), 5.0),
    ((5, 0), None),
    ((-9, 3), -3.0),
]
_passed = 0
for _args, _expected in _cases:
    _actual = safe_divide(*_args)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: safe_divide{_args} == {_expected!r}")
    else:
        print(f"FAIL: safe_divide{_args} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000005', 2, 'Validate Config Dict', 'medium', 'Write validate_config(config, schema) where schema maps required keys to expected types. Return True if config has every key with the right type; otherwise raise ValueError with a helpful message.', 'Loop over schema.items(); check `key not in config` first, then `isinstance(config[key], expected_type)`.', $py$def validate_config(config, schema):
    # TODO: raise ValueError if a key is missing or has the wrong type, else return True
    pass
$py$, $py$_passed = 0
_total = 0

_total += 1
if validate_config({"a": 1, "b": "x"}, {"a": int, "b": str}) is True:
    _passed += 1
    print("PASS: valid config returns True")
else:
    print("FAIL: valid config did not return True")

_total += 1
try:
    validate_config({"a": 1}, {"a": int, "b": str})
    print("FAIL: expected ValueError for missing key")
except ValueError:
    _passed += 1
    print("PASS: raises ValueError on missing key")
except Exception as e:
    print(f"FAIL: wrong exception type {type(e).__name__}")

_total += 1
try:
    validate_config({"a": "nope", "b": "x"}, {"a": int, "b": str})
    print("FAIL: expected ValueError for wrong type")
except ValueError:
    _passed += 1
    print("PASS: raises ValueError on wrong type")
except Exception as e:
    print(f"FAIL: wrong exception type {type(e).__name__}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', 1, 'Simple Fixed-Size Cache', 'easy', 'Implement put(key, value) and get(key) on SimpleCache so that once max_size is exceeded, the oldest-inserted key is evicted first (FIFO, not true LRU).', 'Keep a list tracking insertion order alongside the dict. When put() would exceed max_size on a new key, pop the oldest key from the front of that list and delete it from the dict.', $py$class SimpleCache:
    def __init__(self, max_size):
        self.max_size = max_size
        self.data = {}
        self.order = []

    def put(self, key, value):
        # TODO: evict the oldest-inserted key if this is a new key and the cache is full
        pass

    def get(self, key):
        # TODO: return the value for key, or None if missing
        pass
$py$, $py$_passed = 0
_total = 0
c = SimpleCache(2)
c.put("a", 1)
c.put("b", 2)
c.put("c", 3)

_total += 1
if c.get("a") is None:
    _passed += 1
    print("PASS: oldest key 'a' evicted once cache exceeded max_size")
else:
    print(f"FAIL: c.get('a') returned {c.get('a')!r}, expected None (evicted)")

_total += 1
if c.get("b") == 2:
    _passed += 1
    print("PASS: c.get('b') == 2")
else:
    print(f"FAIL: c.get('b') returned {c.get('b')!r}, expected 2")

_total += 1
if c.get("c") == 3:
    _passed += 1
    print("PASS: c.get('c') == 3")
else:
    print(f"FAIL: c.get('c') returned {c.get('c')!r}, expected 3")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000006', 2, 'Batch Processor', 'medium', 'Write chunk(items, size) that splits items into a list of lists, each of length size (the last chunk may be shorter).', 'A list comprehension over range(0, len(items), size), slicing items[i:i+size] each time, does this in one line.', $py$def chunk(items, size):
    # TODO: split items into chunks of length size
    pass
$py$, $py$_cases = [
    (([1, 2, 3, 4, 5], 2), [[1, 2], [3, 4], [5]]),
    (([], 3), []),
    (([1, 2, 3], 1), [[1], [2], [3]]),
]
_passed = 0
for _args, _expected in _cases:
    _actual = chunk(*_args)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: chunk{_args} == {_expected!r}")
    else:
        print(f"FAIL: chunk{_args} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', 1, 'Parse Query String', 'easy', 'Write parse_query_string(qs) that parses a URL query string like ''a=1&b=2'' into a dict {''a'': ''1'', ''b'': ''2''}, without using urllib. An empty string should return {}.', 'Split on ''&'' to get each pair, then split each pair on ''='' to get the key and value.', $py$def parse_query_string(qs):
    # TODO: parse a query string like 'a=1&b=2' into a dict
    pass
$py$, $py$_cases = [
    ("a=1&b=2&c=3", {"a": "1", "b": "2", "c": "3"}),
    ("", {}),
    ("name=alice", {"name": "alice"}),
]
_passed = 0
for _qs, _expected in _cases:
    _actual = parse_query_string(_qs)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: parse_query_string({_qs!r}) == {_expected!r}")
    else:
        print(f"FAIL: parse_query_string({_qs!r}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000007', 2, 'Validate Email Format', 'medium', 'Write is_valid_email(s) that does lightweight validation without regex: exactly one ''@'', no spaces, and a ''.'' somewhere in the domain part that isn''t at the very start or end of it.', 's.count(''@'') and s.split(''@'') get you the local and domain parts to inspect separately.', $py$def is_valid_email(s):
    # TODO: lightweight email format check, no regex needed
    pass
$py$, $py$_cases = [
    ("alice@example.com", True),
    ("bad-email", False),
    ("two@@example.com", False),
    ("has space@example.com", False),
    ("no-domain-dot@example", False),
]
_passed = 0
for _email, _expected in _cases:
    _actual = is_valid_email(_email)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: is_valid_email({_email!r}) == {_expected!r}")
    else:
        print(f"FAIL: is_valid_email({_email!r}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', 1, 'Two Sum', 'easy', 'Write two_sum(nums, target) that returns a tuple of the two indices whose values add up to target, sorted ascending. Assume exactly one solution exists.', 'Walk the list once, keeping a dict of value -> index seen so far. For each number, check if target - number is already in that dict.', $py$def two_sum(nums, target):
    # TODO: return the (sorted) tuple of indices whose values sum to target
    pass
$py$, $py$_cases = [
    (([2, 7, 11, 15], 9), (0, 1)),
    (([3, 2, 4], 6), (1, 2)),
    (([3, 3], 6), (0, 1)),
]
_passed = 0
for _args, _expected in _cases:
    _actual = two_sum(*_args)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: two_sum{_args} == {_expected!r}")
    else:
        print(f"FAIL: two_sum{_args} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000008', 2, 'Valid Parentheses', 'medium', 'Write is_valid_parens(s) that returns True if every bracket in s -- (), [], {} -- is properly opened and closed in the right order.', 'Push opening brackets onto a stack; on a closing bracket, it must match the top of the stack (pop it) or the string is invalid.', $py$def is_valid_parens(s):
    # TODO: return True if all brackets in s are balanced and correctly nested
    pass
$py$, $py$_cases = [
    ("()[]{}", True),
    ("(]", False),
    ("", True),
    ("(((", False),
    ("{[()]}", True),
]
_passed = 0
for _s, _expected in _cases:
    _actual = is_valid_parens(_s)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: is_valid_parens({_s!r}) == {_expected!r}")
    else:
        print(f"FAIL: is_valid_parens({_s!r}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', 1, 'Merge Overlapping Intervals', 'medium', 'Write merge_intervals(intervals) that merges all overlapping [start, end] pairs and returns the merged list sorted by start.', 'Sort by start first. Then walk through: if the next interval''s start is <= the current merged interval''s end, extend it; otherwise start a new merged interval.', $py$def merge_intervals(intervals):
    # TODO: merge overlapping [start, end] pairs, sorted by start
    pass
$py$, $py$_cases = [
    ([[1, 3], [2, 6], [8, 10], [15, 18]], [[1, 6], [8, 10], [15, 18]]),
    ([], []),
    ([[1, 4], [4, 5]], [[1, 5]]),
]
_passed = 0
for _intervals, _expected in _cases:
    _actual = merge_intervals(_intervals)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: merge_intervals({_intervals!r}) == {_expected!r}")
    else:
        print(f"FAIL: merge_intervals({_intervals!r}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000009', 2, 'Top Words Report', 'hard', 'Write top_words(text, n) that strips punctuation, lowercases text, and returns the n most common words as (word, count) tuples -- ties broken alphabetically, most frequent first.', 'string.punctuation lists punctuation characters to strip. Sort by (-count, word) so higher counts come first and ties break alphabetically.', $py$def top_words(text, n):
    # TODO: return the n most common words as (word, count) tuples
    pass
$py$, $py$_text = "The quick brown fox. The quick dog! The fox ran."
_expected = [("the", 3), ("fox", 2), ("quick", 2)]
_actual = top_words(_text, 3)
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: top_words(...) == {_expected!r}")
else:
    print(f"FAIL: top_words(...) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$);
