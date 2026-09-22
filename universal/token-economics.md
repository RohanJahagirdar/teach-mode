# Token Economics: The Practical Guide

Token economics is the engineering discipline of designing AI systems that maximize intelligence and quality while minimizing token waste, latency, and costs.

---

## 1. The Golden Rules of Token Economics

### Rule 1: Output Tokens are 3–5x More Expensive & 10x Slower
- **Why:** Generating output tokens requires autoregressive decoding (predicting one token at a time sequentially), which is compute-heavy and high-latency.
- **Engineering Fix:** Design prompts and schemas that ask for concise, high-density answers rather than verbose conversational filler.

### Rule 2: Prompt Caching is Your Best Friend
- **Why:** Modern LLM providers (Google, OpenAI, Anthropic) give up to 80–90% discounts and massive latency cuts if your prompt prefix matches previous requests.
- **Engineering Fix:** Keep static content (system instructions, tool definitions, compiled few-shot examples) at the **top/prefix** of the prompt. Put dynamic variables at the very end.

### Rule 3: High-Density Context > Raw Dumps
- **Why:** Shoving a 10,000-line raw codebase or messy log dump into context degrades retrieval precision ("needle in a haystack" loss) and burns cash.
- **Engineering Fix:** Use targeted AST extraction, structured knowledge cards, or concise summary deltas instead of raw file dumps.

---

## 2. In DSPy: Compilation vs. Runtime Waste

- **Without Compilation:** A brittle prompt fails 20% of the time, triggering multi-turn retry loops, verbose error explanations, and wasted tokens in production.
- **With DSPy Compilation (`BootstrapFewShot`):** You spend tokens **once** during offline optimization to discover the leanest, most effective prompt. At runtime, every request executes cleanly on turn 1.

---

## 3. How `teach-mode` Practices Token Economics

1. **Selective Ingestion:** Only reads relevant topics from `~/.teach/` rather than dumping your entire history.
2. **Conceptual Diffs:** Teaches through targeted architectural diffs rather than echoing hundreds of lines of unchanged code.
3. **L2 Context Caching:** Saves compact 200–400 word cheat-sheets to `~/.teach/knowledge/` so future AI sessions have instant, low-token context.
