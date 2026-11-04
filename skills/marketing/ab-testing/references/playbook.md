# Ab Testing playbook

## Establish the decision

Baseline rate, eligible traffic, randomization unit, smallest worthwhile effect, conversion window, guardrails.

Use supplied, authorized evidence first. Label missing inputs and choose a reversible recommendation if uncertainty remains; do not invent a baseline, market statistic or guaranteed improvement.

## Method and tradeoffs

Write a falsifiable hypothesis and choose one primary outcome before exposure. Randomize by stable user or account; avoid cross-variant contamination. Plan power, duration and stopping rules, including weekday cycles and delayed outcomes. Check sample-ratio mismatch and missing events before interpreting lift. Use a fixed horizon or a valid sequential method; repeated ordinary p-value peeking is invalid.

## Worked example

For a pricing page, randomize by account and compare paid conversion within 30 days; track refunds and support contacts as guardrails. A click increase alone cannot establish revenue lift.

## Verify and diagnose

Report absolute and relative change, confidence interval, denominators, exclusions and practical significance. An underpowered null is inconclusive; compare guardrails before recommending rollout.

If evidence is incomplete, state exactly which conclusion cannot be supported and what observation would resolve it. Check for instrumentation faults, cohort selection, seasonality and delayed outcomes before attributing a change to an intervention. Keep unrelated workflows unloaded.

## Deliverable

Provide the artifact requested, its evidence and assumptions, a prioritized recommendation with the material tradeoff, and observable acceptance criteria. Include a staged rollout or recovery plan only when implementation risk requires it. Do not label a proposal as an executed result.
