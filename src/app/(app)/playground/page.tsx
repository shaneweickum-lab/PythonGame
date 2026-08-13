import { Suspense } from "react";
import { PlaygroundModeSwitch } from "@/components/PlaygroundModeSwitch";

export default function PlaygroundPage() {
  return (
    <Suspense fallback={null}>
      <PlaygroundModeSwitch />
    </Suspense>
  );
}
