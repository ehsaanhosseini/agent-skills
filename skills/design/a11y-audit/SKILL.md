---
name: a11y-audit
description: Audit a UI for accessibility with evidence from code, rendered pages, keyboard operation, and assistive technology where available. Use for accessibility reviews or remediation; report untested criteria explicitly.
---

# Accessibility audit

Set the product's target standard and version (for example WCAG 2.2 AA), platforms, user journeys, and evidence available. Inspect representative page templates and states, including authentication, forms, errors, overlays, and responsive layouts. Read [test protocol](references/test-protocol.md) for the manual matrix and [findings and remediation](references/findings-and-remediation.md) for evidence and acceptance criteria. This skill audits; it does not certify whole-site conformance.

1. Inventory controls, landmarks, headings, links, images, forms, dialogs, live updates, tables, and charts. Map each relevant criterion to a test and mark out-of-scope criteria explicitly.
2. Test keyboard-only operation: logical focus order, visible and unobscured focus, activation, escape/close, focus restoration, and traps. Test at normal size and zoom/reflow; keyboard success alone does not prove screen-reader behavior.
3. Inspect semantic roles, computed names, states, instructions, errors, and announcements with the accessibility tree and an available assistive technology. Measure rendered color contrast for actual states; scan tools are supplemental.
4. Reproduce each issue with URL/component, viewport, input method, observed result, expected result, criterion, severity, and evidence. Distinguish verified findings from probable issues and untested checks.
5. After remediation, rerun the failing path and adjacent states. Report tested browser/AT combinations, criteria not tested, and residual risks.

For Figma-only work, limit claims to inspectable visual properties and proposed semantics. Do not invent alt text or an accessible name without knowing the content's purpose. This expands the existing XIAS/AccessLint adaptation; their runtime tools remain unbundled.
