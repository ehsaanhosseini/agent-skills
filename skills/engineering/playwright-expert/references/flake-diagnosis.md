# Flake diagnosis

Capture the failing test, browser/project, seed, worker count, trace, and first error. Determine whether the element was absent, ambiguous, obscured, stale after navigation, or whether server state differed. A timeout is a symptom, not a cause.

Use `await expect(locator).toBeVisible()` or another semantic web assertion for a state transition. Avoid `waitForTimeout()` as a synchronization strategy. If a locator matches multiple elements, narrow by accessible name or container; do not select `first()` unless first position is the requirement. For asynchronous background work, wait for the user-visible completed state rather than a private network timing detail when possible.

Investigate shared accounts, data collisions, clock assumptions, browser-specific differences, service-worker/cache state, and CI resource limits. Run the focused test repeatedly with the failing worker/browser configuration after a fix; then run the relevant suite. A retry setting may expose frequency but does not repair the race. Report the observed failure rate and evidence used to rule out test isolation issues.
