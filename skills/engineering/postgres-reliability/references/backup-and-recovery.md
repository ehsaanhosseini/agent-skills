# Backup, PITR and restore verification

A recoverable chain needs a valid base backup and the required WAL archive through the target time. Record backup start/end, WAL range, checksum/verification method, encryption, access control, retention and offsite isolation. A successful `pg_basebackup` exit is not proof that the entire application can be restored. Use the installed major version's [continuous archiving and PITR documentation](https://www.postgresql.org/docs/current/continuous-archiving.html).

Isolated drill fixture: create a database with a known marker A; take a base backup, create marker B, then create an unwanted marker C. Restore to a **new isolated cluster** at a target before C, assert A and B exist and C does not, verify constraints and application smoke tests, then record elapsed time and data loss. Use synthetic data and a disposable cluster. Never overwrite the source cluster or remove its data directory for the drill.

Plan for changed timelines, missing WAL segments, credentials, extensions, tablespaces and application dependencies. A logical dump may serve a different purpose from a physical backup and may not provide the same PITR path. Define RPO/RTO acceptance from business requirements and compare measured drill results. If the archive chain, credentials or isolated target are unavailable, report restore unverified rather than claiming readiness.
