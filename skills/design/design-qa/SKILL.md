---
name: design-qa
description: Set up or run measurable UI quality checks for design tokens, states, rendered contrast, overflow, and responsive layouts. Use for pre-release QA or regression gates; keep visual critique separate.
---

# Design QA

Define the release surface and supported browser/viewport/state matrix. Read [coverage matrix](references/coverage-matrix.md) for risk-based sampling and [visual and interaction checks](references/visual-and-interaction-checks.md) for reproducible assertions. Use the project's installed tools; do not install packages or call a CDN as part of an audit.

1. Inventory changed components and critical journeys. Select representative breakpoints, modes, locale lengths, data fixtures and interaction states; state what is omitted.
2. Check token resolution and component-state coverage statically, then inspect rendered contrast, overflow, focus, labels, hit targets and responsive order in a browser when available.
3. Compare stable screenshots with controlled viewport, fonts, data, clock and animation. Triage diffs as intended change, environment noise or defect; do not approve an unexplained diff by updating the baseline.
4. Exercise primary journey and failure recovery with keyboard and pointer. Cross-check semantics with `a11y-audit` when accessibility claims exceed these checks.
5. Report each failed gate with reproduction, expected/actual and severity. Retest after fixes; list unavailable browser/platform combinations as unmeasured.

Static Figma inspection cannot verify code interaction. A raw pixel or native control is not a failure by itself. This expands XIAS `design-qa`/`gate` at `62092bd83bc3df0bcb9a2b3b643305ab11c547da`; upstream “52 gates” are not claimed as installed.
