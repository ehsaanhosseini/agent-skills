# Connections and poolers

PostgreSQL uses server resources per connection; more connections can reduce throughput under CPU/memory contention. Record app replicas × pool size, background workers, admin reserve, peak active sessions and wait queues before changing `max_connections`. The pooler's session, transaction or statement mode affects session state, prepared statements, temporary tables and advisory locks; check the installed pooler and driver behavior.

Example: 20 app pods each allow 30 database connections, creating a theoretical 600 before jobs and admin access. If only 80 are active at peak and the rest idle, increasing the server limit may hide leaked clients. Inspect connection lifetime, transaction age and pool wait time. A smaller per-pod pool plus bounded queue can improve stability, but test burst latency and failover reconnection in staging.

Use Little's Law (`concurrency ≈ arrival rate × time in system`) as a rough model with consistent units; queues, long transactions and burstiness require headroom. Keep a route for emergency administration. Avoid applying an arbitrary universal pool-size formula. Test connection loss, credential rotation, pooler restart and transaction rollback behavior before rollout.
