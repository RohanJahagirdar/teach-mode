# teach-mode

A portable, privacy-first **guided implementation** mode for AI coding agents.

> Build substantially. Teach continuously. Never let the implementation become a black box.

`/teach` is for people who want an AI coding agent to do real implementation work while actively teaching them the technologies, tools, architecture, tradeoffs, and reasoning involved.

## What it is

`teach-mode` is a generic teaching protocol. The public repository contains:

- the teaching engine;
- universal learning principles;
- privacy rules;
- portable templates.

Your personal learner profile and learning state are created locally under `~/.teach/` and are **not** part of this repository.

## Core model

```text
                  PUBLIC REPOSITORY
        ┌─────────────────────────────────┐
        │ Teach Engine                    │
        │ Universal Knowledge             │
        │ Templates / Privacy Rules       │
        └────────────────┬────────────────┘
                         │
                    local init
                         │
              ┌──────────┴──────────┐
              │                     │
        PERSONAL LAPTOP        WORK LAPTOP
              │                     │
        ~/.teach/              ~/.teach/
        personal repo          work repo
              │                     │
              └────── NEVER ───────┘
                      sync raw
```

## Teaching philosophy

### Guided implementation

The agent still performs substantial implementation: multi-file changes, large additions, refactors, tests, debugging, dependency changes, and architecture work.

The learner is **not** forced to type all the code.

Instead, the agent explains important decisions before and during implementation and checks understanding at useful conceptual boundaries.

### Contextualized teaching

Introduce unfamiliar technology through the shortest useful bridge:

```text
familiar problem
      ↓
new tool / concept
      ↓
why it helps
      ↓
how it works here
```

Personalize for comprehension, not for personalization's sake.

### Cumulative learning

Do not repeatedly teach concepts the learner already understands. New tools should be explained relative to established mental models when that produces a clearer explanation.

### Token economics

Token/context efficiency is both a subject worth learning and a constraint on the teacher itself.

Optimize for:

> **useful learning gained per token and per minute of implementation**

The skill should avoid repeated context, code echoing, unnecessary narration, and giant lectures. It should spend additional tokens when they materially improve understanding.

## Local personal state

`teach init` creates:

```text
~/.teach/
├── learner-context.md
├── learning-backlog.md
└── knowledge/
```

These files contain only the learner's own durable, non-proprietary knowledge and interests.

## Privacy boundary

A current repository can be used as temporary context during a `/teach` session, including a proprietary work repository.

That temporary context must never be copied into persistent shared learning state.

A work-related learning insight may be persisted only after it has been stripped down to a generic concept and explicitly approved by the learner.

## Getting started

```bash
git clone https://github.com/RohanJahagirdar/teach-mode.git
cd teach-mode
./scripts/init.sh
./scripts/install.sh
```

Then, in a supported Agent Skills environment:

```text
/teach
```

## Supported global skill locations

The installer targets current global Agent Skill locations for:

- Cursor: `~/.agents/skills/teach` and `~/.cursor/skills/teach`
- Zed: `~/.agents/skills/teach`
- Antigravity IDE: `~/.gemini/config/skills/teach`

These are current documented locations as of September 2026.

## Personal state sync

The public repository intentionally does **not** sync `~/.teach/`.

This is deliberate: personal learning state should be synced through a separate mechanism so repository/session context never becomes part of the shared framework repository.

The recommended next layer is encrypted learning-state sync with explicit review before publishing a learning delta.

## Contributing

See `CONTRIBUTING.md`.
