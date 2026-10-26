# Disposable PostgreSQL concurrency fixture

This fixture is **not run by CI**. It contains writes and must run only in a newly created local database named `skill_eval_*` with synthetic data. The guard in `setup.sql` rejects other database names. Record the installed PostgreSQL major version and run the two sessions manually; do not copy the commands into a production connection.

1. Create a disposable database with a name beginning `skill_eval_`, connect as a nonprivileged test role and run `setup.sql`.
2. Session A: `BEGIN; UPDATE skill_eval_accounts SET balance = balance - 1 WHERE id = 1;` Leave the transaction open.
3. Session B: `BEGIN; UPDATE skill_eval_accounts SET balance = balance - 1 WHERE id = 2;` Leave it open.
4. Session A: attempt the update for `id = 2` (it waits). Session B: attempt the update for `id = 1`. PostgreSQL should detect a deadlock and abort one transaction with SQLSTATE `40P01`; the other can complete after the aborted session rolls back.
5. Inspect both session outcomes and the final balances. Then repeat with both sessions acquiring rows in ascending ID order; the second session may wait, but the circular wait should disappear. Verify the invariant: each committed transaction decrements both rows once; an aborted transaction decrements neither.

Do not infer production deadlock frequency from this tiny fixture. The production analysis also needs the observed blocker graph, transaction duration, SQLSTATE and application retry/idempotency behavior. Close both sessions and drop only the disposable database through its owner-approved local cleanup.
