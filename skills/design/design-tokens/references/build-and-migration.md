# Build, migration and verification

Make the pipeline deterministic: one reviewed source → validated graph → generated platform files → snapshot or hash comparison. Do not edit generated files by hand. Keep source-to-output mapping and tool version in the repository. Avoid runtime network fetching or unpinned converters.

Migration example: replace `--blue-600` used for both primary action and informational status. Add `color.action.primary` and `color.status.info`, map old use sites by meaning, keep a temporary alias only where compatibility demands it, and compare key light/dark screens before removing the legacy token. Search for unresolved usages and name collisions. A value-preserving rename can still break consumers that import the old symbol.

For Figma variables, compare source values and modes before binding; export and reimport a representative set to reveal missing modes or alias changes. For Flutter, a generated `ThemeExtension` needs `copyWith` and `lerp` plus a theme-switch check. The actual build system must support Dart output; do not infer it from a CSS generator.

Acceptance: clean reproducible build, no alias cycles, all required modes resolved, no unexplained generated diff, rendered contrast for key state pairs, regression screenshots in both themes, and a documented rollback to previous output. Record any platform whose output was not generated or tested.
