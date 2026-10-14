---
name: react-composition
description: Design or refactor reusable React component APIs when variants, state ownership, and boolean props are becoming hard to maintain. Use for component architecture; not for simple isolated controls.
---

# React composition

Inspect real call sites before changing an API. When independent boolean props create contradictory combinations, use a small explicit variant, composed child components, or a compound component whose shared state has a clear owner. Do not replace a simple boolean with an elaborate provider merely to follow a pattern.

Keep the state interface distinct from its implementation when multiple consumers or controlled usage require it. Make accessibility behavior and focus ownership survive composition. Prefer `children` for natural layout slots; use render props when the caller truly needs state or behavior from the component. Check React-version-specific APIs against the project's pinned version; do not apply React 19 advice to React 18 automatically.

Verify migration against existing call sites and tests. Original concise adaptation of selected Vercel `composition-patterns` guidance at commit `063bee94c3f4df8453406c830b0a7df0f2860278`.
