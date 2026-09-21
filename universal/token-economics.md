# Token Economics

Token economics is a broadly useful engineering concept for AI systems.

## Core idea

Tokens are not only a billing unit. They affect:

- cost;
- latency;
- context-window pressure;
- throughput;
- architecture;
- caching strategy;
- retrieval design;
- model selection;
- evaluation economics.

## Teaching principle

A good AI system deliberately decides what information deserves to enter model context, how often it needs to be sent, which model needs to see it, and whether repeated work can be cached or avoided.

## High-value concepts

- input vs output token cost;
- context growth;
- prompt and context compaction;
- caching;
- batching;
- retrieval precision;
- model routing;
- structured output overhead;
- tool-call overhead;
- evaluation cost;
- latency/cost/quality tradeoffs.

## Skill behavior

The teacher should practice token economics itself:

- load only relevant learner state;
- do not repeat known material;
- avoid echoing large code blocks;
- explain conceptual deltas rather than every edit;
- spend extra tokens when they prevent misunderstanding.

The goal is not minimum output. The goal is **maximum useful learning per token**.
