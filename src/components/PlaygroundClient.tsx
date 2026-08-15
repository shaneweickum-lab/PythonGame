"use client";

import { useEffect, useRef, useState } from "react";
import { createClient } from "@/lib/supabase/client";
import { isSupabaseConfigured } from "@/lib/supabase/config";
import { PyodideEditor, type PyodideEditorHandle } from "@/components/PyodideEditor";

const STARTER_CODE = `print("Hello, Python!")

for i in range(5):
    print(i ** 2)
`;

type ProjectOption = {
  id: string;
  title: string;
};

export function PlaygroundClient({ hideHeader = false }: { hideHeader?: boolean } = {}) {
  const [projects, setProjects] = useState<ProjectOption[]>([]);
  const [selectedProjectId, setSelectedProjectId] = useState("");
  const [saveState, setSaveState] = useState<"idle" | "saving" | "saved" | "error">("idle");

  const editorRef = useRef<PyodideEditorHandle>(null);

  useEffect(() => {
    if (!isSupabaseConfigured()) return;
    const supabase = createClient();
    supabase
      .from("projects")
      .select("id, title")
      .order("title")
      .then(({ data }) => {
        if (data) setProjects(data as ProjectOption[]);
      });
  }, []);

  async function saveToProject() {
    if (!selectedProjectId || !editorRef.current) return;
    setSaveState("saving");
    const supabase = createClient();
    const {
      data: { user },
    } = await supabase.auth.getUser();

    if (!user) {
      setSaveState("error");
      return;
    }

    const { error } = await supabase.from("project_progress").upsert(
      {
        user_id: user.id,
        project_id: selectedProjectId,
        code_snapshot: editorRef.current.getCode(),
      },
      { onConflict: "user_id,project_id" },
    );

    setSaveState(error ? "error" : "saved");
    if (!error) {
      setTimeout(() => setSaveState("idle"), 2000);
    }
  }

  return (
    <div className="space-y-4">
      {!hideHeader && (
        <div>
          <h1 className="text-2xl font-semibold text-slate-100">Playground</h1>
          <p className="mt-1 text-sm text-slate-400">
            Runs entirely in your browser via Pyodide (Python compiled to
            WebAssembly) -- no server execution involved.
          </p>
        </div>
      )}

      <PyodideEditor
        ref={editorRef}
        initialCode={STARTER_CODE}
        extraControls={
          <>
            <select
              value={selectedProjectId}
              onChange={(e) => setSelectedProjectId(e.target.value)}
              className="rounded-md border border-slate-700 bg-slate-800 px-2 py-1.5 text-sm text-slate-200"
            >
              <option value="">Save to project...</option>
              {projects.map((p) => (
                <option key={p.id} value={p.id}>
                  {p.title}
                </option>
              ))}
            </select>
            <button
              type="button"
              onClick={saveToProject}
              disabled={!selectedProjectId || saveState === "saving"}
              className="rounded-md border border-slate-700 px-3 py-1.5 text-sm text-slate-200 hover:bg-slate-800 disabled:opacity-50"
            >
              {saveState === "saving"
                ? "Saving..."
                : saveState === "saved"
                  ? "Saved ✓"
                  : saveState === "error"
                    ? "Failed"
                    : "Save"}
            </button>
          </>
        }
      />
    </div>
  );
}
