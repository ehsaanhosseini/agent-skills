---
name: design-critique
description: Critique a rendered product screen or prototype and prioritize concrete visual and UX improvements. Use when asked to review quality, hierarchy, clarity, or polish; not as a substitute for functional or accessibility testing.
---

# Design critique

Inspect the rendered artifact and brief at intended sizes and states. Read [critique method](references/critique-method.md) for task-led judgment and [findings and recheck](references/findings-and-recheck.md) for severity and evidence. State audience, primary task, constraints and available evidence before making recommendations.

1. Trace the first-glance hierarchy and actual task path: what is seen first, what action follows, and where uncertainty enters.
2. Review wording, grouping, typography, spacing, visual emphasis, data/chart meaning, feedback states and product identity against the brief. Separate functional defects from taste.
3. For each finding, cite a visible element/state, explain user impact, propose a concrete change and state what would verify it. Rank by impact, confidence and effort; keep the lead list focused.
4. Show a counterexample or competing design option when the recommendation is subjective. Preserve constraints such as brand, accessibility and established patterns.
5. Reinspect after edits at the same viewport/data/state and report what changed and what still needs functional or accessibility testing.

A screenshot cannot prove keyboard operation, data correctness or conversion outcomes. Use `design-qa` or `a11y-audit` for those measured tasks. This expands the existing XIAS `critique`/`design-review` adaptation at `62092bd83bc3df0bcb9a2b3b643305ab11c547da`.
