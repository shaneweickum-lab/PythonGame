"use server";

import { redirect } from "next/navigation";
import { createClient } from "@/lib/supabase/server";

export type SignUpState = { type: "error" | "info"; text: string } | null;

export async function signUp(
  _prevState: SignUpState,
  formData: FormData,
): Promise<SignUpState> {
  const email = String(formData.get("email") ?? "");
  const password = String(formData.get("password") ?? "");

  const supabase = await createClient();
  const { data, error } = await supabase.auth.signUp({ email, password });

  if (error) {
    return { type: "error", text: error.message };
  }

  if (data.session) {
    redirect("/dashboard");
  }

  return {
    type: "info",
    text: "Account created, but no session was returned -- this Supabase project likely still has \"Confirm email\" turned on. Turn it off under Authentication -> Providers -> Email (or Auth settings) for password-only testing, then sign in.",
  };
}
