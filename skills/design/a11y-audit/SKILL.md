---
name: a11y-audit
description: Audit a UI for accessibility with evidence from code, rendered pages, keyboard operation, and assistive technology where available. Use for accessibility reviews or remediation; report untested criteria explicitly.
---

# Accessibility audit

Define the target standard and sample representative screens, components, and states. Start with semantic structure and accessible names; then inspect keyboard order, visible focus, controls and state announcements, text and non-text contrast, resizing and reflow, forms and errors, motion preferences, and charts/tables. Check both normal and error/loading/disabled states where relevant.

Use automated scans only as one evidence source. Inspect the rendered page for computed contrast, overlays, zoom, and responsive behavior; run keyboard and screen-reader checks when the environment permits. For Figma-only work, limit claims to inspectable properties such as visible contrast, text fit, and proposed semantics. Never report a static design as WCAG-conformant.

Record each finding as `verified`, `flagged for human check`, or `not tested`, with location, impact, criterion if known, and the smallest credible fix. Recheck fixes. Do not invent alt text, labels, or behavior without understanding the content's purpose.

Combines the useful sampling and evidence categories of XIAS `a11y-audit` and AccessLint `accessibility-audit`/`accessibility-inspect`, reviewed at commits `62092bd83bc3df0bcb9a2b3b643305ab11c547da` and `2e9d7336678302d0bc08848e92542560295b34d3`. Their runtime tools are not bundled.
