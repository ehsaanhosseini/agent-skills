# Migration and verification

Inventory every export and call site before changing the public API. Record old prop combinations, which are valid, and the new mapping. A prop rename alone can break untyped consumers, snapshots and documentation. Stage a compatibility wrapper or deprecation warning if callers migrate at different times; remove it only after usage reaches zero.

Example migration: `Notice success error warning` becomes `Notice variant="success" | "error" | "warning"`. Decide what an old `success error` call meant before mapping; do not silently select one branch. Add a compile-time rejection for invalid variants where TypeScript is used and a runtime default for untyped callers.

Acceptance tests: default and each variant render correct semantics; controlled state follows parent updates; uncontrolled state resets only when specified; event callbacks fire once in defined order; keyboard and focus behavior survive child composition; conditional children do not change selection unexpectedly; long content and nested instances remain usable. Run the project's type check and affected suite, inspect at least one host screen, and report unconverted callers. A passing snapshot does not prove focus or event semantics.
