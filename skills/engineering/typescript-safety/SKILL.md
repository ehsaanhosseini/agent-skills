---
name: typescript-safety
description: Review or implement TypeScript API boundaries when runtime data, state unions, or compiler settings affect correctness. Use for type guards, discriminated unions, unsafe assertions, and type-check failures; not for routine styling or React rendering work.
---

# TypeScript safety

Inspect the project's TypeScript version, `tsconfig`, existing patterns, and the actual boundary before editing. Preserve public API compatibility unless the task calls for a breaking change.

- Treat network, storage, form, and environment values as untrusted at runtime. A cast or branded type does not validate them; validate before narrowing.
- Use discriminated unions when distinct states have different fields. Check exhaustiveness where new states would otherwise be silently missed.
- Prefer inference and built-in utility types. Add custom conditional or branded types only when they prevent a demonstrated class of error without making the API harder to use.
- Keep type-only imports and module settings consistent with the installed compiler and build tool. Propose stricter compiler flags incrementally when migration cost is material.
- Run the repository's existing type check and relevant tests. If a tool or dependency is missing, report the unverified check instead of installing it automatically.

Explain the boundary, the type decision, and any runtime validation that backs it. Do not claim a compile-time type makes external data trustworthy.
