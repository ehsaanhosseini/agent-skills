---
name: design-qa
description: Set up or run measurable UI quality checks for design tokens, states, rendered contrast, overflow, and responsive layouts. Use for pre-release QA or regression gates; keep visual critique separate.
---

# Design QA

Choose checks that match the artifact and the project's existing tooling. For code, start with token resolution and component-state coverage; add browser checks for real contrast, keyboard operation, overflow, and important breakpoints. For static Figma, inspect available properties and screenshots while marking interaction and assistive-technology checks unmeasured.

Use a small representative matrix: key screen sizes, light/dark modes if supported, and meaningful states (default, hover/focus, selected, disabled, loading, empty, error). Freeze sample data and motion for visual comparisons. A test that did not run is `unmeasured`, never a pass. Report failing elements and reproduction steps rather than only a gate count. Keep tools pinned and local to the project; avoid runtime CDN, `@latest`, or automatic package installation.

Do not block valid project-specific design choices merely because they use raw pixels, a native select, or a particular chart library. Hard rules should catch a demonstrated defect; broader aesthetic judgment belongs to `design-critique`.

Adapted from XIAS `design-qa`/`gate` at commit `62092bd83bc3df0bcb9a2b3b643305ab11c547da`. This skill does not claim the upstream 52 gates are installed or passed.
