# AI features

- Retrieval over the project's own approved documents; cite sources in answers.
- Prompt injection: treat retrieved and user content as untrusted data; limit tool permissions; confirm side effects.
- Data minimization: redact personal and health identifiers before sending to external services; check vendor terms and residency.
- Evaluation: a small fixed set of realistic cases with expected behavior, rerun on model or prompt change.
- Controls: cost and rate limits, timeouts, graceful fallback, feedback capture.
- Disclosure: users know when they interact with AI; no clinical or legal advice from the assistant.
