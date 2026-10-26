# Failing and flaky test analysis

Classify a failure before editing: product regression, outdated expectation, fixture contamination, timing/race, external dependency, or environment issue. Reproduce with the same seed and order where possible. Capture the first failure and relevant logs without exposing secrets. Make one causal change, then rerun the focused case and the affected suite.

For a flaky browser test, inspect traces and event ordering. If the test clicks before the UI becomes actionable, wait on the expected user-visible state through a locator assertion. A fixed sleep hides rather than resolves the race. If state leaks across tests, isolate accounts, database rows, browser contexts, and clock. Parallel execution may need unique fixtures or serialization for a shared resource.

Quarantine a truly unstable test only with an owner, issue, and exit condition; keep the risk visible. A retry can be a diagnostic aid but must not turn an unexplained failure into release evidence. After a fix, run repeated focused trials if nondeterminism was involved and at least one full relevant suite. Report residual uncertainty and any unavailable service.
