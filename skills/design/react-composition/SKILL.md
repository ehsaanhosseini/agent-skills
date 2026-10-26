---
name: react-composition
description: Design or refactor reusable React component APIs when variants, state ownership, and boolean props are becoming hard to maintain. Use for component architecture; not for simple isolated controls.
---

# React composition

Inspect installed React version, actual call sites and component responsibilities before changing an API. Read [composition decisions](references/composition-decisions.md) for variants, slots and state ownership, and [migration and verification](references/migration-and-verification.md) for compatibility and tests.

1. Identify the concrete pain: contradictory boolean combinations, duplicated layout, implicit shared state, or hard-to-test branches. Count real consumers and supported modes.
2. Choose the simplest fitting interface: ordinary props for a small control, explicit variant for exclusive modes, slots/children for layout composition, context-backed compound components only when coordination is valuable. Do not add a provider to satisfy a pattern.
3. Place each state at its lowest common owner. Specify controlled/uncontrolled behavior, event ordering and reset semantics. Preserve accessible names, focus and keyboard behavior through composition.
4. Refactor with a migration map for every call site. Keep a compatibility wrapper if the public API cannot change atomically; avoid silent behavior changes in default props.
5. Run type checks and behavior tests for normal, invalid combination, keyboard and edge-content cases. Inspect actual rendered consumers after migration.

Use the project's pinned React APIs. This expands the existing Vercel-informed adaptation at `063bee94c3f4df8453406c830b0a7df0f2860278`.
