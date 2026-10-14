---
name: design-tokens
description: Create or improve cross-platform design tokens and map them to components and Figma variables. Use when a design system needs consistent color, type, spacing, states, themes, or migration across web and Flutter.
---

# Design tokens

Use three layers when scale justifies them: primitives (raw values), semantic aliases (intent such as `surface-raised` or `text-muted`), and component tokens (local role). Keep the public vocabulary small; do not make a token for every one-off value. Record units, modes, and alias resolution. Separate brand identity from status meaning, so brand changes do not silently alter success/error affordances.

For each token family, define the source of truth and outputs needed by the actual project. Validate aliases, mode completeness, and foreground/background pairs. Check rendered contrast and state combinations; token contrast alone cannot validate text over images or overlays. When mapping Figma variables, inspect names and modes before binding; do not claim lossless synchronization without a round-trip check. For Flutter, specify Dart output and a complete `ThemeExtension` implementation, including `copyWith` and `lerp`, then test a theme change. Do not assume XIAS's current token build emits Dart.

On migration, map old tokens to new semantics, identify unresolved usages, and compare key screens before removing old values. Keep rollback possible. For brand-to-token work, connect product positioning and visual identity to named palette/type choices without making a second independent source of truth.

Adapted from XIAS `design-tokens`, `brandkit`, `token-build`, and Pro Max `brand`/`design-system`, reviewed at commits `62092bd83bc3df0bcb9a2b3b643305ab11c547da` and `7246805992a42b7bba37d4cac83b01416f0c6c44`.
