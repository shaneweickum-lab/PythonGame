export type FriendlyError = { message: string; line: number | null; kind: string };
export type RunMode = "canvas" | "terminal";
export type RunOptions = {
  onError?: (err: FriendlyError) => void;
  mode?: RunMode;
  getModuleSource?: (name?: string) => string | null | undefined;
  onPrint?: (text: string) => void;
  onInputRequest?: (prompt: string, resolve: (value: string) => void) => void;
};

export class Sketch {
  constructor(canvas: HTMLCanvasElement);
  stop(): void;
  isRunning(): boolean;
  run(mainSource: string, options?: RunOptions): boolean;
}
