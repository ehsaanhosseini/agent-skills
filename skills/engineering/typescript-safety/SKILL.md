---
name: typescript-safety
description: Design or review TypeScript boundaries where runtime data, public types, state unions, or compiler configuration affect correctness. Use for unsafe assertions, type guards, API payloads, discriminated unions, and type-check failures; not for routine React layout work.
---

# TypeScript safety

Inspect the installed TypeScript version, `tsconfig`, package boundaries, existing validator, public consumers, and the risky call site. Read [boundary validation](references/boundary-validation.md) for HTTP, storage, forms, environment values, or third-party data. Read [type design](references/type-design.md) for generics, unions, branded values, and compiler migration.

1. Identify the trust boundary and the invariant the type should express. Separate static shape from runtime evidence.
2. Make the smallest public type change that rules out the invalid state. Preserve compatibility or document a migration for callers.
3. Validate `unknown` input before narrowing it. Return typed success or explicit failure; avoid casts that merely silence the compiler.
4. Exercise valid, malformed, missing, and unexpected-value cases. For state unions, check exhaustiveness.
5. Run the repository's type check, relevant tests, and build when module output or declarations changed. Report commands and results; do not install a dependency merely to satisfy this skill.

Prefer inference and built-in utilities until a custom type solves a demonstrated problem. Check compiler cost if recursive or distributive types become complex. A branded ID prevents accidental mixing after construction; its constructor must still validate input. `satisfies` checks static shape, not network data.

Output the boundary, type/runtime strategy, affected callers, test evidence, and remaining risks. Keep confidential payloads out of examples.
