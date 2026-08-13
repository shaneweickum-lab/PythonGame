// Supabase-backed replacement for BambooGrove IDE's original storage.js
// (which was localStorage-only). Same shape -- a "project" is a flat group
// of files sharing a `project_id`, and the entry file's own `id` doubles as
// its project's id -- just persisted server-side so it syncs across
// devices like every other table in this app, per bamboo_files
// (migration 0006).
import { createClient } from "@/lib/supabase/client";
import type { BambooFile } from "@/lib/supabase/types";

export function sanitizeName(name: string): string {
  let n = (name || "").trim();
  if (!n) n = "main";
  if (!n.toLowerCase().endsWith(".bs")) n += ".bs";
  return n;
}

// The name an `import`/`from ... import` statement would use to refer to
// this file: its filename without the .bs extension.
export function moduleNameOf(entry: Pick<BambooFile, "name">): string {
  return entry.name.replace(/\.bs$/i, "");
}

function makeId(): string {
  return crypto.randomUUID();
}

export const bambooStorage = {
  async listFiles(): Promise<BambooFile[]> {
    const supabase = createClient();
    const { data, error } = await supabase
      .from("bamboo_files")
      .select("*")
      .order("updated_at", { ascending: false });
    if (error) throw error;
    return (data ?? []) as BambooFile[];
  },

  async getFile(id: string): Promise<string> {
    const supabase = createClient();
    const { data, error } = await supabase
      .from("bamboo_files")
      .select("content")
      .eq("id", id)
      .maybeSingle();
    if (error) throw error;
    return data?.content ?? "";
  },

  async createFile(name = "main.bs", content = ""): Promise<BambooFile> {
    const supabase = createClient();
    const id = makeId();
    const entry = {
      id,
      project_id: id,
      name: sanitizeName(name),
      content,
      updated_at: new Date().toISOString(),
    };
    const { error } = await supabase.from("bamboo_files").insert(entry);
    if (error) throw error;
    return entry as BambooFile;
  },

  // A new sibling module file within an existing project: importable by
  // name from any file that shares this project_id.
  async createProjectFile(projectId: string, name: string, content = ""): Promise<BambooFile> {
    const supabase = createClient();
    const entry = {
      id: makeId(),
      project_id: projectId,
      name: sanitizeName(name),
      content,
      updated_at: new Date().toISOString(),
    };
    const { error } = await supabase.from("bamboo_files").insert(entry);
    if (error) throw error;
    return entry as BambooFile;
  },

  // Every file sharing a project, entry file first, then siblings
  // alphabetically -- the flat-folder "main.bs + siblings" convention.
  async listProjectFiles(projectId: string): Promise<BambooFile[]> {
    const supabase = createClient();
    const { data, error } = await supabase
      .from("bamboo_files")
      .select("*")
      .eq("project_id", projectId);
    if (error) throw error;
    const files = (data ?? []) as BambooFile[];
    files.sort((a, b) => {
      if (a.id === projectId) return -1;
      if (b.id === projectId) return 1;
      return a.name.localeCompare(b.name);
    });
    return files;
  },

  async saveFile(id: string, content: string): Promise<void> {
    const supabase = createClient();
    const { error } = await supabase
      .from("bamboo_files")
      .update({ content, updated_at: new Date().toISOString() })
      .eq("id", id);
    if (error) throw error;
  },

  async renameFile(id: string, newName: string): Promise<BambooFile> {
    const supabase = createClient();
    const name = sanitizeName(newName);
    const { data, error } = await supabase
      .from("bamboo_files")
      .update({ name, updated_at: new Date().toISOString() })
      .eq("id", id)
      .select()
      .single();
    if (error) throw error;
    return data as BambooFile;
  },

  async deleteFile(id: string): Promise<void> {
    const supabase = createClient();
    const { error } = await supabase.from("bamboo_files").delete().eq("id", id);
    if (error) throw error;
  },
};

// Fetches every file in a project up front and returns a synchronous
// `getModuleSource(name)` lookup over the in-memory result (see
// src/lib/bamboo/modules.js -- import resolution happens synchronously
// while assembling a project, so the fetch has to happen before that, not
// inside it).
export async function fetchModuleSourceLookup(
  projectId: string,
): Promise<(name?: string) => string | null> {
  const files = await bambooStorage.listProjectFiles(projectId);
  const byModuleName = new Map(files.map((f) => [moduleNameOf(f), f.content]));
  return (name?: string) => (name !== undefined ? (byModuleName.get(name) ?? null) : null);
}

export function downloadFile(name: string, content: string) {
  const blob = new Blob([content], { type: "text/x-bamboo-script" });
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = sanitizeName(name);
  document.body.appendChild(a);
  a.click();
  a.remove();
  URL.revokeObjectURL(url);
}

export function readUploadedFile(file: File): Promise<string> {
  return file.text();
}
