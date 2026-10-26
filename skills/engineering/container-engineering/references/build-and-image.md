# Build and image decisions

Use a `.dockerignore` that excludes secrets, Git history, caches and local artifacts; verify that required source and lockfiles remain. A multi-stage build can keep compiler/toolchain out of runtime. Example for a Node service: install from a pinned lockfile in a build stage, compile, then copy only production output and runtime dependencies into a smaller stage. Check native modules and OS/libc compatibility before changing base image.

Docker build arguments or ordinary environment variables can persist in metadata/layers; use [BuildKit secret mounts](https://docs.docker.com/build/building/secrets/) for build-time credentials. Inspect `docker history` and the final image for accidental secrets. Pin base image digest where exact reproducibility is required, but maintain a tracked refresh process because a digest does not auto-receive security fixes. Docker's [build best practices](https://docs.docker.com/build/building/best-practices/) explain stage and base choices.

Acceptance fixture: build twice from same source under documented tooling, run without host credentials, verify correct architecture, inspect final filesystem for source maps/secrets according to policy, and confirm a clean dependency install. If Docker is unavailable, mark the build unexecuted and keep conclusions at source-review level.
