# Skill routing for agents

HoccoTech Agent Skills (repository `agent-skills`) are discovered natively: Claude Code reads `~/.claude/skills`, Codex and Cursor read `~/.agents/skills`; `scripts/link.sh` links both. Each skill's `description` is the routing trigger, so keep descriptions task-specific.

## Which skill for which job

| Situation | Skill |
|---|---|
| New or unclear business system, rules, scope | `product-domain-discovery` |
| "What should we do about X" from business data | `business-intelligence-advisor` |
| Metrics disagree, KPI tree, tracking plan | `kpi-analytics-engineering` |
| Entities, schema, ETL, reporting layer | `data-modeling-engineering` (+ `postgres-schema-migrations`) |
| Bookings, approvals, billing, reminders, exceptions | `business-workflow-operations` |
| Third-party APIs, webhooks, retries, idempotency | `api-designer` (integration-reliability) |
| Roles, tenant isolation, audit trail | `security-code-review` (rbac-auditability) |
| Mobile app code | `mobile-engineering` |
| Forecasts, anomaly alerts, LLM assistants | `applied-ai-forecasting` |
| Dashboard screens | `data-dashboard` |

Typical chain for a new management system: discovery -> data modeling -> workflow -> API/security -> KPI -> dashboard.

## Agent instruction snippet

Paste into a project's `CLAUDE.md`, `AGENTS.md`, or `.cursor/rules` (keep these files untracked if they hold private context):

```
Skills: before non-trivial work, check the installed skills and use any whose description matches the task; do not ask permission for a relevant skill. If a missing capability would clearly help, suggest it in one line and wait for approval before adding it. Keep skills public-safe: no customer data or secrets in shared files.
```

Business contexts (Toranj PMS, BBauto, Talaa, studio operations, clinics, salons) stay in each project's own repository; skills carry only generic patterns (`product-domain-discovery/references/domain-patterns.md`).

## Adding capabilities

Prefer extending a skill's references. New skills follow [ADDING-A-SKILL](ADDING-A-SKILL.md): registry row, scenario in `evals/scenarios/`, `scripts/quality_check.py` and `scripts/validate.sh --strict` passing. ECC (`affaan-m/ecc`) was compared for relevant ideas only (API design, healthcare compliance, demand planning, mobile patterns); nothing was installed or vendored.
