# State, drift and recovery

State and saved plans can contain credentials or private infrastructure attributes even when variables are marked sensitive. Restrict backend access, encrypt at rest, control retention and avoid uploading raw state/plan to PR artifacts. See HashiCorp's [sensitive data guidance](https://developer.hashicorp.com/terraform/language/manage-sensitive-data).

Classify drift as intended out-of-band emergency action, unauthorized change, provider normalization or stale state. Do not “fix” drift by blindly applying a plan that would undo emergency containment. Coordinate imports, moves and state surgery with resource owners; these commands can change what the tool believes it owns without changing the actual resource immediately.

Recovery example: a module upgrade proposes replacing a public endpoint. Stop, compare state to the actual endpoint, identify consumers and DNS TTL, test the module in staging, and define a way to preserve or restore endpoint identity. Verify after any authorized apply with read-only provider queries and service smoke tests. Record exact source commit, provider lockfile, workspace, plan digest, approver and observed result.
