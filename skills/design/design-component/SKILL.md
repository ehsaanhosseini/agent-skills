---
name: design-component
description: Specify or build a reusable UI component with clear anatomy, variants, states, accessibility, responsive behavior, and code API. Use for component-library work, not a one-off layout detail.
---

# Design component

Define the component's job, anatomy, content constraints, and boundaries. Reuse an existing component when it already meets the need. Keep variant axes meaningful; avoid multiplying variants for cosmetic combinations. Specify default, hover, focus, active, disabled, loading, error, selected, and empty states only where they are semantically possible.

Document keyboard behavior, focus ownership, accessible names, announcements, pointer/touch target, and any reduced-motion behavior. Define responsive behavior and long-text handling. Map colors, typography, spacing, and state styles to semantic tokens; check real rendered states, not only token pairs. For implementation, give the public API, controlled/uncontrolled state contract where applicable, and integration examples using the project's framework. Avoid forcing one icon system or CSS stack on every project.

Verify at least a normal, edge-content, and interaction state in the actual host app. Keep visual specification and implementation synchronized. Adapted from XIAS `design-component` and `design-code` at commit `62092bd83bc3df0bcb9a2b3b643305ab11c547da`.
