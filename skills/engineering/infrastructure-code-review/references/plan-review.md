# Plan review

For Terraform/OpenTofu, validate syntax and formatting locally, then use a plan only in an approved workspace with appropriate provider credentials. Planning may read live resources and write local plan/cache files; it is not a purely offline action. HashiCorp documents that [plan previews changes](https://developer.hashicorp.com/terraform/cli/commands/plan) but can differ from a later apply when external state changes.

Example: a subnet CIDR change yields “replace” for a database subnet group and dependent instances. The reviewer should trace dependents, data persistence, downtime and recovery path, not approve because the HCL diff is one line. Unknown values and provider-computed attributes require explicit uncertainty; a plan that hides a replacement behind a module output is incomplete evidence.

Report counts and identities of create/update/replace/delete without leaking sensitive values. Check policy requirements, least privilege, region/account/workspace, cost and quotas. For every deletion or replacement, identify data owner and backup. Re-run the final plan under a controlled lock before apply; never treat an old speculative plan as authorization.
