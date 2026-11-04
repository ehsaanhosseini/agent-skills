# Attribution playbook

## Establish the decision

Revenue source of truth, conversion definition, identity/consent policy, windows, timezones, spend and channel exports.

Use supplied, authorized evidence first. Label missing inputs and choose a reversible recommendation if uncertainty remains; do not invent a baseline, market statistic or guaranteed improvement.

## Method and tradeoffs

Normalize conversion dates, refunds, currency, attribution windows and view/click-through rules before comparing sources. Show first-touch and last-touch as descriptive lenses; platform-attributed conversions overlap and must not be summed. Separate attribution from causal lift and recommend holdouts or geo experiments where feasible. For identity stitching, specify consent, retention, approved join keys and deletion propagation.

## Worked example

If Google and Meta each claim a booking, reconcile both to the confirmed booking ledger and explain overlapping credit; do not count two bookings. Preserve unmatched traffic as unknown.

## Verify and diagnose

Produce a reconciliation table, model assumptions, identity coverage, confidence and a decision that survives plausible alternative models. Track net revenue and contribution margin instead of only reported ROAS.

If evidence is incomplete, state exactly which conclusion cannot be supported and what observation would resolve it. Check for instrumentation faults, cohort selection, seasonality and delayed outcomes before attributing a change to an intervention. Keep unrelated workflows unloaded.

## Deliverable

Provide the artifact requested, its evidence and assumptions, a prioritized recommendation with the material tradeoff, and observable acceptance criteria. Include a staged rollout or recovery plan only when implementation risk requires it. Do not label a proposal as an executed result.
