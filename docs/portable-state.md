# Portable Personal State

The public teach-mode repository should contain the teaching framework, universal knowledge, templates, and privacy rules.

Personal state lives under:

```text
~/.teach/
├── learner-context.md
├── learning-backlog.md
└── knowledge/
```

## Separation rule

The current repository is always temporary context unless a generic learning insight is explicitly approved for persistence.

A work repository may contain proprietary information. That information must never be copied into the public teach-mode repository or automatically persisted to shared learning state.

## Future sync layer

The recommended sync architecture is:

```text
local ~/.teach/
      ↓
sanctioned, sanitized learning delta
      ↓
explicit learner approval
      ↓
encrypted personal state
      ↓
private sync mechanism
```

Do not use the public teach-mode repository as the transport for raw learner state.
