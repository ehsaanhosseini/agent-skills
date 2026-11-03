---
name: applied-ai-forecasting
description: Scope and evaluate practical AI and forecasting features such as demand or occupancy forecasts, anomaly alerts, recommendations, and LLM assistants with baselines, validation, and human oversight. Use after the business metric and data exist; not for model training infrastructure or hype-driven requests.
---

# Applied AI and forecasting

Read [forecasting](references/forecasting.md) and [ai-features](references/ai-features.md). Require a defined metric from `kpi-analytics-engineering` and clean data from `data-modeling-engineering` first.

1. State the decision the prediction or assistant improves and the cost of a wrong answer. If a rule or report suffices, say so and stop.
2. Establish a naive baseline (last period, seasonal average) and the evaluation metric; hold out time-ordered data, never random splits.
3. Start simple (seasonal baselines, regression, existing library); add complexity only if it beats the baseline on held-out data.
4. For LLM features, define allowed data, grounding sources, refusal and escalation behavior, evaluation cases, and logging without personal data. Keep a human in the loop for medical, legal, financial, or irreversible actions.
5. Report accuracy against the baseline with intervals, known failure modes, drift monitoring, and a fallback.

Deliver scope, baseline results, evaluation evidence, and rollout limits. Do not claim accuracy that was not measured.
