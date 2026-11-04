# Revops playbook

## Establish the decision

Business model, lead/account identity, lifecycle definitions, territories, capacity, SLA, source systems and privacy rules.

Use supplied, authorized evidence first. Label missing inputs and choose a reversible recommendation if uncertainty remains; do not invent a baseline, market statistic or guaranteed improvement.

## Method and tradeoffs

Define objective entry/exit criteria for lead, qualified, opportunity, customer and disqualified states. Separate account fit from behavioral intent and calibrate scores using actual outcomes. Specify routing precedence, deduplication, assignment ownership, fallback queues and reassignment rules. Record sync direction, source of truth, retries and audit requirements before automation.

## Worked example

Route a qualified hotel-group demo to the territory owner; if absent, send to an owned fallback queue with an SLA rather than silently dropping the lead. Preserve provenance of merged records.

## Verify and diagnose

Walk duplicate, unknown territory, absent owner, opt-out, stale score, stage regression and sync replay cases. Measure accepted leads, response time, pipeline aging and reconciled revenue.

If evidence is incomplete, state exactly which conclusion cannot be supported and what observation would resolve it. Check for instrumentation faults, cohort selection, seasonality and delayed outcomes before attributing a change to an intervention. Keep unrelated workflows unloaded.

## Deliverable

Provide the artifact requested, its evidence and assumptions, a prioritized recommendation with the material tradeoff, and observable acceptance criteria. Include a staged rollout or recovery plan only when implementation risk requires it. Do not label a proposal as an executed result.
