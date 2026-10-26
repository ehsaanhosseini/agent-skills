# Findings, severity, and recheck

Use `verified`, `needs human check`, or `not tested`. A verified finding needs a repeatable sequence and evidence; a code smell alone is a hypothesis. Severity considers task blockage, number of users/paths, frequency, workaround, and remediation risk. State a criterion only when the observed behavior supports it.

Example: “On /checkout at 320 CSS px, the shipping method radio group clips its final option. With keyboard focus on that option, the label is outside the viewport and horizontal scrolling does not reveal it. Verified in browser X at 400% zoom; likely WCAG 1.4.10. Move the group to a single column and preserve the label association. Recheck every option, error state and sticky footer at 320/400 CSS px.”

Another example: “The modal opens but focus remains on the hidden page; Escape closes it without returning focus to the trigger.” Reproduce with keyboard and screen reader, fix focus placement/containment/restoration according to the component behavior, then test nested and error states. Do not add `aria-live` to every field; excessive announcements can impair use.

Report the test matrix, issue IDs, impact, smallest credible fix, recheck result, and untested combinations. A screenshot proves only a visual state. An automated pass does not justify “accessible”; conformance claims require the defined scope and manual evidence.
