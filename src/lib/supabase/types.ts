export type ConceptStatus = "not_started" | "in_progress" | "done";
export type ProjectType = "micro" | "mini" | "spine";
export type ChallengeDifficulty = "easy" | "medium" | "hard";

export type Phase = {
  id: string;
  order_index: number;
  title: string;
  summary: string | null;
  is_spine_track: boolean;
};

// Shared curriculum content -- identical for every account, read-only from
// the client. Per-user state (status, completed_at, ...) lives in the
// matching *_progress table and is joined in by src/lib/progress.ts's merge
// helpers into the combined types below, which is what the rest of the app
// (components, gamification) actually renders.
export type ConceptContent = {
  id: string;
  phase_id: string;
  order_index: number;
  title: string;
  notes: string | null;
  lesson_content: string | null;
};

export type ConceptProgress = {
  user_id: string;
  concept_id: string;
  status: ConceptStatus;
  completed_at: string | null;
};

export type Concept = ConceptContent & {
  status: ConceptStatus;
  completed_at: string | null;
};

export type ProjectContent = {
  id: string;
  phase_id: string;
  concept_id: string | null;
  title: string;
  description: string | null;
  project_type: ProjectType;
};

export type ProjectProgress = {
  user_id: string;
  project_id: string;
  status: ConceptStatus;
  code_snapshot: string | null;
  notes: string | null;
  completed_at: string | null;
};

export type Project = ProjectContent & {
  status: ConceptStatus;
  code_snapshot: string | null;
  notes: string | null;
  completed_at: string | null;
};

export type FlashcardContent = {
  id: string;
  phase_id: string | null;
  question: string;
  answer: string;
};

export type FlashcardProgress = {
  user_id: string;
  flashcard_id: string;
  ease_factor: number;
  interval_days: number;
  next_review_at: string;
  last_reviewed_at: string | null;
};

export type Flashcard = FlashcardContent & {
  ease_factor: number;
  interval_days: number;
  next_review_at: string;
  last_reviewed_at: string | null;
};

export type JournalEntry = {
  id: string;
  phase_id: string | null;
  content: string;
  created_at: string;
  user_id: string | null;
};

export type ChallengeContent = {
  id: string;
  phase_id: string | null;
  concept_id: string | null;
  order_index: number;
  title: string;
  difficulty: ChallengeDifficulty;
  prompt: string;
  hint: string | null;
  starter_code: string;
  test_code: string;
};

export type ChallengeProgress = {
  user_id: string;
  challenge_id: string;
  status: ConceptStatus;
  code_snapshot: string | null;
  completed_at: string | null;
};

export type Challenge = ChallengeContent & {
  status: ConceptStatus;
  code_snapshot: string | null;
  completed_at: string | null;
};

export type BambooFile = {
  id: string;
  project_id: string;
  name: string;
  content: string;
  updated_at: string;
  user_id: string | null;
};

export type Database = {
  public: {
    Tables: {
      phases: {
        Row: Phase;
        Insert: Partial<Phase> & Pick<Phase, "order_index" | "title">;
        Update: Partial<Phase>;
        Relationships: [];
      };
      concepts: {
        Row: ConceptContent;
        Insert: Partial<ConceptContent> & Pick<ConceptContent, "phase_id" | "title">;
        Update: Partial<ConceptContent>;
        Relationships: [];
      };
      concept_progress: {
        Row: ConceptProgress;
        Insert: Partial<ConceptProgress> & Pick<ConceptProgress, "concept_id">;
        Update: Partial<ConceptProgress>;
        Relationships: [];
      };
      projects: {
        Row: ProjectContent;
        Insert: Partial<ProjectContent> &
          Pick<ProjectContent, "phase_id" | "title" | "project_type">;
        Update: Partial<ProjectContent>;
        Relationships: [];
      };
      project_progress: {
        Row: ProjectProgress;
        Insert: Partial<ProjectProgress> & Pick<ProjectProgress, "project_id">;
        Update: Partial<ProjectProgress>;
        Relationships: [];
      };
      flashcards: {
        Row: FlashcardContent;
        Insert: Partial<FlashcardContent> & Pick<FlashcardContent, "question" | "answer">;
        Update: Partial<FlashcardContent>;
        Relationships: [];
      };
      flashcard_progress: {
        Row: FlashcardProgress;
        Insert: Partial<FlashcardProgress> & Pick<FlashcardProgress, "flashcard_id">;
        Update: Partial<FlashcardProgress>;
        Relationships: [];
      };
      journal_entries: {
        Row: JournalEntry;
        Insert: Partial<JournalEntry> & Pick<JournalEntry, "content">;
        Update: Partial<JournalEntry>;
        Relationships: [];
      };
      challenges: {
        Row: ChallengeContent;
        Insert: Partial<ChallengeContent> &
          Pick<ChallengeContent, "title" | "prompt" | "starter_code" | "test_code">;
        Update: Partial<ChallengeContent>;
        Relationships: [];
      };
      challenge_progress: {
        Row: ChallengeProgress;
        Insert: Partial<ChallengeProgress> & Pick<ChallengeProgress, "challenge_id">;
        Update: Partial<ChallengeProgress>;
        Relationships: [];
      };
      bamboo_files: {
        Row: BambooFile;
        Insert: Partial<BambooFile> & Pick<BambooFile, "id" | "project_id" | "name">;
        Update: Partial<BambooFile>;
        Relationships: [];
      };
    };
    Views: Record<string, never>;
    Functions: Record<string, never>;
  };
};
