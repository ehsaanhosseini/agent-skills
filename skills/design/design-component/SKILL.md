---
name: design-component
description: Specify or build a reusable UI component with clear anatomy, variants, states, accessibility, responsive behavior, and code API. Use for component-library work, not a one-off layout detail.
---

# Design component

Inspect the existing design system and real call sites before creating a component. Read [component contract](references/component-contract.md) to decide anatomy, variants and state ownership; read [interaction and acceptance](references/interaction-and-acceptance.md) for keyboard, accessibility, responsive and regression checks.

1. Define the user's job and the component boundary. Reuse or extend an existing component when its semantics fit; separate domain-specific behavior from the reusable primitive.
2. Write an anatomy and state matrix. Add only meaningful variant axes; identify impossible combinations, asynchronous states, long/translated content, and theme modes.
3. Specify the public API and ownership of controlled/uncontrolled state, focus, validation and side effects. Map visual roles to semantic tokens, not incidental brand colors.
4. Implement keyboard/pointer/touch behavior and accessible name/state. Prefer native elements when they satisfy the contract; custom interaction requires explicit focus and screen-reader tests.
5. Verify normal, edge, invalid and interruption states in the host app at supported viewports. Compare implementation and design source, and document migration if existing consumers change.

Avoid forcing one framework, icon system or CSS stack. This expands the existing XIAS `design-component`/`design-code` adaptation at `62092bd83bc3df0bcb9a2b3b643305ab11c547da`.
