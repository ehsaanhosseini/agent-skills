# Performance verification and regressions

Use a controlled comparison: same route, fixture, device class, network profile, cache mode and build type. Warm/cold runs are separate experiments. Capture several runs and report distribution or median with spread; a single screenshot of DevTools is not evidence of a reliable speedup. Check p75 field data when available and sufficiently sampled; label unavailable data.

Example: a product list has 500 rows and typing in a filter stalls. Profile shows the list recalculates on every unrelated toolbar state change. Move toolbar state into its subtree, keep filter derivation at list boundary, and consider virtualization if DOM work remains dominant. Verify filter correctness on empty, large and rapid-input fixtures; inspect keyboard focus and screen-reader access to results. Compare commit duration and interaction time before/after on the same production build. If total route bundle grows or another path slows, report the tradeoff.

For data-fetch changes, test denied access, stale response ordering, abort/unmount behavior and error recovery. For code splitting, test offline/failed chunk delivery and loading fallback. For memoization, test changed object contents and callback behavior. Run affected unit/integration/browser tests and report commands, versions, measurements and remaining uncertainty.
