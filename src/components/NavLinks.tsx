"use client";

import { useEffect, useRef, useState } from "react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { NAV_ENTRIES, isNavLinkActive, type NavGroupItem } from "@/lib/nav-config";

function NavDropdown({ group, active }: { group: NavGroupItem; active: boolean }) {
  const [open, setOpen] = useState(false);
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (!open) return;
    function onPointerDown(e: PointerEvent) {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false);
    }
    function onKeyDown(e: KeyboardEvent) {
      if (e.key === "Escape") setOpen(false);
    }
    document.addEventListener("pointerdown", onPointerDown);
    document.addEventListener("keydown", onKeyDown);
    return () => {
      document.removeEventListener("pointerdown", onPointerDown);
      document.removeEventListener("keydown", onKeyDown);
    };
  }, [open]);

  return (
    <div ref={ref} className="relative">
      <button
        type="button"
        onClick={() => setOpen((o) => !o)}
        aria-expanded={open}
        aria-haspopup="menu"
        className={`flex items-center gap-1 rounded-md px-3 py-1.5 text-sm font-medium transition-colors ${
          active
            ? "bg-emerald-600 text-white"
            : "text-slate-300 hover:bg-slate-800 hover:text-white"
        }`}
      >
        {group.label}
        <span className={`text-[10px] transition-transform ${open ? "rotate-180" : ""}`}>▾</span>
      </button>

      {open && (
        <div
          role="menu"
          className="absolute left-0 z-50 mt-2 w-64 overflow-hidden rounded-lg border border-slate-800 bg-slate-900 py-1.5 shadow-xl shadow-black/40"
        >
          {group.items.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              role="menuitem"
              onClick={() => setOpen(false)}
              className="block px-3 py-2 hover:bg-slate-800"
            >
              <div className="text-sm font-medium text-slate-100">{item.label}</div>
              <div className="mt-0.5 text-xs text-slate-500">{item.description}</div>
            </Link>
          ))}
        </div>
      )}
    </div>
  );
}

export function NavLinks() {
  const pathname = usePathname();

  return (
    <nav className="hidden md:flex flex-wrap items-center gap-1">
      {NAV_ENTRIES.map((entry) => {
        if (entry.type === "link") {
          const isActive = isNavLinkActive(pathname, entry.href);
          return (
            <Link
              key={entry.href}
              href={entry.href}
              className={`rounded-md px-3 py-1.5 text-sm font-medium transition-colors ${
                isActive
                  ? "bg-emerald-600 text-white"
                  : "text-slate-300 hover:bg-slate-800 hover:text-white"
              }`}
            >
              {entry.label}
            </Link>
          );
        }

        const groupActive = entry.items.some((item) => isNavLinkActive(pathname, item.href));
        return <NavDropdown key={entry.label} group={entry} active={groupActive} />;
      })}
    </nav>
  );
}
