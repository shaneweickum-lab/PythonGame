import type { ChallengeDifficulty, ConceptStatus, ProjectType } from "@/lib/supabase/types";

// XP is deliberately derived from current `status`/`completed_at`, not an
// append-only event log -- it represents "how much of the curriculum is
// currently mastered," matching every other progress number in this app
// (dashboard totals, phase progress bars). Toggling something off and back
// on doesn't double-count it.

const CONCEPT_XP = 10;
const PROJECT_XP: Record<ProjectType, number> = { micro: 15, mini: 30, spine: 40 };
const CHALLENGE_XP: Record<ChallengeDifficulty, number> = { easy: 10, medium: 20, hard: 35 };

// Thresholds are cumulative XP required to *reach* that level. Calibrated
// against the curriculum's actual max (75 concepts + 93 projects + 318
// challenges ~= 7,290 XP at the values above), so "Python Master" is a
// real full-completion milestone, not an arbitrary number.
const LEVELS = [
  { level: 1, title: "Hello, World", threshold: 0 },
  { level: 2, title: "Syntax Novice", threshold: 75 },
  { level: 3, title: "Loop Runner", threshold: 180 },
  { level: 4, title: "Function Crafter", threshold: 320 },
  { level: 5, title: "Data Wrangler", threshold: 500 },
  { level: 6, title: "Structure Builder", threshold: 720 },
  { level: 7, title: "Object Architect", threshold: 1000 },
  { level: 8, title: "Idiom Speaker", threshold: 1350 },
  { level: 9, title: "Toolsmith", threshold: 1750 },
  { level: 10, title: "Systems Thinker", threshold: 2250 },
  { level: 11, title: "Specialist", threshold: 2850 },
  { level: 12, title: "Interview Ready", threshold: 3550 },
  { level: 13, title: "Capstone Builder", threshold: 4400 },
  { level: 14, title: "Python Journeyman", threshold: 5500 },
  { level: 15, title: "Python Master", threshold: 7000 },
] as const;

export type GamificationConcept = {
  id: string;
  phase_id: string;
  status: ConceptStatus;
  completed_at: string | null;
};

export type GamificationProject = {
  id: string;
  phase_id: string;
  project_type: ProjectType;
  status: ConceptStatus;
  completed_at: string | null;
};

export type GamificationChallenge = {
  id: string;
  difficulty: ChallengeDifficulty;
  status: ConceptStatus;
  completed_at: string | null;
};

export type GamificationInput = {
  phases: { id: string; order_index: number; title: string }[];
  concepts: GamificationConcept[];
  projects: GamificationProject[];
  challenges: GamificationChallenge[];
  journalEntries: { created_at: string }[];
};

export type XpBreakdown = {
  concepts: number;
  projects: number;
  challenges: number;
  total: number;
};

export type LevelInfo = {
  level: number;
  title: string;
  xp: number;
  xpIntoLevel: number;
  xpForNextLevel: number | null;
  progress: number;
  isMaxLevel: boolean;
};

export type StreakInfo = {
  current: number;
  longest: number;
};

export type Badge = {
  id: string;
  title: string;
  description: string;
  icon: string;
  earned: boolean;
};

const isDone = (status: ConceptStatus) => status === "done";

export function computeXp(input: GamificationInput): XpBreakdown {
  const concepts = input.concepts.filter((c) => isDone(c.status)).length * CONCEPT_XP;
  const projects = input.projects
    .filter((p) => isDone(p.status))
    .reduce((sum, p) => sum + PROJECT_XP[p.project_type], 0);
  const challenges = input.challenges
    .filter((c) => isDone(c.status))
    .reduce((sum, c) => sum + CHALLENGE_XP[c.difficulty], 0);

  return { concepts, projects, challenges, total: concepts + projects + challenges };
}

export function getLevelInfo(xp: number): LevelInfo {
  let current: (typeof LEVELS)[number] = LEVELS[0];
  let next: (typeof LEVELS)[number] | undefined;

  for (let i = 0; i < LEVELS.length; i++) {
    if (xp >= LEVELS[i].threshold) {
      current = LEVELS[i];
      next = LEVELS[i + 1];
    } else {
      break;
    }
  }

  if (!next) {
    return {
      level: current.level,
      title: current.title,
      xp,
      xpIntoLevel: xp - current.threshold,
      xpForNextLevel: null,
      progress: 1,
      isMaxLevel: true,
    };
  }

  const span = next.threshold - current.threshold;
  const xpIntoLevel = xp - current.threshold;

  return {
    level: current.level,
    title: current.title,
    xp,
    xpIntoLevel,
    xpForNextLevel: next.threshold - xp,
    progress: span > 0 ? Math.min(1, xpIntoLevel / span) : 1,
    isMaxLevel: false,
  };
}

function toUtcDateKey(iso: string): string {
  return iso.slice(0, 10);
}

function dateKeyToUtcDays(key: string): number {
  return Date.UTC(
    Number(key.slice(0, 4)),
    Number(key.slice(5, 7)) - 1,
    Number(key.slice(8, 10)),
  ) / 86_400_000;
}

export function computeStreak(input: GamificationInput, todayIso?: string): StreakInfo {
  const dateKeys = new Set<string>();

  for (const c of input.concepts) if (c.completed_at) dateKeys.add(toUtcDateKey(c.completed_at));
  for (const p of input.projects) if (p.completed_at) dateKeys.add(toUtcDateKey(p.completed_at));
  for (const c of input.challenges) if (c.completed_at) dateKeys.add(toUtcDateKey(c.completed_at));
  for (const j of input.journalEntries) dateKeys.add(toUtcDateKey(j.created_at));

  if (dateKeys.size === 0) return { current: 0, longest: 0 };

  const days = Array.from(dateKeys, dateKeyToUtcDays).sort((a, b) => a - b);

  let longest = 1;
  let run = 1;
  for (let i = 1; i < days.length; i++) {
    run = days[i] === days[i - 1] + 1 ? run + 1 : 1;
    longest = Math.max(longest, run);
  }

  const today = todayIso ? dateKeyToUtcDays(toUtcDateKey(todayIso)) : dateKeyToUtcDays(new Date().toISOString());
  const lastActive = days[days.length - 1];

  let current = 0;
  if (lastActive === today || lastActive === today - 1) {
    current = 1;
    for (let i = days.length - 1; i > 0; i--) {
      if (days[i] === days[i - 1] + 1) current++;
      else break;
    }
  }

  return { current, longest };
}

export function computeBadges(input: GamificationInput, streak: StreakInfo): Badge[] {
  const conceptsDone = input.concepts.filter((c) => isDone(c.status)).length;
  const totalConcepts = input.concepts.length;

  const projectsDone = input.projects.filter((p) => isDone(p.status)).length;
  const totalProjects = input.projects.length;

  const spineTotal = input.projects.filter((p) => p.project_type === "spine").length;
  const spineDone = input.projects.filter((p) => p.project_type === "spine" && isDone(p.status)).length;

  const challengesDone = input.challenges.filter((c) => isDone(c.status)).length;
  const totalChallenges = input.challenges.length;
  const hardTotal = input.challenges.filter((c) => c.difficulty === "hard").length;
  const hardDone = input.challenges.filter((c) => c.difficulty === "hard" && isDone(c.status)).length;

  const journalCount = input.journalEntries.length;

  const badges: Badge[] = [
    {
      id: "first_concept",
      title: "First Steps",
      description: "Mark your first concept as done.",
      icon: "🌱",
      earned: conceptsDone >= 1,
    },
    {
      id: "concepts_10",
      title: "Quick Study",
      description: "Complete 10 concepts.",
      icon: "📘",
      earned: conceptsDone >= 10,
    },
    {
      id: "concepts_half",
      title: "Halfway There",
      description: `Complete ${Math.ceil(totalConcepts / 2)}+ concepts.`,
      icon: "📗",
      earned: totalConcepts > 0 && conceptsDone >= Math.ceil(totalConcepts / 2),
    },
    {
      id: "concepts_all",
      title: "Full Curriculum",
      description: "Complete every concept in the roadmap.",
      icon: "🎓",
      earned: totalConcepts > 0 && conceptsDone >= totalConcepts,
    },
    {
      id: "first_project",
      title: "Builder",
      description: "Complete your first project.",
      icon: "🔧",
      earned: projectsDone >= 1,
    },
    {
      id: "projects_25",
      title: "Project Portfolio",
      description: "Complete 25 projects.",
      icon: "🧰",
      earned: projectsDone >= 25,
    },
    {
      id: "projects_all",
      title: "All Projects Done",
      description: "Complete every project -- micro, mini, and spine.",
      icon: "🏗️",
      earned: totalProjects > 0 && projectsDone >= totalProjects,
    },
    {
      id: "spine_all",
      title: "Spine Runner",
      description: "Complete every spine milestone.",
      icon: "🌳",
      earned: spineTotal > 0 && spineDone >= spineTotal,
    },
    {
      id: "first_challenge",
      title: "Challenge Accepted",
      description: "Solve your first coding challenge.",
      icon: "🧩",
      earned: challengesDone >= 1,
    },
    {
      id: "challenges_50",
      title: "Problem Solver",
      description: "Solve 50 coding challenges.",
      icon: "🧠",
      earned: challengesDone >= 50,
    },
    {
      id: "challenges_all",
      title: "Challenge Master",
      description: "Solve every coding challenge in the app.",
      icon: "🏆",
      earned: totalChallenges > 0 && challengesDone >= totalChallenges,
    },
    {
      id: "deep_diver",
      title: "Deep Diver",
      description: "Solve the hardest challenge in the whole curriculum.",
      icon: "🤿",
      earned: hardTotal > 0 && hardDone >= hardTotal,
    },
    {
      id: "journal_10",
      title: "Reflective",
      description: "Write 10 journal entries.",
      icon: "📓",
      earned: journalCount >= 10,
    },
    {
      id: "streak_3",
      title: "On a Roll",
      description: "Reach a 3-day streak.",
      icon: "🔥",
      earned: streak.longest >= 3,
    },
    {
      id: "streak_7",
      title: "Committed",
      description: "Reach a 7-day streak.",
      icon: "🔥",
      earned: streak.longest >= 7,
    },
    {
      id: "streak_30",
      title: "Unstoppable",
      description: "Reach a 30-day streak.",
      icon: "🔥",
      earned: streak.longest >= 30,
    },
  ];

  for (const phase of [...input.phases].sort((a, b) => a.order_index - b.order_index)) {
    const phaseConcepts = input.concepts.filter((c) => c.phase_id === phase.id);
    const phaseProjects = input.projects.filter((p) => p.phase_id === phase.id);
    const total = phaseConcepts.length + phaseProjects.length;
    const done =
      phaseConcepts.filter((c) => isDone(c.status)).length +
      phaseProjects.filter((p) => isDone(p.status)).length;

    badges.push({
      id: `phase_${phase.id}`,
      title: `Phase Cleared: ${phase.title}`,
      description: `Complete every concept and project in "${phase.title}".`,
      icon: "🚩",
      earned: total > 0 && done >= total,
    });
  }

  return badges;
}

export function computeGamification(input: GamificationInput, todayIso?: string) {
  const xp = computeXp(input);
  const level = getLevelInfo(xp.total);
  const streak = computeStreak(input, todayIso);
  const badges = computeBadges(input, streak);

  return { xp, level, streak, badges };
}
