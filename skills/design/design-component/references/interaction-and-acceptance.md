# Interaction and acceptance

Build a state matrix with applicable default, hover, focus, active, disabled, loading, selected, invalid, empty and success states. Mark inapplicable states rather than designing every permutation. For each state, record visible cue, programmatic state, keyboard behavior, pointer/touch behavior, announcement, token use and exit condition.

For `SearchField`, acceptance tests include: label focuses input; typing starts one debounced request; late response from an earlier query cannot replace newer results; Escape closes suggestions and preserves input; Arrow/Enter select a suggestion when the combobox behavior is enabled; clear has a spoken name; empty and error states remain distinguishable; long translated placeholder or result text does not clip at the narrowest supported viewport. Test reduced motion if the popup animates.

Use actual browser/accessibility tree to check name, role and state. Compare focus and contrast on rendered surfaces, not isolated tokens. Include at least one integration test in a host screen because parent overflow, form submission and stacking contexts can break an otherwise correct component. Record test environment, failed states, and unverified assistive technologies. Recheck API migration in every affected call site.
