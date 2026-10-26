# Disposable PITR marker fixture

This is a **manual design fixture**, not an executed restore test. Use an isolated PostgreSQL cluster and a disposable `skill_eval_*` database. Production backup, restore and promotion are outside its scope.

1. Use a version-matched isolated cluster with continuous archiving configured to an isolated archive. Run `setup.sql` and record marker A's timestamp/LSN.
2. Take a base backup with the installed major version's supported tooling; verify its manifest and record the required WAL range.
3. Insert marker B, commit and record a target point after B. Insert marker C afterward. Confirm all three exist on the source fixture.
4. Restore the base backup to a **new** isolated cluster using the continuous WAL chain, targeting the point after B and before C. Never overwrite the source cluster.
5. Assert A and B exist, C does not, constraints hold, the application smoke test passes, and measured elapsed recovery/data loss meet the chosen RTO/RPO. Then remove one required WAL segment from a **copy** of the archive and confirm the drill reports recovery unverified rather than skipping the gap.

The precise recovery settings differ by PostgreSQL major version and hosting platform; use its official versioned documentation. No automated command in this repository performs a restore.
