// Static quick-reference panel, ported from BambooGrove IDE's ide.html
// Reference tab -- a data table instead of hand-written markup so the
// literal `{`/`}` characters in string-formatting/vector descriptions
// don't need JSX escaping.
type ReferenceItem = { term: string; desc: string };
type ReferenceSection = { title: string; items: ReferenceItem[]; note?: string };

const SECTIONS: ReferenceSection[] = [
  {
    title: "Syntax",
    items: [
      { term: "def name(params):", desc: "Define a function." },
      { term: "# comment", desc: "Single-line comment." },
      { term: "if / elif / else", desc: "Conditionals, Python-style indentation." },
      { term: "for i in range(n):", desc: "Loop n times, i from 0." },
      { term: "while cond:", desc: "Loop while cond is true." },
      { term: "and / or / not", desc: "Boolean operators." },
      { term: "[1, 2, 3]", desc: "List literal; index with list[0]." },
      { term: "return value", desc: "Return from a function (inside a def only)." },
      {
        term: 'f"hi {name}!"',
        desc: 'f-string: anything inside { ... } is evaluated and inserted. Use {{ / }} for a literal brace, and {x:.2f} to fix a number to 2 decimal places.',
      },
    ],
  },
  {
    title: "Lint panel",
    items: [],
    note: 'A "Lint" panel appears below the editor as you type, pointing out likely mistakes that aren\'t fatal syntax errors -- mixing naming styles (e.g. totalScore alongside total_score), two very-similarly-named variables that might be a typo, a variable that\'s assigned but never used, comparing directly with True/False, shadowing a built-in name, or a line that\'s gotten too long. Click an item to jump the cursor to that line. It disappears once there\'s nothing left to flag.',
  },
  {
    title: "Lifecycle",
    items: [
      { term: "def setup():", desc: "Runs once, when the sketch starts." },
      { term: "def draw():", desc: "Runs once per frame, forever (unless no_loop())." },
      { term: "no_loop() / loop()", desc: "Stop / resume the draw() loop." },
      { term: "frame_count / frameCount", desc: "Frames drawn so far." },
    ],
  },
  {
    title: "Drawing",
    items: [
      { term: "background(r, g, b)", desc: "Fill the whole canvas." },
      { term: "stroke(r, g, b) / fill(r, g, b)", desc: "Set outline / fill color. Also accept a single gray value, or a color() value." },
      { term: "no_stroke() / no_fill()", desc: "Turn outline / fill off (also noStroke()/noFill())." },
      { term: "line(x1, y1, x2, y2)", desc: "Straight line between two points." },
      { term: "rect(x, y, w, h)", desc: "Rectangle. Position meaning depends on rectMode()." },
      { term: "circle(x, y, r)", desc: "Circle centered at (x, y) with radius r." },
      { term: "ellipse(x, y, w, h)", desc: "Ellipse; position meaning depends on ellipseMode()." },
      { term: "arc(x, y, w, h, start, stop)", desc: "Arc of an ellipse, angles in radians." },
      { term: "triangle(...) / quad(...)", desc: "3- or 4-point polygon from raw coordinates." },
      { term: "square(x, y, s)", desc: "Shorthand for rect(x, y, s, s)." },
      { term: "point(x, y)", desc: "A single dot, sized by strokeWeight()." },
      { term: "text(string, x, y)", desc: "Draw text; see textSize()/textAlign()/textFont()." },
    ],
  },
  {
    title: "Turtle movement",
    items: [
      { term: "forward(distance)", desc: "Move forward, drawing if the pen is down." },
      { term: "turn(degrees)", desc: "Rotate heading (clockwise-positive). Aliases: right(), left(-degrees)." },
      { term: "pen_up() / pen_down()", desc: "Stop / resume drawing while moving." },
      { term: "go_to(x, y)", desc: "Move to an absolute position." },
      { term: "home()", desc: "Return to the canvas center, heading reset to 0 (up)." },
    ],
  },
  {
    title: "Color",
    items: [
      { term: "color(r, g, b, a)", desc: "Build a reusable color value." },
      { term: "red()/green()/blue()/alpha()", desc: "Read a channel back out of a color() value." },
      { term: "lerpColor(c1, c2, amt)", desc: "Blend between two colors." },
      { term: 'colorMode("rgb" | "hsb", ...)', desc: "Switch how color channels are interpreted." },
    ],
  },
  {
    title: "Transform",
    items: [
      { term: "push() / pop()", desc: "Save / restore the current style + position/rotation." },
      { term: "translate(x, y)", desc: "Shift the origin." },
      { term: "rotate(angle)", desc: "Rotate around the origin, radians." },
      { term: "scale(x, y)", desc: "Scale subsequent drawing." },
    ],
  },
  {
    title: "Math",
    items: [
      { term: "abs/ceil/floor/round/sq/sqrt/pow", desc: "Basic math." },
      { term: "sin/cos/tan(angle)", desc: "Trig, angle in radians." },
      { term: "radians(deg) / degrees(rad)", desc: "Angle unit conversion." },
      { term: "constrain(n, low, high)", desc: "Clamp a number to a range." },
      { term: "dist(x1, y1, x2, y2)", desc: "Distance between two points." },
      { term: "lerp(start, stop, amt)", desc: "Interpolate between two numbers." },
      { term: "map(v, s1, e1, s2, e2)", desc: "Remap a number from one range to another." },
      { term: "random() / random(max) / random(min, max)", desc: "Random number; also random(a_list) picks a random item." },
      { term: "randomSeed(n)", desc: "Make random() repeatable." },
    ],
  },
  {
    title: "Input & events",
    items: [
      { term: "mouse_x / mouse_y (mouseX/mouseY)", desc: "Current mouse position." },
      { term: "is_pressed() / mouseIsPressed", desc: "Is a mouse button currently down?" },
      { term: "key_pressed / key / keyIsPressed", desc: "Last key, and whether one is currently down." },
      { term: "def mousePressed():", desc: "Called on mouse-down (also mouseReleased, mouseClicked, mouseMoved, mouseDragged)." },
      { term: "def keyPressed():", desc: "Called on key-down (also keyReleased)." },
    ],
  },
  {
    title: "Terminal tab",
    items: [
      { term: "print(value, ...)", desc: "Write a line to the terminal. Works in both Canvas and Terminal mode." },
      { term: "input(prompt)", desc: "Terminal mode only: pause and wait for the user to type a line." },
    ],
    note: "Terminal mode runs the same code top-to-bottom as a plain script -- no setup()/draw() needed, and canvas-drawing functions aren't available there.",
  },
  {
    title: "Modules (multi-file projects)",
    items: [
      { term: "import name", desc: "Import a sibling name.bs file; call its functions as name.function()." },
      { term: "from name import fn", desc: "Import one function directly. Add as alias to rename it." },
    ],
    note: "Use the file chips above the editor to add and switch between files in the same project.",
  },
  {
    title: "Curves & custom shapes",
    items: [
      { term: "bezier(x1,y1, x2,y2, x3,y3, x4,y4)", desc: "A curved line through two control points." },
      { term: 'beginShape() / vertex(x, y) / endShape(mode)', desc: 'Build a custom polygon from any number of points. Pass "close" to endShape to close it into a filled shape.' },
    ],
  },
  {
    title: "Noise",
    items: [
      { term: "noise(x, y, z)", desc: "Smooth pseudo-random value (Perlin noise), unlike random() which jumps around." },
      { term: "noiseDetail(octaves, falloff)", desc: "Adjust noise's texture -- more octaves add finer detail." },
      { term: "noiseSeed(n)", desc: "Make noise() repeatable." },
    ],
  },
  {
    title: "Vector",
    items: [
      { term: "createVector(x, y, z)", desc: "A position/direction with .x/.y/.z." },
      { term: "v.add(other) / v.sub(other)", desc: "Add/subtract another vector, in place." },
      { term: "v.mult(n) / v.div(n)", desc: "Scale by a number, in place." },
      { term: "v.mag() / v.normalize() / v.limit(max)", desc: "Length; scale to length 1; cap the length." },
      { term: "v.heading() / v.rotate(angle)", desc: "Direction in radians; rotate in place." },
      { term: "v.dist(other) / v.dot(other)", desc: "Distance to / dot product with another vector." },
      { term: "v.copy()", desc: "An independent duplicate (methods mutate the original otherwise)." },
    ],
    note: "There's no +/- for vectors (JS has no operator overloading) -- use the methods above, the same way real p5.js sketches do.",
  },
  {
    title: "Data conversion",
    items: [
      { term: "int(v) / float(v)", desc: "Convert a string or boolean to a number." },
      { term: "str(v)", desc: "Convert anything to text (numbers, True/False, lists)." },
      { term: "boolean(v)", desc: "Convert to True/False using the same rules as if." },
    ],
  },
  {
    title: "Lists",
    items: [
      { term: "len(list)", desc: "Number of items in a list (or characters in a string)." },
      { term: "list.append(value)", desc: "Add value to the end of list, growing it by one." },
    ],
  },
  {
    title: "Strings",
    items: [
      { term: "s.upper() / s.lower()", desc: "Uppercase / lowercase copy." },
      { term: "s.strip()", desc: "Trim whitespace from both ends (lstrip()/rstrip() for one side); pass a string of characters to strip those instead." },
      { term: "s.split()", desc: "Split on any run of whitespace. s.split(sep) splits on a literal separator instead." },
      { term: "s.replace(old, new)", desc: "Replace every occurrence of old with new." },
      { term: "sep.join(list)", desc: "Join a list of strings together with sep between each one." },
      { term: "s.startswith(x) / s.endswith(x)", desc: "True/False prefix/suffix check." },
      { term: "s.find(x)", desc: "Index of the first match, or -1 if not found (rfind() searches from the end)." },
      { term: "s.index(x)", desc: "Like find(), but stops the script with an error if x isn't found." },
      { term: "s.count(x)", desc: "How many non-overlapping times x appears." },
      { term: "s.title() / s.capitalize()", desc: "Capitalize each word / just the first letter." },
      { term: "s.isdigit() / s.isalpha() / s.isspace()", desc: "True/False checks on the whole string (also isalnum(), isupper(), islower())." },
      { term: "s.zfill(width)", desc: "Pad with leading zeros up to width, keeping a +/- sign in front." },
      { term: '"ab" * 3', desc: "Repeats a string (or a list: [1, 2] * 3)." },
    ],
    note: "These match Python's own string methods exactly -- a Terminal-tab script that sticks to print()/input() and these methods can be copied straight into a real Python interpreter and run the same.",
  },
];

export function BambooReference() {
  return (
    <div className="grid gap-5 overflow-y-auto p-4 sm:grid-cols-2">
      {SECTIONS.map((section) => (
        <section key={section.title}>
          <h3 className="mb-2 text-sm font-semibold text-slate-100">{section.title}</h3>
          {section.items.length > 0 && (
            <dl className="space-y-1.5">
              {section.items.map((item) => (
                <div key={item.term}>
                  <dt>
                    <code className="rounded bg-slate-800 px-1.5 py-0.5 font-mono text-xs text-emerald-300">
                      {item.term}
                    </code>
                  </dt>
                  <dd className="mt-0.5 text-xs text-slate-400">{item.desc}</dd>
                </div>
              ))}
            </dl>
          )}
          {section.note && <p className="mt-1.5 text-xs text-slate-500">{section.note}</p>}
        </section>
      ))}
    </div>
  );
}
