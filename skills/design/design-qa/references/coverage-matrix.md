# Risk-based coverage matrix

Select cases by user impact, reuse frequency, recent change and known defects. A login form and payment confirmation deserve more coverage than a decorative icon. For each case record route/component, viewport, theme, locale, data fixture, state, input method and expected behavior. Pairwise coverage can limit combinations, but always include known risky interactions such as narrow width + long text + error state.

Example matrix for a search/results page:

| Case | Fixture | View/state | Expected |
|---|---|---|---|
| Default | 12 results | desktop/light | Header, filters and list align; result count matches rows. |
| No result | 0 results | mobile/dark | Empty guidance and reset action visible; no phantom card. |
| Server error | timeout | mobile/light | Error identified, retry works, focus remains useful. |
| Long content | translated title | narrow/zoom | No clipped action or unreadable text. |
| Permission | restricted item | desktop | No hidden data in DOM or endpoint response. |

Record supported browser engines and assistive technology separately. Do not call a static scan a browser test. Mark skipped/unavailable cases in the report with a reason and impact; never count them as passes.
