// A minimal, dependency-free renderer for the small markdown subset used in
// concepts.lesson_content: ## headings, ```-fenced code blocks, "- " bullet
// lists, blank-line-separated paragraphs, and `inline code` spans. Not a
// general markdown parser -- just enough for hand-written lesson content.

function renderInline(text: string, keyPrefix: string) {
  const parts = text.split(/`([^`]+)`/g);
  return parts.map((part, i) =>
    i % 2 === 1 ? (
      <code
        key={`${keyPrefix}-${i}`}
        className="rounded bg-slate-800 px-1.5 py-0.5 font-mono text-[0.85em] text-emerald-300"
      >
        {part}
      </code>
    ) : (
      <span key={`${keyPrefix}-${i}`}>{part}</span>
    ),
  );
}

type Block =
  | { type: "code"; lang: string; code: string }
  | { type: "heading"; text: string }
  | { type: "list"; items: string[] }
  | { type: "paragraph"; text: string };

function parseBlocks(content: string): Block[] {
  const blocks: Block[] = [];
  const codeFenceRe = /```(\w*)\n([\s\S]*?)```/g;

  let lastIndex = 0;
  let match: RegExpExecArray | null;

  const pushTextBlocks = (text: string) => {
    const lines = text.split("\n");
    let currentParagraph: string[] = [];
    let currentList: string[] = [];

    const flushParagraph = () => {
      if (currentParagraph.length > 0) {
        blocks.push({ type: "paragraph", text: currentParagraph.join(" ").trim() });
        currentParagraph = [];
      }
    };
    const flushList = () => {
      if (currentList.length > 0) {
        blocks.push({ type: "list", items: currentList });
        currentList = [];
      }
    };

    for (const rawLine of lines) {
      const line = rawLine.trim();
      if (line === "") {
        flushParagraph();
        flushList();
      } else if (line.startsWith("## ")) {
        flushParagraph();
        flushList();
        blocks.push({ type: "heading", text: line.slice(3) });
      } else if (line.startsWith("- ")) {
        flushParagraph();
        currentList.push(line.slice(2));
      } else {
        flushList();
        currentParagraph.push(line);
      }
    }
    flushParagraph();
    flushList();
  };

  while ((match = codeFenceRe.exec(content)) !== null) {
    pushTextBlocks(content.slice(lastIndex, match.index));
    blocks.push({ type: "code", lang: match[1], code: match[2].replace(/\n$/, "") });
    lastIndex = codeFenceRe.lastIndex;
  }
  pushTextBlocks(content.slice(lastIndex));

  return blocks;
}

export function MarkdownLite({ content }: { content: string }) {
  const blocks = parseBlocks(content);

  return (
    <div className="space-y-4">
      {blocks.map((block, i) => {
        const key = `block-${i}`;
        if (block.type === "heading") {
          return (
            <h3 key={key} className="text-base font-semibold text-slate-100">
              {renderInline(block.text, key)}
            </h3>
          );
        }
        if (block.type === "list") {
          return (
            <ul key={key} className="list-disc space-y-1 pl-5 text-sm text-slate-300">
              {block.items.map((item, j) => (
                <li key={`${key}-${j}`}>{renderInline(item, `${key}-${j}`)}</li>
              ))}
            </ul>
          );
        }
        if (block.type === "code") {
          return (
            <pre
              key={key}
              className="overflow-auto rounded-md border border-slate-800 bg-black p-3 font-mono text-sm text-slate-200"
            >
              {block.code}
            </pre>
          );
        }
        if (block.text === "") return null;
        return (
          <p key={key} className="text-sm leading-relaxed text-slate-300">
            {renderInline(block.text, key)}
          </p>
        );
      })}
    </div>
  );
}
