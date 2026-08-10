import type { PyodideAPI } from "pyodide";

// Load pyodide.mjs as a real browser ES module import from the static
// /pyodide/ assets rather than letting Turbopack/webpack bundle the
// "pyodide" package -- its internal Node-detection code contains a dynamic
// require the bundler can't statically analyze and fails on at runtime.
// `new Function` hides the specifier from the bundler entirely.
const dynamicImport: (specifier: string) => Promise<{
  loadPyodide: (options?: { indexURL: string }) => Promise<PyodideAPI>;
}> = new Function("specifier", "return import(specifier)") as never;

let pyodidePromise: Promise<PyodideAPI> | null = null;

export function getPyodide(): Promise<PyodideAPI> {
  if (!pyodidePromise) {
    pyodidePromise = (async () => {
      const { loadPyodide } = await dynamicImport("/pyodide/pyodide.mjs");
      return loadPyodide({ indexURL: "/pyodide/" });
    })();
  }
  return pyodidePromise;
}
