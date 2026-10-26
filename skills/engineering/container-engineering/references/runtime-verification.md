# Runtime verification

Specify startup dependencies, port, user/group, writable paths, volumes, signal handling, health and readiness semantics, and resource limits. A process can be alive yet unable to serve requests; readiness should test the required path without causing side effects. Liveness should not turn a transient downstream outage into a restart loop.

Example: a service needs a writable temporary directory but otherwise runs with a read-only root filesystem. Test startup with only that mount, graceful `SIGTERM` while a request is in flight, database unavailable then restored, and a low-memory limit. Check whether the runtime image contains a shell before relying on shell-based health checks. Do not use `chmod 777` to fix permissions; assign ownership narrowly.

Collect image digest, runtime configuration (redacted), exit codes, logs and health transitions. Verify that a failed image can be rolled back without incompatible schema changes. A local `docker run` success does not prove orchestrator networking, storage or security policy; test those in the project's staging environment before release.
