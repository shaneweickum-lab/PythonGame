"use client";

import { PyodideEditor } from "@/components/PyodideEditor";

export function LessonPlayground({ starterCode }: { starterCode: string }) {
  return (
    <div className="space-y-2">
      <h2 className="text-sm font-semibold uppercase tracking-wide text-slate-500">
        Practice
      </h2>
      <p className="text-sm text-slate-400">
        Try it yourself -- tweak the example, break it, fix it, run it again.
      </p>
      <PyodideEditor initialCode={starterCode} height="h-64" />
    </div>
  );
}
