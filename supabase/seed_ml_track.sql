-- ML track: Phases 10-16, 55 concepts, 495 auto-graded challenges,
-- one micro-project per concept plus one mini-project per phase.
--
-- Every challenge's reference solution was run end-to-end via Python
-- (numpy/pandas/scikit-learn/scipy/matplotlib) to confirm its test_code
-- actually passes before being included here. No spine-project rows --
-- the spine project concluded its retrospective at the Phase 9 Capstone
-- and isn't extended into the ML phases.
--
-- Run this after supabase/migrations/0006_bamboo.sql (no new migration
-- needed -- phases/concepts/projects/challenges already support this).

insert into phases (id, order_index, title, summary, is_spine_track) values
  ('00000000-0000-0000-0000-000000000010', 10, 'Math & Data Foundations for ML',
   'The math and data-handling toolkit -- vectors, matrices, NumPy, statistics, probability, linear systems, derivatives, and plotting -- that every later ML phase builds on.', false),
  ('00000000-0000-0000-0000-000000000011', 11, 'Data Wrangling with pandas',
   'Load, clean, reshape, and summarize tabular data with pandas -- the foundational toolkit for every machine learning workflow that follows.', false),
  ('00000000-0000-0000-0000-000000000012', 12, 'Classical ML I -- Regression',
   'Build regression models from first principles -- gradient descent by hand, then scikit-learn, cost functions, polynomial features, regularization, and how to properly evaluate what you''ve built.', false),
  ('00000000-0000-0000-0000-000000000013', 13, 'Classical ML II -- Classification & Clustering',
   'Build and apply the core classification and clustering algorithms -- logistic regression, decision trees, KNN, Naive Bayes, and k-means -- then learn to evaluate and validate them rigorously with proper metrics and cross-validation.', false),
  ('00000000-0000-0000-0000-000000000014', 14, 'Model Evaluation & Practical ML',
   'Move from fitting models to evaluating and shipping them well: diagnose the bias-variance tradeoff, tune hyperparameters with grid search, reduce dimensionality with PCA, handle imbalanced classes, build leak-free scikit-learn pipelines, persist trained models, and combine all of it into one end-to-end mini-project on a realistic tabular dataset.', false),
  ('00000000-0000-0000-0000-000000000015', 15, 'Neural Networks From Scratch',
   'Build a neural network from raw NumPy -- perceptrons, activation functions, forward propagation, loss functions, and backpropagation derived and implemented by hand -- culminating in training a 2-layer network to solve XOR, while being honest about where this browser sandbox''s numerical horsepower runs out.', false),
  ('00000000-0000-0000-0000-000000000016', 16, 'ML Capstone',
   'Take a trained model the rest of the way: scope it honestly, architect its pipeline end to end, evaluate and iterate methodically, write it up in a model card, and reason through what real deployment would require.', false)
on conflict (id) do nothing;

-- Concepts

insert into concepts (id, phase_id, order_index, title) values
  ('10000000-0000-0000-0000-000000000076', '00000000-0000-0000-0000-000000000010', 1, 'Vectors & vector operations'),
  ('10000000-0000-0000-0000-000000000077', '00000000-0000-0000-0000-000000000010', 2, 'Matrices & matrix operations'),
  ('10000000-0000-0000-0000-000000000078', '00000000-0000-0000-0000-000000000010', 3, 'NumPy arrays & indexing'),
  ('10000000-0000-0000-0000-000000000079', '00000000-0000-0000-0000-000000000010', 4, 'Broadcasting & vectorized operations'),
  ('10000000-0000-0000-0000-000000000080', '00000000-0000-0000-0000-000000000010', 5, 'Descriptive statistics (mean/variance/std/correlation)'),
  ('10000000-0000-0000-0000-000000000081', '00000000-0000-0000-0000-000000000010', 6, 'Probability basics & distributions'),
  ('10000000-0000-0000-0000-000000000082', '00000000-0000-0000-0000-000000000010', 7, 'Linear equations as systems'),
  ('10000000-0000-0000-0000-000000000083', '00000000-0000-0000-0000-000000000010', 8, 'Derivatives & the idea of a gradient'),
  ('10000000-0000-0000-0000-000000000084', '00000000-0000-0000-0000-000000000010', 9, 'Plotting with matplotlib'),
  ('10000000-0000-0000-0000-000000000085', '00000000-0000-0000-0000-000000000010', 10, 'Random numbers & reproducible seeds'),
  ('10000000-0000-0000-0000-000000000086', '00000000-0000-0000-0000-000000000011', 1, 'DataFrames & Series basics'),
  ('10000000-0000-0000-0000-000000000087', '00000000-0000-0000-0000-000000000011', 2, 'Reading & writing CSV/JSON'),
  ('10000000-0000-0000-0000-000000000088', '00000000-0000-0000-0000-000000000011', 3, 'Selecting, filtering & indexing data'),
  ('10000000-0000-0000-0000-000000000089', '00000000-0000-0000-0000-000000000011', 4, 'Handling missing data'),
  ('10000000-0000-0000-0000-000000000090', '00000000-0000-0000-0000-000000000011', 5, 'GroupBy & aggregation'),
  ('10000000-0000-0000-0000-000000000091', '00000000-0000-0000-0000-000000000011', 6, 'Merging & joining datasets'),
  ('10000000-0000-0000-0000-000000000092', '00000000-0000-0000-0000-000000000011', 7, 'Feature engineering basics'),
  ('10000000-0000-0000-0000-000000000093', '00000000-0000-0000-0000-000000000011', 8, 'End-to-end EDA workflow'),
  ('10000000-0000-0000-0000-000000000094', '00000000-0000-0000-0000-000000000012', 1, 'What is machine learning? Train/test split'),
  ('10000000-0000-0000-0000-000000000095', '00000000-0000-0000-0000-000000000012', 2, 'Linear regression from scratch'),
  ('10000000-0000-0000-0000-000000000096', '00000000-0000-0000-0000-000000000012', 3, 'Linear regression with scikit-learn'),
  ('10000000-0000-0000-0000-000000000097', '00000000-0000-0000-0000-000000000012', 4, 'Cost functions & loss (MSE)'),
  ('10000000-0000-0000-0000-000000000098', '00000000-0000-0000-0000-000000000012', 5, 'Gradient descent deep dive'),
  ('10000000-0000-0000-0000-000000000099', '00000000-0000-0000-0000-000000000012', 6, 'Polynomial regression & overfitting'),
  ('10000000-0000-0000-0000-000000000100', '00000000-0000-0000-0000-000000000012', 7, 'Regularization -- Ridge & Lasso'),
  ('10000000-0000-0000-0000-000000000101', '00000000-0000-0000-0000-000000000012', 8, 'Evaluating regression models'),
  ('10000000-0000-0000-0000-000000000102', '00000000-0000-0000-0000-000000000013', 1, 'Logistic regression from scratch'),
  ('10000000-0000-0000-0000-000000000103', '00000000-0000-0000-0000-000000000013', 2, 'Logistic regression with scikit-learn'),
  ('10000000-0000-0000-0000-000000000104', '00000000-0000-0000-0000-000000000013', 3, 'Decision trees'),
  ('10000000-0000-0000-0000-000000000105', '00000000-0000-0000-0000-000000000013', 4, 'k-Nearest Neighbors'),
  ('10000000-0000-0000-0000-000000000106', '00000000-0000-0000-0000-000000000013', 5, 'Naive Bayes'),
  ('10000000-0000-0000-0000-000000000107', '00000000-0000-0000-0000-000000000013', 6, 'k-Means clustering'),
  ('10000000-0000-0000-0000-000000000108', '00000000-0000-0000-0000-000000000013', 7, 'Evaluating classifiers (precision/recall/F1/confusion matrix)'),
  ('10000000-0000-0000-0000-000000000109', '00000000-0000-0000-0000-000000000013', 8, 'Cross-validation'),
  ('10000000-0000-0000-0000-000000000110', '00000000-0000-0000-0000-000000000013', 9, 'Feature scaling & preprocessing'),
  ('10000000-0000-0000-0000-000000000111', '00000000-0000-0000-0000-000000000014', 1, 'Bias-variance tradeoff'),
  ('10000000-0000-0000-0000-000000000112', '00000000-0000-0000-0000-000000000014', 2, 'Hyperparameter tuning & grid search'),
  ('10000000-0000-0000-0000-000000000113', '00000000-0000-0000-0000-000000000014', 3, 'Dimensionality reduction (PCA)'),
  ('10000000-0000-0000-0000-000000000114', '00000000-0000-0000-0000-000000000014', 4, 'Handling imbalanced data'),
  ('10000000-0000-0000-0000-000000000115', '00000000-0000-0000-0000-000000000014', 5, 'Pipelines & preprocessing in scikit-learn'),
  ('10000000-0000-0000-0000-000000000116', '00000000-0000-0000-0000-000000000014', 6, 'Saving & loading trained models'),
  ('10000000-0000-0000-0000-000000000117', '00000000-0000-0000-0000-000000000014', 7, 'End-to-end mini-project (real tabular dataset)'),
  ('10000000-0000-0000-0000-000000000118', '00000000-0000-0000-0000-000000000015', 1, 'The perceptron'),
  ('10000000-0000-0000-0000-000000000119', '00000000-0000-0000-0000-000000000015', 2, 'Activation functions & nonlinearity'),
  ('10000000-0000-0000-0000-000000000120', '00000000-0000-0000-0000-000000000015', 3, 'Forward propagation, by hand'),
  ('10000000-0000-0000-0000-000000000121', '00000000-0000-0000-0000-000000000015', 4, 'Loss functions for neural nets'),
  ('10000000-0000-0000-0000-000000000122', '00000000-0000-0000-0000-000000000015', 5, 'Backpropagation, derived'),
  ('10000000-0000-0000-0000-000000000123', '00000000-0000-0000-0000-000000000015', 6, 'Implementing backprop in NumPy'),
  ('10000000-0000-0000-0000-000000000124', '00000000-0000-0000-0000-000000000015', 7, 'Training loops, epochs & batches'),
  ('10000000-0000-0000-0000-000000000125', '00000000-0000-0000-0000-000000000015', 8, 'Where this platform''s limits are, and what''s next'),
  ('10000000-0000-0000-0000-000000000126', '00000000-0000-0000-0000-000000000016', 1, 'Scoping an ML project'),
  ('10000000-0000-0000-0000-000000000127', '00000000-0000-0000-0000-000000000016', 2, 'End-to-end pipeline architecture'),
  ('10000000-0000-0000-0000-000000000128', '00000000-0000-0000-0000-000000000016', 3, 'Evaluation & iteration methodology'),
  ('10000000-0000-0000-0000-000000000129', '00000000-0000-0000-0000-000000000016', 4, 'Writing up results (a model card)'),
  ('10000000-0000-0000-0000-000000000130', '00000000-0000-0000-0000-000000000016', 5, 'Deployment, conceptually')
on conflict (id) do nothing;

-- Lesson content

update concepts set lesson_content = $py$A vector is just an ordered list of numbers. In 2D or 3D you can picture it as an arrow from the origin, but the same idea works in any number of dimensions -- a row of a spreadsheet, a set of pixel values, a student's three exam scores. Before reaching for a library, it's worth building the core operations yourself with plain tuples so the math stays visible.

```python
a = (2, 3)
b = (1, -1)

def add(v1, v2):
    return tuple(x + y for x, y in zip(v1, v2))

def dot(v1, v2):
    return sum(x * y for x, y in zip(v1, v2))

print(add(a, b))   # (3, 2)
print(dot(a, b))   # -1
```

Two operations matter most for what comes later: component-wise addition/scaling, and the dot product -- multiply matching components and sum them into a single number that measures how much two vectors point in the same direction. A vector's magnitude (its length) is `sqrt(dot(v, v))`, and dividing a vector by its own magnitude gives a "unit vector" -- same direction, length 1.

## Why it matters

Every feature in a machine learning dataset -- a row of measurements, a word's embedding, an image's pixel values -- is a vector, and the dot product is the single most-used operation in ML: it's the core of similarity scores, weighted sums in a neural network layer, and cosine similarity between documents. Understanding it as "multiply and sum" before ever seeing `np.dot` makes every later NumPy call transparent instead of magical.

## Common mistakes

- Adding vectors of different lengths -- `zip()` silently truncates to the shorter one instead of raising an error, so a length mismatch can hide a real bug.
- Confusing the dot product (a single number) with element-wise multiplication (a vector of the same length) -- they use the same numbers but produce completely different kinds of results.
- Forgetting that magnitude requires a square root -- `dot(v, v)` alone is the *squared* magnitude, not the magnitude itself.
- Assuming a unit vector's components must be 0 or 1 -- "unit" refers to the vector's total length being 1, not any individual component.

## Key points

- A vector is an ordered tuple of numbers; addition and scaling work component-wise.
- The dot product multiplies matching components and sums them into one scalar.
- Magnitude is `sqrt(dot(v, v))`; a unit vector is `v` divided by its own magnitude.
$py$ where id = '10000000-0000-0000-0000-000000000076';
update concepts set lesson_content = $py$A matrix is a rectangular grid of numbers -- rows and columns -- and in plain Python the natural way to represent one is a list of lists, where each inner list is a row. Before NumPy makes this fast and convenient, it's worth building transpose, addition, and multiplication by hand so the mechanics are clear.

```python
m = [[1, 2, 3],
     [4, 5, 6]]

def transpose(matrix):
    return [list(row) for row in zip(*matrix)]

print(transpose(m))
# [[1, 4], [2, 5], [3, 6]]
```

`m` has 2 rows and 3 columns (a "2x3" matrix). Transposing flips rows into columns -- `zip(*matrix)` is a compact trick that unpacks the rows and regroups them by position. Matrix multiplication is the operation to get comfortable with early: each entry of the result is a dot product of a row from the first matrix and a column from the second, which only works when the first matrix's column count matches the second's row count.

## Why it matters

Matrices are how ML represents entire datasets and entire layers of computation at once -- a dataset is a matrix of rows (examples) by columns (features), and a neural network layer is "multiply the input matrix by a weight matrix." Every later concept (NumPy arrays, linear systems, gradients) is really just matrices with faster machinery underneath, so the row-times-column mental model here is foundational.

## Common mistakes

- Multiplying matrices whose shapes don't line up -- an (m x n) matrix can only multiply an (n x p) matrix; mixing this up is the single most common matrix bug.
- Confusing element-wise multiplication (same-shape matrices, multiply matching positions) with true matrix multiplication (row dot column) -- they're different operations that happen to look similar.
- Forgetting that matrix multiplication isn't commutative -- `A @ B` and `B @ A` are usually different, and one of them may not even be valid.
- Assuming every matrix has a "trace" (sum of the diagonal) -- it's only defined for square matrices (same number of rows and columns).

## Key points

- A matrix is naturally a list of lists; `matrix[i][j]` is row `i`, column `j`.
- Transposing swaps rows and columns; `zip(*matrix)` does it compactly.
- Multiplication combines rows of the left matrix with columns of the right one via dot products, and requires matching inner dimensions.
$py$ where id = '10000000-0000-0000-0000-000000000077';
update concepts set lesson_content = $py$NumPy's `ndarray` is the tool version of the vectors and matrices you've been building by hand -- a grid of numbers stored compactly, with fast operations implemented in C underneath. Creating one is usually a call to `np.array()` on a list (or list of lists), and every array has a `.shape` (its dimensions) and a `.dtype` (the type of its elements, usually a fixed-size float or int, not Python's flexible `int`/`float`).

```python
import numpy as np

a = np.array([1, 2, 3])
m = np.array([[1, 2, 3], [4, 5, 6]])

print(a.shape)      # (3,)
print(m.shape)       # (2, 3)
print(m[1, 2])       # 6  -- row 1, column 2
print(m[:, 1])       # [2 5] -- the whole second column
print(a[a > 1])      # [2 3] -- boolean mask filtering
```

Indexing a 2D array uses a single pair of brackets with a comma, `m[row, col]`, unlike a list of lists which needs `m[row][col]`. Slicing works per axis (`m[:, 1]` means "every row, column 1"), and a boolean mask -- an array of `True`/`False` the same shape as the array -- lets you filter by condition without writing a loop.

## Why it matters

NumPy arrays are the actual data structure behind pandas DataFrames, scikit-learn inputs, and image/audio data in every ML pipeline -- the list-of-lists math from the last two lessons still applies, but now it runs orders of magnitude faster and supports the indexing tricks (boolean masks, fancy indexing) that make real data cleaning practical.

## Common mistakes

- Using `m[i][j]` instead of `m[i, j]` on a 2D array -- both usually work, but `m[i][j]` builds an intermediate 1D array first and is slower; `m[i, j]` is the idiomatic form.
- Forgetting that slicing a NumPy array returns a *view*, not a copy -- modifying the slice can modify the original array; use `.copy()` when you need an independent copy.
- Mixing Python lists and NumPy arrays without converting -- `np.array()` on an existing array is a no-op (or makes a copy), but forgetting to convert a plain list before using array-only features like boolean masking raises an error.
- Assuming `arr.shape` returns width-first like image dimensions sometimes do -- NumPy's convention is always `(rows, columns)`, i.e. axis 0 first.

## Key points

- `np.array()` builds an array from a (possibly nested) Python list; `.shape` and `.dtype` describe it.
- 2D indexing/slicing uses one bracket pair with a comma: `m[row, col]`, `m[:, col]`.
- A boolean mask (`arr > threshold`) selects elements matching a condition without an explicit loop.
$py$ where id = '10000000-0000-0000-0000-000000000078';
update concepts set lesson_content = $py$Vectorized operations apply an operation to every element of an array at once -- `arr * 2` doubles every entry, no loop written. Broadcasting is the rule NumPy uses to make operations between differently-shaped arrays work anyway, by conceptually "stretching" the smaller one to match, without actually copying data.

```python
import numpy as np

prices = np.array([10.0, 20.0, 30.0])
print(prices * 1.1)              # [11. 22. 33.] -- scalar broadcast to every element

matrix = np.array([[1, 2, 3], [4, 5, 6]])
row = np.array([10, 20, 30])
print(matrix + row)              # row is broadcast across every row of matrix
# [[11 22 33]
#  [14 25 36]]
```

The broadcasting rule: compare shapes from the right; two dimensions are compatible if they're equal, or one of them is 1 (or missing). A `(2, 3)` matrix and a `(3,)` row satisfy this -- the row is treated as if it had shape `(1, 3)` and repeated for each of the 2 rows. This replaces explicit loops with fast, C-level operations, and is why NumPy code runs orders of magnitude faster than the equivalent pure-Python loop.

## Why it matters

Broadcasting is what makes operations like "subtract the mean from every row" or "add a bias vector to every row of a batch" a single line instead of a loop -- and that single line runs in optimized C rather than the Python interpreter, which matters enormously once datasets have thousands or millions of rows.

## Common mistakes

- Assuming any two shapes broadcast together -- `(3,)` and `(4,)` don't; broadcasting only helps when dimensions match or one of them is exactly 1.
- Forgetting that broadcasting compares shapes from the *right* -- a `(3, 1)` column and a `(3,)` row actually broadcast to a `(3, 3)` matrix, which surprises people expecting elementwise behavior.
- Writing a Python `for` loop over array elements out of habit -- it works, but throws away the entire speed benefit; reach for the vectorized version first.
- Comparing floating-point results from vectorized math with `==` -- broadcasting doesn't change the usual floating-point tolerance rule; use `np.allclose` or a manual tolerance check.

## Key points

- Vectorized operations (`arr + 1`, `arr * arr2`) apply element-wise without an explicit loop.
- Broadcasting lets differently-shaped arrays combine when their trailing dimensions match or are 1.
- Broadcasting never copies data to "stretch" the smaller array -- it's a virtual repeat, which is part of why it's fast.
$py$ where id = '10000000-0000-0000-0000-000000000079';
update concepts set lesson_content = $py$Descriptive statistics summarize a dataset with a handful of numbers instead of scrolling through every row. The mean is the average; variance measures how spread out the values are (the average squared distance from the mean); standard deviation is variance's square root, back in the original units.

```python
import numpy as np

scores = np.array([72, 85, 90, 68, 95])
print(scores.mean())    # 82.0
print(scores.std())     # ~10.36  -- population standard deviation
print(scores.var())     # ~107.36

hours = np.array([1, 2, 3, 4, 5])
grades = np.array([60, 65, 75, 80, 90])
print(np.corrcoef(hours, grades)[0, 1])   # ~0.986 -- strong positive correlation
```

Correlation measures how two variables move together, from -1 (perfectly opposite) to 1 (perfectly together); `np.corrcoef` returns a 2x2 matrix where the off-diagonal entries are the correlation you usually want. NumPy's `.std()`/`.var()` default to the *population* formula (divide by n); pass `ddof=1` for the *sample* formula (divide by n-1), which is what you want when your data is a sample rather than the entire population.

## Why it matters

Before fitting any model, the first real step in almost every ML workflow is looking at these numbers -- mean and std reveal scale differences between features (which matters for many algorithms), and correlation flags redundant or suspiciously related columns before they cause problems downstream.

## Common mistakes

- Using `.std()`'s default (population, `ddof=0`) when the data is really a *sample* meant to estimate a larger population's spread -- pass `ddof=1` for the sample standard deviation, which is what `statistics.stdev` and pandas' `.std()` both default to.
- Reading `np.corrcoef(x, y)` and expecting a single number -- it returns a 2x2 matrix; the correlation you want is at `[0, 1]` (or equivalently `[1, 0]`).
- Assuming correlation close to 0 means "no relationship" -- it only rules out a *linear* relationship; two variables can be strongly related in a curved, non-linear way and still show near-zero correlation.
- Comparing computed floats with `==` -- always check statistics with a tolerance (`abs(a - b) < 1e-6`) rather than exact equality.

## Key points

- Mean is the average; variance is the average squared deviation from the mean; std is variance's square root.
- `ddof=0` (default) computes the population formula; `ddof=1` computes the sample formula (divide by n-1).
- Correlation ranges from -1 to 1 and measures *linear* association only.
$py$ where id = '10000000-0000-0000-0000-000000000080';
update concepts set lesson_content = $py$Probability measures how likely an event is, from 0 (never happens) to 1 (always happens) -- usually written as favorable outcomes divided by total possible outcomes. A few rules combine probabilities: the complement of event A is `1 - P(A)`; for independent events, `P(A and B) = P(A) * P(B)`; for any two events, `P(A or B) = P(A) + P(B) - P(A and B)`.

```python
import math

p_heads = 0.5
p_two_heads = p_heads * p_heads          # independent events: 0.25

n, k, p = 10, 3, 0.5
p_exactly_3 = math.comb(n, k) * p**k * (1 - p) ** (n - k)
print(round(p_exactly_3, 4))              # ~0.1172 -- binomial probability
```

A probability *distribution* describes the full range of possible outcomes and how likely each one is. The binomial distribution models "how many successes in n independent yes/no trials"; the normal (Gaussian) distribution models continuous, symmetric, bell-shaped data and is described entirely by its mean and standard deviation. `scipy.stats` provides ready-made pdf/pmf functions for these instead of re-deriving the formulas each time.

## Why it matters

Probability is the language ML uses to express uncertainty -- a classifier's output isn't just "cat" or "dog," it's a probability for each class, and understanding independence, conditional probability, and common distributions is what lets you interpret those numbers correctly instead of treating a model as a black box.

## Common mistakes

- Multiplying probabilities for events that aren't actually independent -- `P(A and B) = P(A) * P(B)` only holds when A and B don't influence each other; otherwise you need the conditional probability formula.
- Adding probabilities of overlapping events without subtracting the overlap -- `P(A or B) = P(A) + P(B)` double-counts outcomes in both A and B unless they're mutually exclusive.
- Confusing a probability *density* (from a continuous distribution's pdf) with an actual probability -- a pdf value can exceed 1; only the area under a range of it corresponds to a probability.
- Running any random simulation without a fixed seed -- makes results impossible to reproduce or verify; always seed before generating "random" data in a test.

## Key points

- Probability ranges from 0 to 1; complement, independence, and union rules combine simple probabilities into compound ones.
- The binomial distribution counts successes across independent trials; the normal distribution models continuous, bell-shaped data.
- Fix a random seed whenever a calculation involves simulated randomness, so results are reproducible.
$py$ where id = '10000000-0000-0000-0000-000000000081';
update concepts set lesson_content = $py$A system of linear equations like `2x + y = 5` and `x - y = 1` can be rewritten as a single matrix equation `Ax = b`, where `A` holds the coefficients, `x` is the vector of unknowns, and `b` is the vector of right-hand sides. This is exactly the matrix-vector multiplication from two lessons ago, run in reverse: instead of computing `Ax` from a known `x`, you're solving for the unknown `x` that produces a known `b`.

```python
import numpy as np

A = np.array([[2, 1],
              [1, -1]])
b = np.array([5, 1])

x = np.linalg.solve(A, b)
print(x)               # [2. 1.]  -- x=2, y=1

print(A @ x)            # [5. 1.]  -- confirms Ax == b
```

`np.linalg.solve` finds the exact solution when one exists and is unique -- which happens exactly when `A`'s determinant is nonzero (`np.linalg.det(A) != 0`). A zero determinant means the equations are either contradictory (no solution) or redundant (infinitely many solutions), and `solve` will raise an error in that case rather than guess.

## Why it matters

Solving linear systems is the mathematical core of linear regression -- fitting a line (or hyperplane) to data comes down to solving, or approximately solving, a system like this for the coefficients that best match the data, and later ML phases build directly on `np.linalg.solve` and related functions.

## Common mistakes

- Calling `np.linalg.solve` on a non-square matrix -- it requires exactly as many equations as unknowns; for more equations than unknowns (an overdetermined system), use `np.linalg.lstsq` instead.
- Assuming a system always has exactly one solution -- check the determinant first, or be ready to catch `numpy.linalg.LinAlgError` for singular (non-invertible) matrices.
- Confusing `A @ x` (matrix-vector product, the "forward" direction) with solving for `x` (the "backward" direction) -- they use the same matrix but are different operations.
- Comparing a computed solution to an expected one with exact `==` -- floating-point solves need a tolerance check (`np.allclose` or manual `abs(...) < 1e-6`).

## Key points

- `Ax = b` represents a linear system; `np.linalg.solve(A, b)` finds `x` when a unique solution exists.
- A nonzero determinant (`np.linalg.det(A) != 0`) guarantees a unique solution; zero means no solution or infinitely many.
- Always verify a solved system with a tolerance check (`A @ x` close to `b`), not exact equality.
$py$ where id = '10000000-0000-0000-0000-000000000082';
update concepts set lesson_content = $py$A derivative measures how fast a function's output changes as its input changes -- the slope of the curve at a point. You don't need calculus rules memorized to *use* one: the numerical (finite-difference) definition approximates it directly by nudging the input by a tiny amount `h` and measuring the change in output.

```python
def f(x):
    return x ** 2

def derivative(f, x, h=1e-5):
    return (f(x + h) - f(x - h)) / (2 * h)

print(derivative(f, 3))     # ~6.0 -- matches the calculus answer, 2x at x=3
```

For a function of several variables, the *gradient* is a vector of partial derivatives -- one derivative per input variable, holding the others fixed -- and it points in the direction the function increases fastest. Gradient *descent* uses this: repeatedly step a small amount in the *opposite* direction of the gradient to move toward a minimum, which is exactly how many ML models are trained.

## Why it matters

Every model-training loop in ML -- from a simple linear regression to a deep network -- is gradient descent underneath: compute how the error changes with respect to each parameter, then nudge parameters against that gradient. Understanding derivatives as "how much does output change per tiny input change" demystifies what "training" a model is actually doing.

## Common mistakes

- Picking `h` too large in a finite-difference derivative -- the approximation gets inaccurate; too small (below roughly 1e-8) and floating-point rounding error dominates instead.
- Stepping *with* the gradient instead of *against* it during gradient descent -- that maximizes the function instead of minimizing it, and the loss visibly increases instead of decreasing.
- Using a learning rate (step size) that's too large -- gradient descent can overshoot the minimum and diverge instead of converging.
- Confusing "the gradient is zero" with "this is the minimum" -- a zero gradient marks any critical point (minimum, maximum, or saddle point), not necessarily the minimum you want.

## Key points

- A derivative is a rate of change; the finite-difference approximation `(f(x+h) - f(x-h)) / (2h)` estimates it without symbolic calculus.
- The gradient of a multi-variable function is a vector of partial derivatives, pointing toward steepest increase.
- Gradient descent repeatedly steps opposite the gradient, scaled by a learning rate, to move toward a minimum.
$py$ where id = '10000000-0000-0000-0000-000000000083';
update concepts set lesson_content = $py$matplotlib turns arrays of numbers into visible charts. The core objects are a `Figure` (the whole image) and one or more `Axes` (an individual plot within it) -- `plt.subplots()` is the usual way to create both at once.

```python
import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10, 100)
y = x ** 2

fig, ax = plt.subplots()
ax.plot(x, y, label="y = x^2")
ax.set_xlabel("x")
ax.set_ylabel("y")
ax.set_title("A simple parabola")
ax.legend()
```

`ax.plot(x, y)` draws a line through the (x, y) points; `ax.scatter(x, y)` draws individual points instead of connecting them; `ax.bar(categories, values)` draws a bar chart. Every plotting call takes matching-length arrays for its coordinates, and `ax` accumulates everything you draw on it -- calling `ax.plot()` twice puts two lines on the same axes, which is how multi-series charts get built.

## Why it matters

Visualizing data before modeling it catches problems a table of numbers hides -- outliers, non-linear relationships, skewed distributions -- and every later ML phase will lean on quick plots (loss curves, prediction-vs-actual scatter plots, feature histograms) to sanity-check what's actually happening.

## Common mistakes

- Passing mismatched-length x and y arrays to `plot()`/`scatter()` -- raises a `ValueError` since every point needs both coordinates.
- Forgetting `ax.legend()` after setting `label=` on each series -- the labels exist but never render without an explicit call to show them.
- Building a chart's data with a Python loop when a vectorized NumPy expression (like `x ** 2`) is available and simpler -- slower and more error-prone for no benefit.
- Assuming `plt.show()` is required to "produce" a chart when just inspecting or testing it programmatically -- the `Figure`/`Axes` objects already exist and can be inspected (number of lines, axis labels, data) without ever displaying them.

## Key points

- `fig, ax = plt.subplots()` creates a Figure and an Axes to draw on; `ax.plot`/`ax.scatter`/`ax.bar` draw onto it.
- Multiple calls to `ax.plot()` on the same Axes overlay multiple series; `ax.legend()` shows their labels.
- A Figure/Axes object can be inspected directly (`ax.lines`, `ax.get_xlabel()`) without rendering an image -- useful for testing plotting code.
$py$ where id = '10000000-0000-0000-0000-000000000084';
update concepts set lesson_content = $py$Computers can't generate truly random numbers on demand -- they use a deterministic algorithm called a pseudorandom number generator, seeded with a starting value. Set the same seed and you get the exact same sequence of "random" numbers every time, which is exactly what makes experiments reproducible.

```python
import numpy as np

np.random.seed(42)
print(np.random.randint(1, 7, size=3))    # e.g. [4 5 3]

np.random.seed(42)
print(np.random.randint(1, 7, size=3))    # identical: [4 5 3]
```

`np.random.seed(n)` sets the *global* random state that every subsequent `np.random.*` call draws from -- reseeding with the same number resets it, reproducing the same sequence. NumPy's newer, recommended API is `np.random.default_rng(seed)`, which returns a `Generator` object with its own independent state (useful when you need several separately-seeded streams instead of one shared global one).

## Why it matters

Reproducibility is what makes a bug reportable, an experiment comparable across runs, and a test deterministic instead of flaky -- any randomness in a data split, a model's random initialization, or a simulation needs a fixed seed so results can be checked and shared exactly, not just "roughly" reproduced.

## Common mistakes

- Forgetting to seed before *every* run that needs to be reproducible -- a script that seeds once and then imports another module that also calls `np.random.*` unseeded can still produce inconsistent results depending on call order.
- Assuming `np.random.seed()` affects `random.seed()` (Python's built-in module) too -- they're two entirely separate random states; seed both if your code uses both.
- Mixing the legacy global API (`np.random.seed`, `np.random.randint`) with the modern `Generator` API (`np.random.default_rng`) in the same test and expecting identical sequences -- they use different underlying algorithms and won't match even with the same seed.
- Writing a test that expects specific numeric output from unseeded randomness -- always seed first, or the test will fail nondeterministically on a fresh run.

## Key points

- The same seed always produces the same sequence of "random" numbers -- reproducibility, not true randomness, is the point.
- `np.random.seed(n)` sets the shared global state; `np.random.default_rng(n)` returns an independent Generator object.
- Any test or experiment involving randomness needs a fixed seed to be verifiable and repeatable.
$py$ where id = '10000000-0000-0000-0000-000000000085';
update concepts set lesson_content = $py$A pandas `Series` is a one-dimensional labeled array -- think of it as a single column with an index attached. A `DataFrame` is a two-dimensional table: a dict of Series that all share the same index, with column labels on top.

```python
import pandas as pd

scores = pd.Series([88, 92, 79], index=["Ada", "Grace", "Alan"])
print(scores["Grace"])          # 92

df = pd.DataFrame({
    "name": ["Ada", "Grace", "Alan"],
    "score": [88, 92, 79],
})
print(df.shape)                 # (3, 2)
print(df.columns.tolist())      # ['name', 'score']
print(df.head(2))               # first 2 rows
```

Every DataFrame has a row `index` (labels for rows, `0, 1, 2...` by default) and `columns` (labels for the Series it's built from). `.dtypes` shows the type pandas inferred for each column, and `.head(n)`/`.tail(n)` peek at the first/last `n` rows without printing the whole table.

## Why it matters

Nearly every tool in the data ecosystem -- CSV/SQL loaders, plotting libraries, scikit-learn -- expects a DataFrame or Series as its input, so this is the shape almost all downstream analysis code assumes. Getting comfortable with shape, columns, and dtypes up front means you can sanity-check any new dataset in three lines before writing a single line of real logic.

## Common mistakes

- Selecting one column with `df["score"]` and expecting a DataFrame back -- it's a `Series`; wrap the column name in a list, `df[["score"]]`, to keep it a one-column DataFrame.
- Assuming the row index is always `0, 1, 2, ...` -- after filtering or sorting it can skip numbers or be out of order; use `.reset_index(drop=True)` when you want it renumbered.
- Confusing `df.shape[0]` (row count) with `len(df.columns)` (column count) -- `len(df)` alone gives you the row count, same as `df.shape[0]`.
- Passing columns of different lengths into `pd.DataFrame({...})` -- pandas raises `ValueError` instead of silently padding; every list needs the same length (scalars are fine and get broadcast to every row).

## Key points

- `Series` = one labeled column; `DataFrame` = several Series sharing an index.
- `.shape`, `.columns`, `.dtypes`, `.head()` are your first moves on any new DataFrame.
- A single `[]` on a column name gives a Series; double `[[]]` keeps it a DataFrame.
$py$ where id = '10000000-0000-0000-0000-000000000086';
update concepts set lesson_content = $py$Real data usually arrives as a file, not a hand-typed dict. `pd.read_csv()` and `pd.read_json()` parse those formats straight into a DataFrame, and `.to_csv()` / `.to_json()` go the other way. They all accept a file path, but they work equally well on an in-memory text stream via `io.StringIO`, which is handy for testing or for data that arrived over the network as text.

```python
import pandas as pd
import io

csv_text = "name,score\nAda,88\nGrace,92\n"
df = pd.read_csv(io.StringIO(csv_text))
print(df)

# writing back out
print(df.to_csv(index=False))          # index=False: don't write the row index as a column

json_text = '[{"name": "Ada", "score": 88}]'
df2 = pd.read_json(io.StringIO(json_text))
print(df2)
```

`read_csv` has useful keyword arguments beyond the defaults: `usecols` to load only some columns, `dtype` to force a column's type (e.g. keep zip codes as strings so leading zeros survive), and `na_values` to tell pandas which extra tokens (like `"NA"` or `"-"`) mean missing data. `read_json` needs `lines=True` for JSON Lines files (one JSON object per line) instead of one big JSON array.

## Why it matters

CSV and JSON are the two formats you'll load real-world data from constantly -- exported spreadsheets, API responses, log dumps -- so reading them cleanly (right dtypes, right missing-value handling) up front avoids chasing subtle bugs three steps later in your analysis.

## Common mistakes

- Forgetting `index=False` in `to_csv()` -- pandas writes the row index as its own unlabeled first column, which then shows up as an `"Unnamed: 0"` column the next time the file is read back in.
- Letting a numeric-looking column with leading zeros (like a zip code `"02134"`) get auto-parsed as an int -- it silently becomes `2134`; force it with `dtype={"zip": str}`.
- Passing a URL or file path in code that has no real network access (like this sandbox) -- build test data as an in-memory string with `io.StringIO` instead of fetching a real file.
- Forgetting `lines=True` on a JSON Lines file (one object per line, not one big array) -- `read_json` raises a parse error without it.

## Key points

- `pd.read_csv(io.StringIO(text))` / `pd.read_json(io.StringIO(text))` parse text without touching the filesystem.
- Always pass `index=False` to `to_csv()` unless you deliberately want the index saved as a column.
- `usecols`, `dtype`, and `na_values` are the three keyword arguments worth knowing on `read_csv` from day one.
$py$ where id = '10000000-0000-0000-0000-000000000087';
update concepts set lesson_content = $py$Pandas gives you two explicit ways to pick out rows and columns -- `.loc` (label-based) and `.iloc` (position-based) -- plus boolean masks for filtering by condition.

```python
import pandas as pd

df = pd.DataFrame({
    "product": ["Pen", "Mug", "Lamp", "Desk"],
    "price":   [2.5, 9.0, 34.0, 150.0],
}, index=["a", "b", "c", "d"])

print(df.loc["b"])                       # row labeled 'b', by label
print(df.iloc[1])                        # second row, by position (0-based)
print(df.loc[df["price"] > 10])          # boolean mask: rows where price > 10
print(df.loc[df["price"] > 10, "product"])  # mask + column selection together
```

Boolean masks combine with `&` (and), `|` (or), and `~` (not) -- never Python's `and`/`or`/`not`, which don't work element-by-element on a Series. Each condition needs its own parentheses because `&`/`|` bind tighter than comparisons: `df[(df.a > 1) & (df.b < 5)]`, not `df[df.a > 1 & df.b < 5]`. `.isin([...])` checks membership in a list in one call instead of chaining several `|` conditions.

## Why it matters

Filtering rows down to the ones that matter -- last month's orders, customers over 18, products in stock -- is the single most common operation in any data workflow, and it's the direct pandas equivalent of a SQL `WHERE` clause.

## Common mistakes

- Using Python's `and`/`or` between two boolean Series instead of `&`/`|` -- raises `ValueError: The truth value of a Series is ambiguous`.
- Forgetting parentheses around each condition, e.g. `df[df.a > 1 & df.b < 5]` -- `&` binds tighter than `>`, so this doesn't parse the way it looks.
- Confusing `.loc[2:4]` (label-based, INCLUDES both endpoints) with `.iloc[2:4]` (position-based, EXCLUDES the end, like a normal Python slice).
- Chained indexing like `df[df.a > 1]["b"] = x` to assign into a filtered subset -- pandas may warn `SettingWithCopyWarning` because it's ambiguous whether you're modifying a view or a copy; use `df.loc[df.a > 1, "b"] = x` instead.

## Key points

- `.loc` is label-based and slice-inclusive; `.iloc` is position-based and slice-exclusive (like list slicing).
- Combine boolean masks with `&` / `|` / `~`, each condition wrapped in parentheses.
- `.isin([...])` checks membership; `.loc[mask, cols]` filters rows and picks columns in one step.
$py$ where id = '10000000-0000-0000-0000-000000000088';
update concepts set lesson_content = $py$Real datasets have gaps -- a sensor drops a reading, a survey question goes unanswered. Pandas represents a missing value as `NaN` ("Not a Number") and gives you two main tools for dealing with it: `.dropna()` to remove rows/columns with gaps, and `.fillna()` to plug them with a value.

```python
import pandas as pd
import numpy as np

df = pd.DataFrame({
    "name": ["Ada", "Grace", "Alan"],
    "score": [88, np.nan, 79],
})
print(df.isna())                     # True/False mask of where values are missing
print(df.isna().sum())               # count of missing values per column

print(df.dropna())                   # drops any row with at least one NaN
print(df.fillna({"score": 0}))       # fills score's NaN with 0, column by column
print(df["score"].fillna(df["score"].mean()))  # fill with that column's own mean
```

`dropna()` takes `how='any'` (default -- drop if ANY column is missing) or `how='all'` (drop only if EVERY column is missing), plus `subset=[...]` to only check specific columns. `fillna()` accepts a single value, or a dict mapping column name to a different fill value per column. Neither method modifies the DataFrame in place unless you pass `inplace=True` -- by default both return a new DataFrame, so you need to reassign.

## Why it matters

Missing values silently break downstream math -- `NaN + 5` is `NaN`, and a single missing cell can turn an entire mean or groupby result into `NaN` -- so deciding deliberately whether to drop or fill gaps (and with what) is one of the first real decisions in cleaning any dataset.

## Common mistakes

- Testing for missing values with `df[col] == np.nan` -- this is always `False`, because `NaN` never equals anything, even itself; use `.isna()` / `.notna()` instead.
- Calling `df.dropna()` with no arguments and being surprised how much data disappeared -- the default `how='any'` drops a row if even ONE column is missing there; use `subset=` or `how='all'` to be less aggressive.
- Filling every column with the same constant (like `df.fillna(0)`) without considering whether 0 makes sense for that column -- filling a missing price with 0 quietly creates a fake "free" row.
- Forgetting that `.dropna()` / `.fillna()` return a NEW DataFrame by default -- writing `df.dropna()` alone and expecting `df` itself to have changed.

## Key points

- `.isna()` / `.notna()` are the only correct way to detect missing values; never compare with `==`.
- `.dropna(how=, subset=)` controls exactly which rows get removed.
- `.fillna(value)` accepts a scalar or a per-column dict, and returns a new DataFrame unless `inplace=True`.
$py$ where id = '10000000-0000-0000-0000-000000000089';
update concepts set lesson_content = $py$`.groupby()` implements the "split-apply-combine" pattern: split the DataFrame into groups by a key, apply an aggregation to each group, then combine the results back into one table.

```python
import pandas as pd

df = pd.DataFrame({
    "region": ["US", "US", "UK", "UK", "UK"],
    "sales":  [100, 150, 80, 120, 90],
})

print(df.groupby("region")["sales"].sum())        # total sales per region
print(df.groupby("region")["sales"].agg(["sum", "mean"]))  # several stats at once
print(df.groupby("region").size())                 # row count per group

grouped = df.groupby("region")["sales"].sum().reset_index()
print(grouped)                                     # region back as a real column, not the index
```

`groupby(key)[col].sum()` returns a Series indexed by the group key -- handy for lookups, but the key is no longer a normal column. Call `.reset_index()` when you want it back as a plain column (e.g. before saving to CSV or merging with another table). Named aggregation, `df.groupby("region").agg(total=("sales", "sum"), avg=("sales", "mean"))`, lets you compute several differently-named stats in one call. `.transform()` broadcasts a per-group result back to every original row (same length as the input) instead of collapsing to one row per group -- useful for things like "each row's value minus its group's average."

## Why it matters

Summarizing by category -- total sales per region, average score per class, count of orders per customer -- is the single most common question asked of tabular data, and `groupby` is the direct pandas equivalent of SQL's `GROUP BY`.

## Common mistakes

- Forgetting `.reset_index()` after a groupby aggregation and then trying to treat the group key as a normal column -- it's living in the index until you reset it.
- Calling `.agg('mean')` on the whole grouped DataFrame (not a single column) when some columns are text -- pandas either raises or silently drops non-numeric columns depending on version; select the numeric column(s) explicitly first.
- Assuming groupby preserves the original row order -- by default (`sort=True`) it sorts groups by the key, so the summary table's row order won't match the source data's first-seen order unless you pass `sort=False`.
- Confusing `.agg()` (collapses each group to one row) with `.transform()` (returns one value per ORIGINAL row, aligned back to the input's shape) -- reach for `.transform()` when you need to compare each row to its own group's statistic.

## Key points

- `df.groupby(key)[col].agg(func)` splits, aggregates, and combines in one call; `.reset_index()` turns the group key back into a column.
- Named aggregation (`.agg(name=(col, func))`) computes several labeled stats in a single call.
- `.transform()` broadcasts a group-level result back to every row of the original DataFrame.
$py$ where id = '10000000-0000-0000-0000-000000000090';
update concepts set lesson_content = $py$Real data is rarely in one table -- orders live in one file, customers in another. `pd.merge()` combines two DataFrames based on matching key values, the same idea as a SQL `JOIN`. `pd.concat()` instead just stacks DataFrames together, by row or by column.

```python
import pandas as pd

orders = pd.DataFrame({"order_id": [1, 2, 3], "customer_id": [10, 20, 10], "amount": [50, 30, 20]})
customers = pd.DataFrame({"customer_id": [10, 20], "name": ["Ada", "Grace"]})

print(pd.merge(orders, customers, on="customer_id"))              # inner join (default)
print(pd.merge(orders, customers, on="customer_id", how="left"))  # keep every order row

more_orders = pd.DataFrame({"order_id": [4], "customer_id": [30], "amount": [15]})
print(pd.concat([orders, more_orders], ignore_index=True))        # stack rows
```

`merge()`'s `how` argument controls what happens to rows that don't have a match: `'inner'` (default, keep only matches), `'left'`/`'right'` (keep all rows from one side, filling unmatched columns with NaN), or `'outer'` (keep everything from both sides). When the join key has different names in each table, use `left_on=`/`right_on=` instead of `on=`. If both DataFrames have a same-named column that ISN'T the join key, pandas appends `_x`/`_y` suffixes automatically (customize with `suffixes=`).

## Why it matters

Combining related tables -- orders with customer details, transactions with product catalogs, this month's data with last month's -- is one of the most common real-world data tasks, and getting the join type right (inner vs. left vs. outer) is the difference between a report that silently drops rows and one that's actually complete.

## Common mistakes

- Assuming `merge()` keeps every row from both sides by default -- the default is `how='inner'`, which silently drops any row that doesn't have a match on the other side.
- Forgetting that both DataFrames need matching key VALUES, not just matching key names -- a typo, extra whitespace, or a mismatched type (`"10"` vs `10`) makes rows fail to match with no error, just missing results.
- Not handling duplicate non-key column names -- pandas appends `_x`/`_y` suffixes automatically, which can be confusing until you pass your own `suffixes=(...)`.
- Using `pd.concat()` when you actually meant `pd.merge()` (or vice versa) -- `concat` stacks tables as-is (rows or columns), it does NOT align rows by a matching key the way `merge` does.

## Key points

- `pd.merge(df1, df2, on=key, how=...)` is a SQL-style join; the default `how='inner'` keeps only matching rows.
- `left_on=`/`right_on=` handle differently-named join keys; `suffixes=` renames colliding non-key columns.
- `pd.concat([...], axis=0)` stacks rows; `axis=1` stacks columns side by side -- neither one matches keys the way `merge` does.
$py$ where id = '10000000-0000-0000-0000-000000000091';
update concepts set lesson_content = $py$Feature engineering is turning raw columns into new ones that are more useful for analysis or modeling -- ratios, categories, encoded text, extracted date parts. Most of it is ordinary vectorized arithmetic on whole columns at once, not loops over rows.

```python
import pandas as pd

df = pd.DataFrame({
    "price": [10.0, 25.0, 100.0],
    "cost":  [6.0, 20.0, 40.0],
    "category": ["A", "B", "A"],
})

df["margin"] = df["price"] - df["cost"]               # vectorized arithmetic -> new column
df["price_bucket"] = pd.cut(df["price"], bins=[0, 20, 60, 200], labels=["low", "mid", "high"])
df = pd.get_dummies(df, columns=["category"])          # one column per category, True/False
print(df)
```

`pd.cut()` turns a continuous column into labeled bins -- by default bin edges are `(a, b]` (exclusive on the left, inclusive on the right). `pd.get_dummies()` one-hot encodes a categorical column into one boolean column per category, which most ML models need since they can't use raw text labels directly. `.str` (for text: `.str.upper()`, `.str.len()`, `.str.contains()`) and `.dt` (for dates, after `pd.to_datetime()`: `.dt.year`, `.dt.month`, `.dt.dayofweek`) are the accessor namespaces for building features out of text and date columns.

## Why it matters

Raw columns rarely match what a question -- or a model -- actually needs: "profit margin" isn't in the data until you compute `price - cost`, and a `"2024-03-15"` string is useless to a model until you pull out its year, month, or day-of-week as actual numbers.

## Common mistakes

- Reaching for `.apply(lambda row: ..., axis=1)` out of habit for row-by-row logic that's really just arithmetic between columns -- `df["a"] - df["b"]` is vectorized and much faster than looping row by row.
- Forgetting that `pd.get_dummies()` creates one column PER category, which can massively widen a DataFrame with a high-cardinality column (like a user ID); it's meant for categories with a small, fixed set of values.
- Using a date column with `.dt` before converting it with `pd.to_datetime()` -- a plain string column has no `.dt` accessor and raises `AttributeError`.
- Assuming `pd.cut()`'s bins are inclusive on the left -- by default `(0, 20]` excludes 0 and includes 20; a value of exactly 0 falls into no bin (`NaN`) unless you extend the first edge below it.

## Key points

- Prefer vectorized column arithmetic (`df["a"] - df["b"]`) over `.apply(axis=1)` whenever the logic is a simple expression.
- `pd.cut()` bins continuous values into labeled categories; `pd.get_dummies()` one-hot encodes categorical columns for modeling.
- Convert date-like text columns with `pd.to_datetime()` before using the `.dt` accessor to pull out year/month/day features.
$py$ where id = '10000000-0000-0000-0000-000000000092';
update concepts set lesson_content = $py$Exploratory Data Analysis (EDA) is where everything from this phase comes together: load the raw data, clean it, summarize it, and look for patterns -- before you ever build a model or write a final report. There's no single right order, but a common one is: load -> inspect -> clean -> describe -> group/aggregate -> look for relationships.

```python
import pandas as pd
import io

raw = "region,sales\nUS,100\nUS,\nUK,80\nUK,120\n"
df = pd.read_csv(io.StringIO(raw))       # load

df.isna().sum()                          # inspect: where's the damage?
df = df.dropna(subset=["sales"])         # clean: drop rows missing the value we need

df["sales"].describe()                   # describe: count, mean, std, min/max, quartiles
df.groupby("region")["sales"].mean()     # aggregate: compare across a category

df.corr(numeric_only=True)               # relationships between numeric columns
```

`.describe()` is the fastest way to sanity-check a numeric column in one call -- count, mean, std, min, the quartiles, and max. `.corr()` computes pairwise correlation coefficients between numeric columns (`numeric_only=True` skips text columns automatically); values near +1 or -1 flag a strong relationship worth investigating further, often with a quick matplotlib scatter plot. The interquartile range (IQR = Q3 - Q1) gives a robust way to flag outliers: anything below `Q1 - 1.5*IQR` or above `Q3 + 1.5*IQR` is a common rule of thumb.

## Why it matters

Every model or dashboard downstream is only as good as the exploration that came before it -- catching a bad merge, a skewed distribution, or an unexpected outlier during EDA is far cheaper than debugging a wrong conclusion after the fact.

## Common mistakes

- Jumping straight to summary statistics or a model before checking `.isna().sum()` and `.dtypes` -- silent missing values or a numeric column parsed as text will quietly corrupt every calculation downstream.
- Treating a high `.corr()` value as proof of causation -- correlation only measures how two numeric columns move together, not why.
- Using a fixed cutoff for outliers (like "anything over 1000") instead of a statistic based on the data's own spread (like IQR) -- what counts as unusual depends on the dataset.
- Cleaning the data in your head while looking at `.describe()` output instead of writing it as actual code -- the next person (or you, next week) can't rerun a mental note.

## Key points

- A repeatable EDA pass: load -> inspect (isna/dtypes) -> clean (dropna/fillna) -> describe -> group/aggregate -> check relationships (corr).
- `.describe()` and `.corr(numeric_only=True)` are the two fastest ways to get an overview of a new numeric dataset.
- The IQR rule (`Q1 - 1.5*IQR` to `Q3 + 1.5*IQR`) is a simple, data-driven way to flag outliers instead of guessing a cutoff.
$py$ where id = '10000000-0000-0000-0000-000000000093';
update concepts set lesson_content = $py$Machine learning flips the usual programming relationship: instead of writing
rules by hand, you show the computer examples and let it find the pattern
itself. In supervised learning, each example is a pair -- input features
`X` and a known target `y` -- and the "learning" is really just fitting a
function that maps one to the other well enough to generalize to new,
unseen inputs.

```python
import numpy as np
from sklearn.model_selection import train_test_split

X = np.array([[1000], [1500], [2000], [2500], [3000]])  # house size (sq ft)
y = np.array([200, 250, 310, 370, 420])                  # price ($k)

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)
print(X_train.shape, X_test.shape)
```

That last step -- splitting data into a training set and a held-out test
set -- is the single most important habit in this whole phase. A model
that only ever sees its own training data can memorize it perfectly and
still be useless on anything new; the test set is a stand-in for "the
future," data the model never got to peek at while fitting.

## Why it matters

Every model you build in this phase gets judged the same way: fit on
`X_train`/`y_train`, then honestly scored on `X_test`/`y_test` it never
touched during fitting. Skipping this step is how a spam filter or a
price predictor looks great in development and then falls apart the
moment it meets real, new data.

## Common mistakes

- Evaluating a model on the same data it was trained on -- accuracy there
  measures memorization, not generalization; always score on held-out data.
- Splitting *after* doing something that looks at the whole dataset (like
  scaling using the full dataset's mean/std) -- that leaks test-set
  information into training and inflates your test score.
- Forgetting to fix `random_state` -- without it, every run produces a
  different split, so results aren't reproducible and can't be compared.
- Using a test set that's too small to be meaningful (e.g. 2 rows out of
  1000) -- the resulting score is mostly noise.

## Key points

- Supervised learning fits a function from features `X` to a target `y`.
- `train_test_split` holds out data the model never trains on, so its
  score approximates real-world performance instead of memorization.
- A simple "predict the mean of `y_train`" baseline is a useful sanity
  check -- any real model should beat it.
$py$ where id = '10000000-0000-0000-0000-000000000094';
update concepts set lesson_content = $py$Linear regression fits a straight line, `y = w*x + b`, to a set of points --
`w` is the slope, `b` is the intercept. Before reaching for a library,
building it by hand once makes gradient descent click: start with a
guess for `w` and `b`, measure how wrong the predictions are, and nudge
both values a little in the direction that reduces the error. Repeat.

```python
import numpy as np

x = np.array([1.0, 2.0, 3.0, 4.0])
y = np.array([3.0, 5.0, 7.0, 9.0])   # y = 2x + 1

w, b = 0.0, 0.0
lr = 0.05
for _ in range(1000):
    y_pred = w * x + b
    dw = -(2 / len(x)) * np.sum(x * (y - y_pred))
    db = -(2 / len(x)) * np.sum(y - y_pred)
    w -= lr * dw
    b -= lr * db

print(round(w, 2), round(b, 2))   # close to 2.0, 1.0
```

Those `dw`/`db` formulas are the partial derivatives of mean squared
error with respect to `w` and `b`; each one tells you which way the
error grows if you nudge that parameter up, so subtracting a small
multiple of it (the learning rate `lr`) moves you downhill.

## Why it matters

This loop -- predict, measure error, compute a gradient, update the
parameters -- is the same core mechanism behind every model you'll meet
for the rest of this track, from Ridge regression to neural networks.
Seeing it in ten lines of plain NumPy demystifies what `model.fit()`
does under the hood.

## Common mistakes

- Forgetting the derivative's sign -- gradient descent subtracts the
  gradient (`w -= lr * dw`); adding it climbs the error uphill instead.
- Picking a learning rate that's too large -- the loss oscillates or
  explodes to `nan`/`inf` instead of shrinking; too small and it barely
  moves in the iteration budget you gave it.
- Expecting bit-for-bit convergence to the "true" generating slope --
  gradient descent on noisy data lands *close* to it, not exactly on it,
  and different starting points/iteration counts land slightly differently.
- Updating `w` using an already-updated `b` (or vice versa) mid-formula --
  compute both gradients from the *same* `y_pred` first, then update both.

## Key points

- Gradient descent repeats: predict -> compute gradient of the loss ->
  step parameters opposite the gradient, scaled by a learning rate.
- The gradient of MSE w.r.t. `w` and `b` has a clean closed form -- no
  calculus needed at runtime, just the two formulas above.
- More iterations or a well-tuned learning rate gets you closer to the
  true underlying relationship, never exactly to it when there's noise.
$py$ where id = '10000000-0000-0000-0000-000000000095';
update concepts set lesson_content = $py$The from-scratch loop from the last lesson is exactly what
`sklearn.linear_model.LinearRegression` does internally -- except sklearn
solves for the optimal `w`/`b` directly (a closed-form calculation) rather
than iterating, so it's both faster and lands on the exact best fit for
plain linear regression.

```python
import numpy as np
from sklearn.linear_model import LinearRegression

X = np.array([[1000], [1500], [2000], [2500], [3000]])  # feature(s) as 2D
y = np.array([200, 250, 310, 370, 420])                   # target as 1D

model = LinearRegression()
model.fit(X, y)

print(model.coef_)        # array([slope, ...]) -- one per feature
print(model.intercept_)   # scalar intercept
print(model.predict([[1800]]))
print(model.score(X, y))  # R^2 on the data passed in
```

Note the shape convention: `X` is always 2D (`n_samples, n_features`),
even with a single feature -- `X = x.reshape(-1, 1)` is the usual fix
when starting from a 1D array. `y` stays 1D. Every sklearn estimator
shares this `fit(X, y)` / `predict(X)` interface, which is why switching
from `LinearRegression` to `Ridge` or `Lasso` later is nearly a one-line
change.

## Why it matters

Nobody hand-writes gradient descent for production linear regression --
libraries like scikit-learn give you a numerically stable, well-tested
fit in one call, and the same `fit`/`predict`/`score` pattern carries
over to every other model in this phase and the ones after it.

## Common mistakes

- Passing a 1D array as `X` -- `model.fit(x, y)` with `x.shape == (n,)`
  raises a `ValueError`; reshape to `(n, 1)` for a single feature.
- Calling `.predict()` on a single row without wrapping it in another
  list/array -- `model.predict([1800])` is the wrong shape; it needs to
  be `model.predict([[1800]])`.
- Interpreting `.score()` as an error metric where lower is better -- it
  returns R^2, where *higher* (up to 1.0) is better fit.
- Fitting and scoring on the same data and calling that "accuracy" --
  it only tells you how well the line fits data it already saw.

## Key points

- `model.fit(X, y)` learns `coef_` and `intercept_`; `model.predict(X)`
  uses them to generate new predictions.
- `X` must be 2D (`n_samples, n_features`); `y` is 1D.
- `model.score(X, y)` returns R^2 -- 1.0 is a perfect fit, 0.0 means
  "no better than predicting the mean."
$py$ where id = '10000000-0000-0000-0000-000000000096';
update concepts set lesson_content = $py$A cost function (also called a loss function) turns "how good is this
model?" into a single number to minimize. For regression, the workhorse is
mean squared error (MSE): average the squared difference between each
prediction and the true value. Squaring does two things -- it makes every
error positive, and it punishes large errors far more than small ones.

```python
import numpy as np

y_true = np.array([3.0, 5.0, 7.0, 9.0])
y_pred = np.array([2.5, 5.5, 6.0, 9.5])

errors = y_true - y_pred
mse = np.mean(errors ** 2)
mae = np.mean(np.abs(errors))
print(mse, mae)   # MSE reacts more to the 1.0-off point than MAE does
```

Mean absolute error (MAE) is the gentler alternative -- it averages the
absolute errors instead of squaring them, so one wild outlier doesn't
dominate the score the way it does with MSE. Which one you pick as your
training objective changes what kind of mistakes the fitted model is
willing to make: MSE-trained models work hard to avoid any single large
error, MAE-trained ones tolerate a few larger misses in exchange for a
lower average.

## Why it matters

Every model you train is really just "find the parameters that minimize
some cost function" -- picking MSE, MAE, or something else isn't a minor
detail, it's a design decision about which kinds of mistakes the model
is optimized to avoid, and it directly shapes gradient descent's search.

## Common mistakes

- Treating MSE and MAE as interchangeable -- they penalize errors
  differently, so the "best" (w, b) under one isn't necessarily the best
  under the other.
- Forgetting MSE's units are squared -- an MSE of 25 for a price-in-dollars
  target means a *typical* error around sqrt(25) = 5 dollars, not 25.
- Comparing cost values across datasets with different scales -- an MSE
  of 10 is great for house prices in the hundreds of thousands, terrible
  for a target that only ranges from 0 to 1.
- Assuming lower cost on the training set means a better model overall --
  it only measures fit to the data you computed it on.

## Key points

- MSE = mean((y_true - y_pred) ** 2); it's what gradient descent for
  plain linear regression minimizes.
- MAE = mean(abs(y_true - y_pred)); more robust to outliers than MSE.
- Cost functions are what turn "fit a model" into a concrete optimization
  problem gradient descent (or a closed-form solver) can solve.
$py$ where id = '10000000-0000-0000-0000-000000000097';
update concepts set lesson_content = $py$Gradient descent generalizes cleanly to more than one feature: instead of
two scalars `w` and `b`, you have a weight vector `w` (one per feature)
and the same update rule, now in matrix form. The three things that make
or break it in practice -- learning rate, feature scale, and how much
data you use per step -- are the focus of this lesson.

```python
import numpy as np

X = np.array([[1.0, 2.0], [2.0, 1.0], [3.0, 4.0], [4.0, 3.0]])
y = np.array([5.0, 4.0, 11.0, 10.0])   # y = 1*x0 + 2*x1

n, d = X.shape
w, b = np.zeros(d), 0.0
lr = 0.05
for _ in range(2000):
    y_pred = X @ w + b
    error = y - y_pred
    dw = -(2 / n) * (X.T @ error)
    db = -(2 / n) * np.sum(error)
    w -= lr * dw
    b -= lr * db

print(w, b)   # close to [1, 2], 0
```

A learning rate too large overshoots the minimum and the loss blows up
toward `nan`/`inf` instead of shrinking -- that's *divergence*, not slow
progress. Features on very different scales (e.g. one column in the
thousands, another between 0 and 1) make this worse, because a single
learning rate has to work for both at once; standardizing every column
first (mean 0, std 1) is the standard fix. Finally, updating on the
*whole* dataset every step (batch gradient descent) is accurate but slow
on large data -- mini-batch gradient descent updates on small random
chunks instead, trading a noisier path for far more updates per pass.

## Why it matters

Real datasets have many features on wildly different scales (age vs.
income, pixels vs. square footage), and picking a learning rate that
works for all of them at once -- or diverging instead -- is the single
most common practical failure mode when training any gradient-based
model, not just linear regression.

## Common mistakes

- Picking one learning rate and never checking the loss curve -- a
  diverging loss (growing or `nan`) means "lower the learning rate,"
  not "run it longer."
- Skipping feature scaling with multiple features of very different
  magnitudes -- gradient descent can crawl on the small-scale feature
  while overshooting on the large-scale one, using the same `lr` for both.
- Forgetting to convert scaled-space coefficients back to the original
  feature scale before reporting or using them.
- Treating mini-batch gradient descent as a drop-in replacement without
  re-shuffling each epoch -- reusing the same batch order every epoch
  can bias the path the parameters take.

## Key points

- Multivariate gradient descent uses `X @ w` instead of `w * x`, and the
  gradient becomes a vector via `X.T @ error`.
- Divergence shows up as an exploding or `nan` loss -- the fix is a
  smaller learning rate (or scaled features).
- Standardizing features (`(x - mean) / std`) before gradient descent
  keeps a single learning rate sane across all columns.
$py$ where id = '10000000-0000-0000-0000-000000000098';
update concepts set lesson_content = $py$A straight line can't fit curved data, but you can still use linear
regression on it -- by feeding it curved *features*. Polynomial regression
adds `x^2`, `x^3`, ... as extra columns and fits a line to those, which
bends the resulting curve in `x`-space even though the model is still
"linear" in its (now more numerous) coefficients.

```python
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import PolynomialFeatures

x = np.linspace(-3, 3, 30).reshape(-1, 1)
y = 0.5 * x.ravel() ** 2 + x.ravel() + 2

poly = PolynomialFeatures(degree=2, include_bias=False)
X_poly = poly.fit_transform(x)     # columns: [x, x^2]

model = LinearRegression().fit(X_poly, y)
print(model.coef_, model.intercept_)   # close to [1, 0.5], 2
```

The degree is a knob, and turning it up doesn't only help: a low degree
underfits (the curve is too simple to capture real structure), but a
degree too high overfits -- it wiggles through every training point,
training error keeps dropping, and test error gets *worse* because the
extra flexibility is fitting noise, not signal. Watching train and test
error side-by-side as degree increases is the clearest way to see
overfitting happen.

## Why it matters

Overfitting isn't unique to polynomials -- any sufficiently flexible
model can memorize training data instead of learning the underlying
pattern -- but polynomial degree is the simplest possible knob to turn
up and watch it happen, which is exactly why it's the standard first
example before more complex models.

## Common mistakes

- Judging a model only by training error -- a high-degree polynomial can
  reach near-zero training error while its test error explodes.
- Forgetting to fit `PolynomialFeatures` (and the model) on the *training*
  set only, then applying the same fitted transform to the test set --
  fitting features on the full dataset leaks test information.
- Assuming "more features = better" -- past a certain degree, added
  flexibility fits noise, not signal, and coefficients can grow huge.
- Comparing polynomial fits across degrees without a held-out test set --
  training error alone always favors the highest degree available.

## Key points

- Polynomial regression is still linear regression -- just on engineered
  features `x, x^2, x^3, ...` instead of raw `x`.
- Increasing degree always lowers (or matches) training error, but test
  error eventually turns upward -- that upturn is overfitting.
- Huge coefficient magnitudes at high degrees are a giveaway that the
  model is fitting noise rather than a real pattern.
$py$ where id = '10000000-0000-0000-0000-000000000099';
update concepts set lesson_content = $py$Regularization fights overfitting by adding a penalty for large
coefficients directly into the cost function being minimized -- instead of
just minimizing MSE, the model minimizes MSE *plus* a term that grows
with the size of its weights. That extra pressure keeps the model from
leaning too hard on any one feature.

```python
import numpy as np
from sklearn.linear_model import Ridge, Lasso, LinearRegression

X = np.random.randn(50, 8)
y = X[:, 0] * 3 - X[:, 1] * 2 + np.random.randn(50) * 0.5

plain = LinearRegression().fit(X, y)
ridge = Ridge(alpha=5.0).fit(X, y)
lasso = Lasso(alpha=0.3).fit(X, y)

print(np.linalg.norm(plain.coef_), np.linalg.norm(ridge.coef_))
print(lasso.coef_)   # some entries pushed to exactly 0.0
```

Ridge (L2 penalty, `alpha * sum(w**2)`) shrinks every coefficient toward
zero smoothly, without necessarily zeroing any of them out. Lasso (L1
penalty, `alpha * sum(abs(w))`) shrinks *and* is willing to snap
coefficients to exactly 0 -- which effectively performs feature
selection, dropping features the model decides aren't pulling their
weight. `alpha` controls the strength of either penalty: 0 recovers
plain linear regression, and larger values shrink more aggressively
(eventually underfitting if pushed too far).

## Why it matters

Regularization is the standard first line of defense against
overfitting on any dataset with many features or limited data --
instead of manually deciding which features to drop, Lasso can do it
automatically, and Ridge is a safe default whenever a model's
coefficients look suspiciously large.

## Common mistakes

- Treating `alpha=0` on Ridge/Lasso as "no regularization is happening"
  and forgetting it's mathematically identical to plain LinearRegression --
  the interesting behavior only shows up once `alpha > 0`.
- Applying Ridge/Lasso to unscaled features -- the penalty treats every
  coefficient the same regardless of what scale its feature is on, so a
  feature measured in the thousands gets penalized unfairly compared to
  one measured in single digits; standardize first.
- Assuming Lasso always beats Ridge -- Lasso's sparsity helps when you
  suspect many features are irrelevant, but Ridge is often the safer
  default when most features genuinely matter a little.
- Picking `alpha` by eyeballing coefficients instead of by test-set
  performance -- like any hyperparameter, the right `alpha` is the one
  that gives the best score on held-out data.

## Key points

- Ridge (L2) shrinks coefficients smoothly; Lasso (L1) can zero them out
  entirely, effectively selecting features.
- `alpha` controls penalty strength: 0 is plain linear regression, larger
  values shrink more (and eventually underfit).
- Always tune `alpha` against test/validation performance, not intuition.
$py$ where id = '10000000-0000-0000-0000-000000000100';
update concepts set lesson_content = $py$A single number rarely tells the whole story about a regression model, so
it's worth knowing the standard handful and what each emphasizes. R^2
answers "how much of the variance in y does this model explain?" (1.0 is
perfect, 0.0 is no better than predicting the mean). MAE and RMSE both
report typical error size in the target's own units, but RMSE penalizes
large errors more, the same way MSE does.

```python
import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error, root_mean_squared_error, r2_score

X = np.linspace(0, 10, 40).reshape(-1, 1)
y = 2 * X.ravel() + 3 + np.random.randn(40) * 0.5

model = LinearRegression().fit(X, y)
pred = model.predict(X)

print(r2_score(y, pred))
print(mean_absolute_error(y, pred))
print(root_mean_squared_error(y, pred))
```

Cross-validation extends the train/test idea further: instead of one
split, `cross_val_score` splits the data into `k` folds, trains on `k-1`
of them and scores on the held-out fold, `k` times (rotating which fold
is held out), and returns one score per fold. Averaging those `k` scores
gives a more stable estimate of generalization than any single train/test
split, especially on smaller datasets where one unlucky split can be
misleading.

## Why it matters

Choosing the right metric changes what "good" means for a model in
production -- a self-driving perception system cares about worst-case
error (RMSE-like), a recommendation system might care about typical
error (MAE), and reporting R^2 alone can hide that a model is
consistently a little off in one direction.

## Common mistakes

- Reporting R^2 (or any metric) on the training set as if it reflects
  real-world performance -- always evaluate on held-out or cross-validated
  data.
- Comparing RMSE across datasets with different target scales -- an
  RMSE of 5 is great for prices in the hundreds of thousands, terrible
  for a 0-to-1 target.
- Treating a single train/test split's score as definitive -- it can vary
  noticeably depending on which rows happened to land in the test set;
  cross-validation averages that noise out.
- Confusing R^2 with "percent correct" -- it's a variance-explained ratio,
  and it *can* go negative for a model worse than just predicting the mean.

## Key points

- R^2, MAE, and RMSE all answer a slightly different question about fit
  quality -- pick based on what kind of error matters for the problem.
- `cross_val_score` runs k-fold evaluation and returns one score per
  fold; averaging them is more robust than a single train/test split.
- Metrics should always be computed on data the model didn't train on.
$py$ where id = '10000000-0000-0000-0000-000000000101';
update concepts set lesson_content = $py$Logistic regression predicts a probability between 0 and 1 by running a
linear combination of features through the sigmoid function, which
squashes any real number into that range. Building it from scratch --
rather than calling a library -- is what makes gradient descent,
probabilities, and decision boundaries click instead of staying
abstract.

```python
import numpy as np

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

def predict_proba(X, w, b):
    return sigmoid(X @ w + b)

w = np.array([0.5, -0.2])
b = 0.1
X = np.array([[2.0, 1.0], [-1.0, 3.0]])
print(predict_proba(X, w, b))   # a probability per row
```

Training means adjusting `w` and `b` so predicted probabilities match
the true 0/1 labels as closely as possible, measured by binary
cross-entropy loss. Gradient descent nudges each parameter opposite
the loss's gradient, a small step at a time, until the loss stops
improving much.

## Why it matters

Every other classifier in this phase -- decision trees, KNN, Naive
Bayes -- gets compared against logistic regression as the simple
baseline, and understanding the training loop here (predict, measure
error, adjust weights) is the same loop every gradient-based model in
this ML track uses, right up through neural networks later on.

## Common mistakes

- Forgetting to clip predicted probabilities before taking `log()` in
  the loss -- a probability of exactly 0.0 or 1.0 produces `-inf` or
  `nan` and silently breaks training.
- Initializing weights to something other than zero and expecting
  identical results every run -- with zero init there's no randomness
  to fix, which is exactly why it's used here for reproducible tests.
- Picking a learning rate that's too large -- the loss can oscillate or
  diverge instead of decreasing; too small and it barely moves in a
  reasonable number of epochs.
- Confusing the gradient's sign -- descent means *subtracting* the
  gradient (`w -= lr * dw`), not adding it.

## Key points

- `sigmoid(z) = 1 / (1 + e^-z)` turns any real number into a (0, 1)
  probability.
- Binary cross-entropy measures how far predicted probabilities are
  from the true labels; gradient descent minimizes it.
- The gradient of BCE has a clean closed form: `error = predictions -
  y`, then `dw = X.T @ error / n` and `db = mean(error)`.
$py$ where id = '10000000-0000-0000-0000-000000000102';
update concepts set lesson_content = $py$Now that you've built logistic regression by hand, `scikit-learn`
gives you the same model production-ready: fit, predict, and inspect
in a few lines, with sensible defaults for regularization and
multi-class support built in.

```python
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.25, random_state=42
)
model = LogisticRegression()
model.fit(X_train, y_train)
print(model.score(X_test, y_test))       # accuracy
print(model.predict_proba(X_test)[:3])   # per-class probabilities
```

`model.coef_` and `model.intercept_` expose the learned weights
directly, which is one of logistic regression's biggest advantages
over more opaque models: you can read off which features push a
prediction toward which class, and by how much.

## Why it matters

In real projects you almost never hand-roll gradient descent --
sklearn's implementation is faster, numerically more stable, and
handles multi-class problems and regularization automatically. Being
fluent with its API (fit/predict/predict_proba/score, plus
Pipeline for bundling preprocessing with the model) is what lets you
move quickly from "I have a dataset" to "I have a working baseline."

## Common mistakes

- Assuming `predict_proba`'s columns are always in class order `[0,
  1]` -- check `model.classes_` when the labels aren't literally 0/1,
  or when you need the probability of a specific class.
- Treating a large positive or negative coefficient as automatically
  "important" without scaling features first -- an unscaled feature
  with a huge numeric range can have a tiny coefficient that's still
  highly influential, and vice versa.
- Forgetting `random_state` on `train_test_split`, making results
  unreproducible from one run to the next.
- Not raising `max_iter` for harder problems -- the default sometimes
  isn't enough iterations to converge, and sklearn will warn you.

## Key points

- `model.fit(X, y)` then `model.predict(X_new)` /
  `model.predict_proba(X_new)` is the pattern for essentially every
  sklearn classifier.
- `C` controls regularization strength -- smaller `C` means stronger
  regularization (more constrained weights).
- Wrapping preprocessing and the model together in a `Pipeline` keeps
  every step -- scaling, fitting -- bundled as one reusable object.
$py$ where id = '10000000-0000-0000-0000-000000000103';
update concepts set lesson_content = $py$A decision tree classifies by asking a sequence of yes/no questions
about feature values, splitting the data at each step to make the
resulting groups as "pure" (single-class) as possible. Unlike logistic
regression, it draws non-linear, axis-aligned decision boundaries and
needs no scaling.

```python
from sklearn.tree import DecisionTreeClassifier

model = DecisionTreeClassifier(max_depth=3, random_state=42)
model.fit(X_train, y_train)
print(model.score(X_test, y_test))
print(model.feature_importances_)   # which features drove the splits
```

Each split is chosen to maximize *information gain* -- the drop in
impurity (measured by Gini impurity or entropy) from parent node to
its two children. A tree with no depth limit will keep splitting until
every leaf is pure, which usually means memorizing training data
rather than learning a general pattern -- that's why `max_depth` (and
similar parameters) matter so much.

## Why it matters

Decision trees are the building block behind random forests and
gradient boosting, two of the most widely used model families in
practice, and they're one of the few model types whose decisions a
non-technical stakeholder can actually read and sanity-check ("if
income > $50k and age < 30, predict approve").

## Common mistakes

- Leaving `max_depth=None` (the default) and being surprised the tree
  gets 100% training accuracy but does much worse on test data --
  that's overfitting, and a shallower tree often generalizes better.
- Assuming higher `feature_importances_` always means "more causally
  important" -- it only reflects how much that feature reduced
  impurity in this particular fitted tree, on this particular data.
- Forgetting `random_state` -- ties between equally good splits are
  broken differently without it, changing the fitted tree between
  runs.
- Comparing Gini and entropy values as if they're on the same scale --
  they're both impurity measures but computed differently; don't mix
  them in the same comparison.

## Key points

- Gini impurity and entropy both measure node "impurity"; information
  gain is the improvement a split produces.
- `max_depth` (and `min_samples_leaf`, `min_samples_split`) control
  overfitting by limiting how much the tree can memorize.
- `model.feature_importances_` gives a quick read on which features
  the tree relied on most.
$py$ where id = '10000000-0000-0000-0000-000000000104';
update concepts set lesson_content = $py$k-Nearest Neighbors makes no assumptions about the data's shape at
all: to classify a new point, it just looks at the `k` closest
training points (by distance) and takes a majority vote among their
labels. There's no real "training" step -- all the work happens at
prediction time.

```python
from sklearn.neighbors import KNeighborsClassifier

model = KNeighborsClassifier(n_neighbors=5)
model.fit(X_train, y_train)
print(model.predict(X_test[:3]))
```

Small `k` values make the decision boundary very sensitive to
individual noisy points (can overfit); large `k` values smooth the
boundary but can blur real distinctions between classes (can
underfit). Because KNN relies directly on distances between points,
features on very different scales distort those distances -- a
feature ranging in the thousands can dominate one ranging from 0 to 1
unless everything is scaled first.

## Why it matters

KNN is often the first thing worth trying on a new small dataset
precisely because it makes no assumptions about the underlying
relationship between features and labels -- it's a useful sanity-check
baseline, and the same distance-based idea (nearest neighbors) reappears
in recommendation systems and anomaly detection.

## Common mistakes

- Using KNN on unscaled features -- distance calculations get
  dominated by whichever feature happens to have the largest raw
  range, even if it's the least informative one.
- Picking `k=1` because it's simplest -- it perfectly memorizes
  training data (zero training error) but usually generalizes worse
  than a slightly larger k.
- Forgetting that "distance" needs a tie-break rule -- when several
  neighbors are equally close, or several labels are equally
  represented among the k neighbors, the implementation needs a
  deterministic way to pick.
- Assuming KNN is cheap at prediction time just because there's no
  training step -- every prediction has to scan (or index) the entire
  training set, which gets slow as data grows.

## Key points

- Euclidean distance (`sqrt(sum((a-b)^2))`) is the default notion of
  "closest," but other distance metrics exist.
- Small k = more sensitive to noise; large k = smoother but can miss
  real structure.
- Always scale features before using KNN -- it's the model most
  directly affected by differing feature scales.
$py$ where id = '10000000-0000-0000-0000-000000000105';
update concepts set lesson_content = $py$Naive Bayes applies Bayes' theorem to classification with one
simplifying ("naive") assumption: every feature is treated as
independent of every other feature, given the class. That assumption
is almost never literally true, but the resulting model is fast,
needs little data, and often works surprisingly well anyway.

```python
from sklearn.naive_bayes import GaussianNB

model = GaussianNB()
model.fit(X_train, y_train)
print(model.predict(X_test[:3]))
print(model.predict_proba(X_test[:3]))
```

`GaussianNB` assumes each feature is normally distributed within each
class; `MultinomialNB` is built for count data instead (like word
frequencies in text), which is why it's the classic choice for spam
filters and basic text classification. Both work the same way
underneath: compute each class's prior probability, multiply in each
feature's likelihood under that class, and pick whichever class scores
highest.

## Why it matters

Naive Bayes is the textbook approach to spam detection and lightweight
text classification -- it's cheap to train, handles high-dimensional
data (like word counts over a large vocabulary) gracefully, and gives
you calibrated-ish probabilities out of the box, all without needing
much training data to get reasonable results.

## Common mistakes

- Using `GaussianNB` on count data (like word frequencies) instead of
  `MultinomialNB` -- the underlying probability model doesn't match
  the data's actual distribution.
- Forgetting Laplace/Lidstone smoothing (`alpha` in `MultinomialNB`)
  matters -- without it, a feature value never seen with a class in
  training forces that class's probability to exactly zero, no matter
  how much other evidence points toward it.
- Assuming the independence assumption being violated (e.g. two
  strongly correlated features) breaks the model outright -- in
  practice it usually just means the model over-trusts duplicated
  evidence, not that it stops working.
- Reading `predict_proba` output as perfectly calibrated -- Naive
  Bayes probabilities tend to be pushed toward 0 or 1 more confidently
  than they should be, even when the predicted class is right.

## Key points

- Bayes' theorem: posterior probability is proportional to prior times
  likelihood.
- "Naive" = treating features as conditionally independent given the
  class -- a simplification, not a guarantee.
- `GaussianNB` for continuous features, `MultinomialNB` for counts;
  `alpha` controls smoothing in the latter.
$py$ where id = '10000000-0000-0000-0000-000000000106';
update concepts set lesson_content = $py$k-Means groups unlabeled points into `k` clusters by alternating two
steps: assign every point to its nearest centroid, then move each
centroid to the mean of the points assigned to it. Repeat until the
centroids stop moving (or a fixed number of iterations passes).

```python
from sklearn.cluster import KMeans

model = KMeans(n_clusters=3, random_state=42, n_init=10)
labels = model.fit_predict(X)
print(model.cluster_centers_)
print(model.inertia_)   # total within-cluster sum of squared distances
```

Unlike classification, there are no true labels to check against --
k-means is unsupervised, so "correctness" means points that are
genuinely close together end up in the same cluster. A crucial detail:
the numeric label (0, 1, 2, ...) k-means assigns to a cluster is
completely arbitrary and can differ between runs even when the actual
grouping is identical, so never compare cluster labels for exact
equality -- compare which points ended up grouped together instead.

## Why it matters

k-means is the standard first tool for customer segmentation, image
color quantization, and finding natural groupings in any unlabeled
dataset -- it's fast, simple to explain, and the "elbow method" (plotting
inertia against different values of k) gives a quick, visual way to
pick how many groups actually exist in the data.

## Common mistakes

- Comparing cluster label arrays with `==` across two different runs
  or algorithms and concluding they disagree -- cluster 0 in one run
  can be cluster 1 in another for the exact same grouping; compare
  point-to-point agreement (same cluster or not) instead, or sort
  centroids by some canonical key first.
- Not fixing a random seed -- k-means' starting centroids are chosen
  randomly, so results (and even the number of iterations to converge)
  vary run to run without one.
- Picking `k` arbitrarily instead of checking inertia across a range
  of k values (the elbow method) or domain knowledge about how many
  groups should exist.
- Not scaling features -- since k-means relies on Euclidean distance
  just like KNN, a large-scale feature can dominate the clustering.

## Key points

- k-means alternates assignment (nearest centroid) and update (mean of
  assigned points) until convergence.
- Cluster label numbers are arbitrary -- only the grouping and centroid
  positions are meaningful.
- Inertia (within-cluster sum of squares) always decreases as k grows;
  the "elbow" in that curve is a rough guide for choosing k.
$py$ where id = '10000000-0000-0000-0000-000000000107';
update concepts set lesson_content = $py$Accuracy alone can be dangerously misleading, especially on
imbalanced data -- a model that always predicts "not fraud" can be 99%
accurate if fraud really is rare, while being completely useless.
Precision, recall, and F1 give a fuller picture of what a classifier
actually gets right and wrong.

```python
from sklearn.metrics import confusion_matrix, precision_score, recall_score, f1_score

y_true = [1, 1, 1, 1, 1, 0, 0, 0, 0, 0]
y_pred = [1, 1, 1, 0, 0, 1, 1, 0, 0, 0]

print(confusion_matrix(y_true, y_pred, labels=[0, 1]))
print(precision_score(y_true, y_pred))  # of predicted positives, how many were right?
print(recall_score(y_true, y_pred))     # of actual positives, how many were caught?
print(f1_score(y_true, y_pred))         # harmonic mean of the two
```

The confusion matrix breaks every prediction into four buckets: true
positive, false positive, true negative, false negative. Precision and
recall each focus on a different kind of mistake -- precision punishes
false positives, recall punishes false negatives -- and there's
usually a tradeoff between them depending on where you set the
decision threshold.

## Why it matters

Whether precision or recall matters more depends entirely on the cost
of each type of mistake -- a spam filter should favor precision (don't
block real email), while a cancer screening test should favor recall
(don't miss a real case) -- so picking the right metric, not just
"accuracy," is often the most consequential modeling decision on a
real project.

## Common mistakes

- Reporting only accuracy on an imbalanced dataset -- it can look great
  while the model completely fails at the minority class.
- Confusing precision and recall's denominators -- precision divides by
  predicted positives, recall divides by actual positives; mixing them
  up flips the interpretation entirely.
- Averaging F1 across classes with the wrong `average` setting in a
  multi-class problem -- `"macro"` treats every class equally
  regardless of size, `"micro"` lets common classes dominate, and
  they can tell very different stories.
- Trusting `roc_auc_score` or F1 alone without ever looking at the raw
  confusion matrix -- a single number can hide exactly which kind of
  error is happening.

## Key points

- Confusion matrix buckets: TP, FP, TN, FN -- precision = TP/(TP+FP),
  recall = TP/(TP+FN), F1 = harmonic mean of both.
- Accuracy can look good on imbalanced data even when the model
  ignores the minority class entirely.
- Macro vs. micro averaging can disagree sharply when classes are
  imbalanced -- pick the one that matches what you actually care about.
$py$ where id = '10000000-0000-0000-0000-000000000108';
update concepts set lesson_content = $py$A single train/test split gives you one estimate of how a model
performs -- but that estimate depends on which particular rows
happened to land in the test set. Cross-validation runs the
train/evaluate cycle several times on different splits and averages
the results, giving a far more reliable picture (and a sense of how
much performance varies).

```python
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import cross_val_score

model = LogisticRegression(max_iter=1000)
scores = cross_val_score(model, X, y, cv=5)
print(scores)              # one score per fold
print(scores.mean(), scores.std())
```

K-fold cross-validation splits the data into `k` roughly equal folds;
each fold takes a turn as the test set while the rest train the model,
so every row gets used for both training and testing across the whole
process (just never both at once). `StratifiedKFold` keeps each
class's proportion consistent across folds, which matters a lot on
imbalanced data.

## Why it matters

Cross-validation is what makes model comparisons ("is a decision tree
or logistic regression better here?") and hyperparameter choices (like
picking k for KNN) trustworthy rather than lucky -- a single
train/test split can easily make a genuinely worse model look better,
or vice versa, just from how the rows happened to fall.

## Common mistakes

- Fitting a scaler (or any preprocessing) on the WHOLE dataset before
  cross-validating -- that leaks test-fold statistics into training
  and inflates every fold's score. Preprocessing has to be refit
  inside each fold; wrapping it in a `Pipeline` and cross-validating
  the whole pipeline handles this automatically.
- Using plain `KFold` on badly imbalanced classification data -- a fold
  can end up with almost none of the minority class; `StratifiedKFold`
  avoids that.
- Reporting only the mean CV score and ignoring its standard deviation
  -- a high mean with high variance across folds is a much less
  reliable result than the same mean with low variance.
- Treating GridSearchCV's chosen "best" hyperparameters as final
  without a truly held-out test set -- the search itself can overfit
  to the cross-validation folds if you tune too many things.

## Key points

- `cross_val_score(model, X, y, cv=5)` gives one score per fold;
  average and spread both matter.
- `StratifiedKFold` preserves class balance across folds -- important
  for imbalanced classification.
- Any preprocessing that learns from data (scalers, imputers) must be
  fit fresh inside each fold, not once on the whole dataset -- a
  `Pipeline` passed straight into `cross_val_score` does this for you.
$py$ where id = '10000000-0000-0000-0000-000000000109';
update concepts set lesson_content = $py$Many models (KNN, k-means, logistic regression trained with gradient
descent) are sensitive to the raw scale of each feature -- a feature
ranging from 0 to 100,000 can swamp one ranging from 0 to 1, even if
the second is more predictive. Feature scaling puts every feature on
comparable footing before training.

```python
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=42)

scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)   # fit only on train
X_test_scaled = scaler.transform(X_test)          # reuse train's stats
```

`StandardScaler` centers each feature to zero mean and unit variance
(z-scores); `MinMaxScaler` squashes each feature into [0, 1] instead.
Categorical columns need their own preprocessing -- one-hot encoding
turns a category into several 0/1 columns -- and missing values need
imputing before most models will even accept the data.
`ColumnTransformer` lets you apply different preprocessing to
different columns of the same dataset in one object.

## Why it matters

Preprocessing bugs are one of the most common sources of a model that
looks great in development and fails in production -- fitting a
scaler on the full dataset (including test rows) before splitting is
a subtle form of data leakage that inflates every metric you'll trust
right up until real, truly-unseen data shows up.

## Common mistakes

- Fitting a scaler (or imputer, or one-hot encoder) on the ENTIRE
  dataset before splitting into train/test -- this leaks test-set
  statistics into training and makes reported performance overly
  optimistic. Always split first, fit only on the training portion.
- Calling `fit_transform` on the test set instead of just `transform`
  -- that refits the scaler using test data, throwing away the whole
  point of holding it out.
- Applying `StandardScaler` to a one-hot encoded categorical column --
  0/1 columns don't need (and shouldn't get) centering/scaling the
  same way continuous features do.
- Forgetting that a test value outside the training range can produce
  a min-max-scaled value outside [0, 1] -- that's expected behavior,
  not a bug.

## Key points

- Fit any preprocessing step on the training data only, then apply
  (`transform`, never refit) to the test data.
- `StandardScaler` (zero mean, unit variance) and `MinMaxScaler` ([0,
  1] range) are the two most common numeric scalers.
- `ColumnTransformer` applies different preprocessing to different
  columns (e.g. scaling numeric columns, one-hot encoding categorical
  ones) as a single reusable object.
$py$ where id = '10000000-0000-0000-0000-000000000110';
update concepts set lesson_content = $py$Every model's test error comes from two competing sources. **Bias** is error
from a model too simple to capture the real pattern -- it underfits, and does
poorly even on the data it trained on. **Variance** is error from a model so
flexible it fits the training data's noise, not just its signal -- it
overfits, doing great on training data but poorly on anything new.

```python
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score

shallow = DecisionTreeClassifier(max_depth=1, random_state=42).fit(X_train, y_train)
deep = DecisionTreeClassifier(max_depth=None, random_state=42).fit(X_train, y_train)

print(accuracy_score(y_train, shallow.predict(X_train)))  # high bias -> lower even here
print(accuracy_score(y_train, deep.predict(X_train)))     # near 1.0 -- memorized it
print(accuracy_score(y_test, deep.predict(X_test)))       # often noticeably lower
```

A big gap between train and test accuracy is the signature of high variance
(overfitting). Low accuracy on *both* is the signature of high bias
(underfitting). The goal is the sweet spot in between: a model complex enough
to capture real structure but not so complex it memorizes noise.

## Why it matters

This tradeoff is the reason "just make the model bigger" isn't a universal
fix -- a deeper tree or a higher-degree polynomial can make training accuracy
look perfect while quietly getting worse at the only thing that matters:
predicting new data. Every technique later in this phase (regularization,
cross-validation, hyperparameter tuning) exists specifically to manage this
one tradeoff.

## Common mistakes

- Judging a model only by training accuracy -- a model that's memorized its
  training set can look flawless and still fail completely on new data.
- Assuming more data always fixes overfitting -- it helps variance, but a
  model with too much bias (like a straight line through curved data) won't
  improve no matter how much data you add.
- Reaching for the most complex model available "to be safe" -- added
  complexity that isn't needed just adds variance without adding accuracy.
- Ignoring the size of the train/test gap and only looking at test accuracy
  in isolation -- the gap itself tells you *which* problem you have, bias or
  variance, and therefore which fix (simplify, or regularize, or add data) is
  the right one.

## Key points

- High bias = underfitting = poor performance on train *and* test data.
- High variance = overfitting = great performance on train, worse on test.
- The train/test accuracy gap is your diagnostic signal for which one you're
  facing.
- Regularization, cross-validation, and hyperparameter tuning are all ways of
  finding the complexity level that minimizes total error.
$py$ where id = '10000000-0000-0000-0000-000000000111';
update concepts set lesson_content = $py$Hyperparameters -- things like a tree's `max_depth` or an SVM's `C` -- aren't
learned from data the way coefficients are; you set them before training.
`GridSearchCV` automates the search: give it a model and a dict of parameter
values to try, and it cross-validates every combination to find the best one.

```python
from sklearn.model_selection import GridSearchCV
from sklearn.tree import DecisionTreeClassifier

param_grid = {"max_depth": [1, 2, 3, 5, None], "min_samples_leaf": [1, 5, 10]}
grid = GridSearchCV(DecisionTreeClassifier(random_state=42), param_grid, cv=5)
grid.fit(X_train, y_train)

print(grid.best_params_)   # e.g. {'max_depth': 3, 'min_samples_leaf': 5}
print(grid.best_score_)    # mean cross-validated score of that combination
```

`grid.best_estimator_` is that best combination, already refit on the *full*
training set -- `grid.predict(...)` uses it automatically. For huge search
spaces, `RandomizedSearchCV` samples a fixed number of random combinations
instead of trying every single one, trading a small amount of thoroughness
for a lot of speed.

## Why it matters

Two models built from the identical algorithm can perform very differently
purely because of hyperparameter choices -- an under-regularized model
overfits, an over-regularized one underfits, and manually guessing values one
at a time is slow and easy to get wrong. Grid search turns that guesswork
into a systematic, reproducible search, which is exactly what real ML
workflows automate before ever shipping a model.

## Common mistakes

- Tuning against the test set directly -- `GridSearchCV.fit()` should only
  ever see the training split; the test set is for one final, honest check
  at the very end.
- Forgetting the `step_name__param` naming convention when a model is wrapped
  in a `Pipeline` -- `param_grid={"C": [...]}` fails silently to reach the
  model; it needs to be `{"model__C": [...]}`.
- Making the grid too big without noticing -- five values across four
  hyperparameters is 625 combinations, each cross-validated `cv` times; that
  adds up fast.
- Reading `grid.best_score_` as a test-set score -- it's the mean
  cross-validation score from the search, not a number computed against data
  the model has truly never seen.

## Key points

- `GridSearchCV(model, param_grid, cv=k)` tries every combination and
  cross-validates each one.
- `grid.best_params_` / `grid.best_score_` describe the winning combination;
  `grid.best_estimator_` is that model, refit on the whole training set.
- `RandomizedSearchCV` samples `n_iter` combinations instead of the full grid
  -- useful when the grid is too large to search exhaustively.
- Always keep a held-out test set the search itself never touches, for the
  final evaluation.
$py$ where id = '10000000-0000-0000-0000-000000000112';
update concepts set lesson_content = $py$Principal Component Analysis (PCA) finds new axes -- linear combinations of
your original features -- ordered by how much variance they capture. Keeping
just the first few often preserves most of the information in far fewer
columns, which helps with visualization, storage, and sometimes model speed.

```python
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

Xs = StandardScaler().fit_transform(X)   # PCA is scale-sensitive -- always scale first
pca = PCA(n_components=2, random_state=42)
Z = pca.fit_transform(Xs)

print(pca.explained_variance_ratio_)   # e.g. [0.42, 0.20] -- 62% of variance in 2 dims
```

Each row of `pca.components_` is a direction in the original feature space;
`explained_variance_ratio_` tells you what fraction of the total variance
each one captures, always in decreasing order. `pca.inverse_transform(Z)`
reconstructs an approximation of the original data -- the gap between that
reconstruction and the real thing is exactly the information you traded away.

## Why it matters

Real datasets often have far more columns than a model actually needs --
many features are redundant or correlated with each other. PCA compresses
that redundancy into a handful of components, which speeds up training,
makes 2D/3D visualization of high-dimensional data possible, and can reduce
overfitting by cutting away dimensions that were mostly capturing noise.

## Common mistakes

- Skipping feature scaling first -- a feature measured in the thousands
  (like income) will dominate the variance calculation over one measured in
  single digits (like age), even if the small-scale feature is more
  predictive.
- Comparing `pca.components_` between two runs (or implementations) with
  exact equality -- a component's *sign* is mathematically arbitrary, so a
  valid result can come back flipped; compare magnitudes (`np.abs(...)`) or
  other sign-invariant properties instead.
- Picking `n_components` arbitrarily instead of checking
  `explained_variance_ratio_`'s cumulative sum -- "2, because it's easy to
  plot" throws away information you might actually need.
- Fitting PCA on the full dataset before splitting into train/test -- fit it
  on the training data only, then `.transform()` (not `.fit_transform()`)
  the test data, to avoid leaking test information into the transformation.

## Key points

- Always scale features before PCA -- it operates on variance, which scale
  distorts.
- `explained_variance_ratio_` is sorted in decreasing order; its cumulative
  sum tells you how many components you need for a given amount of
  information retained.
- Component sign is arbitrary -- never assert exact equality on
  `components_`, only on sign-invariant properties.
- Fit PCA on training data only, then transform test data with the already-
  fitted object.
$py$ where id = '10000000-0000-0000-0000-000000000113';
update concepts set lesson_content = $py$When one class vastly outnumbers another -- fraud detection, rare disease
diagnosis, churn prediction -- accuracy stops being a useful metric. A model
that always predicts "no fraud" can be 99% accurate on a dataset that's 99%
non-fraud, while catching zero actual fraud cases.

```python
from sklearn.dummy import DummyClassifier
from sklearn.metrics import accuracy_score, recall_score

dummy = DummyClassifier(strategy="most_frequent").fit(X_train, y_train)
preds = dummy.predict(X_test)
print(accuracy_score(y_test, preds))  # looks great...
print(recall_score(y_test, preds))    # ...but this is 0.0
```

Two of the main fixes: `class_weight="balanced"` (available on many
classifiers) makes the model pay a bigger penalty for minority-class
mistakes during training, without touching the data itself. Resampling
changes the data instead -- oversampling duplicates minority rows,
undersampling drops majority rows -- always applied to the *training* split
only, so the test set stays a realistic, untouched picture of the real class
balance.

## Why it matters

The classes that matter most in imbalanced problems -- the fraud, the
disease, the churned customer -- are usually the minority class, and a model
optimized purely for accuracy will systematically ignore exactly the cases
you built it to catch. Precision, recall, F1, and ROC-AUC (and adjusting the
decision threshold) are how you keep that minority class visible in your
evaluation instead of averaged away.

## Common mistakes

- Trusting accuracy alone on an imbalanced dataset -- always check recall
  and precision (or F1) for the minority class specifically.
- Resampling before splitting into train/test -- oversampled duplicates of
  the same row can land in both splits, letting the model "cheat" by
  memorizing rows it will later be tested on.
- Forgetting `stratify=y` in `train_test_split` -- without it, a small
  minority class can end up unevenly distributed between train and test
  purely by chance, especially with smaller datasets.
- Treating 0.5 as a mandatory decision threshold -- `predict_proba` lets you
  pick any threshold; lowering it trades some precision for more recall,
  which is often the right trade when missing a minority case is costly.

## Key points

- Accuracy is misleading on imbalanced data -- use precision, recall, F1, or
  ROC-AUC instead.
- `class_weight="balanced"` reweights the loss function; oversampling/
  undersampling reweights the data itself -- both only ever touch the
  training split.
- `stratify=y` keeps class proportions consistent across train/test splits.
- The decision threshold on `predict_proba` output is a tunable dial between
  precision and recall, not a fixed 0.5.
$py$ where id = '10000000-0000-0000-0000-000000000114';
update concepts set lesson_content = $py$A `Pipeline` chains preprocessing steps and a final model into one object
that behaves like a single estimator -- one `.fit()`, one `.predict()`, no
manual bookkeeping about which transformer to apply in which order.

```python
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression

pipe = Pipeline([
    ("scaler", StandardScaler()),
    ("model", LogisticRegression()),
])
pipe.fit(X_train, y_train)
print(pipe.score(X_test, y_test))
```

`ColumnTransformer` extends this to datasets with mixed column types --
route numeric columns to a `StandardScaler` and categorical columns to a
`OneHotEncoder` in one step. And because a `Pipeline` is itself a single
estimator, it drops straight into `cross_val_score` or `GridSearchCV`
(reaching a step's hyperparameter with `"stepname__param"`, e.g.
`"model__C"`) -- every fold re-fits the scaler fresh on only that fold's
training rows, which is exactly the leak-free behavior you want.

## Why it matters

Manually scaling, imputing, and encoding data by hand before fitting a model
is exactly how test-set information quietly leaks into training -- fit a
scaler on the full dataset before splitting, and every fold in a later
cross-validation has already "seen" statistics from its own held-out rows. A
`Pipeline` makes the correct, leak-free order the default, and it doubles as
a single reusable, saveable object for deployment.

## Common mistakes

- Fitting a scaler (or imputer, or encoder) on the full dataset before
  `train_test_split` -- fit inside the pipeline instead, so cross-validation
  and the train/test split each get their own independent fit.
- Getting the `GridSearchCV` parameter name wrong on a pipelined model --
  it's `"model__C"`, not `"C"`, where `"model"` is whatever name you gave
  that step.
- Forgetting a step entirely, like skipping `SimpleImputer` when data has
  missing values -- most scikit-learn models raise on `NaN` rather than
  handling it silently.
- Listing the wrong columns in a `ColumnTransformer` -- a numeric transformer
  pointed at a text column (or vice versa) fails at fit time, not silently.

## Key points

- `Pipeline([(name, transformer), ..., (name, model)])` bundles every step
  into one fit/predict call.
- `ColumnTransformer` routes different columns to different transformers in
  one step -- ideal for mixed numeric/categorical data.
- A whole `Pipeline` can go straight into `cross_val_score` or
  `GridSearchCV`, keeping every fold's preprocessing independent.
- `pipe.named_steps["stepname"]` reaches in to inspect any individual step's
  fitted state.
$py$ where id = '10000000-0000-0000-0000-000000000115';
update concepts set lesson_content = $py$Training a model can take seconds or hours -- either way, you don't want to
redo it every time you need to make a prediction. Python's built-in `pickle`
module serializes a fitted model (or an entire `Pipeline`) into `bytes`,
which you can store and later reconstruct back into a fully working object.

```python
import pickle

blob = pickle.dumps(model)      # serialize to bytes, entirely in memory
reloaded = pickle.loads(blob)   # reconstruct a working model from those bytes

print((reloaded.predict(X_test) == model.predict(X_test)).all())  # True
```

In a real project, you'd typically write that `bytes` object to a `.pkl`
file with `joblib.dump(model, "model.pkl")` (joblib is often preferred over
raw `pickle` for large NumPy-array-heavy objects) and reload it later with
`joblib.load(...)`. This in-browser exercise skips the actual file -- a
learner's browser session doesn't reliably have real filesystem access --
and works entirely with `pickle.dumps`/`pickle.loads` in memory instead; the
underlying serialization logic is identical either way.

## Why it matters

Separating training from serving is how ML actually gets used in production:
a model gets trained once (maybe on a powerful machine, maybe overnight),
then the saved object is loaded into a lightweight service that only ever
calls `.predict()`. Every fitted attribute -- coefficients, tree splits,
scaler means -- travels with the pickle, so the reloaded model behaves
identically to the original without retraining anything.

## Common mistakes

- Pickling an entire `GridSearchCV` object when only the winning model is
  needed -- save `grid.best_estimator_` instead; it's smaller and it's the
  actual model you want to deploy.
- Assuming a pickle file will always load in a different Python or
  scikit-learn version -- pickled objects can break across major library
  version changes, so real projects record the versions used alongside the
  saved model.
- Forgetting that a `Pipeline` pickles its *entire* fitted state, preprocessing
  included -- that's a feature, not a bug, but it does mean the file is
  larger than just the final model step.
- Confusing `pickle.dumps`/`pickle.loads` (bytes in memory) with
  `pickle.dump`/`pickle.load` (an open file object) -- similarly named but
  different signatures.

## Key points

- `pickle.dumps(obj)` returns `bytes`; `pickle.loads(data)` reconstructs the
  object -- no file needed for either.
- A reloaded model's predictions are identical to the original's; every
  learned parameter survives the round trip.
- Save `grid.best_estimator_`, not the whole search object, when you only
  need the winning model.
- In a real deployment you'd typically use `joblib.dump`/`joblib.load` to a
  real file -- the serialization concept is the same one you're practicing
  here in memory.
$py$ where id = '10000000-0000-0000-0000-000000000116';
update concepts set lesson_content = $py$This concept ties every earlier one in the phase into a single small
project: predicting customer churn from a messy, realistic tabular dataset.
The workflow is always the same shape, whatever the dataset: load, clean,
engineer features, split, build a pipeline, evaluate honestly, tune, and
finally save the result.

```python
# the shape of every real project in this phase, condensed
df = load_data()                       # 1. load (often messy)
df = df.drop_duplicates().fillna(...)  # 2. clean
df["new_feature"] = ...                 # 3. engineer
X_train, X_test, y_train, y_test = train_test_split(..., stratify=y)  # 4. split
pipe = Pipeline([...])                  # 5. preprocess + model together
grid = GridSearchCV(pipe, param_grid, cv=5).fit(X_train, y_train)     # 6. tune
best = grid.best_estimator_              # 7. evaluate best on the test set
pickle.dumps(best)                      # 8. save for later use
```

Each stage catches a different failure mode: cleaning catches bad data,
stratified splitting catches misleading test scores, a pipeline catches
preprocessing leakage, tuning catches suboptimal defaults, full-metric
evaluation catches accuracy's blind spot on imbalanced classes, and saving
catches having to redo all of it next time.

## Why it matters

No single concept from this phase is useful in isolation on a real dataset
-- a perfectly tuned model trained on leaked or dirty data is worthless, and
a clean pipeline evaluated only by accuracy on an imbalanced target is
misleading. Real ML work is this entire sequence end to end, and the order
matters: skip stratified splitting or leave preprocessing outside the
pipeline, and every later step inherits that mistake.

## Common mistakes

- Engineering features or filling missing values using statistics computed
  after peeking at the test set -- always derive them from training data
  only (or, better, from inside a `Pipeline` step).
- Declaring victory after step 5 (a working pipeline) without ever tuning or
  checking recall/precision on the actual, likely-imbalanced target.
- Re-running the entire notebook from scratch every time a prediction is
  needed instead of saving the final fitted pipeline once.
- Losing track of which exact preprocessing (which columns, which encoder,
  which imputation strategy) a saved model expects -- the pipeline object
  itself is the source of truth, which is exactly why it's saved as one
  unit rather than as separate loose pieces.

## Key points

- Real projects follow the same shape every time: load, clean, engineer,
  split, pipeline, tune, evaluate, save.
- Every earlier concept in this phase is one stage of that same pipeline --
  none of them are meant to be used in isolation on real data.
- Stratified splitting and pipeline-based preprocessing prevent the two most
  common sources of a misleadingly optimistic test score.
- The saved, pickled pipeline is the actual deliverable -- it's what a real
  service would load to make predictions on new data.
$py$ where id = '10000000-0000-0000-0000-000000000117';
update concepts set lesson_content = $py$A perceptron is the simplest possible neural network: one neuron. It
takes a vector of inputs, multiplies each by a weight, adds a bias, and
passes that sum through a step function that outputs 0 or 1.

```python
import numpy as np

def perceptron_predict(x, w, b):
    z = np.dot(x, w) + b
    return 1 if z >= 0 else 0

x = np.array([1.0, 0.0])
w = np.array([0.6, 0.6])
b = -0.5
print(perceptron_predict(x, w, b))  # 1
```

Geometrically, `w` and `b` define a straight line (a hyperplane, in
higher dimensions) that splits the input space in two -- everything on
one side is classified 0, everything on the other 1. Training a
perceptron means nudging `w` and `b` until that line lands in the right
place: the perceptron learning rule adjusts weights toward the correct
answer whenever a prediction is wrong, `w += lr * (target - prediction) * x`,
and does nothing when the prediction is already right.

This is the same computation, structurally, that Frank Rosenblatt built
in hardware in 1958, and it's the exact building block every layer of
every network in this phase is made of -- a layer is just many
perceptrons computed in parallel, and a deep network is many layers of
them stacked.

## Why it matters

The perceptron's weighted-sum-plus-bias pattern is literally the first line of every neural network layer you'll write for the rest of this phase -- understanding it here means everything from forward propagation onward is "more of this," not new math. It's also exactly how logistic regression works (a perceptron with a smooth activation instead of a hard step), so this one idea underlies a lot of applied ML beyond neural nets too.

## Common mistakes

- Forgetting the bias term -- without `b`, the decision boundary is forced through the origin, and some real datasets can't be separated that way at all.
- Passing `x` and `w` with mismatched shapes into `np.dot` -- a `(2,)` vector dotted with a `(3,)` vector raises a `ValueError` rather than silently giving a wrong answer, so check shapes first when debugging.
- Assuming the perceptron learning rule converges for *any* labeling of the data -- it's only guaranteed to converge when the classes are linearly separable, which XOR famously is not.
- Treating the step function's derivative as usable for gradient-based learning -- it's zero almost everywhere and undefined at zero, which is exactly why later concepts switch to smooth activations like sigmoid.

## Key points

- A perceptron = weighted sum + bias, passed through a step function.
- `w` and `b` define a linear decision boundary -- a line in 2D, a hyperplane in general.
- The perceptron learning rule only nudges weights when a prediction is wrong.
- Perceptrons can only learn linearly separable functions -- this exact limitation is why the rest of this phase exists.$py$ where id = '10000000-0000-0000-0000-000000000118';
update concepts set lesson_content = $py$A perceptron's step function is either 0 or 1 with nothing in between,
and its slope is zero everywhere it's defined -- useless for gradient-based
learning. Real networks replace it with smooth activation functions that
squash a neuron's weighted sum into a useful range while still having a
derivative everywhere.

```python
import numpy as np

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

def relu(z):
    return np.maximum(0, z)

print(sigmoid(0))     # 0.5
print(sigmoid(5))      # ~0.993
print(relu(-3))        # 0
print(relu(3))         # 3
```

`sigmoid` squashes any real number into (0, 1), which is why it's the
default choice for a binary-classification output. `tanh` does the same
but into (-1, 1), centered on zero. `relu` (rectified linear unit) just
zeroes out negative inputs and passes positive ones through unchanged --
cheap to compute and the default for hidden layers in most modern
networks.

The nonlinearity matters more than which specific curve you pick:
stacking two *linear* layers with no activation between them is
mathematically identical to one bigger linear layer -- no depth is
gained at all. An activation function between layers is what lets a
network bend its decision boundary instead of only drawing straight
lines, which is exactly what a perceptron alone can't do.

## Why it matters

Every real network -- from a two-line NumPy toy to a production model -- is a stack of linear layers glued together with activation functions, and the choice of activation directly affects whether training works at all (a saturated sigmoid can make gradients vanish; a badly-scaled ReLU can "die" and stop learning). Recognizing sigmoid/tanh/ReLU/softmax by shape and purpose is a prerequisite for reading almost any deep learning code or paper.

## Common mistakes

- Using `sigmoid` on a multi-class output (more than 2 classes) instead of `softmax` -- sigmoid outputs aren't guaranteed to sum to 1 across classes, so they can't be read as a single probability distribution.
- Applying an activation to the *loss* instead of to the neuron's output -- the activation transforms `z` (the weighted sum) into `a` (the neuron's output); the loss function is a separate step that compares `a` to the target.
- Computing softmax as `np.exp(z) / np.sum(np.exp(z))` directly on large values -- `np.exp` of a large number overflows to `inf`, and `inf / inf` is `nan`; subtracting the row's max from `z` first keeps the exponentials bounded without changing the result.
- Assuming ReLU's derivative at exactly `z = 0` matters in practice -- it's mathematically undefined there, but any reasonable convention (0 or 1) works fine since landing on exactly 0.0 is a measure-zero event with real-valued weights.

## Key points

- `sigmoid(z)` -> (0, 1), `tanh(z)` -> (-1, 1), `relu(z)` -> [0, inf).
- Softmax turns a vector of scores into a probability distribution that sums to 1, for multi-class outputs.
- Stacking linear layers with no nonlinearity between them collapses to one linear layer -- activations are what make depth meaningful.
- Always subtract the max before exponentiating in softmax to avoid overflow.$py$ where id = '10000000-0000-0000-0000-000000000119';
update concepts set lesson_content = $py$Forward propagation is just the perceptron computation done for a whole
layer of neurons at once, using a matrix multiply instead of a single
dot product, and then repeated layer by layer.

```python
import numpy as np

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

X = np.array([[0.0, 1.0]])       # one sample, 2 features
W1 = np.array([[0.5, -0.5],      # 2 inputs -> 2 hidden units
               [0.5,  0.5]])
b1 = np.array([0.1, -0.1])

Z1 = X @ W1 + b1                 # shape (1, 2): each hidden unit's weighted sum
A1 = sigmoid(Z1)                 # shape (1, 2): each hidden unit's output
print(A1)
```

`X` has shape `(n_samples, n_features)`. A layer's weight matrix `W`
has shape `(n_inputs, n_units)` -- one column per neuron in that layer --
so `X @ W` produces one weighted sum per neuron per sample, and adding
`b` (shape `(n_units,)`) broadcasts the same bias vector across every
sample. Applying an activation elementwise turns those raw sums (`Z`)
into that layer's outputs (`A`), which become the *next* layer's input.
Chain that a second time -- `A1 @ W2 + b2`, then an activation -- and
you have a full two-layer network's forward pass.

## Why it matters

Every prediction a trained network makes -- whether it's a two-line NumPy toy or a production model with millions of parameters -- boils down to exactly this: a sequence of matrix multiplies, bias adds, and elementwise activations. Reading any neural network's architecture diagram is really just reading off the shapes of `W` and `b` at each step, and shape mismatches here are the single most common bug once you start building real networks.

## Common mistakes

- Making `W`'s shape `(n_units, n_inputs)` instead of `(n_inputs, n_units)` -- both are used in different textbooks/frameworks, but mixing conventions mid-project causes matrix multiply shape errors (or worse, a shape that "accidentally" broadcasts into something wrong).
- Forgetting that `b`'s shape must match the *output* dimension (`n_units`), not the input -- it's added once per neuron, broadcast across all samples in the batch.
- Applying the wrong activation to the output layer -- e.g. `sigmoid` for a >2-class problem (use `softmax`) or an activation at all for plain regression output (often left linear).
- Losing track of which matrix (`Z1`, `A1`, `Z2`, `A2`, ...) is which -- `Z` is always the raw weighted sum *before* the activation, `A` is always *after* it; backpropagation later needs both, not just the final output.

## Key points

- A layer's forward pass is `A = activation(X @ W + b)`.
- `X` is `(n_samples, n_features)`; `W` is `(n_inputs, n_units)`; `b` is `(n_units,)`.
- Stacking layers means each layer's `A` becomes the next layer's `X`.
- Keep `Z` (pre-activation) and `A` (post-activation) straight -- both matter later.$py$ where id = '10000000-0000-0000-0000-000000000120';
update concepts set lesson_content = $py$A loss function turns "how wrong was the network" into a single number
that training can try to minimize. Which loss you pick depends entirely
on what kind of output the network produces.

```python
import numpy as np

def mse(y_true, y_pred):
    return np.mean((y_true - y_pred) ** 2)

def binary_cross_entropy(y_true, y_pred, eps=1e-12):
    y_pred = np.clip(y_pred, eps, 1 - eps)
    return -np.mean(y_true * np.log(y_pred) + (1 - y_true) * np.log(1 - y_pred))

print(mse(np.array([3.0]), np.array([2.5])))               # 0.25
print(binary_cross_entropy(np.array([1.0]), np.array([0.9])))  # small, ~0.105
```

Mean squared error (MSE) fits regression: it measures the average
squared distance between predictions and targets, and it's naturally
sensitive to how *far* a prediction is from the truth. Binary
cross-entropy fits binary classification: it measures how well a
predicted probability matches a 0/1 label, and it penalizes a
*confident, wrong* prediction (e.g. predicting 0.99 when the answer is
0) far more harshly than MSE would -- which is exactly the gradient
signal you want when the output is a probability. Categorical
cross-entropy is the same idea generalized to more than two classes,
paired with a softmax output.

Every cross-entropy formula involves `log(y_pred)`, and `log(0)` is
`-inf` -- so any real implementation clips predictions away from the
exact boundaries 0 and 1 before taking the log.

## Why it matters

The loss function is the one thing the entire training process is built to minimize, so picking the wrong one for the task quietly cripples learning even when every other part of the network is correct -- MSE on a classification problem produces much weaker gradients than cross-entropy does, and models trained on it converge slower and to worse decision boundaries.

## Common mistakes

- Forgetting to `np.clip` predictions before `np.log` in a cross-entropy loss -- a prediction of exactly 0.0 or 1.0 (which sigmoid can produce due to floating-point rounding at extreme inputs) turns into `log(0)`, i.e. `-inf` or `nan`.
- Using MSE for a classification problem out of habit -- it technically "works" (it's just a number) but gives much weaker gradients near the decision boundary than cross-entropy, which pairs much better with a sigmoid/softmax output.
- Summing the per-sample loss instead of averaging it -- a summed loss grows with batch size, making it impossible to compare training runs that use different batch sizes, or to pick one learning rate that works across both.
- Mismatching `y_true` and `y_pred` shapes, e.g. `y_true` as shape `(n,)` and `y_pred` as shape `(n, 1)` -- NumPy broadcasts these into an `(n, n)` matrix instead of raising an error, silently computing a nonsense loss.

## Key points

- MSE for regression, binary cross-entropy for binary classification, categorical cross-entropy for multi-class classification.
- Always clip predictions before taking a log in a cross-entropy loss.
- A loss is normally the *mean* over the batch, not the sum, so it's comparable across different batch sizes.
- Falling loss across training = the network is learning; that's the whole point of computing it every step.$py$ where id = '10000000-0000-0000-0000-000000000121';
update concepts set lesson_content = $py$Backpropagation is the chain rule, applied repeatedly, to find how much
each weight in a network contributed to the final loss. Nothing about it
is a special new kind of math -- it's ordinary calculus, organized so a
computer can apply it layer by layer.

```python
import numpy as np

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

x, w, b, y = 2.0, 0.5, -0.1, 1.0

z = w * x + b            # linear step
a = sigmoid(z)            # activation
loss = (a - y) ** 2        # squared error

# chain rule: dL/dw = dL/da * da/dz * dz/dw
dL_da = 2 * (a - y)
da_dz = a * (1 - a)         # sigmoid's own derivative
dz_dw = x                   # z = w*x + b, so dz/dw = x

dL_dw = dL_da * da_dz * dz_dw
print(dL_dw)
```

Each line of the forward pass has a "local" derivative -- how much its
output changes if its own input nudges slightly. The chain rule says the
total effect of `w` on the loss is the *product* of every local
derivative on the path from `w` to the loss: `dL/dw = dL/da * da/dz *
dz/dw`. Backpropagation is just running this multiplication starting
from the loss and working backward through the network, reusing each
layer's local gradient (`dL/da` for the layer before it) instead of
recomputing the whole chain from scratch every time.

Because it's easy to get a sign or an order wrong by hand, the standard
way to trust a derivation is **gradient checking**: nudge one parameter
by a tiny amount `eps` in each direction, see how much the loss actually
changed, and compare that numerical estimate to what your formula
predicts. If they don't agree, the formula (not the number) is wrong.

## Why it matters

Every deep learning framework's `.backward()` call is doing exactly this chain-rule bookkeeping automatically -- understanding it here is what lets you debug a network that isn't learning (a wrong gradient formula is a common, silent way for training to just... not work), and it's the actual reason backprop is efficient: each layer's local gradient is computed once and reused, rather than differentiating the whole network from scratch for every single weight.

## Common mistakes

- Multiplying only part of the chain -- computing `da/dz` and stopping there, then treating it as the full gradient of `w`, instead of continuing the chain through `dz/dw`.
- Getting the chain rule's direction backwards -- gradients flow from the loss *back* through the network, so a layer needs the gradient *from* the layer after it (closer to the loss), not before it.
- Forgetting that a bias's gradient is just the upstream gradient itself (`dz/db = 1`, not `x`) -- unlike a weight's gradient, it isn't multiplied by the input.
- Trusting a hand-derived formula without gradient-checking it first -- an off-by-one exponent or a flipped sign compiles fine and runs fine, it just quietly computes the wrong number, which gradient checking catches immediately.

## Key points

- Backpropagation = chain rule, applied from the loss backward through each layer.
- Each layer only needs its own local derivative and the upstream gradient handed to it -- it doesn't need to know about layers further away.
- A weight's gradient depends on the layer's input; a bias's gradient is just the upstream gradient.
- Gradient checking (comparing to a finite-difference estimate) is how you verify a derivation before trusting it.$py$ where id = '10000000-0000-0000-0000-000000000122';
update concepts set lesson_content = $py$Everything so far -- forward propagation, loss functions, the chain
rule -- comes together into one vectorized implementation: forward pass,
compute loss, backward pass, update weights. This is a real, working
training loop, built entirely from NumPy arrays.

```python
import numpy as np

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

# forward, caching what backward will need
Z1 = X @ W1 + b1
A1 = sigmoid(Z1)
Z2 = A1 @ W2 + b2
A2 = sigmoid(Z2)

# backward, using the sigmoid + binary cross-entropy shortcut:
# dL/dZ2 simplifies to exactly (A2 - y) / n
n = X.shape[0]
dZ2 = (A2 - y) / n
dW2 = A1.T @ dZ2
db2 = np.sum(dZ2, axis=0)

dA1 = dZ2 @ W2.T
dZ1 = dA1 * A1 * (1 - A1)
dW1 = X.T @ dZ1
db1 = np.sum(dZ1, axis=0)

W1 -= lr * dW1; b1 -= lr * db1
W2 -= lr * dW2; b2 -= lr * db2
```

Notice `A1` -- computed during the forward pass -- gets reused during
the backward pass (`dW2 = A1.T @ dZ2`); this is exactly why forward
propagation needs to *cache* its intermediate values instead of just
returning the final output. Repeating forward -> loss -> backward ->
update many times, on the classic XOR dataset, is this phase's capstone:
XOR is not linearly separable (Concept 1's perceptron provably can't
solve it), but a hidden layer with a nonlinear activation can bend the
decision boundary enough to solve it exactly.

## Why it matters

This loop -- forward, loss, backward, update -- is the same four steps every deep learning framework's training code runs, just with `.forward()` and `.backward()` doing the bookkeeping automatically instead of by hand; having built it yourself in raw NumPy means a framework's abstractions describe something you've actually done, not something you're taking on faith.

## Common mistakes

- Not caching forward-pass intermediates (`Z1`, `A1`, `Z2`, `A2`) -- backward needs several of them, and recomputing them from scratch (or worse, approximating) introduces subtle bugs.
- Mixing up `W2` and `W2.T` when propagating the gradient back into the hidden layer (`dA1 = dZ2 @ W2.T`) -- the transpose is what lets a `(n_samples, n_out)` gradient turn back into a `(n_samples, n_hidden)` one.
- Forgetting to divide by the batch size somewhere in the gradient computation -- the loss is a mean over samples, so its gradient should be too, or the effective learning rate silently scales with batch size.
- Updating `W1` before finishing using the *old* `W2` to compute `dA1` -- weight updates must happen only after every gradient in that step has been computed from a single, consistent set of parameters.

## Key points

- A full training step is: forward pass (caching intermediates) -> compute loss and its gradient -> backward pass through each layer -> update every parameter.
- Sigmoid output + binary cross-entropy has a clean simplification: `dL/dZ_output = (A_output - y) / n`.
- XOR needs a hidden layer -- this is the concrete, working proof that nonlinearity plus depth buys real representational power a single perceptron doesn't have.
- Never assert an exact final loss or exact final weights when testing a trained network -- assert the *predictions* are correct, or that the loss dropped substantially.$py$ where id = '10000000-0000-0000-0000-000000000123';
update concepts set lesson_content = $py$An **epoch** is one full pass through the training data. A **batch** is
however many examples get processed together before the weights are
updated once. Training a network is really just an epoch loop wrapped
around a batch loop, calling the forward/backward/update step from the
previous concept over and over.

```python
import numpy as np

def make_batches(n_samples, batch_size):
    return [slice(i, min(i + batch_size, n_samples))
            for i in range(0, n_samples, batch_size)]

n_samples, batch_size = 10, 3
for b in make_batches(n_samples, batch_size):
    print(b, "->", (b.stop - b.start), "examples")
```

With `batch_size == n_samples` (one giant batch), every epoch is a
single update -- that's full-batch gradient descent, simple but slow to
adapt. With `batch_size == 1`, every single example gets its own update
-- noisy, but fast to react. Everything in between is **mini-batch**
gradient descent, the practical default: it computes a less noisy
gradient than one example at a time, while still updating far more
often than one giant batch would allow.

Shuffling the data before splitting it into batches (with a fixed seed,
so the run is reproducible) matters too -- without it, the network sees
examples in the exact same order every epoch, which can bias training
toward whatever happens to be first.

## Why it matters

"How many epochs?" and "what batch size?" are two of the first questions asked about any real training run, because they directly trade off training speed against how noisy (or stable) each weight update is -- get batch size badly wrong and a model either trains agonizingly slowly (huge batches, few updates) or never settles down (batch size 1 on a noisy dataset).

## Common mistakes

- Forgetting to shuffle the data each epoch (or shuffling without a fixed seed) -- the former can bias training toward the data's original order, the latter makes a run impossible to reproduce.
- Off-by-one errors on the last, possibly-smaller batch -- if `n_samples` isn't evenly divisible by `batch_size`, the last batch has fewer examples, and code that assumes every batch is the same size will crash or silently drop data.
- Averaging per-batch losses with an unweighted mean when batches aren't all the same size -- a smaller final batch should count proportionally less toward the epoch's overall average loss.
- Treating "epoch" and "batch" as interchangeable -- one epoch is a full pass over *all* the data, and (unless batch size equals the dataset size) it takes many batches to complete one epoch, not one.

## Key points

- One epoch = one full pass over the training data; a batch is a chunk processed together between updates.
- Mini-batch gradient descent (small batch size, not 1 and not the whole dataset) is the usual practical default.
- Shuffle with a fixed seed each epoch so results are both less order-biased and still reproducible.
- Track loss per epoch -- a clear downward trend is how you know training is actually working, not just running.$py$ where id = '10000000-0000-0000-0000-000000000124';
update concepts set lesson_content = $py$Every network in this phase ran entirely in NumPy, in your browser, via
Pyodide -- and that was the point, not a workaround. You derived
backprop and implemented it yourself instead of calling a framework's
`.backward()`. But it's worth being direct about what that setup can
and can't do, so the boundary doesn't stay invisible.

Pyodide is a real Python interpreter compiled to WebAssembly, running
single-threaded on your browser's CPU. There is no WASM build of
PyTorch, TensorFlow, or JAX available here -- and even if there were, the
thing those frameworks are really for isn't syntax, it's **automatic
differentiation** (never hand-deriving a gradient again) and **GPU
acceleration** (matrix multiplies distributed across thousands of cores
at once). A modern network with millions or billions of parameters,
trained on millions of images or billions of tokens, is simply not a
"run it a bit slower" version of the XOR network you just built -- the
compute involved is many orders of magnitude larger, and a single CPU
core in a browser tab is the wrong tool for it, on purpose, not as some
fixable inconvenience.

```python
# what you just built:
hidden_units = 4        # a handful of numbers
epochs = 5000            # finishes in well under a second

# what a real image classifier looks like:
# parameters:  ~25,000,000
# training images: ~1,000,000+
# hardware: a GPU (or a cluster of them), for hours to days
```

None of that makes what you built here a toy in the dismissive sense --
the math you derived by hand is the *exact same math* running inside
every one of those larger systems. What changes at scale is engineering
(distributing computation, managing memory, streaming huge datasets),
not the core idea.

## Why it matters

Knowing precisely where a learning environment's walls are is what turns "I built a neural network" into "I understand what a neural network is, and I know what it takes to run one for real" -- the second claim is the one that transfers directly to a real GPU, a real framework, and a real dataset, without any surprises about what changes and what doesn't.

## Common mistakes

- Assuming `pip install torch` would just work here if you tried it -- Pyodide only has packages with WebAssembly builds available, and no mainstream deep learning framework currently ships one; this is a platform constraint, not a settings toggle.
- Concluding that because a framework "does the math for you," the math itself was somehow different or more complex than what you derived here -- it's the identical chain rule, just applied automatically across far more layers and parameters.
- Thinking a GPU only makes things "faster" in a generic sense -- what actually changes is that thousands of independent multiply-adds (exactly what a matrix multiply is) happen in parallel instead of one at a time, which is why GPU speedups are enormous specifically for matrix-heavy workloads and much smaller for logic-heavy, branchy code.
- Treating "beyond this app" as "therefore out of reach" -- a real GPU-backed framework is a `pip install` and a free Colab/Kaggle notebook away; nothing about today's exercises requires special hardware to continue from here.

## Key points

- No PyTorch/TensorFlow/JAX runs in this app's Pyodide sandbox -- deliberately, and for a concrete reason (no WASM build exists), not as an oversight.
- Frameworks add automatic differentiation and GPU acceleration -- neither changes the underlying math, both change what scale is practical.
- The gap from "XOR in a browser" to "a real trained model" is almost entirely about *scale of compute*, not new concepts.
- Next real steps: install PyTorch or TensorFlow locally (`pip install torch`), get free GPU access via Google Colab or Kaggle notebooks, and work through a structured course (fast.ai) or textbook (*Dive into Deep Learning*, or Goodfellow/Bengio/Courville's *Deep Learning*) to go from having built one from scratch to being able to build real ones.$py$ where id = '10000000-0000-0000-0000-000000000125';
update concepts set lesson_content = $py$An ML project's scope doc looks like a regular scope doc plus a few
ML-specific fields: what kind of problem it is (classification,
regression, clustering), what metric decides success, and how much
data the plan actually needs. Skipping this is how ML projects turn
into an open-ended series of "let's try one more model," with no
written way to know when to stop.

```python
scope = {
    "problem_type": "classification",
    "target_metric": "f1_score",
    "success_threshold": 0.85,
    "data_sources": ["labeled_reviews.csv"],
    "non_goals": ["multi-language support", "real-time inference"],
}
```

## Why it matters

Unlike most software features, an ML model rarely has a single obviously "done" state -- it can almost always get a little more accurate with more data, more features, or more tuning time. A success threshold decided *before* training is the only thing that stops that chase from eating the whole timeline; a threshold picked after seeing results tends to drift toward whatever the model happened to get.

## Common mistakes

- Picking a metric that's easy to compute (accuracy) instead of the one that matches the problem -- accuracy on a 95%-imbalanced dataset hides a model that never predicts the minority class at all.
- Leaving "success" vague ("make it good") instead of a number written down before training -- there's no way to know a project is done, or failing, without one.
- Assuming more data always helps without estimating how much the problem actually needs -- a rough rule of thumb (e.g. ~10x examples per feature, per class for classification) at least gives a number to check against what's available.
- Scoping the model in isolation from how it'll actually be used -- a 90%-accurate model that takes 10 seconds per prediction is useless for a use case that needs an answer in 50ms.

## Key points

- Decide the problem type and success metric *before* training anything -- both are easier to reason about honestly before there's a number to defend.
- A dataset-size estimate, even a rough one, catches "we don't have nearly enough labeled data for this" in week one instead of month two.
- Non-goals matter as much here as in any other scope doc -- "not real-time," "not multi-class," "not production latency" all keep the v1 achievable.$py$ where id = '10000000-0000-0000-0000-000000000126';
update concepts set lesson_content = $py$A real ML project's code isn't one script -- it's stages that each
take the previous stage's output as input: load data, clean it, turn
it into features, train a model, evaluate it. Writing each stage as a
function with a clear input/output contract keeps you honest about
what actually flows between the steps, and lets you swap any one of
them without touching the others.

```python
def run_pipeline(steps, data):
    result = data
    for step in steps:
        result = step(result)
    return result

pipeline = [load_data, clean, featurize, train, evaluate]
metrics = run_pipeline(pipeline, "raw.csv")
```

## Why it matters

A notebook that runs top to bottom in one sitting is fine for exploring, but it isn't a pipeline -- the moment you need to rerun just the training step with already-cleaned data, or swap one featurizer for another, undifferentiated top-to-bottom code forces you to re-run (or copy-paste) everything around the part that changed. Stages you can call independently are stages you can test, retry, and reorder independently.

## Common mistakes

- Writing one giant `main()` that loads, cleans, trains, and evaluates inline -- it works until you need to rerun just one step, and now you can't without duplicating code or re-running everything upstream of it.
- Letting a later stage silently assume an earlier one succeeded (e.g. training code assumes cleaned data has no missing values) instead of checking the contract at the boundary between stages.
- Hardcoding the stage order inside each function instead of composing a list of stages, so reordering or inserting a new step means editing logic instead of just editing a list.
- Not handling a stage that raises -- one bad row of data three stages in shouldn't crash the whole run with no indication of which stage actually broke.

## Key points

- Each stage should have one job and a predictable input/output type -- that's what makes stages swappable and testable in isolation.
- Composing stages as a list (or a small `compose()` helper) makes the pipeline's order visible and easy to change.
- A pipeline that reports *which* stage failed, not just that something failed, saves real debugging time.$py$ where id = '10000000-0000-0000-0000-000000000127';
update concepts set lesson_content = $py$Training one model and reading its accuracy tells you almost nothing
on its own -- what matters is comparing it against a baseline, against
other candidate models, and against your own model's previous
iteration. This is where a written evaluation methodology (which
metric, computed how, compared to what) earns its keep.

```python
def best_model(results, metric, higher_is_better):
    pick = max if higher_is_better else min
    return pick(results, key=lambda r: r[metric])["name"]

results = [{"name": "baseline", "f1": 0.71}, {"name": "v2", "f1": 0.79}]
print(best_model(results, "f1", higher_is_better=True))  # v2
```

## Why it matters

A single number from a single run is easy to over-trust -- it might just be luck of the train/test split. Comparing against a named baseline, tracking whether each iteration's change actually helped, and averaging across multiple folds instead of trusting one split are what separate "the model got better" from "the model got a better random seed."

## Common mistakes

- Comparing a new model's score to the old one without a tolerance -- a 0.001 "improvement" from run-to-run randomness looks like progress but is often just noise; fix it by fixing your random seed and/or averaging across folds.
- Reporting a single train-set score and calling it done -- a gap between train and validation performance is exactly what flags overfitting, and a model never checked against held-out data can look great and fail in production.
- Chasing the leaderboard metric while ignoring model complexity or latency -- a model that's 0.3% better but 50x slower to run is very rarely the right tradeoff, especially when a simpler model is within noise of the same score.
- Not writing down what changed between iterations -- without a log of "iteration 3: added feature X, f1 went from 0.79 to 0.81," you can't tell which change actually helped.

## Key points

- Always compare against a named baseline and the previous iteration, not just "is this number good."
- Cross-validation (averaging a metric over several folds) is more trustworthy than a single train/test split, which can get lucky or unlucky.
- Early stopping -- halting when a validation metric stops improving for several checks in a row -- avoids overfitting and wasted training time.$py$ where id = '10000000-0000-0000-0000-000000000128';
update concepts set lesson_content = $py$A model card is a short, structured writeup of what a model does, what
data it was trained on, how well it performs, and where it shouldn't
be trusted -- the ML equivalent of a README, aimed at someone deciding
whether to use your model at all.

```python
card = {
    "purpose": "Classify support tickets into 5 priority levels.",
    "data": "12,000 historical tickets, 2022-2024, English only.",
    "metrics": {"accuracy": 0.88, "f1_macro": 0.81},
    "limitations": [
        "Trained on English tickets only -- untested on other languages.",
        "Priority 5 (lowest) is underrepresented; recall is weaker there.",
    ],
}
```

## Why it matters

A model's number on its own is unfalsifiable to anyone but you -- "88% accurate" means nothing without knowing what it was measured on and what it's expected to handle. A model card gives a stranger (or future-you, six months later) enough context to decide whether the model applies to their situation, without having to read the training code to find out.

## Common mistakes

- Reporting only the headline metric (accuracy) and skipping per-class or per-segment performance -- a model that's 90% accurate overall can still fail badly on the one class or segment that matters most.
- Writing limitations as an afterthought ("works great!") instead of specifics someone could actually check against their own use case -- "may not generalize" says nothing useful; "trained on 2022-2024 data, unvalidated on newer traffic patterns" does.
- Describing the training data vaguely ("a big dataset") -- size, source, and time range are exactly what someone needs in order to judge whether the model applies to their situation.
- Skipping intended use / out-of-scope use entirely, so the model quietly gets applied to a problem it was never evaluated against.

## Key points

- Purpose, data, metrics, and limitations are the four sections no model card should skip.
- Limitations should be specific enough that a reader can decide, on their own, whether the model applies to their case.
- A model card is written for someone who didn't build the model -- assume no shared context with the reader.$py$ where id = '10000000-0000-0000-0000-000000000129';
update concepts set lesson_content = $py$This app runs Python in the browser via Pyodide -- there's no real
server to stand up, no container to build, no network request to
send. So this lesson (and its challenges) is deliberately about the
*logic* of deployment readiness -- the checks and data shapes you'd
need regardless of framework -- not about literally running FastAPI or
Docker, which this platform's earlier phases already flag as beyond
what Pyodide can execute.

```python
def is_deployment_ready(bundle, required_keys):
    return all(bundle.get(k) is not None for k in required_keys)

bundle = {"model": "clf_v3.pkl", "config": {"threshold": 0.5}, "version": "3.0.1"}
print(is_deployment_ready(bundle, ["model", "config", "version"]))  # True
```

## Why it matters

"The model trains and scores well" and "this is safe to deploy" are different questions -- a deployable bundle also needs a pinned version, a validated config, and a defined request/response shape, none of which training touches. Deciding rollout percentage and rollback thresholds *before* an incident, rather than during one, turns a stressful judgment call into a number everyone already agreed on.

## Common mistakes

- Treating "the model trains and scores well" as equivalent to "ready to deploy" -- a deployable bundle needs a pinned version, a config, and a defined request/response shape too, none of which training checks for you.
- Serving predictions with no defined response schema, so every consumer parses the output differently and a silent format change breaks all of them at once.
- Rolling out a new model to 100% of traffic at once instead of a canary split -- a small percentage first means a bad model only affects a fraction of requests while you're still confirming it behaves.
- No rollback trigger decided in advance -- "we'll roll back if it's bad" sounds fine until "bad" has to be judged emotionally, under pressure, in the middle of an actual incident.

## Key points

- A deployment-ready bundle is checkable in code: required keys present, types correct, version set -- write that check once and every deploy runs it.
- Request/response shapes are a contract -- validate them the same way you'd validate any other function's inputs.
- A canary rollout and a concrete rollback threshold turn "is this deploy okay?" from a judgment call into a number you already agreed on.$py$ where id = '10000000-0000-0000-0000-000000000130';

-- Micro-projects (one per concept)

insert into projects (phase_id, concept_id, title, description, project_type) values
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000076', 'Force Vector Combiner', 'Given two or three force vectors (as tuples) acting on an object, write plain-Python functions to compute their sum, the resultant''s magnitude, and the angle between any two of them.', 'micro'),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000077', 'Grade Matrix', 'Represent a class''s scores across three assignments as a list-of-lists matrix (rows = students, columns = assignments). Write plain-Python functions to transpose it (assignments as rows) and compute each assignment''s column total.', 'micro'),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000078', 'Temperature Grid', 'Build a 2D NumPy array of a week''s hourly temperature readings (rows = days, columns = hours). Print its shape, extract one full day (a row), one hour across all days (a column), and all readings above a threshold using a boolean mask.', 'micro'),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000079', 'Batch Price Adjuster', 'Given a 2D NumPy array of daily prices for several products (rows = products, columns = days), use broadcasting to apply a single per-product discount vector to every day''s column, and separately apply one global tax rate to the whole array.', 'micro'),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000080', 'Exam Score Summarizer', 'Given a NumPy array of exam scores, compute and print the mean, sample standard deviation, min, max, and the correlation between scores and a second array of study hours.', 'micro'),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000081', 'Dice Probability Explorer', 'Write functions that compute the probability of rolling a specific total with two dice by counting favorable outcomes over all 36 possibilities, and compare that exact probability to a seeded simulation of many dice rolls.', 'micro'),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000082', 'Recipe Scaler', 'Given two mixtures with known total weights and known ratios of two ingredients, set up and solve the 2x2 linear system (via np.linalg.solve) to recover each mixture''s exact ingredient amounts.', 'micro'),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000083', 'Slope Explorer', 'For a quadratic function of your choosing, write a numerical derivative function, print the slope at several points, and use a small loop of gradient descent steps to find where the function is minimized.', 'micro'),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000084', 'Sales Trend Chart', 'Given a list of monthly sales figures, use matplotlib to plot the trend as a line chart with axis labels and a title, then add a second line for a rolling 3-month average on the same axes with a legend distinguishing the two.', 'micro'),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000085', 'Seeded Dice Roller', 'Write a function that simulates rolling a six-sided die n times using a given seed, and demonstrate that calling it twice with the same seed produces identical results, while a different seed produces a different (but still valid) sequence.', 'micro'),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000086', 'Build a Pet Roster', 'Create a DataFrame from a dict describing a handful of pets (name, species, age). Print its .shape, .columns.tolist(), .dtypes, and df.head(2). Then add a new column ''is_young'' that''s True when age < 3, and print the whole DataFrame again.', 'micro'),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000087', 'Round-Trip a Roster', 'Build a small DataFrame of students (name, grade, email). Write it to a CSV string with to_csv(index=False), read it back with pd.read_csv(io.StringIO(...)), and confirm (by printing both) that the round trip preserves the data. Then do the same round trip through to_json()/read_json().', 'micro'),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000088', 'Filter a Product Catalog', 'Build a small DataFrame of products (name, category, price, in_stock). Use boolean masks to print only in-stock products under $20, then use .loc to print just the name and price columns for products in the ''Electronics'' category, and .iloc to grab the first and last row.', 'micro'),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000089', 'Clean a Survey', 'Build a small DataFrame of survey responses (name, age, satisfaction_score) where a few cells are np.nan. Print the missing-value count per column, then produce two cleaned versions: one with rows containing any missing value dropped, and one where missing satisfaction_score is filled with the column''s mean.', 'micro'),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000090', 'Summarize Sales by Region', 'Build a small DataFrame of sales transactions (region, product, amount). Compute total and average amount per region with groupby + named aggregation, then use .transform() to add a column showing each row''s amount minus its region''s average.', 'micro'),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000091', 'Combine Orders and Customers', 'Build two small DataFrames: orders (order_id, customer_id, amount) and customers (customer_id, name, region). Merge them with an inner join to see which orders have a matching customer, then with a left join to see all orders including any without a matching customer_id.', 'micro'),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000092', 'Engineer Product Features', 'Build a small DataFrame of products (price, cost, category, launch_date as strings). Add a ''margin'' column (price - cost), bin price into ''low''/''mid''/''high'' with pd.cut, one-hot encode ''category'' with pd.get_dummies, and extract the launch year from launch_date after converting it with pd.to_datetime.', 'micro'),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000093', 'End-to-End Mini EDA', 'Given a raw CSV string of transactions (with a few missing values and mixed regions), load it with read_csv, report missing values per column, drop or fill as appropriate, print .describe() for the numeric column, compute the mean per region with groupby, and compute the correlation between two numeric columns.', 'micro'),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000094', 'Baseline Before Anything Else', 'Given a small numeric dataset, split it into train/test sets with a fixed seed, then build the simplest possible ''model'' -- always predict the training mean -- and measure its MAE on the test set. This baseline number is what any real model in the rest of this phase has to beat.', 'micro'),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000095', 'Fit a Line by Hand', 'Generate a small noisy linear dataset (y = 2x + 1 plus a little random noise), then implement the full gradient descent loop from scratch in NumPy -- no sklearn -- to recover an estimate of the slope and intercept. Print your estimates alongside the true 2 and 1 to see how close plain gradient descent gets.', 'micro'),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000096', 'One-Liner Regression', 'Take the same synthetic dataset from the from-scratch lesson and fit it with sklearn''s LinearRegression instead. Print coef_, intercept_, and score(), and compare the coefficients to what your hand-written gradient descent converged to.', 'micro'),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000097', 'Compare the Cost Landscape', 'For a small dataset, compute the MSE cost for a grid of candidate (w, b) pairs and find the pair with the lowest cost by brute-force search. Compare that grid-search answer to what gradient descent converges to.', 'micro'),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000098', 'Learning Rate Autopsy', 'Run your multivariate gradient descent implementation on the same dataset with three different learning rates -- one too small, one reasonable, one too large -- and print the loss every few hundred epochs for each. Explain in a comment which run diverged and why.', 'micro'),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000099', 'Find the Sweet Spot Degree', 'Fit polynomial regression at several degrees (1 through 10) on the same train/test split, record train and test MSE for each, and print them side by side. Identify the degree where test error is lowest -- that''s the sweet spot between underfitting and overfitting.', 'micro'),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000100', 'Shrink It and See', 'On a dataset with more features than you actually need (some columns irrelevant to the target), fit LinearRegression, Ridge, and Lasso at the same alpha, print each model''s coefficients, and note which one zeroes out the irrelevant features.', 'micro'),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000101', 'Full Report Card', 'Fit a LinearRegression model on a train/test split, then compute and print R^2, MAE, and RMSE on both the training and test sets side by side, plus the mean cross-validation R^2 across 5 folds on the full dataset.', 'micro'),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000102', 'Logistic regression on two hand-built clusters', 'Generate two small clusters of 2D points by hand (or with a fixed numpy seed), implement sigmoid, the loss, gradients, and a training loop entirely with plain NumPy, then plot (or print) how the loss decreases over training and report final training accuracy.', 'micro'),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000103', 'Baseline classifier with sklearn', 'Load or generate a small labeled 2D dataset, split it into train/test, fit LogisticRegression, and report accuracy, the learned coefficients, and which feature has the strongest influence on the prediction.', 'micro'),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000104', 'Overfitting demo with tree depth', 'Fit DecisionTreeClassifier at several max_depth values (e.g. 1, 3, 5, None) on the same train/test split, and report both train and test accuracy for each -- show clearly where the tree starts overfitting.', 'micro'),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000105', 'k sweep on a noisy dataset', 'Generate a 2D dataset with some class overlap (noisy labels), then fit KNeighborsClassifier for k = 1, 3, 5, 9, 15 and report test accuracy for each -- identify which k generalizes best and briefly explain why very small k underperforms here.', 'micro'),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000106', 'Tiny spam filter', 'Build a small bag-of-words count matrix by hand for 8-10 short toy messages labeled spam/not-spam, fit MultinomialNB, and report which alpha (smoothing) value gives the best held-out accuracy.', 'micro'),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000107', 'Elbow method on synthetic blobs', 'Generate 2D data with a known number of clusters (fixed numpy seed), run KMeans for k = 1 through 6, record inertia_ for each k, and identify the elbow -- the k where inertia stops dropping steeply -- comparing it to the true number of clusters you generated.', 'micro'),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000108', 'Metric report card for a toy classifier', 'Given a small (10-12 example) hand-built set of true labels and two competing prediction arrays, compute the confusion matrix, precision, recall, and F1 for each by hand and with sklearn, and write one sentence on which model you''d actually deploy and why.', 'micro'),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000109', 'Cross-validated model comparison', 'Using the same dataset, cross-validate (cv=5) a LogisticRegression, a DecisionTreeClassifier, and a KNeighborsClassifier, report each model''s mean and std CV accuracy, and pick a winner with a one-sentence justification referencing both numbers.', 'micro'),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000110', 'Scaling''s effect on a distance-based model', 'Build a 2D dataset where one feature has a much larger raw scale than the other, then compare KNeighborsClassifier accuracy with and without StandardScaler applied first -- report both accuracies and explain the gap in one or two sentences.', 'micro'),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000111', 'Complexity sweep', 'Fit DecisionTreeClassifier at several max_depth values (1, 2, 3, 5, 10, None) on the same train/test split, record train and test accuracy for each, and identify which depth has the smallest train-test gap while still keeping test accuracy competitive -- that''s your bias-variance sweet spot for this dataset.', 'micro'),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000112', 'Tune it yourself', 'Pick any classifier and two of its hyperparameters, build a small param_grid for each, run GridSearchCV(cv=5), and report the best combination plus how much better (or worse) it does on a held-out test set compared to the model''s default (untuned) settings.', 'micro'),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000113', 'How much can you compress?', 'Scale a dataset with several numeric features, fit PCA with no component limit, and find the smallest number of components needed to retain 80%, 90%, and 95% of the total variance -- then compare a classifier''s test accuracy trained on the full features versus trained on just the 90%-variance components.', 'micro'),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000114', 'Rescue the minority class', 'Take an imbalanced classification dataset (or generate one with make_classification(weights=[0.9, 0.1])), measure a plain model''s recall on the minority class, then apply class_weight=''balanced'' and measure recall again -- report the improvement and explain, in a sentence, the precision/recall tradeoff you observe.', 'micro'),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000115', 'One pipeline, start to finish', 'Build a Pipeline (or ColumnTransformer + Pipeline, if your data has mixed column types) that handles missing values, scales numeric features, encodes categoricals, and fits a model, all in one object -- then confirm cross_val_score on the whole pipeline gives a sensible, stable score across folds.', 'micro'),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000116', 'Train once, predict many times', 'Fit a model, pickle it to bytes, then write a small function that takes the pickled bytes plus a new row of features and returns a prediction by reloading the model each call -- confirming the whole round trip works without ever retraining.', 'micro'),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000117', 'Your own end-to-end project', 'Pick (or construct) a small tabular dataset with at least one categorical column and an imbalanced binary target, then run it through the full workflow yourself: clean, engineer one new feature, stratified-split, build a ColumnTransformer + Pipeline, tune one hyperparameter with GridSearchCV, report precision/recall/F1/ROC-AUC on the test set, and pickle the final model.', 'micro'),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000118', 'Boolean gates as perceptrons', 'Implement AND, OR, and NOT as single perceptrons by hand-picking weights and a bias for each, and verify every row of each gate''s truth table. Then implement the perceptron learning rule and use it to *learn* the OR gate''s weights from its 4 labeled examples instead of picking them yourself.', 'micro'),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000119', 'Activation function playground', 'Implement sigmoid, tanh, and ReLU, then run each over the same range of inputs (e.g. np.linspace(-10, 10, 21)) and print the outputs side by side. Note where each one saturates (stops changing much) and where ReLU stays perfectly linear.', 'micro'),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000120', 'Hand-computed forward pass', 'Pick small fixed weight matrices for a 2-input -> 3-hidden -> 1-output network. Compute the forward pass on paper (or a calculator) for one input, then verify your NumPy implementation produces the same numbers. Then run the same weights on a batch of 4 different inputs at once and confirm the shapes come out right.', 'micro'),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000121', 'Loss functions side by side', 'Implement mse, binary_cross_entropy, and categorical_cross_entropy. For a fixed true label, compute each loss for predictions that are ''very right'', ''unsure'', and ''very wrong'', and print the three loss values side by side to see how sharply cross-entropy punishes a confident wrong answer compared to MSE.', 'micro'),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000122', 'Derive it, then check it', 'For a single neuron z = w*x + b, a = sigmoid(z), L = (a - y) ** 2, derive dL/dw and dL/db by hand on paper. Implement both formulas in NumPy, then write a small finite-difference check that nudges w and b by a tiny epsilon and confirms your formulas match the numerically estimated gradient.', 'micro'),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000123', 'Train the XOR network yourself', 'Using the forward/backward/update pieces from this concept''s challenges, write your own end-to-end script that initializes a small network with a fixed seed, trains it on the 4 XOR examples for several thousand epochs, and prints the loss every 500 epochs so you can watch it fall. Confirm the final predictions are correct for all 4 input combinations.', 'micro'),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000124', 'Batch size, visualized', 'Using the XOR training loop from the previous concept, run training three ways: batch_size=1, batch_size=2, and batch_size=4 (full-batch), for the same number of epochs. Print the loss every few hundred epochs for each and compare how smoothly (or noisily) it falls.', 'micro'),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000125', 'Plan your next step', 'Write a short, honest note to yourself (in the journal, or just as a comment in a script) answering three questions: what''s the smallest real dataset you''d want to train a network on next, what framework you''d reach for (and why), and where you''d get GPU access to actually run it (Colab, Kaggle, or your own machine). No code required -- this is about having a concrete next step, not another toy exercise.', 'micro'),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000126', 'ML Scope Doc', 'Write a scope dict for a small ML idea of your own (problem_type, target_metric, success_threshold, data_sources, non_goals), then write a function that checks it against the required-keys checklist from this lesson.', 'micro'),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000127', 'Load-Clean-Featurize-Train-Evaluate', 'Write five small stand-in functions (load, clean, featurize, train, evaluate -- each can just transform a plain Python value, no real ML needed) and a run_pipeline() that chains them in order, printing each stage''s output as it runs.', 'micro'),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000128', 'Model Comparison Table', 'Given a small list of dicts, each representing one model iteration''s name and its metric score, write code that prints a ranked table (best to worst) and flags any iteration that regressed relative to the one before it.', 'micro'),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000129', 'Write a Model Card', 'Pick a model you trained earlier in the ML track (or a hypothetical one) and write its model card by hand -- purpose, data, metrics, and at least two specific limitations -- then run it through this concept''s validation function.', 'micro'),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000130', 'Deployment Readiness Checklist', 'Write a checklist dict (e.g. {''tests_pass'': True, ''model_saved'': True, ''config_valid'': True, ''version_pinned'': True}) for a model of your choosing, plus a function that reports which checks are failing -- this is the logic a real CI/CD gate would run before allowing a deploy.', 'micro');

-- Mini-projects (one per phase)

insert into projects (phase_id, title, description, project_type) values
  ('00000000-0000-0000-0000-000000000010', 'Numeric dataset explorer', 'Load a small numeric dataset into NumPy arrays, compute summary statistics and correlations, solve a small linear system as a least-squares line fit, and plot the raw data against the fitted line with matplotlib.', 'mini'),
  ('00000000-0000-0000-0000-000000000011', 'Customer Orders EDA', 'Given raw order data (as CSV text, with some missing prices and a separate customers table as JSON text), build one script that: reads both into DataFrames, cleans the orders table (drop rows missing customer_id, fill missing price with that product''s average price), merges orders with customers on customer_id, engineers a ''total'' column (price * quantity), and finishes with a groupby summary of total spend and order count per region, sorted highest spend first.', 'mini'),
  ('00000000-0000-0000-0000-000000000012', 'End-to-End Regression Pipeline', 'Using scikit-learn''s built-in diabetes dataset (sklearn.datasets.load_diabetes -- 442 patients, 10 numeric features, a continuous disease-progression target), build a complete regression pipeline: split the data into train/test sets with a fixed random_state, standardize the features, fit a plain LinearRegression as a baseline, then fit Ridge and Lasso at a few candidate alphas and pick the best one by test-set R^2. Report R^2, MAE, and RMSE for your final chosen model on the test set, and compare it against the plain linear regression baseline and against a simple mean-prediction baseline to confirm it''s actually learning something.', 'mini'),
  ('00000000-0000-0000-0000-000000000013', 'Classifier showdown: train, evaluate, compare', 'Using a small synthetic or built-in dataset (e.g. sklearn''s load_breast_cancer or a hand-generated set of labeled 2D blobs), build one end-to-end pipeline that: (1) splits the data into train/test with a fixed random_state, (2) scales features with StandardScaler fit only on the training data, (3) trains at least two classifiers (e.g. LogisticRegression and DecisionTreeClassifier) on the scaled training data, (4) evaluates each with cross-validation (cross_val_score, cv=5) as well as a held-out test-set confusion matrix, precision, recall, and F1, and (5) prints a short comparison report naming which model you''d deploy and why, citing the actual numbers.', 'mini'),
  ('00000000-0000-0000-0000-000000000014', 'Tuned and evaluated: a complete churn pipeline', 'Build one integrative pipeline on a small tabular (customer-churn-style) dataset: clean the raw data and engineer at least one new feature, split it with stratification, assemble a ColumnTransformer + Pipeline that preprocesses and models in one object, address the class imbalance in the target (class_weight or resampling), tune at least one hyperparameter with GridSearchCV, report precision, recall, F1, and ROC-AUC on a held-out test set the search never touched, and finally pickle the tuned pipeline to bytes and reload it to confirm it predicts identically -- one continuous workflow touching every concept in this phase.', 'mini'),
  ('00000000-0000-0000-0000-000000000015', 'A from-scratch classifier beyond XOR', 'Extend your 2-layer NumPy network to a slightly harder toy problem than XOR: a small synthetic 2D dataset with two classes arranged so a single straight line can''t separate them (e.g. four labeled clusters positioned like XOR''s corners, or two concentric groups of points). Generate the points with fixed, seeded randomness, train your network end to end (forward pass, loss, backprop, gradient descent, multiple epochs) exactly as you did for XOR, and evaluate the trained network''s accuracy on the same points it trained on. Confirm the network reaches high accuracy, and that the loss fell substantially over training -- the same two things you checked for XOR, just on a new dataset you built yourself.', 'mini'),
  ('00000000-0000-0000-0000-000000000016', 'Model Card & Deployment-Readiness Report', 'Assemble a one-page model card (purpose, data, metrics, limitations) for a model you trained earlier in the ML track, then write a deployment-readiness checklist function for it that reports which checks pass and which fail -- combining this phase''s model-card and deployment-logic concepts into one integrative writeup.', 'mini');

-- Challenges (auto-graded, tied to concept_id)

insert into challenges (phase_id, concept_id, order_index, title, difficulty, prompt, hint, starter_code, test_code) values
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000076', 1, 'Vector Addition', 'easy', 'Write vector_add(v1, v2) that returns the component-wise sum of two equal-length tuples/lists as a tuple.', 'Use zip(v1, v2) to pair up matching components, then add each pair.', $py$def vector_add(v1, v2):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'vector_add((1, 2), (3, 4))'
_actual = vector_add((1, 2), (3, 4))
_expected = (4, 6)
if tuple(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'vector_add((0, 0, 0), (5, -2, 7))'
_actual = vector_add((0, 0, 0), (5, -2, 7))
_expected = (5, -2, 7)
if tuple(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'vector_add([-1, -2], [1, 2])'
_actual = vector_add([-1, -2], [1, 2])
_expected = (0, 0)
if tuple(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000076', 2, 'Scalar Multiplication', 'easy', 'Write vector_scale(v, scalar) that returns v with every component multiplied by scalar, as a tuple.', 'A simple generator expression: x * scalar for each x in v.', $py$def vector_scale(v, scalar):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'vector_scale((1, 2, 3), 2)'
_actual = vector_scale((1, 2, 3), 2)
_expected = (2, 4, 6)
if tuple(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'vector_scale((4, -2), 0.5)'
_actual = tuple(round(x, 6) for x in vector_scale((4, -2), 0.5))
_expected = (2.0, -1.0)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'vector_scale((3, 3), 0)'
_actual = vector_scale((3, 3), 0)
_expected = (0, 0)
if tuple(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000076', 3, 'Dot Product', 'easy', 'Write dot_product(v1, v2) that returns the dot product of two equal-length vectors: the sum of the products of matching components.', 'sum(x * y for x, y in zip(v1, v2)).', $py$def dot_product(v1, v2):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'dot_product((1, 2, 3), (4, 5, 6))'
_actual = dot_product((1, 2, 3), (4, 5, 6))
_expected = 32
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'dot_product((1, 0), (0, 1))'
_actual = dot_product((1, 0), (0, 1))
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'dot_product((-2, 3), (4, 1))'
_actual = dot_product((-2, 3), (4, 1))
_expected = -5
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000076', 4, 'Vector Subtraction', 'easy', 'Write vector_subtract(v1, v2) that returns v1 minus v2, component-wise, as a tuple.', 'Same pattern as addition, but subtract instead of add: x - y for each pair.', $py$def vector_subtract(v1, v2):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'vector_subtract((5, 7), (2, 3))'
_actual = vector_subtract((5, 7), (2, 3))
_expected = (3, 4)
if tuple(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'vector_subtract((0, 0), (1, 1))'
_actual = vector_subtract((0, 0), (1, 1))
_expected = (-1, -1)
if tuple(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'vector_subtract((3, 3, 3), (1, 2, 3))'
_actual = vector_subtract((3, 3, 3), (1, 2, 3))
_expected = (2, 1, 0)
if tuple(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000076', 5, 'Vector Magnitude', 'medium', 'Write magnitude(v) that returns the length (Euclidean norm) of v: the square root of its dot product with itself.', 'import math, then math.sqrt(sum(x * x for x in v)).', $py$import math

def magnitude(v):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'magnitude((3, 4))'
_actual = magnitude((3, 4))
_expected = 5.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'magnitude((0, 0, 0))'
_actual = magnitude((0, 0, 0))
_expected = 0.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'magnitude((1, 2, 2))'
_actual = magnitude((1, 2, 2))
_expected = 3.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000076', 6, 'Unit Vector', 'medium', 'Write unit_vector(v) that returns v scaled to length 1 (a tuple of floats), pointing in the same direction as v.', 'Compute the magnitude first, then divide each component by it.', $py$import math

def unit_vector(v):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'unit_vector((3, 4))'
_actual = tuple(round(x, 6) for x in unit_vector((3, 4)))
_expected = (0.6, 0.8)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'unit_vector((5, 0))'
_actual = tuple(round(x, 6) for x in unit_vector((5, 0)))
_expected = (1.0, 0.0)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
import math as _math
_call_desc = 'magnitude of unit_vector((1, 1, 1)) == 1'
_uv = unit_vector((1, 1, 1))
_actual = _math.sqrt(sum(x * x for x in _uv))
_expected = 1.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000076', 7, 'Orthogonality Check', 'medium', 'Write is_orthogonal(v1, v2) that returns True if v1 and v2 are perpendicular (their dot product is 0), False otherwise.', 'Two vectors are orthogonal exactly when their dot product equals 0.', $py$def is_orthogonal(v1, v2):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'is_orthogonal((1, 0), (0, 1))'
_actual = is_orthogonal((1, 0), (0, 1))
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_orthogonal((1, 1), (1, 0))'
_actual = is_orthogonal((1, 1), (1, 0))
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_orthogonal((2, -1, 3), (1, 2, 0))'
_actual = is_orthogonal((2, -1, 3), (1, 2, 0))
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000076', 8, 'Angle Between Vectors', 'hard', 'Write angle_between(v1, v2) that returns the angle between v1 and v2 in degrees, using the formula cos(theta) = dot(v1, v2) / (|v1| * |v2|).', 'Compute the dot product and both magnitudes, take math.acos of their ratio, then convert radians to degrees with math.degrees.', $py$import math

def angle_between(v1, v2):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'angle_between((1, 0), (0, 1))'
_actual = angle_between((1, 0), (0, 1))
_expected = 90.0
if abs(_actual - _expected) < 1e-4:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'angle_between((1, 0), (1, 0))'
_actual = angle_between((1, 0), (1, 0))
_expected = 0.0
if abs(_actual - _expected) < 1e-4:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'angle_between((1, 0), (-1, 0))'
_actual = angle_between((1, 0), (-1, 0))
_expected = 180.0
if abs(_actual - _expected) < 1e-4:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000076', 9, 'Vector Projection', 'hard', 'Write project_onto(v, onto) that returns the projection of vector v onto vector onto, as a tuple of floats: the component of v that points in onto''s direction.', 'The formula is (dot(v, onto) / dot(onto, onto)) * onto -- a scalar multiple of onto.', $py$def project_onto(v, onto):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'project_onto((3, 4), (1, 0))'
_actual = tuple(round(x, 6) for x in project_onto((3, 4), (1, 0)))
_expected = (3.0, 0.0)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'project_onto((2, 2), (1, 0))'
_actual = tuple(round(x, 6) for x in project_onto((2, 2), (1, 0)))
_expected = (2.0, 0.0)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'project_onto((1, 1), (1, 1))'
_actual = tuple(round(x, 6) for x in project_onto((1, 1), (1, 1)))
_expected = (1.0, 1.0)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000077', 1, 'Matrix Addition', 'easy', 'Write matrix_add(a, b) that returns the element-wise sum of two same-shape matrices (lists of lists) as a list of lists.', 'Zip the rows together, then zip each pair of rows together and add.', $py$def matrix_add(a, b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'matrix_add([[1,2],[3,4]], [[5,6],[7,8]])'
_actual = matrix_add([[1, 2], [3, 4]], [[5, 6], [7, 8]])
_expected = [[6, 8], [10, 12]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'matrix_add([[0,0]], [[1,1]])'
_actual = matrix_add([[0, 0]], [[1, 1]])
_expected = [[1, 1]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'matrix_add([[1]], [[-1]])'
_actual = matrix_add([[1]], [[-1]])
_expected = [[0]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000077', 2, 'Scalar Matrix Multiplication', 'easy', 'Write matrix_scale(m, scalar) that returns m with every entry multiplied by scalar.', 'Nest a list comprehension: multiply every entry of every row.', $py$def matrix_scale(m, scalar):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'matrix_scale([[1,2],[3,4]], 2)'
_actual = matrix_scale([[1, 2], [3, 4]], 2)
_expected = [[2, 4], [6, 8]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'matrix_scale([[5]], 0)'
_actual = matrix_scale([[5]], 0)
_expected = [[0]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'matrix_scale([[1,-1],[2,-2]], -1)'
_actual = matrix_scale([[1, -1], [2, -2]], -1)
_expected = [[-1, 1], [-2, 2]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000077', 3, 'Identity Matrix', 'easy', 'Write identity_matrix(n) that returns the n x n identity matrix as a list of lists: 1s on the diagonal, 0s everywhere else.', 'Build each row with a list comprehension: entry is 1 if the row index equals the column index, else 0.', $py$def identity_matrix(n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'identity_matrix(1)'
_actual = identity_matrix(1)
_expected = [[1]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'identity_matrix(2)'
_actual = identity_matrix(2)
_expected = [[1, 0], [0, 1]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'identity_matrix(3)'
_actual = identity_matrix(3)
_expected = [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000077', 4, 'Is Square?', 'easy', 'Write is_square(m) that returns True if matrix m has the same number of rows as columns, False otherwise.', 'Compare len(m) (row count) to len(m[0]) (column count of the first row).', $py$def is_square(m):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'is_square([[1,2],[3,4]])'
_actual = is_square([[1, 2], [3, 4]])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_square([[1,2,3],[4,5,6]])'
_actual = is_square([[1, 2, 3], [4, 5, 6]])
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_square([[5]])'
_actual = is_square([[5]])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000077', 5, 'Trace of a Matrix', 'easy', 'Write trace(m) that returns the sum of the diagonal entries of a square matrix m.', 'The diagonal entries are m[i][i] for each row index i.', $py$def trace(m):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'trace([[1,2],[3,4]])'
_actual = trace([[1, 2], [3, 4]])
_expected = 5
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'trace([[1,0,0],[0,2,0],[0,0,3]])'
_actual = trace([[1, 0, 0], [0, 2, 0], [0, 0, 3]])
_expected = 6
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'trace([[7]])'
_actual = trace([[7]])
_expected = 7
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000077', 6, 'Matrix Transpose', 'medium', 'Write transpose(m) that returns the transpose of matrix m (rows become columns) as a list of lists.', 'zip(*m) groups entries by column position; wrap each resulting tuple in list(...).', $py$def transpose(m):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'transpose([[1,2,3],[4,5,6]])'
_actual = transpose([[1, 2, 3], [4, 5, 6]])
_expected = [[1, 4], [2, 5], [3, 6]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'transpose([[1]])'
_actual = transpose([[1]])
_expected = [[1]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'transpose([[1,2],[3,4],[5,6]])'
_actual = transpose([[1, 2], [3, 4], [5, 6]])
_expected = [[1, 3, 5], [2, 4, 6]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000077', 7, 'Matrix-Vector Multiplication', 'medium', 'Write matrix_vector_multiply(m, v) that returns the product of matrix m (list of lists) and vector v (list/tuple) as a list -- each entry is the dot product of a row of m with v.', 'For each row in m, sum the products of that row''s entries with v''s matching entries.', $py$def matrix_vector_multiply(m, v):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'matrix_vector_multiply([[1,2],[3,4]], [1,1])'
_actual = matrix_vector_multiply([[1, 2], [3, 4]], [1, 1])
_expected = [3, 7]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'matrix_vector_multiply([[2,0],[0,2]], [3,4]) (scale by 2)'
_actual = matrix_vector_multiply([[2, 0], [0, 2]], [3, 4])
_expected = [6, 8]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'matrix_vector_multiply([[1,0,0]], [5,6,7])'
_actual = matrix_vector_multiply([[1, 0, 0]], [5, 6, 7])
_expected = [5]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000077', 8, 'Matrices Approximately Equal', 'medium', 'Write matrices_equal(a, b, tol=1e-6) that returns True if every corresponding entry of matrices a and b differs by less than tol, False otherwise.', 'Never compare floats with ==. Loop through matching rows and entries, checking abs(x - y) < tol for each pair.', $py$def matrices_equal(a, b, tol=1e-6):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'matrices_equal([[1.0,2.0]], [[1.0000001,2.0000001]])'
_actual = matrices_equal([[1.0, 2.0]], [[1.0000001, 2.0000001]])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'matrices_equal([[1,2],[3,4]], [[1,2],[3,5]])'
_actual = matrices_equal([[1, 2], [3, 4]], [[1, 2], [3, 5]])
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'matrices_equal([[0.1+0.2]], [[0.3]])'
_actual = matrices_equal([[0.1 + 0.2]], [[0.3]])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000077', 9, 'Matrix Multiplication', 'hard', 'Write matrix_multiply(a, b) that returns the matrix product of a and b: each result entry [i][j] is the dot product of row i of a with column j of b. Assume a''s column count matches b''s row count.', 'First transpose b to get its columns as rows, then for each row of a and each ''column'' (row of transposed b), take their dot product.', $py$def matrix_multiply(a, b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'matrix_multiply([[1,2],[3,4]], [[5,6],[7,8]])'
_actual = matrix_multiply([[1, 2], [3, 4]], [[5, 6], [7, 8]])
_expected = [[19, 22], [43, 50]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'matrix_multiply([[1,0],[0,1]], [[9,8],[7,6]]) (identity)'
_actual = matrix_multiply([[1, 0], [0, 1]], [[9, 8], [7, 6]])
_expected = [[9, 8], [7, 6]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'matrix_multiply([[1,2,3]], [[1],[1],[1]])'
_actual = matrix_multiply([[1, 2, 3]], [[1], [1], [1]])
_expected = [[6]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000078', 1, 'Build an Array', 'easy', 'Write make_array(values) that returns values converted into a NumPy array.', 'np.array(values) does the conversion directly.', $py$import numpy as np

def make_array(values):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'make_array([1, 2, 3])'
_actual = make_array([1, 2, 3])
_expected = [1, 2, 3]
if isinstance(_actual, np.ndarray) and _actual.tolist() == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'make_array([])'
_actual = make_array([])
_expected = []
if isinstance(_actual, np.ndarray) and _actual.tolist() == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'make_array([5.5, 2.2])'
_actual = make_array([5.5, 2.2])
_expected = [5.5, 2.2]
if isinstance(_actual, np.ndarray) and _actual.tolist() == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000078', 2, 'Array Shape', 'easy', 'Write array_shape(arr) that returns arr''s shape as a plain tuple.', 'arr.shape is already a tuple.', $py$import numpy as np

def array_shape(arr):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'array_shape(np.array([1,2,3,4]))'
_actual = array_shape(np.array([1, 2, 3, 4]))
_expected = (4,)
if tuple(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'array_shape(np.array([[1,2,3],[4,5,6]]))'
_actual = array_shape(np.array([[1, 2, 3], [4, 5, 6]]))
_expected = (2, 3)
if tuple(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'array_shape(np.array([[1],[2],[3]]))'
_actual = array_shape(np.array([[1], [2], [3]]))
_expected = (3, 1)
if tuple(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000078', 3, 'Get a Row', 'easy', 'Write get_row(arr2d, i) that returns row i of a 2D NumPy array as a NumPy array.', 'arr2d[i] gives the whole row directly.', $py$import numpy as np

def get_row(arr2d, i):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_m = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
_call_desc = 'get_row(m, 0)'
_actual = get_row(_m, 0)
_expected = [1, 2, 3]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'get_row(m, 2)'
_actual = get_row(_m, 2)
_expected = [7, 8, 9]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'get_row(m, 1)'
_actual = get_row(_m, 1)
_expected = [4, 5, 6]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000078', 4, 'Get a Column', 'easy', 'Write get_column(arr2d, j) that returns column j of a 2D NumPy array as a NumPy array.', 'arr2d[:, j] selects every row, just column j.', $py$import numpy as np

def get_column(arr2d, j):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_m = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
_call_desc = 'get_column(m, 0)'
_actual = get_column(_m, 0)
_expected = [1, 4, 7]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'get_column(m, 2)'
_actual = get_column(_m, 2)
_expected = [3, 6, 9]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'get_column(m, 1)'
_actual = get_column(_m, 1)
_expected = [2, 5, 8]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000078', 5, 'Slice the Middle', 'easy', 'Write slice_middle(arr) that returns every element of arr except the first and last, as a NumPy array.', 'arr[1:-1] slices from index 1 up to (not including) the last element.', $py$import numpy as np

def slice_middle(arr):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'slice_middle(np.array([1,2,3,4,5]))'
_actual = slice_middle(np.array([1, 2, 3, 4, 5]))
_expected = [2, 3, 4]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'slice_middle(np.array([10,20]))'
_actual = slice_middle(np.array([10, 20]))
_expected = []
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'slice_middle(np.array([1,2,3]))'
_actual = slice_middle(np.array([1, 2, 3]))
_expected = [2]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000078', 6, 'Flatten a 2D Array', 'easy', 'Write flatten_2d(arr2d) that returns a 2D NumPy array collapsed into a single 1D NumPy array, row by row.', 'arr2d.flatten() does this directly.', $py$import numpy as np

def flatten_2d(arr2d):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'flatten_2d(np.array([[1,2],[3,4]]))'
_actual = flatten_2d(np.array([[1, 2], [3, 4]]))
_expected = [1, 2, 3, 4]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'flatten_2d(np.array([[1,2,3]]))'
_actual = flatten_2d(np.array([[1, 2, 3]]))
_expected = [1, 2, 3]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'flatten_2d(np.array([[1],[2],[3]]))'
_actual = flatten_2d(np.array([[1], [2], [3]]))
_expected = [1, 2, 3]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000078', 7, 'Boolean Mask Filter', 'medium', 'Write above_threshold(arr, threshold) that returns only the elements of arr strictly greater than threshold, as a NumPy array.', 'A boolean mask like arr > threshold, used directly as an index (arr[mask]), filters the array.', $py$import numpy as np

def above_threshold(arr, threshold):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'above_threshold(np.array([1,5,3,8,2]), 3)'
_actual = above_threshold(np.array([1, 5, 3, 8, 2]), 3)
_expected = [5, 8]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'above_threshold(np.array([1,2,3]), 10)'
_actual = above_threshold(np.array([1, 2, 3]), 10)
_expected = []
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'above_threshold(np.array([-1,0,1,2]), 0)'
_actual = above_threshold(np.array([-1, 0, 1, 2]), 0)
_expected = [1, 2]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000078', 8, 'Reshape an Array', 'medium', 'Write reshape_array(arr, rows, cols) that returns arr reshaped into a (rows, cols) 2D NumPy array, keeping elements in their original order.', 'arr.reshape(rows, cols) rearranges the same data into the new shape.', $py$import numpy as np

def reshape_array(arr, rows, cols):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'reshape_array(np.arange(6), 2, 3)'
_actual = reshape_array(np.arange(6), 2, 3)
_expected = [[0, 1, 2], [3, 4, 5]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'reshape_array(np.arange(6), 3, 2)'
_actual = reshape_array(np.arange(6), 3, 2)
_expected = [[0, 1], [2, 3], [4, 5]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'reshape_array(np.array([1,2,3,4]), 4, 1)'
_actual = reshape_array(np.array([1, 2, 3, 4]), 4, 1)
_expected = [[1], [2], [3], [4]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000078', 9, 'Fancy Indexing', 'medium', 'Write pick_indices(arr, indices) that returns the elements of arr at the given list of indices, in that order, as a NumPy array.', 'Pass the list of indices directly as the index: arr[indices].', $py$import numpy as np

def pick_indices(arr, indices):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'pick_indices(np.array([10,20,30,40]), [0,2])'
_actual = pick_indices(np.array([10, 20, 30, 40]), [0, 2])
_expected = [10, 30]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'pick_indices(np.array([1,2,3]), [2,1,0])'
_actual = pick_indices(np.array([1, 2, 3]), [2, 1, 0])
_expected = [3, 2, 1]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'pick_indices(np.array([5,6,7,8]), [1,1,3])'
_actual = pick_indices(np.array([5, 6, 7, 8]), [1, 1, 3])
_expected = [6, 6, 8]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000078', 10, 'Replace Where Condition', 'hard', 'Write replace_where(arr, threshold, new_value) that returns a new NumPy array equal to arr but with every element greater than threshold replaced by new_value, leaving the rest of arr unchanged (and arr itself unmodified).', 'np.where(condition, value_if_true, value_if_false) builds a new array element-by-element without a Python loop.', $py$import numpy as np

def replace_where(arr, threshold, new_value):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 4
_original = np.array([1, 5, 3, 8, 2])
_call_desc = 'replace_where([1,5,3,8,2], 4, 0)'
_actual = replace_where(_original, 4, 0)
_expected = [1, 0, 3, 0, 2]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'original array is unmodified after replace_where'
if list(_original) == [1, 5, 3, 8, 2]:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- original was {list(_original)!r}")
_call_desc = 'replace_where([10,20,30], 100, -1) (nothing above threshold)'
_actual = replace_where(np.array([10, 20, 30]), 100, -1)
_expected = [10, 20, 30]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'replace_where([1,2,3], 0, 99) (everything above threshold)'
_actual = replace_where(np.array([1, 2, 3]), 0, 99)
_expected = [99, 99, 99]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000079', 1, 'Add a Scalar', 'easy', 'Write add_scalar(arr, scalar) that returns arr with scalar added to every element, as a NumPy array.', 'arr + scalar broadcasts the scalar across every element automatically.', $py$import numpy as np

def add_scalar(arr, scalar):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'add_scalar(np.array([1,2,3]), 10)'
_actual = add_scalar(np.array([1, 2, 3]), 10)
_expected = [11, 12, 13]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'add_scalar(np.array([0,0,0]), -5)'
_actual = add_scalar(np.array([0, 0, 0]), -5)
_expected = [-5, -5, -5]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'add_scalar(np.array([[1,2],[3,4]]), 1)'
_actual = add_scalar(np.array([[1, 2], [3, 4]]), 1)
_expected = [[2, 3], [4, 5]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000079', 2, 'Elementwise Multiply', 'easy', 'Write elementwise_multiply(a, b) that returns the elementwise product of two same-shape arrays a and b.', 'Just use a * b -- NumPy''s * operator is elementwise, not matrix multiplication.', $py$import numpy as np

def elementwise_multiply(a, b):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'elementwise_multiply(np.array([1,2,3]), np.array([4,5,6]))'
_actual = elementwise_multiply(np.array([1, 2, 3]), np.array([4, 5, 6]))
_expected = [4, 10, 18]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'elementwise_multiply(np.array([0,1,2]), np.array([9,9,9]))'
_actual = elementwise_multiply(np.array([0, 1, 2]), np.array([9, 9, 9]))
_expected = [0, 9, 18]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'elementwise_multiply(np.array([[1,2]]), np.array([[3,4]]))'
_actual = elementwise_multiply(np.array([[1, 2]]), np.array([[3, 4]]))
_expected = [[3, 8]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000079', 3, 'Vectorized Square', 'easy', 'Write vectorized_square(arr) that returns every element of arr squared, without writing a Python loop.', 'arr ** 2 (or arr * arr) squares every element at once.', $py$import numpy as np

def vectorized_square(arr):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'vectorized_square(np.array([1,2,3,4]))'
_actual = vectorized_square(np.array([1, 2, 3, 4]))
_expected = [1, 4, 9, 16]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'vectorized_square(np.array([-2,0,2]))'
_actual = vectorized_square(np.array([-2, 0, 2]))
_expected = [4, 0, 4]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'vectorized_square(np.array([5]))'
_actual = vectorized_square(np.array([5]))
_expected = [25]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000079', 4, 'Add a Row to Every Row', 'easy', 'Write add_row_to_matrix(matrix, row) that returns matrix (2D array) with row (1D array, same width) added to every row of matrix, via broadcasting.', 'matrix + row broadcasts row across every row of matrix automatically -- no loop needed.', $py$import numpy as np

def add_row_to_matrix(matrix, row):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'add_row_to_matrix([[1,2],[3,4]], [10,20])'
_actual = add_row_to_matrix(np.array([[1, 2], [3, 4]]), np.array([10, 20]))
_expected = [[11, 22], [13, 24]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'add_row_to_matrix([[0,0,0]], [1,2,3])'
_actual = add_row_to_matrix(np.array([[0, 0, 0]]), np.array([1, 2, 3]))
_expected = [[1, 2, 3]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'add_row_to_matrix([[1,1],[2,2],[3,3]], [-1,1])'
_actual = add_row_to_matrix(np.array([[1, 1], [2, 2], [3, 3]]), np.array([-1, 1]))
_expected = [[0, 2], [1, 3], [2, 4]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000079', 5, 'Clip Values', 'medium', 'Write clip_values(arr, low, high) that returns arr with every value below low raised to low, and every value above high lowered to high (values in between are unchanged).', 'np.clip(arr, low, high) does exactly this in one call.', $py$import numpy as np

def clip_values(arr, low, high):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'clip_values(np.array([-5,0,5,10,15]), 0, 10)'
_actual = clip_values(np.array([-5, 0, 5, 10, 15]), 0, 10)
_expected = [0, 0, 5, 10, 10]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'clip_values(np.array([1,2,3]), 1, 3)'
_actual = clip_values(np.array([1, 2, 3]), 1, 3)
_expected = [1, 2, 3]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'clip_values(np.array([100,-100]), -1, 1)'
_actual = clip_values(np.array([100, -100]), -1, 1)
_expected = [1, -1]
if list(_actual) == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000079', 6, 'Normalize an Array', 'medium', 'Write normalize_array(arr) that returns arr transformed to have mean 0 and standard deviation 1: subtract the mean, then divide by the standard deviation.', 'Compute mean = arr.mean() and std = arr.std(), then return (arr - mean) / std -- both operations broadcast the scalar across the array.', $py$import numpy as np

def normalize_array(arr):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'normalize_array(np.array([2,4,4,4,5,5,7,9])).mean() ~= 0'
_arr = np.array([2, 4, 4, 4, 5, 5, 7, 9], dtype=float)
_result = normalize_array(_arr)
_actual = round(float(_result.mean()), 6)
_expected = 0.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'normalize_array(...).std() ~= 1'
_actual = round(float(_result.std()), 6)
_expected = 1.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'normalize_array(np.array([5.0,5.0,5.0])) handles first element correctly relative to constant array'
_result2 = normalize_array(np.array([10.0, 20.0, 30.0]))
_actual = [round(float(x), 6) for x in _result2]
_expected = [round((10.0 - 20.0) / np.array([10.0, 20.0, 30.0]).std(), 6),
             0.0,
             round((30.0 - 20.0) / np.array([10.0, 20.0, 30.0]).std(), 6)]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000079', 7, 'Broadcastable Shapes', 'medium', 'Write is_broadcastable(shape1, shape2) that returns True if two array shapes (tuples of ints) would broadcast together under NumPy''s rules, False otherwise. Compare dimensions from the rightmost pair; each pair of aligned dimensions must be equal, or one of them must be 1 (a missing dimension on the shorter shape counts as 1).', 'Reverse both shapes, then walk pairs with zip -- but zip stops at the shorter one, so pad manually or iterate over range(max(len(shape1), len(shape2))) and treat a missing dimension as 1.', $py$def is_broadcastable(shape1, shape2):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 4
_call_desc = 'is_broadcastable((2,3), (3,))'
_actual = is_broadcastable((2, 3), (3,))
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_broadcastable((3,), (4,))'
_actual = is_broadcastable((3,), (4,))
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_broadcastable((5,1), (1,4))'
_actual = is_broadcastable((5, 1), (1, 4))
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_broadcastable((2,3), (2,4))'
_actual = is_broadcastable((2, 3), (2, 4))
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000079', 8, 'Standardize Each Column', 'hard', 'Write standardize_columns(matrix) that returns a 2D array where every column has been independently transformed to mean 0, standard deviation 1 (subtract that column''s mean, divide by that column''s standard deviation).', 'Use axis=0 with matrix.mean(axis=0) and matrix.std(axis=0) to get per-column stats as a 1D array, then let broadcasting apply them across every row.', $py$import numpy as np

def standardize_columns(matrix):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_m = np.array([[1.0, 100.0], [2.0, 200.0], [3.0, 300.0]])
_result = standardize_columns(_m)
_call_desc = 'standardize_columns(...).mean(axis=0) ~= [0, 0]'
_actual = [round(float(x), 6) for x in _result.mean(axis=0)]
_expected = [0.0, 0.0]
if all(abs(a - e) < 1e-6 for a, e in zip(_actual, _expected)):
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'standardize_columns(...).std(axis=0) ~= [1, 1]'
_actual = [round(float(x), 6) for x in _result.std(axis=0)]
_expected = [1.0, 1.0]
if all(abs(a - e) < 1e-6 for a, e in zip(_actual, _expected)):
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'standardize_columns shape matches input shape'
_actual = tuple(_result.shape)
_expected = (3, 2)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000079', 9, 'Pairwise Sum Grid', 'hard', 'Write outer_sum(a, b) that returns a 2D array where entry [i, j] is a[i] + b[j], using broadcasting only (no explicit Python loop over elements).', 'Reshape a to a column with a[:, None] (shape (n, 1)) and let it broadcast against b (shape (m,)) to produce an (n, m) result.', $py$import numpy as np

def outer_sum(a, b):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'outer_sum(np.array([1,2]), np.array([10,20,30]))'
_actual = outer_sum(np.array([1, 2]), np.array([10, 20, 30]))
_expected = [[11, 21, 31], [12, 22, 32]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'outer_sum(np.array([0]), np.array([1,2,3]))'
_actual = outer_sum(np.array([0]), np.array([1, 2, 3]))
_expected = [[1, 2, 3]]
if [list(r) for r in _actual] == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'outer_sum shape is (len(a), len(b))'
_actual = tuple(outer_sum(np.array([1, 2, 3]), np.array([4, 5])).shape)
_expected = (3, 2)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000080', 1, 'Mean of a Dataset', 'easy', 'Write mean_value(data) that returns the average of a list or array of numbers.', 'np.mean(data) (or sum(data) / len(data)) computes the average.', $py$import numpy as np

def mean_value(data):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'mean_value([1, 2, 3, 4, 5])'
_actual = mean_value([1, 2, 3, 4, 5])
_expected = 3.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'mean_value([10, 20])'
_actual = mean_value([10, 20])
_expected = 15.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'mean_value([5])'
_actual = mean_value([5])
_expected = 5.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000080', 2, 'Range of a Dataset', 'easy', 'Write range_value(data) that returns the difference between the maximum and minimum values in data.', 'max(data) - min(data), or use np.max/np.min.', $py$def range_value(data):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'range_value([1, 5, 3, 9, 2])'
_actual = range_value([1, 5, 3, 9, 2])
_expected = 8
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'range_value([4, 4, 4])'
_actual = range_value([4, 4, 4])
_expected = 0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'range_value([-5, 0, 5])'
_actual = range_value([-5, 0, 5])
_expected = 10
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000080', 3, 'Median of a Dataset', 'easy', 'Write median_value(data) that returns the median (middle value when sorted; average of the two middle values if data has an even length).', 'np.median(data) handles both the odd- and even-length cases for you.', $py$import numpy as np

def median_value(data):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'median_value([1, 3, 2])'
_actual = median_value([1, 3, 2])
_expected = 2.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'median_value([1, 2, 3, 4])'
_actual = median_value([1, 2, 3, 4])
_expected = 2.5
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'median_value([10])'
_actual = median_value([10])
_expected = 10.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000080', 4, 'Population Variance', 'medium', 'Write variance_value(data) that returns the population variance of data: the average of the squared differences from the mean.', 'np.var(data) defaults to the population formula (divide by n) -- exactly what''s needed here.', $py$import numpy as np

def variance_value(data):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'variance_value([2, 4, 4, 4, 5, 5, 7, 9])'
_actual = variance_value([2, 4, 4, 4, 5, 5, 7, 9])
_expected = 4.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'variance_value([5, 5, 5, 5])'
_actual = variance_value([5, 5, 5, 5])
_expected = 0.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'variance_value([1, 2, 3])'
_actual = variance_value([1, 2, 3])
_expected = 2.0 / 3.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000080', 5, 'Sample Standard Deviation', 'medium', 'Write sample_std(data) that returns the *sample* standard deviation of data (dividing by n-1, not n).', 'np.std(data, ddof=1) uses the sample formula instead of the population default.', $py$import numpy as np

def sample_std(data):
    # TODO
    pass
$py$, $py$import math
_passed = 0
_total = 3
_call_desc = 'sample_std([2, 4, 4, 4, 5, 5, 7, 9])'
_actual = sample_std([2, 4, 4, 4, 5, 5, 7, 9])
_expected = math.sqrt(32 / 7)
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'sample_std([1, 2, 3, 4, 5])'
_actual = sample_std([1, 2, 3, 4, 5])
_expected = math.sqrt(2.5)
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'sample_std([10, 10])'
_actual = sample_std([10, 10])
_expected = 0.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000080', 6, 'Z-Scores', 'medium', 'Write z_scores(data) that returns a NumPy array of each value''s z-score: (value - mean) / population_std.', 'Compute mean and population std once, then use broadcasting: (arr - mean) / std.', $py$import numpy as np

def z_scores(data):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'z_scores([2,4,4,4,5,5,7,9]) has mean ~0'
_result = z_scores([2, 4, 4, 4, 5, 5, 7, 9])
_actual = round(float(np.mean(_result)), 6)
_expected = 0.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'z_scores([10, 20, 30])[1] ~= 0 (middle value)'
_result2 = z_scores([10, 20, 30])
_actual = round(float(_result2[1]), 6)
_expected = 0.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'z_scores([5,5,5,5,5]) all zero when no spread -> handled without crash'
try:
    _result3 = z_scores([1, 1, 1])
    _ok = True
except Exception:
    _ok = False
if _ok:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} raised an exception")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000080', 7, 'Most Frequent Value', 'medium', 'Write mode_value(data) that returns the most frequently occurring value in data. Assume there''s a single unique most-common value.', 'collections.Counter(data).most_common(1)[0][0] gives the most common element directly.', $py$from collections import Counter

def mode_value(data):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'mode_value([1, 2, 2, 3])'
_actual = mode_value([1, 2, 2, 3])
_expected = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'mode_value([5, 5, 5, 1, 1])'
_actual = mode_value([5, 5, 5, 1, 1])
_expected = 5
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'mode_value([7])'
_actual = mode_value([7])
_expected = 7
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000080', 8, 'Correlation Coefficient', 'hard', 'Write correlation(x, y) that returns the Pearson correlation coefficient between equal-length arrays x and y, a value between -1 and 1.', 'np.corrcoef(x, y) returns a 2x2 matrix; the correlation you want is the off-diagonal entry at [0, 1].', $py$import numpy as np

def correlation(x, y):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'correlation([1,2,3,4,5], [2,4,6,8,10]) (perfect positive)'
_actual = correlation([1, 2, 3, 4, 5], [2, 4, 6, 8, 10])
_expected = 1.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'correlation([1,2,3,4,5], [10,8,6,4,2]) (perfect negative)'
_actual = correlation([1, 2, 3, 4, 5], [10, 8, 6, 4, 2])
_expected = -1.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'correlation is symmetric: correlation(x,y) == correlation(y,x)'
_x = [3, 1, 4, 1, 5, 9, 2, 6]
_y = [2, 7, 1, 8, 2, 8, 1, 8]
_a = correlation(_x, _y)
_b = correlation(_y, _x)
if abs(_a - _b) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_a!r} vs {_b!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000080', 9, 'Summary Statistics Dict', 'hard', 'Write summary_stats(data) that returns a dict with keys ''mean'', ''median'', ''std'' (population standard deviation), ''min'', and ''max'' describing data.', 'Build the dict from np.mean, np.median, np.std, min, and max, converting NumPy scalars to plain floats.', $py$import numpy as np

def summary_stats(data):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'summary_stats([1,2,3,4,5]) has all 5 keys'
_result = summary_stats([1, 2, 3, 4, 5])
_expected_keys = {"mean", "median", "std", "min", "max"}
if set(_result.keys()) == _expected_keys:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got keys {set(_result.keys())!r}")
_call_desc = "summary_stats([1,2,3,4,5])['mean'] ~= 3.0"
_actual = round(_result["mean"], 6)
_expected = 3.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "summary_stats([1,2,3,4,5])['min'] == 1.0 and ['max'] == 5.0"
if abs(_result["min"] - 1.0) < 1e-6 and abs(_result["max"] - 5.0) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got min={_result['min']!r}, max={_result['max']!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000081', 1, 'Basic Probability', 'easy', 'Write probability_of_event(favorable, total) that returns favorable / total as a float.', 'Plain division: favorable / total.', $py$def probability_of_event(favorable, total):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'probability_of_event(1, 6)'
_actual = probability_of_event(1, 6)
_expected = 1 / 6
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'probability_of_event(13, 52)'
_actual = probability_of_event(13, 52)
_expected = 0.25
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'probability_of_event(0, 10)'
_actual = probability_of_event(0, 10)
_expected = 0.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000081', 2, 'Complement Probability', 'easy', 'Write complement_probability(p) that returns the probability of an event NOT happening, given P(event) = p.', 'The complement rule: 1 - p.', $py$def complement_probability(p):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'complement_probability(0.3)'
_actual = complement_probability(0.3)
_expected = 0.7
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'complement_probability(1.0)'
_actual = complement_probability(1.0)
_expected = 0.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'complement_probability(0.0)'
_actual = complement_probability(0.0)
_expected = 1.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000081', 3, 'Independent AND', 'easy', 'Write independent_and(p1, p2) that returns the probability of two INDEPENDENT events both happening.', 'For independent events, P(A and B) = P(A) * P(B).', $py$def independent_and(p1, p2):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'independent_and(0.5, 0.5)'
_actual = independent_and(0.5, 0.5)
_expected = 0.25
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'independent_and(1.0, 0.4)'
_actual = independent_and(1.0, 0.4)
_expected = 0.4
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'independent_and(0.2, 0.0)'
_actual = independent_and(0.2, 0.0)
_expected = 0.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000081', 4, 'Union Probability', 'medium', 'Write union_probability(p_a, p_b, p_and) that returns P(A or B), given P(A), P(B), and P(A and B) (their overlap).', 'Inclusion-exclusion: P(A or B) = P(A) + P(B) - P(A and B).', $py$def union_probability(p_a, p_b, p_and):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'union_probability(0.5, 0.5, 0.25) (independent coin-like)'
_actual = union_probability(0.5, 0.5, 0.25)
_expected = 0.75
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'union_probability(0.3, 0.3, 0.0) (mutually exclusive)'
_actual = union_probability(0.3, 0.3, 0.0)
_expected = 0.6
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'union_probability(1.0, 1.0, 1.0) (both always happen)'
_actual = union_probability(1.0, 1.0, 1.0)
_expected = 1.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000081', 5, 'Conditional Probability', 'medium', 'Write conditional_probability(p_and, p_b) that returns P(A | B), the probability of A given that B has happened.', 'The definition of conditional probability: P(A | B) = P(A and B) / P(B).', $py$def conditional_probability(p_and, p_b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'conditional_probability(0.2, 0.5)'
_actual = conditional_probability(0.2, 0.5)
_expected = 0.4
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'conditional_probability(0.25, 1.0)'
_actual = conditional_probability(0.25, 1.0)
_expected = 0.25
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'conditional_probability(0.1, 0.2)'
_actual = conditional_probability(0.1, 0.2)
_expected = 0.5
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000081', 6, 'Expected Value', 'medium', 'Write expected_value(values, probabilities) that returns the expected value of a discrete random variable: the sum of each value times its probability.', 'sum(v * p for v, p in zip(values, probabilities)).', $py$def expected_value(values, probabilities):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'expected_value([1,2,3,4,5,6], [1/6]*6) (fair die)'
_actual = expected_value([1, 2, 3, 4, 5, 6], [1 / 6] * 6)
_expected = 3.5
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'expected_value([0, 100], [0.9, 0.1]) (lottery-like)'
_actual = expected_value([0, 100], [0.9, 0.1])
_expected = 10.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'expected_value([5], [1.0])'
_actual = expected_value([5], [1.0])
_expected = 5.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000081', 7, 'Binomial Probability', 'medium', 'Write binomial_probability(n, k, p) that returns the probability of exactly k successes in n independent trials, each with success probability p, using the binomial formula: C(n, k) * p**k * (1-p)**(n-k).', 'math.comb(n, k) computes the binomial coefficient (n choose k); combine it with p**k * (1-p)**(n-k).', $py$import math

def binomial_probability(n, k, p):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'binomial_probability(10, 5, 0.5)'
_actual = binomial_probability(10, 5, 0.5)
_expected = 0.24609375
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'binomial_probability(4, 0, 0.5) (no successes)'
_actual = binomial_probability(4, 0, 0.5)
_expected = 0.0625
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'binomial_probability(3, 3, 1.0) (certain success)'
_actual = binomial_probability(3, 3, 1.0)
_expected = 1.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000081', 8, 'Normal Distribution PDF', 'hard', 'Write normal_pdf(x, mean, std) that returns the value of the normal distribution''s probability density function at x, given its mean and standard deviation. Use scipy.stats.norm.', 'scipy.stats.norm(loc=mean, scale=std).pdf(x) evaluates the density directly.', $py$from scipy import stats

def normal_pdf(x, mean, std):
    # TODO
    pass
$py$, $py$import math
_passed = 0
_total = 3
_call_desc = 'normal_pdf(0, 0, 1) (standard normal peak)'
_actual = normal_pdf(0, 0, 1)
_expected = 1 / math.sqrt(2 * math.pi)
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'normal_pdf(5, 5, 2) (peak of shifted normal)'
_actual = normal_pdf(5, 5, 2)
_expected = 1 / (2 * math.sqrt(2 * math.pi))
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'normal_pdf(0, 0, 1) > normal_pdf(2, 0, 1) (falls off from center)'
_a = normal_pdf(0, 0, 1)
_b = normal_pdf(2, 0, 1)
if _a > _b:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_a!r} vs {_b!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000081', 9, 'Simulate Coin Flips', 'hard', 'Write simulate_coin_flips(n, seed) that seeds NumPy''s random generator with seed, flips a fair coin n times, and returns the number of heads (1s) out of n flips (using 0/1 encoding, threshold 0.5).', 'np.random.seed(seed) first, then np.random.random(n) < 0.5 gives a boolean array of heads; sum it to count them.', $py$import numpy as np

def simulate_coin_flips(n, seed):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'simulate_coin_flips(1000, 42) is reproducible'
_a = simulate_coin_flips(1000, 42)
_b = simulate_coin_flips(1000, 42)
if _a == _b:
    _passed += 1
    print(f"PASS: {_call_desc} -- both runs gave {_a}")
else:
    print(f"FAIL: {_call_desc} -- got {_a!r} vs {_b!r}")
_call_desc = 'simulate_coin_flips(1000, 42) is roughly half heads'
if 400 <= _a <= 600:
    _passed += 1
    print(f"PASS: {_call_desc} -- got {_a}")
else:
    print(f"FAIL: {_call_desc} -- got {_a}, expected roughly 400-600")
_call_desc = 'simulate_coin_flips(1000, 1) differs from seed 42 (different seed, different result likely)'
_c = simulate_coin_flips(1000, 1)
if isinstance(_c, int) and 0 <= _c <= 1000:
    _passed += 1
    print(f"PASS: {_call_desc} -- got {_c}")
else:
    print(f"FAIL: {_call_desc} -- got {_c!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000082', 1, 'Check a Candidate Solution', 'easy', 'Write is_solution(A, b, x, tol=1e-6) that returns True if A @ x is within tol of b (elementwise), False otherwise. A is a 2D NumPy array, b and x are 1D NumPy arrays.', 'Compute A @ x, then compare elementwise to b using np.allclose(A @ x, b, atol=tol) or a manual tolerance loop.', $py$import numpy as np

def is_solution(A, b, x, tol=1e-6):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'is_solution([[2,1],[1,-1]], [5,1], [2,1]) (exact)'
_actual = is_solution(np.array([[2, 1], [1, -1]]), np.array([5, 1]), np.array([2, 1]))
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_solution(..., wrong x) is False'
_actual = is_solution(np.array([[2, 1], [1, -1]]), np.array([5, 1]), np.array([0, 0]))
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_solution with tiny floating point noise is True'
_actual = is_solution(np.array([[1.0, 0.0], [0.0, 1.0]]), np.array([1.0, 1.0]), np.array([1.0000001, 0.9999999]))
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000082', 2, '2x2 Determinant By Hand', 'easy', 'Write determinant_2x2(matrix) that returns the determinant of a 2x2 matrix [[a, b], [c, d]] using the formula a*d - b*c, without NumPy.', 'Unpack the four entries and apply a*d - b*c directly.', $py$def determinant_2x2(matrix):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'determinant_2x2([[2,1],[1,-1]])'
_actual = determinant_2x2([[2, 1], [1, -1]])
_expected = -3
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'determinant_2x2([[1,0],[0,1]]) (identity)'
_actual = determinant_2x2([[1, 0], [0, 1]])
_expected = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'determinant_2x2([[2,4],[1,2]]) (singular)'
_actual = determinant_2x2([[2, 4], [1, 2]])
_expected = 0
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000082', 3, 'Determinant via NumPy', 'easy', 'Write determinant(matrix) that returns the determinant of a square NumPy array using np.linalg.det.', 'np.linalg.det(matrix) computes it directly for any square matrix.', $py$import numpy as np

def determinant(matrix):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'determinant(np.array([[2,1],[1,-1]]))'
_actual = determinant(np.array([[2, 1], [1, -1]]))
_expected = -3.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'determinant(np.eye(3)) (identity)'
_actual = determinant(np.eye(3))
_expected = 1.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'determinant(np.array([[2,4],[1,2]])) (singular)'
_actual = determinant(np.array([[2, 4], [1, 2]]))
_expected = 0.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000082', 4, 'Solve With NumPy', 'medium', 'Write solve_system(A, b) that returns the solution vector x to A @ x = b, using np.linalg.solve.', 'np.linalg.solve(A, b) returns x directly for a square, non-singular A.', $py$import numpy as np

def solve_system(A, b):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'solve_system([[2,1],[1,-1]], [5,1])'
_actual = solve_system(np.array([[2.0, 1.0], [1.0, -1.0]]), np.array([5.0, 1.0]))
_expected = [2.0, 1.0]
if all(abs(a - e) < 1e-6 for a, e in zip(_actual, _expected)):
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'solve_system(identity, b) == b'
_actual = solve_system(np.eye(3), np.array([1.0, 2.0, 3.0]))
_expected = [1.0, 2.0, 3.0]
if all(abs(a - e) < 1e-6 for a, e in zip(_actual, _expected)):
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'solve_system 3x3 system'
_A = np.array([[3.0, 2.0, -1.0], [2.0, -2.0, 4.0], [-1.0, 0.5, -1.0]])
_b = np.array([1.0, -2.0, 0.0])
_actual = solve_system(_A, _b)
_expected = np.linalg.solve(_A, _b)
if all(abs(a - e) < 1e-6 for a, e in zip(_actual, _expected)):
    _passed += 1
    print(f"PASS: {_call_desc} ~= {list(_expected)!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {list(_expected)!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000082', 5, 'Cramer''s Rule for 2x2', 'medium', 'Write solve_2x2_cramer(a, b, c, d, e, f) that solves the system a*x + b*y = e, c*x + d*y = f using Cramer''s rule, returning a tuple (x, y).', 'Cramer''s rule: x = (e*d - b*f) / (a*d - b*c), y = (a*f - e*c) / (a*d - b*c) -- the denominator is the coefficient matrix''s determinant.', $py$def solve_2x2_cramer(a, b, c, d, e, f):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'solve_2x2_cramer(2,1,1,-1,5,1) (2x+y=5, x-y=1)'
_actual = tuple(round(v, 6) for v in solve_2x2_cramer(2, 1, 1, -1, 5, 1))
_expected = (2.0, 1.0)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'solve_2x2_cramer(1,0,0,1,3,4) (identity system)'
_actual = tuple(round(v, 6) for v in solve_2x2_cramer(1, 0, 0, 1, 3, 4))
_expected = (3.0, 4.0)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'solve_2x2_cramer(3,2,1,-1,8,1) (x+2y system)'
_actual = tuple(round(v, 6) for v in solve_2x2_cramer(3, 2, 1, -1, 8, 1))
_expected = (2.0, 1.0)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000082', 6, 'Has a Unique Solution?', 'medium', 'Write has_unique_solution(A) that returns True if the square matrix A guarantees a unique solution for any b (i.e. its determinant is nonzero), False otherwise.', 'Compute np.linalg.det(A) and check it''s not close to zero -- use a tolerance, not exact ==.', $py$import numpy as np

def has_unique_solution(A):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'has_unique_solution([[2,1],[1,-1]])'
_actual = has_unique_solution(np.array([[2, 1], [1, -1]]))
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'has_unique_solution([[2,4],[1,2]]) (singular)'
_actual = has_unique_solution(np.array([[2, 4], [1, 2]]))
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'has_unique_solution(identity)'
_actual = has_unique_solution(np.eye(4))
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000082', 7, 'Residual Vector', 'medium', 'Write residual_vector(A, x, b) that returns A @ x - b, the residual vector measuring how far x is from an exact solution (all zeros means x solves the system exactly).', 'Straightforward matrix-vector multiplication followed by subtraction: A @ x - b.', $py$import numpy as np

def residual_vector(A, x, b):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'residual_vector for exact solution is ~0'
_actual = residual_vector(np.array([[2.0, 1.0], [1.0, -1.0]]), np.array([2.0, 1.0]), np.array([5.0, 1.0]))
_expected = [0.0, 0.0]
if all(abs(a - e) < 1e-6 for a, e in zip(_actual, _expected)):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} returned {list(_actual)!r}, expected {_expected!r}")
_call_desc = 'residual_vector for wrong x is nonzero'
_actual = residual_vector(np.array([[2.0, 1.0], [1.0, -1.0]]), np.array([0.0, 0.0]), np.array([5.0, 1.0]))
_expected = [-5.0, -1.0]
if all(abs(a - e) < 1e-6 for a, e in zip(_actual, _expected)):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} returned {list(_actual)!r}, expected {_expected!r}")
_call_desc = 'residual_vector with identity matrix'
_actual = residual_vector(np.eye(2), np.array([3.0, 4.0]), np.array([3.0, 4.0]))
_expected = [0.0, 0.0]
if all(abs(a - e) < 1e-6 for a, e in zip(_actual, _expected)):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} returned {list(_actual)!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000082', 8, 'Matrix Inverse', 'hard', 'Write matrix_inverse(A) that returns the inverse of square matrix A using np.linalg.inv, such that A @ inverse is (approximately) the identity matrix.', 'np.linalg.inv(A) computes the inverse directly; it raises an error for singular matrices, which is expected behavior.', $py$import numpy as np

def matrix_inverse(A):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'matrix_inverse(A) @ A ~= identity'
_A = np.array([[2.0, 1.0], [1.0, -1.0]])
_inv = matrix_inverse(_A)
_product = _A @ _inv
_expected = np.eye(2)
if np.allclose(_product, _expected, atol=1e-6):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_product.tolist()!r}")
_call_desc = 'matrix_inverse(identity) == identity'
_actual = matrix_inverse(np.eye(3))
if np.allclose(_actual, np.eye(3), atol=1e-6):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_actual.tolist()!r}")
_call_desc = 'matrix_inverse([[4,0],[0,2]]) == [[0.25,0],[0,0.5]]'
_actual = matrix_inverse(np.array([[4.0, 0.0], [0.0, 2.0]]))
_expected2 = [[0.25, 0.0], [0.0, 0.5]]
if np.allclose(_actual, _expected2, atol=1e-6):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_actual.tolist()!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000082', 9, 'Back Substitution', 'hard', 'Write back_substitution(U, b) that solves Ux = b for x, where U is an upper-triangular square matrix (all entries below the diagonal are 0), by solving from the last row upward without calling np.linalg.solve.', 'Start with the last variable (only one unknown in the last row), then work upward: for each row, subtract the already-known variables'' contributions before dividing by the diagonal entry.', $py$import numpy as np

def back_substitution(U, b):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'back_substitution upper-triangular 2x2'
_U = np.array([[2.0, 1.0], [0.0, 3.0]])
_b = np.array([5.0, 6.0])
_actual = back_substitution(_U, _b)
_expected = np.linalg.solve(_U, _b)
if all(abs(a - e) < 1e-6 for a, e in zip(_actual, _expected)):
    _passed += 1
    print(f"PASS: {_call_desc} ~= {list(_expected)!r}")
else:
    print(f"FAIL: {_call_desc} returned {list(_actual)!r}, expected {list(_expected)!r}")
_call_desc = 'back_substitution upper-triangular 3x3'
_U2 = np.array([[1.0, 2.0, 3.0], [0.0, 1.0, 4.0], [0.0, 0.0, 2.0]])
_b2 = np.array([6.0, 5.0, 2.0])
_actual2 = back_substitution(_U2, _b2)
_expected2 = np.linalg.solve(_U2, _b2)
if all(abs(a - e) < 1e-6 for a, e in zip(_actual2, _expected2)):
    _passed += 1
    print(f"PASS: {_call_desc} ~= {list(_expected2)!r}")
else:
    print(f"FAIL: {_call_desc} returned {list(_actual2)!r}, expected {list(_expected2)!r}")
_call_desc = 'back_substitution with identity is just b'
_actual3 = back_substitution(np.eye(3), np.array([1.0, 2.0, 3.0]))
_expected3 = [1.0, 2.0, 3.0]
if all(abs(a - e) < 1e-6 for a, e in zip(_actual3, _expected3)):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} returned {list(_actual3)!r}, expected {_expected3!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000083', 1, 'Numerical Derivative', 'easy', 'Write numerical_derivative(f, x, h=1e-5) that returns the approximate derivative of f at x, using the centered finite-difference formula (f(x+h) - f(x-h)) / (2*h).', 'Call f(x + h) and f(x - h), subtract, and divide by 2*h.', $py$def numerical_derivative(f, x, h=1e-5):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'numerical_derivative(x**2, 3) ~= 6'
_actual = numerical_derivative(lambda x: x ** 2, 3)
_expected = 6.0
if abs(_actual - _expected) < 1e-3:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'numerical_derivative(constant fn, 5) ~= 0'
_actual = numerical_derivative(lambda x: 42, 5)
_expected = 0.0
if abs(_actual - _expected) < 1e-3:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'numerical_derivative(3x+1, 0) ~= 3 (linear slope)'
_actual = numerical_derivative(lambda x: 3 * x + 1, 0)
_expected = 3.0
if abs(_actual - _expected) < 1e-3:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000083', 2, 'Slope Between Two Points', 'easy', 'Write slope_between_points(x1, y1, x2, y2) that returns the slope of the line through (x1, y1) and (x2, y2).', 'The slope formula: (y2 - y1) / (x2 - x1).', $py$def slope_between_points(x1, y1, x2, y2):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'slope_between_points(0, 0, 2, 4)'
_actual = slope_between_points(0, 0, 2, 4)
_expected = 2.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'slope_between_points(1, 5, 3, 5) (flat line)'
_actual = slope_between_points(1, 5, 3, 5)
_expected = 0.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'slope_between_points(0, 10, 5, 0) (negative slope)'
_actual = slope_between_points(0, 10, 5, 0)
_expected = -2.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000083', 3, 'Is Increasing?', 'easy', 'Write is_increasing(f, x, h=1e-5) that returns True if f''s numerical derivative at x is positive (f is increasing there), False otherwise.', 'Reuse the centered-difference formula for the derivative, then check if it''s greater than 0.', $py$def is_increasing(f, x, h=1e-5):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'is_increasing(x**2, 3) (rising for x>0)'
_actual = is_increasing(lambda x: x ** 2, 3)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_increasing(x**2, -3) (falling for x<0)'
_actual = is_increasing(lambda x: x ** 2, -3)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_increasing(-x, 0) (always decreasing line)'
_actual = is_increasing(lambda x: -x, 0)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000083', 4, 'Gradient Descent Step', 'easy', 'Write gradient_descent_step(x, grad, learning_rate) that returns the updated x after one gradient descent step: move opposite the gradient, scaled by learning_rate.', 'The update rule: x - learning_rate * grad.', $py$def gradient_descent_step(x, grad, learning_rate):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'gradient_descent_step(5, 2, 0.1)'
_actual = gradient_descent_step(5, 2, 0.1)
_expected = 4.8
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'gradient_descent_step(0, -4, 0.5) (negative gradient moves x up)'
_actual = gradient_descent_step(0, -4, 0.5)
_expected = 2.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'gradient_descent_step(3, 0, 0.1) (zero gradient means no move)'
_actual = gradient_descent_step(3, 0, 0.1)
_expected = 3.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000083', 5, 'Tangent Line Approximation', 'medium', 'Write tangent_line_value(f, x0, x, h=1e-5) that returns the tangent line''s approximation of f at x, built from f''s value and numerical derivative at x0: f(x0) + f''(x0) * (x - x0).', 'Compute the derivative at x0 using the centered-difference formula, then plug into the linear approximation formula.', $py$def tangent_line_value(f, x0, x, h=1e-5):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'tangent_line_value(x**2, 3, 3.001) close to actual f(3.001)'
_f = lambda x: x ** 2
_actual = tangent_line_value(_f, 3, 3.001)
_expected = _f(3.001)
if abs(_actual - _expected) < 1e-3:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'tangent_line_value(x**2, 3, 3) equals f(3) exactly at the tangent point'
_actual = tangent_line_value(_f, 3, 3)
_expected = 9.0
if abs(_actual - _expected) < 1e-3:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'tangent_line_value on a line reproduces the line exactly'
_g = lambda x: 5 * x + 2
_actual = tangent_line_value(_g, 0, 10)
_expected = 52.0
if abs(_actual - _expected) < 1e-2:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000083', 6, 'Numerical Gradient of Two Variables', 'medium', 'Write numerical_gradient(f, x, y, h=1e-5) that returns the gradient of f(x, y) at (x, y) as a tuple (df/dx, df/dy), using centered finite differences on each variable separately.', 'Hold y fixed and nudge x for the first partial derivative; hold x fixed and nudge y for the second.', $py$def numerical_gradient(f, x, y, h=1e-5):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'numerical_gradient(x^2+y^2, 3, 4) ~= (6, 8)'
_f = lambda x, y: x ** 2 + y ** 2
_actual = numerical_gradient(_f, 3, 4)
_expected = (6.0, 8.0)
if all(abs(a - e) < 1e-2 for a, e in zip(_actual, _expected)):
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'numerical_gradient(x*y, 2, 3) ~= (3, 2)'
_g = lambda x, y: x * y
_actual = numerical_gradient(_g, 2, 3)
_expected = (3.0, 2.0)
if all(abs(a - e) < 1e-2 for a, e in zip(_actual, _expected)):
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'numerical_gradient(constant, 1, 1) ~= (0, 0)'
_h = lambda x, y: 7
_actual = numerical_gradient(_h, 1, 1)
_expected = (0.0, 0.0)
if all(abs(a - e) < 1e-2 for a, e in zip(_actual, _expected)):
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000083', 7, 'Second Derivative', 'medium', 'Write second_derivative(f, x, h=1e-3) that returns the approximate second derivative of f at x, using the formula (f(x+h) - 2*f(x) + f(x-h)) / h**2.', 'Plug directly into the given central second-difference formula.', $py$def second_derivative(f, x, h=1e-3):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'second_derivative(x**2, 5) ~= 2 (constant curvature)'
_actual = second_derivative(lambda x: x ** 2, 5)
_expected = 2.0
if abs(_actual - _expected) < 1e-2:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'second_derivative(linear fn, 3) ~= 0 (no curvature)'
_actual = second_derivative(lambda x: 4 * x + 1, 3)
_expected = 0.0
if abs(_actual - _expected) < 1e-2:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'second_derivative(x**3, 0) ~= 0 (inflection point)'
_actual = second_derivative(lambda x: x ** 3, 0)
_expected = 0.0
if abs(_actual - _expected) < 1e-1:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000083', 8, 'Critical Point Check', 'medium', 'Write is_critical_point(f, x, h=1e-5, tol=1e-3) that returns True if f''s numerical derivative at x is within tol of zero (a critical point: minimum, maximum, or saddle), False otherwise.', 'Compute the derivative with the centered-difference formula, then compare its absolute value to tol.', $py$def is_critical_point(f, x, h=1e-5, tol=1e-3):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'is_critical_point(x**2, 0) (minimum at 0)'
_actual = is_critical_point(lambda x: x ** 2, 0)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_critical_point(x**2, 5) (not critical)'
_actual = is_critical_point(lambda x: x ** 2, 5)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_critical_point((x-2)**2, 2) (minimum shifted)'
_actual = is_critical_point(lambda x: (x - 2) ** 2, 2)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000083', 9, 'Find a Minimum via Gradient Descent', 'hard', 'Write find_minimum(f, start, learning_rate=0.1, steps=200, h=1e-5) that runs that many gradient descent steps starting at start, using a numerical derivative each step, and returns the final x.', 'Each step: compute the numerical derivative at the current x, then update x -= learning_rate * derivative; repeat for the given number of steps.', $py$def find_minimum(f, start, learning_rate=0.1, steps=200, h=1e-5):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'find_minimum((x-3)**2, start=0) converges near x=3'
_actual = find_minimum(lambda x: (x - 3) ** 2, 0)
_expected = 3.0
if abs(_actual - _expected) < 1e-2:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r} (got {_actual!r})")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected ~{_expected!r}")
_call_desc = 'find_minimum(x**2, start=10) converges near x=0'
_actual = find_minimum(lambda x: x ** 2, 10)
_expected = 0.0
if abs(_actual - _expected) < 1e-2:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r} (got {_actual!r})")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected ~{_expected!r}")
_call_desc = 'find_minimum((x+5)**2, start=0) converges near x=-5'
_actual = find_minimum(lambda x: (x + 5) ** 2, 0)
_expected = -5.0
if abs(_actual - _expected) < 1e-2:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r} (got {_actual!r})")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected ~{_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000084', 1, 'Generate Line Data', 'easy', 'Write generate_line_data(start, stop, num) that returns a tuple (x, y) of NumPy arrays: x is num evenly spaced points from start to stop (inclusive), and y is x squared.', 'np.linspace(start, stop, num) creates the evenly spaced x values; y is just x ** 2.', $py$import numpy as np

def generate_line_data(start, stop, num):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'generate_line_data(0, 4, 5) has correct x'
_x, _y = generate_line_data(0, 4, 5)
_expected_x = [0.0, 1.0, 2.0, 3.0, 4.0]
if all(abs(a - e) < 1e-6 for a, e in zip(_x, _expected_x)):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {list(_x)!r}")
_call_desc = 'generate_line_data(0, 4, 5) has y == x**2'
_expected_y = [0.0, 1.0, 4.0, 9.0, 16.0]
if all(abs(a - e) < 1e-6 for a, e in zip(_y, _expected_y)):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {list(_y)!r}")
_call_desc = 'generate_line_data returns num points'
_x2, _y2 = generate_line_data(0, 10, 11)
if len(_x2) == 11 and len(_y2) == 11:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got lengths {len(_x2)}, {len(_y2)}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000084', 2, 'Set Axis Labels', 'easy', 'Write add_labels(ax, xlabel, ylabel, title) that sets the given labels and title on the matplotlib Axes ax (it modifies ax in place; no return value needed).', 'Use ax.set_xlabel(xlabel), ax.set_ylabel(ylabel), and ax.set_title(title).', $py$def add_labels(ax, xlabel, ylabel, title):
    # TODO
    pass
$py$, $py$import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
_passed = 0
_total = 3
_fig, _ax = plt.subplots()
add_labels(_ax, "Time", "Value", "My Chart")
_call_desc = 'add_labels sets xlabel'
if _ax.get_xlabel() == "Time":
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_ax.get_xlabel()!r}")
_call_desc = 'add_labels sets ylabel'
if _ax.get_ylabel() == "Value":
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_ax.get_ylabel()!r}")
_call_desc = 'add_labels sets title'
if _ax.get_title() == "My Chart":
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_ax.get_title()!r}")
plt.close(_fig)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000084', 3, 'Set Axis Limits', 'easy', 'Write set_axis_limits(ax, xlim, ylim) that sets the Axes'' x-axis range to xlim (a tuple) and y-axis range to ylim (a tuple).', 'ax.set_xlim(xlim) and ax.set_ylim(ylim) each accept a (low, high) tuple.', $py$def set_axis_limits(ax, xlim, ylim):
    # TODO
    pass
$py$, $py$import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
_passed = 0
_total = 3
_fig, _ax = plt.subplots()
set_axis_limits(_ax, (0, 10), (-5, 5))
_call_desc = 'set_axis_limits sets xlim'
_actual = tuple(round(v, 6) for v in _ax.get_xlim())
if _actual == (0.0, 10.0):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_actual!r}")
_call_desc = 'set_axis_limits sets ylim'
_actual = tuple(round(v, 6) for v in _ax.get_ylim())
if _actual == (-5.0, 5.0):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_actual!r}")
set_axis_limits(_ax, (1, 2), (3, 4))
_call_desc = 'set_axis_limits can be called again with new values'
_actual = (tuple(round(v, 6) for v in _ax.get_xlim()), tuple(round(v, 6) for v in _ax.get_ylim()))
if _actual == ((1.0, 2.0), (3.0, 4.0)):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_actual!r}")
plt.close(_fig)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000084', 4, 'Histogram Bin Counts', 'easy', 'Write histogram_counts(data, bins) that returns a tuple (counts, edges) using matplotlib''s ax.hist -- counts as a plain list of ints, edges as a plain list of floats -- without displaying a figure.', 'Create a throwaway fig/ax with plt.subplots(), call ax.hist(data, bins=bins), and it returns (n, bin_edges, patches); convert the first two to plain lists.', $py$import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

def histogram_counts(data, bins):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'histogram_counts([1,1,2,3,3,3], bins=3) counts sum to len(data)'
_counts, _edges = histogram_counts([1, 1, 2, 3, 3, 3], bins=3)
if sum(_counts) == 6:
    _passed += 1
    print(f"PASS: {_call_desc} -- counts {_counts!r}")
else:
    print(f"FAIL: {_call_desc} -- counts {_counts!r} sum to {sum(_counts)}")
_call_desc = 'histogram_counts returns bins+1 edges'
if len(_edges) == 4:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {len(_edges)} edges")
_call_desc = 'histogram_counts([5,5,5,5], bins=1) has all in one bin'
_counts2, _edges2 = histogram_counts([5, 5, 5, 5], bins=1)
if _counts2 == [4]:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_counts2!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000084', 5, 'Simple Line Plot', 'medium', 'Write make_line_plot(x, y) that creates a new Figure/Axes, plots y against x as a line, and returns the Axes object.', 'plt.subplots() creates fig and ax; ax.plot(x, y) draws the line; return ax.', $py$import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

def make_line_plot(x, y):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_x = np.array([1, 2, 3, 4])
_y = np.array([1, 4, 9, 16])
_ax = make_line_plot(_x, _y)
_call_desc = 'make_line_plot returns an Axes with exactly one line'
if len(_ax.lines) == 1:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {len(_ax.lines)} lines")
_call_desc = "the plotted line's x data matches input"
_line_x = list(_ax.lines[0].get_xdata())
if all(abs(a - e) < 1e-6 for a, e in zip(_line_x, _x)):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_line_x!r}")
_call_desc = "the plotted line's y data matches input"
_line_y = list(_ax.lines[0].get_ydata())
if all(abs(a - e) < 1e-6 for a, e in zip(_line_y, _y)):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_line_y!r}")
_ax.figure and plt.close(_ax.figure)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000084', 6, 'Plot Multiple Series', 'medium', 'Write plot_multiple_series(x, series) that creates a new Figure/Axes, plots one line per key in the dict series (label=key, data=value), adds a legend, and returns the Axes.', 'Loop over series.items(), calling ax.plot(x, values, label=name) for each, then call ax.legend() once at the end.', $py$import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

def plot_multiple_series(x, series):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_x = np.array([1, 2, 3])
_series = {"a": [1, 2, 3], "b": [3, 2, 1]}
_ax = plot_multiple_series(_x, _series)
_call_desc = 'plot_multiple_series draws one line per series'
if len(_ax.lines) == 2:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {len(_ax.lines)} lines")
_call_desc = 'plot_multiple_series labels match the dict keys'
_labels = {line.get_label() for line in _ax.lines}
if _labels == {"a", "b"}:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_labels!r}")
_call_desc = 'plot_multiple_series creates a legend'
if _ax.get_legend() is not None:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- no legend found")
plt.close(_ax.figure)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000084', 7, 'Scatter Plot', 'medium', 'Write make_scatter_plot(x, y) that creates a new Figure/Axes, draws a scatter plot of y against x, and returns the Axes.', 'ax.scatter(x, y) draws individual points rather than a connected line.', $py$import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

def make_scatter_plot(x, y):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_x = np.array([1, 2, 3, 4, 5])
_y = np.array([5, 3, 4, 2, 1])
_ax = make_scatter_plot(_x, _y)
_call_desc = 'make_scatter_plot produces exactly one scatter collection'
if len(_ax.collections) == 1:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {len(_ax.collections)} collections")
_call_desc = 'the scatter collection has 5 points'
_offsets = _ax.collections[0].get_offsets()
if len(_offsets) == 5:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {len(_offsets)} points")
_call_desc = 'make_scatter_plot draws no connecting lines'
if len(_ax.lines) == 0:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {len(_ax.lines)} lines")
plt.close(_ax.figure)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000084', 8, 'Bar Chart Heights', 'medium', 'Write make_bar_chart(categories, values) that creates a new Figure/Axes, draws a bar chart with one bar per category, and returns the Axes.', 'ax.bar(categories, values) creates one bar (a matplotlib Rectangle patch) per category; each patch''s height matches the corresponding value.', $py$import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

def make_bar_chart(categories, values):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_categories = ["a", "b", "c"]
_values = [3, 7, 5]
_ax = make_bar_chart(_categories, _values)
_call_desc = 'make_bar_chart creates one bar per category'
if len(_ax.patches) == 3:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {len(_ax.patches)} patches")
_call_desc = 'bar heights match the given values'
_heights = [round(p.get_height(), 6) for p in _ax.patches]
if _heights == [3.0, 7.0, 5.0]:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_heights!r}")
_call_desc = 'make_bar_chart([], []) creates zero bars without crashing'
_ax2 = make_bar_chart([], [])
if len(_ax2.patches) == 0:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {len(_ax2.patches)} patches")
plt.close(_ax.figure)
plt.close(_ax2.figure)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000084', 9, 'Stacked Subplots', 'hard', 'Write make_stacked_subplots(x, y1, y2) that creates a Figure with 2 vertically-stacked subplots (2 rows, 1 column), plots y1 on the first and y2 on the second, and returns the Figure.', 'plt.subplots(2, 1) returns (fig, axes) where axes is an array of 2 Axes objects; index into it to plot on each one.', $py$import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

def make_stacked_subplots(x, y1, y2):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_x = np.array([1, 2, 3])
_fig = make_stacked_subplots(_x, [1, 2, 3], [3, 2, 1])
_call_desc = 'make_stacked_subplots produces a Figure with 2 Axes'
if len(_fig.axes) == 2:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {len(_fig.axes)} axes")
_call_desc = 'each subplot has exactly one line'
_ok = all(len(ax.lines) == 1 for ax in _fig.axes)
if _ok:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {[len(ax.lines) for ax in _fig.axes]!r}")
_call_desc = 'first subplot y-data matches y1, second matches y2'
_y1_actual = list(_fig.axes[0].lines[0].get_ydata())
_y2_actual = list(_fig.axes[1].lines[0].get_ydata())
if _y1_actual == [1, 2, 3] and _y2_actual == [3, 2, 1]:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_y1_actual!r}, {_y2_actual!r}")
plt.close(_fig)
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000085', 1, 'Seeded Random Integer', 'easy', 'Write seeded_randint(seed, low, high) that seeds NumPy''s global random state with seed, then returns a single random integer from low (inclusive) to high (exclusive).', 'np.random.seed(seed) first, then np.random.randint(low, high).', $py$import numpy as np

def seeded_randint(seed, low, high):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'seeded_randint(42, 1, 100) is reproducible'
_a = seeded_randint(42, 1, 100)
_b = seeded_randint(42, 1, 100)
if _a == _b:
    _passed += 1
    print(f"PASS: {_call_desc} -- got {_a} both times")
else:
    print(f"FAIL: {_call_desc} -- got {_a!r} vs {_b!r}")
_call_desc = 'seeded_randint(42, 1, 100) is within range'
if 1 <= _a < 100:
    _passed += 1
    print(f"PASS: {_call_desc} -- got {_a}")
else:
    print(f"FAIL: {_call_desc} -- got {_a} out of [1, 100)")
_call_desc = 'seeded_randint(0, 5, 6) always returns 5 (only one option)'
_c = seeded_randint(0, 5, 6)
_expected = 5
if _c == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_c!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000085', 2, 'Same Seed, Same Result', 'easy', 'Write same_seed_same_result(seed, n) that seeds NumPy, generates an array of n random floats, and returns True if calling the same seeded generation process twice produces identical arrays.', 'Seed, generate an array, reseed with the same seed, generate again, and compare with np.array_equal.', $py$import numpy as np

def same_seed_same_result(seed, n):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'same_seed_same_result(42, 10) is True'
_actual = same_seed_same_result(42, 10)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'same_seed_same_result(0, 1) is True'
_actual = same_seed_same_result(0, 1)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'same_seed_same_result(7, 50) is True'
_actual = same_seed_same_result(7, 50)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000085', 3, 'Seeded Random Array', 'medium', 'Write seeded_random_array(seed, n) that seeds NumPy''s global random state, then returns an array of n random floats in [0, 1) using np.random.random.', 'np.random.seed(seed), then np.random.random(n).', $py$import numpy as np

def seeded_random_array(seed, n):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3
_call_desc = 'seeded_random_array(42, 5) has length 5'
_actual = seeded_random_array(42, 5)
if len(_actual) == 5:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got length {len(_actual)}")
_call_desc = 'seeded_random_array(42, 5) is reproducible'
_a = seeded_random_array(42, 5)
_b = seeded_random_array(42, 5)
if np.allclose(_a, _b):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {list(_a)!r} vs {list(_b)!r}")
_call_desc = 'seeded_random_array values are within [0, 1)'
if all(0 <= v < 1 for v in _a):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {list(_a)!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000085', 4, 'Deterministic Shuffle', 'medium', 'Write shuffle_deterministic(seed, values) that seeds NumPy, returns a shuffled copy of the list values as a plain Python list, leaving the original list unmodified.', 'Convert to a NumPy array copy, seed, call np.random.shuffle on the copy (it shuffles in place), then convert back to a list.', $py$import numpy as np

def shuffle_deterministic(seed, values):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_original = [1, 2, 3, 4, 5]
_call_desc = 'shuffle_deterministic does not mutate the original list'
_result = shuffle_deterministic(42, _original)
if _original == [1, 2, 3, 4, 5]:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- original became {_original!r}")
_call_desc = 'shuffle_deterministic(42, ...) is reproducible'
_result2 = shuffle_deterministic(42, [1, 2, 3, 4, 5])
if _result == _result2:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_result!r} vs {_result2!r}")
_call_desc = 'shuffle_deterministic preserves the same set of elements'
if sorted(_result) == [1, 2, 3, 4, 5]:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_result!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000085', 5, 'Reproducible Random Choice', 'medium', 'Write reproducible_choice(seed, options, k) that seeds NumPy, then returns a list of k items chosen from options without replacement (no repeats), using np.random.choice.', 'np.random.seed(seed), then np.random.choice(options, size=k, replace=False).tolist().', $py$import numpy as np

def reproducible_choice(seed, options, k):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_options = ["a", "b", "c", "d", "e"]
_call_desc = 'reproducible_choice(42, options, 3) returns 3 unique items from options'
_result = reproducible_choice(42, _options, 3)
if len(_result) == 3 and len(set(_result)) == 3 and all(x in _options for x in _result):
    _passed += 1
    print(f"PASS: {_call_desc} -- got {_result!r}")
else:
    print(f"FAIL: {_call_desc} -- got {_result!r}")
_call_desc = 'reproducible_choice(42, ...) is reproducible'
_result2 = reproducible_choice(42, _options, 3)
if list(_result) == list(_result2):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_result!r} vs {_result2!r}")
_call_desc = 'reproducible_choice(1, options, 5) returns all 5 items (k == len(options))'
_result3 = reproducible_choice(1, _options, 5)
if sorted(_result3) == sorted(_options):
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_result3!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000085', 6, 'Random Normal Sample Stats', 'medium', 'Write random_normal_stats(seed, n, mean, std) that seeds NumPy, draws n samples from a normal distribution with the given mean and std, and returns a tuple (sample_mean, sample_std) of the drawn sample''s actual mean and standard deviation.', 'np.random.seed(seed), then np.random.normal(mean, std, size=n); compute .mean() and .std() on the result.', $py$import numpy as np

def random_normal_stats(seed, n, mean, std):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'random_normal_stats(42, 100000, 5, 2) sample mean is close to 5'
_mean, _std = random_normal_stats(42, 100000, 5, 2)
if abs(_mean - 5) < 0.1:
    _passed += 1
    print(f"PASS: {_call_desc} -- got {_mean!r}")
else:
    print(f"FAIL: {_call_desc} -- got {_mean!r}")
_call_desc = 'random_normal_stats(42, 100000, 5, 2) sample std is close to 2'
if abs(_std - 2) < 0.1:
    _passed += 1
    print(f"PASS: {_call_desc} -- got {_std!r}")
else:
    print(f"FAIL: {_call_desc} -- got {_std!r}")
_call_desc = 'random_normal_stats(42, ...) is reproducible'
_mean2, _std2 = random_normal_stats(42, 100000, 5, 2)
if abs(_mean - _mean2) < 1e-9 and abs(_std - _std2) < 1e-9:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got ({_mean!r},{_std!r}) vs ({_mean2!r},{_std2!r})")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000085', 7, 'Modern Generator API', 'medium', 'Write generator_random_ints(seed, n, low, high) that uses np.random.default_rng(seed) (the modern Generator API, not the legacy global np.random.seed) to return a list of n random integers from low (inclusive) to high (exclusive).', 'rng = np.random.default_rng(seed), then rng.integers(low, high, size=n).tolist().', $py$import numpy as np

def generator_random_ints(seed, n, low, high):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'generator_random_ints(42, 5, 1, 100) is reproducible'
_a = generator_random_ints(42, 5, 1, 100)
_b = generator_random_ints(42, 5, 1, 100)
if _a == _b:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_a!r} vs {_b!r}")
_call_desc = 'generator_random_ints returns n values in range'
if len(_a) == 5 and all(1 <= v < 100 for v in _a):
    _passed += 1
    print(f"PASS: {_call_desc} -- got {_a!r}")
else:
    print(f"FAIL: {_call_desc} -- got {_a!r}")
_call_desc = 'generator_random_ints(0, 3, 5, 6) always returns [5, 5, 5] (only one option)'
_c = generator_random_ints(0, 3, 5, 6)
_expected = [5, 5, 5]
if _c == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_c!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000085', 8, 'Dice Roll Simulation', 'hard', 'Write dice_roll_counts(seed, num_rolls) that seeds NumPy, simulates rolling a fair six-sided die num_rolls times, and returns a dict mapping each face (1 through 6) to how many times it appeared. Every key 1-6 must be present, even if a face never came up.', 'np.random.seed(seed), roll with np.random.randint(1, 7, size=num_rolls), then use collections.Counter seeded with {i: 0 for i in range(1, 7)} so every face is guaranteed a key.', $py$import numpy as np

def dice_roll_counts(seed, num_rolls):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'dice_roll_counts(42, 6000) has all 6 faces as keys'
_result = dice_roll_counts(42, 6000)
if set(_result.keys()) == {1, 2, 3, 4, 5, 6}:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got keys {set(_result.keys())!r}")
_call_desc = 'dice_roll_counts total equals num_rolls'
if sum(_result.values()) == 6000:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got total {sum(_result.values())}")
_call_desc = 'dice_roll_counts(42, 6000) is roughly uniform (each face 1/6 +/- generous margin)'
if all(700 <= v <= 1300 for v in _result.values()):
    _passed += 1
    print(f"PASS: {_call_desc} -- got {_result!r}")
else:
    print(f"FAIL: {_call_desc} -- got {_result!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000010', '10000000-0000-0000-0000-000000000085', 9, 'Bootstrap Sample Mean', 'hard', 'Write bootstrap_mean(seed, data, num_samples) that seeds NumPy, then repeats num_samples times: resample len(data) values from data WITH replacement, and record that resample''s mean. Return the average of all those recorded means as a single float.', 'np.random.seed(seed) once, up front. Each iteration: np.random.choice(data, size=len(data), replace=True), take its .mean(), collect all num_samples means, then return their overall average.', $py$import numpy as np

def bootstrap_mean(seed, data, num_samples):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_data = [10, 12, 11, 14, 9, 13, 10, 12]
_true_mean = sum(_data) / len(_data)
_call_desc = 'bootstrap_mean(42, data, 500) is close to the true sample mean'
_actual = bootstrap_mean(42, _data, 500)
if abs(_actual - _true_mean) < 1.0:
    _passed += 1
    print(f"PASS: {_call_desc} -- got {_actual!r}, true mean {_true_mean!r}")
else:
    print(f"FAIL: {_call_desc} -- got {_actual!r}, true mean {_true_mean!r}")
_call_desc = 'bootstrap_mean(42, data, 500) is reproducible'
_actual2 = bootstrap_mean(42, _data, 500)
if abs(_actual - _actual2) < 1e-9:
    _passed += 1
    print(f"PASS: {_call_desc}")
else:
    print(f"FAIL: {_call_desc} -- got {_actual!r} vs {_actual2!r}")
_call_desc = 'bootstrap_mean on constant data always returns that constant'
_actual3 = bootstrap_mean(1, [7, 7, 7, 7], 50)
if abs(_actual3 - 7.0) < 1e-9:
    _passed += 1
    print(f"PASS: {_call_desc} -- got {_actual3!r}")
else:
    print(f"FAIL: {_call_desc} -- got {_actual3!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000086', 1, 'Build a Labeled Series', 'easy', 'Write make_series(data, labels) that returns a pandas Series built from the list `data`, using `labels` as its index.', 'pd.Series(data, index=labels) does exactly this.', $py$import pandas as pd


def make_series(data, labels):
    # TODO: return a pd.Series built from data, indexed by labels
    pass
$py$, $py$import pandas as pd
_cases = [
    ([10, 20, 30], ["a", "b", "c"]),
    ([1], ["x"]),
    ([5, 5, 5, 5], ["w", "x", "y", "z"]),
]
_passed = 0
for _data, _labels in _cases:
    _actual = make_series(_data, _labels)
    _ok = isinstance(_actual, pd.Series) and _actual.tolist() == _data and _actual.index.tolist() == _labels
    if _ok:
        _passed += 1
        print(f"PASS: make_series({_data!r}, {_labels!r}) correct")
    else:
        print(f"FAIL: make_series({_data!r}, {_labels!r}) returned {_actual!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000086', 2, 'Column Names', 'easy', 'Write column_names(df) that returns the DataFrame''s column labels as a plain list of strings, in order.', 'df.columns.tolist() converts the column Index into a plain list.', $py$def column_names(df):
    # TODO: return df's column labels as a list
    pass
$py$, $py$import pandas as pd
_df1 = pd.DataFrame({"name": ["Ada", "Grace"], "score": [88, 92]})
_df2 = pd.DataFrame({"a": [1], "b": [2], "c": [3]})
_cases = [(_df1, ["name", "score"]), (_df2, ["a", "b", "c"])]
_passed = 0
for _df, _expected in _cases:
    _actual = column_names(_df)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: column_names(...) == {_expected!r}")
    else:
        print(f"FAIL: column_names(...) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000086', 3, 'Row Count', 'easy', 'Write row_count(df) that returns the number of rows in the DataFrame.', 'df.shape[0] or len(df) both give the row count.', $py$def row_count(df):
    # TODO: return the number of rows in df
    pass
$py$, $py$import pandas as pd
_df1 = pd.DataFrame({"a": [1, 2, 3, 4]})
_df2 = pd.DataFrame({"a": [], "b": []})
_df3 = pd.DataFrame({"x": [1]})
_cases = [(_df1, 4), (_df2, 0), (_df3, 1)]
_passed = 0
for _df, _expected in _cases:
    _actual = row_count(_df)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: row_count(...) == {_expected}")
    else:
        print(f"FAIL: row_count(...) returned {_actual!r}, expected {_expected}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000086', 4, 'Column To List', 'medium', 'Write get_column_as_list(df, col) that returns the values of column `col` as a plain Python list.', 'df[col] gives a Series; .tolist() converts it to a plain list.', $py$def get_column_as_list(df, col):
    # TODO: return df[col]'s values as a plain list
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"name": ["Ada", "Grace", "Alan"], "score": [88, 92, 79]})
_cases = [("name", ["Ada", "Grace", "Alan"]), ("score", [88, 92, 79])]
_passed = 0
for _col, _expected in _cases:
    _actual = get_column_as_list(_df, _col)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: get_column_as_list(df, {_col!r}) == {_expected!r}")
    else:
        print(f"FAIL: get_column_as_list(df, {_col!r}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000086', 5, 'Count Numeric Columns', 'medium', 'Write numeric_column_count(df) that returns how many of the DataFrame''s columns hold numeric data (int or float), ignoring text columns.', 'df.select_dtypes(include=''number'') keeps only numeric columns; check how many columns that leaves.', $py$def numeric_column_count(df):
    # TODO: return the count of numeric columns in df
    pass
$py$, $py$import pandas as pd
_df1 = pd.DataFrame({"name": ["Ada", "Grace"], "score": [88, 92], "age": [36, 40]})
_df2 = pd.DataFrame({"a": ["x", "y", "z"]})
_df3 = pd.DataFrame({"a": [1.5, 2.5], "b": [1, 2], "c": [3.0, 4.0]})
_cases = [(_df1, 2), (_df2, 0), (_df3, 3)]
_passed = 0
for _df, _expected in _cases:
    _actual = numeric_column_count(_df)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: numeric_column_count(...) == {_expected}")
    else:
        print(f"FAIL: numeric_column_count(...) returned {_actual!r}, expected {_expected}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000086', 6, 'Rename Columns', 'medium', 'Write rename_columns(df, mapping) that returns a new DataFrame with columns renamed according to the dict `mapping` (old name -> new name). Do not modify the original df.', 'df.rename(columns=mapping) returns a renamed copy by default (it doesn''t mutate df in place).', $py$def rename_columns(df, mapping):
    # TODO: return a copy of df with columns renamed per mapping
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"nm": ["Ada", "Grace"], "sc": [88, 92]})
_result = rename_columns(_df, {"nm": "name", "sc": "score"})
_passed = 0
_total = 2
if list(_result.columns) == ["name", "score"]:
    _passed += 1
    print("PASS: renamed columns are ['name', 'score']")
else:
    print(f"FAIL: renamed columns were {list(_result.columns)!r}")
if list(_df.columns) == ["nm", "sc"]:
    _passed += 1
    print("PASS: original df's columns were left unchanged")
else:
    print(f"FAIL: original df's columns were mutated to {list(_df.columns)!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000086', 7, 'First N Rows As Records', 'medium', 'Write head_records(df, n) that returns the first `n` rows of the DataFrame as a list of dicts (one dict per row, column name -> value).', 'df.head(n) gives a smaller DataFrame; .to_dict(''records'') turns it into a list of row dicts.', $py$def head_records(df, n):
    # TODO: return the first n rows of df as a list of dicts
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"name": ["Ada", "Grace", "Alan"], "score": [88, 92, 79]})
_cases = [
    (2, [{"name": "Ada", "score": 88}, {"name": "Grace", "score": 92}]),
    (1, [{"name": "Ada", "score": 88}]),
    (0, []),
]
_passed = 0
for _n, _expected in _cases:
    _actual = head_records(_df, _n)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: head_records(df, {_n}) == {_expected!r}")
    else:
        print(f"FAIL: head_records(df, {_n}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000086', 8, 'Add A Constant Column', 'hard', 'Write add_constant_column(df, col_name, value) that returns a NEW DataFrame equal to df plus one extra column named `col_name`, whose value is `value` in every row. The original df must be left unchanged.', 'Use df.assign(**{col_name: value}) to build a new DataFrame without mutating the original -- assign() always returns a copy.', $py$def add_constant_column(df, col_name, value):
    # TODO: return a new DataFrame with an extra constant column, without mutating df
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"name": ["Ada", "Grace"], "score": [88, 92]})
_result = add_constant_column(_df, "passed", True)
_passed = 0
_total = 3
if _result.to_dict("records") == [
    {"name": "Ada", "score": 88, "passed": True},
    {"name": "Grace", "score": 92, "passed": True},
]:
    _passed += 1
    print("PASS: new column added with the constant value on every row")
else:
    print(f"FAIL: got {_result.to_dict('records')!r}")
if list(_df.columns) == ["name", "score"]:
    _passed += 1
    print("PASS: original df was not mutated")
else:
    print(f"FAIL: original df now has columns {list(_df.columns)!r}")
_result2 = add_constant_column(_df, "region", "US")
if _result2["region"].tolist() == ["US", "US"]:
    _passed += 1
    print("PASS: works with a string constant too")
else:
    print(f"FAIL: got {_result2['region'].tolist()!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000086', 9, 'Column Summary Stats', 'hard', 'Write describe_numeric(df, col) that returns a dict with keys ''mean'', ''min'', and ''max'' describing column `col` of the DataFrame.', 'df[col].mean(), df[col].min(), df[col].max() give you the three pieces; mean() returns a float so compare it with a tolerance.', $py$def describe_numeric(df, col):
    # TODO: return {"mean": ..., "min": ..., "max": ...} for df[col]
    pass
$py$, $py$import pandas as pd
_df1 = pd.DataFrame({"score": [80, 90, 100]})
_df2 = pd.DataFrame({"price": [9.99, 19.99, 4.99, 12.5]})
_cases = [
    (_df1, "score", 90.0, 80, 100),
    (_df2, "price", (9.99 + 19.99 + 4.99 + 12.5) / 4, 4.99, 19.99),
]
_passed = 0
for _df, _col, _mean, _min, _max in _cases:
    _actual = describe_numeric(_df, _col)
    _ok = (
        isinstance(_actual, dict)
        and abs(_actual.get("mean", float("nan")) - _mean) < 1e-6
        and abs(_actual.get("min", float("nan")) - _min) < 1e-6
        and abs(_actual.get("max", float("nan")) - _max) < 1e-6
    )
    if _ok:
        _passed += 1
        print(f"PASS: describe_numeric(df, {_col!r}) correct")
    else:
        print(f"FAIL: describe_numeric(df, {_col!r}) returned {_actual!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000087', 1, 'Parse CSV Text', 'easy', 'Write parse_csv(csv_text) that parses an in-memory CSV string (already comma-separated, first line is the header) and returns its rows as a list of dicts.', 'Wrap csv_text in io.StringIO(csv_text) and pass that to pd.read_csv(); finish with .to_dict(''records'').', $py$import pandas as pd
import io


def parse_csv(csv_text):
    # TODO: parse csv_text into a DataFrame and return it as a list of row dicts
    pass
$py$, $py$import pandas as pd
import io
_cases = [
    ("name,score\nAda,88\nGrace,92\n", [{"name": "Ada", "score": 88}, {"name": "Grace", "score": 92}]),
    ("a,b\n1,2\n", [{"a": 1, "b": 2}]),
]
_passed = 0
for _text, _expected in _cases:
    _actual = parse_csv(_text)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: parse_csv(...) == {_expected!r}")
    else:
        print(f"FAIL: parse_csv(...) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000087', 2, 'DataFrame To CSV Text', 'easy', 'Write dataframe_to_csv(df) that returns df as a CSV-formatted string, WITHOUT writing the row index as a column.', 'df.to_csv(index=False) returns the CSV as a string when no path is given.', $py$def dataframe_to_csv(df):
    # TODO: return df as a CSV string, without the index column
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"a": [1, 2], "b": ["x", "y"]})
_actual = dataframe_to_csv(_df)
_expected = "a,b\n1,x\n2,y\n"
_passed = 0
_total = 2
if _actual == _expected:
    _passed += 1
    print("PASS: CSV text matches expected output exactly")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
if "Unnamed" not in _actual and not _actual.startswith(","):
    _passed += 1
    print("PASS: no stray index column written")
else:
    print("FAIL: index column leaked into the CSV text")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000087', 3, 'Parse JSON Records', 'easy', 'Write parse_json_records(json_text) that parses a JSON array of objects (a string) into a DataFrame and returns it as a list of row dicts.', 'pd.read_json(io.StringIO(json_text)) parses a JSON array of records directly.', $py$import pandas as pd
import io


def parse_json_records(json_text):
    # TODO: parse json_text into a DataFrame and return it as a list of row dicts
    pass
$py$, $py$import pandas as pd
import io
_cases = [
    ('[{"name": "Ada", "score": 88}, {"name": "Grace", "score": 92}]',
     [{"name": "Ada", "score": 88}, {"name": "Grace", "score": 92}]),
    ('[{"x": 1}]', [{"x": 1}]),
]
_passed = 0
for _text, _expected in _cases:
    _actual = parse_json_records(_text)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: parse_json_records(...) == {_expected!r}")
    else:
        print(f"FAIL: parse_json_records(...) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000087', 4, 'Load Only Some Columns', 'medium', 'Write select_columns_from_csv(csv_text, cols) that parses csv_text but loads ONLY the columns listed in `cols` (in that order), returned as a list of row dicts.', 'pd.read_csv accepts a usecols=cols keyword; the resulting DataFrame''s columns follow the file''s original order, so reindex with df[cols] before converting to records if you need cols'' order preserved.', $py$import pandas as pd
import io


def select_columns_from_csv(csv_text, cols):
    # TODO: parse csv_text loading only the given columns, in that order
    pass
$py$, $py$import pandas as pd
import io
_csv = "id,name,score,region\n1,Ada,88,US\n2,Grace,92,UK\n"
_cases = [
    (["name", "score"], [{"name": "Ada", "score": 88}, {"name": "Grace", "score": 92}]),
    (["id"], [{"id": 1}, {"id": 2}]),
]
_passed = 0
for _cols, _expected in _cases:
    _actual = select_columns_from_csv(_csv, _cols)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: select_columns_from_csv(csv, {_cols!r}) == {_expected!r}")
    else:
        print(f"FAIL: select_columns_from_csv(csv, {_cols!r}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000087', 5, 'Custom Missing-Value Tokens', 'medium', 'Write count_missing_in_csv(csv_text) that parses csv_text treating both the literal string ''NA'' and ''-'' as missing values (in addition to pandas'' usual defaults), and returns a dict mapping each column name to how many missing values it has.', 'Pass na_values=[''NA'', ''-''] to pd.read_csv, then df.isna().sum() gives per-column missing counts -- convert it with .to_dict().', $py$import pandas as pd
import io


def count_missing_in_csv(csv_text):
    # TODO: parse csv_text treating 'NA' and '-' as missing, return per-column missing counts
    pass
$py$, $py$import pandas as pd
import io
_csv = "name,score,region\nAda,88,US\nGrace,NA,UK\nAlan,79,-\n"
_actual = count_missing_in_csv(_csv)
_expected = {"name": 0, "score": 1, "region": 1}
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: count_missing_in_csv(...) == {_expected!r}")
else:
    print(f"FAIL: count_missing_in_csv(...) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000087', 6, 'DataFrame To JSON Records', 'medium', 'Write dataframe_to_json_records(df) that returns df serialized as a JSON array of records, parsed back into a plain Python list of dicts (so you can compare it without worrying about exact text formatting).', 'df.to_json(orient=''records'') gives a JSON string; json.loads() on that string gives you back a plain list of dicts.', $py$import pandas as pd
import json


def dataframe_to_json_records(df):
    # TODO: serialize df to JSON records and return it parsed back as a list of dicts
    pass
$py$, $py$import pandas as pd
import json
_df = pd.DataFrame({"name": ["Ada", "Grace"], "score": [88, 92]})
_actual = dataframe_to_json_records(_df)
_expected = [{"name": "Ada", "score": 88}, {"name": "Grace", "score": 92}]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: dataframe_to_json_records(df) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000087', 7, 'Preserve Leading Zeros', 'medium', 'Write read_zip_codes(csv_text) that parses a CSV with columns ''name'' and ''zip'', forcing the ''zip'' column to be read as a string (so leading zeros are preserved), and returns the zip codes as a list of strings.', 'Pass dtype={''zip'': str} to pd.read_csv so pandas doesn''t infer it as an int.', $py$import pandas as pd
import io


def read_zip_codes(csv_text):
    # TODO: parse csv_text keeping the 'zip' column as strings, return it as a list
    pass
$py$, $py$import pandas as pd
import io
_csv = "name,zip\nAda,02134\nGrace,94107\nAlan,00501\n"
_actual = read_zip_codes(_csv)
_expected = ["02134", "94107", "00501"]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: read_zip_codes(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000087', 8, 'Round-Trip Through CSV', 'hard', 'Write round_trip_csv(df) that writes df to a CSV string (no index column) and immediately reads it back into a new DataFrame, returning the result as a list of row dicts. Used to confirm a save/load cycle doesn''t lose data.', 'Chain df.to_csv(index=False) into io.StringIO(...) and pd.read_csv(...); finish with .to_dict(''records'').', $py$import pandas as pd
import io


def round_trip_csv(df):
    # TODO: write df to CSV text and read it straight back, return as a list of row dicts
    pass
$py$, $py$import pandas as pd
import io
_df = pd.DataFrame({"name": ["Ada", "Grace", "Alan"], "score": [88, 92, 79], "region": ["US", "UK", "US"]})
_actual = round_trip_csv(_df)
_expected = [
    {"name": "Ada", "score": 88, "region": "US"},
    {"name": "Grace", "score": 92, "region": "UK"},
    {"name": "Alan", "score": 79, "region": "US"},
]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: round_trip_csv(df) preserved all data")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000087', 9, 'Parse JSON Lines', 'hard', 'Write parse_jsonl(jsonl_text) that parses a JSON Lines string (one JSON object per line, NOT wrapped in an array) into a DataFrame, and returns it as a list of row dicts.', 'pd.read_json needs lines=True to parse one-object-per-line text instead of a single JSON array.', $py$import pandas as pd
import io


def parse_jsonl(jsonl_text):
    # TODO: parse jsonl_text (one JSON object per line) and return a list of row dicts
    pass
$py$, $py$import pandas as pd
import io
_text = '{"name": "Ada", "score": 88}\n{"name": "Grace", "score": 92}\n{"name": "Alan", "score": 79}\n'
_actual = parse_jsonl(_text)
_expected = [
    {"name": "Ada", "score": 88},
    {"name": "Grace", "score": 92},
    {"name": "Alan", "score": 79},
]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: parse_jsonl(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000088', 1, 'Filter By Threshold', 'easy', 'Write filter_by_threshold(df, col, threshold) that returns only the rows where df[col] is strictly greater than threshold, as a list of row dicts.', 'Build a boolean mask with df[col] > threshold, then index df with it: df[mask].', $py$def filter_by_threshold(df, col, threshold):
    # TODO: return rows where df[col] > threshold, as a list of dicts
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"product": ["Pen", "Mug", "Lamp", "Desk"], "price": [2.5, 9.0, 34.0, 150.0]})
_cases = [
    ("price", 10, [{"product": "Lamp", "price": 34.0}, {"product": "Desk", "price": 150.0}]),
    ("price", 200, []),
]
_passed = 0
for _col, _thresh, _expected in _cases:
    _actual = filter_by_threshold(_df, _col, _thresh)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: filter_by_threshold(df, {_col!r}, {_thresh}) == {_expected!r}")
    else:
        print(f"FAIL: filter_by_threshold(df, {_col!r}, {_thresh}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000088', 2, 'Select Specific Columns', 'easy', 'Write select_columns(df, cols) that returns only the given columns (in that order), as a list of row dicts.', 'df[cols] with cols a list selects a sub-DataFrame with just those columns.', $py$def select_columns(df, cols):
    # TODO: return only the given columns of df, as a list of dicts
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"name": ["Ada", "Grace"], "score": [88, 92], "region": ["US", "UK"]})
_cases = [
    (["name", "score"], [{"name": "Ada", "score": 88}, {"name": "Grace", "score": 92}]),
    (["region"], [{"region": "US"}, {"region": "UK"}]),
]
_passed = 0
for _cols, _expected in _cases:
    _actual = select_columns(_df, _cols)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: select_columns(df, {_cols!r}) == {_expected!r}")
    else:
        print(f"FAIL: select_columns(df, {_cols!r}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000088', 3, 'Row By Position', 'easy', 'Write get_row_by_position(df, i) that returns the i-th row (0-based, by position, regardless of the DataFrame''s index labels) as a dict.', 'df.iloc[i] gets a row by position; .to_dict() turns that row (a Series) into a dict.', $py$def get_row_by_position(df, i):
    # TODO: return the i-th row of df (by position) as a dict
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"name": ["Ada", "Grace", "Alan"], "score": [88, 92, 79]}, index=[10, 20, 30])
_cases = [(0, {"name": "Ada", "score": 88}), (2, {"name": "Alan", "score": 79})]
_passed = 0
for _i, _expected in _cases:
    _actual = get_row_by_position(_df, _i)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: get_row_by_position(df, {_i}) == {_expected!r}")
    else:
        print(f"FAIL: get_row_by_position(df, {_i}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000088', 4, 'Combine Two Conditions', 'medium', 'Write filter_multiple_conditions(df, col1, val1, col2, val2) that returns rows where df[col1] equals val1 AND df[col2] is greater than val2, as a list of row dicts.', 'Combine two boolean masks with & and wrap each comparison in its own parentheses: (df[col1] == val1) & (df[col2] > val2).', $py$def filter_multiple_conditions(df, col1, val1, col2, val2):
    # TODO: return rows where df[col1] == val1 AND df[col2] > val2
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({
    "region": ["US", "US", "UK", "US"],
    "price": [15, 5, 30, 40],
    "name": ["a", "b", "c", "d"],
})
_actual = filter_multiple_conditions(_df, "region", "US", "price", 10)
_expected = [{"region": "US", "price": 15, "name": "a"}, {"region": "US", "price": 40, "name": "d"}]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: filter_multiple_conditions(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000088', 5, 'Look Up By Label', 'medium', 'Write select_by_label(df, index_col, label) that sets `index_col` as the DataFrame''s index, then returns the row whose index equals `label`, as a dict of the REMAINING columns (index_col itself should not appear in the result).', 'df.set_index(index_col) moves that column into the index; df.loc[label] then returns the matching row.', $py$def select_by_label(df, index_col, label):
    # TODO: set index_col as the index, then look up label with .loc and return a dict
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"sku": ["A1", "A2", "A3"], "product": ["Pen", "Mug", "Lamp"], "price": [2.5, 9.0, 34.0]})
_cases = [
    ("A2", {"product": "Mug", "price": 9.0}),
    ("A3", {"product": "Lamp", "price": 34.0}),
]
_passed = 0
for _label, _expected in _cases:
    _actual = select_by_label(_df, "sku", _label)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: select_by_label(df, 'sku', {_label!r}) == {_expected!r}")
    else:
        print(f"FAIL: select_by_label(df, 'sku', {_label!r}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000088', 6, 'Filter By Membership', 'medium', 'Write filter_isin(df, col, values) that returns only the rows whose df[col] value is one of the items in the list `values`, as a list of row dicts.', 'df[col].isin(values) builds a boolean mask checking membership in a list.', $py$def filter_isin(df, col, values):
    # TODO: return rows where df[col] is one of values
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"region": ["US", "UK", "FR", "US", "DE"], "sales": [10, 20, 30, 40, 50]})
_actual = filter_isin(_df, "region", ["US", "DE"])
_expected = [{"region": "US", "sales": 10}, {"region": "US", "sales": 40}, {"region": "DE", "sales": 50}]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: filter_isin(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000088', 7, 'Top N By Column', 'medium', 'Write top_n_by_column(df, col, n) that returns the n rows with the largest values in `col`, ordered from largest to smallest, as a list of row dicts.', 'df.nlargest(n, col) sorts and slices to the top n rows in one call.', $py$def top_n_by_column(df, col, n):
    # TODO: return the top n rows by col, largest first
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"product": ["Pen", "Mug", "Lamp", "Desk"], "price": [2.5, 9.0, 34.0, 150.0]})
_actual = top_n_by_column(_df, "price", 2)
_expected = [{"product": "Desk", "price": 150.0}, {"product": "Lamp", "price": 34.0}]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: top_n_by_column(df, 'price', 2) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000088', 8, 'Positional Row Slice', 'hard', 'Write slice_rows(df, start, end) that returns rows from position `start` up to (but NOT including) position `end`, as a list of row dicts -- regardless of what the DataFrame''s index labels actually are.', 'df.iloc[start:end] slices by position like a normal Python list slice, ignoring the index labels entirely.', $py$def slice_rows(df, start, end):
    # TODO: return rows[start:end] by position, as a list of dicts
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"name": ["Ada", "Grace", "Alan", "Rosalind"], "score": [88, 92, 79, 95]}, index=[5, 6, 7, 8])
_cases = [
    (1, 3, [{"name": "Grace", "score": 92}, {"name": "Alan", "score": 79}]),
    (0, 1, [{"name": "Ada", "score": 88}]),
]
_passed = 0
for _start, _end, _expected in _cases:
    _actual = slice_rows(_df, _start, _end)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: slice_rows(df, {_start}, {_end}) == {_expected!r}")
    else:
        print(f"FAIL: slice_rows(df, {_start}, {_end}) returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000088', 9, 'Set Index And Look Up Several', 'hard', 'Write set_index_and_lookup(df, index_col, labels) that sets `index_col` as the index, then returns the rows matching the labels in the list `labels`, IN THE SAME ORDER as `labels`, as a list of dicts of the remaining columns.', 'After df.set_index(index_col), pass the whole list to .loc[labels] to select multiple rows in that exact order.', $py$def set_index_and_lookup(df, index_col, labels):
    # TODO: set index_col as index, look up each of labels in order, return as a list of dicts
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"sku": ["A1", "A2", "A3"], "product": ["Pen", "Mug", "Lamp"], "price": [2.5, 9.0, 34.0]})
_actual = set_index_and_lookup(_df, "sku", ["A3", "A1"])
_expected = [{"product": "Lamp", "price": 34.0}, {"product": "Pen", "price": 2.5}]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: set_index_and_lookup(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000089', 1, 'Count Missing Values', 'easy', 'Write count_missing(df) that returns a dict mapping each column name to how many missing (NaN) values it has.', 'df.isna() gives a same-shaped boolean DataFrame; .sum() adds True/False (1/0) down each column; .to_dict() converts the result.', $py$def count_missing(df):
    # TODO: return {column: missing_count} for every column of df
    pass
$py$, $py$import pandas as pd
import numpy as np
_df = pd.DataFrame({"name": ["Ada", "Grace", "Alan"], "score": [88, np.nan, 79], "age": [36, 40, np.nan]})
_actual = count_missing(_df)
_expected = {"name": 0, "score": 1, "age": 1}
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: count_missing(df) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000089', 2, 'Drop Any Row With Missing Data', 'easy', 'Write drop_rows_with_any_na(df) that returns df with every row that has at least one missing value removed, as a list of row dicts.', 'df.dropna() with no arguments drops a row if ANY of its columns is NaN.', $py$def drop_rows_with_any_na(df):
    # TODO: drop rows with any missing value, return the rest as a list of dicts
    pass
$py$, $py$import pandas as pd
import numpy as np
_df = pd.DataFrame({"name": ["Ada", "Grace", "Alan"], "score": [88, np.nan, 79]})
_actual = drop_rows_with_any_na(_df)
_expected = [{"name": "Ada", "score": 88.0}, {"name": "Alan", "score": 79.0}]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: drop_rows_with_any_na(df) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000089', 3, 'Fill With A Value', 'easy', 'Write fill_with_value(df, col, value) that returns df with missing values in `col` replaced by `value`, as a list of row dicts. Other columns are untouched.', 'df.fillna({col: value}) only fills the named column, leaving the rest alone.', $py$def fill_with_value(df, col, value):
    # TODO: fill missing values in df[col] with value, return as a list of dicts
    pass
$py$, $py$import pandas as pd
import numpy as np
_df = pd.DataFrame({"name": ["Ada", "Grace", "Alan"], "score": [88, np.nan, 79]})
_actual = fill_with_value(_df, "score", 0)
_expected = [{"name": "Ada", "score": 88.0}, {"name": "Grace", "score": 0.0}, {"name": "Alan", "score": 79.0}]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: fill_with_value(df, 'score', 0) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000089', 4, 'Drop Only If Key Columns Missing', 'medium', 'Write drop_rows_missing_in_columns(df, subset) that drops a row only if it has a missing value in one of the columns listed in `subset` (missing values elsewhere are fine), returned as a list of row dicts.', 'df.dropna(subset=subset) restricts which columns are checked for missing values.', $py$def drop_rows_missing_in_columns(df, subset):
    # TODO: drop rows missing data in any of the subset columns only
    pass
$py$, $py$import pandas as pd
import numpy as np
_df = pd.DataFrame({
    "name": ["Ada", "Grace", "Alan"],
    "score": [88, np.nan, 79],
    "note": ["fine", "great", "good"],
})
_actual = drop_rows_missing_in_columns(_df, ["score"])
_expected = [
    {"name": "Ada", "score": 88.0, "note": "fine"},
    {"name": "Alan", "score": 79.0, "note": "good"},
]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: drop_rows_missing_in_columns(df, ['score']) kept the right rows")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000089', 5, 'Fill With Column Mean', 'medium', 'Write fill_with_column_mean(df, col) that returns the values of df[col] as a list, with any missing value replaced by that column''s own mean (computed ignoring the missing values).', 'df[col].mean() automatically skips NaN values; use it as the fill value for df[col].fillna(...).', $py$def fill_with_column_mean(df, col):
    # TODO: fill missing values in df[col] with that column's mean, return as a list
    pass
$py$, $py$import pandas as pd
import numpy as np
_df = pd.DataFrame({"score": [80.0, np.nan, 100.0, 90.0]})
_actual = fill_with_column_mean(_df, "score")
_expected_mean = (80.0 + 100.0 + 90.0) / 3
_expected = [80.0, _expected_mean, 100.0, 90.0]
_passed = 0
_total = 1
_ok = len(_actual) == len(_expected) and all(abs(a - b) < 1e-6 for a, b in zip(_actual, _expected))
if _ok:
    _passed += 1
    print(f"PASS: fill_with_column_mean(df, 'score') == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000089', 6, 'Forward Fill', 'medium', 'Write forward_fill(df, col) that returns the values of df[col] as a list, with each missing value replaced by the last valid (non-missing) value before it.', 'df[col].ffill() carries the last valid observation forward into any following NaNs.', $py$def forward_fill(df, col):
    # TODO: forward-fill missing values in df[col], return as a list
    pass
$py$, $py$import pandas as pd
import numpy as np
_df = pd.DataFrame({"reading": [10.0, np.nan, np.nan, 20.0, np.nan]})
_actual = forward_fill(_df, "reading")
_expected = [10.0, 10.0, 10.0, 20.0, 20.0]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: forward_fill(df, 'reading') == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000089', 7, 'Drop Mostly-Empty Columns', 'medium', 'Write drop_columns_mostly_missing(df, thresh) that removes any column with fewer than `thresh` NON-missing values, returning the list of column names that were KEPT.', 'df.dropna(axis=1, thresh=thresh) drops columns; thresh is the minimum number of non-NaN values required to keep a column.', $py$def drop_columns_mostly_missing(df, thresh):
    # TODO: drop columns with fewer than thresh non-missing values, return the kept column names
    pass
$py$, $py$import pandas as pd
import numpy as np
_df = pd.DataFrame({
    "a": [1, 2, 3, 4],
    "b": [1, np.nan, np.nan, np.nan],
    "c": [1, 2, np.nan, 4],
})
_actual = drop_columns_mostly_missing(_df, 3)
_expected = ["a", "c"]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: drop_columns_mostly_missing(df, 3) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000089', 8, 'Fill With Group Mean', 'hard', 'Write fill_grouped_mean(df, group_col, value_col) that returns the values of df[value_col] as a list, with missing values filled using the MEAN OF value_col WITHIN THAT ROW''S OWN group_col GROUP (not the overall mean).', 'df.groupby(group_col)[value_col].transform(''mean'') gives a same-length Series of each row''s group mean; use it as the fill value for value_col.fillna(...).', $py$def fill_grouped_mean(df, group_col, value_col):
    # TODO: fill missing value_col entries using each row's own group's mean
    pass
$py$, $py$import pandas as pd
import numpy as np
_df = pd.DataFrame({
    "team": ["red", "red", "red", "blue", "blue"],
    "score": [10.0, np.nan, 20.0, 5.0, np.nan],
})
_actual = fill_grouped_mean(_df, "team", "score")
_expected = [10.0, 15.0, 20.0, 5.0, 5.0]
_passed = 0
_total = 1
_ok = len(_actual) == len(_expected) and all(abs(a - b) < 1e-6 for a, b in zip(_actual, _expected))
if _ok:
    _passed += 1
    print(f"PASS: fill_grouped_mean(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000089', 9, 'Missing Data Report', 'hard', 'Write missing_data_report(df) that returns a dict mapping each column name to the PERCENTAGE (0-100) of its values that are missing, rounded to 1 decimal place.', 'df.isna().mean() gives the fraction missing per column (mean of a boolean is the fraction True); multiply by 100 and round.', $py$def missing_data_report(df):
    # TODO: return {column: pct_missing} rounded to 1 decimal place, for every column
    pass
$py$, $py$import pandas as pd
import numpy as np
_df = pd.DataFrame({
    "a": [1, 2, 3, 4],
    "b": [1, np.nan, np.nan, 4],
    "c": [np.nan, np.nan, np.nan, np.nan],
})
_actual = missing_data_report(_df)
_expected = {"a": 0.0, "b": 50.0, "c": 100.0}
_passed = 0
_total = 1
_ok = isinstance(_actual, dict) and set(_actual) == set(_expected) and all(
    abs(_actual[k] - _expected[k]) < 1e-6 for k in _expected
)
if _ok:
    _passed += 1
    print(f"PASS: missing_data_report(df) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000090', 1, 'Sum By Group', 'easy', 'Write group_sum(df, group_col, value_col) that returns a dict mapping each group_col value to the sum of value_col within that group.', 'df.groupby(group_col)[value_col].sum() gives a Series indexed by group; .to_dict() converts it.', $py$def group_sum(df, group_col, value_col):
    # TODO: return {group: sum_of_value} for every group in group_col
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"region": ["US", "US", "UK", "UK"], "sales": [100, 150, 80, 120]})
_actual = group_sum(_df, "region", "sales")
_expected = {"US": 250, "UK": 200}
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: group_sum(df, 'region', 'sales') == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000090', 2, 'Count Rows Per Group', 'easy', 'Write group_count(df, group_col) that returns a dict mapping each group_col value to how many rows belong to it.', 'df.groupby(group_col).size() counts rows per group; .to_dict() converts it.', $py$def group_count(df, group_col):
    # TODO: return {group: row_count} for every group in group_col
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"team": ["red", "red", "blue", "red", "blue"]})
_actual = group_count(_df, "team")
_expected = {"red": 3, "blue": 2}
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: group_count(df, 'team') == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000090', 3, 'Average By Group', 'easy', 'Write group_mean(df, group_col, value_col) that returns a dict mapping each group_col value to the average of value_col within that group.', 'df.groupby(group_col)[value_col].mean().to_dict() -- means are floats, so tests compare with a tolerance.', $py$def group_mean(df, group_col, value_col):
    # TODO: return {group: average_of_value} for every group in group_col
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"team": ["red", "red", "blue", "blue"], "score": [10, 20, 5, 15]})
_actual = group_mean(_df, "team", "score")
_expected = {"red": 15.0, "blue": 10.0}
_passed = 0
_total = 1
_ok = isinstance(_actual, dict) and set(_actual) == set(_expected) and all(
    abs(_actual[k] - _expected[k]) < 1e-6 for k in _expected
)
if _ok:
    _passed += 1
    print(f"PASS: group_mean(df, 'team', 'score') == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000090', 4, 'Multiple Aggregations At Once', 'medium', 'Write group_multiple_agg(df, group_col, value_col) that returns a dict mapping each group to a nested dict with keys ''sum'' and ''mean'' of value_col within that group.', 'df.groupby(group_col)[value_col].agg([''sum'', ''mean'']) returns a DataFrame indexed by group with ''sum'' and ''mean'' columns; .to_dict(''index'') turns each row into a nested dict.', $py$def group_multiple_agg(df, group_col, value_col):
    # TODO: return {group: {"sum": ..., "mean": ...}} for every group
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"team": ["red", "red", "blue", "blue"], "score": [10, 20, 5, 15]})
_actual = group_multiple_agg(_df, "team", "score")
_expected = {"red": {"sum": 30, "mean": 15.0}, "blue": {"sum": 20, "mean": 10.0}}
_passed = 0
_total = 1
_ok = isinstance(_actual, dict) and set(_actual) == set(_expected)
if _ok:
    for k in _expected:
        if abs(_actual[k]["sum"] - _expected[k]["sum"]) >= 1e-6 or abs(_actual[k]["mean"] - _expected[k]["mean"]) >= 1e-6:
            _ok = False
if _ok:
    _passed += 1
    print(f"PASS: group_multiple_agg(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000090', 5, 'Group By Multiple Keys', 'medium', 'Write group_by_multiple_keys(df, keys, value_col) that groups by ALL of the columns listed in `keys` together, sums value_col within each combination, and returns the result as a list of row dicts (with the key columns back as normal columns, not the index).', 'df.groupby(keys)[value_col].sum() then .reset_index() turns the multi-level group index back into normal columns.', $py$def group_by_multiple_keys(df, keys, value_col):
    # TODO: group by all of keys, sum value_col, return as a list of row dicts
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({
    "region": ["US", "US", "US", "UK"],
    "product": ["Pen", "Pen", "Mug", "Pen"],
    "sales": [10, 20, 5, 15],
})
_actual = group_by_multiple_keys(_df, ["region", "product"], "sales")
_expected = [
    {"region": "UK", "product": "Pen", "sales": 15},
    {"region": "US", "product": "Mug", "sales": 5},
    {"region": "US", "product": "Pen", "sales": 30},
]
_actual_sorted = sorted(_actual, key=lambda r: (r["region"], r["product"]))
_passed = 0
_total = 1
if _actual_sorted == _expected:
    _passed += 1
    print(f"PASS: group_by_multiple_keys(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual_sorted!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000090', 6, 'Named Aggregation', 'medium', 'Write named_aggregation(df, group_col, value_col) that groups by group_col and returns a list of row dicts with columns [group_col, ''total'', ''average''], where ''total'' is the sum and ''average'' is the mean of value_col in that group.', 'df.groupby(group_col).agg(total=(value_col, ''sum''), average=(value_col, ''mean'')).reset_index() builds exactly those named columns.', $py$def named_aggregation(df, group_col, value_col):
    # TODO: return rows with [group_col, 'total', 'average'] using named aggregation
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"team": ["red", "red", "blue", "blue"], "score": [10, 20, 5, 15]})
_actual = named_aggregation(_df, "team", "score")
_expected = {"red": {"total": 30, "average": 15.0}, "blue": {"total": 20, "average": 10.0}}
_passed = 0
_total = 1
_ok = isinstance(_actual, list) and len(_actual) == 2
if _ok:
    by_team = {row["team"]: row for row in _actual}
    _ok = set(by_team) == set(_expected)
    if _ok:
        for k in _expected:
            if abs(by_team[k]["total"] - _expected[k]["total"]) >= 1e-6 or abs(by_team[k]["average"] - _expected[k]["average"]) >= 1e-6:
                _ok = False
if _ok:
    _passed += 1
    print(f"PASS: named_aggregation(...) correct")
else:
    print(f"FAIL: got {_actual!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000090', 7, 'Most Frequent Values', 'medium', 'Write value_counts_top(df, col, n) that returns a dict mapping the n most frequent values in df[col] to their counts, most frequent first (dict insertion order matters here).', 'df[col].value_counts() is already sorted from most to least frequent; .head(n).to_dict() keeps the order.', $py$def value_counts_top(df, col, n):
    # TODO: return the n most frequent values in df[col] mapped to their counts
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"fruit": ["apple", "apple", "banana", "banana", "banana", "cherry"]})
_actual = value_counts_top(_df, "fruit", 2)
_expected_keys_in_order = ["banana", "apple"]
_expected = {"banana": 3, "apple": 2}
_passed = 0
_total = 2
if _actual == _expected:
    _passed += 1
    print(f"PASS: value_counts_top(df, 'fruit', 2) counts == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
if list(_actual.keys()) == _expected_keys_in_order:
    _passed += 1
    print(f"PASS: most frequent value listed first")
else:
    print(f"FAIL: key order was {list(_actual.keys())!r}, expected {_expected_keys_in_order!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000090', 8, 'Center Values Within Group', 'hard', 'Write group_transform_normalize(df, group_col, value_col) that returns a list (same length and order as the original DataFrame) where each value is that row''s value_col MINUS the mean of value_col within its own group_col group.', 'df.groupby(group_col)[value_col].transform(''mean'') returns one group-mean per ORIGINAL row (not collapsed); subtract it from df[value_col] directly.', $py$def group_transform_normalize(df, group_col, value_col):
    # TODO: return value_col minus its own group's mean, for every row, in original order
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"team": ["red", "red", "blue", "blue"], "score": [10.0, 20.0, 5.0, 15.0]})
_actual = group_transform_normalize(_df, "team", "score")
_expected = [-5.0, 5.0, -5.0, 5.0]
_passed = 0
_total = 1
_ok = len(_actual) == len(_expected) and all(abs(a - b) < 1e-6 for a, b in zip(_actual, _expected))
if _ok:
    _passed += 1
    print(f"PASS: group_transform_normalize(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000090', 9, 'Pivot Table Sum', 'hard', 'Write pivot_table_sum(df, index_col, columns_col, values_col) that builds a pivot table: rows are the unique values of index_col, columns are the unique values of columns_col, cell values are the sum of values_col for that combination (0 where there''s no data). Return it as a nested dict {index_value: {column_value: sum}}.', 'pd.pivot_table(df, index=index_col, columns=columns_col, values=values_col, aggfunc=''sum'', fill_value=0) builds exactly this table; .to_dict(''index'') converts it to a nested dict.', $py$import pandas as pd


def pivot_table_sum(df, index_col, columns_col, values_col):
    # TODO: build a pivot table of summed values_col, missing combos as 0
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({
    "region": ["US", "US", "UK"],
    "product": ["Pen", "Mug", "Pen"],
    "sales": [10, 20, 5],
})
_actual = pivot_table_sum(_df, "region", "product", "sales")
_expected = {"UK": {"Mug": 0, "Pen": 5}, "US": {"Mug": 20, "Pen": 10}}
_passed = 0
_total = 1
_ok = isinstance(_actual, dict) and set(_actual) == set(_expected)
if _ok:
    for r in _expected:
        if set(_actual[r]) != set(_expected[r]) or any(
            abs(_actual[r][p] - _expected[r][p]) >= 1e-6 for p in _expected[r]
        ):
            _ok = False
if _ok:
    _passed += 1
    print(f"PASS: pivot_table_sum(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000091', 1, 'Inner Merge', 'easy', 'Write inner_merge(df1, df2, key) that returns the inner join of df1 and df2 on `key`, as a list of row dicts.', 'pd.merge(df1, df2, on=key) defaults to an inner join, keeping only rows with a match on both sides.', $py$import pandas as pd


def inner_merge(df1, df2, key):
    # TODO: return the inner join of df1 and df2 on key, as a list of dicts
    pass
$py$, $py$import pandas as pd
_orders = pd.DataFrame({"order_id": [1, 2, 3], "customer_id": [10, 20, 99], "amount": [50, 30, 20]})
_customers = pd.DataFrame({"customer_id": [10, 20], "name": ["Ada", "Grace"]})
_actual = inner_merge(_orders, _customers, "customer_id")
_expected = [
    {"order_id": 1, "customer_id": 10, "amount": 50, "name": "Ada"},
    {"order_id": 2, "customer_id": 20, "amount": 30, "name": "Grace"},
]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: inner_merge(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000091', 2, 'Left Merge', 'easy', 'Write left_merge(df1, df2, key) that returns a LEFT join of df1 with df2 on `key` -- every row of df1 is kept, with columns from df2 filled as None/NaN where there''s no match. Return as a list of row dicts.', 'pd.merge(df1, df2, on=key, how=''left'') keeps every row from df1.', $py$import pandas as pd


def left_merge(df1, df2, key):
    # TODO: return the left join of df1 with df2 on key, as a list of dicts
    pass
$py$, $py$import pandas as pd
_orders = pd.DataFrame({"order_id": [1, 2, 3], "customer_id": [10, 20, 99], "amount": [50, 30, 20]})
_customers = pd.DataFrame({"customer_id": [10, 20], "name": ["Ada", "Grace"]})
_actual = left_merge(_orders, _customers, "customer_id")
_passed = 0
_total = 2
if len(_actual) == 3:
    _passed += 1
    print("PASS: all 3 order rows kept")
else:
    print(f"FAIL: got {len(_actual)} rows, expected 3")
_row99 = next((r for r in _actual if r["order_id"] == 3), None)
if _row99 is not None and pd.isna(_row99["name"]):
    _passed += 1
    print("PASS: unmatched customer_id 99 has a missing name")
else:
    print(f"FAIL: order_id 3's row was {_row99!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000091', 3, 'Stack Two Tables', 'easy', 'Write concat_rows(df1, df2) that stacks df1 and df2 on top of each other (same columns) into one DataFrame with a fresh 0-based index, returned as a list of row dicts.', 'pd.concat([df1, df2], ignore_index=True) stacks the rows and renumbers the index from scratch.', $py$import pandas as pd


def concat_rows(df1, df2):
    # TODO: stack df1 and df2's rows together with a fresh index, return as a list of dicts
    pass
$py$, $py$import pandas as pd
_df1 = pd.DataFrame({"name": ["Ada", "Grace"], "score": [88, 92]})
_df2 = pd.DataFrame({"name": ["Alan"], "score": [79]})
_actual = concat_rows(_df1, _df2)
_expected = [{"name": "Ada", "score": 88}, {"name": "Grace", "score": 92}, {"name": "Alan", "score": 79}]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: concat_rows(df1, df2) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000091', 4, 'Outer Merge With Indicator', 'medium', 'Write outer_merge_with_indicator(df1, df2, key) that performs an OUTER join of df1 and df2 on `key`, adding a column named ''_merge'' showing whether each row came from ''left_only'', ''right_only'', or ''both''. Return as a list of row dicts, with ''_merge'' values converted to plain strings.', 'pd.merge(df1, df2, on=key, how=''outer'', indicator=True) adds the ''_merge'' column automatically; cast it to str with .astype(str) before converting to records.', $py$import pandas as pd


def outer_merge_with_indicator(df1, df2, key):
    # TODO: outer join with an indicator column, return as a list of dicts
    pass
$py$, $py$import pandas as pd
_df1 = pd.DataFrame({"id": [1, 2], "v": [10, 20]})
_df2 = pd.DataFrame({"id": [2, 3], "w": [200, 300]})
_actual = outer_merge_with_indicator(_df1, _df2, "id")
_by_id = {row["id"]: row["_merge"] for row in _actual}
_expected = {1: "left_only", 2: "both", 3: "right_only"}
_passed = 0
_total = 2
if len(_actual) == 3:
    _passed += 1
    print("PASS: outer join kept all 3 combined rows")
else:
    print(f"FAIL: got {len(_actual)} rows, expected 3")
if _by_id == _expected:
    _passed += 1
    print(f"PASS: _merge indicator values correct: {_expected!r}")
else:
    print(f"FAIL: got {_by_id!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000091', 5, 'Merge With Custom Suffixes', 'medium', 'Write merge_with_suffixes(df1, df2, key, suffixes) that merges df1 and df2 on `key`, using `suffixes` (a 2-tuple) for any overlapping non-key column names. Return the resulting column names as a list, in order.', 'pd.merge(df1, df2, on=key, suffixes=suffixes) applies your chosen suffixes instead of the default ''_x''/''_y''.', $py$import pandas as pd


def merge_with_suffixes(df1, df2, key, suffixes):
    # TODO: merge on key with custom suffixes, return the resulting column names
    pass
$py$, $py$import pandas as pd
_df1 = pd.DataFrame({"id": [1, 2], "value": [10, 20]})
_df2 = pd.DataFrame({"id": [1, 2], "value": [100, 200]})
_actual = merge_with_suffixes(_df1, _df2, "id", ("_orders", "_customers"))
_expected = ["id", "value_orders", "value_customers"]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: merge_with_suffixes(...) columns == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000091', 6, 'Concatenate Columns Side By Side', 'medium', 'Write concat_columns(df1, df2) that places df1''s and df2''s columns side by side (no key matching, just aligned by position/index) into one wider DataFrame, returned as a list of row dicts.', 'pd.concat([df1, df2], axis=1) stacks columns instead of rows.', $py$import pandas as pd


def concat_columns(df1, df2):
    # TODO: place df1 and df2's columns side by side, return as a list of dicts
    pass
$py$, $py$import pandas as pd
_df1 = pd.DataFrame({"name": ["Ada", "Grace"]})
_df2 = pd.DataFrame({"score": [88, 92]})
_actual = concat_columns(_df1, _df2)
_expected = [{"name": "Ada", "score": 88}, {"name": "Grace", "score": 92}]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: concat_columns(df1, df2) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000091', 7, 'Merge On Differently-Named Keys', 'medium', 'Write merge_different_key_names(df1, df2, left_key, right_key) that merges df1 and df2 where the join key is called `left_key` in df1 and `right_key` in df2, returned as a list of row dicts.', 'pd.merge(df1, df2, left_on=left_key, right_on=right_key) handles differently-named keys.', $py$import pandas as pd


def merge_different_key_names(df1, df2, left_key, right_key):
    # TODO: merge df1 and df2 using differently-named keys, return as a list of dicts
    pass
$py$, $py$import pandas as pd
_orders = pd.DataFrame({"order_id": [1, 2], "cust_id": [10, 20], "amount": [50, 30]})
_customers = pd.DataFrame({"id": [10, 20], "name": ["Ada", "Grace"]})
_actual = merge_different_key_names(_orders, _customers, "cust_id", "id")
_expected = [
    {"order_id": 1, "cust_id": 10, "amount": 50, "id": 10, "name": "Ada"},
    {"order_id": 2, "cust_id": 20, "amount": 30, "id": 20, "name": "Grace"},
]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: merge_different_key_names(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000091', 8, 'Merge Then Aggregate', 'hard', 'Write many_to_one_merge_sum(orders_df, customers_df, key) that merges orders_df (many rows per customer) with customers_df (one row per customer) on `key`, then returns a dict mapping each customer''s ''name'' to their TOTAL ''amount'' across all their orders.', 'Merge first (an inner join on key works), then groupby(''name'')[''amount''].sum().to_dict().', $py$import pandas as pd


def many_to_one_merge_sum(orders_df, customers_df, key):
    # TODO: merge orders with customers on key, then return {name: total_amount}
    pass
$py$, $py$import pandas as pd
_orders = pd.DataFrame({"order_id": [1, 2, 3], "customer_id": [10, 10, 20], "amount": [50, 30, 20]})
_customers = pd.DataFrame({"customer_id": [10, 20], "name": ["Ada", "Grace"]})
_actual = many_to_one_merge_sum(_orders, _customers, "customer_id")
_expected = {"Ada": 80, "Grace": 20}
_passed = 0
_total = 1
_ok = isinstance(_actual, dict) and set(_actual) == set(_expected) and all(
    abs(_actual[k] - _expected[k]) < 1e-6 for k in _expected
)
if _ok:
    _passed += 1
    print(f"PASS: many_to_one_merge_sum(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000091', 9, 'Join On The Index', 'hard', 'Write join_on_index(df1, df2, key) that sets `key` as the index on BOTH df1 and df2, joins them on that shared index (keeping every row of df1, like a left join), and returns the result as a list of row dicts (key back as a normal column).', 'After df1.set_index(key) and df2.set_index(key), df1.join(df2) aligns rows by their shared index; .reset_index() puts key back as a column.', $py$import pandas as pd


def join_on_index(df1, df2, key):
    # TODO: set key as the index on both, join df1 with df2, return as a list of dicts
    pass
$py$, $py$import pandas as pd
_orders = pd.DataFrame({"customer_id": [10, 20, 30], "amount": [50, 30, 20]})
_extra = pd.DataFrame({"customer_id": [10, 20], "vip": [True, False]})
_actual = join_on_index(_orders, _extra, "customer_id")
_by_id = {row["customer_id"]: row for row in _actual}
_passed = 0
_total = 2
if len(_actual) == 3:
    _passed += 1
    print("PASS: all 3 rows from df1 kept")
else:
    print(f"FAIL: got {len(_actual)} rows, expected 3")
if _by_id.get(10, {}).get("vip") == True and _by_id.get(20, {}).get("vip") == False and pd.isna(_by_id.get(30, {}).get("vip")):
    _passed += 1
    print("PASS: vip values joined correctly, missing for customer 30")
else:
    print(f"FAIL: joined rows were {_actual!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000092', 1, 'Ratio Column', 'easy', 'Write add_ratio_column(df, col_a, col_b, new_col) that returns df with a new column new_col equal to df[col_a] divided by df[col_b], as a list of floats (in row order).', 'Plain division between two columns, df[col_a] / df[col_b], is already vectorized -- no loop needed.', $py$def add_ratio_column(df, col_a, col_b, new_col):
    # TODO: add new_col = col_a / col_b to df, return that column as a list
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"price": [10.0, 25.0, 100.0], "cost": [5.0, 25.0, 40.0]})
_actual = add_ratio_column(_df, "price", "cost", "markup")
_expected = [2.0, 1.0, 2.5]
_passed = 0
_total = 1
_ok = len(_actual) == len(_expected) and all(abs(a - b) < 1e-6 for a, b in zip(_actual, _expected))
if _ok:
    _passed += 1
    print(f"PASS: add_ratio_column(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000092', 2, 'Map Values To New Column', 'easy', 'Write apply_map_column(df, col, mapping, new_col) that returns df with a new column new_col, where each value is mapping[value] looked up from df[col]. Return the whole DataFrame as a list of row dicts.', 'df[col].map(mapping) looks up each value in the dict mapping in one vectorized call.', $py$def apply_map_column(df, col, mapping, new_col):
    # TODO: add new_col = df[col] mapped through mapping, return df as a list of dicts
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"grade": ["A", "B", "A", "C"]})
_actual = apply_map_column(_df, "grade", {"A": 4, "B": 3, "C": 2}, "gpa")
_expected = [
    {"grade": "A", "gpa": 4}, {"grade": "B", "gpa": 3},
    {"grade": "A", "gpa": 4}, {"grade": "C", "gpa": 2},
]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: apply_map_column(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000092', 3, 'String Length Column', 'easy', 'Write string_length_column(df, col) that returns a list with the character length of each value in the text column df[col].', 'The .str accessor gives vectorized string operations: df[col].str.len().', $py$def string_length_column(df, col):
    # TODO: return the character length of each value in df[col], as a list
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"name": ["Ada", "Grace", "Al"]})
_actual = string_length_column(_df, "name")
_expected = [3, 5, 2]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: string_length_column(df, 'name') == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000092', 4, 'Bin A Continuous Column', 'medium', 'Write bin_column(df, col, bins, labels) that bins df[col] into the ranges defined by `bins` (edges), naming each bin with the corresponding entry in `labels`, and returns the bin label for each row as a list of strings.', 'pd.cut(df[col], bins=bins, labels=labels) does the binning; convert the resulting Categorical to plain strings with .astype(str).', $py$import pandas as pd


def bin_column(df, col, bins, labels):
    # TODO: bin df[col] using bins/labels, return each row's bin label as a list of strings
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"price": [5, 15, 25, 45]})
_actual = bin_column(_df, "price", [0, 10, 20, 50], ["low", "mid", "high"])
_expected = ["low", "mid", "high", "high"]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: bin_column(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000092', 5, 'One-Hot Encode A Column', 'medium', 'Write one_hot_encode(df, col) that one-hot encodes df[col] and returns the list of resulting column names, sorted alphabetically (the original col is replaced by one column per category).', 'pd.get_dummies(df, columns=[col]) replaces col with one boolean column per category; sort the resulting .columns.tolist().', $py$import pandas as pd


def one_hot_encode(df, col):
    # TODO: one-hot encode df[col], return the resulting column names sorted alphabetically
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"id": [1, 2, 3], "category": ["A", "B", "A"]})
_actual = one_hot_encode(_df, "category")
_expected = sorted(["id", "category_A", "category_B"])
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: one_hot_encode(df, 'category') columns == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000092', 6, 'Extract Date Parts', 'medium', 'Write extract_date_parts(df, date_col) that converts df[date_col] (strings like ''2024-03-15'') to real dates and returns a list of (year, month, day) tuples.', 'pd.to_datetime(df[date_col]) parses the strings; the result has .dt.year, .dt.month, .dt.day.', $py$import pandas as pd


def extract_date_parts(df, date_col):
    # TODO: parse df[date_col] as dates, return a list of (year, month, day) tuples
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"launch_date": ["2024-01-15", "2023-11-02"]})
_actual = extract_date_parts(_df, "launch_date")
_actual = [tuple(t) for t in _actual]
_expected = [(2024, 1, 15), (2023, 11, 2)]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: extract_date_parts(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000092', 7, 'Min-Max Normalize A Column', 'medium', 'Write normalize_column(df, col) that returns df[col] rescaled to the 0-1 range using min-max scaling: (x - min) / (max - min), as a list of floats.', 'Compute col_min = df[col].min() and col_max = df[col].max() once, then apply (df[col] - col_min) / (col_max - col_min) to the whole column at once.', $py$def normalize_column(df, col):
    # TODO: min-max scale df[col] to the 0-1 range, return as a list
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"score": [0.0, 50.0, 100.0]})
_actual = normalize_column(_df, "score")
_expected = [0.0, 0.5, 1.0]
_passed = 0
_total = 1
_ok = len(_actual) == len(_expected) and all(abs(a - b) < 1e-6 for a, b in zip(_actual, _expected))
if _ok:
    _passed += 1
    print(f"PASS: normalize_column(df, 'score') == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000092', 8, 'Weighted Score From Multiple Columns', 'hard', 'Write weighted_score(df, weights) that computes, for each row, the weighted sum of the columns named in the dict `weights` (column name -> weight), and returns the result as a list of floats.', 'Start an accumulator Series of zeros (0.0 broadcasts against df''s index), then add weight * df[col] for each column in weights -- fully vectorized, no row loop needed.', $py$def weighted_score(df, weights):
    # TODO: return the weighted sum across the given columns, per row, as a list
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"quality": [8.0, 5.0], "price_score": [6.0, 9.0]})
_actual = weighted_score(_df, {"quality": 0.7, "price_score": 0.3})
_expected = [8.0 * 0.7 + 6.0 * 0.3, 5.0 * 0.7 + 9.0 * 0.3]
_passed = 0
_total = 1
_ok = len(_actual) == len(_expected) and all(abs(a - b) < 1e-6 for a, b in zip(_actual, _expected))
if _ok:
    _passed += 1
    print(f"PASS: weighted_score(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000092', 9, 'Bucket And Count', 'hard', 'Write bucket_and_count(df, col, bins, labels) that bins df[col] using `bins`/`labels` (like pd.cut) and returns a dict mapping each label to how many rows fell into that bucket, IN THE SAME ORDER as `labels` (even buckets with 0 rows must appear).', 'pd.cut(...).value_counts() counts per bucket but may reorder or drop empty ones; reindex the result with labels to force the order (and fill_value=0 for empty buckets).', $py$import pandas as pd


def bucket_and_count(df, col, bins, labels):
    # TODO: bin df[col] and count rows per bucket, in the order given by labels
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"price": [5, 15, 15, 45]})
_actual = bucket_and_count(_df, "price", [0, 10, 20, 50], ["low", "mid", "high"])
_expected = {"low": 1, "mid": 2, "high": 1}
_passed = 0
_total = 3
if _actual == _expected:
    _passed += 1
    print(f"PASS: bucket_and_count(...) counts == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
if list(_actual.keys()) == ["low", "mid", "high"]:
    _passed += 1
    print("PASS: bucket order matches labels order")
else:
    print(f"FAIL: key order was {list(_actual.keys())!r}")

_df2 = pd.DataFrame({"price": [5, 5]})
_actual2 = bucket_and_count(_df2, "price", [0, 10, 20, 50], ["low", "mid", "high"])
if _actual2 == {"low": 2, "mid": 0, "high": 0}:
    _passed += 1
    print("PASS: empty buckets still appear with count 0")
else:
    print(f"FAIL (empty-bucket case): got {_actual2!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000093', 1, 'Summary Statistics', 'easy', 'Write summary_stats(df, col) that returns a dict with keys ''count'', ''mean'', ''min'', ''max'' describing df[col].', 'df[col].count()/.mean()/.min()/.max() give the four pieces; mean is a float so compare with a tolerance.', $py$def summary_stats(df, col):
    # TODO: return {"count":..., "mean":..., "min":..., "max":...} for df[col]
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"sales": [100.0, 80.0, 120.0, 90.0]})
_actual = summary_stats(_df, "sales")
_passed = 0
_total = 1
_ok = (
    isinstance(_actual, dict)
    and _actual.get("count") == 4
    and abs(_actual.get("mean", 0) - 97.5) < 1e-6
    and abs(_actual.get("min", 0) - 80.0) < 1e-6
    and abs(_actual.get("max", 0) - 120.0) < 1e-6
)
if _ok:
    _passed += 1
    print("PASS: summary_stats(df, 'sales') correct")
else:
    print(f"FAIL: got {_actual!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000093', 2, 'Correlation Between Two Columns', 'easy', 'Write correlation_between(df, col1, col2) that returns the Pearson correlation coefficient between df[col1] and df[col2] as a float.', 'df[col1].corr(df[col2]) computes it directly.', $py$def correlation_between(df, col1, col2):
    # TODO: return the correlation coefficient between df[col1] and df[col2]
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"x": [1, 2, 3, 4, 5], "y": [2, 4, 6, 8, 10]})
_actual = correlation_between(_df, "x", "y")
_expected = 1.0
_passed = 0
_total = 1
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: correlation_between(df, 'x', 'y') == {_expected}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000093', 3, 'Load And Clean A CSV', 'easy', 'Write clean_dataset(csv_text) that parses csv_text, drops any row with a missing value, and returns the result as a list of row dicts.', 'pd.read_csv(io.StringIO(csv_text)).dropna() -- load, then clean, in two chained calls.', $py$import pandas as pd
import io


def clean_dataset(csv_text):
    # TODO: parse csv_text, drop rows with any missing value, return as a list of dicts
    pass
$py$, $py$import pandas as pd
import io
_csv = "name,score\nAda,88\nGrace,\nAlan,79\n"
_actual = clean_dataset(_csv)
_expected = [{"name": "Ada", "score": 88.0}, {"name": "Alan", "score": 79.0}]
_passed = 0
_total = 1
if _actual == _expected:
    _passed += 1
    print(f"PASS: clean_dataset(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000093', 4, 'Full Pipeline: Load, Clean, Aggregate', 'medium', 'Write full_pipeline_average_by_category(csv_text, cat_col, val_col) that parses csv_text, drops rows missing val_col, then returns a dict mapping each cat_col value to the average val_col within it.', 'Chain pd.read_csv(io.StringIO(...)), .dropna(subset=[val_col]), .groupby(cat_col)[val_col].mean(), .to_dict().', $py$import pandas as pd
import io


def full_pipeline_average_by_category(csv_text, cat_col, val_col):
    # TODO: load, drop missing val_col rows, group by cat_col, return average val_col per group
    pass
$py$, $py$import pandas as pd
import io
_csv = "region,sales\nUS,100\nUS,\nUK,80\nUK,120\n"
_actual = full_pipeline_average_by_category(_csv, "region", "sales")
_expected = {"US": 100.0, "UK": 100.0}
_passed = 0
_total = 1
_ok = isinstance(_actual, dict) and set(_actual) == set(_expected) and all(
    abs(_actual[k] - _expected[k]) < 1e-6 for k in _expected
)
if _ok:
    _passed += 1
    print(f"PASS: full_pipeline_average_by_category(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000093', 5, 'Detect Outliers With IQR', 'medium', 'Write detect_outliers_iqr(df, col) that returns a sorted list of the values in df[col] that fall below Q1 - 1.5*IQR or above Q3 + 1.5*IQR, where Q1/Q3 are the 25th/75th percentiles and IQR = Q3 - Q1.', 'df[col].quantile(0.25) and .quantile(0.75) give Q1/Q3; build the two bounds, then filter and sort.', $py$def detect_outliers_iqr(df, col):
    # TODO: return sorted outlier values in df[col] using the 1.5*IQR rule
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"value": [10, 12, 11, 13, 12, 11, 100, -50]})
_actual = detect_outliers_iqr(_df, "value")
_expected = [-50, 100]
_passed = 0
_total = 1
_ok = len(_actual) == len(_expected) and all(abs(a - b) < 1e-6 for a, b in zip(sorted(_actual), _expected))
if _ok:
    _passed += 1
    print(f"PASS: detect_outliers_iqr(df, 'value') == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000093', 6, 'Standardize A Column (Z-Score)', 'medium', 'Write standardize_column(df, col) that returns df[col] converted to z-scores: (x - mean) / std, as a list of floats.', 'Compute the column''s mean and standard deviation once with .mean()/.std(), then apply the formula to the whole column at once.', $py$def standardize_column(df, col):
    # TODO: return df[col] as z-scores (x - mean) / std
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({"score": [10.0, 20.0, 30.0, 40.0]})
_mean = _df["score"].mean()
_std = _df["score"].std()
_expected = [(x - _mean) / _std for x in _df["score"]]
_actual = standardize_column(_df, "score")
_passed = 0
_total = 1
_ok = len(_actual) == len(_expected) and all(abs(a - b) < 1e-6 for a, b in zip(_actual, _expected))
if _ok:
    _passed += 1
    print(f"PASS: standardize_column(df, 'score') correct")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000093', 7, 'Most Correlated Pair', 'medium', 'Write top_correlated_pairs(df) that looks at ALL pairs of numeric columns in df and returns a tuple (col_a, col_b) for the pair with the highest absolute correlation, excluding a column''s correlation with itself. If there''s a tie, return the pair that comes first in df.columns order.', 'df.corr(numeric_only=True) gives the full correlation matrix; walk over each unordered pair of columns, skipping a column against itself, and track the max by absolute value.', $py$def top_correlated_pairs(df):
    # TODO: return the (col_a, col_b) pair of numeric columns with the highest abs(correlation)
    pass
$py$, $py$import pandas as pd
_df = pd.DataFrame({
    "a": [1, 2, 3, 4, 5],
    "b": [2, 4, 6, 8, 10],
    "c": [5, 3, 4, 1, 2],
})
_actual = top_correlated_pairs(_df)
_passed = 0
_total = 1
if set(_actual) == {"a", "b"}:
    _passed += 1
    print(f"PASS: top_correlated_pairs(df) == {_actual!r} (a & b are perfectly correlated)")
else:
    print(f"FAIL: got {_actual!r}, expected the pair ('a', 'b') in some order")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000093', 8, 'Full EDA Report', 'hard', 'Write full_eda_report(csv_text) that parses csv_text (columns ''region'' and ''sales'', some ''sales'' values missing), and returns a dict with: ''missing_sales'' (count of missing sales values BEFORE cleaning), ''row_count_after_clean'' (row count after dropping rows missing sales), and ''mean_by_region'' (dict of region -> mean sales, computed on the cleaned data).', 'Load once, capture the missing count with .isna().sum() before dropping anything, then dropna(subset=[''sales'']) and use the cleaned copy for the rest.', $py$import pandas as pd
import io


def full_eda_report(csv_text):
    # TODO: return {"missing_sales":..., "row_count_after_clean":..., "mean_by_region": {...}}
    pass
$py$, $py$import pandas as pd
import io
_csv = "region,sales\nUS,100\nUS,\nUK,80\nUK,120\nUS,60\n"
_actual = full_eda_report(_csv)
_passed = 0
_total = 3
if _actual.get("missing_sales") == 1:
    _passed += 1
    print("PASS: missing_sales == 1")
else:
    print(f"FAIL: missing_sales was {_actual.get('missing_sales')!r}, expected 1")
if _actual.get("row_count_after_clean") == 4:
    _passed += 1
    print("PASS: row_count_after_clean == 4")
else:
    print(f"FAIL: row_count_after_clean was {_actual.get('row_count_after_clean')!r}, expected 4")
_mbr = _actual.get("mean_by_region", {})
_expected_mbr = {"US": 80.0, "UK": 100.0}
_ok = isinstance(_mbr, dict) and set(_mbr) == set(_expected_mbr) and all(
    abs(_mbr[k] - _expected_mbr[k]) < 1e-6 for k in _expected_mbr
)
if _ok:
    _passed += 1
    print(f"PASS: mean_by_region == {_expected_mbr!r}")
else:
    print(f"FAIL: mean_by_region was {_mbr!r}, expected {_expected_mbr!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000011', '10000000-0000-0000-0000-000000000093', 9, 'Rank Categories By Metric', 'hard', 'Write rank_categories_by_metric(csv_text, cat_col, val_col, n) that parses csv_text, drops rows missing val_col, computes the average val_col per cat_col, and returns the top n categories as a list of (category, average) tuples sorted from highest average to lowest.', 'After groupby(cat_col)[val_col].mean(), use .sort_values(ascending=False).head(n) and convert to a list of tuples with .items() (or list(zip(...))).', $py$import pandas as pd
import io


def rank_categories_by_metric(csv_text, cat_col, val_col, n):
    # TODO: load, clean, average by category, return the top n (category, average) tuples
    pass
$py$, $py$import pandas as pd
import io
_csv = "region,sales\nUS,100\nUS,\nUK,80\nUK,120\nFR,200\nFR,220\n"
_actual = rank_categories_by_metric(_csv, "region", "sales", 2)
_actual = [tuple(t) for t in _actual]
_expected = [("FR", 210.0), ("UK", 100.0)]
_passed = 0
_total = 1
_ok = len(_actual) == len(_expected) and all(
    a[0] == b[0] and abs(a[1] - b[1]) < 1e-6 for a, b in zip(_actual, _expected)
)
if _ok:
    _passed += 1
    print(f"PASS: rank_categories_by_metric(...) == {_expected!r}")
else:
    print(f"FAIL: got {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000094', 1, 'Split Sizes', 'easy', 'Write split_sizes(n, test_frac) that returns a tuple (n_train, n_test) for splitting n samples, where n_test = int(n * test_frac) and n_train is the rest.', 'n_test = int(n * test_frac); n_train = n - n_test.', $py$def split_sizes(n, test_frac):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_desc = 'split_sizes(100, 0.2)'
try:
    _actual = split_sizes(100, 0.2)
    _ok = _actual == (80, 20)
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'split_sizes(10, 0.3)'
try:
    _actual = split_sizes(10, 0.3)
    _ok = _actual == (7, 3)
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'split_sizes(50, 0.1)'
try:
    _actual = split_sizes(50, 0.1)
    _ok = _actual == (45, 5)
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000094', 2, 'Matching Lengths', 'easy', 'Write matching_lengths(X, y) that returns True if the number of rows in X equals the number of elements in y, else False.', 'len(X) gives the number of rows for a 2D numpy array or list of rows.', $py$def matching_lengths(X, y):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
import numpy as np
_desc = 'matching_lengths([[1],[2],[3]], [1,2,3])'
try:
    _actual = matching_lengths([[1],[2],[3]], [1,2,3])
    _ok = _actual is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'matching_lengths([[1],[2]], [1,2,3])'
try:
    _actual = matching_lengths([[1],[2]], [1,2,3])
    _ok = _actual is False
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'matching_lengths(np.zeros((5,2)), np.zeros(5))'
try:
    _actual = matching_lengths(np.zeros((5,2)), np.zeros(5))
    _ok = _actual is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000094', 3, 'Deterministic Shuffle', 'medium', 'Write shuffle_indices(n, seed) that seeds numpy''s random generator with seed via np.random.seed(seed) and returns np.random.permutation(n) as a plain Python list of ints.', 'np.random.seed(seed) then np.random.permutation(n); convert with list(...).', $py$import numpy as np

def shuffle_indices(n, seed):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_desc = 'shuffle_indices(5, 42) is a permutation of range(5)'
try:
    _actual = sorted(shuffle_indices(5, 42))
    _ok = _actual == [0, 1, 2, 3, 4]
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'shuffle_indices(5, 42) is reproducible'
try:
    _actual = shuffle_indices(5, 42) == shuffle_indices(5, 42)
    _ok = _actual is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'shuffle_indices(5, 42) differs from shuffle_indices(5, 1)'
try:
    _actual = shuffle_indices(5, 42) != shuffle_indices(5, 1)
    _ok = _actual is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000094', 4, 'Manual Train/Test Split', 'medium', 'Write manual_split(X, y, test_size, seed) that shuffles the row order using np.random.seed(seed) + np.random.permutation, then splits into (X_train, X_test, y_train, y_test) where the *last* round(len(X)*test_size) shuffled rows become the test set. Return numpy arrays.', 'Shuffle both X and y with the same permutation, then slice: test rows are the last n_test indices of the shuffled order.', $py$import numpy as np

def manual_split(X, y, test_size, seed):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'manual_split shapes for n=10, test_size=0.2'
try:
    _actual = [a.shape[0] for a in manual_split(np.arange(10).reshape(-1,1), np.arange(10), 0.2, 42)]
    _ok = _actual == [8, 2, 8, 2]
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'manual_split keeps X/y rows aligned'
try:
    _actual = (lambda r: bool(np.all(r[1].ravel() == r[3])))(manual_split(np.arange(10).reshape(-1,1), np.arange(10), 0.2, 42))
    _ok = _actual is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000094', 5, 'scikit-learn Split Shapes', 'medium', 'Write sklearn_split_shapes(X, y, test_size, seed) that uses sklearn.model_selection.train_test_split with random_state=seed and returns a tuple (n_train, n_test) -- the number of rows in X_train and X_test.', 'from sklearn.model_selection import train_test_split; pass test_size and random_state=seed.', $py$from sklearn.model_selection import train_test_split

def sklearn_split_shapes(X, y, test_size, seed):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'sklearn_split_shapes(20 rows, 0.25, 42)'
try:
    _actual = sklearn_split_shapes(np.arange(20).reshape(-1,1), np.arange(20), 0.25, 42)
    _ok = _actual == (15, 5)
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'sklearn_split_shapes(100 rows, 0.1, 0)'
try:
    _actual = sklearn_split_shapes(np.arange(100).reshape(-1,1), np.arange(100), 0.1, 0)
    _ok = _actual == (90, 10)
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000094', 6, 'Mean Baseline', 'easy', 'Write mean_baseline(y_train) that returns the mean of y_train as a plain Python float.', 'float(np.mean(y_train)).', $py$import numpy as np

def mean_baseline(y_train):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_desc = 'mean_baseline([1,2,3,4])'
try:
    _actual = mean_baseline([1,2,3,4])
    _ok = abs(_actual - 2.5) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'mean_baseline([10,20,30])'
try:
    _actual = mean_baseline([10,20,30])
    _ok = abs(_actual - 20.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000094', 7, 'Baseline Predictions', 'medium', 'Write baseline_predictions(y_train, n_test) that returns a numpy array of length n_test, every entry equal to the mean of y_train -- this is what a ''model'' with no real learning would predict for every test point.', 'np.full(n_test, np.mean(y_train)).', $py$import numpy as np

def baseline_predictions(y_train, n_test):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'baseline_predictions([2,4,6], 4) shape'
try:
    _actual = baseline_predictions([2,4,6], 4).shape
    _ok = tuple(_actual) == (4,)
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'baseline_predictions([2,4,6], 4) values'
try:
    _actual = baseline_predictions([2,4,6], 4)
    _ok = np.allclose(_actual, [4.0, 4.0, 4.0, 4.0])
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000094', 8, 'Manual MAE', 'medium', 'Write mae(y_true, y_pred) that computes the mean absolute error between two equal-length arrays, without using sklearn.', 'np.mean(np.abs(np.asarray(y_true) - np.asarray(y_pred))).', $py$import numpy as np

def mae(y_true, y_pred):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_desc = 'mae([1,2,3],[1,2,3])'
try:
    _actual = mae([1,2,3],[1,2,3])
    _ok = abs(_actual - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'mae([1,2,3],[2,2,2])'
try:
    _actual = mae([1,2,3],[2,2,2])
    _ok = abs(_actual - (2/3)) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'mae([10,20],[15,15])'
try:
    _actual = mae([10,20],[15,15])
    _ok = abs(_actual - 5.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000094', 9, 'Spot the Overfit Gap', 'hard', 'Write flags_overfit(train_mae, test_mae, ratio=1.5) that returns True if test_mae is more than ratio times worse than train_mae (i.e. test_mae > train_mae * ratio), which signals the model fit the training set far better than it generalizes.', 'Just compare test_mae > train_mae * ratio.', $py$def flags_overfit(train_mae, test_mae, ratio=1.5):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_desc = 'flags_overfit(2.0, 10.0)'
try:
    _actual = flags_overfit(2.0, 10.0)
    _ok = _actual is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'flags_overfit(2.0, 2.5)'
try:
    _actual = flags_overfit(2.0, 2.5)
    _ok = _actual is False
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'flags_overfit(1.0, 1.6, ratio=1.5)'
try:
    _actual = flags_overfit(1.0, 1.6, ratio=1.5)
    _ok = _actual is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000095', 1, 'Predict', 'easy', 'Write predict(x, w, b) that returns w*x + b for a numpy array x (elementwise).', 'Plain elementwise arithmetic: w * x + b.', $py$def predict(x, w, b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'predict(np.array([1,2,3]), 2, 1)'
try:
    _actual = predict(np.array([1,2,3]), 2, 1)
    _ok = np.allclose(_actual, [3, 5, 7])
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'predict(np.array([0,10]), 0.5, -1)'
try:
    _actual = predict(np.array([0,10]), 0.5, -1)
    _ok = np.allclose(_actual, [-1.0, 4.0])
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000095', 2, 'Residuals', 'easy', 'Write residuals(y_true, y_pred) that returns y_true - y_pred elementwise.', 'Just subtract the two arrays.', $py$def residuals(y_true, y_pred):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
_desc = 'residuals(np.array([3,5,7]), np.array([2,5,9]))'
try:
    _actual = residuals(np.array([3,5,7]), np.array([2,5,9]))
    _ok = np.allclose(_actual, [1, 0, -2])
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000095', 3, 'MSE Loss (Scratch)', 'medium', 'Write mse_loss(y_true, y_pred) that computes the mean squared error, without using sklearn.', 'np.mean((y_true - y_pred) ** 2).', $py$def mse_loss(y_true, y_pred):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'mse_loss(np.array([1,2,3]), np.array([1,2,3]))'
try:
    _actual = mse_loss(np.array([1,2,3]), np.array([1,2,3]))
    _ok = abs(_actual - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'mse_loss(np.array([1,2,3]), np.array([2,2,2]))'
try:
    _actual = mse_loss(np.array([1,2,3]), np.array([2,2,2]))
    _ok = abs(_actual - (2/3)) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000095', 4, 'Gradient of w', 'medium', 'Write gradient_w(x, y_true, y_pred) that returns the partial derivative of MSE with respect to w: -(2/n) * sum(x * (y_true - y_pred)).', 'n = len(x); return -(2/n) * np.sum(x * (y_true - y_pred)).', $py$def gradient_w(x, y_true, y_pred):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'gradient_w(x=[1,2,3], perfect fit) == 0'
try:
    _actual = gradient_w(np.array([1,2,3]), np.array([3,5,7]), np.array([3,5,7]))
    _ok = abs(_actual - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'gradient_w known case'
try:
    _actual = gradient_w(np.array([1.0,2.0]), np.array([3.0,5.0]), np.array([0.0,0.0]))
    _ok = abs(_actual - (-(2/2) * (1*3 + 2*5))) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000095', 5, 'Gradient of b', 'medium', 'Write gradient_b(y_true, y_pred) that returns the partial derivative of MSE with respect to b: -(2/n) * sum(y_true - y_pred).', 'n = len(y_true); return -(2/n) * np.sum(y_true - y_pred).', $py$def gradient_b(y_true, y_pred):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'gradient_b perfect fit == 0'
try:
    _actual = gradient_b(np.array([3,5,7]), np.array([3,5,7]))
    _ok = abs(_actual - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'gradient_b known case'
try:
    _actual = gradient_b(np.array([3.0,5.0]), np.array([0.0,0.0]))
    _ok = abs(_actual - (-(2/2) * (3+5))) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000095', 6, 'One Gradient Descent Step', 'medium', 'Write gd_step(x, y, w, b, lr) that performs a single gradient descent update and returns the new (w, b) as a tuple. Compute y_pred = w*x+b once, then update both parameters from that same prediction.', 'dw = -(2/n)*sum(x*(y-y_pred)); db = -(2/n)*sum(y-y_pred); new_w = w - lr*dw; new_b = b - lr*db.', $py$def gd_step(x, y, w, b, lr):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'gd_step moves toward the data'
try:
    _actual = gd_step(np.array([1.0,2.0,3.0]), np.array([3.0,5.0,7.0]), 0.0, 0.0, 0.1)
    _ok = _actual[0] > 0 and _actual[1] > 0
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'gd_step at the optimum barely moves'
try:
    _actual = gd_step(np.array([1.0,2.0,3.0]), np.array([3.0,5.0,7.0]), 2.0, 1.0, 0.1)
    _ok = abs(_actual[0] - 2.0) < 1e-9 and abs(_actual[1] - 1.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000095', 7, 'Fit Linear Regression From Scratch', 'hard', 'Write fit_linear_regression(x, y, lr, epochs) that starts from w=0.0, b=0.0 and runs `epochs` steps of batch gradient descent on the MSE loss, returning the final (w, b) tuple.', 'Loop `epochs` times: compute y_pred, then dw/db from it, then update w and b together (don''t use an updated w when computing db).', $py$def fit_linear_regression(x, y, lr, epochs):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np

np.random.seed(42)
_x = np.linspace(0, 10, 100)
_noise = np.random.randn(100) * 0.5
_y = 3 * _x + 5 + _noise
_desc = 'fit_linear_regression recovers slope near 3 within 5%'
try:
    _actual = fit_linear_regression(_x, _y, 0.01, 2000)[0]
    _ok = abs(_actual - 3.0) < 0.15
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'fit_linear_regression recovers intercept near 5 within 5%'
try:
    _actual = fit_linear_regression(_x, _y, 0.01, 2000)[1]
    _ok = abs(_actual - 5.0) < 0.25
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000095', 8, 'Normalize a Feature', 'medium', 'Write normalize_feature(x) that returns (x - mean) / std as a numpy array, a common preprocessing step that keeps gradient descent stable on features with large ranges.', 'np.mean(x) and np.std(x), then elementwise (x - mean) / std.', $py$def normalize_feature(x):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'normalize_feature has mean ~0'
try:
    _actual = abs(float(np.mean(normalize_feature(np.array([1.0,2.0,3.0,4.0,5.0])))))
    _ok = _actual < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'normalize_feature has std ~1'
try:
    _actual = float(np.std(normalize_feature(np.array([1.0,2.0,3.0,4.0,5.0]))))
    _ok = abs(_actual - 1.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000095', 9, 'Fit With Feature Scaling', 'medium', 'Write fit_scaled(x, y, lr, epochs) that standardizes x (mean 0, std 1) before running gradient descent (starting w=0, b=0, on the scaled x), then converts the learned (w_scaled, b_scaled) back to the original x scale and returns (w_original, b_original). If x_s = (x - mu) / sigma and the model is w_s*x_s + b_s, then in terms of the original x that''s (w_s/sigma)*x + (b_s - w_s*mu/sigma).', 'Standardize x, run the same gradient descent loop from concept 95 on the scaled feature, then apply w = w_s / sigma, b = b_s - w_s * mu / sigma.', $py$def fit_scaled(x, y, lr, epochs):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np

np.random.seed(7)
_x2 = np.linspace(0, 100, 200)
_noise2 = np.random.randn(200) * 2.0
_y2 = 4 * _x2 - 30 + _noise2
_desc = 'fit_scaled recovers slope near 4 within 5%'
try:
    _actual = fit_scaled(_x2, _y2, 0.1, 2000)[0]
    _ok = abs(_actual - 4.0) < 0.2
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'fit_scaled recovers intercept near -30 within 5%'
try:
    _actual = fit_scaled(_x2, _y2, 0.1, 2000)[1]
    _ok = abs(_actual - (-30.0)) < 3.0
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000095', 10, 'Track the Loss History', 'hard', 'Write loss_history(x, y, lr, epochs) that runs gradient descent from w=0.0, b=0.0 for `epochs` steps (same update rule as fit_linear_regression) and returns a Python list of the MSE loss computed *before* each step''s update, so len(result) == epochs and it should generally trend downward.', 'Inside the loop: compute y_pred with the current w/b, record mse_loss(y, y_pred) into the list, *then* compute gradients and update.', $py$def loss_history(x, y, lr, epochs):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
import numpy as np

np.random.seed(42)
_x = np.linspace(0, 10, 100)
_noise = np.random.randn(100) * 0.5
_y = 3 * _x + 5 + _noise
_desc = 'loss_history has the right length'
try:
    _actual = len(loss_history(_x, _y, 0.01, 300))
    _ok = _actual == 300
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'loss_history decreases overall'
try:
    _actual = (lambda h: h[-1] < h[0])(loss_history(_x, _y, 0.01, 300))
    _ok = _actual is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'loss_history final loss is small'
try:
    _actual = loss_history(_x, _y, 0.01, 2000)[-1]
    _ok = _actual < 1.0
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000096', 1, 'Fit and Predict', 'easy', 'Write fit_and_predict(X_train, y_train, X_test) that fits a sklearn LinearRegression on the training data and returns its predictions on X_test as a numpy array.', 'model = LinearRegression(); model.fit(X_train, y_train); return model.predict(X_test).', $py$from sklearn.linear_model import LinearRegression

def fit_and_predict(X_train, y_train, X_test):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
from sklearn.linear_model import LinearRegression
_desc = 'fit_and_predict recovers a perfect line'
try:
    _actual = fit_and_predict(np.array([[1],[2],[3],[4]]), np.array([2,4,6,8]), np.array([[5],[6]]))
    _ok = np.allclose(_actual, [10, 12], atol=1e-6)
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000096', 2, 'Get Coefficients', 'easy', 'Write get_coefficients(X, y) that fits LinearRegression on (X, y) and returns a tuple (coef_as_list, intercept_as_float).', 'list(model.coef_), float(model.intercept_).', $py$from sklearn.linear_model import LinearRegression

def get_coefficients(X, y):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
from sklearn.linear_model import LinearRegression
_desc = 'get_coefficients on y = 2x + 3 (exact)'
try:
    _actual = get_coefficients(np.array([[0],[1],[2],[3]]), np.array([3,5,7,9]))
    _ok = np.allclose(_actual[0], [2.0], atol=1e-6) and abs(_actual[1] - 3.0) < 1e-6
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000096', 3, 'R-Squared on Training Data', 'medium', 'Write r_squared_score(X, y) that fits LinearRegression on (X, y) and returns model.score(X, y) -- R^2 on the same data it was fit on.', 'model.score(X, y) after fitting.', $py$from sklearn.linear_model import LinearRegression

def r_squared_score(X, y):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
from sklearn.linear_model import LinearRegression
_desc = 'r_squared_score is 1.0 for a perfectly linear relationship'
try:
    _actual = r_squared_score(np.array([[1],[2],[3],[4]]), np.array([2,4,6,8]))
    _ok = abs(_actual - 1.0) < 1e-6
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'r_squared_score is between 0 and 1 for noisy data'
try:
    _actual = r_squared_score(np.array([[1],[2],[3],[4],[5]]), np.array([2,3,7,5,11]))
    _ok = 0.0 <= _actual <= 1.0
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000096', 4, 'Predict a Single New Point', 'medium', 'Write predict_new_point(X_train, y_train, new_x) that fits on the training data and returns a single float prediction for new_x, a plain number (e.g. 1800) representing one new sample with one feature.', 'Wrap new_x as [[new_x]] before calling .predict(), then pull out the single value with float(...[0]).', $py$from sklearn.linear_model import LinearRegression

def predict_new_point(X_train, y_train, new_x):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
from sklearn.linear_model import LinearRegression
_desc = 'predict_new_point on y = 3x'
try:
    _actual = predict_new_point(np.array([[1],[2],[3]]), np.array([3,6,9]), 10)
    _ok = abs(_actual - 30.0) < 1e-6
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000096', 5, 'Multiple Features', 'medium', 'Write fit_multivariate(X, y) where X has more than one column; fit LinearRegression and return model.coef_ as a numpy array.', 'Same fit call works regardless of the number of columns in X.', $py$from sklearn.linear_model import LinearRegression

def fit_multivariate(X, y):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
from sklearn.linear_model import LinearRegression
_desc = 'fit_multivariate recovers [2, -1] exactly on noiseless data'
try:
    _actual = fit_multivariate(np.array([[1,1],[2,1],[3,2],[4,2],[5,3]]), np.array([2*1-1*1,2*2-1*1,2*3-1*2,2*4-1*2,2*5-1*3]).astype(float))
    _ok = np.allclose(_actual, [2.0, -1.0], atol=1e-6)
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000096', 6, 'Score on Held-Out Data', 'medium', 'Write test_r2(X_train, y_train, X_test, y_test) that fits on the training set and returns model.score(X_test, y_test) -- R^2 measured on unseen data.', 'Fit on train, then call .score() with the test arguments, not the training ones.', $py$from sklearn.linear_model import LinearRegression

def test_r2(X_train, y_train, X_test, y_test):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
from sklearn.linear_model import LinearRegression
_desc = 'test_r2 is close to 1.0 when train/test share the same clean relationship'
try:
    _actual = test_r2(np.array([[1],[2],[3],[4]]), np.array([2,4,6,8]), np.array([[5],[6]]), np.array([10,12]))
    _ok = abs(_actual - 1.0) < 1e-6
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000096', 7, 'Residuals After Fitting', 'hard', 'Write residuals(X, y) that fits LinearRegression on (X, y) and returns y - model.predict(X) as a numpy array -- the leftover error at each point.', 'y minus the model''s own predictions on the data it was trained on.', $py$from sklearn.linear_model import LinearRegression

def residuals(X, y):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
from sklearn.linear_model import LinearRegression
_desc = 'residuals are ~0 for a perfectly linear relationship'
try:
    _actual = np.max(np.abs(residuals(np.array([[1],[2],[3],[4]]), np.array([2.0,4.0,6.0,8.0]))))
    _ok = _actual < 1e-6
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'residuals sum to ~0 for ordinary least squares'
try:
    _actual = abs(float(np.sum(residuals(np.array([[1],[2],[3],[4],[5]]), np.array([2.0,3.0,7.0,5.0,11.0])))))
    _ok = _actual < 1e-6
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000096', 8, 'Turning Off the Intercept', 'easy', 'Write intercept_when_disabled(X, y) that fits LinearRegression with fit_intercept=False on (X, y) and returns model.intercept_.', 'LinearRegression(fit_intercept=False) always reports an intercept_ of exactly 0.0.', $py$from sklearn.linear_model import LinearRegression

def intercept_when_disabled(X, y):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
from sklearn.linear_model import LinearRegression
_desc = 'intercept_when_disabled is exactly 0.0'
try:
    _actual = intercept_when_disabled(np.array([[1],[2],[3]]), np.array([2,4,6]))
    _ok = abs(float(_actual) - 0.0) < 1e-12
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000096', 9, 'Confirm Against the Closed Form', 'medium', 'Write fit_1d(x, y) that reshapes a 1D x into a column, fits LinearRegression, and returns (slope, intercept) as floats.', 'x.reshape(-1, 1) before fitting; pull coef_[0] and intercept_ out as floats.', $py$from sklearn.linear_model import LinearRegression

def fit_1d(x, y):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
from sklearn.linear_model import LinearRegression
_desc = "fit_1d matches numpy's closed-form polyfit"
try:
    _actual = fit_1d(np.array([1.0,2.0,3.0,4.0,5.0]), np.array([2.1,3.9,6.2,7.8,10.1]))
    _ok = np.allclose(_actual, np.polyfit(np.array([1.0,2.0,3.0,4.0,5.0]), np.array([2.1,3.9,6.2,7.8,10.1]), 1), atol=1e-6)
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000097', 1, 'Mean Squared Error', 'easy', 'Write mse(y_true, y_pred) that returns the mean squared error between two equal-length arrays.', 'np.mean((y_true - y_pred) ** 2).', $py$def mse(y_true, y_pred):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
import numpy as np
_desc = 'mse([1,2,3],[1,2,3])'
try:
    _actual = mse([1,2,3],[1,2,3])
    _ok = abs(_actual - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'mse([1,2,3],[2,2,2])'
try:
    _actual = mse([1,2,3],[2,2,2])
    _ok = abs(_actual - (2/3)) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'mse([0,0],[3,4])'
try:
    _actual = mse([0,0],[3,4])
    _ok = abs(_actual - 12.5) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000097', 2, 'Mean Absolute Error', 'easy', 'Write mae(y_true, y_pred) that returns the mean absolute error between two equal-length arrays.', 'np.mean(np.abs(y_true - y_pred)).', $py$def mae(y_true, y_pred):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'mae([1,2,3],[1,2,3])'
try:
    _actual = mae([1,2,3],[1,2,3])
    _ok = abs(_actual - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'mae([0,0],[3,4])'
try:
    _actual = mae([0,0],[3,4])
    _ok = abs(_actual - 3.5) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000097', 3, 'Root Mean Squared Error', 'easy', 'Write rmse(y_true, y_pred) that returns the square root of the mean squared error -- the error expressed back in the target''s original units.', 'np.sqrt(mse(y_true, y_pred)).', $py$def rmse(y_true, y_pred):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'rmse([0,0],[3,4])'
try:
    _actual = rmse([0,0],[3,4])
    _ok = abs(_actual - (12.5 ** 0.5)) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'rmse([1,2,3],[1,2,3])'
try:
    _actual = rmse([1,2,3],[1,2,3])
    _ok = abs(_actual - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000097', 4, 'Cost for Given Parameters', 'medium', 'Write cost_for_params(x, y, w, b) that computes the MSE cost of the line y_pred = w*x + b against the true y.', 'y_pred = w * x + b, then mean((y - y_pred) ** 2).', $py$def cost_for_params(x, y, w, b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'cost_for_params is 0 at the true parameters'
try:
    _actual = cost_for_params(np.array([1,2,3]), np.array([3,5,7]), 2, 1)
    _ok = abs(_actual - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'cost_for_params is positive away from the true parameters'
try:
    _actual = cost_for_params(np.array([1,2,3]), np.array([3,5,7]), 0, 0)
    _ok = _actual > 0
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000097', 5, 'Best of a Few Candidates', 'medium', 'Write best_candidate(x, y, candidates) where candidates is a list of (w, b) tuples; return the tuple with the lowest MSE cost on (x, y).', 'Compute cost_for_params-style MSE for each candidate and use min() with a key function.', $py$def best_candidate(x, y, candidates):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
_desc = 'best_candidate picks the exact fit'
try:
    _actual = best_candidate(np.array([1,2,3]), np.array([3,5,7]), [(0,0),(1,1),(2,1),(3,0)])
    _ok = _actual == (2, 1)
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000097', 6, 'MSE vs MAE Under an Outlier', 'medium', 'Write both_losses(y_true, y_pred) that returns a tuple (mse_value, mae_value) for the same predictions, so their sensitivity to an outlier can be compared directly.', 'Reuse the MSE and MAE formulas; just return both as a tuple.', $py$def both_losses(y_true, y_pred):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'both_losses on a dataset with one big outlier'
try:
    _actual = both_losses(np.array([1.0,2.0,3.0,4.0]), np.array([1.1,2.1,2.9,14.0]))
    _ok = abs(_actual[0] - float(np.mean((np.array([1.0,2.0,3.0,4.0])-np.array([1.1,2.1,2.9,14.0]))**2))) < 1e-9 and abs(_actual[1] - float(np.mean(np.abs(np.array([1.0,2.0,3.0,4.0])-np.array([1.1,2.1,2.9,14.0]))))) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'MSE reacts more strongly to the outlier than MAE (relative to their all-small-errors baseline)'
try:
    _actual = (lambda r: r[0] > r[1])(both_losses(np.array([1.0,2.0,3.0,4.0]), np.array([1.1,2.1,2.9,14.0])))
    _ok = _actual is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000097', 7, 'Loss Over a Grid', 'medium', 'Write loss_grid(x, y, w_values, b_values) that returns a 2D numpy array of shape (len(w_values), len(b_values)) where entry [i, j] is the MSE cost for (w_values[i], b_values[j]).', 'Nested loops (or broadcasting) filling a np.zeros((len(w_values), len(b_values))) array.', $py$def loss_grid(x, y, w_values, b_values):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'loss_grid has the right shape'
try:
    _actual = loss_grid(np.array([1,2,3]), np.array([3,5,7]), [0,1,2], [0,1]).shape
    _ok = tuple(_actual) == (3, 2)
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'loss_grid is exactly 0 at the true (w=2, b=1) cell'
try:
    _actual = loss_grid(np.array([1,2,3]), np.array([3,5,7]), [0,1,2], [0,1])[2,1]
    _ok = abs(_actual - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000097', 8, 'Search the Grid for the Minimum', 'hard', 'Write best_grid_point(x, y, w_values, b_values) that builds the same kind of loss grid and returns a tuple (best_w, best_b, min_cost) for the grid cell with the lowest cost.', 'Build the grid (or loop directly), then use np.unravel_index(np.argmin(grid), grid.shape) to find the (i, j) of the minimum.', $py$def best_grid_point(x, y, w_values, b_values):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
_desc = 'best_grid_point finds the exact fit (w=2, b=1)'
try:
    _actual = best_grid_point(np.array([1,2,3]), np.array([3,5,7]), [0,1,2,3], [-1,0,1,2])
    _ok = _actual[0] == 2 and _actual[1] == 1 and abs(_actual[2] - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000097', 9, 'Normalized MSE', 'medium', 'Write normalized_mse(y_true, y_pred) that returns the MSE divided by the variance of y_true -- a scale-free version of MSE useful for comparing cost across differently-scaled targets. A value near 0 means a great fit; a value near 1 means no better than predicting the mean.', 'mse(y_true, y_pred) / np.var(y_true).', $py$def normalized_mse(y_true, y_pred):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'normalized_mse is ~0 for a perfect fit'
try:
    _actual = normalized_mse(np.array([1.0,2.0,3.0,4.0]), np.array([1.0,2.0,3.0,4.0]))
    _ok = abs(_actual - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'normalized_mse is ~1 when predicting the mean for every point'
try:
    _actual = normalized_mse(np.array([1.0,2.0,3.0,4.0]), np.full(4, np.mean([1.0,2.0,3.0,4.0])))
    _ok = abs(_actual - 1.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000098', 1, 'Predict (Multivariate)', 'easy', 'Write predict_multivariate(X, w, b) that returns X @ w + b, where X has shape (n_samples, n_features) and w has shape (n_features,).', 'Matrix-vector product with @, then add the scalar b (broadcasts).', $py$def predict_multivariate(X, w, b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
_desc = 'predict_multivariate basic case'
try:
    _actual = predict_multivariate(np.array([[1.0,2.0],[3.0,4.0]]), np.array([1.0,2.0]), 0.5)
    _ok = np.allclose(_actual, [5.5, 11.5])
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000098', 2, 'Gradient (Multivariate)', 'medium', 'Write gradient_multivariate(X, y, w, b) that returns a tuple (dw, db), the gradients of MSE with respect to w (a vector) and b (a scalar), using y_pred = X @ w + b.', 'error = y - y_pred; dw = -(2/n) * (X.T @ error); db = -(2/n) * np.sum(error).', $py$def gradient_multivariate(X, y, w, b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
_desc = 'gradient_multivariate is ~0 at the true parameters'
try:
    _actual = gradient_multivariate(np.array([[1.0,2.0],[2.0,1.0],[3.0,4.0],[4.0,3.0]]), np.array([5.0,4.0,11.0,10.0]), np.array([1.0,2.0]), 0.0)
    _ok = np.allclose(_actual[0], [0.0, 0.0], atol=1e-9) and abs(_actual[1] - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000098', 3, 'One Step (Multivariate)', 'medium', 'Write gd_step_multivariate(X, y, w, b, lr) that performs one gradient descent update and returns the new (w, b).', 'Compute both gradients from the same y_pred, then update w and b.', $py$def gd_step_multivariate(X, y, w, b, lr):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
_desc = 'gd_step_multivariate barely moves at the optimum'
try:
    _actual = gd_step_multivariate(np.array([[1.0,2.0],[2.0,1.0],[3.0,4.0],[4.0,3.0]]), np.array([5.0,4.0,11.0,10.0]), np.array([1.0,2.0]), 0.0, 0.1)
    _ok = np.allclose(_actual[0], [1.0, 2.0], atol=1e-9) and abs(_actual[1] - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000098', 4, 'Fit Multivariate Gradient Descent', 'hard', 'Write fit_multivariate_gd(X, y, lr, epochs) that starts from w = zeros(n_features), b = 0.0 and runs `epochs` steps of batch gradient descent, returning the final (w, b).', 'Same loop as the 1D case, just with X @ w and X.T @ error instead of scalar arithmetic.', $py$def fit_multivariate_gd(X, y, lr, epochs):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np

np.random.seed(1)
_n = 200
_x0 = np.linspace(0, 10, _n)
_x1 = np.random.uniform(-5, 5, _n)
_Xm = np.column_stack([_x0, _x1])
_noise_m = np.random.randn(_n) * 0.5
_ym = _Xm @ np.array([2.0, -3.0]) + 4.0 + _noise_m
_desc = 'fit_multivariate_gd recovers w near [2, -3] within 5%'
try:
    _actual = fit_multivariate_gd(_Xm, _ym, 0.01, 3000)[0]
    _ok = abs(_actual[0] - 2.0) < 0.1 and abs(_actual[1] - (-3.0)) < 0.15
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'fit_multivariate_gd recovers b near 4 within 5%'
try:
    _actual = fit_multivariate_gd(_Xm, _ym, 0.01, 3000)[1]
    _ok = abs(_actual - 4.0) < 0.2
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000098', 5, 'Detect Divergence', 'medium', 'Write does_diverge(x, y, lr, epochs) that runs the 1D from-scratch gradient descent loop (w=0.0, b=0.0 start) and returns True if the final MSE loss is NaN, infinite, or greater than 1e6 -- a sign the learning rate is too large -- and False otherwise.', 'After the loop, compute the final loss and check np.isnan/np.isinf/or > 1e6.', $py$def does_diverge(x, y, lr, epochs):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np

np.random.seed(42)
_xd = np.linspace(0, 10, 100)
_noised = np.random.randn(100) * 0.5
_yd = 3 * _xd + 5 + _noised
_desc = 'does_diverge is True for too-large a learning rate'
try:
    _actual = does_diverge(_xd, _yd, 0.05, 50)
    _ok = _actual is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'does_diverge is False for a reasonable learning rate'
try:
    _actual = does_diverge(_xd, _yd, 0.01, 200)
    _ok = _actual is False
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000098', 6, 'Early Stopping', 'medium', 'Write early_stopping_fit(x, y, lr, max_epochs, tol) that runs gradient descent for up to max_epochs steps, stopping early once the loss changes by less than tol from one epoch to the next. Return a tuple (w, b, epochs_run).', 'Track the previous epoch''s loss; before updating, if abs(prev_loss - loss) < tol, break out of the loop.', $py$def early_stopping_fit(x, y, lr, max_epochs, tol):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np

np.random.seed(42)
_xd = np.linspace(0, 10, 100)
_noised = np.random.randn(100) * 0.5
_yd = 3 * _xd + 5 + _noised
_desc = 'early_stopping_fit stops before max_epochs when it converges'
try:
    _actual = early_stopping_fit(_xd, _yd, 0.01, 5000, 1e-6)[2]
    _ok = _actual < 5000
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'early_stopping_fit still finds a good fit'
try:
    _actual = early_stopping_fit(_xd, _yd, 0.01, 5000, 1e-6)[0]
    _ok = abs(_actual - 3.0) < 0.2
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000098', 7, 'Standardize Every Column', 'medium', 'Write feature_scale(X) that standardizes each column of a 2D array X independently (mean 0, std 1 per column) and returns the scaled array.', 'Use axis=0 with np.mean/np.std so each column is scaled by its own mean and std.', $py$def feature_scale(X):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'feature_scale columns each have mean ~0'
try:
    _actual = np.max(np.abs(feature_scale(np.array([[1.0,100.0],[2.0,200.0],[3.0,300.0],[4.0,400.0]])).mean(axis=0)))
    _ok = _actual < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'feature_scale columns each have std ~1'
try:
    _actual = feature_scale(np.array([[1.0,100.0],[2.0,200.0],[3.0,300.0],[4.0,400.0]])).std(axis=0)
    _ok = np.allclose(_actual, [1.0, 1.0])
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000098', 8, 'Fit With Scaling, Then Unscale', 'hard', 'Write fit_scaled_multivariate(X, y, lr, epochs) that standardizes every column of X, runs batch gradient descent in that scaled space (starting from w=zeros, b=0), then converts the learned coefficients back to the original feature scale and returns (w_original, b_original). If column j is scaled as (X[:,j]-mu[j])/sigma[j], then w_original[j] = w_scaled[j] / sigma[j], and b_original = b_scaled - sum(w_scaled * mu / sigma).', 'Scale X first, fit in scaled space, then apply the unscaling formula column by column (or with numpy broadcasting).', $py$def fit_scaled_multivariate(X, y, lr, epochs):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np

np.random.seed(3)
_ns = 300
_f1 = np.linspace(0, 1000, _ns)
_f2 = np.random.uniform(0, 1, _ns)
_Xs = np.column_stack([_f1, _f2])
_noise_s = np.random.randn(_ns) * 0.5
_ys = _Xs @ np.array([0.05, 20.0]) + 10.0 + _noise_s
_desc = 'fit_scaled_multivariate recovers w near [0.05, 20.0] within 5%'
try:
    _actual = fit_scaled_multivariate(_Xs, _ys, 0.2, 2000)[0]
    _ok = abs(_actual[0] - 0.05) < 0.005 and abs(_actual[1] - 20.0) < 1.0
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'fit_scaled_multivariate recovers b near 10.0 within 5%'
try:
    _actual = fit_scaled_multivariate(_Xs, _ys, 0.2, 2000)[1]
    _ok = abs(_actual - 10.0) < 0.5
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000098', 9, 'Mini-Batch Gradient Descent', 'medium', 'Write mini_batch_gd(x, y, lr, epochs, batch_size, seed) that runs mini-batch gradient descent on the 1D from-scratch model: for each epoch, reseed with np.random.seed(seed + epoch_index), shuffle the sample order, then update w/b once per consecutive chunk of batch_size shuffled indices. Start from w=0.0, b=0.0 and return the final (w, b).', 'np.random.seed(seed + epoch) then np.random.permutation(n) each epoch; loop over the permuted indices in steps of batch_size.', $py$def mini_batch_gd(x, y, lr, epochs, batch_size, seed):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
import numpy as np

np.random.seed(42)
_xd = np.linspace(0, 10, 100)
_noised = np.random.randn(100) * 0.5
_yd = 3 * _xd + 5 + _noised
_desc = 'mini_batch_gd recovers slope near 3 within 10%'
try:
    _actual = mini_batch_gd(_xd, _yd, 0.01, 200, 16, 42)[0]
    _ok = abs(_actual - 3.0) < 0.3
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'mini_batch_gd recovers intercept near 5 within 10%'
try:
    _actual = mini_batch_gd(_xd, _yd, 0.01, 200, 16, 42)[1]
    _ok = abs(_actual - 5.0) < 0.5
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'mini_batch_gd is reproducible for the same seed'
try:
    _actual = mini_batch_gd(_xd, _yd, 0.01, 50, 16, 42) == mini_batch_gd(_xd, _yd, 0.01, 50, 16, 42)
    _ok = _actual is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000099', 1, 'Build Polynomial Features by Hand', 'easy', 'Write make_polynomial_features(x, degree) that returns a 2D numpy array of shape (len(x), degree) whose columns are x, x**2, ..., x**degree, without using sklearn.', 'np.column_stack([x**p for p in range(1, degree + 1)]).', $py$def make_polynomial_features(x, degree):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
from sklearn.linear_model import LinearRegression
_desc = 'make_polynomial_features shape'
try:
    _actual = make_polynomial_features(np.array([1.0,2.0,3.0]), 3).shape
    _ok = tuple(_actual) == (3, 3)
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'make_polynomial_features values'
try:
    _actual = make_polynomial_features(np.array([2.0]), 3)
    _ok = np.allclose(_actual, [[2.0, 4.0, 8.0]])
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000099', 2, 'Fit a Polynomial', 'medium', 'Write fit_polynomial(x, y, degree) that builds polynomial features (x, x^2, ..., x^degree), fits LinearRegression, and returns a tuple (coef, intercept) where coef is a numpy array in ascending power order.', 'Build the feature matrix, fit LinearRegression on it, return (model.coef_, model.intercept_).', $py$from sklearn.linear_model import LinearRegression

def fit_polynomial(x, y, degree):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
from sklearn.linear_model import LinearRegression
_desc = 'fit_polynomial recovers y = x + 0.5x^2 + 2 exactly (noiseless)'
try:
    _actual = fit_polynomial(np.linspace(-3,3,20), 0.5*np.linspace(-3,3,20)**2 + np.linspace(-3,3,20) + 2, 2)
    _ok = np.allclose(_actual[0], [1.0, 0.5], atol=1e-6) and abs(_actual[1] - 2.0) < 1e-6
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000099', 3, 'Evaluate a Polynomial', 'medium', 'Write polynomial_predict(x, coef, intercept) that evaluates a fitted polynomial at points x, using the same ascending-power convention as fit_polynomial (coef[0] multiplies x, coef[1] multiplies x^2, etc).', 'sum(coef[i] * x**(i+1) for i in range(len(coef))) + intercept, done with numpy so it works elementwise on an array x.', $py$def polynomial_predict(x, coef, intercept):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
from sklearn.linear_model import LinearRegression
_desc = 'polynomial_predict matches y = 2 + x + 0.5x^2'
try:
    _actual = polynomial_predict(np.array([0.0, 2.0]), [1.0, 0.5], 2.0)
    _ok = np.allclose(_actual, [2.0, 6.0])
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000099', 4, 'Train/Test MSE for a Degree', 'medium', 'Write train_test_mse_for_degree(x_train, y_train, x_test, y_test, degree) that fits a degree-`degree` polynomial on the training data and returns a tuple (train_mse, test_mse).', 'Build polynomial features from x_train, fit, then build the *same* polynomial features from x_test with the same degree to evaluate MSE on each set.', $py$from sklearn.linear_model import LinearRegression

def train_test_mse_for_degree(x_train, y_train, x_test, y_test, degree):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
from sklearn.linear_model import LinearRegression

np.random.seed(5)
_n_tr = 12
_xtr = np.linspace(-3, 3, _n_tr)
_ytr = 0.5 * _xtr ** 2 + _xtr + 2 + np.random.randn(_n_tr) * 1.0

np.random.seed(6)
_n_te = 15
_xte = np.linspace(-3, 3, _n_te)
_yte = 0.5 * _xte ** 2 + _xte + 2 + np.random.randn(_n_te) * 1.0
_desc = 'train_test_mse_for_degree(degree=2) is a reasonable fit'
try:
    _actual = train_test_mse_for_degree(_xtr, _ytr, _xte, _yte, 2)
    _ok = 0 <= _actual[0] < 2.0 and 0 <= _actual[1] < 4.0
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'train_test_mse_for_degree(degree=10) overfits: tiny train, big test'
try:
    _actual = train_test_mse_for_degree(_xtr, _ytr, _xte, _yte, 10)
    _ok = _actual[0] < 0.5 and _actual[1] > _actual[0] * 5
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000099', 5, 'Pick the Best Degree', 'hard', 'Write best_degree(x_train, y_train, x_test, y_test, degrees) where degrees is a list of candidate polynomial degrees; fit each on the training set and return the degree with the lowest test MSE.', 'Reuse the train/test MSE computation for each candidate degree and pick the one minimizing test_mse with min(..., key=...).', $py$from sklearn.linear_model import LinearRegression

def best_degree(x_train, y_train, x_test, y_test, degrees):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
from sklearn.linear_model import LinearRegression

np.random.seed(5)
_n_tr = 12
_xtr = np.linspace(-3, 3, _n_tr)
_ytr = 0.5 * _xtr ** 2 + _xtr + 2 + np.random.randn(_n_tr) * 1.0

np.random.seed(6)
_n_te = 15
_xte = np.linspace(-3, 3, _n_te)
_yte = 0.5 * _xte ** 2 + _xte + 2 + np.random.randn(_n_te) * 1.0
_desc = 'best_degree picks 2 for a quadratic-generated dataset'
try:
    _actual = best_degree(_xtr, _ytr, _xte, _yte, [1, 2, 3, 5, 8, 10, 11])
    _ok = _actual == 2
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000099', 6, 'Flag an Overfitting Degree', 'medium', 'Write is_overfitting_degree(x_train, y_train, x_test, y_test, degree, ratio=2.0) that returns True if the test MSE at that degree is more than `ratio` times the train MSE.', 'Reuse the train/test MSE computation, then compare test_mse > train_mse * ratio.', $py$from sklearn.linear_model import LinearRegression

def is_overfitting_degree(x_train, y_train, x_test, y_test, degree, ratio=2.0):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
from sklearn.linear_model import LinearRegression

np.random.seed(5)
_n_tr = 12
_xtr = np.linspace(-3, 3, _n_tr)
_ytr = 0.5 * _xtr ** 2 + _xtr + 2 + np.random.randn(_n_tr) * 1.0

np.random.seed(6)
_n_te = 15
_xte = np.linspace(-3, 3, _n_te)
_yte = 0.5 * _xte ** 2 + _xte + 2 + np.random.randn(_n_te) * 1.0
_desc = 'is_overfitting_degree is True at degree 10'
try:
    _actual = is_overfitting_degree(_xtr, _ytr, _xte, _yte, 10)
    _ok = _actual is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'is_overfitting_degree is False at degree 1'
try:
    _actual = is_overfitting_degree(_xtr, _ytr, _xte, _yte, 1)
    _ok = _actual is False
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000099', 7, 'scikit-learn''s PolynomialFeatures', 'medium', 'Write sklearn_poly_shape(x, degree) that reshapes 1D x into a column, applies sklearn''s PolynomialFeatures(degree, include_bias=False), and returns the resulting array''s shape as a tuple.', 'PolynomialFeatures(degree=degree, include_bias=False).fit_transform(x.reshape(-1, 1)).shape.', $py$from sklearn.preprocessing import PolynomialFeatures

def sklearn_poly_shape(x, degree):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
from sklearn.linear_model import LinearRegression
_desc = 'sklearn_poly_shape for 5 points, degree 3'
try:
    _actual = sklearn_poly_shape(np.array([1.0,2.0,3.0,4.0,5.0]), 3)
    _ok = tuple(_actual) == (5, 3)
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000099', 8, 'Polynomial Regression Pipeline', 'medium', 'Write fit_poly_pipeline(x_train, y_train, x_test, degree) that builds a sklearn Pipeline of PolynomialFeatures(degree, include_bias=False) followed by LinearRegression, fits it on the training data, and returns its predictions on x_test as a numpy array.', 'Pipeline([(''poly'', PolynomialFeatures(...)), (''lr'', LinearRegression())]).fit(x_train.reshape(-1,1), y_train), then .predict(x_test.reshape(-1,1)).', $py$from sklearn.pipeline import Pipeline
from sklearn.preprocessing import PolynomialFeatures
from sklearn.linear_model import LinearRegression

def fit_poly_pipeline(x_train, y_train, x_test, degree):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np
from sklearn.linear_model import LinearRegression
_desc = 'fit_poly_pipeline recovers a noiseless quadratic'
try:
    _actual = fit_poly_pipeline(np.linspace(-3,3,20), 0.5*np.linspace(-3,3,20)**2 + np.linspace(-3,3,20) + 2, np.array([0.0, 1.0]), 2)
    _ok = np.allclose(_actual, [2.0, 3.5], atol=1e-6)
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000099', 9, 'Count Extreme Coefficients', 'easy', 'Write count_extreme_coefficients(coef, threshold) that returns how many values in coef have an absolute value greater than threshold -- a quick signal that a high-degree fit has ballooned its coefficients.', 'sum(1 for c in coef if abs(c) > threshold), or a numpy boolean-sum one-liner.', $py$def count_extreme_coefficients(coef, threshold):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_desc = 'count_extreme_coefficients basic case'
try:
    _actual = count_extreme_coefficients([1.0, 50.0, -80.0, 0.2], 10.0)
    _ok = _actual == 2
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'count_extreme_coefficients with none over threshold'
try:
    _actual = count_extreme_coefficients([1.0, 2.0, 3.0], 10.0)
    _ok = _actual == 0
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000100', 1, 'Fit Ridge', 'easy', 'Write fit_ridge(X, y, alpha) that fits sklearn''s Ridge(alpha=alpha) on (X, y) and returns model.coef_.', 'Ridge(alpha=alpha).fit(X, y).coef_.', $py$from sklearn.linear_model import Ridge

def fit_ridge(X, y, alpha):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np

np.random.seed(10)
_n, _d = 50, 8
_Xr = np.random.randn(_n, _d)
_true_w = np.array([3.0, -2.0, 0.0, 0.0, 1.5, 0.0, 0.0, 0.0])
_yr = _Xr @ _true_w + 2.0 + np.random.randn(_n) * 0.5
_desc = 'fit_ridge(alpha=0.0) matches plain linear regression closely'
try:
    _actual = fit_ridge(np.array([[1.0],[2.0],[3.0],[4.0]]), np.array([2.0,4.0,6.0,8.0]), 0.0)
    _ok = np.allclose(_actual, [2.0], atol=1e-6)
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'fit_ridge shrinks coefficients as alpha grows'
try:
    _actual = (lambda a,b: np.linalg.norm(a) > np.linalg.norm(b))(fit_ridge(_Xr, _yr, 0.01), fit_ridge(_Xr, _yr, 50.0))
    _ok = bool(_actual) is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000100', 2, 'Fit Lasso', 'easy', 'Write fit_lasso(X, y, alpha) that fits sklearn''s Lasso(alpha=alpha, random_state=42) on (X, y) and returns model.coef_.', 'Lasso(alpha=alpha, random_state=42).fit(X, y).coef_.', $py$from sklearn.linear_model import Lasso

def fit_lasso(X, y, alpha):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np

np.random.seed(10)
_n, _d = 50, 8
_Xr = np.random.randn(_n, _d)
_true_w = np.array([3.0, -2.0, 0.0, 0.0, 1.5, 0.0, 0.0, 0.0])
_yr = _Xr @ _true_w + 2.0 + np.random.randn(_n) * 0.5
_desc = 'fit_lasso zeroes out some coefficients at alpha=0.3'
try:
    _actual = int(np.sum(np.abs(fit_lasso(_Xr, _yr, 0.3)) < 1e-6))
    _ok = _actual >= 3
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000100', 3, 'Confirm Coefficient Shrinkage', 'medium', 'Write shrinks_coefficients(X, y, alpha) that fits both plain LinearRegression and Ridge(alpha=alpha), and returns True if the L2 norm of the Ridge coefficients is smaller than the L2 norm of the plain LinearRegression coefficients.', 'np.linalg.norm(coef) for each model, then compare ridge_norm < plain_norm.', $py$from sklearn.linear_model import LinearRegression, Ridge

def shrinks_coefficients(X, y, alpha):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np

np.random.seed(10)
_n, _d = 50, 8
_Xr = np.random.randn(_n, _d)
_true_w = np.array([3.0, -2.0, 0.0, 0.0, 1.5, 0.0, 0.0, 0.0])
_yr = _Xr @ _true_w + 2.0 + np.random.randn(_n) * 0.5
_desc = 'shrinks_coefficients is True for a meaningful alpha'
try:
    _actual = shrinks_coefficients(_Xr, _yr, 5.0)
    _ok = _actual is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000100', 4, 'Count Zeroed-Out Coefficients', 'medium', 'Write count_zero_coefficients(X, y, alpha) that fits Lasso(alpha=alpha, random_state=42) and returns how many entries of coef_ are within 1e-8 of zero.', 'int(np.sum(np.abs(model.coef_) < 1e-8)).', $py$from sklearn.linear_model import Lasso

def count_zero_coefficients(X, y, alpha):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np

np.random.seed(10)
_n, _d = 50, 8
_Xr = np.random.randn(_n, _d)
_true_w = np.array([3.0, -2.0, 0.0, 0.0, 1.5, 0.0, 0.0, 0.0])
_yr = _Xr @ _true_w + 2.0 + np.random.randn(_n) * 0.5
_desc = 'count_zero_coefficients matches the known sparsity pattern'
try:
    _actual = count_zero_coefficients(_Xr, _yr, 0.3)
    _ok = _actual == 5
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000100', 5, 'Ridge vs Lasso Sparsity', 'medium', 'Write sparsity_comparison(X, y, alpha) that fits both Ridge(alpha) and Lasso(alpha, random_state=42) at the *same* alpha, and returns a tuple (n_zero_ridge, n_zero_lasso) -- the count of near-zero coefficients (abs < 1e-6) for each.', 'Fit both models at the same alpha, count near-zero entries in each coef_ array.', $py$from sklearn.linear_model import Ridge, Lasso

def sparsity_comparison(X, y, alpha):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np

np.random.seed(10)
_n, _d = 50, 8
_Xr = np.random.randn(_n, _d)
_true_w = np.array([3.0, -2.0, 0.0, 0.0, 1.5, 0.0, 0.0, 0.0])
_yr = _Xr @ _true_w + 2.0 + np.random.randn(_n) * 0.5
_desc = 'sparsity_comparison: lasso has strictly more zeros than ridge'
try:
    _actual = (lambda r: r[1] > r[0])(sparsity_comparison(_Xr, _yr, 0.3))
    _ok = _actual is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000100', 6, 'Pick the Best Alpha', 'hard', 'Write best_alpha_ridge(X_train, y_train, X_test, y_test, alphas) that fits Ridge on the training set for each candidate alpha and returns the alpha with the lowest test MSE.', 'For each alpha, fit Ridge(alpha=alpha) on train, compute test MSE via np.mean((y_test - model.predict(X_test))**2), pick the minimizing alpha.', $py$from sklearn.linear_model import Ridge

def best_alpha_ridge(X_train, y_train, X_test, y_test, alphas):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np

np.random.seed(21)
_n2, _d2 = 25, 15
_X2 = np.random.randn(_n2, _d2)
_true_w2 = np.zeros(_d2)
_true_w2[:3] = [3.0, -2.0, 1.5]
_y2 = _X2 @ _true_w2 + 1.0 + np.random.randn(_n2) * 2.0
_X2_train, _X2_test = _X2[:15], _X2[15:]
_y2_train, _y2_test = _y2[:15], _y2[15:]
_desc = 'best_alpha_ridge finds the middle-ground alpha'
try:
    _actual = best_alpha_ridge(_X2_train, _y2_train, _X2_test, _y2_test, [0.001, 0.1, 1.0, 5.0, 10.0, 50.0, 100.0])
    _ok = _actual == 5.0
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000100', 7, 'Manual Ridge Cost', 'medium', 'Write ridge_cost(x, y, w, b, alpha) that computes MSE plus an L2 penalty on w for a simple 1D line y_pred = w*x + b: mean((y - y_pred)**2) + alpha * w**2. (The intercept b is not penalized, matching how sklearn''s Ridge treats it.)', 'y_pred = w*x+b; mse = np.mean((y-y_pred)**2); return mse + alpha*w**2.', $py$def ridge_cost(x, y, w, b, alpha):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'ridge_cost with alpha=0 is plain MSE'
try:
    _actual = ridge_cost(np.array([1.0,2.0,3.0]), np.array([3.0,5.0,7.0]), 2.0, 1.0, 0.0)
    _ok = abs(_actual - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'ridge_cost grows with alpha for a nonzero weight'
try:
    _actual = ridge_cost(np.array([1.0,2.0,3.0]), np.array([3.0,5.0,7.0]), 2.0, 1.0, 10.0)
    _ok = abs(_actual - 40.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000100', 8, 'Regularization Rescues an Overfit Model', 'hard', 'Write ridge_beats_plain(x_train, y_train, x_test, y_test, degree, alpha) that builds degree-`degree` polynomial features, standardizes them with StandardScaler fit on the training features, fits both plain LinearRegression and Ridge(alpha=alpha) on the scaled training data, and returns True if Ridge''s test MSE is lower than plain LinearRegression''s.', 'Build polynomial features for train/test, fit a StandardScaler on the *training* features only, transform both, then compare test MSE between the two fitted models.', $py$from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LinearRegression, Ridge

def ridge_beats_plain(x_train, y_train, x_test, y_test, degree, alpha):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np

from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LinearRegression, Ridge

np.random.seed(5)
_n_tr = 12
_xtr = np.linspace(-3, 3, _n_tr)
_ytr = 0.5 * _xtr ** 2 + _xtr + 2 + np.random.randn(_n_tr) * 1.0

np.random.seed(6)
_n_te = 15
_xte = np.linspace(-3, 3, _n_te)
_yte = 0.5 * _xte ** 2 + _xte + 2 + np.random.randn(_n_te) * 1.0
_desc = 'ridge_beats_plain is True at a high, overfitting-prone degree'
try:
    _actual = ridge_beats_plain(_xtr, _ytr, _xte, _yte, 10, 0.1)
    _ok = _actual is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000100', 9, 'L1 vs L2 Penalty', 'easy', 'Write penalty_values(w, alpha) that returns a tuple (l1_penalty, l2_penalty) where l1_penalty = alpha * sum(abs(w)) (Lasso''s penalty) and l2_penalty = alpha * sum(w**2) (Ridge''s penalty).', 'np.sum(np.abs(w)) and np.sum(w**2), each scaled by alpha.', $py$def penalty_values(w, alpha):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'penalty_values basic case'
try:
    _actual = penalty_values([3.0, -4.0], 1.0)
    _ok = np.allclose(_actual, [7.0, 25.0])
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'penalty_values scales with alpha'
try:
    _actual = penalty_values([1.0, 1.0], 2.0)
    _ok = np.allclose(_actual, [4.0, 4.0])
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000101', 1, 'R-Squared From Scratch', 'easy', 'Write r_squared(y_true, y_pred) that computes R^2 manually: 1 - (sum of squared residuals) / (sum of squared deviations from the mean of y_true), without using sklearn.', 'ss_res = sum((y_true - y_pred)**2); ss_tot = sum((y_true - mean(y_true))**2); return 1 - ss_res/ss_tot.', $py$def r_squared(y_true, y_pred):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
import numpy as np
_desc = 'r_squared is 1.0 for a perfect fit'
try:
    _actual = r_squared(np.array([1.0,2.0,3.0]), np.array([1.0,2.0,3.0]))
    _ok = abs(_actual - 1.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'r_squared is 0.0 when predicting the mean everywhere'
try:
    _actual = r_squared(np.array([1.0,2.0,3.0,4.0]), np.full(4, np.mean([1.0,2.0,3.0,4.0])))
    _ok = abs(_actual - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'r_squared can go negative for a bad model'
try:
    _actual = r_squared(np.array([1.0,2.0,3.0,4.0]), np.array([10.0,-5.0,20.0,-8.0]))
    _ok = _actual < 0
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000101', 2, 'MAE via scikit-learn', 'easy', 'Write mae_metric(y_true, y_pred) that returns sklearn.metrics.mean_absolute_error(y_true, y_pred).', 'from sklearn.metrics import mean_absolute_error; call it directly.', $py$from sklearn.metrics import mean_absolute_error

def mae_metric(y_true, y_pred):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'mae_metric([1,2,3],[1,2,3])'
try:
    _actual = mae_metric([1,2,3],[1,2,3])
    _ok = abs(_actual - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'mae_metric([0,0],[3,4])'
try:
    _actual = mae_metric([0,0],[3,4])
    _ok = abs(_actual - 3.5) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000101', 3, 'RMSE via scikit-learn', 'easy', 'Write rmse_metric(y_true, y_pred) that returns sklearn.metrics.root_mean_squared_error(y_true, y_pred).', 'from sklearn.metrics import root_mean_squared_error; call it directly.', $py$from sklearn.metrics import root_mean_squared_error

def rmse_metric(y_true, y_pred):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'rmse_metric([0,0],[3,4])'
try:
    _actual = rmse_metric([0,0],[3,4])
    _ok = abs(_actual - (12.5 ** 0.5)) < 1e-6
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'rmse_metric([1,2,3],[1,2,3])'
try:
    _actual = rmse_metric([1,2,3],[1,2,3])
    _ok = abs(_actual - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000101', 4, 'Evaluate a Fitted Model', 'medium', 'Write evaluate_model(X, y) that fits LinearRegression on (X, y) and returns a tuple (r2, mae, rmse) computed on that same data using sklearn''s metrics functions.', 'Fit the model, get predictions, then call r2_score, mean_absolute_error, and root_mean_squared_error on (y, predictions).', $py$from sklearn.linear_model import LinearRegression
from sklearn.metrics import r2_score, mean_absolute_error, root_mean_squared_error

def evaluate_model(X, y):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np

np.random.seed(0)
_Xe = np.linspace(0, 10, 40).reshape(-1, 1)
_ye = 2 * _Xe.ravel() + 3 + np.random.randn(40) * 0.5
_desc = 'evaluate_model has high R^2 and small errors on a near-linear dataset'
try:
    _actual = evaluate_model(_Xe, _ye)
    _ok = _actual[0] > 0.9 and _actual[1] < 1.0 and _actual[2] < 1.0
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000101', 5, 'Adjusted R-Squared', 'medium', 'Write adjusted_r_squared(r2, n, p) that computes adjusted R^2 from a plain R^2 value, the number of samples n, and the number of predictors p, using 1 - (1 - r2) * (n - 1) / (n - p - 1).', 'Plug the values directly into the formula.', $py$def adjusted_r_squared(r2, n, p):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_desc = 'adjusted_r_squared with no predictors matches r2'
try:
    _actual = adjusted_r_squared(0.8, 100, 0)
    _ok = abs(_actual - 0.8) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'adjusted_r_squared decreases as p grows for fixed r2'
try:
    _actual = (lambda a,b: a > b)(adjusted_r_squared(0.8, 100, 1), adjusted_r_squared(0.8, 100, 20))
    _ok = bool(_actual) is True
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000101', 6, 'Cross-Validated R-Squared', 'hard', 'Write cross_val_r2(X, y, cv) that uses sklearn''s cross_val_score with a LinearRegression estimator, cv=cv folds, scoring=''r2'', and returns the mean of the returned scores as a float.', 'from sklearn.model_selection import cross_val_score; cross_val_score(LinearRegression(), X, y, cv=cv, scoring=''r2'').mean().', $py$from sklearn.linear_model import LinearRegression
from sklearn.model_selection import cross_val_score

def cross_val_r2(X, y, cv):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 1
import numpy as np

np.random.seed(0)
_Xe = np.linspace(0, 10, 40).reshape(-1, 1)
_ye = 2 * _Xe.ravel() + 3 + np.random.randn(40) * 0.5
_desc = 'cross_val_r2 is high for a strongly linear dataset'
try:
    _actual = cross_val_r2(_Xe, _ye, 5)
    _ok = _actual > 0.6
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000101', 7, 'Residual Statistics', 'medium', 'Write residual_stats(y_true, y_pred) that returns a tuple (mean_residual, std_residual) of the residuals y_true - y_pred.', 'np.mean and np.std of (y_true - y_pred).', $py$def residual_stats(y_true, y_pred):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'residual_stats for a perfect fit is (0, 0)'
try:
    _actual = residual_stats(np.array([1.0,2.0,3.0]), np.array([1.0,2.0,3.0]))
    _ok = abs(_actual[0]) < 1e-9 and abs(_actual[1]) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'residual_stats mean matches a hand-computed value'
try:
    _actual = residual_stats(np.array([2.0,4.0,6.0]), np.array([1.0,4.0,9.0]))
    _ok = abs(_actual[0] - (-2/3)) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000101', 8, 'Compare Two Models by R-Squared', 'medium', 'Write better_model(y_true, pred_a, pred_b) that returns 0 if pred_a has a higher R^2 against y_true than pred_b, otherwise returns 1.', 'from sklearn.metrics import r2_score; compare r2_score(y_true, pred_a) against r2_score(y_true, pred_b).', $py$from sklearn.metrics import r2_score

def better_model(y_true, pred_a, pred_b):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'better_model picks the closer predictions (index 0)'
try:
    _actual = better_model(np.array([1.0,2.0,3.0,4.0]), np.array([1.1,2.1,2.9,4.1]), np.array([5.0,-3.0,10.0,0.0]))
    _ok = _actual == 0
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'better_model picks the closer predictions (index 1)'
try:
    _actual = better_model(np.array([1.0,2.0,3.0,4.0]), np.array([5.0,-3.0,10.0,0.0]), np.array([1.1,2.1,2.9,4.1]))
    _ok = _actual == 1
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000012', '10000000-0000-0000-0000-000000000101', 9, 'Mean Absolute Percentage Error', 'medium', 'Write mape(y_true, y_pred) that computes the mean absolute percentage error: mean(abs((y_true - y_pred) / y_true)) * 100, assuming no y_true value is zero.', 'np.mean(np.abs((y_true - y_pred) / y_true)) * 100.', $py$def mape(y_true, y_pred):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
import numpy as np
_desc = 'mape is 0 for a perfect fit'
try:
    _actual = mape(np.array([10.0,20.0,30.0]), np.array([10.0,20.0,30.0]))
    _ok = abs(_actual - 0.0) < 1e-9
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
_desc = 'mape matches a hand-computed value'
try:
    _actual = mape(np.array([100.0, 200.0]), np.array([110.0, 180.0]))
    _ok = abs(_actual - 10.0) < 1e-6
except Exception as _e:
    _actual = "<error: " + type(_e).__name__ + ": " + str(_e) + ">"
    _ok = False
if _ok:
    _passed += 1
    print("PASS: " + _desc)
else:
    print("FAIL: " + _desc + " -- got " + repr(_actual))
print(str(_passed) + "/" + str(_total) + " tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000102', 1, 'The sigmoid function', 'easy', 'Write `sigmoid(z)` that computes the logistic sigmoid 1 / (1 + e^-z). It should work on a single number or a NumPy array (element-wise).', 'Use np.exp(-z); NumPy applies it element-wise automatically if z is an array.', $py$import numpy as np

def sigmoid(z):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 5
cases = [
    (0.0, 0.5),
    (100.0, 1.0),
    (-100.0, 0.0),
    (2.0, 1 / (1 + np.exp(-2.0))),
]
for z, expected in cases:
    actual = sigmoid(z)
    desc = f"sigmoid({z})"
    if abs(actual - expected) < 1e-6:
        _passed += 1
        print(f"PASS: {desc} ~= {expected:.6f}")
    else:
        print(f"FAIL: {desc} returned {actual}, expected ~{expected:.6f}")

arr_result = np.asarray(sigmoid(np.array([-100.0, 0.0, 100.0])))
expected_arr = np.array([0.0, 0.5, 1.0])
if np.allclose(arr_result, expected_arr, atol=1e-6):
    _passed += 1
    print("PASS: sigmoid(array) works elementwise")
else:
    print(f"FAIL: sigmoid(array) returned {arr_result}, expected {expected_arr}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000102', 2, 'Computing probabilities', 'easy', 'Write `predict_proba(X, w, b)` for logistic regression: given a feature matrix X (n_samples x n_features), weight vector w, and bias b, return the predicted probability of the positive class for each row (apply the linear combination, then sigmoid).', 'z = X @ w + b (matrix-vector product), then run z through sigmoid: 1 / (1 + np.exp(-z)).', $py$import numpy as np

def predict_proba(X, w, b):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X1 = np.array([[1.0, 2.0], [3.0, 4.0], [-1.0, -2.0]])
w1 = np.array([0.5, -0.5])
b1 = 0.1
expected1 = 1 / (1 + np.exp(-(X1 @ w1 + b1)))
actual1 = np.asarray(predict_proba(X1, w1, b1))
if actual1.shape == expected1.shape and np.allclose(actual1, expected1, atol=1e-6):
    _passed += 1
    print("PASS: predict_proba correct for 3x2 input")
else:
    print(f"FAIL: predict_proba returned {actual1}, expected {expected1}")

X2 = np.array([[0.0, 0.0]])
w2 = np.array([1.0, 1.0])
b2 = 0.0
expected2 = np.array([0.5])
actual2 = np.asarray(predict_proba(X2, w2, b2))
if np.allclose(actual2, expected2, atol=1e-6):
    _passed += 1
    print("PASS: predict_proba at origin == 0.5")
else:
    print(f"FAIL: predict_proba returned {actual2}, expected {expected2}")

X3 = np.array([[10.0, 10.0], [-10.0, -10.0]])
w3 = np.array([1.0, 1.0])
b3 = 0.0
actual3 = np.asarray(predict_proba(X3, w3, b3))
if actual3[0] > 0.999 and actual3[1] < 0.001:
    _passed += 1
    print("PASS: predict_proba saturates near 0/1 for extreme inputs")
else:
    print(f"FAIL: predict_proba extremes returned {actual3}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000102', 3, 'Binary cross-entropy loss', 'medium', 'Write `bce_loss(y_true, y_pred)` computing the average binary cross-entropy loss: -mean(y*log(p) + (1-y)*log(1-p)). Clip predicted probabilities to [1e-15, 1-1e-15] first so log(0) never happens.', 'np.clip(y_pred, eps, 1 - eps) before taking any logs; without it, a prediction of exactly 0.0 or 1.0 produces -inf or nan.', $py$import numpy as np

def bce_loss(y_true, y_pred):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

y_true1 = np.array([1, 0, 1, 0])
y_pred1 = np.array([0.9, 0.1, 0.8, 0.2])
expected1 = -np.mean(y_true1 * np.log(y_pred1) + (1 - y_true1) * np.log(1 - y_pred1))
actual1 = bce_loss(y_true1, y_pred1)
if abs(actual1 - expected1) < 1e-4:
    _passed += 1
    print(f"PASS: bce_loss ~= {expected1:.6f}")
else:
    print(f"FAIL: bce_loss returned {actual1}, expected ~{expected1:.6f}")

y_true2 = np.array([1, 1, 1])
y_pred2 = np.array([1.0, 1.0, 1.0])
actual2 = bce_loss(y_true2, y_pred2)
if abs(actual2 - 0.0) < 1e-6:
    _passed += 1
    print("PASS: bce_loss is ~0 for perfect confident predictions")
else:
    print(f"FAIL: bce_loss returned {actual2}, expected ~0.0")

y_true3 = np.array([1])
y_pred3 = np.array([0.0])
actual3 = bce_loss(y_true3, y_pred3)
if np.isfinite(actual3) and actual3 > 10:
    _passed += 1
    print("PASS: bce_loss stays finite (clipped) for a p=0 prediction on a positive label")
else:
    print(f"FAIL: bce_loss returned {actual3}, expected a large finite number")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000102', 4, 'Gradients of the loss', 'medium', 'Write `compute_gradients(X, y, w, b)` returning `(dw, db)`, the gradients of the binary cross-entropy loss with respect to the weights and bias. First compute predicted probabilities, then `error = preds - y`, then `dw = X.T @ error / n` and `db = mean(error)`.', 'The BCE gradient has a clean closed form once you have predicted probabilities -- no need to differentiate log() by hand, just use error = preds - y.', $py$import numpy as np

def compute_gradients(X, y, w, b):
    # TODO -- return (dw, db)
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

X = np.array([[1.0, 0.0], [0.0, 1.0], [1.0, 1.0], [0.0, 0.0]])
y = np.array([1.0, 0.0, 1.0, 0.0])
w = np.array([0.0, 0.0])
b = 0.0
dw, db = compute_gradients(X, y, w, b)

z = X @ w + b
preds = 1 / (1 + np.exp(-z))
error = preds - y
expected_dw = (X.T @ error) / X.shape[0]
expected_db = np.mean(error)

if np.allclose(dw, expected_dw, atol=1e-6):
    _passed += 1
    print(f"PASS: dw ~= {expected_dw}")
else:
    print(f"FAIL: dw returned {dw}, expected ~{expected_dw}")

if abs(db - expected_db) < 1e-6:
    _passed += 1
    print(f"PASS: db ~= {expected_db:.6f}")
else:
    print(f"FAIL: db returned {db}, expected ~{expected_db:.6f}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000102', 5, 'One step of gradient descent', 'medium', 'Write `gradient_descent_step(X, y, w, b, lr)` that performs one gradient descent update and returns the new `(w, b)`. Compute the gradients the same way as before, then move each parameter a small step (`lr`) opposite the gradient.', 'new_w = w - lr * dw and new_b = b - lr * db -- descent means subtracting the gradient, not adding it.', $py$import numpy as np

def gradient_descent_step(X, y, w, b, lr):
    # TODO -- return (new_w, new_b)
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

X = np.array([[1.0, 2.0], [2.0, 1.0], [-1.0, -2.0], [-2.0, -1.0]])
y = np.array([1.0, 1.0, 0.0, 0.0])
w = np.array([0.0, 0.0])
b = 0.0

new_w, new_b = gradient_descent_step(X, y, w, b, lr=0.5)

z = X @ w + b
preds = 1 / (1 + np.exp(-z))
error = preds - y
dw = (X.T @ error) / X.shape[0]
db = np.mean(error)
expected_w = w - 0.5 * dw
expected_b = b - 0.5 * db

if np.allclose(new_w, expected_w, atol=1e-6):
    _passed += 1
    print(f"PASS: updated w ~= {expected_w}")
else:
    print(f"FAIL: updated w returned {new_w}, expected ~{expected_w}")

if abs(new_b - expected_b) < 1e-6:
    _passed += 1
    print(f"PASS: updated b ~= {expected_b:.6f}")
else:
    print(f"FAIL: updated b returned {new_b}, expected ~{expected_b:.6f}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000102', 6, 'Training loop from scratch', 'hard', 'Write `fit_logistic_regression(X, y, lr=0.5, epochs=1000)` implementing the full training loop: initialize `w` as zeros and `b` as 0.0, then repeatedly apply the gradient descent update `epochs` times. Return the final `(w, b)`.', 'Reuse the same per-step logic as the single gradient descent step, just wrapped in a for loop over range(epochs). No randomness is involved since weights start at zero.', $py$import numpy as np

def fit_logistic_regression(X, y, lr=0.5, epochs=1000):
    # TODO -- initialize w as zeros (one per feature) and b as 0.0,
    # run `epochs` gradient descent steps, and return the final (w, b)
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X = np.array([
    [2.0, 3.0], [1.0, 1.0], [3.0, 2.5], [0.5, 1.5],
    [-2.0, -3.0], [-1.0, -1.0], [-3.0, -2.5], [-0.5, -1.5],
])
y = np.array([1, 1, 1, 1, 0, 0, 0, 0], dtype=float)

w, b = fit_logistic_regression(X, y, lr=0.5, epochs=2000)
w = np.asarray(w)

if w.shape == (2,):
    _passed += 1
    print(f"PASS: w has shape (2,): {w}")
else:
    print(f"FAIL: w has shape {w.shape}, expected (2,)")

z = X @ w + float(b)
probs = 1 / (1 + np.exp(-z))
preds = (probs >= 0.5).astype(int)
acc = np.mean(preds == y)
if acc >= 0.99:
    _passed += 1
    print(f"PASS: training accuracy {acc:.2f} on separable data")
else:
    print(f"FAIL: training accuracy only {acc:.2f}, expected >= 0.99")

if w[0] > 0 and w[1] > 0:
    _passed += 1
    print("PASS: learned weights point in the positive-class direction")
else:
    print(f"FAIL: expected both weights positive, got {w}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000102', 7, 'From probability to class label', 'easy', 'Write `predict(X, w, b, threshold=0.5)` that returns 0/1 integer class predictions: compute probabilities as before, then compare against `threshold`.', '(probs >= threshold).astype(int) turns a boolean array into 0/1 integers.', $py$import numpy as np

def predict(X, w, b, threshold=0.5):
    # TODO -- return an array of 0/1 int predictions
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X = np.array([[2.0], [-2.0], [0.1], [-0.1]])
w = np.array([1.0])
b = 0.0
preds = np.asarray(predict(X, w, b))
expected = np.array([1, 0, 1, 0])
if np.array_equal(preds, expected):
    _passed += 1
    print(f"PASS: predictions {preds} match expected {expected}")
else:
    print(f"FAIL: predictions {preds}, expected {expected}")

preds_thresh = np.asarray(predict(X, w, b, threshold=0.9))
expected_thresh = np.array([0, 0, 0, 0])
if np.array_equal(preds_thresh, expected_thresh):
    _passed += 1
    print("PASS: a strict 0.9 threshold classifies weak positives as 0")
else:
    print(f"FAIL: predictions {preds_thresh} with threshold=0.9, expected {expected_thresh}")

if preds.dtype.kind in ("i", "u"):
    _passed += 1
    print("PASS: predict returns integer labels")
else:
    print(f"FAIL: predict returned dtype {preds.dtype}, expected integer labels")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000102', 8, 'Measuring accuracy', 'easy', 'Write `accuracy_score(y_true, y_pred)` returning the fraction of predictions that match the true labels.', 'np.mean(y_true == y_pred) counts matches and divides by the total in one call.', $py$import numpy as np

def accuracy_score(y_true, y_pred):
    # TODO
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

y_true1 = np.array([1, 0, 1, 1, 0])
y_pred1 = np.array([1, 0, 0, 1, 0])
actual1 = accuracy_score(y_true1, y_pred1)
if abs(actual1 - 0.8) < 1e-9:
    _passed += 1
    print(f"PASS: accuracy_score == 0.8")
else:
    print(f"FAIL: accuracy_score returned {actual1}, expected 0.8")

y_true2 = np.array([1, 1, 1])
y_pred2 = np.array([1, 1, 1])
actual2 = accuracy_score(y_true2, y_pred2)
if abs(actual2 - 1.0) < 1e-9:
    _passed += 1
    print("PASS: accuracy_score == 1.0 for a perfect match")
else:
    print(f"FAIL: accuracy_score returned {actual2}, expected 1.0")

y_true3 = np.array([0, 0, 1, 1])
y_pred3 = np.array([1, 1, 0, 0])
actual3 = accuracy_score(y_true3, y_pred3)
if abs(actual3 - 0.0) < 1e-9:
    _passed += 1
    print("PASS: accuracy_score == 0.0 when every prediction is wrong")
else:
    print(f"FAIL: accuracy_score returned {actual3}, expected 0.0")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000102', 9, 'Watching the loss converge', 'medium', 'Write `train_with_history(X, y, lr=0.5, epochs=200)` that behaves like the training loop, but also records the BCE loss computed just before each update into a list. Return `(w, b, losses)`.', 'Compute predictions and the loss first, append it to your list, and only then compute gradients and update w/b -- the loss you record should reflect the parameters BEFORE that step''s update.', $py$import numpy as np

def train_with_history(X, y, lr=0.5, epochs=200):
    # TODO -- like fit_logistic_regression, but also return a list of the
    # loss computed BEFORE each update. Return (w, b, losses).
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X = np.array([
    [2.0, 3.0], [1.0, 1.0], [3.0, 2.5], [0.5, 1.5],
    [-2.0, -3.0], [-1.0, -1.0], [-3.0, -2.5], [-0.5, -1.5],
])
y = np.array([1, 1, 1, 1, 0, 0, 0, 0], dtype=float)

w, b, losses = train_with_history(X, y, lr=0.5, epochs=200)

if len(losses) == 200:
    _passed += 1
    print(f"PASS: got a loss recorded for all 200 epochs")
else:
    print(f"FAIL: got {len(losses)} loss values, expected 200")

if losses[0] > losses[-1]:
    _passed += 1
    print(f"PASS: loss decreased from {losses[0]:.4f} to {losses[-1]:.4f}")
else:
    print(f"FAIL: loss did not decrease ({losses[0]:.4f} -> {losses[-1]:.4f})")

if losses[-1] < 0.2:
    _passed += 1
    print(f"PASS: final loss {losses[-1]:.4f} is low on separable data")
else:
    print(f"FAIL: final loss {losses[-1]:.4f}, expected < 0.2")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000102', 10, 'End-to-end: train and evaluate', 'hard', 'Write `train_and_evaluate(X_train, y_train, X_test, y_test, lr=0.5, epochs=2000)` that trains a from-scratch logistic regression on the training set (zeros init, full gradient descent loop) and returns accuracy on the held-out test set.', 'This combines everything: initialize w/b, loop epochs times updating them, then run predict on X_test and compare to y_test with np.mean(preds == y_test).', $py$import numpy as np

def train_and_evaluate(X_train, y_train, X_test, y_test, lr=0.5, epochs=2000):
    # TODO -- train a logistic regression from scratch on the training set
    # and return test-set accuracy (a float between 0 and 1).
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(42)
n = 40
class0 = np.random.randn(n, 2) + np.array([-2.0, -2.0])
class1 = np.random.randn(n, 2) + np.array([2.0, 2.0])
X = np.vstack([class0, class1])
y = np.array([0] * n + [1] * n, dtype=float)

perm = np.random.permutation(2 * n)
X, y = X[perm], y[perm]
split = int(0.75 * len(y))
X_train, X_test = X[:split], X[split:]
y_train, y_test = y[:split], y[split:]

acc = train_and_evaluate(X_train, y_train, X_test, y_test, lr=0.5, epochs=2000)

if isinstance(acc, (float, np.floating)):
    _passed += 1
    print(f"PASS: returned a float ({acc:.3f})")
else:
    print(f"FAIL: returned type {type(acc)}, expected a float")

if acc >= 0.85:
    _passed += 1
    print(f"PASS: test accuracy {acc:.3f} >= 0.85 on well-separated blobs")
else:
    print(f"FAIL: test accuracy {acc:.3f}, expected >= 0.85")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000103', 1, 'Your first sklearn classifier', 'easy', 'Write `fit_and_predict(X_train, y_train, X_new)` that fits `sklearn.linear_model.LogisticRegression` on the training data and returns its predictions for `X_new`.', 'model = LogisticRegression(); model.fit(X_train, y_train); return model.predict(X_new).', $py$from sklearn.linear_model import LogisticRegression

def fit_and_predict(X_train, y_train, X_new):
    # TODO -- fit a LogisticRegression on (X_train, y_train) and return
    # its predictions for X_new
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

X_train = np.array([[-2.0], [-1.5], [-1.0], [1.0], [1.5], [2.0]])
y_train = np.array([0, 0, 0, 1, 1, 1])
X_new = np.array([[-1.8], [1.8]])

preds = np.asarray(fit_and_predict(X_train, y_train, X_new))
expected = np.array([0, 1])
if np.array_equal(preds, expected):
    _passed += 1
    print(f"PASS: predictions {preds} match {expected}")
else:
    print(f"FAIL: predictions {preds}, expected {expected}")

if len(preds) == 2:
    _passed += 1
    print("PASS: returned one prediction per input row")
else:
    print(f"FAIL: returned {len(preds)} predictions, expected 2")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000103', 2, 'Predicted probabilities', 'easy', 'Write `positive_class_probability(X_train, y_train, X_new)` that fits a LogisticRegression and returns the probability of class 1 for each row of X_new (a 1-D array), using `model.predict_proba`.', 'predict_proba returns one column per class in the order given by model.classes_ -- look up the column index for class 1 rather than assuming it''s column 1.', $py$from sklearn.linear_model import LogisticRegression

def positive_class_probability(X_train, y_train, X_new):
    # TODO -- fit LogisticRegression, then return the predicted
    # probability of the POSITIVE (class 1) label for each row of X_new
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X_train = np.array([[-3.0], [-2.0], [-1.0], [1.0], [2.0], [3.0]])
y_train = np.array([0, 0, 0, 1, 1, 1])
X_new = np.array([[-3.0], [0.0], [3.0]])

proba = np.asarray(positive_class_probability(X_train, y_train, X_new))

if proba.shape == (3,):
    _passed += 1
    print(f"PASS: got one probability per row: {proba}")
else:
    print(f"FAIL: shape {proba.shape}, expected (3,)")

if proba[0] < 0.3:
    _passed += 1
    print(f"PASS: far-negative point has low P(class=1) ({proba[0]:.3f})")
else:
    print(f"FAIL: P(class=1) for far-negative point was {proba[0]:.3f}, expected < 0.3")

if proba[2] > 0.7:
    _passed += 1
    print(f"PASS: far-positive point has high P(class=1) ({proba[2]:.3f})")
else:
    print(f"FAIL: P(class=1) for far-positive point was {proba[2]:.3f}, expected > 0.7")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000103', 3, 'Reading the learned weights', 'easy', 'Write `get_coefficients(X_train, y_train)` that fits a LogisticRegression and returns `(coef, intercept)`: `coef` as a 1-D array (one weight per feature, from `model.coef_[0]`) and `intercept` as a plain float (from `model.intercept_[0]`).', 'model.coef_ is shape (1, n_features) for binary classification -- index [0] to flatten it to one weight per feature.', $py$from sklearn.linear_model import LogisticRegression

def get_coefficients(X_train, y_train):
    # TODO -- fit LogisticRegression and return (coef, intercept) where
    # coef is a 1-D array of one weight per feature and intercept is a float
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X_train = np.array([[-3.0, 0.0], [-2.0, 0.0], [-1.0, 0.0], [1.0, 0.0], [2.0, 0.0], [3.0, 0.0]])
y_train = np.array([0, 0, 0, 1, 1, 1])

coef, intercept = get_coefficients(X_train, y_train)
coef = np.asarray(coef)

if coef.shape == (2,):
    _passed += 1
    print(f"PASS: coef has one entry per feature: {coef}")
else:
    print(f"FAIL: coef shape {coef.shape}, expected (2,)")

if coef[0] > 0:
    _passed += 1
    print(f"PASS: coef for the informative feature is positive ({coef[0]:.3f})")
else:
    print(f"FAIL: expected a positive coefficient for feature 0, got {coef[0]:.3f}")

if isinstance(intercept, float):
    _passed += 1
    print(f"PASS: intercept is a plain float ({intercept:.3f})")
else:
    print(f"FAIL: intercept type {type(intercept)}, expected float")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000103', 4, 'Train/test split with sklearn', 'medium', 'Write `split_fit_score(X, y)` that splits the data 75/25 using `train_test_split(..., test_size=0.25, random_state=42)`, fits a LogisticRegression on the training split, and returns its accuracy on the test split.', 'model.score(X_test, y_test) computes accuracy directly for classifiers -- no need to call predict separately.', $py$from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split

def split_fit_score(X, y):
    # TODO -- split into 75/25 train/test with train_test_split
    # (random_state=42), fit LogisticRegression on the train split,
    # and return its accuracy on the test split (model.score)
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(0)
n = 100
class0 = np.random.randn(n, 2) + np.array([-2.0, -2.0])
class1 = np.random.randn(n, 2) + np.array([2.0, 2.0])
X = np.vstack([class0, class1])
y = np.array([0] * n + [1] * n)

acc = split_fit_score(X, y)

if isinstance(acc, float):
    _passed += 1
    print(f"PASS: returned a float ({acc:.3f})")
else:
    print(f"FAIL: returned type {type(acc)}, expected float")

if acc >= 0.9:
    _passed += 1
    print(f"PASS: test accuracy {acc:.3f} >= 0.9 on well-separated blobs")
else:
    print(f"FAIL: test accuracy {acc:.3f}, expected >= 0.9")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000103', 5, 'Multi-class logistic regression', 'medium', 'Write `fit_multiclass(X_train, y_train, X_new)` that fits LogisticRegression on a dataset with 3 classes and returns its predictions for `X_new`. sklearn handles the multi-class case automatically -- no special setup needed beyond fitting.', 'LogisticRegression natively supports more than 2 classes; pass max_iter=1000 so it has room to converge on harder problems.', $py$from sklearn.linear_model import LogisticRegression

def fit_multiclass(X_train, y_train, X_new):
    # TODO -- fit LogisticRegression on a 3-class problem and return
    # predictions for X_new
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

np.random.seed(1)
n = 30
c0 = np.random.randn(n, 2) * 0.5 + np.array([0.0, 0.0])
c1 = np.random.randn(n, 2) * 0.5 + np.array([5.0, 0.0])
c2 = np.random.randn(n, 2) * 0.5 + np.array([2.5, 5.0])
X_train = np.vstack([c0, c1, c2])
y_train = np.array([0] * n + [1] * n + [2] * n)
X_new = np.array([[0.0, 0.0], [5.0, 0.0], [2.5, 5.0]])

preds = np.asarray(fit_multiclass(X_train, y_train, X_new))

if len(set(preds.tolist())) == 3:
    _passed += 1
    print(f"PASS: all three well-separated clusters got distinct labels: {preds}")
else:
    print(f"FAIL: predictions {preds}, expected 3 distinct labels")

expected = np.array([0, 1, 2])
if np.array_equal(preds, expected):
    _passed += 1
    print("PASS: cluster centers classified as 0, 1, 2 respectively")
else:
    print(f"FAIL: predictions {preds}, expected {expected}")

if set(preds.tolist()) <= {0, 1, 2}:
    _passed += 1
    print("PASS: predictions only use valid class labels")
else:
    print(f"FAIL: predictions {preds} contain labels outside {{0,1,2}}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000103', 6, 'Regularization strength (C)', 'medium', 'Write `train_accuracy_for_C(X_train, y_train, C)` that fits LogisticRegression with the given regularization strength `C` and returns its accuracy on the TRAINING set. Smaller `C` means stronger regularization (more constrained weights); larger `C` means weaker regularization (weights can grow to fit the training data more closely).', 'Pass C=C directly to LogisticRegression''s constructor. Use model.score(X_train, y_train) to measure fit on the same data it trained on.', $py$from sklearn.linear_model import LogisticRegression

def train_accuracy_for_C(X_train, y_train, C):
    # TODO -- fit LogisticRegression with regularization strength C
    # and return its accuracy on the training set itself
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(7)
n = 50
X_train = np.random.randn(n, 5)
true_w = np.array([3.0, -3.0, 0.0, 0.0, 0.0])
noise = np.random.randn(n) * 2.0
y_train = ((X_train @ true_w + noise) > 0).astype(int)

acc_strong_reg = train_accuracy_for_C(X_train, y_train, C=0.001)
acc_weak_reg = train_accuracy_for_C(X_train, y_train, C=100.0)

if isinstance(acc_strong_reg, float) and isinstance(acc_weak_reg, float):
    _passed += 1
    print(f"PASS: both calls returned floats ({acc_strong_reg:.3f}, {acc_weak_reg:.3f})")
else:
    print("FAIL: expected float return values")

if acc_weak_reg >= acc_strong_reg - 1e-9:
    _passed += 1
    print(f"PASS: weaker regularization (C=100) fits training data at least as well as strong (C=0.001): {acc_weak_reg:.3f} >= {acc_strong_reg:.3f}")
else:
    print(f"FAIL: expected weak regularization to fit training data at least as well, got {acc_weak_reg:.3f} < {acc_strong_reg:.3f}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000103', 7, 'Which feature matters most', 'medium', 'Write `most_influential_feature(X_train, y_train)` that fits LogisticRegression and returns the integer index of the feature with the largest absolute-value coefficient (the strongest linear influence on the prediction).', 'np.argmax(np.abs(model.coef_[0])) gives the index directly.', $py$from sklearn.linear_model import LogisticRegression

def most_influential_feature(X_train, y_train):
    # TODO -- fit LogisticRegression and return the INDEX of the feature
    # with the largest-magnitude coefficient
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(3)
n = 200
X_train = np.random.randn(n, 3)
true_w = np.array([5.0, 0.1, -0.2])
y_train = (X_train @ true_w > 0).astype(int)

idx = most_influential_feature(X_train, y_train)

if idx == 0:
    _passed += 1
    print(f"PASS: identified feature 0 as most influential (index={idx})")
else:
    print(f"FAIL: returned index {idx}, expected 0")

if isinstance(idx, int):
    _passed += 1
    print("PASS: returned a plain int index")
else:
    print(f"FAIL: returned type {type(idx)}, expected int")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000103', 8, 'Handling imbalanced classes', 'medium', 'Write `fit_balanced(X_train, y_train, X_new)` that fits LogisticRegression with `class_weight=''balanced''` (which upweights the minority class automatically) and returns predictions for `X_new`.', 'Just pass class_weight=''balanced'' to the LogisticRegression constructor -- sklearn computes the per-class weights for you.', $py$from sklearn.linear_model import LogisticRegression

def fit_balanced(X_train, y_train, X_new):
    # TODO -- fit LogisticRegression with class_weight='balanced' and
    # return predictions for X_new
    pass
$py$, $py$import numpy as np
from sklearn.linear_model import LogisticRegression
_passed = 0
_total = 2

np.random.seed(11)
n_majority, n_minority = 190, 10
majority = np.random.randn(n_majority, 2) + np.array([0.0, 0.0])
minority = np.random.randn(n_minority, 2) + np.array([3.0, 3.0])
X_train = np.vstack([majority, minority])
y_train = np.array([0] * n_majority + [1] * n_minority)
X_new = np.array([[3.0, 3.0]])

preds = np.asarray(fit_balanced(X_train, y_train, X_new))

if preds.shape == (1,):
    _passed += 1
    print(f"PASS: got one prediction: {preds}")
else:
    print(f"FAIL: shape {preds.shape}, expected (1,)")

unbalanced = LogisticRegression()
unbalanced.fit(X_train, y_train)
if not np.array_equal(unbalanced.coef_, LogisticRegression(class_weight='balanced').fit(X_train, y_train).coef_):
    _passed += 1
    print("PASS: class_weight='balanced' produces different coefficients than the default")
else:
    print("FAIL: expected class_weight='balanced' to change the fitted coefficients")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000103', 9, 'Scaling and fitting in one pipeline', 'hard', 'Write `build_and_fit_pipeline(X_train, y_train)` that builds an sklearn `Pipeline` with a `StandardScaler` step named `"scaler"` and a `LogisticRegression` step named `"clf"`, fits it on the training data, and returns the fitted pipeline.', 'Pipeline([("scaler", StandardScaler()), ("clf", LogisticRegression())]) then pipe.fit(X_train, y_train) -- calling .fit on the pipeline fits every step in order.', $py$from sklearn.linear_model import LogisticRegression
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import Pipeline

def build_and_fit_pipeline(X_train, y_train):
    # TODO -- build a Pipeline with a StandardScaler step named "scaler"
    # followed by a LogisticRegression step named "clf", fit it on the
    # training data, and return the fitted pipeline
    pass
$py$, $py$import numpy as np
from sklearn.pipeline import Pipeline
_passed = 0
_total = 3

np.random.seed(5)
n = 60
class0 = np.random.randn(n, 2) * np.array([100.0, 1.0]) + np.array([-200.0, -2.0])
class1 = np.random.randn(n, 2) * np.array([100.0, 1.0]) + np.array([200.0, 2.0])
X_train = np.vstack([class0, class1])
y_train = np.array([0] * n + [1] * n)

pipe = build_and_fit_pipeline(X_train, y_train)

if isinstance(pipe, Pipeline):
    _passed += 1
    print("PASS: returned a fitted Pipeline")
else:
    print(f"FAIL: returned type {type(pipe)}, expected a Pipeline")

if "scaler" in pipe.named_steps and "clf" in pipe.named_steps:
    _passed += 1
    print("PASS: pipeline has 'scaler' and 'clf' steps")
else:
    print(f"FAIL: pipeline steps were {list(pipe.named_steps.keys())}, expected 'scaler' and 'clf'")

acc = pipe.score(X_train, y_train)
if acc >= 0.9:
    _passed += 1
    print(f"PASS: pipeline achieves {acc:.3f} training accuracy on separable data")
else:
    print(f"FAIL: training accuracy only {acc:.3f}, expected >= 0.9")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000104', 1, 'Your first decision tree', 'easy', 'Write `fit_and_predict(X_train, y_train, X_new)` that fits `sklearn.tree.DecisionTreeClassifier(random_state=42)` and returns predictions for `X_new`.', 'Same fit/predict pattern as LogisticRegression -- just a different model class.', $py$from sklearn.tree import DecisionTreeClassifier

def fit_and_predict(X_train, y_train, X_new):
    # TODO -- fit a DecisionTreeClassifier(random_state=42) and return
    # its predictions for X_new
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

X_train = np.array([[1.0], [2.0], [3.0], [8.0], [9.0], [10.0]])
y_train = np.array([0, 0, 0, 1, 1, 1])
X_new = np.array([[1.5], [9.5]])

preds = np.asarray(fit_and_predict(X_train, y_train, X_new))
expected = np.array([0, 1])
if np.array_equal(preds, expected):
    _passed += 1
    print(f"PASS: predictions {preds} match {expected}")
else:
    print(f"FAIL: predictions {preds}, expected {expected}")

if len(preds) == 2:
    _passed += 1
    print("PASS: one prediction per input row")
else:
    print(f"FAIL: got {len(preds)} predictions, expected 2")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000104', 2, 'Controlling tree depth', 'easy', 'Write `fit_with_depth(X_train, y_train, X_test, y_test, max_depth)` that fits a DecisionTreeClassifier with the given `max_depth` (and `random_state=42`) and returns its test-set accuracy.', 'max_depth limits how many splits deep the tree can go -- pass it straight through to the constructor.', $py$from sklearn.tree import DecisionTreeClassifier

def fit_with_depth(X_train, y_train, X_test, y_test, max_depth):
    # TODO -- fit DecisionTreeClassifier(max_depth=max_depth, random_state=42)
    # and return its accuracy on X_test/y_test
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(42)
n = 60
class0 = np.random.randn(n, 2) + np.array([-2.0, -2.0])
class1 = np.random.randn(n, 2) + np.array([2.0, 2.0])
X = np.vstack([class0, class1])
y = np.array([0] * n + [1] * n)
split = 80
X_train, X_test = X[:split], X[split:]
y_train, y_test = y[:split], y[split:]

acc_shallow = fit_with_depth(X_train, y_train, X_test, y_test, max_depth=1)

if isinstance(acc_shallow, float):
    _passed += 1
    print(f"PASS: returned a float ({acc_shallow:.3f})")
else:
    print(f"FAIL: returned type {type(acc_shallow)}, expected float")

if acc_shallow >= 0.8:
    _passed += 1
    print(f"PASS: even depth=1 separates these well-separated blobs well ({acc_shallow:.3f})")
else:
    print(f"FAIL: accuracy {acc_shallow:.3f}, expected >= 0.8")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000104', 3, 'Which feature the tree splits on', 'easy', 'Write `most_important_feature_index(X_train, y_train)` that fits a DecisionTreeClassifier(random_state=42) and returns the index of the feature with the largest value in `model.feature_importances_`.', 'np.argmax(model.feature_importances_) gives the index directly.', $py$from sklearn.tree import DecisionTreeClassifier

def most_important_feature_index(X_train, y_train):
    # TODO -- fit a DecisionTreeClassifier(random_state=42) and return the
    # index of the feature with the highest feature_importances_ value
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(9)
n = 200
X_train = np.random.randn(n, 3)
y_train = (X_train[:, 1] > 0).astype(int)

idx = most_important_feature_index(X_train, y_train)

if idx == 1:
    _passed += 1
    print(f"PASS: identified feature 1 (the only informative one) as most important")
else:
    print(f"FAIL: returned index {idx}, expected 1")

if isinstance(idx, int):
    _passed += 1
    print("PASS: returned a plain int")
else:
    print(f"FAIL: returned type {type(idx)}, expected int")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000104', 4, 'Gini impurity by hand', 'medium', 'Write `gini_impurity(labels)` computing the Gini impurity of a node: 1 minus the sum of each class''s squared proportion. A pure node (one class only) should give 0.', 'Count how many times each label appears, divide by the total to get proportions, square each, sum them, and subtract from 1.', $py$def gini_impurity(labels):
    # TODO -- given a list/array of class labels for one node, return
    # the Gini impurity: 1 - sum(p_c^2) over each class c's proportion p_c
    pass
$py$, $py$_passed = 0
_total = 3

g1 = gini_impurity([0, 0, 0, 0])
if abs(g1 - 0.0) < 1e-9:
    _passed += 1
    print("PASS: a pure node (all one class) has gini == 0")
else:
    print(f"FAIL: gini_impurity returned {g1}, expected 0.0")

g2 = gini_impurity([0, 0, 1, 1])
if abs(g2 - 0.5) < 1e-9:
    _passed += 1
    print("PASS: an even 50/50 split of 2 classes has gini == 0.5")
else:
    print(f"FAIL: gini_impurity returned {g2}, expected 0.5")

g3 = gini_impurity([0, 0, 0, 1])
expected3 = 1 - ((3/4)**2 + (1/4)**2)
if abs(g3 - expected3) < 1e-9:
    _passed += 1
    print(f"PASS: gini_impurity ~= {expected3:.4f} for a 3:1 split")
else:
    print(f"FAIL: gini_impurity returned {g3}, expected ~{expected3:.4f}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000104', 5, 'Entropy by hand', 'medium', 'Write `entropy(labels)` computing the Shannon entropy of the class labels in a node: -sum(p_c * log2(p_c)) over each class''s proportion.', 'Same proportions as Gini, but plug each into -p*log2(p) and sum instead of 1 - sum(p^2). math.log2 handles the log base 2 directly.', $py$import math

def entropy(labels):
    # TODO -- return the Shannon entropy of the class labels:
    # -sum(p_c * log2(p_c)) over each class c's proportion p_c
    pass
$py$, $py$import math
_passed = 0
_total = 3

e1 = entropy([0, 0, 0, 0])
if abs(e1 - 0.0) < 1e-9:
    _passed += 1
    print("PASS: a pure node has entropy == 0")
else:
    print(f"FAIL: entropy returned {e1}, expected 0.0")

e2 = entropy([0, 0, 1, 1])
if abs(e2 - 1.0) < 1e-9:
    _passed += 1
    print("PASS: a 50/50 split of 2 classes has entropy == 1.0 bit")
else:
    print(f"FAIL: entropy returned {e2}, expected 1.0")

e3 = entropy([0, 0, 0, 1])
expected3 = -(0.75 * math.log2(0.75) + 0.25 * math.log2(0.25))
if abs(e3 - expected3) < 1e-9:
    _passed += 1
    print(f"PASS: entropy ~= {expected3:.4f} for a 3:1 split")
else:
    print(f"FAIL: entropy returned {e3}, expected ~{expected3:.4f}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000104', 6, 'Information gain', 'medium', 'Write `information_gain(parent_labels, left_labels, right_labels)`: the entropy of the parent node minus the size-weighted average entropy of the two child nodes produced by a split. Higher gain means a more useful split.', 'weighted_child_entropy = (len(left)/len(parent))*entropy(left) + (len(right)/len(parent))*entropy(right), then subtract that from entropy(parent).', $py$import math

def entropy(labels):
    # (already implemented for you, from the previous lesson)
    labels = list(labels)
    n = len(labels)
    if n == 0:
        return 0.0
    counts = {}
    for lbl in labels:
        counts[lbl] = counts.get(lbl, 0) + 1
    total = 0.0
    for c in counts.values():
        p = c / n
        total -= p * math.log2(p)
    return total

def information_gain(parent_labels, left_labels, right_labels):
    # TODO -- using entropy, return the information gain of a split:
    # entropy(parent) - weighted average of entropy(left) and entropy(right)
    pass
$py$, $py$_passed = 0
_total = 3

parent = [0, 0, 1, 1]
left = [0, 0]
right = [1, 1]
gain = information_gain(parent, left, right)
if abs(gain - 1.0) < 1e-9:
    _passed += 1
    print(f"PASS: a perfectly pure split has gain == 1.0, got {gain:.4f}")
else:
    print(f"FAIL: information_gain returned {gain}, expected 1.0")

parent2 = [0, 0, 1, 1]
left2 = [0, 1]
right2 = [0, 1]
gain2 = information_gain(parent2, left2, right2)
if abs(gain2 - 0.0) < 1e-9:
    _passed += 1
    print(f"PASS: a useless split (same mix on both sides) has gain == 0.0, got {gain2:.4f}")
else:
    print(f"FAIL: information_gain returned {gain2}, expected 0.0")

if gain > gain2:
    _passed += 1
    print("PASS: the pure split has strictly higher gain than the useless split")
else:
    print(f"FAIL: expected gain ({gain}) > gain2 ({gain2})")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000104', 7, 'Reading the fitted tree''s depth', 'medium', 'Write `tree_depth(X_train, y_train, max_depth=None)` that fits a DecisionTreeClassifier with the given `max_depth` and `random_state=42`, and returns the depth the fitted tree actually reached via `model.get_depth()`.', 'max_depth is a ceiling, not a target -- an uncapped tree (max_depth=None) will typically grow deeper than one capped at a small number.', $py$from sklearn.tree import DecisionTreeClassifier

def tree_depth(X_train, y_train, max_depth=None):
    # TODO -- fit DecisionTreeClassifier(max_depth=max_depth, random_state=42)
    # and return the actual depth the fitted tree reached (model.get_depth())
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(4)
n = 200
X_train = np.random.randn(n, 4)
y_train = (X_train[:, 0] + X_train[:, 1] > 0).astype(int)

depth_capped = tree_depth(X_train, y_train, max_depth=2)
if depth_capped <= 2:
    _passed += 1
    print(f"PASS: capped tree depth is {depth_capped} <= 2")
else:
    print(f"FAIL: capped tree depth was {depth_capped}, expected <= 2")

depth_uncapped = tree_depth(X_train, y_train, max_depth=None)
if depth_uncapped > depth_capped:
    _passed += 1
    print(f"PASS: uncapped tree ({depth_uncapped}) grows deeper than capped ({depth_capped})")
else:
    print(f"FAIL: expected uncapped depth ({depth_uncapped}) > capped depth ({depth_capped})")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000104', 8, 'Overfitting: train vs test accuracy', 'medium', 'Write `train_vs_test_accuracy(X_train, y_train, X_test, y_test, max_depth)` that fits a DecisionTreeClassifier with the given `max_depth` (`random_state=42`) and returns `(train_accuracy, test_accuracy)`.', 'model.score works on either split -- call it once with the train data and once with the test data.', $py$from sklearn.tree import DecisionTreeClassifier

def train_vs_test_accuracy(X_train, y_train, X_test, y_test, max_depth):
    # TODO -- fit DecisionTreeClassifier(max_depth=max_depth, random_state=42)
    # and return (train_accuracy, test_accuracy) as a tuple of two floats
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

np.random.seed(2)
n = 150
X = np.random.randn(n, 6)
y = (X[:, 0] > 0).astype(int)
noise_mask = np.random.rand(n) < 0.15
y[noise_mask] = 1 - y[noise_mask]
split = 100
X_train, X_test = X[:split], X[split:]
y_train, y_test = y[:split], y[split:]

train_acc_deep, test_acc_deep = train_vs_test_accuracy(X_train, y_train, X_test, y_test, max_depth=None)
train_acc_shallow, test_acc_shallow = train_vs_test_accuracy(X_train, y_train, X_test, y_test, max_depth=1)

if train_acc_deep >= train_acc_shallow:
    _passed += 1
    print(f"PASS: an unrestricted tree fits training data at least as well ({train_acc_deep:.3f} >= {train_acc_shallow:.3f})")
else:
    print(f"FAIL: expected unrestricted train accuracy ({train_acc_deep:.3f}) >= shallow ({train_acc_shallow:.3f})")

gap_deep = train_acc_deep - test_acc_deep
gap_shallow = train_acc_shallow - test_acc_shallow
if gap_deep >= gap_shallow - 0.05:
    _passed += 1
    print(f"PASS: the deep tree shows a train/test gap ({gap_deep:.3f}) at least close to the shallow one's ({gap_shallow:.3f}), consistent with overfitting risk")
else:
    print(f"FAIL: expected the deep tree's train/test gap ({gap_deep:.3f}) to not be much smaller than the shallow tree's ({gap_shallow:.3f})")

if all(isinstance(v, float) for v in (train_acc_deep, test_acc_deep, train_acc_shallow, test_acc_shallow)):
    _passed += 1
    print("PASS: all four returned values are floats")
else:
    print("FAIL: expected all four values to be floats")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000104', 9, 'Full pipeline: fit, evaluate, inspect', 'hard', 'Write `train_evaluate_importances(X_train, y_train, X_test, y_test, max_depth=3)` that fits a DecisionTreeClassifier, then returns a dict `{"accuracy": <test accuracy>, "importances": <feature_importances_ as a list>}`.', 'Build the dict from model.score(X_test, y_test) and list(model.feature_importances_) after fitting once on the training data.', $py$from sklearn.tree import DecisionTreeClassifier

def train_evaluate_importances(X_train, y_train, X_test, y_test, max_depth=3):
    # TODO -- fit DecisionTreeClassifier(max_depth=max_depth, random_state=42),
    # and return a dict: {"accuracy": test accuracy (float),
    # "importances": model.feature_importances_ as a list}
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

np.random.seed(6)
n = 150
X = np.random.randn(n, 3)
y = (X[:, 0] > 0).astype(int)
split = 100
X_train, X_test = X[:split], X[split:]
y_train, y_test = y[:split], y[split:]

result = train_evaluate_importances(X_train, y_train, X_test, y_test, max_depth=3)

if isinstance(result, dict) and "accuracy" in result and "importances" in result:
    _passed += 1
    print(f"PASS: got a dict with 'accuracy' and 'importances' keys")
else:
    print(f"FAIL: got {result}, expected a dict with 'accuracy' and 'importances'")

if result["accuracy"] >= 0.85:
    _passed += 1
    print(f"PASS: test accuracy {result['accuracy']:.3f} >= 0.85")
else:
    print(f"FAIL: test accuracy {result['accuracy']:.3f}, expected >= 0.85")

imps = result["importances"]
if len(imps) == 3 and int(np.argmax(imps)) == 0:
    _passed += 1
    print(f"PASS: feature 0 (the informative one) has the highest importance: {imps}")
else:
    print(f"FAIL: importances {imps}, expected 3 values with index 0 highest")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000105', 1, 'Euclidean distance', 'easy', 'Write `euclidean_distance(a, b)` returning the straight-line distance between two points (given as arrays or lists of the same length): sqrt(sum((a-b)^2)).', 'np.sqrt(np.sum((a - b) ** 2)) after converting both to numpy arrays.', $py$import numpy as np

def euclidean_distance(a, b):
    # TODO -- return the Euclidean distance between two 1-D points a and b
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

d1 = euclidean_distance([0, 0], [3, 4])
if abs(d1 - 5.0) < 1e-9:
    _passed += 1
    print("PASS: distance((0,0),(3,4)) == 5.0")
else:
    print(f"FAIL: got {d1}, expected 5.0")

d2 = euclidean_distance([1, 1, 1], [1, 1, 1])
if abs(d2 - 0.0) < 1e-9:
    _passed += 1
    print("PASS: distance to itself == 0.0")
else:
    print(f"FAIL: got {d2}, expected 0.0")

d3 = euclidean_distance([0], [5])
if abs(d3 - 5.0) < 1e-9:
    _passed += 1
    print("PASS: 1-D distance((0,),(5,)) == 5.0")
else:
    print(f"FAIL: got {d3}, expected 5.0")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000105', 2, 'Finding the k nearest points', 'medium', 'Write `nearest_neighbor_indices(query_point, X, k)` that returns the indices of the `k` rows of `X` closest to `query_point`, ordered nearest-first.', 'Compute the distance from query_point to every row of X, then np.argsort those distances and take the first k indices.', $py$import numpy as np

def nearest_neighbor_indices(query_point, X, k):
    # TODO -- return the indices (as a list) of the k rows in X closest
    # to query_point, ordered from nearest to farthest
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X = np.array([[0.0, 0.0], [1.0, 0.0], [5.0, 5.0], [0.5, 0.5], [10.0, 10.0]])
query = np.array([0.0, 0.0])

idx2 = [int(i) for i in nearest_neighbor_indices(query, X, 2)]
expected2 = [0, 3]
if idx2 == expected2:
    _passed += 1
    print(f"PASS: 2 nearest neighbors are {idx2}")
else:
    print(f"FAIL: got {idx2}, expected {expected2}")

idx3 = [int(i) for i in nearest_neighbor_indices(query, X, 3)]
expected3 = [0, 3, 1]
if idx3 == expected3:
    _passed += 1
    print(f"PASS: 3 nearest neighbors are {idx3}")
else:
    print(f"FAIL: got {idx3}, expected {expected3}")

idx1 = list(nearest_neighbor_indices(query, X, 1))
if idx1 == [0]:
    _passed += 1
    print("PASS: k=1 returns just the closest point (itself, index 0)")
else:
    print(f"FAIL: got {idx1}, expected [0]")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000105', 3, 'Majority vote', 'medium', 'Write `knn_predict_one(query_point, X_train, y_train, k)` implementing KNN classification by hand: find the k nearest training points, then return the most common label among them. If there''s a tie for most common, return the smallest label among the tied ones.', 'collections.Counter on the neighbor labels gives you counts; find the max count, collect all labels that hit it, then take the min of those.', $py$import numpy as np
from collections import Counter

def knn_predict_one(query_point, X_train, y_train, k):
    # TODO -- find the k nearest training points to query_point and
    # return the majority class label among them (break ties by
    # picking the smallest label)
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X_train = np.array([[0.0, 0.0], [0.1, 0.1], [0.2, 0.0], [5.0, 5.0], [5.1, 5.0]])
y_train = np.array([0, 0, 0, 1, 1])

pred1 = knn_predict_one([0.05, 0.05], X_train, y_train, k=3)
if pred1 == 0:
    _passed += 1
    print(f"PASS: point near the 0-cluster predicts class 0 (got {pred1})")
else:
    print(f"FAIL: got {pred1}, expected 0")

pred2 = knn_predict_one([5.05, 5.0], X_train, y_train, k=3)
if pred2 == 1:
    _passed += 1
    print(f"PASS: point near the 1-cluster predicts class 1 (got {pred2})")
else:
    print(f"FAIL: got {pred2}, expected 1")

X_tie = np.array([[0.0, 0.0], [10.0, 10.0]])
y_tie = np.array([0, 1])
pred3 = knn_predict_one([5.0, 5.0], X_tie, y_tie, k=2)
if pred3 == 0:
    _passed += 1
    print(f"PASS: a tie breaks toward the smaller label (got {pred3})")
else:
    print(f"FAIL: got {pred3}, expected 0 (tie-break rule)")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000105', 4, 'KNN with scikit-learn', 'easy', 'Write `fit_and_predict(X_train, y_train, X_new, k)` that fits `sklearn.neighbors.KNeighborsClassifier(n_neighbors=k)` and returns predictions for `X_new`.', 'n_neighbors is KNeighborsClassifier''s constructor argument for k.', $py$from sklearn.neighbors import KNeighborsClassifier

def fit_and_predict(X_train, y_train, X_new, k):
    # TODO -- fit KNeighborsClassifier(n_neighbors=k) and return predictions
    # for X_new
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

X_train = np.array([[0.0], [1.0], [2.0], [8.0], [9.0], [10.0]])
y_train = np.array([0, 0, 0, 1, 1, 1])
X_new = np.array([[1.5], [9.5]])

preds = np.asarray(fit_and_predict(X_train, y_train, X_new, k=3))
expected = np.array([0, 1])
if np.array_equal(preds, expected):
    _passed += 1
    print(f"PASS: predictions {preds} match {expected}")
else:
    print(f"FAIL: predictions {preds}, expected {expected}")

if len(preds) == 2:
    _passed += 1
    print("PASS: one prediction per row of X_new")
else:
    print(f"FAIL: got {len(preds)} predictions, expected 2")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000105', 5, 'Choosing k: small vs large', 'medium', 'Write `accuracy_for_k(X_train, y_train, X_test, y_test, k)` that fits KNeighborsClassifier with the given `k` and returns test-set accuracy, so you can compare how different values of k perform.', 'Same fit/score pattern -- just parametrize n_neighbors by k.', $py$from sklearn.neighbors import KNeighborsClassifier

def accuracy_for_k(X_train, y_train, X_test, y_test, k):
    # TODO -- fit KNeighborsClassifier(n_neighbors=k) and return its
    # accuracy on the test set
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(42)
n = 100
class0 = np.random.randn(n, 2) * 0.7 + np.array([-2.0, -2.0])
class1 = np.random.randn(n, 2) * 0.7 + np.array([2.0, 2.0])
X = np.vstack([class0, class1])
y = np.array([0] * n + [1] * n)
perm = np.random.permutation(len(y))
X, y = X[perm], y[perm]
split = int(0.75 * len(y))
X_train, X_test = X[:split], X[split:]
y_train, y_test = y[:split], y[split:]

acc_k1 = accuracy_for_k(X_train, y_train, X_test, y_test, k=1)
acc_k15 = accuracy_for_k(X_train, y_train, X_test, y_test, k=15)

if isinstance(acc_k1, float) and isinstance(acc_k15, float):
    _passed += 1
    print(f"PASS: both k values returned floats ({acc_k1:.3f}, {acc_k15:.3f})")
else:
    print("FAIL: expected float return values")

if acc_k15 >= 0.85:
    _passed += 1
    print(f"PASS: k=15 achieves {acc_k15:.3f} accuracy on well-separated blobs")
else:
    print(f"FAIL: k=15 accuracy only {acc_k15:.3f}, expected >= 0.85")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000105', 6, 'Distance-weighted voting', 'hard', 'Write `knn_predict_weighted(query_point, X_train, y_train, k)`: like majority-vote KNN, but each neighbor''s vote is weighted by 1/distance instead of counting equally, so very close neighbors matter more than distant ones within the same k. Floor distances at 1e-9 to avoid dividing by zero for an exact match.', 'Accumulate weight per label in a dict (or collections.defaultdict(float)), then return the label with the largest total weight.', $py$import numpy as np
from collections import defaultdict

def knn_predict_weighted(query_point, X_train, y_train, k):
    # TODO -- distance-weighted KNN: each of the k nearest neighbors votes
    # with weight 1/distance (use 1e-9 as a distance floor to avoid
    # division by zero), and the label with the highest total weight wins
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X_train = np.array([[0.0, 0.0], [0.01, 0.0], [10.0, 0.0], [10.5, 0.0], [11.0, 0.0]])
y_train = np.array([0, 0, 1, 1, 1])

pred1 = knn_predict_weighted([0.005, 0.0], X_train, y_train, k=5)
if pred1 == 0:
    _passed += 1
    print(f"PASS: a very close class-0 neighbor outweighs 3 distant class-1 votes (got {pred1})")
else:
    print(f"FAIL: got {pred1}, expected 0")

pred2 = knn_predict_weighted([10.6, 0.0], X_train, y_train, k=5)
if pred2 == 1:
    _passed += 1
    print(f"PASS: query near the class-1 cluster predicts 1 (got {pred2})")
else:
    print(f"FAIL: got {pred2}, expected 1")

pred_exact = knn_predict_weighted([0.0, 0.0], X_train, y_train, k=5)
if pred_exact == 0:
    _passed += 1
    print("PASS: querying an exact training point doesn't crash (division-by-zero guard works)")
else:
    print(f"FAIL: got {pred_exact}, expected 0")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000105', 7, 'KNN for regression', 'medium', 'Write `fit_and_predict_regression(X_train, y_train, X_new, k)` using `sklearn.neighbors.KNeighborsRegressor` -- instead of a majority vote, it predicts the average target value of the k nearest neighbors.', 'Same fit/predict API as the classifier version, just a different class and continuous y values.', $py$from sklearn.neighbors import KNeighborsRegressor

def fit_and_predict_regression(X_train, y_train, X_new, k):
    # TODO -- fit KNeighborsRegressor(n_neighbors=k) and return its
    # predictions (continuous values) for X_new
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

X_train = np.array([[1.0], [2.0], [3.0], [4.0], [5.0]])
y_train = np.array([10.0, 20.0, 30.0, 40.0, 50.0])
X_new = np.array([[2.5]])

preds = np.asarray(fit_and_predict_regression(X_train, y_train, X_new, k=2))
expected = 25.0
if abs(preds[0] - expected) < 1e-6:
    _passed += 1
    print(f"PASS: predicted {preds[0]:.2f}, expected average of 20 and 30 == 25.0")
else:
    print(f"FAIL: predicted {preds[0]}, expected {expected}")

if preds.shape == (1,):
    _passed += 1
    print("PASS: returned one prediction per query row")
else:
    print(f"FAIL: shape {preds.shape}, expected (1,)")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000105', 8, 'Picking k with cross-validation', 'medium', 'Write `best_k(X_train, y_train, k_candidates)` that tries each k in `k_candidates`, scores it with 5-fold `cross_val_score`, and returns the k with the highest mean cross-validation score.', 'cross_val_score(model, X, y, cv=5) returns an array of 5 scores; call .mean() on it and keep track of the best k seen so far.', $py$from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import cross_val_score

def best_k(X_train, y_train, k_candidates):
    # TODO -- for each k in k_candidates, compute the mean 5-fold
    # cross_val_score of KNeighborsClassifier(n_neighbors=k) on
    # (X_train, y_train), and return the k with the highest mean score
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(42)
n = 150
class0 = np.random.randn(n, 2) * 1.3 + np.array([-1.0, -1.0])
class1 = np.random.randn(n, 2) * 1.3 + np.array([1.0, 1.0])
X_train = np.vstack([class0, class1])
y_train = np.array([0] * n + [1] * n)

k = best_k(X_train, y_train, [1, 3, 5, 7, 9])

if k in [1, 3, 5, 7, 9]:
    _passed += 1
    print(f"PASS: returned a candidate k ({k})")
else:
    print(f"FAIL: returned {k}, expected one of [1, 3, 5, 7, 9]")

if k != 1:
    _passed += 1
    print(f"PASS: didn't blindly pick k=1 (chose {k}), which usually overfits noisy boundaries")
else:
    print("FAIL: expected cross-validation to favor a k > 1 on this data")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000105', 9, 'Why KNN needs scaling', 'hard', 'Write `scaled_knn_accuracy(X_train, y_train, X_test, y_test, k)` building a Pipeline of `StandardScaler` then `KNeighborsClassifier(n_neighbors=k)`, fitting it, and returning test accuracy. Because KNN relies directly on distances, a feature with a much bigger raw scale can dominate the distance calculation unless everything is scaled first.', 'Pipeline([("scaler", StandardScaler()), ("knn", KNeighborsClassifier(n_neighbors=k))]).fit(...).score(...) -- scaling inside the pipeline puts every feature on comparable footing before distances are computed.', $py$from sklearn.neighbors import KNeighborsClassifier
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import Pipeline

def scaled_knn_accuracy(X_train, y_train, X_test, y_test, k):
    # TODO -- build a Pipeline of StandardScaler -> KNeighborsClassifier(n_neighbors=k),
    # fit on the training data, and return its test-set accuracy
    pass
$py$, $py$import numpy as np
from sklearn.neighbors import KNeighborsClassifier
_passed = 0
_total = 3

np.random.seed(3)
n = 100
# feature 0 has a huge scale, feature 1 is the informative but small-scale one
class0 = np.random.randn(n, 2) * np.array([1000.0, 0.3]) + np.array([0.0, -2.0])
class1 = np.random.randn(n, 2) * np.array([1000.0, 0.3]) + np.array([0.0, 2.0])
X = np.vstack([class0, class1])
y = np.array([0] * n + [1] * n)
perm = np.random.permutation(len(y))
X, y = X[perm], y[perm]
split = int(0.75 * len(y))
X_train, X_test = X[:split], X[split:]
y_train, y_test = y[:split], y[split:]

acc_scaled = scaled_knn_accuracy(X_train, y_train, X_test, y_test, k=5)

unscaled_model = KNeighborsClassifier(n_neighbors=5)
unscaled_model.fit(X_train, y_train)
acc_unscaled = unscaled_model.score(X_test, y_test)

if isinstance(acc_scaled, float):
    _passed += 1
    print(f"PASS: returned a float ({acc_scaled:.3f})")
else:
    print(f"FAIL: returned type {type(acc_scaled)}, expected float")

if acc_scaled > acc_unscaled:
    _passed += 1
    print(f"PASS: scaling first helps KNN here ({acc_scaled:.3f} > {acc_unscaled:.3f} unscaled)")
else:
    print(f"FAIL: expected scaled accuracy ({acc_scaled:.3f}) > unscaled ({acc_unscaled:.3f})")

if acc_scaled >= 0.85:
    _passed += 1
    print(f"PASS: scaled KNN reaches {acc_scaled:.3f} accuracy")
else:
    print(f"FAIL: scaled accuracy only {acc_scaled:.3f}, expected >= 0.85")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000106', 1, 'Class priors', 'easy', 'Write `class_priors(y)` returning a dict mapping each class label (as a plain int) to its proportion (count / total) in the label array `y`.', 'np.unique(y, return_counts=True) gives you the distinct classes and how many times each appears.', $py$import numpy as np

def class_priors(y):
    # TODO -- return a dict {class_label: proportion} giving each class's
    # share of the labels in y
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

priors1 = class_priors(np.array([0, 0, 0, 1]))
if abs(priors1[0] - 0.75) < 1e-9 and abs(priors1[1] - 0.25) < 1e-9:
    _passed += 1
    print(f"PASS: priors {priors1}")
else:
    print(f"FAIL: priors {priors1}, expected {{0: 0.75, 1: 0.25}}")

priors2 = class_priors(np.array([0, 1, 0, 1, 0, 1]))
if abs(priors2[0] - 0.5) < 1e-9 and abs(priors2[1] - 0.5) < 1e-9:
    _passed += 1
    print(f"PASS: priors {priors2}")
else:
    print(f"FAIL: priors {priors2}, expected {{0: 0.5, 1: 0.5}}")

total_prob = sum(class_priors(np.array([0, 0, 1, 2, 2, 2])).values())
if abs(total_prob - 1.0) < 1e-9:
    _passed += 1
    print("PASS: priors across 3 classes sum to 1.0")
else:
    print(f"FAIL: priors summed to {total_prob}, expected 1.0")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000106', 2, 'The Gaussian likelihood', 'medium', 'Write `gaussian_pdf(x, mean, var)` computing the normal distribution''s probability density at `x`: (1 / sqrt(2*pi*var)) * exp(-(x-mean)^2 / (2*var)).', 'Build it in two pieces: the normalizing coefficient 1/sqrt(2*pi*var), and the exponential term -((x-mean)**2)/(2*var), then multiply.', $py$import math

def gaussian_pdf(x, mean, var):
    # TODO -- return the value of the Gaussian (normal) probability
    # density function at x, given the mean and variance
    pass
$py$, $py$import math
_passed = 0
_total = 3

p1 = gaussian_pdf(0.0, mean=0.0, var=1.0)
expected1 = 1 / math.sqrt(2 * math.pi)
if abs(p1 - expected1) < 1e-6:
    _passed += 1
    print(f"PASS: pdf at the mean of a standard normal ~= {expected1:.4f}")
else:
    print(f"FAIL: got {p1}, expected ~{expected1:.4f}")

p2 = gaussian_pdf(5.0, mean=0.0, var=1.0)
if p2 < 1e-4:
    _passed += 1
    print(f"PASS: density far from the mean is near zero ({p2:.2e})")
else:
    print(f"FAIL: got {p2}, expected a very small value")

p3 = gaussian_pdf(2.0, mean=2.0, var=4.0)
expected3 = 1 / math.sqrt(2 * math.pi * 4.0)
if abs(p3 - expected3) < 1e-6:
    _passed += 1
    print(f"PASS: pdf at the mean with var=4 ~= {expected3:.4f}")
else:
    print(f"FAIL: got {p3}, expected ~{expected3:.4f}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000106', 3, 'Naive Bayes prediction by hand', 'hard', 'Write `predict_gnb_one(x, class_stats, priors)` implementing Gaussian Naive Bayes prediction for one sample: for each class, multiply its prior by the product of the per-feature Gaussian likelihoods (that''s the ''naive'' independence assumption), then return the class with the highest resulting score.', 'Loop over class_stats.items(), start each class''s score at its prior, then multiply in gaussian_pdf(xi, m, v) for every feature -- track the best (label, score) pair as you go.', $py$import numpy as np
import math

def gaussian_pdf(x, mean, var):
    coef = 1.0 / math.sqrt(2 * math.pi * var)
    exponent = -((x - mean) ** 2) / (2 * var)
    return coef * math.exp(exponent)

def predict_gnb_one(x, class_stats, priors):
    # x: a 1-D feature vector for one sample
    # class_stats: {class_label: (means, variances)} -- each a 1-D array
    #              of per-feature mean/variance for that class
    # priors: {class_label: prior probability}
    # TODO -- for each class, multiply the prior by the product of the
    # per-feature Gaussian likelihoods (naive independence assumption),
    # then return the class label with the highest score
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

class_stats = {
    0: (np.array([0.0, 0.0]), np.array([1.0, 1.0])),
    1: (np.array([5.0, 5.0]), np.array([1.0, 1.0])),
}
priors = {0: 0.5, 1: 0.5}

pred1 = predict_gnb_one(np.array([0.2, -0.1]), class_stats, priors)
if pred1 == 0:
    _passed += 1
    print(f"PASS: point near class-0 mean predicts 0 (got {pred1})")
else:
    print(f"FAIL: got {pred1}, expected 0")

pred2 = predict_gnb_one(np.array([5.1, 4.9]), class_stats, priors)
if pred2 == 1:
    _passed += 1
    print(f"PASS: point near class-1 mean predicts 1 (got {pred2})")
else:
    print(f"FAIL: got {pred2}, expected 1")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000106', 4, 'GaussianNB with scikit-learn', 'easy', 'Write `fit_and_predict(X_train, y_train, X_new)` that fits `sklearn.naive_bayes.GaussianNB` and returns predictions for `X_new`. GaussianNB assumes each feature is normally distributed within each class -- exactly the model from the previous challenge, fully vectorized.', 'Same fit/predict pattern as every other sklearn classifier so far.', $py$from sklearn.naive_bayes import GaussianNB

def fit_and_predict(X_train, y_train, X_new):
    # TODO -- fit GaussianNB and return predictions for X_new
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

X_train = np.array([[0.0], [0.5], [-0.5], [5.0], [5.5], [4.5]])
y_train = np.array([0, 0, 0, 1, 1, 1])
X_new = np.array([[0.2], [5.2]])

preds = np.asarray(fit_and_predict(X_train, y_train, X_new))
expected = np.array([0, 1])
if np.array_equal(preds, expected):
    _passed += 1
    print(f"PASS: predictions {preds} match {expected}")
else:
    print(f"FAIL: predictions {preds}, expected {expected}")

if len(preds) == 2:
    _passed += 1
    print("PASS: one prediction per row of X_new")
else:
    print(f"FAIL: got {len(preds)} predictions, expected 2")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000106', 5, 'Multinomial NB for word counts', 'medium', 'Write `fit_and_predict_counts(X_train, y_train, X_new)` fitting `sklearn.naive_bayes.MultinomialNB` -- suited to count-style features like word frequencies, unlike GaussianNB which assumes continuous normally-distributed features.', 'Same fit/predict pattern, just MultinomialNB instead of GaussianNB -- it''s built for non-negative count data.', $py$from sklearn.naive_bayes import MultinomialNB

def fit_and_predict_counts(X_train, y_train, X_new):
    # TODO -- fit MultinomialNB (for word-count style features) and
    # return predictions for X_new
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

# Toy "bag of words" counts over vocabulary ["free", "win", "meeting", "report"]
X_train = np.array([
    [3, 2, 0, 0],  # spammy
    [2, 3, 0, 0],  # spammy
    [0, 0, 3, 2],  # not spam
    [0, 0, 2, 3],  # not spam
])
y_train = np.array([1, 1, 0, 0])  # 1 = spam
X_new = np.array([[2, 2, 0, 0], [0, 0, 2, 2]])

preds = np.asarray(fit_and_predict_counts(X_train, y_train, X_new))
expected = np.array([1, 0])
if np.array_equal(preds, expected):
    _passed += 1
    print(f"PASS: predictions {preds} match {expected}")
else:
    print(f"FAIL: predictions {preds}, expected {expected}")

if len(preds) == 2:
    _passed += 1
    print("PASS: one prediction per row of X_new")
else:
    print(f"FAIL: got {len(preds)} predictions, expected 2")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000106', 6, 'Smoothing with alpha', 'medium', 'Write `predict_proba_with_alpha(X_train, y_train, X_new, alpha)` fitting `MultinomialNB(alpha=alpha)` and returning `predict_proba(X_new)`. `alpha` controls Laplace/Lidstone smoothing -- without it, a feature value never seen with a class in training would force that class''s probability to exactly zero.', 'Pass alpha straight to the MultinomialNB constructor; predict_proba returns one column of probabilities per class, ordered by model.classes_.', $py$from sklearn.naive_bayes import MultinomialNB

def predict_proba_with_alpha(X_train, y_train, X_new, alpha):
    # TODO -- fit MultinomialNB(alpha=alpha) (Laplace/Lidstone smoothing
    # strength) and return predict_proba(X_new)
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

# A word ("bonus") that only ever appears with spam in training
X_train = np.array([
    [5, 0],  # spam, has "bonus"
    [4, 0],  # spam, has "bonus"
    [0, 5],  # not spam, no "bonus"
    [0, 4],  # not spam, no "bonus"
])
y_train = np.array([1, 1, 0, 0])
X_new = np.array([[0, 5]])  # no "bonus" at all, looks like "not spam"

proba_low_alpha = predict_proba_with_alpha(X_train, y_train, X_new, alpha=1e-9)
proba_high_alpha = predict_proba_with_alpha(X_train, y_train, X_new, alpha=5.0)

if proba_low_alpha.shape == (1, 2) and proba_high_alpha.shape == (1, 2):
    _passed += 1
    print("PASS: predict_proba returns one row, one column per class")
else:
    print(f"FAIL: shapes were {proba_low_alpha.shape}, {proba_high_alpha.shape}, expected (1, 2) each")

classes_low = MultinomialNB(alpha=1e-9).fit(X_train, y_train).classes_
not_spam_idx = list(classes_low).index(0)
if proba_low_alpha[0, not_spam_idx] > 0.9:
    _passed += 1
    print(f"PASS: with tiny alpha, a 'bonus'-free message is confidently not-spam ({proba_low_alpha[0, not_spam_idx]:.3f})")
else:
    print(f"FAIL: expected P(not spam) > 0.9 with tiny alpha, got {proba_low_alpha[0, not_spam_idx]:.3f}")

if not np.allclose(proba_low_alpha, proba_high_alpha, atol=1e-3):
    _passed += 1
    print("PASS: changing alpha (smoothing strength) changes the predicted probabilities")
else:
    print("FAIL: expected different alpha values to produce different probabilities")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000106', 7, 'Predictions and confidence', 'easy', 'Write `predict_and_confidence(X_train, y_train, X_new)` fitting GaussianNB and returning `(predictions, confidences)`: `predictions` from `.predict`, and `confidences` as the max predicted probability across classes for each row (how sure the model is about its own prediction).', 'proba = model.predict_proba(X_new); confidences = proba.max(axis=1) picks, per row, the probability of whichever class won.', $py$from sklearn.naive_bayes import GaussianNB

def predict_and_confidence(X_train, y_train, X_new):
    # TODO -- fit GaussianNB, then return a tuple (predictions, confidences)
    # where predictions = model.predict(X_new) and confidences is, for each
    # row, the predicted probability of whichever class was predicted
    # (i.e. the max probability across classes for that row)
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X_train = np.array([[0.0], [0.2], [-0.2], [10.0], [10.2], [9.8]])
y_train = np.array([0, 0, 0, 1, 1, 1])
X_new = np.array([[0.1], [10.1], [5.0]])

preds, confidences = predict_and_confidence(X_train, y_train, X_new)
preds = np.asarray(preds)
confidences = np.asarray(confidences)

if preds.shape == (3,) and confidences.shape == (3,):
    _passed += 1
    print(f"PASS: got 3 predictions and 3 confidences")
else:
    print(f"FAIL: shapes were {preds.shape}, {confidences.shape}, expected (3,) each")

if confidences[0] > 0.9 and confidences[1] > 0.9:
    _passed += 1
    print(f"PASS: confident predictions near cluster centers ({confidences[0]:.3f}, {confidences[1]:.3f})")
else:
    print(f"FAIL: expected high confidence near cluster centers, got {confidences[0]:.3f}, {confidences[1]:.3f}")

if (confidences >= 0.5).all() and (confidences <= 1.0).all():
    _passed += 1
    print("PASS: confidences are valid probabilities in [0.5, 1.0]")
else:
    print(f"FAIL: confidences {confidences} out of expected [0.5, 1.0] range")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000106', 8, 'When independence isn''t real', 'medium', 'Write `accuracy_with_redundant_feature(X_train, y_train, X_test, y_test)` fitting GaussianNB on a dataset where the two features are almost perfect duplicates of each other (violating the ''naive'' independence assumption) and return test accuracy anyway. Naive Bayes tends to work fine in practice even when features are correlated, it just effectively double-counts that evidence.', 'No special handling needed -- just fit and score normally; the point is observing it still performs well despite a technically-violated assumption.', $py$from sklearn.naive_bayes import GaussianNB

def accuracy_with_redundant_feature(X_train, y_train, X_test, y_test):
    # X_train/X_test have 2 columns: [signal, signal_copy] where
    # signal_copy is a near-exact duplicate of signal (a correlated,
    # redundant feature).
    # TODO -- fit GaussianNB on both columns and return test accuracy
    # anyway (Naive Bayes still works, just over-trusts the duplicated
    # evidence)
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(1)
n = 200
signal = np.concatenate([
    np.random.randn(n // 2) - 2.0,
    np.random.randn(n // 2) + 2.0,
])
signal_copy = signal + np.random.randn(n) * 0.01  # near-duplicate, correlated feature
X = np.column_stack([signal, signal_copy])
y = np.array([0] * (n // 2) + [1] * (n // 2))
perm = np.random.permutation(n)
X, y = X[perm], y[perm]
split = int(0.75 * n)
X_train, X_test = X[:split], X[split:]
y_train, y_test = y[:split], y[split:]

acc = accuracy_with_redundant_feature(X_train, y_train, X_test, y_test)

if isinstance(acc, float):
    _passed += 1
    print(f"PASS: returned a float ({acc:.3f})")
else:
    print(f"FAIL: returned type {type(acc)}, expected float")

if acc >= 0.9:
    _passed += 1
    print(f"PASS: still classifies well ({acc:.3f}) despite the naive independence assumption being violated")
else:
    print(f"FAIL: accuracy {acc:.3f}, expected >= 0.9")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000106', 9, 'Full Naive Bayes pipeline', 'hard', 'Write `train_and_evaluate(X_train, y_train, X_test, y_test)` fitting GaussianNB and returning `{"accuracy": <test accuracy>, "n_classes": <number of distinct classes>}`.', 'model.classes_ lists the distinct classes the model learned -- len() of it gives n_classes.', $py$from sklearn.naive_bayes import GaussianNB

def train_and_evaluate(X_train, y_train, X_test, y_test):
    # TODO -- fit GaussianNB and return a dict {"accuracy": <test accuracy>,
    # "n_classes": <number of distinct classes in y_train>}
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

np.random.seed(8)
n = 60
c0 = np.random.randn(n, 2) + np.array([-3.0, 0.0])
c1 = np.random.randn(n, 2) + np.array([0.0, 3.0])
c2 = np.random.randn(n, 2) + np.array([3.0, 0.0])
X = np.vstack([c0, c1, c2])
y = np.array([0] * n + [1] * n + [2] * n)
perm = np.random.permutation(len(y))
X, y = X[perm], y[perm]
split = int(0.75 * len(y))
X_train, X_test = X[:split], X[split:]
y_train, y_test = y[:split], y[split:]

result = train_and_evaluate(X_train, y_train, X_test, y_test)

if isinstance(result, dict) and "accuracy" in result and "n_classes" in result:
    _passed += 1
    print("PASS: returned a dict with the expected keys")
else:
    print(f"FAIL: got {result}, expected a dict with 'accuracy' and 'n_classes'")

if result["n_classes"] == 3:
    _passed += 1
    print("PASS: correctly counted 3 classes")
else:
    print(f"FAIL: n_classes was {result['n_classes']}, expected 3")

if result["accuracy"] >= 0.85:
    _passed += 1
    print(f"PASS: test accuracy {result['accuracy']:.3f} >= 0.85")
else:
    print(f"FAIL: test accuracy {result['accuracy']:.3f}, expected >= 0.85")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000107', 1, 'Distance to every centroid', 'easy', 'Write `distances_to_centroids(X, centroids)` returning a 2-D array where entry `[i, j]` is the Euclidean distance from point `X[i]` to `centroids[j]`.', 'Broadcasting: X[:, np.newaxis, :] - centroids[np.newaxis, :, :] gives every pairwise difference at once; square, sum over the last axis, then sqrt.', $py$import numpy as np

def distances_to_centroids(X, centroids):
    # TODO -- return a 2-D array of shape (n_points, n_centroids) where
    # entry [i, j] is the Euclidean distance from X[i] to centroids[j]
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X = np.array([[0.0, 0.0], [10.0, 10.0]])
centroids = np.array([[0.0, 0.0], [10.0, 10.0]])

d = np.asarray(distances_to_centroids(X, centroids))

if d.shape == (2, 2):
    _passed += 1
    print(f"PASS: shape is (n_points, n_centroids) == (2, 2)")
else:
    print(f"FAIL: shape {d.shape}, expected (2, 2)")

expected = np.array([[0.0, np.sqrt(200)], [np.sqrt(200), 0.0]])
if np.allclose(d, expected, atol=1e-6):
    _passed += 1
    print("PASS: distances match expected values")
else:
    print(f"FAIL: distances {d}, expected {expected}")

X2 = np.array([[1.0, 0.0], [0.0, 1.0], [1.0, 1.0]])
centroids2 = np.array([[0.0, 0.0]])
d2 = np.asarray(distances_to_centroids(X2, centroids2))
expected2 = np.array([[1.0], [1.0], [np.sqrt(2)]])
if d2.shape == (3, 1) and np.allclose(d2, expected2, atol=1e-6):
    _passed += 1
    print("PASS: works with a single centroid too")
else:
    print(f"FAIL: got {d2}, expected {expected2}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000107', 2, 'Assigning points to clusters', 'medium', 'Write `assign_clusters(X, centroids)` returning, for each point in `X`, the index of the nearest centroid.', 'Compute distances to every centroid the same way as before, then np.argmin(dists, axis=1) picks the closest one per point.', $py$import numpy as np

def assign_clusters(X, centroids):
    # TODO -- return a 1-D array of length n_points: for each point, the
    # index of its closest centroid
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

X = np.array([[0.1, 0.0], [9.9, 10.0], [0.0, 0.2], [10.0, 9.8]])
centroids = np.array([[0.0, 0.0], [10.0, 10.0]])

labels = np.asarray(assign_clusters(X, centroids))
expected = np.array([0, 1, 0, 1])
if np.array_equal(labels, expected):
    _passed += 1
    print(f"PASS: assignments {labels} match {expected}")
else:
    print(f"FAIL: assignments {labels}, expected {expected}")

if labels.shape == (4,):
    _passed += 1
    print("PASS: one label per point")
else:
    print(f"FAIL: shape {labels.shape}, expected (4,)")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000107', 3, 'Recomputing centroids', 'medium', 'Write `update_centroids(X, labels, k)` returning a `(k, n_features)` array where row `j` is the mean position of every point currently assigned (`labels == j`) to cluster `j`. You can assume every cluster has at least one point.', 'Loop j from 0 to k-1, mask X with (labels == j), and take .mean(axis=0) of the matching rows.', $py$import numpy as np

def update_centroids(X, labels, k):
    # TODO -- return a (k, n_features) array where row j is the mean of
    # all points currently assigned to cluster j. If a cluster has no
    # points assigned, keep its old centroid... but for this exercise you
    # can assume every cluster gets at least one point.
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

X = np.array([[0.0, 0.0], [2.0, 0.0], [10.0, 10.0], [12.0, 10.0]])
labels = np.array([0, 0, 1, 1])

centroids = np.asarray(update_centroids(X, labels, k=2))
expected = np.array([[1.0, 0.0], [11.0, 10.0]])
if centroids.shape == (2, 2) and np.allclose(centroids, expected, atol=1e-6):
    _passed += 1
    print(f"PASS: centroids {centroids} match expected {expected}")
else:
    print(f"FAIL: centroids {centroids}, expected {expected}")

X2 = np.array([[0.0], [1.0], [2.0], [3.0]])
labels2 = np.array([0, 0, 0, 1])
centroids2 = np.asarray(update_centroids(X2, labels2, k=2))
expected2 = np.array([[1.0], [3.0]])
if np.allclose(centroids2, expected2, atol=1e-6):
    _passed += 1
    print(f"PASS: unbalanced cluster sizes handled correctly: {centroids2}")
else:
    print(f"FAIL: centroids {centroids2}, expected {expected2}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000107', 4, 'k-Means from scratch', 'hard', 'Write `kmeans_fit(X, k, n_iters=20, seed=42)` implementing k-means from scratch: seed a `np.random.default_rng(seed)`, pick `k` random distinct points from `X` as initial centroids, then alternate assign/update for `n_iters` rounds. Return `(centroids, labels)`.\n\nNote: which numeric label (0, 1, 2, ...) ends up on which cluster is arbitrary -- what matters is that points end up grouped consistently and centroids land in the right places.', 'Reuse the assignment step (nearest centroid per point) and the update step (mean of each cluster''s points) inside a for loop of n_iters rounds.', $py$import numpy as np

def kmeans_fit(X, k, n_iters=20, seed=42):
    # TODO -- implement k-means from scratch:
    #   1. seed a RNG with `seed` and pick k random distinct points from X
    #      as the initial centroids (e.g. rng.choice(len(X), k, replace=False))
    #   2. repeat n_iters times: assign each point to its nearest centroid,
    #      then move each centroid to the mean of its assigned points
    #   3. return (centroids, labels) -- centroids shape (k, n_features),
    #      labels shape (n_points,)
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

np.random.seed(0)
n = 30
cluster_a = np.random.randn(n, 2) * 0.3 + np.array([0.0, 0.0])
cluster_b = np.random.randn(n, 2) * 0.3 + np.array([10.0, 0.0])
X = np.vstack([cluster_a, cluster_b])

centroids, labels = kmeans_fit(X, k=2, n_iters=20, seed=42)
centroids = np.asarray(centroids)
labels = np.asarray(labels)

if centroids.shape == (2, 2) and labels.shape == (2 * n,):
    _passed += 1
    print(f"PASS: shapes are correct (centroids {centroids.shape}, labels {labels.shape})")
else:
    print(f"FAIL: shapes were centroids {centroids.shape}, labels {labels.shape}")

# Label-invariant check: sort centroids by x-coordinate before comparing
sorted_centroids = centroids[np.argsort(centroids[:, 0])]
expected_centroids = np.array([[0.0, 0.0], [10.0, 0.0]])
if np.allclose(sorted_centroids, expected_centroids, atol=0.3):
    _passed += 1
    print(f"PASS: centroids landed near (0,0) and (10,0) (order-independent check): {sorted_centroids}")
else:
    print(f"FAIL: sorted centroids {sorted_centroids}, expected near {expected_centroids}")

# Label-invariant grouping check: all of cluster_a share one label, all of cluster_b share another
a_labels = set(labels[:n].tolist())
b_labels = set(labels[n:].tolist())
if len(a_labels) == 1 and len(b_labels) == 1 and a_labels != b_labels:
    _passed += 1
    print("PASS: every point from the same true cluster got the same k-means label, and the two true clusters got different labels")
else:
    print(f"FAIL: cluster_a labels {a_labels}, cluster_b labels {b_labels} -- expected each internally uniform and distinct from each other")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000107', 5, 'Checking for convergence', 'medium', 'Write `has_converged(old_centroids, new_centroids, tol=1e-6)` returning True only if every centroid moved less than `tol` between the two rounds -- this is how you''d stop a k-means loop early instead of always running the full `n_iters`.', 'Compute the per-centroid movement distance (same Euclidean-distance formula as always), then check np.all(shifts < tol).', $py$import numpy as np

def has_converged(old_centroids, new_centroids, tol=1e-6):
    # TODO -- return True if every centroid moved less than `tol`
    # (Euclidean distance) between old_centroids and new_centroids
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

old_c = np.array([[0.0, 0.0], [5.0, 5.0]])
same_c = np.array([[0.0, 0.0], [5.0, 5.0]])
if has_converged(old_c, same_c) is True:
    _passed += 1
    print("PASS: identical centroids report converged")
else:
    print("FAIL: expected identical centroids to report converged")

moved_c = np.array([[0.0, 0.0], [5.5, 5.0]])
if has_converged(old_c, moved_c) is False:
    _passed += 1
    print("PASS: a centroid that moved 0.5 is not converged (default tol)")
else:
    print("FAIL: expected a 0.5 move to NOT be converged")

tiny_move_c = np.array([[0.0000001, 0.0], [5.0, 5.0]])
if has_converged(old_c, tiny_move_c, tol=1e-3) is True:
    _passed += 1
    print("PASS: a tiny move within a looser tolerance still counts as converged")
else:
    print("FAIL: expected a tiny move to count as converged with tol=1e-3")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000107', 6, 'k-Means with scikit-learn', 'easy', 'Write `fit_kmeans_sklearn(X, k)` fitting `sklearn.cluster.KMeans(n_clusters=k, random_state=42, n_init=10)` and returning `(cluster_centers, labels)`.', 'model.fit_predict(X) fits and returns labels in one call; model.cluster_centers_ holds the final centroid positions.', $py$from sklearn.cluster import KMeans

def fit_kmeans_sklearn(X, k):
    # TODO -- fit sklearn's KMeans(n_clusters=k, random_state=42, n_init=10)
    # and return (cluster_centers, labels)
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

np.random.seed(1)
n = 40
a = np.random.randn(n, 2) * 0.3 + np.array([0.0, 0.0])
b = np.random.randn(n, 2) * 0.3 + np.array([8.0, 0.0])
X = np.vstack([a, b])

centers, labels = fit_kmeans_sklearn(X, k=2)
centers = np.asarray(centers)
labels = np.asarray(labels)

if centers.shape == (2, 2) and labels.shape == (2 * n,):
    _passed += 1
    print(f"PASS: shapes correct (centers {centers.shape}, labels {labels.shape})")
else:
    print(f"FAIL: shapes were centers {centers.shape}, labels {labels.shape}")

sorted_centers = centers[np.argsort(centers[:, 0])]
expected = np.array([[0.0, 0.0], [8.0, 0.0]])
if np.allclose(sorted_centers, expected, atol=0.3):
    _passed += 1
    print(f"PASS: centers near expected positions (order-independent): {sorted_centers}")
else:
    print(f"FAIL: sorted centers {sorted_centers}, expected near {expected}")

a_labels = set(labels[:n].tolist())
b_labels = set(labels[n:].tolist())
if len(a_labels) == 1 and len(b_labels) == 1 and a_labels != b_labels:
    _passed += 1
    print("PASS: each true cluster got one consistent, distinct k-means label")
else:
    print(f"FAIL: cluster a labels {a_labels}, cluster b labels {b_labels}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000107', 7, 'Within-cluster sum of squares', 'medium', 'Write `inertia(X, labels, centroids)` returning the sum, over every point, of the squared Euclidean distance from that point to its own assigned centroid. This is exactly what k-means minimizes.', 'centroids[labels] uses fancy indexing to build an array the same shape as X, where row i is the centroid that point i was assigned to -- then it''s just (X - that)**2, summed.', $py$import numpy as np

def inertia(X, labels, centroids):
    # TODO -- return the total within-cluster sum of squared distances:
    # for every point, the squared distance to ITS assigned centroid, summed
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X = np.array([[0.0, 0.0], [2.0, 0.0], [10.0, 0.0], [12.0, 0.0]])
labels = np.array([0, 0, 1, 1])
centroids = np.array([[1.0, 0.0], [11.0, 0.0]])

val = inertia(X, labels, centroids)
expected = 1.0 + 1.0 + 1.0 + 1.0
if abs(val - expected) < 1e-6:
    _passed += 1
    print(f"PASS: inertia == {expected}")
else:
    print(f"FAIL: inertia returned {val}, expected {expected}")

centroids_perfect = np.array([[0.0, 0.0], [10.0, 0.0]])
labels_perfect = np.array([0, 0, 1, 1])
X_perfect = np.array([[0.0, 0.0], [0.0, 0.0], [10.0, 0.0], [10.0, 0.0]])
val2 = inertia(X_perfect, labels_perfect, centroids_perfect)
if abs(val2 - 0.0) < 1e-9:
    _passed += 1
    print("PASS: inertia is 0 when every point sits exactly on its centroid")
else:
    print(f"FAIL: inertia returned {val2}, expected 0.0")

if isinstance(val, float):
    _passed += 1
    print("PASS: returns a plain float")
else:
    print(f"FAIL: returned type {type(val)}, expected float")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000107', 8, 'The elbow method', 'medium', 'Write `inertia_for_k_values(X, k_values)` that fits KMeans for each `k` in `k_values` (with `random_state=42, n_init=10`) and returns a list of the resulting `.inertia_` values, in the same order -- the data behind an elbow-method plot for choosing k.', 'Loop over k_values, fit a fresh KMeans each time, and append model.inertia_ to a results list.', $py$from sklearn.cluster import KMeans

def inertia_for_k_values(X, k_values):
    # TODO -- for each k in k_values, fit KMeans(n_clusters=k,
    # random_state=42, n_init=10) and collect its .inertia_. Return a
    # list of inertias, same order as k_values (for an elbow-method plot)
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(2)
n = 30
a = np.random.randn(n, 2) * 0.2 + np.array([0.0, 0.0])
b = np.random.randn(n, 2) * 0.2 + np.array([10.0, 0.0])
c = np.random.randn(n, 2) * 0.2 + np.array([5.0, 10.0])
X = np.vstack([a, b, c])

inertias = inertia_for_k_values(X, [1, 2, 3, 4])

if len(inertias) == 4:
    _passed += 1
    print(f"PASS: got 4 inertia values: {[round(v, 1) for v in inertias]}")
else:
    print(f"FAIL: got {len(inertias)} values, expected 4")

is_decreasing = all(inertias[i] >= inertias[i + 1] - 1e-6 for i in range(len(inertias) - 1))
if is_decreasing:
    _passed += 1
    print("PASS: inertia decreases (or stays flat) as k increases, as expected")
else:
    print(f"FAIL: expected non-increasing inertia as k grows, got {inertias}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000107', 9, 'Comparing clusterings without caring about labels', 'medium', 'Write `same_cluster_agreement(labels_a, labels_b)` comparing two label arrays for the same points -- since cluster numbering is arbitrary, don''t compare labels directly. Instead, for every pair of points, check whether both labelings agree on whether the pair is in the same cluster or not, and return the fraction of pairs that agree.', 'itertools.combinations(range(n), 2) gives every pair of point indices once; for each pair compare (labels_a[i]==labels_a[j]) to (labels_b[i]==labels_b[j]).', $py$import numpy as np

def same_cluster_agreement(labels_a, labels_b):
    # labels_a and labels_b are two different label arrays for the SAME
    # points (e.g. from two different k-means runs) -- their numeric
    # label values may not match even if the grouping is identical.
    # TODO -- return the fraction of point PAIRS that agree on whether
    # they're in the same cluster or not, across both labelings
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

# Same grouping, different numeric labels -- should agree on every pair
labels_a = np.array([0, 0, 1, 1])
labels_b = np.array([1, 1, 0, 0])
score1 = same_cluster_agreement(labels_a, labels_b)
if abs(score1 - 1.0) < 1e-9:
    _passed += 1
    print(f"PASS: relabeled-but-identical clustering scores 1.0 agreement")
else:
    print(f"FAIL: got {score1}, expected 1.0")

# Completely different grouping
labels_c = np.array([0, 1, 0, 1])
score2 = same_cluster_agreement(labels_a, labels_c)
if score2 < 1.0:
    _passed += 1
    print(f"PASS: a genuinely different grouping scores less than perfect agreement ({score2:.3f})")
else:
    print(f"FAIL: expected agreement < 1.0 for a different grouping, got {score2}")

if 0.0 <= score1 <= 1.0 and 0.0 <= score2 <= 1.0:
    _passed += 1
    print("PASS: agreement scores are valid fractions in [0, 1]")
else:
    print(f"FAIL: scores {score1}, {score2} out of [0, 1] range")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000107', 10, 'End-to-end: cluster and verify', 'hard', 'Write `cluster_and_verify(X, k, seed=42)` running k-means from scratch for 50 iterations and returning the final centroids sorted by x-coordinate. Sorting removes the arbitrary label-numbering problem: whichever cluster ends up leftmost is always row 0 of the result, regardless of which numeric label the algorithm happened to assign it internally.', 'Same assign/update loop as before; the only new step is `centroids[np.argsort(centroids[:, 0])]` at the very end.', $py$import numpy as np

def cluster_and_verify(X, k, seed=42):
    # TODO -- run k-means from scratch (or call your own kmeans_fit-style
    # logic inline) on X with the given seed, for 50 iterations, and
    # return the final centroids SORTED by their x-coordinate (so
    # run-to-run label numbering never matters for whoever calls this)
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

np.random.seed(3)
n = 50
a = np.random.randn(n, 2) * 0.4 + np.array([-5.0, 0.0])
b = np.random.randn(n, 2) * 0.4 + np.array([0.0, 5.0])
c = np.random.randn(n, 2) * 0.4 + np.array([5.0, 0.0])
X = np.vstack([a, b, c])

centroids = np.asarray(cluster_and_verify(X, k=3, seed=42))

if centroids.shape == (3, 2):
    _passed += 1
    print(f"PASS: got 3 centroids of the right shape")
else:
    print(f"FAIL: shape {centroids.shape}, expected (3, 2)")

is_sorted = np.all(centroids[:-1, 0] <= centroids[1:, 0])
if is_sorted:
    _passed += 1
    print("PASS: centroids are sorted by x-coordinate as required")
else:
    print(f"FAIL: centroids {centroids} are not sorted by x-coordinate")

expected_sorted = np.array([[-5.0, 0.0], [0.0, 5.0], [5.0, 0.0]])
if np.allclose(centroids, expected_sorted, atol=0.5):
    _passed += 1
    print(f"PASS: centroids landed near the true cluster centers: {centroids}")
else:
    print(f"FAIL: centroids {centroids}, expected near {expected_sorted}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000108', 1, 'Confusion matrix counts by hand', 'medium', 'Write `confusion_counts(y_true, y_pred)` returning a dict `{"TP": .., "FP": .., "TN": .., "FN": ..}` treating label 1 as positive and 0 as negative. Work through a small 10-example array by hand first so you know exactly what to expect.', 'Loop through pairs (t, p) with zip(y_true, y_pred) and bucket each one into TP/FP/TN/FN based on the (true, predicted) combination.', $py$def confusion_counts(y_true, y_pred):
    # TODO -- return a dict {"TP": .., "FP": .., "TN": .., "FN": ..}
    # treating 1 as the positive class and 0 as the negative class
    pass
$py$, $py$_passed = 0
_total = 3

y_true = [1, 1, 1, 1, 1, 0, 0, 0, 0, 0]
y_pred = [1, 1, 1, 0, 0, 1, 1, 0, 0, 0]

counts = confusion_counts(y_true, y_pred)
expected = {"TP": 3, "FP": 2, "TN": 3, "FN": 2}
if counts == expected:
    _passed += 1
    print(f"PASS: confusion_counts == {expected}")
else:
    print(f"FAIL: confusion_counts returned {counts}, expected {expected}")

perfect = confusion_counts([1, 0, 1, 0], [1, 0, 1, 0])
if perfect == {"TP": 2, "FP": 0, "TN": 2, "FN": 0}:
    _passed += 1
    print(f"PASS: perfect predictions give {perfect}")
else:
    print(f"FAIL: got {perfect}, expected TP=2, FP=0, TN=2, FN=0")

total = sum(counts.values())
if total == len(y_true):
    _passed += 1
    print(f"PASS: TP+FP+TN+FN == total number of examples ({total})")
else:
    print(f"FAIL: counts summed to {total}, expected {len(y_true)}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000108', 2, 'Precision', 'easy', 'Write `precision(y_true, y_pred)` returning TP / (TP + FP) -- of everything predicted positive, what fraction actually was? Return 0.0 (not an error) when nothing was predicted positive.', 'Count TP and FP directly, or reuse the same bucketing idea from confusion_counts, then guard the division with an if tp+fp==0 check.', $py$def precision(y_true, y_pred):
    # TODO -- return precision: TP / (TP + FP). Return 0.0 if there are
    # no predicted positives at all (avoid dividing by zero).
    pass
$py$, $py$_passed = 0
_total = 3

y_true = [1, 1, 1, 1, 1, 0, 0, 0, 0, 0]
y_pred = [1, 1, 1, 0, 0, 1, 1, 0, 0, 0]
p = precision(y_true, y_pred)
if abs(p - 0.6) < 1e-9:
    _passed += 1
    print(f"PASS: precision == 0.6 (3 TP out of 5 predicted positives)")
else:
    print(f"FAIL: precision returned {p}, expected 0.6")

p2 = precision([1, 1], [1, 1])
if abs(p2 - 1.0) < 1e-9:
    _passed += 1
    print("PASS: precision == 1.0 when every predicted positive is correct")
else:
    print(f"FAIL: precision returned {p2}, expected 1.0")

p3 = precision([0, 0, 0], [0, 0, 0])
if abs(p3 - 0.0) < 1e-9:
    _passed += 1
    print("PASS: precision == 0.0 (no predicted positives at all) without crashing")
else:
    print(f"FAIL: precision returned {p3}, expected 0.0")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000108', 3, 'Recall', 'easy', 'Write `recall(y_true, y_pred)` returning TP / (TP + FN) -- of everything that was actually positive, what fraction did the model catch? Return 0.0 when there are no actual positives at all.', 'Same pattern as precision but conditioned on the TRUE label instead of the predicted one.', $py$def recall(y_true, y_pred):
    # TODO -- return recall: TP / (TP + FN). Return 0.0 if there are no
    # actual positives at all.
    pass
$py$, $py$_passed = 0
_total = 3

y_true = [1, 1, 1, 1, 1, 0, 0, 0, 0, 0]
y_pred = [1, 1, 1, 0, 0, 1, 1, 0, 0, 0]
r = recall(y_true, y_pred)
if abs(r - 0.6) < 1e-9:
    _passed += 1
    print(f"PASS: recall == 0.6 (3 TP out of 5 actual positives)")
else:
    print(f"FAIL: recall returned {r}, expected 0.6")

r2 = recall([1, 1], [1, 1])
if abs(r2 - 1.0) < 1e-9:
    _passed += 1
    print("PASS: recall == 1.0 when every actual positive was found")
else:
    print(f"FAIL: recall returned {r2}, expected 1.0")

r3 = recall([0, 0, 0], [1, 1, 1])
if abs(r3 - 0.0) < 1e-9:
    _passed += 1
    print("PASS: recall == 0.0 when there are no actual positives, without crashing")
else:
    print(f"FAIL: recall returned {r3}, expected 0.0")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000108', 4, 'F1 score', 'medium', 'Write `f1_score(y_true, y_pred)` returning the harmonic mean of precision and recall: 2*(P*R)/(P+R). Return 0.0 if both precision and recall are 0, to avoid dividing by zero.', 'F1 punishes an imbalance between precision and recall more than a plain average would -- compute both first, then combine them with the harmonic-mean formula.', $py$def f1_score(y_true, y_pred):
    # TODO -- compute precision and recall, then return their harmonic
    # mean: 2 * (precision * recall) / (precision + recall). Return 0.0
    # if precision + recall is 0.
    pass
$py$, $py$_passed = 0
_total = 3

y_true = [1, 1, 1, 1, 1, 0, 0, 0, 0, 0]
y_pred = [1, 1, 1, 0, 0, 1, 1, 0, 0, 0]
f1 = f1_score(y_true, y_pred)
if abs(f1 - 0.6) < 1e-9:
    _passed += 1
    print(f"PASS: f1_score == 0.6 (precision == recall == 0.6 here, so F1 matches)")
else:
    print(f"FAIL: f1_score returned {f1}, expected 0.6")

f1_perfect = f1_score([1, 0, 1, 0], [1, 0, 1, 0])
if abs(f1_perfect - 1.0) < 1e-9:
    _passed += 1
    print("PASS: f1_score == 1.0 for perfect predictions")
else:
    print(f"FAIL: f1_score returned {f1_perfect}, expected 1.0")

f1_zero = f1_score([1, 1, 1], [0, 0, 0])
if abs(f1_zero - 0.0) < 1e-9:
    _passed += 1
    print("PASS: f1_score == 0.0 when nothing is predicted positive (no crash)")
else:
    print(f"FAIL: f1_score returned {f1_zero}, expected 0.0")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000108', 5, 'Accuracy can lie on imbalanced data', 'medium', 'Write `accuracy_vs_recall_gap(y_true, y_pred)` returning `{"accuracy": .., "recall": ..}` for a small imbalanced dataset. The point: a model that always predicts the majority class can look great on accuracy while catching zero of the minority class.', 'accuracy = fraction where y_true[i] == y_pred[i]; recall = TP / (TP + FN), same as the earlier recall challenge.', $py$def accuracy_vs_recall_gap(y_true, y_pred):
    # y_true/y_pred describe a model on an imbalanced dataset (mostly
    # negatives).
    # TODO -- return a dict {"accuracy": .., "recall": ..} so the two
    # can be compared side by side.
    pass
$py$, $py$_passed = 0
_total = 3

# 9 negatives, 1 positive; the model just always predicts negative
y_true = [0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
y_pred = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

result = accuracy_vs_recall_gap(y_true, y_pred)
if abs(result["accuracy"] - 0.9) < 1e-9:
    _passed += 1
    print(f"PASS: accuracy == 0.9 despite catching zero positives")
else:
    print(f"FAIL: accuracy was {result['accuracy']}, expected 0.9")

if abs(result["recall"] - 0.0) < 1e-9:
    _passed += 1
    print(f"PASS: recall == 0.0 -- reveals the model misses the one positive entirely")
else:
    print(f"FAIL: recall was {result['recall']}, expected 0.0")

if result["accuracy"] > result["recall"]:
    _passed += 1
    print(f"PASS: accuracy ({result['accuracy']}) is misleadingly higher than recall ({result['recall']}) on this imbalanced set")
else:
    print("FAIL: expected accuracy to look much better than recall here")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000108', 6, 'Confusion matrix with sklearn', 'easy', 'Write `sklearn_confusion_matrix(y_true, y_pred)` using `sklearn.metrics.confusion_matrix(y_true, y_pred, labels=[0, 1])`, returned as a plain list of lists (`.tolist()`). Row/column order [0, 1] means `cm[0][0]`=TN, `cm[0][1]`=FP, `cm[1][0]`=FN, `cm[1][1]`=TP.', 'Passing labels=[0, 1] explicitly guarantees the row/column order regardless of which labels happen to appear in the data.', $py$from sklearn.metrics import confusion_matrix, classification_report

def sklearn_confusion_matrix(y_true, y_pred):
    # TODO -- return sklearn's confusion_matrix(y_true, y_pred) with
    # labels explicitly ordered [0, 1], as a plain list of lists
    pass
$py$, $py$_passed = 0
_total = 2

y_true = [1, 1, 1, 1, 1, 0, 0, 0, 0, 0]
y_pred = [1, 1, 1, 0, 0, 1, 1, 0, 0, 0]

cm = sklearn_confusion_matrix(y_true, y_pred)
# rows/cols ordered [0, 1]: cm[0][0]=TN, cm[0][1]=FP, cm[1][0]=FN, cm[1][1]=TP
expected = [[3, 2], [2, 3]]
if cm == expected:
    _passed += 1
    print(f"PASS: confusion matrix {cm} matches hand-computed TN/FP/FN/TP")
else:
    print(f"FAIL: confusion matrix {cm}, expected {expected}")

if isinstance(cm, list) and isinstance(cm[0], list):
    _passed += 1
    print("PASS: returned as a plain list of lists")
else:
    print(f"FAIL: returned type {type(cm)}, expected list of lists")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000108', 7, 'ROC-AUC', 'medium', 'Write `auc_score(y_true, y_scores)` using `sklearn.metrics.roc_auc_score`. Unlike accuracy/precision/recall, AUC judges the RANKING of predicted scores rather than a single threshold''s predictions: 1.0 means every positive scores higher than every negative, 0.5 means the scores carry no information.', 'It''s a direct call: roc_auc_score(y_true, y_scores) -- y_scores should be continuous probabilities, not 0/1 predictions.', $py$from sklearn.metrics import roc_auc_score

def auc_score(y_true, y_scores):
    # TODO -- return sklearn's roc_auc_score(y_true, y_scores), where
    # y_scores are continuous predicted probabilities of the positive class
    pass
$py$, $py$_passed = 0
_total = 3

# A perfect ranking: every positive scores higher than every negative
y_true = [0, 0, 0, 1, 1, 1]
y_scores = [0.1, 0.2, 0.3, 0.7, 0.8, 0.9]
auc1 = auc_score(y_true, y_scores)
if abs(auc1 - 1.0) < 1e-9:
    _passed += 1
    print("PASS: a perfect ranking gives AUC == 1.0")
else:
    print(f"FAIL: got {auc1}, expected 1.0")

# A random/uninformative ranking
y_true2 = [0, 1, 0, 1, 0, 1]
y_scores2 = [0.5, 0.5, 0.5, 0.5, 0.5, 0.5]
auc2 = auc_score(y_true2, y_scores2)
if abs(auc2 - 0.5) < 1e-9:
    _passed += 1
    print("PASS: identical scores for every point give AUC == 0.5 (chance level)")
else:
    print(f"FAIL: got {auc2}, expected 0.5")

# A perfectly wrong ranking
y_true3 = [0, 0, 0, 1, 1, 1]
y_scores3 = [0.9, 0.8, 0.7, 0.3, 0.2, 0.1]
auc3 = auc_score(y_true3, y_scores3)
if abs(auc3 - 0.0) < 1e-9:
    _passed += 1
    print("PASS: a perfectly inverted ranking gives AUC == 0.0")
else:
    print(f"FAIL: got {auc3}, expected 0.0")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000108', 8, 'Macro vs. micro F1', 'hard', 'Write `macro_vs_micro_f1(y_true, y_pred)` for a multi-class problem, returning `{"macro": .., "micro": ..}` using sklearn''s `f1_score` with `average="macro"` and `average="micro"`. Macro averages each class''s F1 equally regardless of how common it is; micro effectively pools all TP/FP/FN across classes, so common classes dominate.', 'Just two calls to f1_score with the different `average` values -- the interesting part is comparing the numbers, not the code.', $py$from sklearn.metrics import f1_score

def macro_vs_micro_f1(y_true, y_pred):
    # TODO -- for a MULTI-CLASS problem, return a dict
    # {"macro": f1_score(..., average="macro"), "micro": f1_score(..., average="micro")}
    pass
$py$, $py$_passed = 0
_total = 3

# Class 2 is rare and the model gets it completely wrong; classes 0/1
# are common and the model gets them right. This makes macro and micro
# diverge: macro treats the rare class's failure as equally important,
# micro lets it get drowned out by the common classes.
y_true = [0]*5 + [1]*5 + [2]*2
y_pred = [0]*5 + [1]*5 + [0, 1]

result = macro_vs_micro_f1(y_true, y_pred)

if isinstance(result, dict) and "macro" in result and "micro" in result:
    _passed += 1
    print(f"PASS: got a dict with 'macro' and 'micro' keys: {result}")
else:
    print(f"FAIL: got {result}, expected dict with 'macro' and 'micro'")

if result["micro"] > result["macro"]:
    _passed += 1
    print(f"PASS: micro F1 ({result['micro']:.3f}) > macro F1 ({result['macro']:.3f}) -- the rare class's total failure drags macro down more")
else:
    print(f"FAIL: expected micro ({result['micro']:.3f}) > macro ({result['macro']:.3f})")

if 0.0 <= result["macro"] <= 1.0 and 0.0 <= result["micro"] <= 1.0:
    _passed += 1
    print("PASS: both scores are valid values in [0, 1]")
else:
    print(f"FAIL: scores out of range: {result}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000108', 9, 'Comparing two models by F1', 'hard', 'Write `evaluate_and_compare(y_true, preds_a, preds_b)` that computes precision, recall, and F1 for two different models'' predictions on the same labels, and returns `{"model_a": {...}, "model_b": {...}, "better": "model_a" or "model_b"}` based on whichever has the higher F1.', 'Reuse the precision/recall/F1 formulas from earlier in this concept for each model''s predictions, then compare the two F1 values to decide ''better''.', $py$def evaluate_and_compare(y_true, preds_a, preds_b):
    # preds_a and preds_b are two models' predictions on the same y_true.
    # TODO -- compute (precision, recall, f1) for each model and return
    # {"model_a": {...}, "model_b": {...}, "better": "model_a" or "model_b"}
    # where "better" is whichever model has the higher F1 score.
    pass
$py$, $py$_passed = 0
_total = 3

y_true =  [1, 1, 1, 1, 1, 0, 0, 0, 0, 0]
preds_a = [1, 1, 1, 1, 0, 0, 0, 0, 0, 0]  # 4 TP, 1 FN, 0 FP -> high precision & recall
preds_b = [1, 1, 1, 1, 1, 1, 1, 1, 0, 0]  # 5 TP, 0 FN, 3 FP -> perfect recall, weak precision

result = evaluate_and_compare(y_true, preds_a, preds_b)

if "model_a" in result and "model_b" in result and "better" in result:
    _passed += 1
    print(f"PASS: got the expected top-level keys")
else:
    print(f"FAIL: got {result.keys() if isinstance(result, dict) else result}")

if abs(result["model_a"]["precision"] - 1.0) < 1e-9 and abs(result["model_a"]["recall"] - 0.8) < 1e-9:
    _passed += 1
    print(f"PASS: model_a precision/recall computed correctly ({result['model_a']})")
else:
    print(f"FAIL: model_a metrics {result['model_a']}, expected precision=1.0, recall=0.8")

if result["better"] == "model_a":
    _passed += 1
    print(f"PASS: model_a correctly identified as having the higher F1")
else:
    print(f"FAIL: 'better' was {result['better']}, expected 'model_a'")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000109', 1, 'K-fold splitting by hand', 'medium', 'Write `manual_kfold_indices(n, k)` returning a list of `k` `(train_indices, test_indices)` tuples that partition `range(n)` into `k` contiguous folds, each fold taking a turn as the test set. Assume `n` divides evenly by `k`.', 'fold_size = n // k; for fold i, its test slice runs from i*fold_size to (i+1)*fold_size, and the training indices are everything before and after that slice.', $py$def manual_kfold_indices(n, k):
    # TODO -- return a list of k tuples (train_indices, test_indices)
    # splitting range(n) into k contiguous folds. Fold i's test_indices
    # are that fold's slice; train_indices are everything else. Assume
    # n is evenly divisible by k for simplicity.
    pass
$py$, $py$_passed = 0
_total = 3

folds = manual_kfold_indices(10, 5)

if len(folds) == 5:
    _passed += 1
    print(f"PASS: got 5 folds")
else:
    print(f"FAIL: got {len(folds)} folds, expected 5")

all_test_idx = sorted(idx for _, test_idx in folds for idx in test_idx)
if all_test_idx == list(range(10)):
    _passed += 1
    print("PASS: every index appears in exactly one test fold, covering 0..9")
else:
    print(f"FAIL: test indices across folds were {all_test_idx}, expected 0..9 each once")

train0, test0 = folds[0]
if set(train0) & set(test0) == set() and len(train0) == 8 and len(test0) == 2:
    _passed += 1
    print(f"PASS: fold 0 has disjoint train/test sets of sizes 8 and 2")
else:
    print(f"FAIL: fold 0 train={train0}, test={test0}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000109', 2, 'KFold with scikit-learn', 'easy', 'Write `sklearn_kfold_test_sizes(n, k)` using `sklearn.model_selection.KFold(n_splits=k)` on `np.arange(n)`, returning a list of each fold''s test-set size.', 'kf.split(X) is a generator of (train_idx, test_idx) pairs -- iterate it and record len(test_idx) each time.', $py$from sklearn.model_selection import KFold

def sklearn_kfold_test_sizes(n, k):
    # TODO -- use sklearn's KFold(n_splits=k) to split range(n), and
    # return a list of the SIZE of each fold's test set
    pass
$py$, $py$_passed = 0
_total = 2

sizes = sklearn_kfold_test_sizes(10, 5)
if sizes == [2, 2, 2, 2, 2]:
    _passed += 1
    print(f"PASS: 10 items split 5 ways gives 5 folds of size 2: {sizes}")
else:
    print(f"FAIL: got {sizes}, expected [2, 2, 2, 2, 2]")

sizes2 = sklearn_kfold_test_sizes(10, 3)
if sum(sizes2) == 10 and len(sizes2) == 3:
    _passed += 1
    print(f"PASS: uneven split still covers all 10 items across 3 folds: {sizes2}")
else:
    print(f"FAIL: got {sizes2}, expected 3 fold sizes summing to 10")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000109', 3, 'cross_val_score', 'easy', 'Write `cv_scores(X, y, cv=5)` returning the array from `sklearn.model_selection.cross_val_score` run on a `LogisticRegression(max_iter=1000)` with the given number of folds.', 'cross_val_score(model, X, y, cv=cv) handles the fitting/splitting/scoring loop for you and returns one score per fold.', $py$from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import cross_val_score

def cv_scores(X, y, cv=5):
    # TODO -- return the array of cross_val_score results for a
    # LogisticRegression(max_iter=1000) on (X, y) with the given cv folds
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(42)
n = 100
c0 = np.random.randn(n, 2) + np.array([-2.0, -2.0])
c1 = np.random.randn(n, 2) + np.array([2.0, 2.0])
X = np.vstack([c0, c1])
y = np.array([0] * n + [1] * n)

scores = np.asarray(cv_scores(X, y, cv=5))

if scores.shape == (5,):
    _passed += 1
    print(f"PASS: got 5 fold scores: {np.round(scores, 3)}")
else:
    print(f"FAIL: shape {scores.shape}, expected (5,)")

if scores.mean() >= 0.85:
    _passed += 1
    print(f"PASS: mean CV score {scores.mean():.3f} >= 0.85 on well-separated data")
else:
    print(f"FAIL: mean CV score {scores.mean():.3f}, expected >= 0.85")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000109', 4, 'Stratified folds for imbalanced data', 'medium', 'Write `stratified_cv_scores(X, y, n_splits=5)` using `StratifiedKFold(n_splits=n_splits)` as the `cv` argument to `cross_val_score` with a `DecisionTreeClassifier(random_state=42)`. Stratified folds keep each class''s proportion roughly constant across folds -- important on imbalanced data where a plain KFold split could put almost all of a rare class into a single fold.', 'Build a StratifiedKFold object first, then pass it as cv=skf instead of a plain integer.', $py$from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import cross_val_score, StratifiedKFold

def stratified_cv_scores(X, y, n_splits=5):
    # TODO -- use StratifiedKFold(n_splits=n_splits) (which preserves
    # class proportions in every fold) as the `cv` argument to
    # cross_val_score with a DecisionTreeClassifier(random_state=42),
    # and return the resulting scores array
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(1)
# Imbalanced: 90 of class 0, 10 of class 1
n0, n1 = 90, 10
c0 = np.random.randn(n0, 2) + np.array([0.0, 0.0])
c1 = np.random.randn(n1, 2) + np.array([4.0, 4.0])
X = np.vstack([c0, c1])
y = np.array([0] * n0 + [1] * n1)

scores = np.asarray(stratified_cv_scores(X, y, n_splits=5))

if scores.shape == (5,):
    _passed += 1
    print(f"PASS: got 5 fold scores: {np.round(scores, 3)}")
else:
    print(f"FAIL: shape {scores.shape}, expected (5,)")

if scores.mean() >= 0.8:
    _passed += 1
    print(f"PASS: mean stratified CV accuracy {scores.mean():.3f} >= 0.8")
else:
    print(f"FAIL: mean CV accuracy {scores.mean():.3f}, expected >= 0.8")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000109', 5, 'Summarizing CV scores', 'easy', 'Write `cv_mean_and_std(X, y, cv=5)` running `cross_val_score` with a `LogisticRegression(max_iter=1000)` and returning `(mean_score, std_score)` as plain floats -- the mean tells you expected performance, the std tells you how much it varies fold to fold.', 'scores.mean() and scores.std() on the array cross_val_score returns; wrap each in float() to get plain Python floats.', $py$from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import cross_val_score

def cv_mean_and_std(X, y, cv=5):
    # TODO -- run cross_val_score with a LogisticRegression(max_iter=1000)
    # and return (mean_score, std_score) as plain floats
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

np.random.seed(42)
n = 100
c0 = np.random.randn(n, 2) + np.array([-2.0, -2.0])
c1 = np.random.randn(n, 2) + np.array([2.0, 2.0])
X = np.vstack([c0, c1])
y = np.array([0] * n + [1] * n)

mean_score, std_score = cv_mean_and_std(X, y, cv=5)

if isinstance(mean_score, float) and isinstance(std_score, float):
    _passed += 1
    print(f"PASS: returned two floats (mean={mean_score:.3f}, std={std_score:.3f})")
else:
    print(f"FAIL: returned types {type(mean_score)}, {type(std_score)}")

if mean_score >= 0.85:
    _passed += 1
    print(f"PASS: mean CV score {mean_score:.3f} >= 0.85")
else:
    print(f"FAIL: mean CV score {mean_score:.3f}, expected >= 0.85")

if std_score >= 0.0:
    _passed += 1
    print(f"PASS: std is non-negative ({std_score:.4f})")
else:
    print(f"FAIL: std_score {std_score} should never be negative")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000109', 6, 'Comparing models with CV', 'medium', 'Write `compare_models_cv(X, y, cv=5)` computing the mean `cross_val_score` for both a `LogisticRegression(max_iter=1000)` and a `DecisionTreeClassifier(random_state=42)` on the same data, returning `{"logistic_regression": .., "decision_tree": ..}`.', 'Run cross_val_score twice, once per model, and take .mean() of each result.', $py$from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import cross_val_score

def compare_models_cv(X, y, cv=5):
    # TODO -- compute the mean cross_val_score for LogisticRegression(max_iter=1000)
    # and for DecisionTreeClassifier(random_state=42) on the same (X, y),
    # and return {"logistic_regression": mean_score, "decision_tree": mean_score}
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(42)
n = 100
c0 = np.random.randn(n, 2) + np.array([-2.0, -2.0])
c1 = np.random.randn(n, 2) + np.array([2.0, 2.0])
X = np.vstack([c0, c1])
y = np.array([0] * n + [1] * n)

result = compare_models_cv(X, y, cv=5)

if "logistic_regression" in result and "decision_tree" in result:
    _passed += 1
    print(f"PASS: got both models' mean CV scores: {result}")
else:
    print(f"FAIL: got {result}, expected keys 'logistic_regression' and 'decision_tree'")

if result["logistic_regression"] >= 0.85 and result["decision_tree"] >= 0.8:
    _passed += 1
    print("PASS: both models perform reasonably on separable data")
else:
    print(f"FAIL: expected both scores reasonably high, got {result}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000109', 7, 'GridSearchCV', 'medium', 'Write `grid_search_best_k(X, y, k_values)` using `GridSearchCV(KNeighborsClassifier(), {"n_neighbors": k_values}, cv=5)`, fitting it and returning the best `n_neighbors` from `grid.best_params_`. This automates the try-every-k-and-compare loop from the KNN lesson.', 'grid.fit(X, y) runs the full search; grid.best_params_ is a dict keyed by the parameter names you passed in.', $py$from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import GridSearchCV

def grid_search_best_k(X, y, k_values):
    # TODO -- use GridSearchCV with a KNeighborsClassifier and a param
    # grid of {"n_neighbors": k_values}, cv=5, fit it on (X, y), and
    # return the best n_neighbors value found (best_params_)
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(42)
n = 150
c0 = np.random.randn(n, 2) * 1.3 + np.array([-1.0, -1.0])
c1 = np.random.randn(n, 2) * 1.3 + np.array([1.0, 1.0])
X = np.vstack([c0, c1])
y = np.array([0] * n + [1] * n)

best_k = grid_search_best_k(X, y, [1, 3, 5, 7, 9])

if best_k in [1, 3, 5, 7, 9]:
    _passed += 1
    print(f"PASS: returned a candidate value from the grid ({best_k})")
else:
    print(f"FAIL: returned {best_k}, expected one of [1, 3, 5, 7, 9]")

if best_k != 1:
    _passed += 1
    print(f"PASS: grid search avoided overfit-prone k=1 (chose {best_k})")
else:
    print("FAIL: expected grid search to favor a k > 1 on this noisy data")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000109', 8, 'Avoiding leakage: scale after splitting', 'hard', 'Write `leakage_free_workflow(X, y)`: split first (`test_size=0.25, random_state=42`), then fit a `StandardScaler` on the TRAINING split only and use it to transform both splits, then fit `LogisticRegression` and return test accuracy. Fitting the scaler on the full dataset before splitting would leak test-set statistics into training.', 'scaler.fit_transform(X_train) fits and transforms in one call; scaler.transform(X_test) (no fit!) reuses those same training statistics on the test set.', $py$from sklearn.linear_model import LogisticRegression
from sklearn.preprocessing import StandardScaler
from sklearn.model_selection import train_test_split

def leakage_free_workflow(X, y):
    # TODO -- the CORRECT order to avoid data leakage:
    #   1. train_test_split(X, y, test_size=0.25, random_state=42)
    #   2. fit a StandardScaler on X_train ONLY, then transform both
    #      X_train and X_test with it
    #   3. fit LogisticRegression on the scaled X_train
    #   4. return its accuracy on the scaled X_test
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(42)
n = 150
c0 = np.random.randn(n, 2) + np.array([-2.0, -2.0])
c1 = np.random.randn(n, 2) + np.array([2.0, 2.0])
X = np.vstack([c0, c1])
y = np.array([0] * n + [1] * n)

acc = leakage_free_workflow(X, y)

if isinstance(acc, float):
    _passed += 1
    print(f"PASS: returned a float ({acc:.3f})")
else:
    print(f"FAIL: returned type {type(acc)}, expected float")

if acc >= 0.9:
    _passed += 1
    print(f"PASS: test accuracy {acc:.3f} >= 0.9 on separable data")
else:
    print(f"FAIL: test accuracy {acc:.3f}, expected >= 0.9")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000109', 9, 'Scaling correctly inside cross-validation', 'hard', 'Write `cv_with_scaling_pipeline(X, y, cv=5)` building a `Pipeline(StandardScaler -> LogisticRegression(max_iter=1000))` and passing the WHOLE pipeline into `cross_val_score`. This way each fold fits its own scaler using only that fold''s training portion -- the leakage-safe generalization of the previous challenge, done automatically across every fold.', 'cross_val_score(pipe, X, y, cv=cv) treats the pipeline as a single estimator, so scaling happens fresh inside every fold instead of once globally.', $py$from sklearn.linear_model import LogisticRegression
from sklearn.preprocessing import StandardScaler
from sklearn.pipeline import Pipeline
from sklearn.model_selection import cross_val_score

def cv_with_scaling_pipeline(X, y, cv=5):
    # TODO -- build a Pipeline (StandardScaler -> LogisticRegression),
    # then run cross_val_score on the WHOLE PIPELINE (not just the
    # classifier) so each fold refits its own scaler on only that
    # fold's training data. Return the mean score as a float.
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(42)
n = 100
c0 = np.random.randn(n, 2) * np.array([50.0, 1.0]) + np.array([-100.0, -2.0])
c1 = np.random.randn(n, 2) * np.array([50.0, 1.0]) + np.array([100.0, 2.0])
X = np.vstack([c0, c1])
y = np.array([0] * n + [1] * n)

mean_score = cv_with_scaling_pipeline(X, y, cv=5)

if isinstance(mean_score, float):
    _passed += 1
    print(f"PASS: returned a float ({mean_score:.3f})")
else:
    print(f"FAIL: returned type {type(mean_score)}, expected float")

if mean_score >= 0.9:
    _passed += 1
    print(f"PASS: mean CV accuracy {mean_score:.3f} >= 0.9 with per-fold scaling")
else:
    print(f"FAIL: mean CV accuracy {mean_score:.3f}, expected >= 0.9")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000110', 1, 'Min-max scaling by hand', 'easy', 'Write `min_max_scale(X)` scaling every column of a 2-D array to the [0, 1] range: (x - col_min) / (col_max - col_min), computed per column.', 'X.min(axis=0) and X.max(axis=0) give per-column mins/maxes; NumPy broadcasts the subtraction/division across rows automatically.', $py$import numpy as np

def min_max_scale(X):
    # TODO -- scale each COLUMN of X to the range [0, 1]:
    # (x - col_min) / (col_max - col_min)
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X = np.array([[0.0, 10.0], [5.0, 20.0], [10.0, 30.0]])
scaled = np.asarray(min_max_scale(X))

if np.allclose(scaled.min(axis=0), [0.0, 0.0], atol=1e-9):
    _passed += 1
    print("PASS: every column's minimum scales to 0.0")
else:
    print(f"FAIL: column minimums were {scaled.min(axis=0)}, expected [0, 0]")

if np.allclose(scaled.max(axis=0), [1.0, 1.0], atol=1e-9):
    _passed += 1
    print("PASS: every column's maximum scales to 1.0")
else:
    print(f"FAIL: column maximums were {scaled.max(axis=0)}, expected [1, 1]")

expected_middle = np.array([0.5, 0.5])
if np.allclose(scaled[1], expected_middle, atol=1e-9):
    _passed += 1
    print(f"PASS: the middle row scales to {expected_middle}")
else:
    print(f"FAIL: middle row scaled to {scaled[1]}, expected {expected_middle}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000110', 2, 'Standardization (z-score) by hand', 'easy', 'Write `standardize(X)` scaling every column to zero mean and unit variance: (x - col_mean) / col_std, computed per column.', 'X.mean(axis=0) and X.std(axis=0) give per-column statistics for the broadcasted subtraction/division.', $py$import numpy as np

def standardize(X):
    # TODO -- scale each COLUMN of X to zero mean and unit variance
    # (z-score): (x - col_mean) / col_std
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X = np.array([[1.0, 100.0], [2.0, 200.0], [3.0, 300.0], [4.0, 400.0]])
scaled = np.asarray(standardize(X))

if np.allclose(scaled.mean(axis=0), [0.0, 0.0], atol=1e-9):
    _passed += 1
    print("PASS: every column has mean ~0 after standardizing")
else:
    print(f"FAIL: column means were {scaled.mean(axis=0)}, expected ~0")

if np.allclose(scaled.std(axis=0), [1.0, 1.0], atol=1e-9):
    _passed += 1
    print("PASS: every column has std ~1 after standardizing")
else:
    print(f"FAIL: column stds were {scaled.std(axis=0)}, expected ~1")

# Both columns are perfectly linear, so their standardized versions should match
if np.allclose(scaled[:, 0], scaled[:, 1], atol=1e-9):
    _passed += 1
    print("PASS: two proportional columns standardize to identical values")
else:
    print(f"FAIL: standardized columns differ: {scaled[:, 0]} vs {scaled[:, 1]}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000110', 3, 'StandardScaler with scikit-learn', 'easy', 'Write `fit_transform_standard(X_train, X_test)` fitting `sklearn.preprocessing.StandardScaler` on `X_train` and returning `(X_train_scaled, X_test_scaled)`, using the SAME fitted scaler for both.', 'scaler.fit_transform(X_train) fits and transforms together; scaler.transform(X_test) reuses those training statistics without refitting.', $py$from sklearn.preprocessing import StandardScaler

def fit_transform_standard(X_train, X_test):
    # TODO -- fit a StandardScaler on X_train, then return
    # (X_train_scaled, X_test_scaled) -- fit only on train, transform both
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X_train = np.array([[1.0, 10.0], [2.0, 20.0], [3.0, 30.0], [4.0, 40.0]])
X_test = np.array([[2.5, 25.0]])

train_scaled, test_scaled = fit_transform_standard(X_train, X_test)
train_scaled = np.asarray(train_scaled)
test_scaled = np.asarray(test_scaled)

if np.allclose(train_scaled.mean(axis=0), [0.0, 0.0], atol=1e-9):
    _passed += 1
    print("PASS: training data has mean ~0 after fit_transform")
else:
    print(f"FAIL: train means were {train_scaled.mean(axis=0)}, expected ~0")

if test_scaled.shape == (1, 2):
    _passed += 1
    print("PASS: test data has the same shape as before, just scaled")
else:
    print(f"FAIL: test shape {test_scaled.shape}, expected (1, 2)")

# X_test's row is the midpoint of X_train, so its scaled value should be 0
if np.allclose(test_scaled[0], [0.0, 0.0], atol=1e-6):
    _passed += 1
    print(f"PASS: the midpoint of X_train transforms to ~0 using train statistics ({test_scaled[0]})")
else:
    print(f"FAIL: got {test_scaled[0]}, expected ~[0, 0]")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000110', 4, 'MinMaxScaler with scikit-learn', 'easy', 'Write `fit_transform_minmax(X_train, X_test)` fitting `sklearn.preprocessing.MinMaxScaler` on `X_train` and returning `(X_train_scaled, X_test_scaled)`.', 'Same fit_transform/transform pattern as StandardScaler -- just a different scaler class.', $py$from sklearn.preprocessing import MinMaxScaler

def fit_transform_minmax(X_train, X_test):
    # TODO -- fit a MinMaxScaler on X_train, then return
    # (X_train_scaled, X_test_scaled)
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X_train = np.array([[0.0], [50.0], [100.0]])
X_test = np.array([[25.0], [150.0]])

train_scaled, test_scaled = fit_transform_minmax(X_train, X_test)
train_scaled = np.asarray(train_scaled)
test_scaled = np.asarray(test_scaled)

if np.allclose(train_scaled.ravel(), [0.0, 0.5, 1.0], atol=1e-9):
    _passed += 1
    print(f"PASS: training data scaled to [0, 0.5, 1.0]: {train_scaled.ravel()}")
else:
    print(f"FAIL: got {train_scaled.ravel()}, expected [0, 0.5, 1.0]")

if abs(test_scaled[0, 0] - 0.25) < 1e-9:
    _passed += 1
    print(f"PASS: a test value of 25 (using train min/max) scales to 0.25")
else:
    print(f"FAIL: got {test_scaled[0, 0]}, expected 0.25")

# A test point beyond the training range legitimately scales outside [0, 1]
if test_scaled[1, 0] > 1.0:
    _passed += 1
    print(f"PASS: a test value beyond the training range scales above 1.0 ({test_scaled[1, 0]:.2f}), as expected")
else:
    print(f"FAIL: expected a value > 1.0 for an out-of-range test point, got {test_scaled[1, 0]}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000110', 5, 'Fit on train, transform on test', 'medium', 'Write `correct_scaling_workflow(X, y)` doing the leak-free order: split first, fit the scaler on the training split only, transform both splits, then train and evaluate.', 'Never call scaler.fit (or fit_transform) on X_test -- always scaler.transform(X_test) using statistics learned from X_train.', $py$from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split

def correct_scaling_workflow(X, y):
    # TODO -- split (test_size=0.25, random_state=42), fit a scaler on
    # X_train ONLY, transform both splits with it, fit LogisticRegression
    # on the scaled training data, and return test accuracy
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 2

np.random.seed(42)
n = 150
c0 = np.random.randn(n, 2) + np.array([-2.0, -2.0])
c1 = np.random.randn(n, 2) + np.array([2.0, 2.0])
X = np.vstack([c0, c1])
y = np.array([0] * n + [1] * n)

acc = correct_scaling_workflow(X, y)

if isinstance(acc, float):
    _passed += 1
    print(f"PASS: returned a float ({acc:.3f})")
else:
    print(f"FAIL: returned type {type(acc)}, expected float")

if acc >= 0.9:
    _passed += 1
    print(f"PASS: test accuracy {acc:.3f} >= 0.9")
else:
    print(f"FAIL: test accuracy {acc:.3f}, expected >= 0.9")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000110', 6, 'One-hot encoding categories', 'medium', 'Write `one_hot_encode(df, column)` taking a pandas DataFrame and a categorical column name, returning a new DataFrame with that column replaced by one-hot dummy columns (`pd.get_dummies`), dropping the original categorical column.', 'pd.get_dummies(df[column], prefix=column) builds the dummy columns; pd.concat([df.drop(columns=[column]), dummies], axis=1) glues them back onto the rest of the DataFrame.', $py$import pandas as pd

def one_hot_encode(df, column):
    # TODO -- given a pandas DataFrame and a categorical column name,
    # return a NEW DataFrame with that column replaced by one-hot
    # encoded dummy columns (use pd.get_dummies), dropping the original
    pass
$py$, $py$import pandas as pd
_passed = 0
_total = 3

df = pd.DataFrame({"color": ["red", "blue", "red", "green"], "size": [1, 2, 3, 4]})
result = one_hot_encode(df, "color")

if "color" not in result.columns:
    _passed += 1
    print(f"PASS: original 'color' column was replaced, columns now: {list(result.columns)}")
else:
    print(f"FAIL: 'color' column still present in {list(result.columns)}")

expected_cols = {"color_red", "color_blue", "color_green", "size"}
if expected_cols <= set(result.columns):
    _passed += 1
    print(f"PASS: one-hot columns for each category were created")
else:
    print(f"FAIL: columns were {list(result.columns)}, expected to include {expected_cols}")

if int(result.loc[0, "color_red"]) == 1 and int(result.loc[0, "color_blue"]) == 0:
    _passed += 1
    print("PASS: row 0 ('red') is correctly one-hot encoded")
else:
    print(f"FAIL: row 0 encoding was color_red={result.loc[0, 'color_red']}, color_blue={result.loc[0, 'color_blue']}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000110', 7, 'Filling in missing values', 'medium', 'Write `impute_missing(X, strategy="mean")` using `sklearn.impute.SimpleImputer` to fill missing (`np.nan`) values in each column according to `strategy` (e.g. `"mean"`), returning the completed array.', 'imputer.fit_transform(X) both learns the fill values (e.g. each column''s mean, ignoring NaNs) and applies them in one call.', $py$import numpy as np
from sklearn.impute import SimpleImputer

def impute_missing(X, strategy="mean"):
    # TODO -- fit a SimpleImputer with the given strategy on X (which may
    # contain np.nan) and return the imputed array
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

X = np.array([[1.0, 10.0], [2.0, np.nan], [3.0, 30.0], [np.nan, 40.0]])
result = np.asarray(impute_missing(X, strategy="mean"))

if not np.isnan(result).any():
    _passed += 1
    print(f"PASS: no NaNs remain after imputation")
else:
    print(f"FAIL: result still contains NaNs: {result}")

expected_col0_fill = np.mean([1.0, 2.0, 3.0])
if abs(result[3, 0] - expected_col0_fill) < 1e-9:
    _passed += 1
    print(f"PASS: the missing value in column 0 was filled with that column's mean ({expected_col0_fill:.2f})")
else:
    print(f"FAIL: filled value was {result[3, 0]}, expected {expected_col0_fill:.2f}")

expected_col1_fill = np.mean([10.0, 30.0, 40.0])
if abs(result[1, 1] - expected_col1_fill) < 1e-9:
    _passed += 1
    print(f"PASS: the missing value in column 1 was filled with that column's mean ({expected_col1_fill:.2f})")
else:
    print(f"FAIL: filled value was {result[1, 1]}, expected {expected_col1_fill:.2f}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000110', 8, 'ColumnTransformer for mixed data', 'hard', 'Write `build_preprocessor(numeric_cols, categorical_cols)` returning a `ColumnTransformer` that applies `StandardScaler` to `numeric_cols` (step named `"num"`) and `OneHotEncoder(handle_unknown="ignore")` to `categorical_cols` (step named `"cat"`) -- handling numeric and categorical columns with a single preprocessing object.', 'ColumnTransformer([("num", StandardScaler(), numeric_cols), ("cat", OneHotEncoder(handle_unknown="ignore"), categorical_cols)]) -- each tuple is (name, transformer, columns it applies to).', $py$import numpy as np
import pandas as pd
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import StandardScaler, OneHotEncoder

def build_preprocessor(numeric_cols, categorical_cols):
    # TODO -- return a ColumnTransformer that applies StandardScaler to
    # numeric_cols and OneHotEncoder(handle_unknown="ignore") to
    # categorical_cols, named "num" and "cat" respectively
    pass
$py$, $py$import pandas as pd
import numpy as np
from sklearn.compose import ColumnTransformer
_passed = 0
_total = 3

df = pd.DataFrame({
    "age": [20.0, 30.0, 40.0, 50.0],
    "income": [1000.0, 2000.0, 3000.0, 4000.0],
    "city": ["NYC", "LA", "NYC", "SF"],
})

preprocessor = build_preprocessor(["age", "income"], ["city"])

if isinstance(preprocessor, ColumnTransformer):
    _passed += 1
    print("PASS: returned a ColumnTransformer")
else:
    print(f"FAIL: returned type {type(preprocessor)}, expected ColumnTransformer")

transformed = preprocessor.fit_transform(df)
transformed = np.asarray(transformed)
# 2 scaled numeric columns + 3 one-hot city columns (NYC, LA, SF) = 5
if transformed.shape == (4, 5):
    _passed += 1
    print(f"PASS: output has 4 rows and 5 columns (2 scaled + 3 one-hot): {transformed.shape}")
else:
    print(f"FAIL: output shape {transformed.shape}, expected (4, 5)")

names = [name for name, _, _ in preprocessor.transformers]
if "num" in names and "cat" in names:
    _passed += 1
    print("PASS: transformer steps are named 'num' and 'cat'")
else:
    print(f"FAIL: transformer names were {names}, expected 'num' and 'cat'")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000013', '10000000-0000-0000-0000-000000000110', 9, 'Measuring the effect of scaling', 'hard', 'Write `knn_accuracy_scaled_vs_unscaled(X, y, k=5)` comparing KNN test accuracy with and without feature scaling on the same train/test split, returning `{"unscaled": .., "scaled": ..}`. When one feature''s raw scale dwarfs another''s, distance-based models like KNN end up mostly measuring the big-scale feature.', 'Do the unscaled fit/score first, then repeat with a StandardScaler fit on X_train and applied to both splits before fitting the second model.', $py$from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split

def knn_accuracy_scaled_vs_unscaled(X, y, k=5):
    # TODO -- split (test_size=0.25, random_state=42). Fit a plain
    # KNeighborsClassifier(n_neighbors=k) on the RAW (unscaled) data and
    # record test accuracy. Then fit another on data scaled with
    # StandardScaler (fit on train, applied to both) and record that
    # test accuracy too. Return {"unscaled": .., "scaled": ..}
    pass
$py$, $py$import numpy as np
_passed = 0
_total = 3

np.random.seed(3)
n = 150
# feature 0 has a huge scale and is uninformative noise; feature 1 is
# the informative, small-scale one
class0 = np.random.randn(n, 2) * np.array([1000.0, 0.3]) + np.array([0.0, -2.0])
class1 = np.random.randn(n, 2) * np.array([1000.0, 0.3]) + np.array([0.0, 2.0])
X = np.vstack([class0, class1])
y = np.array([0] * n + [1] * n)

result = knn_accuracy_scaled_vs_unscaled(X, y, k=5)

if "unscaled" in result and "scaled" in result:
    _passed += 1
    print(f"PASS: got both accuracies: {result}")
else:
    print(f"FAIL: got {result}, expected keys 'unscaled' and 'scaled'")

if result["scaled"] > result["unscaled"]:
    _passed += 1
    print(f"PASS: scaling helps here ({result['scaled']:.3f} > {result['unscaled']:.3f})")
else:
    print(f"FAIL: expected scaled accuracy ({result['scaled']:.3f}) > unscaled ({result['unscaled']:.3f})")

if result["scaled"] >= 0.85:
    _passed += 1
    print(f"PASS: scaled KNN reaches {result['scaled']:.3f} accuracy")
else:
    print(f"FAIL: scaled accuracy only {result['scaled']:.3f}, expected >= 0.85")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000111', 1, 'Train accuracy vs test accuracy', 'easy', 'Write `evaluate_model()` that generates a classification dataset with `sklearn.datasets.make_classification(n_samples=300, n_features=10, random_state=42)`, splits it with `train_test_split(X, y, test_size=0.3, random_state=42)`, fits a `DecisionTreeClassifier(max_depth=3, random_state=42)` on the training data, and returns a tuple `(train_accuracy, test_accuracy)`.', 'Use accuracy_score(y_train, model.predict(X_train)) and the same for the test set.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score

def evaluate_model():
    # TODO: generate data, split, fit a DecisionTreeClassifier(max_depth=3, random_state=42),
    # and return (train_accuracy, test_accuracy)
    pass
$py$, $py$results = []
train_acc, test_acc = evaluate_model()
results.append(("train_acc in [0,1]", 0.0 <= train_acc <= 1.0))
results.append(("test_acc in [0,1]", 0.0 <= test_acc <= 1.0))
results.append(("train_acc close to expected", abs(train_acc - 0.9714285714285714) < 0.05))
results.append(("test_acc close to expected", abs(test_acc - 0.9444444444444444) < 0.08))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000111', 2, 'Classifying a fit from its accuracy gap', 'easy', 'Write `classify_fit(train_acc, test_acc)` that returns one of the strings `''underfit''`, `''overfit''`, or `''good_fit''`: return `''underfit''` if `train_acc < 0.75`, otherwise return `''overfit''` if `train_acc - test_acc > 0.15`, otherwise return `''good_fit''`.', 'Check the underfit condition first -- a model with low train accuracy can''t be ''overfit''.', $py$def classify_fit(train_acc, test_acc):
    # TODO: return 'underfit', 'overfit', or 'good_fit' per the rules above
    pass
$py$, $py$cases = [
    ((0.60, 0.58), "underfit"),
    ((0.99, 0.70), "overfit"),
    ((0.90, 0.88), "good_fit"),
    ((0.70, 0.95), "underfit"),
    ((0.85, 0.69), "overfit"),
]
passed = 0
for (train_acc, test_acc), expected in cases:
    got = classify_fit(train_acc, test_acc)
    ok = got == expected
    print(f"{'PASS' if ok else 'FAIL'}: classify_fit({train_acc}, {test_acc}) == {expected!r} (got {got!r})")
    passed += ok
print(f"{passed}/{len(cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000111', 3, 'Shallow vs deep tree: complexity and accuracy', 'medium', 'Write `compare_complexity()` that generates the same dataset as before (`make_classification(n_samples=300, n_features=10, random_state=42)`, split with `train_test_split(X, y, test_size=0.3, random_state=42)`), fits a shallow `DecisionTreeClassifier(max_depth=1, random_state=42)` and a deep `DecisionTreeClassifier(max_depth=None, random_state=42)`, and returns a dict `{''shallow_train'': ..., ''shallow_test'': ..., ''deep_train'': ..., ''deep_test'': ...}` of their accuracies.', 'A fully-grown tree (max_depth=None) can memorize the training set, so its train accuracy should land at (or very near) 1.0.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score

def compare_complexity():
    # TODO: fit a shallow (max_depth=1) and a deep (max_depth=None) tree,
    # return {'shallow_train', 'shallow_test', 'deep_train', 'deep_test'}
    pass
$py$, $py$results = []
d = compare_complexity()
results.append(("has all four keys", set(d.keys()) == {'shallow_train','shallow_test','deep_train','deep_test'}))
results.append(("deep_train close to 1.0 (memorized)", abs(d['deep_train'] - 1.0) < 1e-6))
results.append(("shallow_train less than deep_train", d['shallow_train'] < d['deep_train']))
results.append(("shallow_train close to expected", abs(d['shallow_train'] - 0.9380952380952381) < 0.05))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000111', 4, 'Estimating variance with the bootstrap', 'medium', 'Write `prediction_variance()`. Generate data with `rng = np.random.RandomState(42); X = rng.uniform(-3, 3, size=(60, 1)); y = 2*X[:, 0] + 1 + rng.normal(0, 2, size=60)`. Then, using a separate `boot_rng = np.random.RandomState(0)`, run 30 bootstrap iterations: each iteration draw `idx = boot_rng.randint(0, 60, size=60)`, fit a `LinearRegression` on `X[idx], y[idx]`, and predict at `x_query = np.array([[1.5]])`. Return the variance (`float`) of the 30 predictions -- this is a hands-on proxy for how much a model''s predictions swing across different training samples.', 'Create the data RandomState first, then a fresh RandomState(0) just for the bootstrap indices, in that exact order -- order affects the random sequence.', $py$import numpy as np
from sklearn.linear_model import LinearRegression

def prediction_variance():
    rng = np.random.RandomState(42)
    X = rng.uniform(-3, 3, size=(60, 1))
    y = 2 * X[:, 0] + 1 + rng.normal(0, 2, size=60)
    x_query = np.array([[1.5]])
    boot_rng = np.random.RandomState(0)
    preds = []
    # TODO: run 30 bootstrap iterations, fit LinearRegression each time, collect predictions
    return float(np.var(preds))
$py$, $py$results = []
v = prediction_variance()
results.append(("returns a float", isinstance(v, float)))
results.append(("variance is non-negative", v >= 0))
results.append(("variance close to expected", abs(v - 0.11982801515162066) < 0.02))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000111', 5, 'Spotting high variance with cross-validation', 'medium', 'Write `cv_spread()` that generates `make_classification(n_samples=300, n_features=10, random_state=42)`, runs `cross_val_score` with `cv=5` on a `DecisionTreeClassifier(max_depth=3, random_state=42)`, and returns a tuple `(mean_score, std_score)` across the 5 folds. A large `std_score` relative to the mean signals the model''s performance is unstable across different slices of data -- a variance red flag.', 'cross_val_score(model, X, y, cv=5) returns a NumPy array of 5 scores; use .mean() and .std().', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import cross_val_score
from sklearn.tree import DecisionTreeClassifier

def cv_spread():
    X, y = make_classification(n_samples=300, n_features=10, random_state=42)
    model = DecisionTreeClassifier(max_depth=3, random_state=42)
    # TODO: run 5-fold cross_val_score and return (mean_score, std_score)
    pass
$py$, $py$results = []
mean_score, std_score = cv_spread()
results.append(("mean_score in [0,1]", 0.0 <= mean_score <= 1.0))
results.append(("std_score non-negative", std_score >= 0))
results.append(("mean_score close to expected", abs(mean_score - 0.9166666666666666) < 0.03))
results.append(("std_score close to expected", abs(std_score - 0.07817359599705713) < 0.03))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000111', 6, 'Learning curves: does more data help?', 'hard', 'Write `train_size_accuracies()`. Generate `make_classification(n_samples=300, n_features=10, random_state=42)`, split with `train_test_split(X, y, test_size=0.3, random_state=42)`. For each size `n` in `[20, 50, 100, len(X_train)]`, fit a fresh `DecisionTreeClassifier(max_depth=3, random_state=42)` on just the first `n` rows of `X_train`/`y_train`, evaluate accuracy on the full `X_test`/`y_test`, and return the list of 4 test accuracies in the same order as the sizes.', 'Slice with X_train[:n], y_train[:n] -- fit a brand-new model instance inside the loop each time so old fits don''t leak in.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score

def train_size_accuracies():
    X, y = make_classification(n_samples=300, n_features=10, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    sizes = [20, 50, 100, len(X_train)]
    accs = []
    # TODO: for each size, fit on the first n rows and append test accuracy to accs
    return accs
$py$, $py$results = []
accs = train_size_accuracies()
expected = [0.8111111111111111, 0.9, 0.9, 0.9444444444444444]
results.append(("returns 4 accuracies", len(accs) == 4))
results.append(("all values close to expected", all(abs(a - e) < 0.05 for a, e in zip(accs, expected))))
results.append(("last size does at least as well as first", accs[-1] >= accs[0] - 0.02))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000111', 7, 'A straight line through a curve: underfitting', 'easy', 'Write `linear_vs_tree()`. Generate `make_moons(n_samples=300, noise=0.1, random_state=42)`, split with `train_test_split(X, y, test_size=0.3, random_state=42)`. Fit a `LogisticRegression()` and, separately, a `DecisionTreeClassifier(max_depth=5, random_state=42)` on the training data. Return `(linear_train_acc, tree_train_acc)` -- the training accuracy of each.', 'LogisticRegression draws a straight decision boundary; it can''t perfectly separate the crescent-shaped moons data no matter how much training data it sees -- that''s high bias.', $py$from sklearn.datasets import make_moons
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score

def linear_vs_tree():
    X, y = make_moons(n_samples=300, noise=0.1, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    # TODO: fit LogisticRegression() and DecisionTreeClassifier(max_depth=5, random_state=42)
    # return (linear_train_acc, tree_train_acc)
    pass
$py$, $py$results = []
linear_acc, tree_acc = linear_vs_tree()
results.append(("tree_acc higher than linear_acc", tree_acc > linear_acc))
results.append(("linear_acc close to expected", abs(linear_acc - 0.8523809523809524) < 0.05))
results.append(("tree_acc close to expected", abs(tree_acc - 0.9952380952380953) < 0.02))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000111', 8, 'Finding the regularization sweet spot', 'medium', 'Write `best_ridge_alpha()`. Generate `make_regression(n_samples=200, n_features=20, n_informative=5, noise=15, random_state=42)`, split with `train_test_split(X, y, test_size=0.3, random_state=42)`. For each `alpha` in `[0.01, 0.1, 1.0, 10.0, 100.0]`, fit `Ridge(alpha=alpha, random_state=42)` and compute test MSE with `mean_squared_error`. Return `(best_alpha, best_mse)` for whichever alpha gives the lowest test MSE. Too little regularization overfits the noise (high variance); too much flattens the model toward predicting the mean (high bias) -- the best alpha sits in between.', 'Loop over the alphas, track the minimum MSE seen so far and which alpha produced it.', $py$from sklearn.datasets import make_regression
from sklearn.model_selection import train_test_split
from sklearn.linear_model import Ridge
from sklearn.metrics import mean_squared_error

def best_ridge_alpha():
    X, y = make_regression(n_samples=200, n_features=20, n_informative=5, noise=15, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    alphas = [0.01, 0.1, 1.0, 10.0, 100.0]
    best_alpha, best_mse = None, float('inf')
    # TODO: fit a Ridge for each alpha, track the one with lowest test MSE
    return best_alpha, best_mse
$py$, $py$results = []
best_alpha, best_mse = best_ridge_alpha()
results.append(("best_alpha == 1.0", abs(best_alpha - 1.0) < 1e-9))
results.append(("best_mse close to expected", abs(best_mse - 163.30978593602202) < 5.0))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000111', 9, 'Which model has more variance: shallow or deep?', 'hard', 'Write `variance_at_depth(depth)`. Generate data with `rng = np.random.RandomState(7); X = rng.uniform(-3, 3, size=(80, 1)); y = np.sin(X[:, 0]) + rng.normal(0, 0.3, size=80)`. Using a separate `boot_rng = np.random.RandomState(1)`, run 25 bootstrap iterations: each iteration draw `idx = boot_rng.randint(0, 80, size=80)`, fit a `DecisionTreeRegressor(max_depth=depth, random_state=42)` on `X[idx], y[idx]`, predict at `x_query = np.array([[0.5]])`, and collect the prediction. Return the variance (`float`) of the 25 predictions. Then use it (calling it twice, with `depth=2` and `depth=None`) is how you''d confirm deeper trees have higher variance -- the function itself just needs to compute that variance for one depth.', 'Same bootstrap pattern as prediction_variance() earlier, but the model is a DecisionTreeRegressor and depth is a parameter.', $py$import numpy as np
from sklearn.tree import DecisionTreeRegressor

def variance_at_depth(depth):
    rng = np.random.RandomState(7)
    X = rng.uniform(-3, 3, size=(80, 1))
    y = np.sin(X[:, 0]) + rng.normal(0, 0.3, size=80)
    x_query = np.array([[0.5]])
    boot_rng = np.random.RandomState(1)
    preds = []
    # TODO: run 25 bootstrap iterations, fit a DecisionTreeRegressor(max_depth=depth, random_state=42) each time
    return float(np.var(preds))
$py$, $py$results = []
shallow_var = variance_at_depth(2)
deep_var = variance_at_depth(None)
results.append(("shallow_var close to expected", abs(shallow_var - 0.0077044945491208305) < 0.01))
results.append(("deep_var close to expected", abs(deep_var - 0.04346896677824908) < 0.02))
results.append(("deep tree has higher variance than shallow tree", deep_var > shallow_var))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000112', 1, 'Manual grid search with a validation split', 'easy', 'Write `manual_grid_search()`. Generate `make_classification(n_samples=300, n_features=10, random_state=42)`, split into train/test with `train_test_split(X, y, test_size=0.3, random_state=42)`, then split the training data again into a smaller train/validation set with `train_test_split(X_train, y_train, test_size=0.25, random_state=42)`. For each `depth` in `[1, 2, 3, 5, None]`, fit a `DecisionTreeClassifier(max_depth=depth, random_state=42)` on the smaller training set and score it on the validation set. Return `(best_depth, best_val_acc)` for the depth with the highest validation accuracy.', 'Track the best depth and accuracy seen so far as you loop, the same pattern as picking a max out of a list.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score

def manual_grid_search():
    X, y = make_classification(n_samples=300, n_features=10, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    X_tr2, X_val, y_tr2, y_val = train_test_split(X_train, y_train, test_size=0.25, random_state=42)
    depths = [1, 2, 3, 5, None]
    best_depth, best_val_acc = None, -1
    # TODO: fit a tree for each depth on (X_tr2, y_tr2), score on (X_val, y_val),
    # keep the depth with the best validation accuracy
    return best_depth, best_val_acc
$py$, $py$results = []
best_depth, best_val_acc = manual_grid_search()
results.append(("best_depth == 3", best_depth == 3))
results.append(("best_val_acc close to expected", abs(best_val_acc - 0.9433962264150944) < 0.02))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000112', 2, 'Your first GridSearchCV', 'easy', 'Write `grid_search_basic()`. Generate `make_classification(n_samples=300, n_features=10, random_state=42)`, split with `train_test_split(X, y, test_size=0.3, random_state=42)`. Build a `GridSearchCV(DecisionTreeClassifier(random_state=42), param_grid={''max_depth'': [1, 2, 3, 5, None]}, cv=5)`, fit it on the training data, and return `(grid.best_params_, grid.best_score_)`.', 'GridSearchCV.fit does the cross-validation for you -- no manual loop needed here.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.tree import DecisionTreeClassifier

def grid_search_basic():
    X, y = make_classification(n_samples=300, n_features=10, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    # TODO: build a GridSearchCV over {'max_depth': [1, 2, 3, 5, None]}, cv=5, fit it,
    # return (grid.best_params_, grid.best_score_)
    pass
$py$, $py$results = []
best_params, best_score = grid_search_basic()
results.append(("best_params has max_depth key", 'max_depth' in best_params))
results.append(("best_params['max_depth'] == 1", best_params['max_depth'] == 1))
results.append(("best_score close to expected", abs(best_score - 0.9190476190476191) < 0.03))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000112', 3, 'Searching over two hyperparameters at once', 'medium', 'Write `two_param_grid_search()`. Using the same dataset/split as before (`make_classification(n_samples=300, n_features=10, random_state=42)`, `train_test_split(X, y, test_size=0.3, random_state=42)`), build a `GridSearchCV(DecisionTreeClassifier(random_state=42), param_grid={''max_depth'': [1, 2, 3, 5, None], ''min_samples_leaf'': [1, 5, 10]}, cv=5)`, fit it, and return `(n_combinations, best_params, best_score)` where `n_combinations` is `len(grid.cv_results_[''params''])`.', 'With 5 values for max_depth and 3 for min_samples_leaf, the grid tries every combination -- that''s 5 * 3.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.tree import DecisionTreeClassifier

def two_param_grid_search():
    X, y = make_classification(n_samples=300, n_features=10, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    param_grid = {'max_depth': [1, 2, 3, 5, None], 'min_samples_leaf': [1, 5, 10]}
    # TODO: build the GridSearchCV, fit it, return (n_combinations, best_params, best_score)
    pass
$py$, $py$results = []
n_combinations, best_params, best_score = two_param_grid_search()
results.append(("n_combinations == 15", n_combinations == 15))
results.append(("best_params matches expected", best_params == {'max_depth': 3, 'min_samples_leaf': 5}))
results.append(("best_score close to expected", abs(best_score - 0.9380952380952381) < 0.02))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000112', 4, 'Tuned model vs default model', 'medium', 'Write `tuned_vs_default()`. Using `make_classification(n_samples=300, n_features=10, random_state=42)` split with `train_test_split(X, y, test_size=0.3, random_state=42)`: fit a plain `DecisionTreeClassifier(random_state=42)` (no tuning) and separately run a `GridSearchCV(DecisionTreeClassifier(random_state=42), {''min_samples_leaf'': [1, 2, 5, 10, 20]}, cv=5)`. Return `(default_test_acc, tuned_test_acc)`, the test-set accuracy of each.', 'Fit the default model directly on X_train/y_train; fit the GridSearchCV the same way, then use grid.best_estimator_ (or grid itself) to predict on X_test.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score

def tuned_vs_default():
    X, y = make_classification(n_samples=300, n_features=10, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    # TODO: fit a default DecisionTreeClassifier(random_state=42) and a tuned one via GridSearchCV
    # over {'min_samples_leaf': [1, 2, 5, 10, 20]}, cv=5; return their test accuracies
    pass
$py$, $py$results = []
default_acc, tuned_acc = tuned_vs_default()
results.append(("default_acc close to expected", abs(default_acc - 0.9333333333333333) < 0.03))
results.append(("tuned_acc close to expected", abs(tuned_acc - 0.9444444444444444) < 0.03))
results.append(("tuning did not hurt accuracy", tuned_acc >= default_acc - 0.02))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000112', 5, 'Tuning an SVM''s C and gamma', 'medium', 'Write `tune_svc()`. Using `make_classification(n_samples=300, n_features=10, random_state=42)` split with `train_test_split(X, y, test_size=0.3, random_state=42)`, run `GridSearchCV(SVC(random_state=42), {''C'': [0.1, 1, 10], ''gamma'': [0.01, 0.1, 1]}, cv=5)`, fit it, and return `(grid.best_params_, grid.best_score_)`.', 'SVC accepts random_state even though it only affects the probability estimates -- passing it keeps behavior fully reproducible.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.svm import SVC

def tune_svc():
    X, y = make_classification(n_samples=300, n_features=10, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    # TODO: GridSearchCV over {'C': [0.1, 1, 10], 'gamma': [0.01, 0.1, 1]}, cv=5
    pass
$py$, $py$results = []
best_params, best_score = tune_svc()
results.append(("best_params matches expected", best_params == {'C': 1, 'gamma': 0.01}))
results.append(("best_score close to expected", abs(best_score - 0.9333333333333333) < 0.03))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000112', 6, 'Keeping the test set untouched during search', 'hard', 'Write `search_then_final_eval()`. Using `make_classification(n_samples=300, n_features=10, random_state=42)` split with `train_test_split(X, y, test_size=0.3, random_state=42)`, run `GridSearchCV(DecisionTreeClassifier(random_state=42), {''max_depth'': [1, 2, 3, 5, None], ''min_samples_leaf'': [1, 5, 10]}, cv=5)`, fitting it on the training data ONLY. Then evaluate the fitted `grid` on the held-out test set. Return `(grid.best_score_, test_acc)` -- the cross-validated score from tuning, and the true generalization accuracy on data the search never saw.', 'Call grid.fit(X_train, y_train) -- never pass X_test/y_test into fit or GridSearchCV''s constructor. Use grid.score(X_test, y_test) or grid.predict for the final number.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.tree import DecisionTreeClassifier

def search_then_final_eval():
    X, y = make_classification(n_samples=300, n_features=10, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    param_grid = {'max_depth': [1, 2, 3, 5, None], 'min_samples_leaf': [1, 5, 10]}
    # TODO: fit GridSearchCV on the TRAIN split only, then evaluate on the TEST split
    # return (grid.best_score_, test_acc)
    pass
$py$, $py$results = []
best_score, test_acc = search_then_final_eval()
results.append(("best_score close to expected", abs(best_score - 0.9380952380952381) < 0.02))
results.append(("test_acc close to expected", abs(test_acc - 0.9444444444444444) < 0.03))
results.append(("test_acc and best_score are both valid accuracies", 0.0 <= best_score <= 1.0 and 0.0 <= test_acc <= 1.0))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000112', 7, 'RandomizedSearchCV for a bigger search space', 'easy', 'Write `random_search()`. Using `make_classification(n_samples=300, n_features=10, random_state=42)` split with `train_test_split(X, y, test_size=0.3, random_state=42)`, run `RandomizedSearchCV(DecisionTreeClassifier(random_state=42), {''max_depth'': randint(1, 10), ''min_samples_leaf'': randint(1, 20)}, n_iter=10, cv=5, random_state=42)` (import `randint` from `scipy.stats`), fit it, and return `(grid.best_params_, grid.best_score_)`. Unlike GridSearchCV, it samples `n_iter` random combinations instead of trying every single one -- useful when the grid is too big to search exhaustively.', 'RandomizedSearchCV needs its own random_state to make which combinations get sampled reproducible, separate from the model''s random_state.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split, RandomizedSearchCV
from sklearn.tree import DecisionTreeClassifier
from scipy.stats import randint

def random_search():
    X, y = make_classification(n_samples=300, n_features=10, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    param_dist = {'max_depth': randint(1, 10), 'min_samples_leaf': randint(1, 20)}
    # TODO: build a RandomizedSearchCV(n_iter=10, cv=5, random_state=42), fit it,
    # return (search.best_params_, search.best_score_)
    pass
$py$, $py$results = []
best_params, best_score = random_search()
results.append(("best_params has both keys", set(best_params.keys()) == {'max_depth', 'min_samples_leaf'}))
results.append(("best_params matches expected", best_params == {'max_depth': 8, 'min_samples_leaf': 7}))
results.append(("best_score close to expected", abs(best_score - 0.9380952380952381) < 0.03))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000112', 8, 'What grid.predict() actually calls', 'medium', 'Write `check_refit()`. Using `make_classification(n_samples=300, n_features=10, random_state=42)` split with `train_test_split(X, y, test_size=0.3, random_state=42)`, fit `GridSearchCV(DecisionTreeClassifier(random_state=42), {''max_depth'': [1, 2, 3, 5, None]}, cv=5)` (its default `refit=True` automatically refits the best combination on the *entire* training set once the search is done). Return a bool: whether `grid.predict(X_test)` produces the exact same predictions as calling `.predict(X_test)` directly on `grid.best_estimator_`.', 'Compare the two prediction arrays elementwise with (a == b).all() -- they should be identical since grid.predict just delegates to best_estimator_ when refit=True.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.tree import DecisionTreeClassifier

def check_refit():
    X, y = make_classification(n_samples=300, n_features=10, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    grid = GridSearchCV(DecisionTreeClassifier(random_state=42), {'max_depth': [1, 2, 3, 5, None]}, cv=5)
    grid.fit(X_train, y_train)
    # TODO: compare grid.predict(X_test) to grid.best_estimator_.predict(X_test)
    pass
$py$, $py$results = []
same = check_refit()
results.append(("returns a bool", isinstance(same, bool)))
results.append(("predictions match", same is True))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000112', 9, 'Reimplementing grid search from scratch', 'hard', 'Write `manual_reimplementation()`. Using `make_classification(n_samples=300, n_features=10, random_state=42)` split with `train_test_split(X, y, test_size=0.3, random_state=42)`, loop over every combination of `depths = [1, 2, 3, 5, None]` and `leaves = [1, 5, 10]` (use `itertools.product`). For each combination, run `cross_val_score(DecisionTreeClassifier(max_depth=depth, min_samples_leaf=leaf, random_state=42), X_train, y_train, cv=5)` and average the 5 scores. Return `(best_params, best_score)` where `best_params` is a tuple `(depth, leaf)`. This is what `GridSearchCV` does internally -- confirm your manual version lands on the same combination it found in an earlier exercise.', 'itertools.product(depths, leaves) gives every (depth, leaf) pair; cross_val_score returns an array of 5 scores, so call .mean() on it.', $py$import itertools
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.tree import DecisionTreeClassifier

def manual_reimplementation():
    X, y = make_classification(n_samples=300, n_features=10, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    depths = [1, 2, 3, 5, None]
    leaves = [1, 5, 10]
    best_params, best_score = None, -1
    # TODO: loop over itertools.product(depths, leaves), run cross_val_score for each,
    # keep the (depth, leaf) pair with the highest mean score
    return best_params, best_score
$py$, $py$results = []
best_params, best_score = manual_reimplementation()
results.append(("best_params == (3, 5)", best_params == (3, 5)))
results.append(("best_score close to expected", abs(best_score - 0.9380952380952381) < 0.02))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000113', 1, 'Explained variance ratio', 'easy', 'Write `explained_variance()`. Generate `make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)`, standardize it with `StandardScaler().fit_transform(X)` (PCA is sensitive to feature scale, so always scale first), fit `PCA(n_components=2, random_state=42)` on the scaled data, and return `pca.explained_variance_ratio_` as a plain Python list of floats.', 'pca.explained_variance_ratio_ is a NumPy array -- wrap it with list(...) to convert.', $py$import numpy as np
from sklearn.datasets import make_classification
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

def explained_variance():
    X, y = make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)
    Xs = StandardScaler().fit_transform(X)
    # TODO: fit PCA(n_components=2, random_state=42) on Xs, return explained_variance_ratio_ as a list
    pass
$py$, $py$results = []
ratios = explained_variance()
expected = [0.41869223, 0.20194756]
results.append(("returns 2 ratios", len(ratios) == 2))
results.append(("ratios are in decreasing order", ratios[0] >= ratios[1]))
results.append(("ratios close to expected", all(abs(r - e) < 0.02 for r, e in zip(ratios, expected))))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000113', 2, 'How many components for 90% of the variance?', 'easy', 'Write `components_for_variance(threshold)`. Using the same standardized dataset as before (`make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)`, then `StandardScaler().fit_transform(X)`), fit `PCA(random_state=42)` with no `n_components` limit (keeps all 8). Compute the cumulative sum of `explained_variance_ratio_`, and return the smallest number of components whose cumulative variance is `>= threshold`.', 'np.cumsum(ratios) gives a running total; np.argmax(cum >= threshold) finds the first index where it crosses the threshold -- add 1 since components are counted from 1, not 0.', $py$import numpy as np
from sklearn.datasets import make_classification
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

def components_for_variance(threshold):
    X, y = make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)
    Xs = StandardScaler().fit_transform(X)
    pca = PCA(random_state=42)
    pca.fit(Xs)
    # TODO: find the smallest number of components whose cumulative explained variance >= threshold
    pass
$py$, $py$results = []
n90 = components_for_variance(0.9)
n50 = components_for_variance(0.5)
results.append(("90% threshold needs 5 components", n90 == 5))
results.append(("50% threshold needs fewer components than 90%", n50 < n90))
results.append(("50% threshold needs 2 components", n50 == 2))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000113', 3, 'Reconstruction error vs number of components', 'medium', 'Write `reconstruction_errors()`. Using the standardized dataset (`make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)` then `StandardScaler().fit_transform(X)`), for each `k` in `[1, 2, 3, 4]`: fit `PCA(n_components=k, random_state=42)`, transform then `inverse_transform` the data, and compute the mean squared error between the original scaled data and its reconstruction (`np.mean((Xs - recon) ** 2)`). Return the list of 4 errors, one per `k`.', 'More retained components means less information thrown away, so error should shrink (or at least not grow) as k increases.', $py$import numpy as np
from sklearn.datasets import make_classification
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

def reconstruction_errors():
    X, y = make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)
    Xs = StandardScaler().fit_transform(X)
    errors = []
    # TODO: for k in [1, 2, 3, 4], fit PCA(n_components=k), reconstruct, and append the MSE
    return errors
$py$, $py$results = []
errors = reconstruction_errors()
expected = [0.5813077717138797, 0.3793602095253398, 0.24111205942023684, 0.12656616371264523]
results.append(("returns 4 errors", len(errors) == 4))
results.append(("errors close to expected", all(abs(e - x) < 0.03 for e, x in zip(errors, expected))))
results.append(("errors are non-increasing", all(errors[i] >= errors[i+1] - 1e-9 for i in range(3))))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000113', 4, 'Components up to sign', 'medium', 'Write `first_component_magnitude()`. Using the standardized dataset (`make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)` then `StandardScaler().fit_transform(X)`), fit `PCA(n_components=2, random_state=42)` and return the *absolute value* of `pca.components_[0]` as a list of floats. A valid PCA implementation can flip the sign of an entire component (it''s still the same axis, just pointing the other way) -- taking the absolute value sidesteps that ambiguity.', 'np.abs(pca.components_[0]) removes the sign ambiguity; never compare raw component vectors with exact equality.', $py$import numpy as np
from sklearn.datasets import make_classification
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

def first_component_magnitude():
    X, y = make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)
    Xs = StandardScaler().fit_transform(X)
    pca = PCA(n_components=2, random_state=42)
    pca.fit(Xs)
    # TODO: return list(np.abs(pca.components_[0]))
    pass
$py$, $py$import numpy as np
results = []
mags = np.array(first_component_magnitude())
expected = np.abs(np.array([0.03314020, 0.33807924, 0.40983106, 0.01759519, 0.47008496,
                             0.47009688, 0.50895009, 0.12382211]))
results.append(("returns 8 values", len(mags) == 8))
results.append(("all values non-negative", (mags >= 0).all()))
results.append(("magnitudes close to expected (sign-invariant)", np.allclose(mags, expected, atol=0.05)))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000113', 5, 'PCA finds the direction of maximum variance', 'medium', 'Write `pc1_variance_vs_random()`. Using the standardized dataset (`make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)` then `StandardScaler().fit_transform(X)`), fit `PCA(n_components=1, random_state=42)` and compute the variance of the projected data (`pca.transform(Xs)[:, 0].var()`). Separately, project the same data onto a fixed random unit direction: `rng = np.random.RandomState(0); direction = rng.normal(size=Xs.shape[1]); direction = direction / np.linalg.norm(direction)`, then `Xs @ direction`, and compute its variance. Return `(pc1_variance, random_direction_variance)`.', 'The first principal component is defined as the direction that maximizes variance -- projecting onto anything else should give equal or lower variance.', $py$import numpy as np
from sklearn.datasets import make_classification
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

def pc1_variance_vs_random():
    X, y = make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)
    Xs = StandardScaler().fit_transform(X)
    pca = PCA(n_components=1, random_state=42)
    pca.fit(Xs)
    # TODO: compute pc1_variance from pca.transform(Xs), and random_direction_variance
    # by projecting Xs onto a random unit vector (seeded RandomState(0))
    pass
$py$, $py$results = []
pc1_var, rand_var = pc1_variance_vs_random()
results.append(("pc1_var close to expected", abs(pc1_var - 3.3495378262889615) < 0.05))
results.append(("rand_var close to expected", abs(rand_var - 0.9668403961654838) < 0.05))
results.append(("PC1 variance is at least as large as a random direction's", pc1_var >= rand_var))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000113', 6, 'Classifying on reduced features', 'medium', 'Write `accuracy_with_and_without_pca()`. Generate `make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)`, split with `train_test_split(X, y, test_size=0.3, random_state=42)`. Fit a `StandardScaler` on the training data and transform both splits. Fit a `LogisticRegression()` on the full 8 scaled features and record test accuracy. Then fit `PCA(n_components=2, random_state=42)` on the scaled training data, transform both splits, fit a fresh `LogisticRegression()` on the 2 PCA features, and record its test accuracy. Return `(full_acc, pca_acc)`.', 'Always fit the scaler and PCA on the training split only, then use .transform (not .fit_transform) on the test split, to avoid leaking test information.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score

def accuracy_with_and_without_pca():
    X, y = make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    scaler = StandardScaler().fit(X_train)
    Xtr_s, Xte_s = scaler.transform(X_train), scaler.transform(X_test)
    # TODO: fit LogisticRegression on Xtr_s/y_train, get full_acc on Xte_s/y_test
    # then fit PCA(n_components=2, random_state=42) on Xtr_s, transform both splits,
    # fit a fresh LogisticRegression on the 2D features, get pca_acc
    pass
$py$, $py$results = []
full_acc, pca_acc = accuracy_with_and_without_pca()
results.append(("full_acc close to expected", abs(full_acc - 0.8166666666666667) < 0.05))
results.append(("pca_acc close to expected", abs(pca_acc - 0.65) < 0.05))
results.append(("both accuracies are valid probabilities", 0.0 <= full_acc <= 1.0 and 0.0 <= pca_acc <= 1.0))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000113', 7, 'Why component order matters', 'hard', 'Write `variance_ratios_are_sorted()`. Using the standardized dataset (`make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)` then `StandardScaler().fit_transform(X)`), fit `PCA(random_state=42)` with all 8 components. Return a bool: whether `explained_variance_ratio_` is sorted in non-increasing order (each value >= the next). PCA always orders components this way -- the first component captures the most variance by construction.', 'Loop through consecutive pairs, or compare the array to np.sort(ratios)[::-1] with np.allclose.', $py$import numpy as np
from sklearn.datasets import make_classification
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

def variance_ratios_are_sorted():
    X, y = make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)
    Xs = StandardScaler().fit_transform(X)
    pca = PCA(random_state=42)
    pca.fit(Xs)
    ratios = pca.explained_variance_ratio_
    # TODO: return True if ratios is sorted in non-increasing order, else False
    pass
$py$, $py$results = []
sorted_ok = variance_ratios_are_sorted()
results.append(("returns a bool", isinstance(sorted_ok, bool)))
results.append(("ratios are non-increasing", sorted_ok is True))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000113', 8, 'Principal components are orthonormal', 'hard', 'Write `components_are_orthonormal()`. Using the standardized dataset (`make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)` then `StandardScaler().fit_transform(X)`), fit `PCA(n_components=2, random_state=42)`. Return a tuple `(norms_ok, orthogonal_ok)`: `norms_ok` is whether both rows of `pca.components_` have unit length (`np.linalg.norm` close to 1), and `orthogonal_ok` is whether the dot product between the two components is close to 0. Neither check depends on component sign, so this holds regardless of which sign convention the implementation picked.', 'np.linalg.norm(pca.components_[i]) for each row; pca.components_[0] @ pca.components_[1] for the dot product.', $py$import numpy as np
from sklearn.datasets import make_classification
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

def components_are_orthonormal():
    X, y = make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)
    Xs = StandardScaler().fit_transform(X)
    pca = PCA(n_components=2, random_state=42)
    pca.fit(Xs)
    # TODO: check both components have unit norm, and their dot product is close to 0
    pass
$py$, $py$results = []
norms_ok, orthogonal_ok = components_are_orthonormal()
results.append(("norms_ok is True", norms_ok is True))
results.append(("orthogonal_ok is True", orthogonal_ok is True))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000113', 9, 'PCA mostly preserves pairwise distance order', 'hard', 'Write `distance_rank_correlation()`. Using the standardized dataset (`make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)` then `StandardScaler().fit_transform(X)`), fit `PCA(n_components=5, random_state=42)` (keeping most of the variance) and transform the data. Take the first 30 rows. Compute the full pairwise Euclidean distance matrix in the original 8D space and in the 5D PCA space (`scipy.spatial.distance.pdist` on each), then return the Pearson correlation (`np.corrcoef`) between the two flattened distance arrays -- a value near 1 means PCA mostly preserved how far apart points are from each other.', 'pdist returns a 1D condensed distance array directly, ready to feed into np.corrcoef(a, b)[0, 1].', $py$import numpy as np
from scipy.spatial.distance import pdist
from sklearn.datasets import make_classification
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA

def distance_rank_correlation():
    X, y = make_classification(n_samples=200, n_features=8, n_informative=4, random_state=42)
    Xs = StandardScaler().fit_transform(X)
    pca = PCA(n_components=5, random_state=42)
    Z = pca.fit_transform(Xs)
    subset_orig = Xs[:30]
    subset_pca = Z[:30]
    # TODO: compute pdist distances for both subsets, return their correlation coefficient
    pass
$py$, $py$results = []
corr = distance_rank_correlation()
results.append(("returns a float", isinstance(corr, float)))
results.append(("correlation is high (PCA preserves structure)", corr > 0.85))
results.append(("correlation is at most 1", corr <= 1.0001))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000114', 1, 'Measuring class imbalance', 'easy', 'Write `class_balance()`. Generate `make_classification(n_samples=500, n_features=6, weights=[0.9, 0.1], random_state=42)`. Count how many rows belong to each class with `collections.Counter(y)`, and return `(count_majority, count_minority, imbalance_ratio)` where `imbalance_ratio` is `count_majority / count_minority`.', 'Counter(y) gives {0: n0, 1: n1} -- class 0 is the majority here since weights=[0.9, 0.1] means 90% of rows are labeled 0.', $py$from collections import Counter
from sklearn.datasets import make_classification

def class_balance():
    X, y = make_classification(n_samples=500, n_features=6, weights=[0.9, 0.1], random_state=42)
    # TODO: count each class with Counter(y), return (count_majority, count_minority, imbalance_ratio)
    pass
$py$, $py$results = []
count_majority, count_minority, ratio = class_balance()
results.append(("count_majority == 446", count_majority == 446))
results.append(("count_minority == 54", count_minority == 54))
results.append(("imbalance_ratio close to expected", abs(ratio - (446/54)) < 0.05))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000114', 2, 'The accuracy trap', 'easy', 'Write `accuracy_trap()`. Generate `make_classification(n_samples=500, n_features=6, weights=[0.9, 0.1], random_state=42)`, split with `train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)`. Fit a `DummyClassifier(strategy=''most_frequent'', random_state=42)` (it always predicts the majority class, ignoring the features entirely) and return `(accuracy, recall)` on the test set, using `recall_score` for the minority class (label `1`, the default `pos_label`).', 'A classifier that never predicts the minority class can still post a high accuracy on very imbalanced data -- that''s exactly why accuracy alone is misleading here.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.dummy import DummyClassifier
from sklearn.metrics import accuracy_score, recall_score

def accuracy_trap():
    X, y = make_classification(n_samples=500, n_features=6, weights=[0.9, 0.1], random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)
    # TODO: fit DummyClassifier(strategy='most_frequent', random_state=42), return (accuracy, recall)
    pass
$py$, $py$results = []
acc, rec = accuracy_trap()
results.append(("accuracy close to expected (looks good!)", abs(acc - 0.8933333333333333) < 0.03))
results.append(("recall is exactly 0 (never predicts the minority class)", abs(rec - 0.0) < 1e-9))
results.append(("accuracy is misleadingly high despite zero recall", acc > 0.8 and rec == 0.0))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000114', 3, 'Precision, recall, and F1 on imbalanced data', 'medium', 'Write `plain_model_metrics()`. Using the same dataset and stratified split as before (`make_classification(n_samples=500, n_features=6, weights=[0.9, 0.1], random_state=42)`, `train_test_split(..., test_size=0.3, random_state=42, stratify=y)`), fit a plain `LogisticRegression()` (no class weighting) and return `(precision, recall, f1)` on the test set for the minority class.', 'precision_score, recall_score, and f1_score all default to evaluating label 1 -- exactly the minority class here.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import precision_score, recall_score, f1_score

def plain_model_metrics():
    X, y = make_classification(n_samples=500, n_features=6, weights=[0.9, 0.1], random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)
    # TODO: fit LogisticRegression(), return (precision, recall, f1) on the test set
    pass
$py$, $py$results = []
precision, recall, f1 = plain_model_metrics()
results.append(("precision close to expected", abs(precision - 0.5454545454545454) < 0.1))
results.append(("recall close to expected", abs(recall - 0.375) < 0.1))
results.append(("f1 close to expected", abs(f1 - 0.4444444444444444) < 0.1))
results.append(("recall is well below 1.0 -- many minority cases missed", recall < 0.7))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000114', 4, 'class_weight=''balanced''', 'medium', 'Write `balanced_vs_plain_recall()`. Using the same dataset/split (`make_classification(n_samples=500, n_features=6, weights=[0.9, 0.1], random_state=42)`, stratified `train_test_split(..., test_size=0.3, random_state=42, stratify=y)`), fit a plain `LogisticRegression()` and a `LogisticRegression(class_weight=''balanced'')`. Return `(plain_recall, balanced_recall)` -- the minority-class recall of each. `class_weight=''balanced''` makes mistakes on the minority class cost more during training, without touching the actual data.', 'Both models train on the exact same X_train/y_train -- only the class_weight argument differs.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import recall_score

def balanced_vs_plain_recall():
    X, y = make_classification(n_samples=500, n_features=6, weights=[0.9, 0.1], random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)
    # TODO: fit LogisticRegression() and LogisticRegression(class_weight='balanced'),
    # return (plain_recall, balanced_recall)
    pass
$py$, $py$results = []
plain_recall, balanced_recall = balanced_vs_plain_recall()
results.append(("plain_recall close to expected", abs(plain_recall - 0.375) < 0.1))
results.append(("balanced_recall close to expected", abs(balanced_recall - 0.8125) < 0.1))
results.append(("class_weight='balanced' improves recall", balanced_recall > plain_recall))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000114', 5, 'Oversampling the minority class', 'medium', 'Write `oversample_recall()`. Using the same dataset/split as before, on the *training* data only: find `maj_idx = np.where(y_train == 0)[0]` and `min_idx = np.where(y_train == 1)[0]`, then use `sklearn.utils.resample(min_idx, replace=True, n_samples=len(maj_idx), random_state=42)` to draw extra minority rows with replacement until the classes are equal in size. Concatenate `maj_idx` with the upsampled minority indices, build the balanced training set, fit a plain `LogisticRegression()` on it, and return recall on the (untouched, still-imbalanced) test set.', 'Only the training set gets resampled -- never touch X_test/y_test, or you''d be evaluating on data the model has already seen duplicates of.', $py$import numpy as np
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.utils import resample
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import recall_score

def oversample_recall():
    X, y = make_classification(n_samples=500, n_features=6, weights=[0.9, 0.1], random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)
    maj_idx = np.where(y_train == 0)[0]
    min_idx = np.where(y_train == 1)[0]
    # TODO: upsample min_idx to len(maj_idx) with resample(..., replace=True, random_state=42),
    # build the balanced training set, fit LogisticRegression(), return recall on the test set
    pass
$py$, $py$results = []
recall = oversample_recall()
results.append(("recall close to expected", abs(recall - 0.8125) < 0.1))
results.append(("oversampling substantially beats the plain-model baseline recall (0.375)", recall > 0.6))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000114', 6, 'Undersampling the majority class', 'medium', 'Write `undersample_recall()`. Same setup as the oversampling exercise, but this time downsample the majority: `maj_idx_down = resample(maj_idx, replace=False, n_samples=len(min_idx), random_state=42)`. Concatenate it with the untouched `min_idx`, build the smaller balanced training set, fit a plain `LogisticRegression()`, and return recall on the test set.', 'Undersampling throws away majority rows instead of duplicating minority ones -- replace=False here, since you''re not creating copies, just picking a subset.', $py$import numpy as np
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.utils import resample
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import recall_score

def undersample_recall():
    X, y = make_classification(n_samples=500, n_features=6, weights=[0.9, 0.1], random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)
    maj_idx = np.where(y_train == 0)[0]
    min_idx = np.where(y_train == 1)[0]
    # TODO: downsample maj_idx to len(min_idx) with resample(..., replace=False, random_state=42),
    # build the balanced training set, fit LogisticRegression(), return recall on the test set
    pass
$py$, $py$results = []
recall = undersample_recall()
results.append(("recall close to expected", abs(recall - 0.8125) < 0.1))
results.append(("undersampling substantially beats the plain-model baseline recall (0.375)", recall > 0.6))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000114', 7, 'Why stratified splitting matters', 'medium', 'Write `stratified_ratios()`. Generate `make_classification(n_samples=500, n_features=6, weights=[0.9, 0.1], random_state=42)`. Split with `train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)`. Return `(overall_ratio, train_ratio, test_ratio)` -- the fraction of minority-class (`1`) rows in `y`, `y_train`, and `y_test` respectively (each is just `.mean()` since labels are 0/1).', 'With stratify=y, train_test_split guarantees each split''s class proportions closely match the full dataset''s -- without it, a small minority class could end up unevenly spread across the splits by chance.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split

def stratified_ratios():
    X, y = make_classification(n_samples=500, n_features=6, weights=[0.9, 0.1], random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)
    # TODO: return (overall_ratio, train_ratio, test_ratio) -- each the mean of the labels
    pass
$py$, $py$results = []
overall_ratio, train_ratio, test_ratio = stratified_ratios()
results.append(("overall_ratio close to expected", abs(overall_ratio - 0.108) < 0.01))
results.append(("train_ratio close to overall_ratio", abs(train_ratio - overall_ratio) < 0.03))
results.append(("test_ratio close to overall_ratio", abs(test_ratio - overall_ratio) < 0.03))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000114', 8, 'Trading precision for recall with the decision threshold', 'hard', 'Write `threshold_tradeoff()`. Using the same dataset/split, fit `LogisticRegression(class_weight=''balanced'')` on the training data. Get predicted probabilities with `model.predict_proba(X_test)[:, 1]`. Compute predictions at two thresholds: the default `0.5` (`proba >= 0.5`) and a lower `0.3` (`proba >= 0.3`). Return `(precision_at_50, recall_at_50, precision_at_30, recall_at_30)`. Lowering the threshold means the model flags something as the minority class more readily -- recall should go up, precision should go down.', '(proba >= threshold).astype(int) turns probabilities into 0/1 predictions at any threshold you choose.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import precision_score, recall_score

def threshold_tradeoff():
    X, y = make_classification(n_samples=500, n_features=6, weights=[0.9, 0.1], random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)
    model = LogisticRegression(class_weight='balanced').fit(X_train, y_train)
    proba = model.predict_proba(X_test)[:, 1]
    # TODO: compute predictions at threshold 0.5 and 0.3, return the 4 precision/recall values
    pass
$py$, $py$results = []
p50, r50, p30, r30 = threshold_tradeoff()
results.append(("precision_at_50 close to expected", abs(p50 - 0.35135135135135137) < 0.08))
results.append(("recall_at_50 close to expected", abs(r50 - 0.8125) < 0.08))
results.append(("precision_at_30 close to expected", abs(p30 - 0.26) < 0.08))
results.append(("recall_at_30 close to expected", abs(r30 - 0.8125) < 0.08))
results.append(("lowering the threshold does not decrease recall", r30 >= r50 - 1e-9))
results.append(("lowering the threshold does not increase precision", p30 <= p50 + 1e-9))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000114', 9, 'Comparing every strategy at once', 'hard', 'Write `compare_strategies()`. Using the same dataset/split, evaluate three approaches'' recall on the minority class: (a) a plain `LogisticRegression()`, (b) `LogisticRegression(class_weight=''balanced'')`, (c) `roc_auc_score` of the balanced model''s predicted probabilities (`model.predict_proba(X_test)[:, 1]`), which summarizes ranking quality across every possible threshold at once. Return a dict `{''plain_recall'': ..., ''balanced_recall'': ..., ''balanced_auc'': ...}`.', 'roc_auc_score needs probabilities (predict_proba(...)[:, 1]), not hard predictions -- unlike precision/recall/f1 which need predict()''s 0/1 output.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import recall_score, roc_auc_score

def compare_strategies():
    X, y = make_classification(n_samples=500, n_features=6, weights=[0.9, 0.1], random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)
    # TODO: fit plain and balanced LogisticRegression models, compute their recalls
    # and the balanced model's ROC-AUC, return the results dict
    pass
$py$, $py$results = []
d = compare_strategies()
results.append(("has all three keys", set(d.keys()) == {'plain_recall', 'balanced_recall', 'balanced_auc'}))
results.append(("plain_recall close to expected", abs(d['plain_recall'] - 0.375) < 0.1))
results.append(("balanced_recall close to expected", abs(d['balanced_recall'] - 0.8125) < 0.1))
results.append(("balanced_auc close to expected", abs(d['balanced_auc'] - 0.8194962686567164) < 0.05))
results.append(("balanced_auc well above chance level (0.5)", d['balanced_auc'] > 0.7))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000115', 1, 'Your first Pipeline', 'easy', 'Write `basic_pipeline_score()`. Generate `make_classification(n_samples=300, n_features=8, random_state=42)`, split with `train_test_split(X, y, test_size=0.3, random_state=42)`. Build `Pipeline([(''scaler'', StandardScaler()), (''model'', LogisticRegression())])`, fit it on the training data with a single `.fit()` call, and return its `.score()` on the test set.', 'pipeline.fit(X_train, y_train) runs .fit_transform on the scaler then .fit on the model in one call -- no need to call them separately.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression

def basic_pipeline_score():
    X, y = make_classification(n_samples=300, n_features=8, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    # TODO: build Pipeline([('scaler', StandardScaler()), ('model', LogisticRegression())]),
    # fit it, return its test score
    pass
$py$, $py$results = []
score = basic_pipeline_score()
results.append(("score in [0,1]", 0.0 <= score <= 1.0))
results.append(("score close to expected", abs(score - 0.9777777777777777) < 0.03))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000115', 2, 'Inspecting a fitted pipeline''s steps', 'easy', 'Write `inspect_scaler_mean()`. Using the same dataset/split/pipeline as before, fit the pipeline, then reach into it with `pipe.named_steps[''scaler'']` to get the fitted `StandardScaler`, and return its `.mean_[0]` (the mean it computed for the first feature from the training data).', 'named_steps is a dict keyed by the names you gave each step when building the Pipeline -- pipe.named_steps[''scaler''] is the actual fitted StandardScaler object, not a copy.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression

def inspect_scaler_mean():
    X, y = make_classification(n_samples=300, n_features=8, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    pipe = Pipeline([('scaler', StandardScaler()), ('model', LogisticRegression())])
    pipe.fit(X_train, y_train)
    # TODO: return pipe.named_steps['scaler'].mean_[0]
    pass
$py$, $py$results = []
mean0 = inspect_scaler_mean()
results.append(("returns a float", isinstance(mean0, float)))
results.append(("mean close to expected", abs(mean0 - 0.024876778385474512) < 0.02))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000115', 3, 'Tuning a hyperparameter inside a Pipeline', 'medium', 'Write `tune_pipeline_C()`. Using the same dataset/split/pipeline, run `GridSearchCV(pipe, param_grid={''model__C'': [0.01, 0.1, 1, 10]}, cv=5)`, fit it on the training data, and return `(grid.best_params_, grid.best_score_)`. The `''model__C''` key means ''the `C` parameter of the step named `model`'' -- that double-underscore naming is how GridSearchCV reaches inside a Pipeline''s steps.', 'Build the param_grid key as ''<step_name>__<param_name>'' -- here that''s ''model__C'', matching the name you gave the LogisticRegression step in the Pipeline.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression

def tune_pipeline_C():
    X, y = make_classification(n_samples=300, n_features=8, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    pipe = Pipeline([('scaler', StandardScaler()), ('model', LogisticRegression())])
    # TODO: GridSearchCV(pipe, {'model__C': [0.01, 0.1, 1, 10]}, cv=5), fit it,
    # return (grid.best_params_, grid.best_score_)
    pass
$py$, $py$results = []
best_params, best_score = tune_pipeline_C()
results.append(("best_params has model__C", 'model__C' in best_params))
results.append(("best_params['model__C'] close to expected", abs(best_params['model__C'] - 0.01) < 1e-9))
results.append(("best_score close to expected", abs(best_score - 0.9095238095238095) < 0.03))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000115', 4, 'Filling in missing values inside a Pipeline', 'medium', 'Write `pipeline_with_imputer()`. Generate `make_classification(n_samples=300, n_features=6, random_state=42)`. Simulate missing data: with `rng = np.random.RandomState(42)`, build `mask = rng.random(X.shape) < 0.1` and set `X[mask] = np.nan`. Split with `train_test_split(X, y, test_size=0.3, random_state=42)`. Build `Pipeline([(''imputer'', SimpleImputer(strategy=''mean'')), (''scaler'', StandardScaler()), (''model'', LogisticRegression())])`, fit it, and return its test score. Without the imputer step, `.fit()` would raise on the NaNs -- scikit-learn models don''t handle missing values on their own.', 'Copy X before writing NaNs into it if you generated it in-place elsewhere -- here it''s the only copy so that''s not a concern, just make sure the mask is applied before the split.', $py$import numpy as np
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression

def pipeline_with_imputer():
    X, y = make_classification(n_samples=300, n_features=6, random_state=42)
    rng = np.random.RandomState(42)
    mask = rng.random(X.shape) < 0.1
    X[mask] = np.nan
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    # TODO: build the 3-step Pipeline (imputer, scaler, model), fit it, return its test score
    pass
$py$, $py$results = []
score = pipeline_with_imputer()
results.append(("score in [0,1]", 0.0 <= score <= 1.0))
results.append(("score close to expected", abs(score - 0.9222222222222223) < 0.05))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000115', 5, 'ColumnTransformer: mixing numeric and categorical columns', 'medium', 'Write `mixed_column_pipeline()`. Build a DataFrame with `rng = np.random.RandomState(42)`, `n = 300`: `age = rng.normal(40, 10, n)`, `income = rng.normal(50000, 15000, n)`, `city = rng.choice([''NYC'', ''LA'', ''Chicago''], size=n)`, assembled into `df = pd.DataFrame({''age'': age, ''income'': income, ''city'': city})`. Build labels with `y = ((df[''age''] > 40) & (df[''city''] == ''NYC'')).astype(int).values`, then flip 10% of them: `flip = rng.random(n) < 0.1; y = np.where(flip, 1 - y, y)`. Split with `train_test_split(df, y, test_size=0.3, random_state=42)`. Build a `ColumnTransformer([(''num'', StandardScaler(), [''age'', ''income'']), (''cat'', OneHotEncoder(handle_unknown=''ignore''), [''city''])])`, wrap it in a Pipeline with a `LogisticRegression()`, fit it, and return the test score.', 'ColumnTransformer takes a list of (name, transformer, columns) tuples -- each transformer only ever sees the columns listed for it.', $py$import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.linear_model import LogisticRegression

def mixed_column_pipeline():
    rng = np.random.RandomState(42)
    n = 300
    df = pd.DataFrame({
        'age': rng.normal(40, 10, n),
        'income': rng.normal(50000, 15000, n),
        'city': rng.choice(['NYC', 'LA', 'Chicago'], size=n),
    })
    y = ((df['age'] > 40) & (df['city'] == 'NYC')).astype(int).values
    flip = rng.random(n) < 0.1
    y = np.where(flip, 1 - y, y)
    X_train, X_test, y_train, y_test = train_test_split(df, y, test_size=0.3, random_state=42)
    # TODO: build a ColumnTransformer for ['age', 'income'] (StandardScaler) and
    # ['city'] (OneHotEncoder(handle_unknown='ignore')), wrap in a Pipeline with
    # LogisticRegression(), fit, return test score
    pass
$py$, $py$results = []
score = mixed_column_pipeline()
results.append(("score in [0,1]", 0.0 <= score <= 1.0))
results.append(("score close to expected", abs(score - 0.8777777777777778) < 0.05))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000115', 6, 'Cross-validating a whole Pipeline', 'medium', 'Write `pipeline_cross_val()`. Generate `make_classification(n_samples=300, n_features=8, random_state=42)`. Build `Pipeline([(''scaler'', StandardScaler()), (''model'', LogisticRegression())])` and pass the *whole pipeline* (not just the model) to `cross_val_score(pipe, X, y, cv=5)`. Return `(mean_score, std_score)`. Passing the pipeline means the scaler is re-fit fresh inside each fold, on only that fold''s training rows -- fitting the scaler once on the full `X` beforehand would leak each fold''s held-out rows into its own preprocessing statistics.', 'cross_val_score can take any estimator, including a Pipeline -- it calls .fit() on a clone of it for every fold.', $py$from sklearn.datasets import make_classification
from sklearn.model_selection import cross_val_score
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression

def pipeline_cross_val():
    X, y = make_classification(n_samples=300, n_features=8, random_state=42)
    pipe = Pipeline([('scaler', StandardScaler()), ('model', LogisticRegression())])
    # TODO: cross_val_score(pipe, X, y, cv=5), return (mean_score, std_score)
    pass
$py$, $py$results = []
mean_score, std_score = pipeline_cross_val()
results.append(("mean_score in [0,1]", 0.0 <= mean_score <= 1.0))
results.append(("std_score non-negative", std_score >= 0))
results.append(("mean_score close to expected", abs(mean_score - 0.9233333333333332) < 0.03))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000115', 7, 'A custom step with FunctionTransformer', 'hard', 'Write `pipeline_matches_manual_steps()`. Generate `make_classification(n_samples=300, n_features=6, random_state=42)`, then make every value positive with `X = np.abs(X) + 1` (needed since the next step takes a log). Split with `train_test_split(X, y, test_size=0.3, random_state=42)`. Build `Pipeline([(''log'', FunctionTransformer(np.log1p)), (''scaler'', StandardScaler()), (''model'', LogisticRegression())])`, fit it, and get `pipe.predict(X_test)`. Separately, manually replicate the same three steps in order on the same data (log1p, then a *separately fit* StandardScaler, then a *separately fit* LogisticRegression) and get its predictions. Return `True` if the two prediction arrays are exactly equal, `False` otherwise.', 'FunctionTransformer(np.log1p) has no fitted state, so it behaves identically whether it''s inside the pipeline or called directly -- the scaler and model still each need their own separate .fit() call in the manual version.', $py$import numpy as np
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler, FunctionTransformer
from sklearn.linear_model import LogisticRegression

def pipeline_matches_manual_steps():
    X, y = make_classification(n_samples=300, n_features=6, random_state=42)
    X = np.abs(X) + 1
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    pipe = Pipeline([
        ('log', FunctionTransformer(np.log1p)),
        ('scaler', StandardScaler()),
        ('model', LogisticRegression()),
    ])
    pipe.fit(X_train, y_train)
    pipe_preds = pipe.predict(X_test)
    # TODO: manually replicate the log -> scale -> model steps (fitting scaler and
    # model on the training data), predict on X_test, and compare to pipe_preds
    pass
$py$, $py$results = []
same = pipeline_matches_manual_steps()
results.append(("returns a bool", isinstance(same, bool)))
results.append(("pipeline matches manual replication exactly", same is True))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000115', 8, 'Tuning a full ColumnTransformer pipeline', 'hard', 'Write `tune_mixed_pipeline()`. Build the same DataFrame/labels/split as the `ColumnTransformer` exercise above (same `rng = np.random.RandomState(42)`, `n = 300`, `age`/`income`/`city` columns, label construction with the 10% flip, `train_test_split(df, y, test_size=0.3, random_state=42)`). Build the same `ColumnTransformer` + `Pipeline` with `LogisticRegression()`. Wrap it in `GridSearchCV(pipe, {''model__C'': [0.01, 0.1, 1, 10]}, cv=5)`, fit it on the training data, and return `(grid.best_params_[''model__C''], grid.score(X_test, y_test))`.', 'The ''model__C'' key still works the same way even though ''model'' is now the second step of a Pipeline whose first step is a ColumnTransformer, not a plain scaler.', $py$import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.linear_model import LogisticRegression

def tune_mixed_pipeline():
    rng = np.random.RandomState(42)
    n = 300
    df = pd.DataFrame({
        'age': rng.normal(40, 10, n),
        'income': rng.normal(50000, 15000, n),
        'city': rng.choice(['NYC', 'LA', 'Chicago'], size=n),
    })
    y = ((df['age'] > 40) & (df['city'] == 'NYC')).astype(int).values
    flip = rng.random(n) < 0.1
    y = np.where(flip, 1 - y, y)
    X_train, X_test, y_train, y_test = train_test_split(df, y, test_size=0.3, random_state=42)
    # TODO: build the ColumnTransformer + Pipeline, wrap in GridSearchCV over
    # {'model__C': [0.01, 0.1, 1, 10]}, cv=5; fit it; return
    # (grid.best_params_['model__C'], grid.score(X_test, y_test))
    pass
$py$, $py$results = []
best_c, test_score = tune_mixed_pipeline()
results.append(("best_c close to expected", abs(best_c - 10) < 1e-9))
results.append(("test_score close to expected", abs(test_score - 0.8555555555555555) < 0.05))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000115', 9, 'Cross-validation, one fold at a time', 'hard', 'Write `manual_cv_matches_helper()`. Generate `make_classification(n_samples=300, n_features=8, random_state=42)`. Build `Pipeline([(''scaler'', StandardScaler()), (''model'', LogisticRegression())])`. Using `KFold(n_splits=5, shuffle=True, random_state=42)`, manually loop over `kf.split(X)`: for each `(train_idx, test_idx)`, clone a fresh pipeline with `sklearn.base.clone(pipe)`, fit it on `X[train_idx], y[train_idx]`, score it on `X[test_idx], y[test_idx]`, and collect the 5 scores. Separately call `cross_val_score(pipe, X, y, cv=KFold(n_splits=5, shuffle=True, random_state=42))`. Return `True` if your manual scores match `cross_val_score`''s scores elementwise within `1e-9`, else `False`.', 'clone(pipe) makes an unfitted copy with the same parameters, so each fold starts from a clean, unfit pipeline exactly like cross_val_score does internally.', $py$import numpy as np
from sklearn.base import clone
from sklearn.datasets import make_classification
from sklearn.model_selection import KFold, cross_val_score
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression

def manual_cv_matches_helper():
    X, y = make_classification(n_samples=300, n_features=8, random_state=42)
    pipe = Pipeline([('scaler', StandardScaler()), ('model', LogisticRegression())])
    kf = KFold(n_splits=5, shuffle=True, random_state=42)
    manual_scores = []
    # TODO: loop over kf.split(X), clone(pipe), fit on the train fold, score on the test fold,
    # append to manual_scores. Then compare to cross_val_score(pipe, X, y, cv=KFold(...))
    pass
$py$, $py$results = []
matches = manual_cv_matches_helper()
results.append(("returns a bool", isinstance(matches, bool)))
results.append(("manual per-fold scores match cross_val_score exactly", matches is True))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000116', 1, 'Pickling a fitted model to bytes', 'easy', 'Write `pickle_round_trip()`. Generate `make_classification(n_samples=200, n_features=6, random_state=42)`, split with `train_test_split(X, y, test_size=0.3, random_state=42)`, fit a `DecisionTreeClassifier(max_depth=4, random_state=42)`. Serialize it in memory with `pickle.dumps(model)` (never write to an actual file -- a browser session doesn''t reliably have a real filesystem, so this exercise works purely with `bytes`), then deserialize with `pickle.loads(blob)`. Return `True` if the reloaded model''s predictions on `X_test` are identical to the original model''s, `False` otherwise.', 'pickle.dumps(obj) returns bytes; pickle.loads(data) reconstructs the object from those bytes -- no file path involved either way.', $py$import pickle
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier

def pickle_round_trip():
    X, y = make_classification(n_samples=200, n_features=6, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    model = DecisionTreeClassifier(max_depth=4, random_state=42).fit(X_train, y_train)
    # TODO: pickle.dumps(model), pickle.loads(...) it back, compare predictions on X_test
    pass
$py$, $py$results = []
same = pickle_round_trip()
results.append(("returns a bool", isinstance(same, bool)))
results.append(("reloaded model predicts identically", same is True))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000116', 2, 'What pickle.dumps actually returns', 'easy', 'Write `inspect_pickle_bytes()`. Fit a `DecisionTreeClassifier(max_depth=4, random_state=42)` on `make_classification(n_samples=200, n_features=6, random_state=42)` (no split needed here). Call `pickle.dumps(model)` and return `(is_bytes, length)` -- whether the result is an instance of `bytes`, and its length.', 'isinstance(blob, bytes) checks the type; len(blob) gives its byte length -- both work the same on any pickled object.', $py$import pickle
from sklearn.datasets import make_classification
from sklearn.tree import DecisionTreeClassifier

def inspect_pickle_bytes():
    X, y = make_classification(n_samples=200, n_features=6, random_state=42)
    model = DecisionTreeClassifier(max_depth=4, random_state=42).fit(X, y)
    # TODO: pickle.dumps(model), return (isinstance(blob, bytes), len(blob))
    pass
$py$, $py$results = []
is_bytes, length = inspect_pickle_bytes()
results.append(("is_bytes is True", is_bytes is True))
results.append(("length is a positive int", isinstance(length, int) and length > 0))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000116', 3, 'Pickling an entire Pipeline', 'medium', 'Write `pickle_pipeline()`. Generate `make_classification(n_samples=200, n_features=6, random_state=42)`, split with `train_test_split(X, y, test_size=0.3, random_state=42)`. Build and fit `Pipeline([(''scaler'', StandardScaler()), (''model'', LogisticRegression())])`. Pickle the *whole pipeline* (preprocessing steps and all) with `pickle.dumps`, then reload it. Return `(score_before, score_after)` -- the `.score()` on `X_test`/`y_test` of the original pipeline and of the reloaded one.', 'Pickling a Pipeline pickles every fitted step inside it, including the scaler''s learned mean/std -- you don''t need to pickle each step separately.', $py$import pickle
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression

def pickle_pipeline():
    X, y = make_classification(n_samples=200, n_features=6, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    pipe = Pipeline([('scaler', StandardScaler()), ('model', LogisticRegression())])
    pipe.fit(X_train, y_train)
    # TODO: pickle pipe, reload it, return (score_before, score_after)
    pass
$py$, $py$results = []
score_before, score_after = pickle_pipeline()
results.append(("score_before close to expected", abs(score_before - 0.7833333333333333) < 0.05))
results.append(("score_after matches score_before", abs(score_before - score_after) < 1e-9))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000116', 4, 'Fitted parameters survive pickling', 'medium', 'Write `coefficients_preserved()`. Using the same dataset/split/pipeline as before, fit it, pickle it, and reload it. Return `True` if `reloaded.named_steps[''model''].coef_` matches the original pipeline''s `named_steps[''model''].coef_` elementwise (use `np.allclose`), `False` otherwise. This is what makes pickling useful: it''s not just the *class* that gets saved, it''s every number the model learned during `.fit()`.', 'np.allclose(a, b) compares arrays with a small numerical tolerance -- always prefer it over == for floating-point arrays.', $py$import pickle
import numpy as np
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression

def coefficients_preserved():
    X, y = make_classification(n_samples=200, n_features=6, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    pipe = Pipeline([('scaler', StandardScaler()), ('model', LogisticRegression())])
    pipe.fit(X_train, y_train)
    # TODO: pickle pipe, reload it, compare coef_ arrays with np.allclose
    pass
$py$, $py$results = []
same = coefficients_preserved()
results.append(("returns a bool", isinstance(same, bool)))
results.append(("coefficients preserved exactly", same is True))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000116', 5, 'Saving a model bundle with metadata', 'medium', 'Write `save_model_bundle()`. Fit a `DecisionTreeClassifier(max_depth=4, random_state=42)` on `make_classification(n_samples=200, n_features=6, random_state=42)`. In real projects you rarely pickle just the bare model -- you bundle it with metadata needed to use it correctly later. Build `bundle = {''model'': model, ''n_features'': X.shape[1], ''feature_names'': [f''f{i}'' for i in range(X.shape[1])]}`, pickle the whole dict, reload it, and return `(reloaded_bundle[''n_features''], reloaded_bundle[''feature_names''], type(reloaded_bundle[''model'']).__name__)`.', 'pickle works on any picklable Python object, including a dict that mixes a fitted estimator with plain ints, strings, and lists.', $py$import pickle
from sklearn.datasets import make_classification
from sklearn.tree import DecisionTreeClassifier

def save_model_bundle():
    X, y = make_classification(n_samples=200, n_features=6, random_state=42)
    model = DecisionTreeClassifier(max_depth=4, random_state=42).fit(X, y)
    bundle = {
        'model': model,
        'n_features': X.shape[1],
        'feature_names': [f'f{i}' for i in range(X.shape[1])],
    }
    # TODO: pickle bundle, reload it, return (n_features, feature_names, model class name)
    pass
$py$, $py$results = []
n_features, feature_names, model_class = save_model_bundle()
results.append(("n_features == 6", n_features == 6))
results.append(("feature_names has 6 entries", len(feature_names) == 6))
results.append(("feature_names[0] == 'f0'", feature_names[0] == 'f0'))
results.append(("model_class == 'DecisionTreeClassifier'", model_class == 'DecisionTreeClassifier'))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000116', 6, 'Saving only the winner of a search', 'medium', 'Write `pickle_best_estimator()`. Generate `make_classification(n_samples=200, n_features=6, random_state=42)`, split with `train_test_split(X, y, test_size=0.3, random_state=42)`. Run `GridSearchCV(DecisionTreeClassifier(random_state=42), {''max_depth'': [1, 2, 3, 5, None]}, cv=5)`, fit it. You almost never want to pickle the whole `GridSearchCV` object (it carries all the intermediate search results) -- pickle just `grid.best_estimator_` instead. Reload it and return `True` if its test accuracy matches `grid.best_estimator_`''s own test accuracy exactly, `False` otherwise.', 'grid.best_estimator_ is already a plain fitted DecisionTreeClassifier -- pickle it exactly like any other fitted model.', $py$import pickle
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score

def pickle_best_estimator():
    X, y = make_classification(n_samples=200, n_features=6, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    grid = GridSearchCV(DecisionTreeClassifier(random_state=42), {'max_depth': [1, 2, 3, 5, None]}, cv=5)
    grid.fit(X_train, y_train)
    # TODO: pickle grid.best_estimator_, reload it, compare test accuracy to grid.best_estimator_'s
    pass
$py$, $py$results = []
matches = pickle_best_estimator()
results.append(("returns a bool-like value", matches in (True, False)))
results.append(("reloaded best_estimator_ matches original accuracy", matches))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000116', 7, 'Choosing a pickle protocol', 'hard', 'Write `dumps_with_protocol()`. Fit a `DecisionTreeClassifier(max_depth=4, random_state=42)` on `make_classification(n_samples=200, n_features=6, random_state=42)`. `pickle.dumps` accepts a `protocol` argument controlling the binary format version; `pickle.HIGHEST_PROTOCOL` is the most efficient one your Python version supports. Serialize the model once with the default protocol and once with `protocol=pickle.HIGHEST_PROTOCOL`, reload both, and return `True` if both reloaded models produce identical predictions to each other on the training data, `False` otherwise. (Protocol only affects the byte-level encoding, never what the object deserializes back into.)', 'pickle.loads doesn''t need to know which protocol was used to dump -- it auto-detects it from the bytes.', $py$import pickle
from sklearn.datasets import make_classification
from sklearn.tree import DecisionTreeClassifier

def dumps_with_protocol():
    X, y = make_classification(n_samples=200, n_features=6, random_state=42)
    model = DecisionTreeClassifier(max_depth=4, random_state=42).fit(X, y)
    # TODO: pickle.dumps(model) with the default protocol, and again with
    # protocol=pickle.HIGHEST_PROTOCOL; reload both; compare their predictions on X
    pass
$py$, $py$results = []
same = dumps_with_protocol()
results.append(("returns a bool", isinstance(same, bool)))
results.append(("both protocols reload to functionally identical models", same is True))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000116', 8, 'Bigger models, bigger pickles', 'hard', 'Write `size_scales_with_complexity()`. Using `make_classification(n_samples=200, n_features=6, random_state=42)` split with `train_test_split(X, y, test_size=0.3, random_state=42)`, fit a shallow `DecisionTreeClassifier(max_depth=1, random_state=42)` and a deep `DecisionTreeClassifier(max_depth=None, random_state=42)` on the training data. Pickle both and return `(len(shallow_blob), len(deep_blob))`. A deeper tree stores more nodes, so its serialized form takes more bytes -- worth remembering if you''re shipping a saved model somewhere with a size limit.', 'len() on the bytes object returned by pickle.dumps gives you the serialized size directly, no need to write anywhere.', $py$import pickle
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier

def size_scales_with_complexity():
    X, y = make_classification(n_samples=200, n_features=6, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    # TODO: fit a shallow (max_depth=1) and deep (max_depth=None) tree,
    # pickle both, return (len(shallow_blob), len(deep_blob))
    pass
$py$, $py$results = []
shallow_len, deep_len = size_scales_with_complexity()
results.append(("both sizes are positive", shallow_len > 0 and deep_len > 0))
results.append(("deep tree pickle is larger than shallow tree pickle", deep_len > shallow_len))
results.append(("shallow_len close to expected", abs(shallow_len - 1379) < 400))
results.append(("deep_len close to expected", abs(deep_len - 4104) < 800))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000116', 9, 'Save several candidates, reload the best one', 'hard', 'Write `pick_best_saved_model()`. Generate `make_classification(n_samples=200, n_features=6, random_state=42)`, split with `train_test_split(X, y, test_size=0.3, random_state=42)`. Train three candidates on the training data: `DecisionTreeClassifier(max_depth=1, random_state=42)`, `DecisionTreeClassifier(max_depth=3, random_state=42)`, and `DecisionTreeClassifier(max_depth=None, random_state=42)`. Pickle each one into a dict `saved = {''shallow'': blob1, ''medium'': blob2, ''deep'': blob3}` (in memory, as bytes). Then, as if loading them back later, `pickle.loads` each blob, score it on the test set, and return the *key* (name) of whichever reloaded model has the highest test accuracy.', 'Loop over saved.items(), pickle.loads(blob).score(X_test, y_test) for each, and track the name with the highest score.', $py$import pickle
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier

def pick_best_saved_model():
    X, y = make_classification(n_samples=200, n_features=6, random_state=42)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
    shallow = DecisionTreeClassifier(max_depth=1, random_state=42).fit(X_train, y_train)
    medium = DecisionTreeClassifier(max_depth=3, random_state=42).fit(X_train, y_train)
    deep = DecisionTreeClassifier(max_depth=None, random_state=42).fit(X_train, y_train)
    saved = {
        'shallow': pickle.dumps(shallow),
        'medium': pickle.dumps(medium),
        'deep': pickle.dumps(deep),
    }
    # TODO: reload each blob, score it on (X_test, y_test), return the name of the best one
    pass
$py$, $py$results = []
best_name = pick_best_saved_model()
results.append(("returns one of the three valid names", best_name in ('shallow', 'medium', 'deep')))
results.append(("best_name matches expected", best_name == 'shallow'))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000117', 1, 'Step 1: Loading a messy dataset', 'easy', 'This concept''s challenges build one small end-to-end project: predicting customer churn from a synthetic telecom-style dataset, built by `build_customer_data(with_dirt=False)` -- given here so every challenge starts from the exact same data:

```python
def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice([''month-to-month'', ''one-year'', ''two-year''], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == ''month-to-month'') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        ''tenure_months'': tenure,
        ''monthly_charges'': monthly_charges,
        ''contract_type'': contract,
        ''support_calls'': support_calls,
        ''churn'': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, ''monthly_charges''] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df
```

Write `load_and_inspect()`. Call `build_customer_data(with_dirt=True)` (the "dirty" version has a few missing `monthly_charges` values and 10 duplicated rows mixed in, deliberately, to simulate a real messy export). Return `(n_rows, n_missing_charges, n_duplicate_rows)` using `df.shape[0]`, `df[''monthly_charges''].isna().sum()`, and `df.duplicated().sum()`.', 'df.duplicated() flags every row that''s an exact repeat of an earlier one (by default keeping the first occurrence unflagged) -- .sum() counts the flagged rows.', $py$import numpy as np
import pandas as pd

def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice(['month-to-month', 'one-year', 'two-year'], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == 'month-to-month') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        'tenure_months': tenure,
        'monthly_charges': monthly_charges,
        'contract_type': contract,
        'support_calls': support_calls,
        'churn': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, 'monthly_charges'] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df

def load_and_inspect():
    df = build_customer_data(with_dirt=True)
    # TODO: return (n_rows, n_missing_charges, n_duplicate_rows)
    pass
$py$, $py$results = []
n_rows, n_missing, n_dupes = load_and_inspect()
results.append(("n_rows == 410", n_rows == 410))
results.append(("n_missing_charges close to expected", abs(n_missing - 18) <= 3))
results.append(("n_duplicate_rows == 10", n_dupes == 10))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000117', 2, 'Step 2: Cleaning the data', 'easy', 'This concept''s challenges build one small end-to-end project: predicting customer churn from a synthetic telecom-style dataset, built by `build_customer_data(with_dirt=False)` -- given here so every challenge starts from the exact same data:

```python
def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice([''month-to-month'', ''one-year'', ''two-year''], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == ''month-to-month'') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        ''tenure_months'': tenure,
        ''monthly_charges'': monthly_charges,
        ''contract_type'': contract,
        ''support_calls'': support_calls,
        ''churn'': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, ''monthly_charges''] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df
```

Write `clean_data()`. Call `build_customer_data(with_dirt=True)`, drop exact duplicate rows with `.drop_duplicates()`, then fill missing `monthly_charges` values with the column''s mean (computed *after* dropping duplicates). Return `(cleaned_row_count, remaining_nulls, fill_value)` where `fill_value` is the mean used to fill.', 'Drop duplicates first, then compute the mean -- if you compute the mean before dropping duplicates, repeated rows would skew it slightly.', $py$import numpy as np
import pandas as pd

def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice(['month-to-month', 'one-year', 'two-year'], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == 'month-to-month') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        'tenure_months': tenure,
        'monthly_charges': monthly_charges,
        'contract_type': contract,
        'support_calls': support_calls,
        'churn': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, 'monthly_charges'] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df

def clean_data():
    df = build_customer_data(with_dirt=True)
    # TODO: drop duplicates, fill missing monthly_charges with the (post-dedup) mean,
    # return (cleaned_row_count, remaining_nulls, fill_value)
    pass
$py$, $py$results = []
cleaned_rows, remaining_nulls, fill_value = clean_data()
results.append(("cleaned_row_count == 400", cleaned_rows == 400))
results.append(("remaining_nulls == 0", remaining_nulls == 0))
results.append(("fill_value close to expected", abs(fill_value - 70.2852219321149) < 1.0))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000117', 3, 'Step 3: Engineering a new feature', 'medium', 'This concept''s challenges build one small end-to-end project: predicting customer churn from a synthetic telecom-style dataset, built by `build_customer_data(with_dirt=False)` -- given here so every challenge starts from the exact same data:

```python
def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice([''month-to-month'', ''one-year'', ''two-year''], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == ''month-to-month'') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        ''tenure_months'': tenure,
        ''monthly_charges'': monthly_charges,
        ''contract_type'': contract,
        ''support_calls'': support_calls,
        ''churn'': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, ''monthly_charges''] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df
```

Write `engineer_feature()`. Rebuild the cleaned data exactly as in the previous step (build with `with_dirt=True`, drop duplicates, fill missing `monthly_charges` with the post-dedup mean). Add a new column `high_support` that''s `1` when `support_calls > 3` and `0` otherwise. Return `(high_support_count, high_support_rate)`.', 'A boolean Series like (df[''support_calls''] > 3) converts cleanly to 0/1 with .astype(int); .sum() and .mean() then work directly on it.', $py$import numpy as np
import pandas as pd

def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice(['month-to-month', 'one-year', 'two-year'], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == 'month-to-month') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        'tenure_months': tenure,
        'monthly_charges': monthly_charges,
        'contract_type': contract,
        'support_calls': support_calls,
        'churn': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, 'monthly_charges'] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df

def engineer_feature():
    df = build_customer_data(with_dirt=True)
    df = df.drop_duplicates().copy()
    df['monthly_charges'] = df['monthly_charges'].fillna(df['monthly_charges'].mean())
    # TODO: add df['high_support'] = 1 if support_calls > 3 else 0,
    # return (high_support_count, high_support_rate)
    pass
$py$, $py$results = []
count, rate = engineer_feature()
results.append(("high_support_count close to expected", abs(count - 58) <= 3))
results.append(("high_support_rate close to expected", abs(rate - 0.145) < 0.02))
results.append(("rate is count / 400", abs(rate - count / 400) < 1e-6))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000117', 4, 'Step 4: A stratified train/test split', 'medium', 'This concept''s challenges build one small end-to-end project: predicting customer churn from a synthetic telecom-style dataset, built by `build_customer_data(with_dirt=False)` -- given here so every challenge starts from the exact same data:

```python
def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice([''month-to-month'', ''one-year'', ''two-year''], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == ''month-to-month'') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        ''tenure_months'': tenure,
        ''monthly_charges'': monthly_charges,
        ''contract_type'': contract,
        ''support_calls'': support_calls,
        ''churn'': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, ''monthly_charges''] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df
```

Write `split_data()`. Rebuild the cleaned, feature-engineered data exactly as before (drop duplicates, fill `monthly_charges`, add `high_support`). Select `feature_cols = [''tenure_months'', ''monthly_charges'', ''contract_type'', ''support_calls'', ''high_support'']` as `X = df[feature_cols]` and `y = df[''churn''].values`. Split with `train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)`. Return `(X_train.shape, X_test.shape, y_train.mean(), y_test.mean())`. Leave `contract_type` as raw text for now -- encoding it is the preprocessing pipeline''s job, next.', 'stratify=y keeps the churn rate roughly the same in both splits, even though only about 29% of rows are churned -- exactly the property you''d check before trusting a model''s test score.', $py$import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split

def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice(['month-to-month', 'one-year', 'two-year'], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == 'month-to-month') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        'tenure_months': tenure,
        'monthly_charges': monthly_charges,
        'contract_type': contract,
        'support_calls': support_calls,
        'churn': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, 'monthly_charges'] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df

def split_data():
    df = build_customer_data(with_dirt=True)
    df = df.drop_duplicates().copy()
    df['monthly_charges'] = df['monthly_charges'].fillna(df['monthly_charges'].mean())
    df['high_support'] = (df['support_calls'] > 3).astype(int)
    feature_cols = ['tenure_months', 'monthly_charges', 'contract_type', 'support_calls', 'high_support']
    X = df[feature_cols]
    y = df['churn'].values
    # TODO: stratified train_test_split(test_size=0.3, random_state=42),
    # return (X_train.shape, X_test.shape, y_train.mean(), y_test.mean())
    pass
$py$, $py$results = []
train_shape, test_shape, train_rate, test_rate = split_data()
results.append(("X_train has 280 rows", train_shape[0] == 280))
results.append(("X_test has 120 rows", test_shape[0] == 120))
results.append(("5 feature columns in both splits", train_shape[1] == 5 and test_shape[1] == 5))
results.append(("train/test churn rates are close (stratified)", abs(train_rate - test_rate) < 0.05))
results.append(("churn rate close to expected", abs(train_rate - 0.2892857142857143) < 0.03))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000117', 5, 'Step 5: A baseline preprocessing + model pipeline', 'medium', 'This concept''s challenges build one small end-to-end project: predicting customer churn from a synthetic telecom-style dataset, built by `build_customer_data(with_dirt=False)` -- given here so every challenge starts from the exact same data:

```python
def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice([''month-to-month'', ''one-year'', ''two-year''], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == ''month-to-month'') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        ''tenure_months'': tenure,
        ''monthly_charges'': monthly_charges,
        ''contract_type'': contract,
        ''support_calls'': support_calls,
        ''churn'': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, ''monthly_charges''] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df
```

Write `baseline_pipeline()`. Rebuild and split the data exactly as in the previous step. Build `ColumnTransformer([(''num'', StandardScaler(), [''tenure_months'', ''monthly_charges'', ''support_calls'', ''high_support'']), (''cat'', OneHotEncoder(handle_unknown=''ignore''), [''contract_type''])])`, wrap it in a `Pipeline` with a plain `LogisticRegression()`, fit it on the training split, and return `(test_accuracy, test_recall)` for the churn (`1`) class -- this is the naive baseline the rest of the project will try to beat.', 'OneHotEncoder only ever needs to see ''contract_type'' -- list it as its own single-item column list in the ColumnTransformer.', $py$import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, recall_score

def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice(['month-to-month', 'one-year', 'two-year'], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == 'month-to-month') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        'tenure_months': tenure,
        'monthly_charges': monthly_charges,
        'contract_type': contract,
        'support_calls': support_calls,
        'churn': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, 'monthly_charges'] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df

def baseline_pipeline():
    df = build_customer_data(with_dirt=True)
    df = df.drop_duplicates().copy()
    df['monthly_charges'] = df['monthly_charges'].fillna(df['monthly_charges'].mean())
    df['high_support'] = (df['support_calls'] > 3).astype(int)
    feature_cols = ['tenure_months', 'monthly_charges', 'contract_type', 'support_calls', 'high_support']
    X = df[feature_cols]
    y = df['churn'].values
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)
    # TODO: build the ColumnTransformer + Pipeline (plain LogisticRegression), fit it,
    # return (test_accuracy, test_recall)
    pass
$py$, $py$results = []
acc, rec = baseline_pipeline()
results.append(("accuracy close to expected", abs(acc - 0.7083333333333334) < 0.05))
results.append(("recall close to expected", abs(rec - 0.23529411764705882) < 0.08))
results.append(("recall well below 1.0 -- baseline misses most churners", rec < 0.5))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000117', 6, 'Step 6: Handling the churn imbalance', 'medium', 'This concept''s challenges build one small end-to-end project: predicting customer churn from a synthetic telecom-style dataset, built by `build_customer_data(with_dirt=False)` -- given here so every challenge starts from the exact same data:

```python
def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice([''month-to-month'', ''one-year'', ''two-year''], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == ''month-to-month'') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        ''tenure_months'': tenure,
        ''monthly_charges'': monthly_charges,
        ''contract_type'': contract,
        ''support_calls'': support_calls,
        ''churn'': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, ''monthly_charges''] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df
```

Write `balanced_pipeline()`. Rebuild, clean, engineer, and split the data exactly as before, and build the identical `ColumnTransformer`. This time use `LogisticRegression(class_weight=''balanced'')` as the model step instead. Fit it and return `(test_accuracy, test_recall)`. Only about 29% of customers churn, so the baseline model leaned toward predicting ''no churn'' -- `class_weight=''balanced''` counteracts that.', 'Only the model step changes here -- reuse the exact same ColumnTransformer and split as the baseline pipeline.', $py$import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, recall_score

def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice(['month-to-month', 'one-year', 'two-year'], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == 'month-to-month') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        'tenure_months': tenure,
        'monthly_charges': monthly_charges,
        'contract_type': contract,
        'support_calls': support_calls,
        'churn': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, 'monthly_charges'] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df

def balanced_pipeline():
    df = build_customer_data(with_dirt=True)
    df = df.drop_duplicates().copy()
    df['monthly_charges'] = df['monthly_charges'].fillna(df['monthly_charges'].mean())
    df['high_support'] = (df['support_calls'] > 3).astype(int)
    feature_cols = ['tenure_months', 'monthly_charges', 'contract_type', 'support_calls', 'high_support']
    X = df[feature_cols]
    y = df['churn'].values
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)
    numeric_features = ['tenure_months', 'monthly_charges', 'support_calls', 'high_support']
    categorical_features = ['contract_type']
    preprocessor = ColumnTransformer([
        ('num', StandardScaler(), numeric_features),
        ('cat', OneHotEncoder(handle_unknown='ignore'), categorical_features),
    ])
    # TODO: build a Pipeline using LogisticRegression(class_weight='balanced'), fit it,
    # return (test_accuracy, test_recall)
    pass
$py$, $py$results = []
acc, rec = balanced_pipeline()
results.append(("accuracy close to expected", abs(acc - 0.675) < 0.06))
results.append(("recall close to expected", abs(rec - 0.7058823529411765) < 0.1))
results.append(("recall improved substantially over the 0.235 baseline", rec > 0.5))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000117', 7, 'Step 7: Tuning the balanced pipeline', 'hard', 'This concept''s challenges build one small end-to-end project: predicting customer churn from a synthetic telecom-style dataset, built by `build_customer_data(with_dirt=False)` -- given here so every challenge starts from the exact same data:

```python
def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice([''month-to-month'', ''one-year'', ''two-year''], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == ''month-to-month'') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        ''tenure_months'': tenure,
        ''monthly_charges'': monthly_charges,
        ''contract_type'': contract,
        ''support_calls'': support_calls,
        ''churn'': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, ''monthly_charges''] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df
```

Write `tune_pipeline()`. Rebuild, clean, engineer, split, and build the same `ColumnTransformer` and a `Pipeline` using `LogisticRegression(class_weight=''balanced'')`. Wrap it in `GridSearchCV(pipe, {''model__C'': [0.01, 0.1, 1, 10]}, cv=5)`, fit it on the training split, and return `(grid.best_params_[''model__C''], grid.best_score_)`.', 'Even with class_weight=''balanced'' fixed, the model still has a C parameter left to search over -- name it ''model__C'' since ''model'' is the Pipeline step''s name.', $py$import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.linear_model import LogisticRegression

def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice(['month-to-month', 'one-year', 'two-year'], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == 'month-to-month') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        'tenure_months': tenure,
        'monthly_charges': monthly_charges,
        'contract_type': contract,
        'support_calls': support_calls,
        'churn': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, 'monthly_charges'] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df

def tune_pipeline():
    df = build_customer_data(with_dirt=True)
    df = df.drop_duplicates().copy()
    df['monthly_charges'] = df['monthly_charges'].fillna(df['monthly_charges'].mean())
    df['high_support'] = (df['support_calls'] > 3).astype(int)
    feature_cols = ['tenure_months', 'monthly_charges', 'contract_type', 'support_calls', 'high_support']
    X = df[feature_cols]
    y = df['churn'].values
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)
    numeric_features = ['tenure_months', 'monthly_charges', 'support_calls', 'high_support']
    categorical_features = ['contract_type']
    preprocessor = ColumnTransformer([
        ('num', StandardScaler(), numeric_features),
        ('cat', OneHotEncoder(handle_unknown='ignore'), categorical_features),
    ])
    pipe = Pipeline([('preprocess', preprocessor), ('model', LogisticRegression(class_weight='balanced'))])
    # TODO: GridSearchCV(pipe, {'model__C': [0.01, 0.1, 1, 10]}, cv=5), fit it,
    # return (grid.best_params_['model__C'], grid.best_score_)
    pass
$py$, $py$results = []
best_c, best_score = tune_pipeline()
results.append(("best_c matches expected", abs(best_c - 1) < 1e-9))
results.append(("best_score close to expected", abs(best_score - 0.6642857142857143) < 0.05))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000117', 8, 'Step 8: Evaluating the final model', 'hard', 'This concept''s challenges build one small end-to-end project: predicting customer churn from a synthetic telecom-style dataset, built by `build_customer_data(with_dirt=False)` -- given here so every challenge starts from the exact same data:

```python
def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice([''month-to-month'', ''one-year'', ''two-year''], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == ''month-to-month'') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        ''tenure_months'': tenure,
        ''monthly_charges'': monthly_charges,
        ''contract_type'': contract,
        ''support_calls'': support_calls,
        ''churn'': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, ''monthly_charges''] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df
```

Write `final_evaluation()`. Repeat every step through tuning (build, clean, engineer, split, ColumnTransformer, `GridSearchCV(pipe, {''model__C'': [0.01, 0.1, 1, 10]}, cv=5)` with the balanced pipeline). Using `grid.best_estimator_`, compute `precision`, `recall`, `f1` (from `.predict(X_test)`) and `roc_auc` (from `.predict_proba(X_test)[:, 1]`) on the test set. Return a dict with keys `''precision''`, `''recall''`, `''f1''`, `''roc_auc''`.', 'roc_auc_score needs the predicted probability of the positive class, not the hard 0/1 prediction -- everything else here uses .predict().', $py$import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import precision_score, recall_score, f1_score, roc_auc_score

def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice(['month-to-month', 'one-year', 'two-year'], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == 'month-to-month') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        'tenure_months': tenure,
        'monthly_charges': monthly_charges,
        'contract_type': contract,
        'support_calls': support_calls,
        'churn': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, 'monthly_charges'] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df

def final_evaluation():
    df = build_customer_data(with_dirt=True)
    df = df.drop_duplicates().copy()
    df['monthly_charges'] = df['monthly_charges'].fillna(df['monthly_charges'].mean())
    df['high_support'] = (df['support_calls'] > 3).astype(int)
    feature_cols = ['tenure_months', 'monthly_charges', 'contract_type', 'support_calls', 'high_support']
    X = df[feature_cols]
    y = df['churn'].values
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)
    numeric_features = ['tenure_months', 'monthly_charges', 'support_calls', 'high_support']
    categorical_features = ['contract_type']
    preprocessor = ColumnTransformer([
        ('num', StandardScaler(), numeric_features),
        ('cat', OneHotEncoder(handle_unknown='ignore'), categorical_features),
    ])
    pipe = Pipeline([('preprocess', preprocessor), ('model', LogisticRegression(class_weight='balanced'))])
    grid = GridSearchCV(pipe, {'model__C': [0.01, 0.1, 1, 10]}, cv=5)
    grid.fit(X_train, y_train)
    best = grid.best_estimator_
    # TODO: compute precision/recall/f1 from best.predict(X_test) and roc_auc from
    # best.predict_proba(X_test)[:, 1]; return the results dict
    pass
$py$, $py$results = []
metrics = final_evaluation()
results.append(("has all four keys", set(metrics.keys()) == {'precision', 'recall', 'f1', 'roc_auc'}))
results.append(("precision close to expected", abs(metrics['precision'] - 0.4528301886792453) < 0.1))
results.append(("recall close to expected", abs(metrics['recall'] - 0.7058823529411765) < 0.1))
results.append(("f1 close to expected", abs(metrics['f1'] - 0.5517241379310345) < 0.1))
results.append(("roc_auc close to expected", abs(metrics['roc_auc'] - 0.725376196990424) < 0.08))
results.append(("roc_auc beats chance level (0.5)", metrics['roc_auc'] > 0.6))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000014', '10000000-0000-0000-0000-000000000117', 9, 'Step 9: Saving the finished model', 'hard', 'This concept''s challenges build one small end-to-end project: predicting customer churn from a synthetic telecom-style dataset, built by `build_customer_data(with_dirt=False)` -- given here so every challenge starts from the exact same data:

```python
def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice([''month-to-month'', ''one-year'', ''two-year''], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == ''month-to-month'') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        ''tenure_months'': tenure,
        ''monthly_charges'': monthly_charges,
        ''contract_type'': contract,
        ''support_calls'': support_calls,
        ''churn'': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, ''monthly_charges''] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df
```

Write `save_final_model()`. Repeat every step through tuning exactly as the previous exercise, and get `best = grid.best_estimator_`. This is the final deploy step of the project: pickle `best` to bytes with `pickle.dumps`, then `pickle.loads` it back (in memory -- no file path, matching how a real browser session would need to work). Return `True` if the reloaded pipeline''s predictions on `X_test` exactly match the original''s, `False` otherwise.', 'Every earlier exercise in this project fed into this final one -- the whole point of pickling is that this reloaded object is now something you could hand to a different process (or save from one browser session and load in another) without repeating any of the training above.', $py$import pickle
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.linear_model import LogisticRegression

def build_customer_data(with_dirt=False):
    rng = np.random.RandomState(42)
    n = 400
    tenure = rng.randint(1, 72, size=n)
    monthly_charges = np.clip(rng.normal(70, 30, size=n).round(2), 20, 150)
    contract = rng.choice(['month-to-month', 'one-year', 'two-year'], size=n, p=[0.5, 0.3, 0.2])
    support_calls = rng.poisson(2, size=n)
    logit = -0.03 * tenure + 0.15 * support_calls + (contract == 'month-to-month') * 1.2 - 1.0
    prob = 1 / (1 + np.exp(-logit))
    churn = (rng.random(n) < prob).astype(int)
    df = pd.DataFrame({
        'tenure_months': tenure,
        'monthly_charges': monthly_charges,
        'contract_type': contract,
        'support_calls': support_calls,
        'churn': churn,
    })
    if with_dirt:
        nan_mask = rng.random(n) < 0.05
        df.loc[nan_mask, 'monthly_charges'] = np.nan
        dupes = df.sample(n=10, random_state=42)
        df = pd.concat([df, dupes], ignore_index=True)
    return df

def save_final_model():
    df = build_customer_data(with_dirt=True)
    df = df.drop_duplicates().copy()
    df['monthly_charges'] = df['monthly_charges'].fillna(df['monthly_charges'].mean())
    df['high_support'] = (df['support_calls'] > 3).astype(int)
    feature_cols = ['tenure_months', 'monthly_charges', 'contract_type', 'support_calls', 'high_support']
    X = df[feature_cols]
    y = df['churn'].values
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42, stratify=y)
    numeric_features = ['tenure_months', 'monthly_charges', 'support_calls', 'high_support']
    categorical_features = ['contract_type']
    preprocessor = ColumnTransformer([
        ('num', StandardScaler(), numeric_features),
        ('cat', OneHotEncoder(handle_unknown='ignore'), categorical_features),
    ])
    pipe = Pipeline([('preprocess', preprocessor), ('model', LogisticRegression(class_weight='balanced'))])
    grid = GridSearchCV(pipe, {'model__C': [0.01, 0.1, 1, 10]}, cv=5)
    grid.fit(X_train, y_train)
    best = grid.best_estimator_
    # TODO: pickle.dumps(best), pickle.loads(...) it back, compare predictions on X_test
    pass
$py$, $py$results = []
same = save_final_model()
results.append(("returns a bool", isinstance(same, bool)))
results.append(("reloaded pipeline predicts identically to the original", same is True))
passed = 0
for name, ok in results:
    print(f"{'PASS' if ok else 'FAIL'}: {name}")
    passed += ok
print(f"{passed}/{len(results)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000118', 1, 'The step activation function', 'easy', 'Write step(z) implementing the perceptron''s activation: return 1 if z >= 0, else 0. z may be a plain Python number or a NumPy array; when it''s an array, return an array of 0s/1s of the same shape.', 'np.where(z >= 0, 1, 0) handles arrays; for a plain number an if/else works fine too.', $py$import numpy as np

def step(z):
    # TODO: return 1 if z >= 0 else 0 (elementwise if z is an array)
    pass
$py$, $py$_passed = 0
_total = 4

_r1 = step(0.5)
if _r1 == 1:
    _passed += 1
    print("PASS: step(0.5) == 1")
else:
    print(f"FAIL: step(0.5) returned {_r1!r}, expected 1")

_r2 = step(-0.5)
if _r2 == 0:
    _passed += 1
    print("PASS: step(-0.5) == 0")
else:
    print(f"FAIL: step(-0.5) returned {_r2!r}, expected 0")

_r3 = step(0)
if _r3 == 1:
    _passed += 1
    print("PASS: step(0) == 1")
else:
    print(f"FAIL: step(0) returned {_r3!r}, expected 1")

_r4 = np.asarray(step(np.array([-1.0, 0.0, 2.0])))
_expected4 = np.array([0, 1, 1])
if np.array_equal(_r4, _expected4):
    _passed += 1
    print(f"PASS: step(array([-1.0, 0.0, 2.0])) == {_expected4.tolist()}")
else:
    print(f"FAIL: step(array) returned {_r4.tolist()}, expected {_expected4.tolist()}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000118', 2, 'Perceptron forward pass', 'easy', 'Write perceptron_output(x, w, b) that computes a single perceptron''s output for one input vector x: dot product of x and w, plus bias b, passed through the step function (>= 0 -> 1, else 0).', 'z = np.dot(x, w) + b, then return 1 if z >= 0 else 0.', $py$import numpy as np

def perceptron_output(x, w, b):
    # TODO: compute np.dot(x, w) + b, then apply the step function
    pass
$py$, $py$_cases = [
    (np.array([1.0, 1.0]), np.array([0.5, 0.5]), -0.75, 1),
    (np.array([0.0, 0.0]), np.array([0.5, 0.5]), -0.75, 0),
    (np.array([2.0, -1.0]), np.array([1.0, 1.0]), 0.0, 1),
    (np.array([-1.0, -1.0]), np.array([1.0, 1.0]), 0.5, 0),
]
_passed = 0
for _x, _w, _b, _expected in _cases:
    _actual = perceptron_output(_x, _w, _b)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: perceptron_output({_x.tolist()}, {_w.tolist()}, {_b}) == {_expected}")
    else:
        print(f"FAIL: perceptron_output({_x.tolist()}, {_w.tolist()}, {_b}) returned {_actual!r}, expected {_expected}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000118', 3, 'AND gate as a perceptron', 'easy', 'Write AND_gate(x1, x2) that returns the logical AND of two 0/1 inputs, implemented as a perceptron (pick any weights and bias you like) so it reproduces the AND truth table: (0,0)->0, (0,1)->0, (1,0)->0, (1,1)->1.', 'w1=w2=1, b=-1.5 works: only 1+1-1.5 is >= 0.', $py$import numpy as np

def AND_gate(x1, x2):
    # TODO: implement AND as a perceptron (weighted sum + bias + step)
    pass
$py$, $py$_cases = [(0, 0, 0), (0, 1, 0), (1, 0, 0), (1, 1, 1)]
_passed = 0
for _x1, _x2, _expected in _cases:
    _actual = AND_gate(_x1, _x2)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: AND_gate({_x1}, {_x2}) == {_expected}")
    else:
        print(f"FAIL: AND_gate({_x1}, {_x2}) returned {_actual!r}, expected {_expected}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000118', 4, 'OR gate as a perceptron', 'easy', 'Write OR_gate(x1, x2) that returns the logical OR of two 0/1 inputs, implemented as a perceptron, so it reproduces the OR truth table: (0,0)->0, (0,1)->1, (1,0)->1, (1,1)->1.', 'w1=w2=1, b=-0.5 works: any single 1 already pushes the sum to 0.5, which is >= 0.', $py$import numpy as np

def OR_gate(x1, x2):
    # TODO: implement OR as a perceptron (weighted sum + bias + step)
    pass
$py$, $py$_cases = [(0, 0, 0), (0, 1, 1), (1, 0, 1), (1, 1, 1)]
_passed = 0
for _x1, _x2, _expected in _cases:
    _actual = OR_gate(_x1, _x2)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: OR_gate({_x1}, {_x2}) == {_expected}")
    else:
        print(f"FAIL: OR_gate({_x1}, {_x2}) returned {_actual!r}, expected {_expected}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000118', 5, 'NOT gate as a perceptron', 'medium', 'Write NOT_gate(x) that returns the logical NOT of a single 0/1 input, implemented as a perceptron with one weight and a bias, so NOT_gate(0) == 1 and NOT_gate(1) == 0.', 'A negative weight flips the relationship: w=-1, b=0.5 gives z=0.5 for x=0 (>=0 -> 1) and z=-0.5 for x=1 (<0 -> 0).', $py$import numpy as np

def NOT_gate(x):
    # TODO: implement NOT as a single-input perceptron
    pass
$py$, $py$_cases = [(0, 1), (1, 0)]
_passed = 0
for _x, _expected in _cases:
    _actual = NOT_gate(_x)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: NOT_gate({_x}) == {_expected}")
    else:
        print(f"FAIL: NOT_gate({_x}) returned {_actual!r}, expected {_expected}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000118', 6, 'Vectorized batch prediction', 'medium', 'Write perceptron_predict_batch(X, w, b) that computes perceptron outputs for a whole batch at once: X has shape (n_samples, n_features), w has shape (n_features,), b is a scalar. Return a NumPy array of shape (n_samples,) containing 0/1 for each row, using a single vectorized matrix operation (no Python loop over rows).', 'X @ w + b gives all the weighted sums at once; then (that >= 0).astype(int) turns it into 0s and 1s.', $py$import numpy as np

def perceptron_predict_batch(X, w, b):
    # TODO: vectorized forward pass for a whole batch of inputs
    pass
$py$, $py$X = np.array([[0.0, 0.0], [0.0, 1.0], [1.0, 0.0], [1.0, 1.0]])
w = np.array([1.0, 1.0])
b = -1.5  # AND gate weights
_expected = np.array([0, 0, 0, 1])
_actual = np.asarray(perceptron_predict_batch(X, w, b))

_passed = 0
_total = 2

if _actual.shape == _expected.shape:
    _passed += 1
    print(f"PASS: output shape {_actual.shape} matches {_expected.shape}")
else:
    print(f"FAIL: output shape {_actual.shape}, expected {_expected.shape}")

if np.array_equal(_actual, _expected):
    _passed += 1
    print(f"PASS: perceptron_predict_batch matches AND truth table: {_actual.tolist()}")
else:
    print(f"FAIL: perceptron_predict_batch returned {_actual.tolist()}, expected {_expected.tolist()}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000118', 7, 'The perceptron learning rule', 'medium', 'Write perceptron_update(x, target, prediction, w, b, lr) implementing one step of the perceptron learning rule: new_w = w + lr * (target - prediction) * x, new_b = b + lr * (target - prediction). Return (new_w, new_b).', 'Compute the error = target - prediction once, then use it to scale both the weight update and the bias update.', $py$import numpy as np

def perceptron_update(x, target, prediction, w, b, lr):
    # TODO: apply one step of the perceptron learning rule
    pass
$py$, $py$_passed = 0
_total = 3

# Case 1: correct prediction -> no change
x1 = np.array([1.0, 0.0])
w1, b1 = perceptron_update(x1, target=1, prediction=1, w=np.array([0.5, 0.5]), b=-0.2, lr=0.1)
if np.allclose(w1, [0.5, 0.5]) and np.isclose(b1, -0.2):
    _passed += 1
    print("PASS: correct prediction leaves weights/bias unchanged")
else:
    print(f"FAIL: expected no change, got w={w1}, b={b1}")

# Case 2: wrong prediction (target=1, predicted 0) -> weights increase
x2 = np.array([1.0, 1.0])
w2, b2 = perceptron_update(x2, target=1, prediction=0, w=np.array([0.0, 0.0]), b=0.0, lr=0.5)
if np.allclose(w2, [0.5, 0.5]) and np.isclose(b2, 0.5):
    _passed += 1
    print(f"PASS: underprediction nudges weights up: w={w2.tolist()}, b={b2}")
else:
    print(f"FAIL: expected w=[0.5, 0.5], b=0.5, got w={w2}, b={b2}")

# Case 3: wrong prediction (target=0, predicted 1) -> weights decrease
x3 = np.array([2.0, 1.0])
w3, b3 = perceptron_update(x3, target=0, prediction=1, w=np.array([1.0, 1.0]), b=0.0, lr=0.1)
if np.allclose(w3, [0.8, 0.9]) and np.isclose(b3, -0.1):
    _passed += 1
    print(f"PASS: overprediction nudges weights down: w={w3.tolist()}, b={b3}")
else:
    print(f"FAIL: expected w=[0.8, 0.9], b=-0.1, got w={w3}, b={b3}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000118', 8, 'Training a perceptron end to end', 'hard', 'Write train_perceptron(X, y, lr, epochs) that trains a perceptron with the learning rule from the previous challenge. Start with w = np.zeros(X.shape[1]) and b = 0.0. For each epoch, loop over every row of X in order and apply one perceptron_update step per row. Return the final (w, b) after all epochs.', 'Two nested loops: for each epoch, for each row i, compute the current prediction with the step function, then update w and b using that row''s error.', $py$import numpy as np

def train_perceptron(X, y, lr, epochs):
    # TODO: train a perceptron from zero-initialized weights using the
    # perceptron learning rule, looping over all rows for `epochs` passes
    pass
$py$, $py$X = np.array([[0.0, 0.0], [0.0, 1.0], [1.0, 0.0], [1.0, 1.0]])
y = np.array([0, 0, 0, 1])  # AND gate

w, b = train_perceptron(X, y, lr=0.1, epochs=20)

_passed = 0
_total = 4
for i in range(4):
    z = np.dot(X[i], w) + b
    pred = 1 if z >= 0 else 0
    if pred == y[i]:
        _passed += 1
        print(f"PASS: trained perceptron predicts {pred} for {X[i].tolist()} (expected {y[i]})")
    else:
        print(f"FAIL: trained perceptron predicts {pred} for {X[i].tolist()}, expected {y[i]}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000118', 9, 'Why a perceptron can''t solve XOR', 'hard', 'Write max_perceptron_accuracy_xor() that brute-force searches a grid of weights and biases to find the *best possible* accuracy a single perceptron (w1, w2, b, step activation) can achieve on the XOR truth table ((0,0)->0, (0,1)->1, (1,0)->1, (1,1)->0). Search w1, w2, b each over np.linspace(-2, 2, 41), and return the highest fraction of the 4 XOR examples correctly classified by any single combination.', 'Three nested loops over the linspace grids; for each (w1, w2, b), count how many of the 4 XOR rows the perceptron gets right out of 4, track the best fraction seen.', $py$import numpy as np

def max_perceptron_accuracy_xor():
    # TODO: brute-force search over a grid of (w1, w2, b) and return the
    # best fraction of the 4 XOR examples any single perceptron gets right
    pass
$py$, $py$_result = max_perceptron_accuracy_xor()

_passed = 0
_total = 2

if isinstance(_result, (int, float)) and 0.5 <= _result <= 0.76:
    _passed += 1
    print(f"PASS: best achievable accuracy on XOR is {_result:.3f}, well short of 1.0 (linear separators can't solve XOR)")
else:
    print(f"FAIL: expected a value in [0.5, 0.76] (perceptrons can't beat 3/4 on XOR), got {_result!r}")

if _result < 1.0:
    _passed += 1
    print("PASS: confirms no single linear perceptron achieves perfect XOR accuracy")
else:
    print(f"FAIL: expected accuracy strictly less than 1.0, got {_result!r}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000119', 1, 'Sigmoid', 'easy', 'Write sigmoid(z) that returns 1 / (1 + exp(-z)), elementwise, for a NumPy array or scalar z.', '1 / (1 + np.exp(-z)) works directly on arrays and scalars alike.', $py$import numpy as np

def sigmoid(z):
    # TODO: return the sigmoid of z
    pass
$py$, $py$_cases = [
    (0.0, 0.5),
    (100.0, 1.0),
    (-100.0, 0.0),
]
_passed = 0
_total = 4
for _z, _expected in _cases:
    _actual = sigmoid(_z)
    if abs(_actual - _expected) < 1e-6:
        _passed += 1
        print(f"PASS: sigmoid({_z}) ~= {_expected}")
    else:
        print(f"FAIL: sigmoid({_z}) returned {_actual!r}, expected ~{_expected}")

_arr = sigmoid(np.array([0.0, 2.0]))
_expected_arr = np.array([0.5, 1 / (1 + np.exp(-2.0))])
if np.allclose(_arr, _expected_arr, atol=1e-6):
    _passed += 1
    print(f"PASS: sigmoid(array) == {_arr.tolist()}")
else:
    print(f"FAIL: sigmoid(array) returned {_arr}, expected {_expected_arr}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000119', 2, 'ReLU', 'easy', 'Write relu(z) that returns max(0, z), elementwise, for a NumPy array or scalar z.', 'np.maximum(0, z) is the vectorized version of max(0, z).', $py$import numpy as np

def relu(z):
    # TODO: return the ReLU of z
    pass
$py$, $py$_arr = relu(np.array([-2.0, -0.001, 0.0, 3.5]))
_expected = np.array([0.0, 0.0, 0.0, 3.5])
_passed = 0
_total = 2
if np.allclose(_arr, _expected):
    _passed += 1
    print(f"PASS: relu(array) == {_arr.tolist()}")
else:
    print(f"FAIL: relu(array) returned {_arr}, expected {_expected}")

if relu(-5.0) == 0.0 and relu(5.0) == 5.0:
    _passed += 1
    print("PASS: relu(-5.0) == 0.0 and relu(5.0) == 5.0")
else:
    print(f"FAIL: relu(-5.0)={relu(-5.0)!r}, relu(5.0)={relu(5.0)!r}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000119', 3, 'Tanh activation', 'easy', 'Write tanh_activation(z) that returns the hyperbolic tangent of z, elementwise, squashing values into (-1, 1). Use np.tanh.', 'np.tanh(z) does exactly this -- no need to implement the formula by hand.', $py$import numpy as np

def tanh_activation(z):
    # TODO: return np.tanh(z)
    pass
$py$, $py$_passed = 0
_total = 3

if abs(tanh_activation(0.0) - 0.0) < 1e-9:
    _passed += 1
    print("PASS: tanh_activation(0.0) == 0.0")
else:
    print(f"FAIL: tanh_activation(0.0) returned {tanh_activation(0.0)!r}")

_big = tanh_activation(50.0)
if abs(_big - 1.0) < 1e-6:
    _passed += 1
    print(f"PASS: tanh_activation(50.0) ~= 1.0 ({_big})")
else:
    print(f"FAIL: tanh_activation(50.0) returned {_big!r}, expected ~1.0")

_arr = tanh_activation(np.array([-1.0, 1.0]))
_expected = np.array([np.tanh(-1.0), np.tanh(1.0)])
if np.allclose(_arr, _expected):
    _passed += 1
    print(f"PASS: tanh_activation(array) == {_arr.tolist()}")
else:
    print(f"FAIL: tanh_activation(array) returned {_arr}, expected {_expected}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000119', 4, 'Derivative of sigmoid', 'medium', 'Write sigmoid_derivative(z) that returns the derivative of the sigmoid function with respect to z, at point z. Recall sigmoid''(z) = sigmoid(z) * (1 - sigmoid(z)).', 'Compute s = sigmoid(z) first (1 / (1 + np.exp(-z))), then return s * (1 - s).', $py$import numpy as np

def sigmoid_derivative(z):
    # TODO: return sigmoid(z) * (1 - sigmoid(z))
    pass
$py$, $py$def _sigmoid(z):
    return 1 / (1 + np.exp(-z))

_passed = 0
_total = 3

_z0 = sigmoid_derivative(0.0)
if abs(_z0 - 0.25) < 1e-6:
    _passed += 1
    print(f"PASS: sigmoid_derivative(0.0) == 0.25")
else:
    print(f"FAIL: sigmoid_derivative(0.0) returned {_z0!r}, expected 0.25")

for _z in [2.0, -3.0]:
    _expected = _sigmoid(_z) * (1 - _sigmoid(_z))
    _actual = sigmoid_derivative(_z)
    if abs(_actual - _expected) < 1e-6:
        _passed += 1
        print(f"PASS: sigmoid_derivative({_z}) ~= {_expected:.6f}")
    else:
        print(f"FAIL: sigmoid_derivative({_z}) returned {_actual!r}, expected ~{_expected:.6f}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000119', 5, 'Derivative of ReLU', 'medium', 'Write relu_derivative(z) that returns the derivative of ReLU, elementwise: 1 where z > 0, and 0 where z <= 0 (treat the undefined point at exactly 0 as 0).', '(z > 0).astype(float) gives 1.0 where z is positive and 0.0 elsewhere, including at z == 0.', $py$import numpy as np

def relu_derivative(z):
    # TODO: return 1 where z > 0, else 0 (elementwise)
    pass
$py$, $py$_arr = relu_derivative(np.array([-2.0, 0.0, 0.001, 5.0]))
_expected = np.array([0.0, 0.0, 1.0, 1.0])
_passed = 0
_total = 2
if np.array_equal(_arr, _expected):
    _passed += 1
    print(f"PASS: relu_derivative(array) == {_arr.tolist()}")
else:
    print(f"FAIL: relu_derivative(array) returned {_arr}, expected {_expected}")

if relu_derivative(-1.0) == 0 and relu_derivative(1.0) == 1:
    _passed += 1
    print("PASS: scalar inputs handled correctly")
else:
    print(f"FAIL: relu_derivative(-1.0)={relu_derivative(-1.0)!r}, relu_derivative(1.0)={relu_derivative(1.0)!r}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000119', 6, 'Leaky ReLU', 'medium', 'Write leaky_relu(z, alpha=0.01) that returns z where z > 0, and alpha * z where z <= 0 -- a version of ReLU that never has a completely flat (zero-gradient) region for negative inputs.', 'np.where(z > 0, z, alpha * z) applies elementwise.', $py$import numpy as np

def leaky_relu(z, alpha=0.01):
    # TODO: return z for positive z, and alpha * z for non-positive z
    pass
$py$, $py$_arr = leaky_relu(np.array([-2.0, 0.0, 3.0]), alpha=0.1)
_expected = np.array([-0.2, 0.0, 3.0])
_passed = 0
_total = 2
if np.allclose(_arr, _expected):
    _passed += 1
    print(f"PASS: leaky_relu(array, alpha=0.1) == {_arr.tolist()}")
else:
    print(f"FAIL: leaky_relu(array, alpha=0.1) returned {_arr}, expected {_expected}")

_default = leaky_relu(np.array([-1.0]))
if np.allclose(_default, [-0.01]):
    _passed += 1
    print(f"PASS: default alpha=0.01 applied: leaky_relu(-1.0) == {_default[0]}")
else:
    print(f"FAIL: leaky_relu(-1.0) with default alpha returned {_default}, expected [-0.01]")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000119', 7, 'Softmax for multi-class output', 'medium', 'Write softmax(z) for a 2D array z of shape (n_samples, n_classes): return an array of the same shape where each row is transformed into a probability distribution (nonnegative, summing to 1). Apply it independently, row by row.', 'For numerical safety subtract each row''s max before exponentiating: exps = np.exp(z - z.max(axis=1, keepdims=True)); divide by exps.sum(axis=1, keepdims=True).', $py$import numpy as np

def softmax(z):
    # TODO: row-wise softmax of a 2D array
    pass
$py$, $py$z = np.array([[1.0, 2.0, 3.0], [0.0, 0.0, 0.0]])
result = np.asarray(softmax(z))

_passed = 0
_total = 3

if result.shape == z.shape:
    _passed += 1
    print(f"PASS: output shape {result.shape} matches input shape")
else:
    print(f"FAIL: output shape {result.shape}, expected {z.shape}")

_row_sums = result.sum(axis=1)
if np.allclose(_row_sums, 1.0, atol=1e-6):
    _passed += 1
    print(f"PASS: each row sums to 1: {_row_sums.tolist()}")
else:
    print(f"FAIL: row sums were {_row_sums.tolist()}, expected all 1.0")

_expected_row2 = np.array([1 / 3, 1 / 3, 1 / 3])
if np.allclose(result[1], _expected_row2, atol=1e-6):
    _passed += 1
    print(f"PASS: equal inputs give a uniform distribution: {result[1].tolist()}")
else:
    print(f"FAIL: row 2 was {result[1].tolist()}, expected {_expected_row2.tolist()}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000119', 8, 'Two linear layers collapse into one', 'hard', 'Write equivalent_single_layer(X, W1, b1, W2, b2) that proves two stacked *linear* layers (no activation between them) are equivalent to a single linear layer. Compute an equivalent combined weight matrix W_eq and bias b_eq such that X @ W_eq + b_eq gives the same result as (X @ W1 + b1) @ W2 + b2, and return (W_eq, b_eq).', 'Expand the algebra: (X @ W1 + b1) @ W2 + b2 == X @ (W1 @ W2) + (b1 @ W2 + b2). So W_eq = W1 @ W2 and b_eq = b1 @ W2 + b2.', $py$import numpy as np

def equivalent_single_layer(X, W1, b1, W2, b2):
    # TODO: return (W_eq, b_eq) such that X @ W_eq + b_eq matches the
    # two-layer computation (X @ W1 + b1) @ W2 + b2, with no activation
    pass
$py$, $py$rng = np.random.default_rng(0)
X = rng.normal(size=(5, 3))
W1 = rng.normal(size=(3, 4))
b1 = rng.normal(size=(4,))
W2 = rng.normal(size=(4, 2))
b2 = rng.normal(size=(2,))

_two_layer_output = (X @ W1 + b1) @ W2 + b2

W_eq, b_eq = equivalent_single_layer(X, W1, b1, W2, b2)
_single_layer_output = X @ W_eq + b_eq

_passed = 0
_total = 2

if np.allclose(_single_layer_output, _two_layer_output, atol=1e-8):
    _passed += 1
    print("PASS: single combined linear layer matches the two stacked linear layers exactly")
else:
    print(f"FAIL: outputs differ; two-layer={_two_layer_output[0]}, single-layer={_single_layer_output[0]}")

if np.asarray(W_eq).shape == (3, 2) and np.asarray(b_eq).shape == (2,):
    _passed += 1
    print(f"PASS: W_eq shape {np.asarray(W_eq).shape}, b_eq shape {np.asarray(b_eq).shape} are correct")
else:
    print(f"FAIL: W_eq shape {np.asarray(W_eq).shape}, b_eq shape {np.asarray(b_eq).shape}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000119', 9, 'Softmax must not overflow', 'hard', 'Write stable_softmax(z) for a 1D NumPy array z that behaves correctly even when z contains very large values (e.g. 1000+), by subtracting the max before exponentiating. It must never return nan or inf, and must still sum to 1.', 'shifted = z - z.max(); then exp(shifted) is bounded by 1, so the division is always well-defined.', $py$import numpy as np

def stable_softmax(z):
    # TODO: numerically stable softmax for a 1D array
    pass
$py$, $py$_passed = 0
_total = 3

_z_large = np.array([1000.0, 1001.0, 1002.0])
_result = np.asarray(stable_softmax(_z_large), dtype=float)

if not np.any(np.isnan(_result)) and not np.any(np.isinf(_result)):
    _passed += 1
    print(f"PASS: no NaN/inf on large inputs: {_result.tolist()}")
else:
    print(f"FAIL: got NaN/inf on large inputs: {_result.tolist()}")

if abs(_result.sum() - 1.0) < 1e-6:
    _passed += 1
    print(f"PASS: large-input softmax still sums to 1: {_result.sum():.6f}")
else:
    print(f"FAIL: large-input softmax summed to {_result.sum()}, expected 1.0")

_z_small = np.array([1.0, 2.0, 3.0])
_expected_small = np.exp(_z_small - _z_small.max())
_expected_small = _expected_small / _expected_small.sum()
_result_small = np.asarray(stable_softmax(_z_small), dtype=float)
if np.allclose(_result_small, _expected_small, atol=1e-6):
    _passed += 1
    print(f"PASS: matches expected values on ordinary input: {_result_small.tolist()}")
else:
    print(f"FAIL: got {_result_small.tolist()}, expected {_expected_small.tolist()}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000120', 1, 'A single linear layer', 'easy', 'Write linear_layer(X, W, b) that computes the raw weighted sum for a layer: X @ W + b. X has shape (n_samples, n_features), W has shape (n_features, n_units), b has shape (n_units,).', 'X @ W performs the matrix multiply; NumPy broadcasts b across every row automatically.', $py$import numpy as np

def linear_layer(X, W, b):
    # TODO: return X @ W + b
    pass
$py$, $py$X = np.array([[1.0, 2.0], [0.0, 1.0]])
W = np.array([[1.0, 0.0, -1.0], [0.0, 1.0, 1.0]])
b = np.array([0.5, 0.5, 0.5])

_result = np.asarray(linear_layer(X, W, b))
_expected = np.array([[1.5, 2.5, 1.5], [0.5, 1.5, 1.5]])

_passed = 0
_total = 2
if _result.shape == _expected.shape:
    _passed += 1
    print(f"PASS: output shape {_result.shape} matches {_expected.shape}")
else:
    print(f"FAIL: output shape {_result.shape}, expected {_expected.shape}")

if np.allclose(_result, _expected):
    _passed += 1
    print(f"PASS: linear_layer matches expected values:\n{_result}")
else:
    print(f"FAIL: linear_layer returned:\n{_result}\nexpected:\n{_expected}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000120', 2, 'A layer''s full forward pass', 'easy', 'Write layer_forward(X, W, b, activation_fn) that computes a full layer''s output: apply the linear step (X @ W + b), then apply activation_fn to the result elementwise.', 'z = X @ W + b, then return activation_fn(z).', $py$import numpy as np

def layer_forward(X, W, b, activation_fn):
    # TODO: linear step followed by the given activation function
    pass
$py$, $py$def relu(z):
    return np.maximum(0, z)

X = np.array([[1.0, -1.0]])
W = np.array([[1.0, 1.0], [1.0, -1.0]])
b = np.array([0.0, 0.0])
# z = [1*1 + -1*1, 1*1 + -1*-1] = [0, 2]
_expected = np.array([[0.0, 2.0]])

_result = np.asarray(layer_forward(X, W, b, relu))

_passed = 0
_total = 2
if _result.shape == _expected.shape:
    _passed += 1
    print(f"PASS: output shape {_result.shape} correct")
else:
    print(f"FAIL: output shape {_result.shape}, expected {_expected.shape}")

if np.allclose(_result, _expected):
    _passed += 1
    print(f"PASS: layer_forward with relu gives {_result.tolist()}")
else:
    print(f"FAIL: layer_forward returned {_result.tolist()}, expected {_expected.tolist()}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000120', 3, 'Counting parameters', 'medium', 'Write count_parameters(layer_sizes) that takes a list like [n_in, n_hidden, n_out] describing a fully-connected network''s layer widths, and returns the total number of trainable numbers (all weights plus all biases) across every layer.', 'Between consecutive sizes a and b there''s a weights matrix a*b and a bias vector of length b -- sum (a*b + b) for every consecutive pair.', $py$import numpy as np

def count_parameters(layer_sizes):
    # TODO: total weight + bias count across all layers described by layer_sizes
    pass
$py$, $py$_passed = 0
_total = 3

# 2 -> 2 -> 1: W1 (2*2=4) + b1 (2) + W2 (2*1=2) + b2 (1) = 9
_r1 = count_parameters([2, 2, 1])
if _r1 == 9:
    _passed += 1
    print(f"PASS: count_parameters([2, 2, 1]) == 9")
else:
    print(f"FAIL: count_parameters([2, 2, 1]) returned {_r1!r}, expected 9")

# 3 -> 4 -> 2: (3*4+4) + (4*2+2) = 16 + 10 = 26
_r2 = count_parameters([3, 4, 2])
if _r2 == 26:
    _passed += 1
    print(f"PASS: count_parameters([3, 4, 2]) == 26")
else:
    print(f"FAIL: count_parameters([3, 4, 2]) returned {_r2!r}, expected 26")

# single layer 5 -> 1: 5*1 + 1 = 6
_r3 = count_parameters([5, 1])
if _r3 == 6:
    _passed += 1
    print(f"PASS: count_parameters([5, 1]) == 6")
else:
    print(f"FAIL: count_parameters([5, 1]) returned {_r3!r}, expected 6")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000120', 4, 'Two-layer forward pass', 'medium', 'Write two_layer_forward(X, W1, b1, W2, b2) that computes a full two-layer network''s forward pass, applying sigmoid activation after both the hidden layer and the output layer. Return the final output A2.', 'A1 = sigmoid(X @ W1 + b1), then A2 = sigmoid(A1 @ W2 + b2).', $py$import numpy as np

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

def two_layer_forward(X, W1, b1, W2, b2):
    # TODO: sigmoid(sigmoid(X @ W1 + b1) @ W2 + b2)
    pass
$py$, $py$X = np.array([[1.0, 0.0]])
W1 = np.array([[0.5, -0.5], [0.5, 0.5]])
b1 = np.array([0.0, 0.0])
W2 = np.array([[1.0], [1.0]])
b2 = np.array([0.0])

def _sigmoid(z):
    return 1 / (1 + np.exp(-z))

Z1 = X @ W1 + b1
A1 = _sigmoid(Z1)
Z2 = A1 @ W2 + b2
_expected = _sigmoid(Z2)

_result = np.asarray(two_layer_forward(X, W1, b1, W2, b2))

_passed = 0
_total = 2
if _result.shape == _expected.shape:
    _passed += 1
    print(f"PASS: output shape {_result.shape} correct")
else:
    print(f"FAIL: output shape {_result.shape}, expected {_expected.shape}")

if np.allclose(_result, _expected, atol=1e-8):
    _passed += 1
    print(f"PASS: two_layer_forward output {_result.tolist()} matches expected {_expected.tolist()}")
else:
    print(f"FAIL: two_layer_forward returned {_result.tolist()}, expected {_expected.tolist()}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000120', 5, 'Tracing shapes through a network', 'medium', 'Write check_shapes(X, W1, b1, W2, b2) that runs a two-layer forward pass (any activation, e.g. sigmoid) and returns a tuple of 4 shape tuples in order: (Z1.shape, A1.shape, Z2.shape, A2.shape).', 'Compute each intermediate array exactly like a normal forward pass, and just read off .shape from each one.', $py$import numpy as np

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

def check_shapes(X, W1, b1, W2, b2):
    # TODO: run the forward pass, return (Z1.shape, A1.shape, Z2.shape, A2.shape)
    pass
$py$, $py$X = np.random.default_rng(1).normal(size=(5, 3))   # 5 samples, 3 features
W1 = np.random.default_rng(2).normal(size=(3, 4))  # 3 -> 4 hidden units
b1 = np.zeros(4)
W2 = np.random.default_rng(3).normal(size=(4, 2))  # 4 -> 2 output units
b2 = np.zeros(2)

_result = check_shapes(X, W1, b1, W2, b2)
_expected = ((5, 4), (5, 4), (5, 2), (5, 2))

_passed = 0
_total = 1
if tuple(tuple(s) for s in _result) == _expected:
    _passed += 1
    print(f"PASS: shapes {_result} match expected {_expected}")
else:
    print(f"FAIL: shapes {_result}, expected {_expected}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000120', 6, 'Hand-built XOR network', 'hard', 'Using step activation on both layers, build the classic hand-derived 2-layer network that solves XOR exactly: hidden unit 1 computes OR(x1, x2), hidden unit 2 computes NAND(x1, x2), and the output computes AND(hidden1, hidden2). Write xor_forward(X) that runs this forward pass using step activation and fixed weights you choose (no training), and returns a 1D array of 0/1 predictions for every row of X.', 'OR: w=[1,1], b=-0.5. NAND: w=[-1,-1], b=1.5. AND (combining the two hidden outputs): w=[1,1], b=-1.5. Stack OR and NAND as the two columns of W1/b1, then AND as W2/b2.', $py$import numpy as np

def step(z):
    return (z >= 0).astype(int)

def xor_forward(X):
    # TODO: hand-built 2-layer network (OR and NAND hidden units, AND output)
    # that reproduces XOR exactly using step activation, no training involved
    pass
$py$, $py$X = np.array([[0.0, 0.0], [0.0, 1.0], [1.0, 0.0], [1.0, 1.0]])
_expected = np.array([0, 1, 1, 0])  # XOR truth table

_result = np.asarray(xor_forward(X)).ravel()

_passed = 0
_total = 2
if _result.shape == _expected.shape:
    _passed += 1
    print(f"PASS: output shape {_result.shape} matches {_expected.shape}")
else:
    print(f"FAIL: output shape {_result.shape}, expected {_expected.shape}")

if np.array_equal(_result, _expected):
    _passed += 1
    print(f"PASS: xor_forward reproduces XOR exactly: {_result.tolist()}")
else:
    print(f"FAIL: xor_forward returned {_result.tolist()}, expected {_expected.tolist()}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000120', 7, 'ReLU hidden layer, linear output', 'medium', 'Write regression_forward(X, W1, b1, W2, b2) for a small regression network: a ReLU hidden layer followed by a *linear* output layer (no activation on the output -- regression targets aren''t bounded to (0,1)).', 'A1 = relu(X @ W1 + b1), then the output is just A1 @ W2 + b2 with no activation applied.', $py$import numpy as np

def relu(z):
    return np.maximum(0, z)

def regression_forward(X, W1, b1, W2, b2):
    # TODO: ReLU hidden layer, then a plain linear output layer (no activation)
    pass
$py$, $py$X = np.array([[1.0, 2.0]])
W1 = np.array([[1.0, -1.0], [0.5, 2.0]])
b1 = np.array([0.0, -1.0])
W2 = np.array([[2.0], [3.0]])
b2 = np.array([1.0])

Z1 = X @ W1 + b1          # [1*1+2*0.5, 1*-1+2*2-1] = [2.0, 3.0]
A1 = np.maximum(0, Z1)    # [2.0, 3.0]
_expected = A1 @ W2 + b2  # [2*2+3*3+1] = [14.0]

_result = np.asarray(regression_forward(X, W1, b1, W2, b2))

_passed = 0
_total = 2
if _result.shape == _expected.shape:
    _passed += 1
    print(f"PASS: output shape {_result.shape} correct")
else:
    print(f"FAIL: output shape {_result.shape}, expected {_expected.shape}")

if np.allclose(_result, _expected):
    _passed += 1
    print(f"PASS: regression_forward gives {_result.tolist()}, matching expected {_expected.tolist()}")
else:
    print(f"FAIL: regression_forward returned {_result.tolist()}, expected {_expected.tolist()}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000120', 8, 'Vectorized batch matches per-sample loop', 'hard', 'Write forward_loop(X, W, b, activation_fn) that computes the SAME thing a vectorized layer forward pass would, but by looping over each row of X one at a time (no batch matrix multiply across the whole X at once -- compute each row''s output with a single-row dot product inside the loop) and stacking the results back into one array of shape (n_samples, n_units).', 'For each row x in X: activation_fn(x @ W + b) gives that row''s output (shape (n_units,)); collect all rows with np.array(...) or np.stack(...).', $py$import numpy as np

def forward_loop(X, W, b, activation_fn):
    # TODO: same result as activation_fn(X @ W + b), computed one row at a time
    pass
$py$, $py$def relu(z):
    return np.maximum(0, z)

rng = np.random.default_rng(42)
X = rng.normal(size=(6, 3))
W = rng.normal(size=(3, 5))
b = rng.normal(size=(5,))

_expected = relu(X @ W + b)
_result = np.asarray(forward_loop(X, W, b, relu))

_passed = 0
_total = 2
if _result.shape == _expected.shape:
    _passed += 1
    print(f"PASS: output shape {_result.shape} matches vectorized shape {_expected.shape}")
else:
    print(f"FAIL: output shape {_result.shape}, expected {_expected.shape}")

if np.allclose(_result, _expected, atol=1e-8):
    _passed += 1
    print("PASS: row-by-row loop matches the vectorized batch computation")
else:
    print(f"FAIL: loop result differs from vectorized result by up to {np.max(np.abs(_result - _expected))}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000120', 9, 'Multi-class forward pass', 'hard', 'Write classify_forward(X, W1, b1, W2, b2) for a network with a ReLU hidden layer and a softmax output layer for 3-class classification. Return the (n_samples, 3) array of class probabilities -- each row must sum to 1.', 'A1 = relu(X @ W1 + b1); Z2 = A1 @ W2 + b2; then apply a numerically-stable row-wise softmax (subtract each row''s max before exponentiating) to Z2.', $py$import numpy as np

def relu(z):
    return np.maximum(0, z)

def classify_forward(X, W1, b1, W2, b2):
    # TODO: ReLU hidden layer, then row-wise softmax output over 3 classes
    pass
$py$, $py$rng = np.random.default_rng(7)
X = rng.normal(size=(4, 2))
W1 = rng.normal(size=(2, 5))
b1 = np.zeros(5)
W2 = rng.normal(size=(5, 3))
b2 = np.zeros(3)

_result = np.asarray(classify_forward(X, W1, b1, W2, b2))

_passed = 0
_total = 3

if _result.shape == (4, 3):
    _passed += 1
    print(f"PASS: output shape {_result.shape} correct for 4 samples, 3 classes")
else:
    print(f"FAIL: output shape {_result.shape}, expected (4, 3)")

if np.all(_result >= 0):
    _passed += 1
    print("PASS: all probabilities are non-negative")
else:
    print(f"FAIL: found negative values in {_result}")

_row_sums = _result.sum(axis=1)
if np.allclose(_row_sums, 1.0, atol=1e-6):
    _passed += 1
    print(f"PASS: every row sums to 1: {_row_sums.tolist()}")
else:
    print(f"FAIL: row sums were {_row_sums.tolist()}, expected all 1.0")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000121', 1, 'Mean squared error', 'easy', 'Write mse(y_true, y_pred) that returns the mean squared error between two same-shaped NumPy arrays: the average of (y_true - y_pred) ** 2.', 'np.mean((y_true - y_pred) ** 2) does exactly this.', $py$import numpy as np

def mse(y_true, y_pred):
    # TODO: mean squared error
    pass
$py$, $py$_cases = [
    (np.array([3.0]), np.array([2.5]), 0.25),
    (np.array([1.0, 2.0, 3.0]), np.array([1.0, 2.0, 3.0]), 0.0),
    (np.array([0.0, 0.0]), np.array([1.0, 1.0]), 1.0),
]
_passed = 0
for _yt, _yp, _expected in _cases:
    _actual = mse(_yt, _yp)
    if abs(_actual - _expected) < 1e-8:
        _passed += 1
        print(f"PASS: mse({_yt.tolist()}, {_yp.tolist()}) ~= {_expected}")
    else:
        print(f"FAIL: mse({_yt.tolist()}, {_yp.tolist()}) returned {_actual!r}, expected {_expected}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000121', 2, 'Mean absolute error', 'easy', 'Write mae(y_true, y_pred) that returns the mean absolute error: the average of |y_true - y_pred|, an alternative regression loss that penalizes large and small errors more proportionally than MSE.', 'np.mean(np.abs(y_true - y_pred)).', $py$import numpy as np

def mae(y_true, y_pred):
    # TODO: mean absolute error
    pass
$py$, $py$_cases = [
    (np.array([3.0]), np.array([2.5]), 0.5),
    (np.array([1.0, 2.0]), np.array([1.0, 2.0]), 0.0),
    (np.array([0.0, 5.0]), np.array([2.0, 1.0]), 3.0),
]
_passed = 0
for _yt, _yp, _expected in _cases:
    _actual = mae(_yt, _yp)
    if abs(_actual - _expected) < 1e-8:
        _passed += 1
        print(f"PASS: mae({_yt.tolist()}, {_yp.tolist()}) ~= {_expected}")
    else:
        print(f"FAIL: mae({_yt.tolist()}, {_yp.tolist()}) returned {_actual!r}, expected {_expected}")
print(f"{_passed}/{len(_cases)} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000121', 3, 'Binary cross-entropy', 'medium', 'Write binary_cross_entropy(y_true, y_pred, eps=1e-12) for arrays of 0/1 labels and predicted probabilities. Clip y_pred to [eps, 1-eps] first, then return -mean(y_true * log(y_pred) + (1 - y_true) * log(1 - y_pred)).', 'y_pred = np.clip(y_pred, eps, 1 - eps) first, then the formula is a direct translation into NumPy.', $py$import numpy as np

def binary_cross_entropy(y_true, y_pred, eps=1e-12):
    # TODO: clip y_pred, then compute mean binary cross-entropy
    pass
$py$, $py$_passed = 0
_total = 3

_y_true = np.array([1.0])
_y_pred = np.array([0.9])
_expected = -np.log(0.9)
_actual = binary_cross_entropy(_y_true, _y_pred)
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: binary_cross_entropy([1.0], [0.9]) ~= {_expected:.6f}")
else:
    print(f"FAIL: got {_actual!r}, expected ~{_expected:.6f}")

_y_true2 = np.array([1.0, 0.0])
_y_pred2 = np.array([0.5, 0.5])
_expected2 = -np.log(0.5)
_actual2 = binary_cross_entropy(_y_true2, _y_pred2)
if abs(_actual2 - _expected2) < 1e-6:
    _passed += 1
    print(f"PASS: binary_cross_entropy([1,0], [0.5,0.5]) ~= {_expected2:.6f}")
else:
    print(f"FAIL: got {_actual2!r}, expected ~{_expected2:.6f}")

_worse = binary_cross_entropy(np.array([1.0]), np.array([0.01]))
_better = binary_cross_entropy(np.array([1.0]), np.array([0.99]))
if _worse > _better:
    _passed += 1
    print(f"PASS: a confident wrong prediction ({_worse:.4f}) costs more than a confident right one ({_better:.4f})")
else:
    print(f"FAIL: expected worse={_worse} > better={_better}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000121', 4, 'Categorical cross-entropy', 'medium', 'Write categorical_cross_entropy(y_true, y_pred, eps=1e-12) for one-hot-encoded y_true and predicted probability rows y_pred, both shape (n_samples, n_classes). Clip y_pred first, then return the mean over samples of -sum(y_true * log(y_pred)) per row.', 'Clip y_pred with np.clip, elementwise-multiply by y_true, sum along axis=1 (one value per sample), negate, then take the mean across samples.', $py$import numpy as np

def categorical_cross_entropy(y_true, y_pred, eps=1e-12):
    # TODO: clip y_pred, then mean one-hot cross-entropy over samples
    pass
$py$, $py$_passed = 0
_total = 3

_y_true = np.array([[1.0, 0.0, 0.0]])
_y_pred = np.array([[0.7, 0.2, 0.1]])
_expected = -np.log(0.7)
_actual = categorical_cross_entropy(_y_true, _y_pred)
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: single-sample loss ~= {_expected:.6f}")
else:
    print(f"FAIL: got {_actual!r}, expected ~{_expected:.6f}")

_y_true2 = np.array([[1.0, 0.0], [0.0, 1.0]])
_y_pred2 = np.array([[0.5, 0.5], [0.5, 0.5]])
_expected2 = -np.log(0.5)
_actual2 = categorical_cross_entropy(_y_true2, _y_pred2)
if abs(_actual2 - _expected2) < 1e-6:
    _passed += 1
    print(f"PASS: batch loss averages correctly: {_actual2:.6f}")
else:
    print(f"FAIL: got {_actual2!r}, expected ~{_expected2:.6f}")

_confident_right = categorical_cross_entropy(np.array([[1.0, 0.0]]), np.array([[0.99, 0.01]]))
_confident_wrong = categorical_cross_entropy(np.array([[1.0, 0.0]]), np.array([[0.01, 0.99]]))
if _confident_wrong > _confident_right:
    _passed += 1
    print(f"PASS: confident wrong ({_confident_wrong:.4f}) costs more than confident right ({_confident_right:.4f})")
else:
    print(f"FAIL: expected confident_wrong > confident_right")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000121', 5, 'Gradient of MSE', 'medium', 'Write mse_gradient(y_true, y_pred) that returns dL/dy_pred for the mean squared error loss, as an array the same shape as y_pred. For L = mean((y_true - y_pred) ** 2) over n elements, the gradient is 2 * (y_pred - y_true) / n.', 'n = y_pred.size (or len(y_pred) for 1D); return 2 * (y_pred - y_true) / n.', $py$import numpy as np

def mse_gradient(y_true, y_pred):
    # TODO: return d(mse)/d(y_pred), same shape as y_pred
    pass
$py$, $py$_passed = 0
_total = 2

_y_true = np.array([1.0, 2.0, 3.0])
_y_pred = np.array([1.5, 2.5, 2.0])
_expected = 2 * (_y_pred - _y_true) / 3
_actual = np.asarray(mse_gradient(_y_true, _y_pred))
if np.allclose(_actual, _expected, atol=1e-8):
    _passed += 1
    print(f"PASS: mse_gradient == {_actual.tolist()}")
else:
    print(f"FAIL: mse_gradient returned {_actual.tolist()}, expected {_expected.tolist()}")

# Numerical gradient check
_eps = 1e-6
_num_grad = np.zeros_like(_y_pred)
for i in range(len(_y_pred)):
    _yp_plus = _y_pred.copy(); _yp_plus[i] += _eps
    _yp_minus = _y_pred.copy(); _yp_minus[i] -= _eps
    _loss_plus = np.mean((_y_true - _yp_plus) ** 2)
    _loss_minus = np.mean((_y_true - _yp_minus) ** 2)
    _num_grad[i] = (_loss_plus - _loss_minus) / (2 * _eps)

if np.allclose(_actual, _num_grad, atol=1e-4):
    _passed += 1
    print(f"PASS: matches numerical (finite-difference) gradient: {_num_grad.tolist()}")
else:
    print(f"FAIL: analytic {_actual.tolist()} vs numerical {_num_grad.tolist()}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000121', 6, 'Gradient of binary cross-entropy', 'medium', 'Write bce_gradient(y_true, y_pred, eps=1e-12) that returns dL/dy_pred for the mean binary cross-entropy loss: clip y_pred to [eps, 1-eps], then return (y_pred - y_true) / (y_pred * (1 - y_pred) * n), where n is the number of elements.', 'Clip first (division by y_pred*(1-y_pred) is undefined at the boundaries), then it''s a direct formula.', $py$import numpy as np

def bce_gradient(y_true, y_pred, eps=1e-12):
    # TODO: clip y_pred, then return d(mean BCE)/d(y_pred)
    pass
$py$, $py$_passed = 0
_total = 2

_y_true = np.array([1.0, 0.0])
_y_pred = np.array([0.8, 0.3])
_clipped = np.clip(_y_pred, 1e-12, 1 - 1e-12)
_expected = (_clipped - _y_true) / (_clipped * (1 - _clipped) * 2)
_actual = np.asarray(bce_gradient(_y_true, _y_pred))
if np.allclose(_actual, _expected, atol=1e-6):
    _passed += 1
    print(f"PASS: bce_gradient == {_actual.tolist()}")
else:
    print(f"FAIL: bce_gradient returned {_actual.tolist()}, expected {_expected.tolist()}")

_eps = 1e-6
_num_grad = np.zeros_like(_y_pred)
for i in range(len(_y_pred)):
    _yp_plus = _y_pred.copy(); _yp_plus[i] += _eps
    _yp_minus = _y_pred.copy(); _yp_minus[i] -= _eps
    _cp = np.clip(_yp_plus, 1e-12, 1 - 1e-12)
    _cm = np.clip(_yp_minus, 1e-12, 1 - 1e-12)
    _loss_plus = -np.mean(_y_true * np.log(_cp) + (1 - _y_true) * np.log(1 - _cp))
    _loss_minus = -np.mean(_y_true * np.log(_cm) + (1 - _y_true) * np.log(1 - _cm))
    _num_grad[i] = (_loss_plus - _loss_minus) / (2 * _eps)

if np.allclose(_actual, _num_grad, atol=1e-3):
    _passed += 1
    print(f"PASS: matches numerical gradient: {_num_grad.tolist()}")
else:
    print(f"FAIL: analytic {_actual.tolist()} vs numerical {_num_grad.tolist()}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000121', 7, 'Is the loss actually decreasing?', 'medium', 'Write loss_decreased(loss_history, min_relative_drop=0.5) that takes a list of per-epoch loss values and returns True if the final loss is at least min_relative_drop (a fraction, e.g. 0.5 = 50%) lower than the first loss, else False.', 'relative_drop = (loss_history[0] - loss_history[-1]) / loss_history[0]; return relative_drop >= min_relative_drop.', $py$import numpy as np

def loss_decreased(loss_history, min_relative_drop=0.5):
    # TODO: True if the loss fell by at least min_relative_drop (a fraction of the starting loss)
    pass
$py$, $py$_passed = 0
_total = 3

if bool(loss_decreased([1.0, 0.6, 0.3, 0.1])):
    _passed += 1
    print("PASS: a loss falling from 1.0 to 0.1 counts as decreased")
else:
    print("FAIL: expected True for [1.0, 0.6, 0.3, 0.1]")

if not bool(loss_decreased([1.0, 0.95, 0.9, 0.8])):
    _passed += 1
    print("PASS: a loss only falling from 1.0 to 0.8 does not meet the 50% bar")
else:
    print("FAIL: expected False for [1.0, 0.95, 0.9, 0.8]")

if not bool(loss_decreased([0.5, 0.5, 0.6, 0.7])):
    _passed += 1
    print("PASS: a rising loss is correctly flagged as not decreased")
else:
    print("FAIL: expected False for a rising loss history")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000121', 8, 'Loss ranks predictions correctly', 'hard', 'Write loss_ranks_predictions_correctly(y_true, close_pred, far_pred) that computes binary cross-entropy for both close_pred and far_pred against y_true, and returns True only if the loss for close_pred (which should be nearer the true labels) is strictly lower than the loss for far_pred.', 'Reuse the binary cross-entropy formula (with clipping) on each set of predictions, then compare the two resulting numbers.', $py$import numpy as np

def _bce(y_true, y_pred, eps=1e-12):
    y_pred = np.clip(y_pred, eps, 1 - eps)
    return -np.mean(y_true * np.log(y_pred) + (1 - y_true) * np.log(1 - y_pred))

def loss_ranks_predictions_correctly(y_true, close_pred, far_pred):
    # TODO: return True if BCE(y_true, close_pred) < BCE(y_true, far_pred)
    pass
$py$, $py$_passed = 0
_total = 2

_y_true = np.array([1.0, 0.0, 1.0, 0.0])
_close = np.array([0.9, 0.1, 0.8, 0.2])
_far = np.array([0.5, 0.5, 0.4, 0.6])

if bool(loss_ranks_predictions_correctly(_y_true, _close, _far)):
    _passed += 1
    print("PASS: predictions closer to the truth are correctly ranked as lower-loss")
else:
    print("FAIL: expected True when close_pred is clearly better than far_pred")

_worse = np.array([0.1, 0.9, 0.2, 0.8])  # confidently wrong
if bool(loss_ranks_predictions_correctly(_y_true, _close, _worse)):
    _passed += 1
    print("PASS: a confidently wrong set of predictions scores worse than a good one")
else:
    print("FAIL: expected True when far_pred is confidently wrong")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000121', 9, 'Cross-entropy at the boundaries', 'hard', 'Write safe_bce(y_true, y_pred, eps=1e-12) -- a binary cross-entropy implementation that must never return nan or inf, even when y_pred contains exactly 0.0 or 1.0.', 'np.clip(y_pred, eps, 1 - eps) before ever calling np.log keeps every input to log() strictly inside (0, 1).', $py$import numpy as np

def safe_bce(y_true, y_pred, eps=1e-12):
    # TODO: binary cross-entropy that never produces nan/inf, even at y_pred == 0 or 1
    pass
$py$, $py$_passed = 0
_total = 3

_y_true = np.array([1.0, 0.0])
_y_pred = np.array([0.0, 1.0])  # worst possible predictions, hits the exact boundary
_result = safe_bce(_y_true, _y_pred)

if not (np.isnan(_result) or np.isinf(_result)):
    _passed += 1
    print(f"PASS: safe_bce at the boundary is finite: {_result}")
else:
    print(f"FAIL: safe_bce returned {_result!r}, expected a finite number")

if _result > 10:
    _passed += 1
    print(f"PASS: the boundary case still produces a very large (but finite) loss: {_result:.2f}")
else:
    print(f"FAIL: expected a very large loss for maximally wrong predictions, got {_result}")

_normal = safe_bce(np.array([1.0]), np.array([0.9]))
_expected_normal = -np.log(0.9)
if abs(_normal - _expected_normal) < 1e-6:
    _passed += 1
    print(f"PASS: ordinary case still matches the standard formula: {_normal:.6f}")
else:
    print(f"FAIL: got {_normal!r}, expected ~{_expected_normal:.6f}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000122', 1, 'Chain rule for a single neuron', 'easy', 'Write chain_rule_single_neuron(x, w, b, y) that returns (dL_dw, dL_db) for a single neuron: z = w*x + b, a = sigmoid(z), L = (a - y) ** 2. Derive both gradients by hand and implement the formulas (do not use finite differences here).', 'dL/da = 2*(a-y); da/dz = a*(1-a); dz/dw = x and dz/db = 1. Multiply the chain for each parameter.', $py$import numpy as np

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

def chain_rule_single_neuron(x, w, b, y):
    # TODO: return (dL_dw, dL_db) using the chain rule
    pass
$py$, $py$def _sigmoid(z):
    return 1 / (1 + np.exp(-z))

def _loss(x, w, b, y):
    a = _sigmoid(w * x + b)
    return (a - y) ** 2

_passed = 0
_total = 2
_cases = [(2.0, 0.5, -0.1, 1.0), (-1.0, 0.3, 0.2, 0.0)]

for _x, _w, _b, _y in _cases:
    _dw, _db = chain_rule_single_neuron(_x, _w, _b, _y)
    _eps = 1e-6
    _num_dw = (_loss(_x, _w + _eps, _b, _y) - _loss(_x, _w - _eps, _b, _y)) / (2 * _eps)
    _num_db = (_loss(_x, _w, _b + _eps, _y) - _loss(_x, _w, _b - _eps, _y)) / (2 * _eps)
    _ok = abs(_dw - _num_dw) < 1e-4 and abs(_db - _num_db) < 1e-4
    if _ok:
        _passed += 1
        print(f"PASS: x={_x}, w={_w}, b={_b}, y={_y}: (dL_dw={_dw:.6f}, dL_db={_db:.6f}) matches finite-difference estimate")
    else:
        print(f"FAIL: x={_x}, w={_w}, b={_b}, y={_y}: got ({_dw}, {_db}), expected ~({_num_dw:.6f}, {_num_db:.6f})")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000122', 2, 'Where backprop starts: the output gradient', 'easy', 'Write mse_output_gradient(y_true, y_pred) that returns dL/dy_pred for mean squared error -- the very first gradient backprop computes, before it starts working backward through any layers. For n elements, dL/dy_pred = 2 * (y_pred - y_true) / n.', 'This is the same formula as the MSE gradient from the loss functions concept -- backprop always starts from here.', $py$import numpy as np

def mse_output_gradient(y_true, y_pred):
    # TODO: dL/dy_pred for mean squared error
    pass
$py$, $py$_y_true = np.array([1.0, 0.0, 1.0])
_y_pred = np.array([0.8, 0.3, 0.6])
_expected = 2 * (_y_pred - _y_true) / 3
_actual = np.asarray(mse_output_gradient(_y_true, _y_pred))

_passed = 0
_total = 1
if np.allclose(_actual, _expected, atol=1e-8):
    _passed += 1
    print(f"PASS: mse_output_gradient == {_actual.tolist()}")
else:
    print(f"FAIL: got {_actual.tolist()}, expected {_expected.tolist()}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000122', 3, 'Chaining a gradient through an activation', 'medium', 'Write gradient_through_sigmoid(dL_da, a) that takes the upstream gradient dL/da and the sigmoid activation''s own *output* a, and returns dL/dz = dL_da * a * (1 - a) -- one link in the chain rule.', 'The local derivative of sigmoid, expressed in terms of its own output a, is a * (1 - a). Multiply that by whatever upstream gradient was handed to you.', $py$import numpy as np

def gradient_through_sigmoid(dL_da, a):
    # TODO: return dL_da * a * (1 - a)
    pass
$py$, $py$_passed = 0
_total = 2

_r1 = gradient_through_sigmoid(1.0, 0.5)
if abs(_r1 - 0.25) < 1e-8:
    _passed += 1
    print(f"PASS: gradient_through_sigmoid(1.0, 0.5) == 0.25")
else:
    print(f"FAIL: got {_r1!r}, expected 0.25")

_r2 = np.asarray(gradient_through_sigmoid(np.array([2.0, -1.0]), np.array([0.9, 0.1])))
_expected2 = np.array([2.0, -1.0]) * np.array([0.9, 0.1]) * (1 - np.array([0.9, 0.1]))
if np.allclose(_r2, _expected2, atol=1e-8):
    _passed += 1
    print(f"PASS: vectorized case matches: {_r2.tolist()}")
else:
    print(f"FAIL: got {_r2.tolist()}, expected {_expected2.tolist()}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000122', 4, 'Chaining a gradient through a linear step', 'medium', 'Write gradient_through_linear(dL_dz, x) for a single scalar neuron z = w*x + b, returning (dL_dw, dL_db) given the upstream gradient dL/dz. Recall dz/dw = x and dz/db = 1.', 'dL_dw = dL_dz * x; dL_db = dL_dz (the bias gradient is just the upstream gradient, unscaled).', $py$import numpy as np

def gradient_through_linear(dL_dz, x):
    # TODO: return (dL_dw, dL_db)
    pass
$py$, $py$_passed = 0
_total = 2

_dw, _db = gradient_through_linear(2.0, 3.0)
if abs(_dw - 6.0) < 1e-8 and abs(_db - 2.0) < 1e-8:
    _passed += 1
    print(f"PASS: gradient_through_linear(2.0, 3.0) == ({_dw}, {_db})")
else:
    print(f"FAIL: got ({_dw}, {_db}), expected (6.0, 2.0)")

_dw2, _db2 = gradient_through_linear(-1.5, 4.0)
if abs(_dw2 - (-6.0)) < 1e-8 and abs(_db2 - (-1.5)) < 1e-8:
    _passed += 1
    print(f"PASS: gradient_through_linear(-1.5, 4.0) == ({_dw2}, {_db2})")
else:
    print(f"FAIL: got ({_dw2}, {_db2}), expected (-6.0, -1.5)")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000122', 5, 'A four-link chain', 'medium', 'Write two_neuron_chain(x, w1, b1, w2, b2, y) for a chain of two scalar neurons: z1 = w1*x + b1, a1 = sigmoid(z1), z2 = w2*a1 + b2, a2 = sigmoid(z2), L = (a2 - y) ** 2. Return dL/dw1, derived by chaining all four links: dL/da2 -> da2/dz2 -> dz2/da1 -> da1/dz1 -> dz1/dw1.', 'dz2/da1 is w2 (since z2 = w2*a1 + b2) -- that''s the one link that''s easy to forget when chaining back two full neurons instead of one.', $py$import numpy as np

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

def two_neuron_chain(x, w1, b1, w2, b2, y):
    # TODO: dL/dw1, chaining through both neurons
    pass
$py$, $py$def _sigmoid(z):
    return 1 / (1 + np.exp(-z))

def _loss(x, w1, b1, w2, b2, y):
    a1 = _sigmoid(w1 * x + b1)
    a2 = _sigmoid(w2 * a1 + b2)
    return (a2 - y) ** 2

_passed = 0
_total = 2
_cases = [(1.0, 0.5, 0.1, -0.3, 0.2, 1.0), (-0.5, 0.2, -0.1, 0.4, 0.3, 0.0)]

for _x, _w1, _b1, _w2, _b2, _y in _cases:
    _dw1 = two_neuron_chain(_x, _w1, _b1, _w2, _b2, _y)
    _eps = 1e-6
    _num = (_loss(_x, _w1 + _eps, _b1, _w2, _b2, _y) - _loss(_x, _w1 - _eps, _b1, _w2, _b2, _y)) / (2 * _eps)
    if abs(_dw1 - _num) < 1e-4:
        _passed += 1
        print(f"PASS: dL/dw1={_dw1:.6f} matches finite-difference estimate {_num:.6f}")
    else:
        print(f"FAIL: dL/dw1={_dw1!r}, expected ~{_num:.6f}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000122', 6, 'Build your own gradient checker', 'medium', 'Write numerical_gradient_check(f, grad_f, x, eps=1e-5, tol=1e-4) for scalar functions: compute the finite-difference estimate (f(x+eps) - f(x-eps)) / (2*eps), compare it to grad_f(x), and return True if they''re within tol of each other, else False.', 'The finite-difference formula is symmetric (uses both x+eps and x-eps) for better accuracy than a one-sided difference.', $py$import numpy as np

def numerical_gradient_check(f, grad_f, x, eps=1e-5, tol=1e-4):
    # TODO: compare grad_f(x) to a finite-difference estimate of f's derivative at x
    pass
$py$, $py$_passed = 0
_total = 3

# f(x) = x^2, f'(x) = 2x -- correct gradient
if bool(numerical_gradient_check(lambda x: x ** 2, lambda x: 2 * x, 3.0)):
    _passed += 1
    print("PASS: correct gradient (2x for x^2) is accepted")
else:
    print("FAIL: expected True for the correct gradient of x^2")

# f(x) = sin(x), f'(x) = cos(x) -- correct gradient
if bool(numerical_gradient_check(np.sin, np.cos, 1.0)):
    _passed += 1
    print("PASS: correct gradient (cos for sin) is accepted")
else:
    print("FAIL: expected True for the correct gradient of sin(x)")

# Deliberately wrong gradient should be rejected
if not bool(numerical_gradient_check(lambda x: x ** 2, lambda x: 3 * x, 3.0)):
    _passed += 1
    print("PASS: an incorrect gradient formula (3x instead of 2x) is correctly rejected")
else:
    print("FAIL: expected False for a deliberately wrong gradient")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000122', 7, 'Bias gradient for a batch', 'medium', 'Write bias_gradient_batch(dL_dz) that computes a layer''s bias gradient given the upstream gradient dL_dz for a whole batch, shape (n_samples, n_units). Since every sample uses the same bias, average the upstream gradient over the batch (axis 0), returning an array of shape (n_units,).', 'np.mean(dL_dz, axis=0) averages across samples while keeping one value per unit.', $py$import numpy as np

def bias_gradient_batch(dL_dz):
    # TODO: mean of dL_dz over the sample axis (axis=0)
    pass
$py$, $py$dL_dz = np.array([[1.0, 2.0], [3.0, 4.0], [5.0, 0.0]])
_expected = np.array([3.0, 2.0])
_actual = np.asarray(bias_gradient_batch(dL_dz))

_passed = 0
_total = 2
if _actual.shape == (2,):
    _passed += 1
    print(f"PASS: output shape {_actual.shape} correct")
else:
    print(f"FAIL: output shape {_actual.shape}, expected (2,)")

if np.allclose(_actual, _expected):
    _passed += 1
    print(f"PASS: bias_gradient_batch == {_actual.tolist()}")
else:
    print(f"FAIL: got {_actual.tolist()}, expected {_expected.tolist()}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000122', 8, 'Weight gradient for a batch', 'hard', 'Write weight_gradient_batch(X, dL_dz) that computes a layer''s weight gradient given its inputs X (shape (n_samples, n_in)) and the upstream gradient dL_dz (shape (n_samples, n_out)). Return dL/dW = X.T @ dL_dz / n_samples, shape (n_in, n_out).', 'X.T @ dL_dz sums each weight''s contribution across every sample in the batch; dividing by n_samples turns that sum into a mean, matching a mean-based loss.', $py$import numpy as np

def weight_gradient_batch(X, dL_dz):
    # TODO: return X.T @ dL_dz / n_samples
    pass
$py$, $py$X = np.array([[1.0, 2.0], [3.0, 1.0]])
dL_dz = np.array([[1.0], [0.5]])
_expected = X.T @ dL_dz / 2

_actual = np.asarray(weight_gradient_batch(X, dL_dz))

_passed = 0
_total = 2
if _actual.shape == (2, 1):
    _passed += 1
    print(f"PASS: output shape {_actual.shape} correct")
else:
    print(f"FAIL: output shape {_actual.shape}, expected (2, 1)")

if np.allclose(_actual, _expected):
    _passed += 1
    print(f"PASS: weight_gradient_batch ==\n{_actual}")
else:
    print(f"FAIL: got\n{_actual}\nexpected\n{_expected}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000122', 9, 'Full manual backprop for a tiny network', 'hard', 'Write tiny_network_gradients(x, W1, b1, W2, b2, y) for a scalar-input, 1-hidden-unit, 1-output network: z1 = W1*x + b1, a1 = sigmoid(z1), z2 = W2*a1 + b2, a2 = sigmoid(z2), L = (a2 - y) ** 2. Derive and return all four gradients as a tuple (dL_dW1, dL_db1, dL_dW2, dL_db2).', 'Work backward: dL/da2, then da2/dz2 (gives dL/dz2), then dz2/dW2 and dz2/db2 for the output layer, then dz2/da1 = W2 to keep chaining into the hidden layer''s da1/dz1, dz1/dW1, dz1/db1.', $py$import numpy as np

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

def tiny_network_gradients(x, W1, b1, W2, b2, y):
    # TODO: return (dL_dW1, dL_db1, dL_dW2, dL_db2) for the tiny 2-neuron chain
    pass
$py$, $py$def _sigmoid(z):
    return 1 / (1 + np.exp(-z))

def _loss(x, W1, b1, W2, b2, y):
    a1 = _sigmoid(W1 * x + b1)
    a2 = _sigmoid(W2 * a1 + b2)
    return (a2 - y) ** 2

_passed = 0
_total = 4
_x, _W1, _b1, _W2, _b2, _y = 1.5, 0.4, -0.2, 0.7, 0.1, 1.0

_grads = tiny_network_gradients(_x, _W1, _b1, _W2, _b2, _y)
_names = ["W1", "b1", "W2", "b2"]
_params = [_W1, _b1, _W2, _b2]
_eps = 1e-6

for i, _name in enumerate(_names):
    _perturbed_plus = list(_params); _perturbed_plus[i] += _eps
    _perturbed_minus = list(_params); _perturbed_minus[i] -= _eps
    _num = (_loss(_x, *_perturbed_plus, _y) - _loss(_x, *_perturbed_minus, _y)) / (2 * _eps)
    _analytic = _grads[i]
    if abs(_analytic - _num) < 1e-4:
        _passed += 1
        print(f"PASS: dL/d{_name} = {_analytic:.6f} matches finite-difference estimate {_num:.6f}")
    else:
        print(f"FAIL: dL/d{_name} = {_analytic!r}, expected ~{_num:.6f}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000123', 1, 'Initializing a network''s weights', 'easy', 'Write initialize_weights(n_in, n_hidden, n_out, seed=42) that seeds NumPy''s random generator with `seed`, then returns (W1, b1, W2, b2): W1 shape (n_in, n_hidden) and W2 shape (n_hidden, n_out) drawn from np.random.randn, with b1 and b2 initialized to zeros of the appropriate shape.', 'Call np.random.seed(seed) first, then np.random.randn(n_in, n_hidden) for W1 and np.random.randn(n_hidden, n_out) for W2, in that order (order matters for reproducibility).', $py$import numpy as np

def initialize_weights(n_in, n_hidden, n_out, seed=42):
    # TODO: seed the RNG, then return (W1, b1, W2, b2)
    pass
$py$, $py$_passed = 0
_total = 4

W1, b1, W2, b2 = initialize_weights(2, 4, 1, seed=42)

if W1.shape == (2, 4) and W2.shape == (4, 1):
    _passed += 1
    print(f"PASS: W1.shape={W1.shape}, W2.shape={W2.shape}")
else:
    print(f"FAIL: W1.shape={W1.shape}, W2.shape={W2.shape}, expected (2,4) and (4,1)")

if b1.shape == (4,) and b2.shape == (1,):
    _passed += 1
    print(f"PASS: b1.shape={b1.shape}, b2.shape={b2.shape}")
else:
    print(f"FAIL: b1.shape={b1.shape}, b2.shape={b2.shape}, expected (4,) and (1,)")

if np.allclose(b1, 0) and np.allclose(b2, 0):
    _passed += 1
    print("PASS: biases initialized to zero")
else:
    print(f"FAIL: expected zero biases, got b1={b1}, b2={b2}")

W1_again, _, W2_again, _ = initialize_weights(2, 4, 1, seed=42)
if np.array_equal(W1, W1_again) and np.array_equal(W2, W2_again):
    _passed += 1
    print("PASS: same seed reproduces identical weights")
else:
    print("FAIL: same seed produced different weights on a second call")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000123', 2, 'Forward pass with a cache', 'medium', 'Write forward_with_cache(X, W1, b1, W2, b2) for a 2-layer sigmoid-sigmoid network, returning all four intermediate arrays as a tuple (Z1, A1, Z2, A2) -- backward propagation will need every one of them.', 'Z1 = X @ W1 + b1; A1 = sigmoid(Z1); Z2 = A1 @ W2 + b2; A2 = sigmoid(Z2). Return all four, not just A2.', $py$import numpy as np

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

def forward_with_cache(X, W1, b1, W2, b2):
    # TODO: return (Z1, A1, Z2, A2)
    pass
$py$, $py$X = np.array([[1.0, 0.0], [0.0, 1.0]])
W1 = np.array([[0.5, -0.5], [0.3, 0.2]])
b1 = np.array([0.0, 0.1])
W2 = np.array([[1.0], [1.0]])
b2 = np.array([0.0])

Z1, A1, Z2, A2 = forward_with_cache(X, W1, b1, W2, b2)

_passed = 0
_total = 3

_shapes_ok = Z1.shape == (2, 2) and A1.shape == (2, 2) and Z2.shape == (2, 1) and A2.shape == (2, 1)
if _shapes_ok:
    _passed += 1
    print(f"PASS: shapes correct: Z1={Z1.shape}, A1={A1.shape}, Z2={Z2.shape}, A2={A2.shape}")
else:
    print(f"FAIL: shapes were Z1={Z1.shape}, A1={A1.shape}, Z2={Z2.shape}, A2={A2.shape}")

if np.all((A1 > 0) & (A1 < 1)) and np.all((A2 > 0) & (A2 < 1)):
    _passed += 1
    print("PASS: sigmoid outputs are all strictly between 0 and 1")
else:
    print(f"FAIL: expected all activations in (0, 1); A1={A1}, A2={A2}")

_expected_Z1 = X @ W1 + b1
if np.allclose(Z1, _expected_Z1):
    _passed += 1
    print(f"PASS: Z1 matches expected pre-activation values")
else:
    print(f"FAIL: Z1={Z1}, expected {_expected_Z1}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000123', 3, 'Loss and the output gradient', 'medium', 'Write compute_loss_and_output_grad(y, A2, eps=1e-12) that clips A2 to [eps, 1-eps], computes the mean binary cross-entropy loss, and returns (loss, dA2) where dA2 = (A2_clipped - y) / (A2_clipped * (1 - A2_clipped) * n) is the gradient of that loss with respect to A2.', 'n = y.shape[0]. This is the same pair of formulas as binary_cross_entropy and bce_gradient from the loss functions concept, just returned together.', $py$import numpy as np

def compute_loss_and_output_grad(y, A2, eps=1e-12):
    # TODO: return (loss, dA2)
    pass
$py$, $py$y = np.array([[1.0], [0.0]])
A2 = np.array([[0.9], [0.2]])

loss, dA2 = compute_loss_and_output_grad(y, A2)

_A2c = np.clip(A2, 1e-12, 1 - 1e-12)
_expected_loss = -np.mean(y * np.log(_A2c) + (1 - y) * np.log(1 - _A2c))
_expected_dA2 = (_A2c - y) / (_A2c * (1 - _A2c) * 2)

_passed = 0
_total = 2

if abs(loss - _expected_loss) < 1e-8:
    _passed += 1
    print(f"PASS: loss={loss:.6f} matches expected {_expected_loss:.6f}")
else:
    print(f"FAIL: loss={loss!r}, expected {_expected_loss:.6f}")

if np.allclose(dA2, _expected_dA2, atol=1e-6):
    _passed += 1
    print(f"PASS: dA2={np.asarray(dA2).ravel().tolist()} matches expected")
else:
    print(f"FAIL: dA2={dA2}, expected {_expected_dA2}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000123', 4, 'Backward through the output layer', 'medium', 'Write backward_output_layer(dA2, A2, A1, W2) for the output layer of a sigmoid-sigmoid network. Compute dZ2 = dA2 * A2 * (1 - A2), then dW2 = A1.T @ dZ2, db2 = sum of dZ2 over samples (axis=0), and dA1 = dZ2 @ W2.T (the gradient to hand to the hidden layer). Return (dW2, db2, dA1).', 'This is chaining the sigmoid''s local derivative (A2*(1-A2)) with the upstream dA2, then applying the weight/bias gradient formulas from the backprop-derivation concept.', $py$import numpy as np

def backward_output_layer(dA2, A2, A1, W2):
    # TODO: return (dW2, db2, dA1)
    pass
$py$, $py$A1 = np.array([[0.6, 0.4], [0.3, 0.7]])
A2 = np.array([[0.8], [0.5]])
dA2 = np.array([[0.5], [-0.3]])
W2 = np.array([[0.9], [0.2]])

dW2, db2, dA1 = backward_output_layer(dA2, A2, A1, W2)

dZ2 = dA2 * A2 * (1 - A2)
_expected_dW2 = A1.T @ dZ2
_expected_db2 = np.sum(dZ2, axis=0)
_expected_dA1 = dZ2 @ W2.T

_passed = 0
_total = 3

if np.allclose(dW2, _expected_dW2):
    _passed += 1
    print(f"PASS: dW2 matches expected")
else:
    print(f"FAIL: dW2={dW2}, expected {_expected_dW2}")

if np.allclose(db2, _expected_db2):
    _passed += 1
    print(f"PASS: db2 matches expected")
else:
    print(f"FAIL: db2={db2}, expected {_expected_db2}")

if np.allclose(dA1, _expected_dA1):
    _passed += 1
    print(f"PASS: dA1 matches expected")
else:
    print(f"FAIL: dA1={dA1}, expected {_expected_dA1}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000123', 5, 'Backward through the hidden layer', 'medium', 'Write backward_hidden_layer(dA1, A1, X) for the hidden layer of a sigmoid network. Compute dZ1 = dA1 * A1 * (1 - A1), then dW1 = X.T @ dZ1 and db1 = sum of dZ1 over samples (axis=0). Return (dW1, db1).', 'Same pattern as the output layer''s backward step, but the ''input'' this time is X instead of the previous layer''s activation.', $py$import numpy as np

def backward_hidden_layer(dA1, A1, X):
    # TODO: return (dW1, db1)
    pass
$py$, $py$X = np.array([[1.0, 0.0], [0.0, 1.0]])
A1 = np.array([[0.6, 0.4], [0.3, 0.7]])
dA1 = np.array([[0.2, -0.1], [0.05, 0.3]])

dW1, db1 = backward_hidden_layer(dA1, A1, X)

dZ1 = dA1 * A1 * (1 - A1)
_expected_dW1 = X.T @ dZ1
_expected_db1 = np.sum(dZ1, axis=0)

_passed = 0
_total = 2

if np.allclose(dW1, _expected_dW1):
    _passed += 1
    print("PASS: dW1 matches expected")
else:
    print(f"FAIL: dW1={dW1}, expected {_expected_dW1}")

if np.allclose(db1, _expected_db1):
    _passed += 1
    print("PASS: db1 matches expected")
else:
    print(f"FAIL: db1={db1}, expected {_expected_db1}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000123', 6, 'Full backward pass', 'hard', 'Write full_backward(X, y, W1, b1, W2, b2) that runs a complete forward pass, computes the loss and output gradient, then backpropagates through both layers. Return (loss, dW1, db1, dW2, db2).', 'Compose the pieces from the previous four challenges: forward_with_cache, compute_loss_and_output_grad, backward_output_layer, backward_hidden_layer.', $py$import numpy as np

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

def full_backward(X, y, W1, b1, W2, b2):
    # TODO: forward pass, then backward pass through both layers.
    # Return (loss, dW1, db1, dW2, db2)
    pass
$py$, $py$rng = np.random.default_rng(0)
X = rng.normal(size=(3, 2))
y = np.array([[1.0], [0.0], [1.0]])
W1 = rng.normal(size=(2, 3)) * 0.5
b1 = rng.normal(size=(3,)) * 0.1
W2 = rng.normal(size=(3, 1)) * 0.5
b2 = rng.normal(size=(1,)) * 0.1

loss, dW1, db1, dW2, db2 = full_backward(X, y, W1, b1, W2, b2)

def _sigmoid(z):
    return 1 / (1 + np.exp(-z))

def _loss_fn(W1, b1, W2, b2):
    A1 = _sigmoid(X @ W1 + b1)
    A2 = _sigmoid(A1 @ W2 + b2)
    A2c = np.clip(A2, 1e-12, 1 - 1e-12)
    return -np.mean(y * np.log(A2c) + (1 - y) * np.log(1 - A2c))

_eps = 1e-6

def _numerical_grad(param):
    grad = np.zeros_like(param)
    it = np.nditer(param, flags=["multi_index"])
    for _ in it:
        idx = it.multi_index
        orig = param[idx]
        param[idx] = orig + _eps
        lp = _loss_fn(W1, b1, W2, b2)
        param[idx] = orig - _eps
        lm = _loss_fn(W1, b1, W2, b2)
        param[idx] = orig
        grad[idx] = (lp - lm) / (2 * _eps)
    return grad

_passed = 0
_total = 4

_checks = [
    ("dW1", dW1, _numerical_grad(W1)),
    ("db1", db1, _numerical_grad(b1)),
    ("dW2", dW2, _numerical_grad(W2)),
    ("db2", db2, _numerical_grad(b2)),
]
for _name, _analytic, _numeric in _checks:
    if np.allclose(_analytic, _numeric, atol=1e-4):
        _passed += 1
        print(f"PASS: {_name} matches its finite-difference estimate")
    else:
        print(f"FAIL: {_name}={_analytic}, expected ~{_numeric}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000123', 7, 'Applying a gradient descent update', 'medium', 'Write update_parameters(W1, b1, W2, b2, dW1, db1, dW2, db2, lr) that applies one plain gradient descent step to every parameter (parameter -= lr * its gradient) and returns the updated (W1, b1, W2, b2).', 'Each new parameter is just old_parameter - lr * its_gradient.', $py$import numpy as np

def update_parameters(W1, b1, W2, b2, dW1, db1, dW2, db2, lr):
    # TODO: apply one gradient descent step to every parameter
    pass
$py$, $py$W1 = np.array([[1.0, 2.0]])
b1 = np.array([0.5])
W2 = np.array([[3.0]])
b2 = np.array([-1.0])
dW1 = np.array([[0.1, 0.2]])
db1 = np.array([0.05])
dW2 = np.array([[0.3]])
db2 = np.array([0.02])

new_W1, new_b1, new_W2, new_b2 = update_parameters(W1, b1, W2, b2, dW1, db1, dW2, db2, lr=0.5)

_passed = 0
_total = 4

if np.allclose(new_W1, [[0.95, 1.9]]):
    _passed += 1
    print(f"PASS: new_W1={new_W1.tolist()}")
else:
    print(f"FAIL: new_W1={new_W1}, expected [[0.95, 1.9]]")

if np.allclose(new_b1, [0.475]):
    _passed += 1
    print(f"PASS: new_b1={new_b1.tolist()}")
else:
    print(f"FAIL: new_b1={new_b1}, expected [0.475]")

if np.allclose(new_W2, [[2.85]]):
    _passed += 1
    print(f"PASS: new_W2={new_W2.tolist()}")
else:
    print(f"FAIL: new_W2={new_W2}, expected [[2.85]]")

if np.allclose(new_b2, [-1.01]):
    _passed += 1
    print(f"PASS: new_b2={new_b2.tolist()}")
else:
    print(f"FAIL: new_b2={new_b2}, expected [-1.01]")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000123', 8, 'One complete training step', 'hard', 'Write train_step(X, y, W1, b1, W2, b2, lr) that runs one full backward pass (forward + loss + backward) and then applies one gradient descent update to all four parameters. Return (new_W1, new_b1, new_W2, new_b2, loss) where loss is the loss computed *before* the update.', 'Compute everything you need with a full backward pass first (you''ll need the loss and all four gradients), then apply the update using those gradients.', $py$import numpy as np

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

def train_step(X, y, W1, b1, W2, b2, lr):
    # TODO: one forward+backward+update step; return
    # (new_W1, new_b1, new_W2, new_b2, loss_before_update)
    pass
$py$, $py$rng = np.random.default_rng(5)
X = np.array([[0.0, 0.0], [0.0, 1.0], [1.0, 0.0], [1.0, 1.0]])
y = np.array([[0.0], [1.0], [1.0], [0.0]])
W1 = rng.normal(size=(2, 4))
b1 = np.zeros(4)
W2 = rng.normal(size=(4, 1))
b2 = np.zeros(1)

new_W1, new_b1, new_W2, new_b2, loss1 = train_step(X, y, W1, b1, W2, b2, lr=1.0)

_passed = 0
_total = 3

if new_W1.shape == W1.shape and new_W2.shape == W2.shape:
    _passed += 1
    print(f"PASS: shapes preserved after update")
else:
    print(f"FAIL: new_W1.shape={new_W1.shape}, new_W2.shape={new_W2.shape}")

if not np.array_equal(new_W1, W1):
    _passed += 1
    print("PASS: weights actually changed after the step")
else:
    print("FAIL: weights are unchanged -- update was not applied")

_, _, _, _, loss2 = train_step(X, y, new_W1, new_b1, new_W2, new_b2, lr=1.0)
if loss2 < loss1:
    _passed += 1
    print(f"PASS: loss decreased from {loss1:.5f} to {loss2:.5f} after a second step")
else:
    print(f"FAIL: expected loss to decrease, got loss1={loss1:.5f}, loss2={loss2:.5f}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000123', 9, 'Train a network to solve XOR', 'hard', 'Write train_xor_network(epochs=5000, lr=1.0, hidden=4, seed=42) that trains a 2-input -> hidden -> 1-output sigmoid network on the 4 XOR examples using the forward/backward/update logic already given in the starter code. Initialize weights with initialize_weights(2, hidden, 1, seed), then run `epochs` full-batch training steps (using all 4 examples every step). Return (final_predictions, loss_history), where final_predictions is a length-4 array of the network''s final output for the 4 XOR inputs in order (0,0), (0,1), (1,0), (1,1), and loss_history is a list with one loss value per epoch.', 'You''re given initialize_weights, sigmoid, and train_step already implemented below -- the only new code is the epoch loop: call train_step once per epoch, feeding each epoch''s returned weights into the next.', $py$import numpy as np

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

def initialize_weights(n_in, n_hidden, n_out, seed=42):
    np.random.seed(seed)
    W1 = np.random.randn(n_in, n_hidden)
    b1 = np.zeros(n_hidden)
    W2 = np.random.randn(n_hidden, n_out)
    b2 = np.zeros(n_out)
    return W1, b1, W2, b2

def train_step(X, y, W1, b1, W2, b2, lr):
    n = X.shape[0]
    Z1 = X @ W1 + b1
    A1 = sigmoid(Z1)
    Z2 = A1 @ W2 + b2
    A2 = sigmoid(Z2)

    eps = 1e-12
    A2c = np.clip(A2, eps, 1 - eps)
    loss = -np.mean(y * np.log(A2c) + (1 - y) * np.log(1 - A2c))
    dA2 = (A2c - y) / (A2c * (1 - A2c) * n)

    dZ2 = dA2 * A2 * (1 - A2)
    dW2 = A1.T @ dZ2
    db2 = np.sum(dZ2, axis=0)
    dA1 = dZ2 @ W2.T

    dZ1 = dA1 * A1 * (1 - A1)
    dW1 = X.T @ dZ1
    db1 = np.sum(dZ1, axis=0)

    new_W1 = W1 - lr * dW1
    new_b1 = b1 - lr * db1
    new_W2 = W2 - lr * dW2
    new_b2 = b2 - lr * db2
    return new_W1, new_b1, new_W2, new_b2, loss

def train_xor_network(epochs=5000, lr=1.0, hidden=4, seed=42):
    # TODO: initialize weights, then run `epochs` full-batch training
    # steps on the XOR dataset. Return (final_predictions, loss_history).
    pass
$py$, $py$preds, loss_history = train_xor_network()
preds = np.asarray(preds).ravel()

_passed = 0
_total = 4

if len(loss_history) == 5000:
    _passed += 1
    print(f"PASS: loss_history has one entry per epoch ({len(loss_history)})")
else:
    print(f"FAIL: loss_history has {len(loss_history)} entries, expected 5000")

_expected_labels = [0, 1, 1, 0]
_all_correct = all((p > 0.5) == bool(e) for p, e in zip(preds, _expected_labels))
if _all_correct:
    _passed += 1
    print(f"PASS: final predictions {np.round(preds, 4).tolist()} match XOR labels {_expected_labels}")
else:
    print(f"FAIL: final predictions {preds.tolist()} don't match XOR labels {_expected_labels}")

if preds.shape == (4,):
    _passed += 1
    print(f"PASS: predictions shape {preds.shape} correct")
else:
    print(f"FAIL: predictions shape {preds.shape}, expected (4,)")

if loss_history[-1] < loss_history[0] * 0.1:
    _passed += 1
    print(f"PASS: loss fell from {loss_history[0]:.4f} to {loss_history[-1]:.6f} (a substantial, clear drop)")
else:
    print(f"FAIL: loss only fell from {loss_history[0]:.4f} to {loss_history[-1]:.6f}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000123', 10, 'A general-purpose gradient checker', 'hard', 'Write numerical_gradient_check(f, params, analytic_grads, eps=1e-5, tol=1e-3) where params is a list of NumPy arrays, analytic_grads is a list of arrays (same shapes) claiming to be f''s gradient with respect to each one, and f(params) returns a scalar loss given that list. For every entry of every array in params, perturb it by +-eps, estimate the derivative by finite differences, and return True only if every analytic gradient entry is within tol of its numerical estimate.', 'Loop over each param array with np.nditer(..., flags=[''multi_index'']) to reach individual entries; perturb, call f(params), restore, and compare to the matching entry of analytic_grads.', $py$import numpy as np

def numerical_gradient_check(f, params, analytic_grads, eps=1e-5, tol=1e-3):
    # TODO: check every analytic gradient entry against a finite-difference estimate
    pass
$py$, $py$def _f(params):
    P1, P2 = params
    return float(np.sum(P1 ** 2) + np.sum(P2 ** 3))

P1 = np.array([1.0, -2.0, 0.5])
P2 = np.array([2.0, 1.0])

_correct_grads = [2 * P1, 3 * P2 ** 2]
_wrong_grads = [2 * P1, 3 * P2]  # missing the square -- deliberately wrong

_passed = 0
_total = 2

if bool(numerical_gradient_check(_f, [P1, P2], _correct_grads)):
    _passed += 1
    print("PASS: correct analytic gradients are accepted")
else:
    print("FAIL: expected True for the correct gradients")

if not bool(numerical_gradient_check(_f, [P1, P2], _wrong_grads)):
    _passed += 1
    print("PASS: incorrect analytic gradients are correctly rejected")
else:
    print("FAIL: expected False for the deliberately wrong gradients")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000124', 1, 'Splitting data into batches', 'easy', 'Write make_batches(n_samples, batch_size) that returns a list of (start, end) index tuples covering 0..n_samples-1 in chunks of batch_size, with the last chunk possibly smaller.', 'Step through range(0, n_samples, batch_size), pairing each start with min(start + batch_size, n_samples).', $py$import numpy as np

def make_batches(n_samples, batch_size):
    # TODO: return a list of (start, end) tuples covering 0..n_samples-1
    pass
$py$, $py$_passed = 0
_total = 3

_r1 = make_batches(10, 3)
_expected1 = [(0, 3), (3, 6), (6, 9), (9, 10)]
if _r1 == _expected1:
    _passed += 1
    print(f"PASS: make_batches(10, 3) == {_r1}")
else:
    print(f"FAIL: make_batches(10, 3) returned {_r1}, expected {_expected1}")

_r2 = make_batches(8, 4)
_expected2 = [(0, 4), (4, 8)]
if _r2 == _expected2:
    _passed += 1
    print(f"PASS: make_batches(8, 4) == {_r2}")
else:
    print(f"FAIL: make_batches(8, 4) returned {_r2}, expected {_expected2}")

_r3 = make_batches(4, 10)
_expected3 = [(0, 4)]
if _r3 == _expected3:
    _passed += 1
    print(f"PASS: make_batches(4, 10) == {_r3}")
else:
    print(f"FAIL: make_batches(4, 10) returned {_r3}, expected {_expected3}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000124', 2, 'Reproducible shuffling', 'easy', 'Write shuffle_indices(n, seed) that seeds NumPy''s RNG with `seed` and returns a random permutation of range(n) (a length-n array containing every integer 0..n-1 exactly once, in shuffled order).', 'np.random.seed(seed) then np.random.permutation(n).', $py$import numpy as np

def shuffle_indices(n, seed):
    # TODO: seed the RNG, then return a random permutation of range(n)
    pass
$py$, $py$_passed = 0
_total = 3

_r1 = np.asarray(shuffle_indices(6, seed=1))
if sorted(_r1.tolist()) == list(range(6)):
    _passed += 1
    print(f"PASS: shuffle_indices(6, seed=1) is a valid permutation: {_r1.tolist()}")
else:
    print(f"FAIL: {_r1.tolist()} is not a permutation of range(6)")

_r2 = np.asarray(shuffle_indices(6, seed=1))
if np.array_equal(_r1, _r2):
    _passed += 1
    print("PASS: same seed reproduces the identical permutation")
else:
    print(f"FAIL: two calls with seed=1 gave different results: {_r1.tolist()} vs {_r2.tolist()}")

_r3 = np.asarray(shuffle_indices(6, seed=2))
if not np.array_equal(_r1, _r3):
    _passed += 1
    print(f"PASS: a different seed gives a different permutation: {_r3.tolist()}")
else:
    print("FAIL: expected a different permutation for a different seed")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000124', 3, 'Averaging loss across uneven batches', 'medium', 'Write average_batch_losses(batch_losses, batch_sizes) that computes the correct overall average loss across batches of different sizes -- a weighted average, where each batch''s loss counts in proportion to how many examples it contained.', 'sum(loss * size for loss, size in zip(...)) / sum(batch_sizes) -- a plain unweighted mean would treat a batch of 1 example the same as a batch of 100.', $py$import numpy as np

def average_batch_losses(batch_losses, batch_sizes):
    # TODO: size-weighted average of the per-batch losses
    pass
$py$, $py$_passed = 0
_total = 2

_r1 = average_batch_losses([1.0, 2.0], [1, 1])
if abs(_r1 - 1.5) < 1e-8:
    _passed += 1
    print(f"PASS: equal-size batches average plainly: {_r1}")
else:
    print(f"FAIL: got {_r1!r}, expected 1.5")

# 3 samples at loss 0.0, 1 sample at loss 4.0 -> weighted mean should be 1.0, not 2.0
_r2 = average_batch_losses([0.0, 4.0], [3, 1])
if abs(_r2 - 1.0) < 1e-8:
    _passed += 1
    print(f"PASS: uneven batch sizes weighted correctly: {_r2}")
else:
    print(f"FAIL: got {_r2!r}, expected 1.0 (a plain unweighted mean would give 2.0)")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000124', 4, 'A reproducible train/test split', 'medium', 'Write train_test_split(X, y, test_frac, seed) that shuffles the samples (using seed) and splits them into (X_train, y_train, X_test, y_test), with the last round(len(X) * test_frac) shuffled samples going to the test set.', 'Shuffle indices with a fixed seed, compute n_test = round(len(X) * test_frac), then slice: test gets the last n_test shuffled indices, train gets the rest.', $py$import numpy as np

def train_test_split(X, y, test_frac, seed):
    # TODO: shuffle (with `seed`), then split into (X_train, y_train, X_test, y_test)
    pass
$py$, $py$X = np.arange(20).reshape(10, 2).astype(float)
y = np.arange(10)

X_train, y_train, X_test, y_test = train_test_split(X, y, test_frac=0.3, seed=0)

_passed = 0
_total = 3

if len(X_test) == 3 and len(X_train) == 7:
    _passed += 1
    print(f"PASS: split sizes correct: train={len(X_train)}, test={len(X_test)}")
else:
    print(f"FAIL: train={len(X_train)}, test={len(X_test)}, expected train=7, test=3")

_train_ids = set(y_train.tolist())
_test_ids = set(y_test.tolist())
if len(_train_ids & _test_ids) == 0 and _train_ids | _test_ids == set(range(10)):
    _passed += 1
    print("PASS: train/test sets don't overlap and together cover every sample")
else:
    print(f"FAIL: train ids {_train_ids}, test ids {_test_ids} overlap or miss samples")

X_train2, y_train2, X_test2, y_test2 = train_test_split(X, y, test_frac=0.3, seed=0)
if np.array_equal(y_train, y_train2) and np.array_equal(y_test, y_test2):
    _passed += 1
    print("PASS: same seed reproduces the identical split")
else:
    print("FAIL: same seed produced a different split on a second call")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000124', 5, 'How many updates does training actually do?', 'medium', 'Write total_updates(n_samples, batch_size, epochs) that returns the total number of gradient descent updates performed across the whole training run: the number of batches per epoch, times the number of epochs.', 'Batches per epoch is ceil(n_samples / batch_size) -- use -(-n_samples // batch_size) or math.ceil.', $py$import numpy as np

def total_updates(n_samples, batch_size, epochs):
    # TODO: (batches per epoch) * epochs
    pass
$py$, $py$_passed = 0
_total = 3

_r1 = total_updates(10, 3, epochs=5)  # 4 batches/epoch (3,3,3,1) * 5 = 20
if _r1 == 20:
    _passed += 1
    print(f"PASS: total_updates(10, 3, epochs=5) == {_r1}")
else:
    print(f"FAIL: got {_r1!r}, expected 20")

_r2 = total_updates(100, 100, epochs=10)  # full-batch: 1 update per epoch
if _r2 == 10:
    _passed += 1
    print(f"PASS: full-batch training does exactly 1 update/epoch: {_r2}")
else:
    print(f"FAIL: got {_r2!r}, expected 10")

_r3 = total_updates(4, 1, epochs=3)  # batch size 1: 1 update per sample
if _r3 == 12:
    _passed += 1
    print(f"PASS: batch_size=1 gives one update per sample per epoch: {_r3}")
else:
    print(f"FAIL: got {_r3!r}, expected 12")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000124', 6, 'Mini-batch training on XOR', 'hard', 'Write train_with_minibatches(epochs=3000, lr=1.0, hidden=4, batch_size=2, seed=42) using the sigmoid forward/backward pieces given in the starter code. Each epoch: shuffle the 4 XOR examples (seeded, reshuffled fresh each epoch using seed + epoch_number so it''s still reproducible), split them into batches of batch_size, and run one train_step per batch. Track the epoch''s average loss (weighted by batch size) in a list, and return (final_predictions, loss_history).', 'Reuse make_batches on the shuffled order; for reproducible-but-different shuffling each epoch, seed with (seed + epoch) rather than the same seed every time.', $py$import numpy as np

def sigmoid(z):
    return 1 / (1 + np.exp(-z))

def initialize_weights(n_in, n_hidden, n_out, seed=42):
    np.random.seed(seed)
    W1 = np.random.randn(n_in, n_hidden)
    b1 = np.zeros(n_hidden)
    W2 = np.random.randn(n_hidden, n_out)
    b2 = np.zeros(n_out)
    return W1, b1, W2, b2

def train_step(X, y, W1, b1, W2, b2, lr):
    n = X.shape[0]
    Z1 = X @ W1 + b1
    A1 = sigmoid(Z1)
    Z2 = A1 @ W2 + b2
    A2 = sigmoid(Z2)
    eps = 1e-12
    A2c = np.clip(A2, eps, 1 - eps)
    loss = -np.mean(y * np.log(A2c) + (1 - y) * np.log(1 - A2c))
    dA2 = (A2c - y) / (A2c * (1 - A2c) * n)
    dZ2 = dA2 * A2 * (1 - A2)
    dW2 = A1.T @ dZ2
    db2 = np.sum(dZ2, axis=0)
    dA1 = dZ2 @ W2.T
    dZ1 = dA1 * A1 * (1 - A1)
    dW1 = X.T @ dZ1
    db1 = np.sum(dZ1, axis=0)
    new_W1 = W1 - lr * dW1
    new_b1 = b1 - lr * db1
    new_W2 = W2 - lr * dW2
    new_b2 = b2 - lr * db2
    return new_W1, new_b1, new_W2, new_b2, loss

def make_batches(n_samples, batch_size):
    return [(i, min(i + batch_size, n_samples)) for i in range(0, n_samples, batch_size)]

def train_with_minibatches(epochs=3000, lr=1.0, hidden=4, batch_size=2, seed=42):
    # TODO: shuffle each epoch, split into batches, run train_step per batch,
    # track each epoch's (size-weighted) average loss. Return
    # (final_predictions, loss_history)
    pass
$py$, $py$preds, loss_history = train_with_minibatches()
preds = np.asarray(preds).ravel()

_passed = 0
_total = 3

if len(loss_history) == 3000:
    _passed += 1
    print(f"PASS: loss_history has one entry per epoch ({len(loss_history)})")
else:
    print(f"FAIL: loss_history has {len(loss_history)} entries, expected 3000")

_expected_labels = [0, 1, 1, 0]
_all_correct = all((p > 0.5) == bool(e) for p, e in zip(preds, _expected_labels))
if _all_correct:
    _passed += 1
    print(f"PASS: final predictions {np.round(preds, 4).tolist()} match XOR labels")
else:
    print(f"FAIL: final predictions {preds.tolist()} don't match XOR labels {_expected_labels}")

if loss_history[-1] < loss_history[0] * 0.2:
    _passed += 1
    print(f"PASS: loss fell substantially, from {loss_history[0]:.4f} to {loss_history[-1]:.6f}")
else:
    print(f"FAIL: loss only fell from {loss_history[0]:.4f} to {loss_history[-1]:.6f}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000124', 7, 'Early stopping', 'medium', 'Write should_stop_early(loss_history, patience) that returns True if the loss has not reached a new minimum in the last `patience` epochs (i.e. training has stalled), else False. If loss_history has fewer than patience + 1 entries, always return False (not enough history yet).', 'best_before = min(loss_history[:-patience]); recent = loss_history[-patience:]; stop if none of recent beats best_before.', $py$import numpy as np

def should_stop_early(loss_history, patience):
    # TODO: True if no new minimum loss has been reached in the last `patience` epochs
    pass
$py$, $py$_passed = 0
_total = 3

# Still improving in the recent window -> don't stop
_still_improving = [1.0, 0.8, 0.6, 0.5, 0.4, 0.3]
if not bool(should_stop_early(_still_improving, patience=3)):
    _passed += 1
    print("PASS: still-improving loss history does not trigger early stopping")
else:
    print("FAIL: expected False for a steadily improving loss history")

# Plateaued for the last 3 epochs -> stop
_plateaued = [1.0, 0.5, 0.2, 0.2, 0.25, 0.21]
if bool(should_stop_early(_plateaued, patience=3)):
    _passed += 1
    print("PASS: a plateaued loss (no new minimum in the last 3 epochs) triggers early stopping")
else:
    print("FAIL: expected True for a plateaued loss history")

# Not enough history yet -> don't stop
if not bool(should_stop_early([1.0, 0.9], patience=5)):
    _passed += 1
    print("PASS: too little history yet correctly avoids stopping")
else:
    print("FAIL: expected False when history is shorter than patience")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000124', 8, 'Learning rate decay', 'medium', 'Write decayed_learning_rate(initial_lr, epoch, decay_rate) that returns a learning rate which shrinks over time: initial_lr / (1 + decay_rate * epoch).', 'Straight formula substitution -- at epoch=0 it should return exactly initial_lr.', $py$import numpy as np

def decayed_learning_rate(initial_lr, epoch, decay_rate):
    # TODO: return initial_lr / (1 + decay_rate * epoch)
    pass
$py$, $py$_passed = 0
_total = 3

_r1 = decayed_learning_rate(0.1, epoch=0, decay_rate=0.01)
if abs(_r1 - 0.1) < 1e-8:
    _passed += 1
    print(f"PASS: epoch 0 returns the initial learning rate unchanged: {_r1}")
else:
    print(f"FAIL: got {_r1!r}, expected 0.1")

_r2 = decayed_learning_rate(0.1, epoch=99, decay_rate=0.01)
_expected2 = 0.1 / (1 + 0.01 * 99)
if abs(_r2 - _expected2) < 1e-8:
    _passed += 1
    print(f"PASS: decayed_learning_rate at epoch 99 == {_r2:.6f}")
else:
    print(f"FAIL: got {_r2!r}, expected {_expected2:.6f}")

_lrs = [decayed_learning_rate(0.5, e, 0.1) for e in range(5)]
if all(_lrs[i] > _lrs[i + 1] for i in range(4)):
    _passed += 1
    print(f"PASS: learning rate decreases monotonically over epochs: {[round(x, 4) for x in _lrs]}")
else:
    print(f"FAIL: expected a strictly decreasing sequence, got {_lrs}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000124', 9, 'Full-batch vs. mini-batch, counted', 'medium', 'Write describe_batching(n_samples, batch_size) that returns one of the strings ''full-batch'', ''stochastic'', or ''mini-batch'': ''full-batch'' if batch_size >= n_samples, ''stochastic'' if batch_size == 1, and ''mini-batch'' for anything strictly in between.', 'Check the full-batch and stochastic special cases first (in that order, since a dataset of exactly 1 sample makes both true, and ''full-batch'' should win), then everything else is mini-batch.', $py$import numpy as np

def describe_batching(n_samples, batch_size):
    # TODO: classify the batching strategy as 'full-batch', 'stochastic', or 'mini-batch'
    pass
$py$, $py$_passed = 0
_total = 4

_cases = [
    (100, 100, "full-batch"),
    (100, 200, "full-batch"),
    (100, 1, "stochastic"),
    (100, 16, "mini-batch"),
]
for _n, _b, _expected in _cases:
    _actual = describe_batching(_n, _b)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: describe_batching({_n}, {_b}) == {_expected!r}")
    else:
        print(f"FAIL: describe_batching({_n}, {_b}) returned {_actual!r}, expected {_expected!r}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000125', 1, 'Counting the real cost of a matrix multiply', 'easy', 'Write matmul_flop_count(m, k, n) that returns the number of scalar multiply-add operations needed to multiply an (m, k) matrix by a (k, n) matrix: each of the m*n output entries requires k multiplications (and k-1 additions, but the standard convention used here counts each multiply-add pair as one operation) -- so the total is m * k * n.', 'Every one of the m*n entries in the output does exactly k multiply-adds -- multiply the three numbers together.', $py$def matmul_flop_count(m, k, n):
    # TODO: return the number of multiply-add operations for an (m,k) @ (k,n) matmul
    pass
$py$, $py$_passed = 0
_total = 3

_cases = [
    (2, 3, 4, 24),
    (100, 50, 10, 50000),
    (1, 1, 1, 1),
]
for _m, _k, _n, _expected in _cases:
    _actual = matmul_flop_count(_m, _k, _n)
    if _actual == _expected:
        _passed += 1
        print(f"PASS: matmul_flop_count({_m}, {_k}, {_n}) == {_expected}")
    else:
        print(f"FAIL: matmul_flop_count({_m}, {_k}, {_n}) returned {_actual!r}, expected {_expected}")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000125', 2, 'Estimating a full training run''s compute', 'medium', 'Write training_run_ops(ops_per_sample, num_samples, num_epochs, backward_multiplier=2) that estimates the total number of operations across an entire training run. Each sample costs ops_per_sample for its forward pass; the prompt''s convention is that the backward pass costs backward_multiplier times as much as the forward pass. Every sample is processed once per epoch. Return the grand total: ops_per_sample * (1 + backward_multiplier) * num_samples * num_epochs.', 'Forward pass cost per sample is ops_per_sample; backward costs backward_multiplier times that; multiply the combined per-sample cost by num_samples and then by num_epochs.', $py$def training_run_ops(ops_per_sample, num_samples, num_epochs, backward_multiplier=2):
    # TODO: total estimated operations for the whole training run
    pass
$py$, $py$_passed = 0
_total = 3

_r1 = training_run_ops(100, num_samples=10, num_epochs=5)
# 100 * (1+2) * 10 * 5 = 15000
if _r1 == 15000:
    _passed += 1
    print(f"PASS: training_run_ops(100, 10, 5) == {_r1}")
else:
    print(f"FAIL: got {_r1!r}, expected 15000")

_r2 = training_run_ops(100, num_samples=10, num_epochs=5, backward_multiplier=1)
# 100 * 2 * 10 * 5 = 10000
if _r2 == 10000:
    _passed += 1
    print(f"PASS: a smaller backward_multiplier lowers the estimate: {_r2}")
else:
    print(f"FAIL: got {_r2!r}, expected 10000")

_r3 = training_run_ops(1_000_000, num_samples=1000, num_epochs=1)
if _r3 == 3_000_000_000:
    _passed += 1
    print(f"PASS: a realistically-sized run scales into the billions of operations: {_r3:,}")
else:
    print(f"FAIL: got {_r3!r}, expected 3,000,000,000")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000125', 3, 'Would this workload actually benefit from a GPU?', 'medium', 'Write would_benefit_from_gpu(total_ops, threshold=1e9) that reasons about whether a training run is large enough for GPU parallelism to meaningfully matter, versus small enough that plain single-threaded NumPy in a browser tab is genuinely fine. Return True if total_ops >= threshold, else False.', 'This is a direct threshold comparison -- the reasoning is in picking a threshold that separates ''a few thousand parameters, instant either way'' from ''millions of parameters, hours of difference''.', $py$def would_benefit_from_gpu(total_ops, threshold=1e9):
    # TODO: True if total_ops is at or above threshold
    pass
$py$, $py$_passed = 0
_total = 4

# The XOR network from this phase: tiny, no GPU needed
_xor_scale_ops = 4 * 2 * 4 * 5000 * 3  # rough order-of-magnitude estimate, still small
if not bool(would_benefit_from_gpu(_xor_scale_ops)):
    _passed += 1
    print(f"PASS: XOR-scale compute ({_xor_scale_ops:,} ops) does not need a GPU")
else:
    print(f"FAIL: expected False for a tiny toy-scale workload ({_xor_scale_ops:,} ops)")

# A realistic image classifier: large, GPU clearly matters
_real_scale_ops = 25_000_000 * 1_000_000 * 10
if bool(would_benefit_from_gpu(_real_scale_ops)):
    _passed += 1
    print(f"PASS: real-model-scale compute ({_real_scale_ops:,} ops) clearly benefits from a GPU")
else:
    print(f"FAIL: expected True for a large realistic workload ({_real_scale_ops:,} ops)")

if bool(would_benefit_from_gpu(1e9)):
    _passed += 1
    print("PASS: exactly at the threshold counts as benefiting")
else:
    print("FAIL: expected True when total_ops equals the threshold exactly")

if not bool(would_benefit_from_gpu(999_999_999)):
    _passed += 1
    print("PASS: just under the threshold does not count as benefiting")
else:
    print("FAIL: expected False just below the threshold")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000015', '10000000-0000-0000-0000-000000000125', 4, 'Can this actually run in this sandbox?', 'medium', 'Write can_run_in_pyodide(required_libraries) that takes a list of library name strings a code snippet imports, and returns True only if every one of them (case-insensitively) is in the allowed set {''numpy'', ''math'', ''random'', ''statistics''} -- the honest list of what''s actually usable for the numerical work in this phase -- and False if the snippet needs anything else (like ''torch'' or ''tensorflow'').', 'Lowercase every name in required_libraries and check that the resulting set is a subset of the allowed set.', $py$def can_run_in_pyodide(required_libraries):
    # TODO: True only if every required library is in the allowed set
    pass
$py$, $py$_passed = 0
_total = 4

if bool(can_run_in_pyodide(["numpy"])):
    _passed += 1
    print("PASS: a numpy-only snippet can run here")
else:
    print("FAIL: expected True for ['numpy']")

if bool(can_run_in_pyodide(["numpy", "math"])):
    _passed += 1
    print("PASS: numpy + math together are both fine")
else:
    print("FAIL: expected True for ['numpy', 'math']")

if not bool(can_run_in_pyodide(["torch"])):
    _passed += 1
    print("PASS: a snippet requiring torch is correctly flagged as unrunnable here")
else:
    print("FAIL: expected False for ['torch']")

if not bool(can_run_in_pyodide(["numpy", "tensorflow"])):
    _passed += 1
    print("PASS: even one disallowed library (tensorflow) makes the whole snippet unrunnable")
else:
    print("FAIL: expected False for ['numpy', 'tensorflow']")

print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000126', 1, 'Validate ML Scope Completeness', 'easy', 'Write is_complete_ml_scope(scope) (a dict) that returns True only if it has a non-empty ''problem_type'' (str), non-empty ''target_metric'' (str), a numeric ''success_threshold'', and a non-empty ''data_sources'' (list).', 'Check each required key exists first, then check the value itself: strings/lists non-empty (truthy), threshold numeric via isinstance(x, (int, float)).', $py$def is_complete_ml_scope(scope):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = 'is_complete_ml_scope({"problem_type": "classification", "target_metric": "f1", "success_threshold": 0.8, "data_sources": ["a.csv"]})'
_actual = is_complete_ml_scope({"problem_type": "classification", "target_metric": "f1", "success_threshold": 0.8, "data_sources": ["a.csv"]})
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_complete_ml_scope({"problem_type": "classification", "target_metric": "f1", "success_threshold": 0.8, "data_sources": []})'
_actual = is_complete_ml_scope({"problem_type": "classification", "target_metric": "f1", "success_threshold": 0.8, "data_sources": []})
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = 'is_complete_ml_scope({"problem_type": "classification", "target_metric": "f1", "success_threshold": "high", "data_sources": ["a.csv"]})'
_actual = is_complete_ml_scope({"problem_type": "classification", "target_metric": "f1", "success_threshold": "high", "data_sources": ["a.csv"]})
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000126', 2, 'Valid Problem Type', 'easy', 'Write valid_problem_type(problem_type) returning True if it is one of ''classification'', ''regression'', or ''clustering''.', 'problem_type in {"classification", "regression", "clustering"}.', $py$def valid_problem_type(problem_type):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = "valid_problem_type('classification')"
_actual = valid_problem_type('classification')
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "valid_problem_type('regression')"
_actual = valid_problem_type('regression')
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "valid_problem_type('forecasting')"
_actual = valid_problem_type('forecasting')
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000126', 3, 'Find Missing Scope Keys', 'easy', 'Write missing_scope_keys(scope, required) (scope is a dict, required is a list of key names) returning a sorted list of keys from required that are missing from scope or whose value is falsy.', 'sorted(k for k in required if k not in scope or not scope[k]).', $py$def missing_scope_keys(scope, required):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "missing_scope_keys({'problem_type': 'classification', 'data_sources': []}, ['problem_type', 'target_metric', 'data_sources'])"
_actual = missing_scope_keys({'problem_type': 'classification', 'data_sources': []}, ['problem_type', 'target_metric', 'data_sources'])
_expected = ['data_sources', 'target_metric']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "missing_scope_keys({'a': 1, 'b': 2}, ['a', 'b'])"
_actual = missing_scope_keys({'a': 1, 'b': 2}, ['a', 'b'])
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000126', 4, 'Estimate Minimum Dataset Size', 'medium', 'Write estimate_min_rows(num_features, rows_per_feature=10) implementing a rule-of-thumb minimum row count: num_features * rows_per_feature.', 'Just multiply -- the default rows_per_feature is 10.', $py$def estimate_min_rows(num_features, rows_per_feature=10):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "estimate_min_rows(5)"
_actual = estimate_min_rows(5)
_expected = 50
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "estimate_min_rows(3, 20)"
_actual = estimate_min_rows(3, 20)
_expected = 60
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000126', 5, 'Meets Success Threshold', 'medium', 'Write meets_success_threshold(metric_value, threshold, higher_is_better) returning True if metric_value clears threshold, in the direction that matters (>= if higher is better, <= if lower is better, e.g. for a loss metric).', 'if higher_is_better: return metric_value >= threshold, else return metric_value <= threshold.', $py$def meets_success_threshold(metric_value, threshold, higher_is_better):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = "meets_success_threshold(0.9, 0.85, True)"
_actual = meets_success_threshold(0.9, 0.85, True)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "meets_success_threshold(0.7, 0.85, True)"
_actual = meets_success_threshold(0.7, 0.85, True)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "meets_success_threshold(0.1, 0.2, False)"
_actual = meets_success_threshold(0.1, 0.2, False)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000126', 6, 'Flag Underrepresented Classes', 'medium', 'Write enough_examples_per_class(class_counts, min_per_class) (class_counts is a dict of class label -> example count) returning a sorted list of class labels that have fewer than min_per_class examples.', 'sorted(cls for cls, cnt in class_counts.items() if cnt < min_per_class).', $py$def enough_examples_per_class(class_counts, min_per_class):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "enough_examples_per_class({'a': 50, 'b': 5, 'c': 100}, 10)"
_actual = enough_examples_per_class({'a': 50, 'b': 5, 'c': 100}, 10)
_expected = ['b']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "enough_examples_per_class({'a': 50, 'b': 60}, 10)"
_actual = enough_examples_per_class({'a': 50, 'b': 60}, 10)
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000126', 7, 'Validate Train/Val/Test Split', 'medium', 'Write validate_split_ratios(train_frac, val_frac, test_frac) returning True only if the three fractions sum to 1.0 (within a small floating-point tolerance) AND each fraction is greater than 0.', 'Use abs(total - 1.0) > 1e-6 for the tolerance check rather than exact equality, since floats don''t sum exactly.', $py$def validate_split_ratios(train_frac, val_frac, test_frac):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = "validate_split_ratios(0.7, 0.15, 0.15)"
_actual = validate_split_ratios(0.7, 0.15, 0.15)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "validate_split_ratios(0.8, 0.1, 0.05)"
_actual = validate_split_ratios(0.8, 0.1, 0.05)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "validate_split_ratios(0.5, 0.5, 0.0)"
_actual = validate_split_ratios(0.5, 0.5, 0.0)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000126', 8, 'Scope Risk Flags', 'hard', 'Write scope_risk_flags(scope) (a dict) returning a sorted list of risk-flag strings: ''missing_non_goals'' if non_goals is empty/missing, ''missing_data_sources'' if data_sources is empty/missing, ''missing_success_threshold'' if success_threshold is None or missing, and ''invalid_problem_type'' if problem_type isn''t one of ''classification'', ''regression'', or ''clustering''.', 'Use scope.get(key) so missing keys don''t raise, build a list of flag strings conditionally, then return it sorted.', $py$def scope_risk_flags(scope):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = "scope_risk_flags({'problem_type': 'classification', 'data_sources': ['a.csv'], 'success_threshold': 0.8, 'non_goals': ['x']})"
_actual = scope_risk_flags({'problem_type': 'classification', 'data_sources': ['a.csv'], 'success_threshold': 0.8, 'non_goals': ['x']})
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "scope_risk_flags({'problem_type': 'forecasting', 'data_sources': [], 'success_threshold': None, 'non_goals': []})"
_actual = scope_risk_flags({'problem_type': 'forecasting', 'data_sources': [], 'success_threshold': None, 'non_goals': []})
_expected = ['invalid_problem_type', 'missing_data_sources', 'missing_non_goals', 'missing_success_threshold']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "scope_risk_flags({'problem_type': 'regression', 'data_sources': ['a.csv'], 'success_threshold': 0.1})"
_actual = scope_risk_flags({'problem_type': 'regression', 'data_sources': ['a.csv'], 'success_threshold': 0.1})
_expected = ['missing_non_goals']
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000126', 9, 'Dataset Size Verdict', 'hard', 'Write dataset_size_verdict(num_examples, num_features, num_classes=None) using the rule of thumb ~10x examples per feature (and, for classification, per class too): if num_classes is given, required = num_features * 10 * num_classes, otherwise required = num_features * 10. Return ''sufficient'' if num_examples >= required, else ''insufficient''.', 'Compute `required` with the appropriate formula depending on whether num_classes is truthy, then compare num_examples against it.', $py$def dataset_size_verdict(num_examples, num_features, num_classes=None):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = "dataset_size_verdict(1000, 20, 3)"
_actual = dataset_size_verdict(1000, 20, 3)
_expected = "sufficient"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "dataset_size_verdict(100, 20, 3)"
_actual = dataset_size_verdict(100, 20, 3)
_expected = "insufficient"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "dataset_size_verdict(500, 20)"
_actual = dataset_size_verdict(500, 20)
_expected = "sufficient"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000127', 1, 'Run a Pipeline', 'easy', 'Write run_pipeline(steps, data) where steps is a list of one-argument functions, applying each in order to the result of the previous one (starting from data), and returning the final result.', 'Keep a running `result` variable, starting as data, and reassign it to `step(result)` for each step in steps.', $py$def run_pipeline(steps, data):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "run_pipeline([lambda x: x + 1, lambda x: x * 2], 3)"
_actual = run_pipeline([lambda x: x + 1, lambda x: x * 2], 3)
_expected = 8
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "run_pipeline([], 5)"
_actual = run_pipeline([], 5)
_expected = 5
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000127', 2, 'Validate Stage Order', 'easy', 'Write is_valid_stage_order(stages, required_order) where stages is a list of stage names and required_order is a list of (before, after) pairs, returning True only if every pair''s ''before'' stage appears earlier in stages than its ''after'' stage.', 'For each (before, after) pair compare stages.index(before) to stages.index(after).', $py$def is_valid_stage_order(stages, required_order):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "is_valid_stage_order(['load', 'clean', 'featurize', 'train', 'evaluate'], [('load', 'clean'), ('train', 'evaluate')])"
_actual = is_valid_stage_order(['load', 'clean', 'featurize', 'train', 'evaluate'], [('load', 'clean'), ('train', 'evaluate')])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "is_valid_stage_order(['clean', 'load', 'train', 'evaluate'], [('load', 'clean')])"
_actual = is_valid_stage_order(['clean', 'load', 'train', 'evaluate'], [('load', 'clean')])
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000127', 3, 'Check Pipeline Output Contract', 'easy', 'Write pipeline_output_keys(result, required_keys) (result is a dict) returning True if every key in required_keys is present in result.', 'all(k in result for k in required_keys).', $py$def pipeline_output_keys(result, required_keys):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "pipeline_output_keys({'model': 'clf', 'metrics': {'f1': 0.8}}, ['model', 'metrics'])"
_actual = pipeline_output_keys({'model': 'clf', 'metrics': {'f1': 0.8}}, ['model', 'metrics'])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "pipeline_output_keys({'model': 'clf'}, ['model', 'metrics'])"
_actual = pipeline_output_keys({'model': 'clf'}, ['model', 'metrics'])
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000127', 4, 'Pipeline That Reports Its Own Failure', 'medium', 'Write safe_pipeline(steps, data) that runs each step in order like run_pipeline, but if a step raises an exception, catches it and returns {''success'': False, ''failed_stage'': <index of the failing step>, ''error'': <str(exception)>}. If every step succeeds, return {''success'': True, ''result'': <final result>}.', 'Wrap the call to step(result) in try/except Exception as e, and enumerate(steps) to know the failing index.', $py$def safe_pipeline(steps, data):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "safe_pipeline([lambda x: x + 1, lambda x: 1 / 0], 1)"
_actual = safe_pipeline([lambda x: x + 1, lambda x: 1 / 0], 1)
_expected = {"success": False, "failed_stage": 1, "error": "division by zero"}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "safe_pipeline([lambda x: x * 2], 4)"
_actual = safe_pipeline([lambda x: x * 2], 4)
_expected = {"success": True, "result": 8}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000127', 5, 'Compose Pipeline Stages', 'medium', 'Write compose(*funcs) returning a single function that, when called with x, applies every function in funcs to x in order (left to right) and returns the final result. compose() with no arguments should return the identity function.', 'Define an inner function that loops over funcs, reassigning a running value, and return that inner function (a closure) rather than calling it.', $py$def compose(*funcs):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_f = compose(lambda x: x + 1, lambda x: x * 10)
_call_desc = "compose(lambda x: x + 1, lambda x: x * 10)(2)"
_actual = _f(2)
_expected = 30
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_g = compose()
_call_desc = "compose()(5)"
_actual = _g(5)
_expected = 5
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000127', 6, 'Validate a Stage''s Output Type', 'medium', 'Write validate_stage_contract(stage_output, expected_type) returning True if stage_output is an instance of expected_type.', 'isinstance(stage_output, expected_type).', $py$def validate_stage_contract(stage_output, expected_type):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "validate_stage_contract([1, 2, 3], list)"
_actual = validate_stage_contract([1, 2, 3], list)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "validate_stage_contract('x', list)"
_actual = validate_stage_contract('x', list)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000127', 7, 'Trace Intermediate Pipeline Outputs', 'medium', 'Write pipeline_trace(steps, data) returning a list containing data followed by the output of each successive step, in order -- so len(result) == len(steps) + 1. Useful for debugging exactly what each stage produced.', 'Start a `trace` list with [data], then after computing each new result append it to trace too.', $py$def pipeline_trace(steps, data):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "pipeline_trace([lambda x: x + 1, lambda x: x * 2], 3)"
_actual = pipeline_trace([lambda x: x + 1, lambda x: x * 2], 3)
_expected = [3, 4, 8]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "pipeline_trace([], 7)"
_actual = pipeline_trace([], 7)
_expected = [7]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000127', 8, 'Build a Pipeline from Config', 'hard', 'Write build_pipeline_from_config(config, registry) where config is a list of stage names (strings) and registry is a dict mapping stage name -> one-argument function. Return a new function that, when called with data, looks up and runs each named stage from registry in the order given by config.', 'Look up the list of functions from registry using config first, then return a closure that applies them in order to whatever data it''s called with.', $py$def build_pipeline_from_config(config, registry):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_registry = {"add1": lambda x: x + 1, "double": lambda x: x * 2}
_pipeline = build_pipeline_from_config(["add1", "double"], _registry)
_call_desc = "build_pipeline_from_config(['add1', 'double'], registry)(3)"
_actual = _pipeline(3)
_expected = 8
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_pipeline2 = build_pipeline_from_config(["double", "add1"], _registry)
_call_desc = "build_pipeline_from_config(['double', 'add1'], registry)(3)"
_actual = _pipeline2(3)
_expected = 7
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000127', 9, 'Detect Stage Type Mismatches', 'hard', 'Write detect_stage_mismatches(stages) where stages is a list of dicts, each with a ''name'', and usually an ''input_type'' and/or ''output_type''. Return a list of (name_a, name_b) tuples for each pair of consecutive stages where stage_a''s output_type doesn''t match stage_b''s input_type.', 'Loop with an index over consecutive pairs (stages[i], stages[i+1]); use .get() since ''input_type''/''output_type'' may be missing on some entries.', $py$def detect_stage_mismatches(stages):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_stages = [
    {"name": "load", "output_type": "raw"},
    {"name": "clean", "input_type": "raw", "output_type": "clean"},
    {"name": "train", "input_type": "features", "output_type": "model"},
]
_call_desc = "detect_stage_mismatches(stages)"
_actual = detect_stage_mismatches(_stages)
_expected = [("clean", "train")]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_stages2 = [
    {"name": "load", "output_type": "raw"},
    {"name": "clean", "input_type": "raw", "output_type": "clean"},
]
_call_desc = "detect_stage_mismatches(stages2)"
_actual = detect_stage_mismatches(_stages2)
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000128', 1, 'Pick the Best Model', 'easy', 'Write best_model(results, metric, higher_is_better) where results is a list of dicts each with a ''name'' and a metric value, returning the name of the model with the best metric (max if higher_is_better else min).', 'Use max(results, key=...) or min(results, key=...) depending on higher_is_better, then pull out ["name"].', $py$def best_model(results, metric, higher_is_better):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_results = [{"name": "a", "accuracy": 0.8}, {"name": "b", "accuracy": 0.9}]
_call_desc = "best_model(results, 'accuracy', True)"
_actual = best_model(_results, "accuracy", True)
_expected = "b"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_results2 = [{"name": "a", "loss": 0.4}, {"name": "b", "loss": 0.2}]
_call_desc = "best_model(results2, 'loss', False)"
_actual = best_model(_results2, "loss", False)
_expected = "b"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000128', 2, 'Average Cross-Validation Fold Scores', 'easy', 'Write average_metric(fold_scores) (a list of floats) returning their mean.', 'sum(fold_scores) / len(fold_scores).', $py$def average_metric(fold_scores):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "average_metric([0.8, 0.82, 0.79, 0.81])"
_actual = average_metric([0.8, 0.82, 0.79, 0.81])
_expected = 0.805
if abs(_actual - _expected) < 1e-9:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected ~{_expected!r}")
_call_desc = "average_metric([1.0])"
_actual = average_metric([1.0])
_expected = 1.0
if abs(_actual - _expected) < 1e-9:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected ~{_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000128', 3, 'Detect a Metric Regression', 'easy', 'Write is_regression(old_score, new_score, higher_is_better, tolerance=1e-9) returning True if new_score is meaningfully worse than old_score (beyond a small floating-point tolerance), in whichever direction ''worse'' means given higher_is_better.', 'If higher is better, worse means new_score < old_score - tolerance; if lower is better, worse means new_score > old_score + tolerance.', $py$def is_regression(old_score, new_score, higher_is_better, tolerance=1e-9):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_call_desc = "is_regression(0.9, 0.85, True)"
_actual = is_regression(0.9, 0.85, True)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "is_regression(0.9, 0.95, True)"
_actual = is_regression(0.9, 0.95, True)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "is_regression(0.3, 0.5, False)"
_actual = is_regression(0.3, 0.5, False)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000128', 4, 'Rank Models by Metric', 'medium', 'Write rank_models(results, metric, higher_is_better) returning a list of model names sorted from best to worst by metric.', 'sorted(..., key=lambda r: r[metric], reverse=higher_is_better) puts the best first in both directions.', $py$def rank_models(results, metric, higher_is_better):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_results = [{"name": "a", "acc": 0.7}, {"name": "b", "acc": 0.9}, {"name": "c", "acc": 0.8}]
_call_desc = "rank_models(results, 'acc', True)"
_actual = rank_models(_results, "acc", True)
_expected = ["b", "c", "a"]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_results2 = [{"name": "a", "loss": 0.7}, {"name": "b", "loss": 0.2}, {"name": "c", "loss": 0.5}]
_call_desc = "rank_models(results2, 'loss', False)"
_actual = rank_models(_results2, "loss", False)
_expected = ["b", "c", "a"]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000128', 5, 'Track Improvement Across Iterations', 'medium', 'Write metric_improved(history, tolerance=1e-9) where history is a list of metric scores (higher is better) across successive iterations. Return a list of booleans, one per iteration after the first, True if that iteration improved over the previous one.', 'For i from 1 to len(history)-1, compare history[i] to history[i-1] + tolerance.', $py$def metric_improved(history, tolerance=1e-9):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "metric_improved([0.7, 0.75, 0.73, 0.8])"
_actual = metric_improved([0.7, 0.75, 0.73, 0.8])
_expected = [True, False, True]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "metric_improved([0.5])"
_actual = metric_improved([0.5])
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000128', 6, 'Detect Overfitting from Train/Val Gap', 'medium', 'Write detect_overfitting(train_score, val_score, threshold) (assuming higher is better) returning True if the gap between train_score and val_score exceeds threshold.', '(train_score - val_score) > threshold.', $py$def detect_overfitting(train_score, val_score, threshold):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "detect_overfitting(0.95, 0.80, 0.1)"
_actual = detect_overfitting(0.95, 0.80, 0.1)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "detect_overfitting(0.9, 0.88, 0.1)"
_actual = detect_overfitting(0.9, 0.88, 0.1)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000128', 7, 'Prefer the Simplest Model Within Tolerance', 'medium', 'Write select_within_tolerance(results, metric, higher_is_better, tolerance) where each result dict also has a ''complexity'' number. First find every model whose metric is within tolerance of the single best metric value, then return the name of the simplest (lowest complexity) model among those candidates.', 'Find the best metric value first, filter to results within `tolerance` of it, then take the min of that filtered list by ''complexity''.', $py$def select_within_tolerance(results, metric, higher_is_better, tolerance):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_results = [
    {"name": "a", "acc": 0.90, "complexity": 5},
    {"name": "b", "acc": 0.91, "complexity": 50},
    {"name": "c", "acc": 0.85, "complexity": 2},
]
_call_desc = "select_within_tolerance(results, 'acc', True, 0.02)"
_actual = select_within_tolerance(_results, "acc", True, 0.02)
_expected = "a"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "select_within_tolerance(results, 'acc', True, 0.001)"
_actual = select_within_tolerance(_results, "acc", True, 0.001)
_expected = "b"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000128', 8, 'Summarize Cross-Validation Folds', 'hard', 'Write cross_val_summary(fold_scores) (a list of floats from k-fold cross-validation) returning a dict with ''mean'', ''std'' (population standard deviation, both rounded to 4 decimals), ''min'', and ''max''.', 'Use the statistics module: statistics.mean and statistics.pstdev, plus builtin min/max.', $py$def cross_val_summary(fold_scores):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 4
_summary = cross_val_summary([0.8, 0.82, 0.79, 0.81])
_call_desc = "cross_val_summary([...])['mean']"
_actual = _summary["mean"]
_expected = 0.805
if abs(_actual - _expected) < 1e-4:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected ~{_expected!r}")
_call_desc = "cross_val_summary([...])['std']"
_actual = _summary["std"]
_expected = 0.0112
if abs(_actual - _expected) < 1e-3:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected ~{_expected!r}")
_call_desc = "cross_val_summary([...])['min']"
_actual = _summary["min"]
_expected = 0.79
if abs(_actual - _expected) < 1e-9:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected ~{_expected!r}")
_call_desc = "cross_val_summary([...])['max']"
_actual = _summary["max"]
_expected = 0.82
if abs(_actual - _expected) < 1e-9:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected ~{_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000128', 9, 'Find the Early-Stopping Point', 'hard', 'Write early_stopping_point(history, patience) where history is a list of validation scores (higher is better) across training iterations. Return the index at which training should stop: the first index where the score has failed to improve on the best-seen-so-far for `patience` consecutive iterations in a row. If it never stalls that long, return the last valid index (len(history) - 1).', 'Track the best score seen so far and a `stale` counter that resets to 0 on any new best and increments otherwise; return the current index once stale reaches patience.', $py$def early_stopping_point(history, patience):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "early_stopping_point([0.5, 0.6, 0.65, 0.64, 0.63, 0.62], 2)"
_actual = early_stopping_point([0.5, 0.6, 0.65, 0.64, 0.63, 0.62], 2)
_expected = 4
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "early_stopping_point([0.5, 0.6, 0.7, 0.8], 2)"
_actual = early_stopping_point([0.5, 0.6, 0.7, 0.8], 2)
_expected = 3
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000129', 1, 'Check Model Card Has Required Sections', 'easy', 'Write has_required_sections(card, required) (card is a dict, required is a list of key names) returning True only if every key in required is present in card with a non-empty (truthy) value.', 'all(card.get(k) for k in required) -- .get returns None (falsy) for a missing key, and an empty dict/list/string is also falsy.', $py$def has_required_sections(card, required):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_card = {"purpose": "x", "data": "y", "metrics": {"acc": 0.9}, "limitations": ["z"]}
_call_desc = "has_required_sections(card, ['purpose', 'data', 'metrics', 'limitations'])"
_actual = has_required_sections(_card, ["purpose", "data", "metrics", "limitations"])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_card2 = {"purpose": "x", "data": "y", "metrics": {}, "limitations": []}
_call_desc = "has_required_sections(card2, ['purpose', 'data', 'metrics', 'limitations'])"
_actual = has_required_sections(_card2, ["purpose", "data", "metrics", "limitations"])
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000129', 2, 'List Missing Model Card Fields', 'easy', 'Write missing_card_fields(card, required) returning a sorted list of keys from required that are missing from card or have a falsy (empty) value.', 'sorted(k for k in required if not card.get(k)).', $py$def missing_card_fields(card, required):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_card = {"purpose": "x", "metrics": {}}
_call_desc = "missing_card_fields(card, ['purpose', 'data', 'metrics', 'limitations'])"
_actual = missing_card_fields(_card, ["purpose", "data", "metrics", "limitations"])
_expected = ["data", "limitations", "metrics"]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "missing_card_fields({'a': 1, 'b': 2}, ['a', 'b'])"
_actual = missing_card_fields({"a": 1, "b": 2}, ["a", "b"])
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000129', 3, 'Format a Metrics Section', 'easy', 'Write format_metrics_section(metrics) (a dict of metric name -> value) returning a string with one ''- name: value'' line per metric, sorted alphabetically by metric name and joined with newlines.', 'Build a list of f"- {k}: {v}" strings from sorted(metrics.items()), then ''\n''.join(...) them.', $py$def format_metrics_section(metrics):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "format_metrics_section({'accuracy': 0.9, 'f1': 0.85})"
_actual = format_metrics_section({"accuracy": 0.9, "f1": 0.85})
_expected = "- accuracy: 0.9\n- f1: 0.85"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "format_metrics_section({})"
_actual = format_metrics_section({})
_expected = ""
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000129', 4, 'Build a Model Card Dict', 'medium', 'Write build_model_card(purpose, data_desc, metrics, limitations) returning a dict with keys ''purpose'', ''data'', ''metrics'' (a copy of the metrics dict), and ''limitations'' (a copy of the limitations list).', 'Wrap metrics in dict(...) and limitations in list(...) so the returned card doesn''t alias the caller''s original objects.', $py$def build_model_card(purpose, data_desc, metrics, limitations):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "build_model_card('p', 'd', {'acc': 0.9}, ['l1'])"
_actual = build_model_card("p", "d", {"acc": 0.9}, ["l1"])
_expected = {"purpose": "p", "data": "d", "metrics": {"acc": 0.9}, "limitations": ["l1"]}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "build_model_card('p2', 'd2', {}, [])"
_actual = build_model_card("p2", "d2", {}, [])
_expected = {"purpose": "p2", "data": "d2", "metrics": {}, "limitations": []}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000129', 5, 'Render a Model Card as Text', 'medium', 'Write render_model_card(card) (a dict with ''purpose'', ''data'', ''metrics'', ''limitations'' as in build_model_card) returning a single formatted string: ''## Purpose'' then the purpose text, a blank line, ''## Data'' then the data text, a blank line, ''## Metrics'' then one ''- key: value'' line per metric (sorted by key), a blank line, then ''## Limitations'' then one ''- '' line per limitation. Sections are joined with newlines, with no trailing newline at the very end.', 'Build a list of lines piece by piece (headings, content, empty strings for blank lines, then metric/limitation lines) and ''\n''.join(lines) at the end.', $py$def render_model_card(card):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_card = {
    "purpose": "Classify tickets.",
    "data": "12,000 tickets.",
    "metrics": {"accuracy": 0.9, "f1": 0.8},
    "limitations": ["English only."],
}
_expected = (
    "## Purpose\n"
    "Classify tickets.\n"
    "\n"
    "## Data\n"
    "12,000 tickets.\n"
    "\n"
    "## Metrics\n"
    "- accuracy: 0.9\n"
    "- f1: 0.8\n"
    "\n"
    "## Limitations\n"
    "- English only."
)
_call_desc = "render_model_card(card)"
_actual = render_model_card(_card)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_card2 = {"purpose": "P", "data": "D", "metrics": {}, "limitations": []}
_expected2 = "## Purpose\nP\n\n## Data\nD\n\n## Metrics\n\n## Limitations"
_call_desc = "render_model_card(card2) (empty metrics/limitations)"
_actual = render_model_card(_card2)
if _actual == _expected2:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected2!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected2!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000129', 6, 'Extract a Metric from Rendered Card Text', 'medium', 'Write extract_metric(card_text, metric_name) that parses a rendered model card (in the format produced by render_model_card) and returns the float value listed for metric_name under the ''## Metrics'' section, or None if it isn''t found there.', 'Split into lines, track whether you''re inside the ''## Metrics'' section (starts at a line == ''## Metrics'', ends at the next line starting with ''## ''), and match lines starting with f''- {metric_name}:''.', $py$def extract_metric(card_text, metric_name):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_text = "## Purpose\nP\n\n## Metrics\n- accuracy: 0.9\n- f1: 0.85\n\n## Limitations\n- none"
_call_desc = "extract_metric(text, 'f1')"
_actual = extract_metric(_text, "f1")
_expected = 0.85
if _actual is not None and abs(_actual - _expected) < 1e-9:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected ~{_expected!r}")
_call_desc = "extract_metric(text, 'recall')"
_actual = extract_metric(_text, "recall")
_expected = None
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000129', 7, 'Validate Limitations Are Substantive', 'medium', 'Write validate_limitations(limitations, min_count=1) (a list of strings) returning True if at least min_count of them are non-empty after stripping whitespace (i.e. not blank/whitespace-only).', 'Filter to entries where `l and l.strip()` is truthy, then compare the filtered count to min_count.', $py$def validate_limitations(limitations, min_count=1):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "validate_limitations(['English only.', '   ', 'Weak on class 5.'])"
_actual = validate_limitations(["English only.", "   ", "Weak on class 5."])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "validate_limitations(['   ', ''], 1)"
_actual = validate_limitations(["   ", ""], 1)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000129', 8, 'Score Model Card Completeness', 'hard', 'Write model_card_completeness_score(card, required_sections) returning the percentage (0-100, rounded to 1 decimal place) of required_sections that are present in card with a non-empty value.', 'count how many required keys are truthy in card via card.get(k), divide by len(required_sections), multiply by 100, and round.', $py$def model_card_completeness_score(card, required_sections):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_card = {"purpose": "p", "data": "d", "metrics": {}, "limitations": ["l"]}
_call_desc = "model_card_completeness_score(card, ['purpose', 'data', 'metrics', 'limitations'])"
_actual = model_card_completeness_score(_card, ["purpose", "data", "metrics", "limitations"])
_expected = 75.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected ~{_expected!r}")
_card2 = {"purpose": "p", "data": "d", "metrics": {"a": 1}, "limitations": ["l"]}
_call_desc = "model_card_completeness_score(card2, ['purpose', 'data', 'metrics', 'limitations'])"
_actual = model_card_completeness_score(_card2, ["purpose", "data", "metrics", "limitations"])
_expected = 100.0
if abs(_actual - _expected) < 1e-6:
    _passed += 1
    print(f"PASS: {_call_desc} ~= {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected ~{_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000129', 9, 'Compare Two Model Cards', 'hard', 'Write compare_model_cards(card_a, card_b, metric, higher_is_better=True) where each card is a dict with a ''metrics'' sub-dict. Return ''a'' if card_a wins on metric, ''b'' if card_b wins, or ''tie'' if equal, respecting higher_is_better.', 'Pull both metric values out first, then compare in the direction given by higher_is_better, falling back to ''tie'' when neither is strictly better.', $py$def compare_model_cards(card_a, card_b, metric, higher_is_better=True):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 3
_card_a = {"metrics": {"f1": 0.9}}
_card_b = {"metrics": {"f1": 0.85}}
_call_desc = "compare_model_cards(card_a, card_b, 'f1', True)"
_actual = compare_model_cards(_card_a, _card_b, "f1", True)
_expected = "a"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_card_c = {"metrics": {"loss": 0.2}}
_card_d = {"metrics": {"loss": 0.5}}
_call_desc = "compare_model_cards(card_c, card_d, 'loss', False)"
_actual = compare_model_cards(_card_c, _card_d, "loss", False)
_expected = "a"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_card_e = {"metrics": {"f1": 0.8}}
_card_f = {"metrics": {"f1": 0.8}}
_call_desc = "compare_model_cards(card_e, card_f, 'f1', True)"
_actual = compare_model_cards(_card_e, _card_f, "f1", True)
_expected = "tie"
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000130', 1, 'Check Deployment Bundle Readiness', 'easy', 'Write is_deployment_ready(bundle, required_keys) (bundle is a dict) returning True only if every key in required_keys is present in bundle with a non-None value.', 'all(bundle.get(k) is not None for k in required_keys).', $py$def is_deployment_ready(bundle, required_keys):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_bundle = {"model": "m", "config": {"x": 1}, "version": "1.0"}
_call_desc = "is_deployment_ready(bundle, ['model', 'config', 'version'])"
_actual = is_deployment_ready(_bundle, ["model", "config", "version"])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_bundle2 = {"model": "m", "config": {"x": 1}}
_call_desc = "is_deployment_ready(bundle2, ['model', 'config', 'version'])"
_actual = is_deployment_ready(_bundle2, ["model", "config", "version"])
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000130', 2, 'Validate a Prediction Request Shape', 'easy', 'Write validate_prediction_request(request, required_fields) (request is a dict) returning True if every field in required_fields is a key in request.', 'all(field in request for field in required_fields).', $py$def validate_prediction_request(request, required_fields):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "validate_prediction_request({'features': [1, 2, 3]}, ['features'])"
_actual = validate_prediction_request({"features": [1, 2, 3]}, ["features"])
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "validate_prediction_request({}, ['features'])"
_actual = validate_prediction_request({}, ["features"])
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000130', 3, 'Build a Prediction Response', 'easy', 'Write build_prediction_response(prediction, confidence) returning {''prediction'': prediction, ''confidence'': confidence rounded to 4 decimal places}.', '{''prediction'': prediction, ''confidence'': round(confidence, 4)}.', $py$def build_prediction_response(prediction, confidence):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "build_prediction_response('spam', 0.987654)"
_actual = build_prediction_response("spam", 0.987654)
_expected = {"prediction": "spam", "confidence": 0.9877}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "build_prediction_response(1, 0.5)"
_actual = build_prediction_response(1, 0.5)
_expected = {"prediction": 1, "confidence": 0.5}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000130', 4, 'Pass the Readiness Checklist', 'medium', 'Write passes_readiness_checklist(checklist) (a dict mapping check name -> bool) returning True only if every check passed.', 'all(checklist.values()).', $py$def passes_readiness_checklist(checklist):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "passes_readiness_checklist({'tests_pass': True, 'model_saved': True, 'config_valid': True})"
_actual = passes_readiness_checklist({"tests_pass": True, "model_saved": True, "config_valid": True})
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "passes_readiness_checklist({'tests_pass': True, 'model_saved': False})"
_actual = passes_readiness_checklist({"tests_pass": True, "model_saved": False})
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000130', 5, 'List Failing Readiness Checks', 'medium', 'Write failing_checks(checklist) (a dict mapping check name -> bool) returning a sorted list of the check names whose value is False.', 'sorted(k for k, v in checklist.items() if not v).', $py$def failing_checks(checklist):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "failing_checks({'tests_pass': True, 'model_saved': False, 'config_valid': False})"
_actual = failing_checks({"tests_pass": True, "model_saved": False, "config_valid": False})
_expected = ["config_valid", "model_saved"]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "failing_checks({'a': True, 'b': True})"
_actual = failing_checks({"a": True, "b": True})
_expected = []
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000130', 6, 'Sanitize an Incoming Request', 'medium', 'Write sanitize_request(request, allowed_fields) (a dict) returning a new dict containing only the key/value pairs whose key is in allowed_fields.', 'A dict comprehension: {k: v for k, v in request.items() if k in allowed_fields}.', $py$def sanitize_request(request, allowed_fields):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "sanitize_request({'features': [1, 2], 'debug': True}, ['features'])"
_actual = sanitize_request({"features": [1, 2], "debug": True}, ["features"])
_expected = {"features": [1, 2]}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "sanitize_request({'a': 1}, ['x', 'y'])"
_actual = sanitize_request({"a": 1}, ["x", "y"])
_expected = {}
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000130', 7, 'Decide If a Rollback Is Needed', 'medium', 'Write rollback_needed(current_error_rate, baseline_error_rate, max_increase) returning True if the current error rate has risen more than max_increase above the baseline.', '(current_error_rate - baseline_error_rate) > max_increase.', $py$def rollback_needed(current_error_rate, baseline_error_rate, max_increase):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "rollback_needed(0.08, 0.02, 0.03)"
_actual = rollback_needed(0.08, 0.02, 0.03)
_expected = True
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "rollback_needed(0.03, 0.02, 0.03)"
_actual = rollback_needed(0.03, 0.02, 0.03)
_expected = False
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000130', 8, 'Validate a Bundle Against a Schema', 'hard', 'Write validate_bundle_schema(bundle, schema) where schema is a dict of key -> expected type. Return a sorted list of keys that are either missing from bundle or present with the wrong type (checked with isinstance).', 'For each (key, expected_type) in schema.items(), flag it if key not in bundle or not isinstance(bundle[key], expected_type).', $py$def validate_bundle_schema(bundle, schema):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_schema = {"model": str, "version": str, "threshold": float}
_bundle = {"model": "m", "version": 1.0, "threshold": 0.5}
_call_desc = "validate_bundle_schema(bundle, schema)"
_actual = validate_bundle_schema(_bundle, _schema)
_expected = ["version"]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_bundle2 = {"model": "m", "version": "1.0"}
_call_desc = "validate_bundle_schema(bundle2, schema) (missing key)"
_actual = validate_bundle_schema(_bundle2, _schema)
_expected = ["threshold"]
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$),
  ('00000000-0000-0000-0000-000000000016', '10000000-0000-0000-0000-000000000130', 9, 'Split Traffic for a Canary Rollout', 'hard', 'Write canary_traffic_split(total_requests, canary_percent) returning a tuple (canary_count, stable_count) where canary_count is total_requests * canary_percent / 100 rounded to the nearest whole request, and stable_count is the remainder.', 'round(total_requests * canary_percent / 100) for the canary count, then subtract from total_requests for the rest.', $py$def canary_traffic_split(total_requests, canary_percent):
    # TODO
    pass
$py$, $py$_passed = 0
_total = 2
_call_desc = "canary_traffic_split(1000, 5)"
_actual = canary_traffic_split(1000, 5)
_expected = (50, 950)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
_call_desc = "canary_traffic_split(200, 10)"
_actual = canary_traffic_split(200, 10)
_expected = (20, 180)
if _actual == _expected:
    _passed += 1
    print(f"PASS: {_call_desc} == {_expected!r}")
else:
    print(f"FAIL: {_call_desc} returned {_actual!r}, expected {_expected!r}")
print(f"{_passed}/{_total} tests passed")
$py$);
