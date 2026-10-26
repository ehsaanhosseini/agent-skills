---
name: design-tokens
description: Create or improve cross-platform design tokens and map them to components and Figma variables. Use when a design system needs consistent color, type, spacing, states, themes, or migration across web and Flutter.
---

# Design tokens

Identify the design source of truth, consuming platforms, supported modes and migration constraints. Read [token architecture](references/token-architecture.md) for naming, aliasing and examples, then [build and migration](references/build-and-migration.md) for outputs, tests and rollback.

1. Define primitives, semantic aliases and component roles only where each layer reduces duplicated decisions. Specify type, unit, mode and fallback; avoid a token per one-off value.
2. Separate brand from functional status. Document foreground/background pairs and interactive states, including disabled, focus, dark mode and overlays.
3. Choose one source of truth and generated outputs for the actual platforms. Validate alias acyclicity, resolved values, mode completeness and stable names before publishing artifacts.
4. Map existing usages, migrate incrementally with compatibility aliases when necessary, and inspect representative rendered screens. Figma or Flutter mappings require platform-specific round-trip checks; do not claim lossless sync from name matching.
5. Test contrast in context, theme switching, missing token behavior, build determinism and rollback. Report unresolved usages and breaking changes.

This expands the existing XIAS and Pro Max adaptation at pinned commits `62092bd83bc3df0bcb9a2b3b643305ab11c547da` and `7246805992a42b7bba37d4cac83b01416f0c6c44`.
