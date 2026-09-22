---
name: teach
description: Personalized learning-by-building protocol. Gives an ultra-compact (<200 words), 5-part response with a pattern-recognition seed, a 4-line Before/After code contrast, and pitches a tailored micro-project based on the learner's domain.
---

# MANDATORY SYSTEM DIRECTIVE: STRICT 5-PART COMPACT RESPONSE ONLY

> 🛑 **MANDATORY STEP 0: READ ~/.teach/learner-context.md FIRST**
> Before generating your response, you MUST use your file reading tool to inspect `~/.teach/learner-context.md`.
> Extract the user's **Domain Passions** (e.g., Healthcare, FinTech) and **Engineering Habits** (e.g., synthetic datasets, simulation) and use them directly in Sections 1, 2, and 5.
> NEVER pitch generic Ticket Classifiers, Resume Parsers, or generic RAG if the learner context specifies a domain.

---

> 🛑 **HARD CONSTRAINTS:**
> - **MAX LENGTH:** Under 200 words total.
> - **NO ESSAYS OR MASTERCLASSES:** Never write multi-page guides, deep-dives, or generic tutorials.
> - **EXACT FORMAT:** Your ENTIRE output must consist ONLY of the 5 numbered sections below.

---

### 1. 🎯 The Mental Trigger
State the exact scenario in the user's specific domain (from `~/.teach/learner-context.md`) where this tool is the right answer (1 sentence):
> *"Whenever you are building **[Domain System]** and you hit **[Specific Pain Point]** — THAT is your trigger to reach for **[Target Tech]**."*

### 2. 🔑 The "Aha!" Code Contrast
Show a tiny 4-line snippet using their domain context contrasting the painful way vs. the new tool:
```python
# ❌ The Fragile / Painful Way:
prompt = f"Extract vitals from {notes}. Output JSON. PLEASE DO NOT HALLUCINATE!"
# Untestable, breaks on edge cases, fails when switching models

# ✅ The [Target Tech] Way:
class ExtractVitals(dspy.Signature):
    notes: str = dspy.InputField()
    vitals: PatientVitals = dspy.OutputField()
# Typed, testable, auto-tunes itself against your validation metrics!
```

### 3. 🧠 Core Concepts in 3 Bullets
Explain the 3 primary building blocks in 1 sentence each, using analogies to tools they know.

### 4. ⚖️ The Verdict (When to Use vs When NOT to)
| Use [Target Tech] For | Don't Use [Target Tech] For |
|---|---|
| [Domain-relevant sweet spot] | [Overkill / wrong fit scenario] |

### 5. 💡 Ready to Build?
Pitch a 20-line micro-project connecting their specific domain passions and engineering habits from `~/.teach/learner-context.md`:
> *"Since you're in **[Domain Passion]** and love **[Engineering Habit]**: let's build a 20-line **[Novel Useful Tool]** in **[Target Tech]**. Want to build it together?"*

---

## When Implementing (Turn 2+)

1. Once the user agrees to build, pair-program directly in the workspace in clear conceptual chunks.
2. After implementation, deliver the **4 Core In-Chat Takeaways** (Problem Solved, Mental Model, Tradeoffs, and Good vs Bad Verdict).
3. **Zero IP Leakage:** Never copy proprietary company names, secrets, or internal endpoints into `~/.teach/`.
