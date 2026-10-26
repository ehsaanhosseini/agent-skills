# Visual and interaction checks

Freeze test data, clock, fonts, viewport, color mode and animation before visual comparison. A changed screenshot is evidence to inspect, not automatically a defect. Check whether the altered pixels affect information order, legibility, alignment or state feedback. Keep a reviewer note when accepting intentional changes.

For each relevant component verify: default/focus/active/disabled/error/loading states; keyboard focus order and visibility; pointer and touch hit area; zoom/reflow; long text and localization; rendered contrast on actual backgrounds; overflow and sticky layers. Use semantic assertions for text/role/state in addition to screenshots. Measure target size against the project's target standard when required rather than one universal pixel rule.

Example regression: a modal baseline changes after a font update. Confirm the new font is loaded, compare at fixed viewport, then test long error text. If the close button moves below the fold at 400% zoom, classify as a defect rather than refreshing the snapshot. Verify close by keyboard and focus restoration. If the platform is unavailable, record the unmeasured check.

Output: command/tool version, fixture, matrix, diff decisions, reproducible failures, recheck status and remaining gaps. Avoid a numerical pass rate that includes omitted states.
