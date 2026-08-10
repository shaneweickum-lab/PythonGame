"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { NAV_LINKS, isNavLinkActive } from "@/components/NavLinks";

export function MobileTabBar() {
  const pathname = usePathname();

  return (
    <nav
      className="fixed inset-x-0 bottom-0 z-40 flex overflow-x-auto border-t border-slate-800 bg-slate-900/95 backdrop-blur md:hidden"
      style={{ paddingBottom: "env(safe-area-inset-bottom)" }}
    >
      {NAV_LINKS.map((link) => {
        const isActive = isNavLinkActive(pathname, link.href);

        return (
          <Link
            key={link.href}
            href={link.href}
            className={`flex flex-1 min-w-16 flex-col items-center gap-0.5 py-2 text-[11px] font-medium ${
              isActive ? "text-emerald-400" : "text-slate-400"
            }`}
          >
            <span className="text-base" aria-hidden="true">
              {link.icon}
            </span>
            {link.label}
          </Link>
        );
      })}
    </nav>
  );
}
