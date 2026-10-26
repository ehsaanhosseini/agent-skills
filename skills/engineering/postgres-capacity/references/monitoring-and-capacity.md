# Monitoring, vacuum and capacity

Use read-only views appropriate to the installed major version: `pg_stat_activity` for state/waits, `pg_stat_database` for transactions and conflicts, table statistics for dead tuples and vacuum activity, replication/archiver views for lag and WAL, plus host CPU, memory, I/O and disk. Some fields require extra privileges and statistics may lag or reset; record observation window and reset time. See [PostgreSQL monitoring](https://www.postgresql.org/docs/current/monitoring.html).

Example: disk grows while write traffic is flat. Compare table/index size growth, dead tuples, longest transactions, replication slot retention and archive failures. Do not assume “bloat” and run `VACUUM FULL`: it can require substantial locks and extra disk. Decide whether cause is retained WAL, table churn, index growth or an external artifact, then design a measured maintenance plan.

Capacity report: peak and p95 resource usage, growth rate, estimated headroom with confidence range, expected date to threshold, leading alerts and action owner. Test alert triggers in a safe environment. Include a failure case such as archive stall or pool exhaustion and a runbook action that does not destroy evidence. A dashboard without freshness and numerator/denominator definitions is not operational evidence.
