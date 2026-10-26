# Accessibility test protocol

Use the project's selected standard. For WCAG 2.2 AA, sample one instance of each distinct template and interaction pattern, plus critical user journeys and failure states. A login form, account dialog, and data table demand different tests. Record browser, OS, assistive technology, zoom, and date; do not generalize from one combination.

| Test | Procedure | Failure example |
|---|---|---|
| Keyboard and focus | Start before the component; traverse Tab/Shift+Tab, Enter/Space, arrow keys where the pattern requires, Escape, and back navigation. Observe order, indication, visibility, and restored focus. | A sticky footer fully hides focused Save; WCAG 2.2 focus-obscured criterion is implicated. |
| Name, role, value | Inspect accessibility tree and speak the control with available screen reader. Compare visible label, programmatic name, role, selected/expanded/invalid state. | A search icon button is announced only as “button”. |
| Forms | Submit empty/invalid/valid data; verify error text is associated, preserves inputs, and is discoverable without color alone. | Error appears visually but focus/announcement gives no clue. |
| Visual | Measure rendered text and non-text contrast, 200% text resize, 400% zoom or equivalent 320 CSS pixel reflow, text spacing, light/dark/hover/focus/error states. | A token pair passes on white but fails on a translucent overlay. |
| Dynamic content | Trigger async loading, status, validation and modal changes; check announcements are timely but not duplicated. | A successful save changes an icon without a spoken result. |
| Media and data | Assess image purpose, captions/transcripts when applicable, table headers and chart summary/data route. | Chart uses only red/green segments and has no equivalent values. |

Use a scanner to find likely defects, then manually confirm. A scanner cannot establish reading order, meaningful alt text, keyboard workflow, or complete conformance. Start with the [WCAG 2.2 recommendation](https://www.w3.org/TR/wcag/) and its Understanding documents; apply criteria to the actual interface rather than asserting every criterion applies.
