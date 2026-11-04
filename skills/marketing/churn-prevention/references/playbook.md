# Churn Prevention playbook

## Establish the decision

Voluntary/involuntary churn split, cohorts, reasons, billing provider, contract terms, retry policy and account roles.

Use supplied, authorized evidence first. Label missing inputs and choose a reversible recommendation if uncertainty remains; do not invent a baseline, market statistic or guaranteed improvement.

## Method and tradeoffs

Diagnose churn by cohort and tenure before selecting an intervention. Keep cancellation clear and reachable; allow optional reason capture and a relevant pause/downgrade offer without blocking exit. Use the billing provider's supported retry and payment-update flows. Model webhook retries and idempotency, and distinguish recovery from delayed cancellation.

## Worked example

For accounts with failed renewal, use a hosted payment-update link and a bounded provider retry schedule. For low usage, offer assistance or a pause; measure retained revenue after the offer period, not clicks on the save button.

## Verify and diagnose

Test cancellation success, declines, pause/resume, refunds, webhook replay and permission checks in a sandbox. Measure net revenue retention, re-churn, recovery rate, complaints and cancellation completion time.

If evidence is incomplete, state exactly which conclusion cannot be supported and what observation would resolve it. Check for instrumentation faults, cohort selection, seasonality and delayed outcomes before attributing a change to an intervention. Keep unrelated workflows unloaded.

## Deliverable

Provide the artifact requested, its evidence and assumptions, a prioritized recommendation with the material tradeoff, and observable acceptance criteria. Include a staged rollout or recovery plan only when implementation risk requires it. Do not label a proposal as an executed result.
