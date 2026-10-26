---
name: test-master
description: Design a risk-based test strategy or implement meaningful unit, integration, and end-to-end tests for software behavior. Use when coverage gaps, regression risk, flaky tests, or release confidence require evidence; use playwright-expert for Playwright-specific implementation.
---

### Local policy (agent-skills)

> Run load or security tests only within an authorized environment and rate limit. Use synthetic fixtures; keep production data and credentials out of test artifacts.

# Test master

Read [test strategy](references/test-strategy.md) for selecting layers and cases; read [failure analysis](references/failure-analysis.md) for flaky or failing suites. Inspect the change, contracts, data boundaries, failure impact, existing test architecture, and CI constraints before adding tests.

1. Define observable behaviors and risks. Prioritize failure modes that a user or dependent system would notice, including authorization and data integrity where relevant.
2. Choose the cheapest test layer that can prove each behavior. A unit test cannot prove a database transaction or browser accessibility path; an end-to-end test need not cover every branch.
3. Use deterministic fixtures and isolate state. Mock only boundaries whose real behavior is outside the test's purpose; keep at least one integration path through important contracts.
4. Assert specific outcomes for success, invalid input, boundary values, and one realistic failure. Avoid tests that mirror private implementation steps.
5. Run the relevant suite, investigate failures, and report command, environment, count, failures, and untested risks. Treat coverage percentage as a clue, not a quality guarantee.

Test-first development is useful when it clarifies behavior, but do not delete valid existing production code merely to satisfy a universal TDD rule. Never rerun a flaky test until green and call it fixed. A load or active security test needs a defined safe target and limits.
