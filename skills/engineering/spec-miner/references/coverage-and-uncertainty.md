# Coverage and uncertainty

Build a coverage map with entry point, branch or state, evidence path, extracted rule ID, and verification status. Include API routes, background jobs, scheduled tasks, and external callbacks that can bypass the primary UI. A route list without state transitions and side effects is not a complete specification.

For each claim, label:

- **Observed:** directly supported by code or a controlled execution in the reviewed revision.
- **Inferred:** plausible from connected evidence but missing a decisive path or test.
- **Proposed:** desired behavior from a requirement or stakeholder, not implemented evidence.
- **Conflicted:** sources disagree; list both and the decision owner.

Verification may use characterization tests around stable legacy behavior, a safe local fixture, or review by the domain owner. Do not treat a characterization test as endorsement of insecure behavior. Prioritize open questions by migration impact, user harm, and likelihood. End with a list of uninspected modules and unavailable environments so readers know the limits of the recovered spec.
