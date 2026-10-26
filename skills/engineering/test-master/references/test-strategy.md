# Risk-based test strategy

Build a compact matrix: behavior, failure impact, layer, fixture, expected result, and owner. Example for checkout: price calculation has fast unit cases; inventory reservation needs a database integration case; payment retry needs a contract or integration case with an idempotency fixture; the complete purchase journey gets one browser test. A blanket test pyramid ratio is less useful than mapping actual risks to evidence.

For a function accepting a discount and quantity, test an ordinary case, zero boundary, invalid negative quantity, and rounding rule. For a repository write, test rollback when a second statement fails. For an API, test unauthenticated/forbidden behavior and error shape. For a browser flow, use a stable test account and isolate order data per run.

Use factories or fixtures with explicit ownership and cleanup. Unit tests should not unexpectedly call real network services. Integration tests should run against a controlled local or ephemeral dependency with deterministic schema and data. Decide whether time, randomness, queues, and eventual consistency need control; do not mock them away if they are the behavior under test.

Verification includes the test command, framework and dependency versions, environment, result, and coverage of the stated risks. Identify skipped tests and explain why. A passing suite cannot establish correctness for scenarios it does not exercise.
