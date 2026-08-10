// Copies the Pyodide runtime (wasm, stdlib, loader) from node_modules into
// public/pyodide/ so the browser can fetch it locally instead of a CDN.
// Runs automatically via the "postinstall" npm script. The copied files are
// gitignored -- they're regenerated on every install/deploy.
import { copyFile, mkdir } from "node:fs/promises";
import { existsSync } from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const root = path.resolve(__dirname, "..");
const srcDir = path.join(root, "node_modules", "pyodide");
const destDir = path.join(root, "public", "pyodide");

const FILES = [
  "pyodide.mjs",
  "pyodide.mjs.map",
  "pyodide.asm.mjs",
  "pyodide.asm.wasm",
  "python_stdlib.zip",
  "pyodide-lock.json",
];

async function main() {
  if (!existsSync(srcDir)) {
    console.warn("[copy-pyodide-assets] node_modules/pyodide not found, skipping.");
    return;
  }

  await mkdir(destDir, { recursive: true });

  for (const file of FILES) {
    const src = path.join(srcDir, file);
    if (!existsSync(src)) continue;
    await copyFile(src, path.join(destDir, file));
  }

  console.log(`[copy-pyodide-assets] Copied Pyodide runtime to ${path.relative(root, destDir)}/`);
}

main();
