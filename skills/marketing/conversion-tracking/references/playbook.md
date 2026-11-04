# Conversion Tracking playbook

## Establish the decision

Actual conversion moment, implementation stack, existing tags/integrations, consent state, destination IDs, ownership and authorized test environment.

Use supplied, authorized evidence first. Label missing inputs and choose a reversible recommendation if uncertainty remains; do not invent a baseline, market statistic or guaranteed improvement.

## Method and tradeoffs

Trace source success to event, transport, destination receipt and reporting separately. Use server-confirmed order/account creation or the vendor's supported success event, never submit clicks as completed outcomes. Prefer maintained native integrations where suitable. Define stable event/order IDs for browser/server deduplication, currency, value and refund rules. For iframe messages validate origin, source and schema; a visible thank-you page alone may be reachable without a real conversion.

## Worked example

For a React booking form, emit booking_confirmed only after the backend confirms the reservation; keep button clicks as separate intent events. Replay the same event ID to confirm it cannot count twice. Cross-domain bookings need an authorized handoff or webhook, not access to another domain's cookies.

## Verify and diagnose

Test confirmed success, validation failure, abandoned flow, reload, SPA navigation, duplicates, denied consent, iframe spoofing and destination receipt. Redact payloads; document reporting latency and distinguish a sent request from accepted conversion.

If evidence is incomplete, state exactly which conclusion cannot be supported and what observation would resolve it. Check for instrumentation faults, cohort selection, seasonality and delayed outcomes before attributing a change to an intervention. Keep unrelated workflows unloaded.

## Deliverable

Provide the artifact requested, its evidence and assumptions, a prioritized recommendation with the material tradeoff, and observable acceptance criteria. Include a staged rollout or recovery plan only when implementation risk requires it. Do not label a proposal as an executed result.
