---
name: playwright-expert
description: Implement or debug Playwright browser tests and fixtures when user-visible workflows, locators, traces, and cross-browser behavior need verification. Use for Playwright-specific test architecture and flaky tests; use test-master for broader strategy.
---

### Local policy (agent-skills)

> Point browser tests at an authorized local or test environment. Do not use production accounts or trigger real purchases, messages, or destructive actions without task authorization.

# Playwright expert

Inspect the installed Playwright version, test configuration, target URL, authentication setup, data isolation, CI workers, and existing selectors. Read [locators and fixtures](references/locators-and-fixtures.md) for implementation and [flake diagnosis](references/flake-diagnosis.md) for failures.

1. Define the user-visible outcome and smallest browser journey that proves it. Keep unit/API checks at cheaper layers when they can prove the behavior.
2. Prefer role, label, and other user-facing locators with exact names where ambiguity matters. Scope repeated controls to a stable region. Use test IDs when semantics are unavailable or unstable.
3. Make each test independent with isolated state and cleanup. Use a page object only for reused domain actions or meaningful page behavior, not a wrapper for every locator.
4. Assert an observable success and at least one failure or permission path. Rely on Playwright's auto-waiting and web assertions rather than fixed sleeps.
5. Run the focused test, relevant browsers/projects, and CI-equivalent mode where available. Inspect trace/video on failure; report skipped browsers and environmental limits.

Parallelism depends on fixture isolation and target capacity. Do not enable it as an unconditional rule. Treat `first()` or `nth()` as a smell unless order is the behavior being tested. Avoid network mocking when the integration contract is what the test must prove.
