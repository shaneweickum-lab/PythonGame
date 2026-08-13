"use client";

import { useState } from "react";
import { useSearchParams } from "next/navigation";
import { PlaygroundClient } from "@/components/PlaygroundClient";
import { BambooEditor } from "@/components/bamboo/BambooEditor";

type Mode = "python" | "bamboo";

const MODES: { value: Mode; label: string; desc: string }[] = [
  { value: "python", label: "Python", desc: "Real Python (Pyodide/WebAssembly), no server execution." },
  { value: "bamboo", label: "BambooScript", desc: "A Python-like language that draws to a canvas -- p5.js/Processing style." },
];

export function PlaygroundModeSwitch() {
  const searchParams = useSearchParams();
  const [mode, setMode] = useState<Mode>(searchParams.get("mode") === "bamboo" ? "bamboo" : "python");
  const active = MODES.find((m) => m.value === mode)!;

  return (
    <div className="space-y-4">
      <div>
        <h1 className="text-2xl font-semibold text-slate-100">Playground</h1>
        <p className="mt-1 text-sm text-slate-400">{active.desc}</p>
      </div>

      <div className="inline-flex rounded-md border border-slate-800 bg-slate-900 p-1">
        {MODES.map((m) => (
          <button
            key={m.value}
            type="button"
            onClick={() => setMode(m.value)}
            className={`rounded px-3 py-1.5 text-sm font-medium transition-colors ${
              mode === m.value ? "bg-emerald-600 text-white" : "text-slate-400 hover:bg-slate-800"
            }`}
          >
            {m.label}
          </button>
        ))}
      </div>

      {mode === "python" ? <PlaygroundClient hideHeader /> : <BambooEditor />}
    </div>
  );
}
