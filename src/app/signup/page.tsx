"use client";

import Link from "next/link";
import { useActionState } from "react";
import { signUp } from "./actions";

export default function SignUpPage() {
  const [state, formAction, pending] = useActionState(signUp, null);

  return (
    <main className="flex flex-1 items-center justify-center px-4">
      <form
        action={formAction}
        className="w-full max-w-sm space-y-4 rounded-lg border border-slate-800 bg-slate-900 p-8"
      >
        <div>
          <h1 className="text-xl font-semibold text-slate-100">
            Python Mastery Tracker
          </h1>
          <p className="mt-1 text-sm text-slate-400">
            Create an account (testing only -- no email verification).
          </p>
        </div>

        <div className="space-y-1">
          <label htmlFor="email" className="block text-sm text-slate-300">
            Email
          </label>
          <input
            id="email"
            name="email"
            type="email"
            required
            autoComplete="email"
            className="w-full rounded-md border border-slate-700 bg-slate-800 px-3 py-2 text-sm text-slate-100 outline-none focus:border-emerald-500"
          />
        </div>

        <div className="space-y-1">
          <label htmlFor="password" className="block text-sm text-slate-300">
            Password
          </label>
          <input
            id="password"
            name="password"
            type="password"
            required
            minLength={6}
            autoComplete="new-password"
            className="w-full rounded-md border border-slate-700 bg-slate-800 px-3 py-2 text-sm text-slate-100 outline-none focus:border-emerald-500"
          />
        </div>

        {state && (
          <p className={`text-sm ${state.type === "error" ? "text-red-400" : "text-amber-300"}`}>
            {state.text}
          </p>
        )}

        <button
          type="submit"
          disabled={pending}
          className="w-full rounded-md bg-emerald-600 px-3 py-2 text-sm font-medium text-white hover:bg-emerald-500 disabled:opacity-60"
        >
          {pending ? "Creating account..." : "Create account"}
        </button>

        <p className="text-center text-xs text-slate-500">
          Already have an account?{" "}
          <Link href="/login" className="text-emerald-400 hover:text-emerald-300">
            Sign in
          </Link>
        </p>
      </form>
    </main>
  );
}
