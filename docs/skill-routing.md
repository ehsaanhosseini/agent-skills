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

## Marketing and growth boundaries

Choose by the requested outcome. Load only needed entrypoints and conditional references; no whole-library or mandatory funnel chain. Existing engineering/design routes remain unchanged.

| Outcome | Primary skill | Conditional neighbor |
|---|---|---|
| Paid campaign strategy/bidding | ads | ad-creative for variants |
| Marketing measurement plan/events/UTMs | analytics | kpi-analytics-engineering for business metrics |
| Confirmed conversions/pixels/CAPI/GTM diagnosis | conversion-tracking | analytics for missing definitions |
| Channel credit/reconciliation/incrementality | attribution | analytics for event quality |
| Technical SEO and AI answer visibility | seo-audit + ai-seo | schema for markup only |
| Store listing visibility/install conversion | aso | mobile-engineering for app code only |
| Monetization/value metric/tiers | pricing | offers for bundles; paywalls for upgrade surfaces |
| Account creation | signup | onboarding for first value |
| Activation/first value | onboarding | churn-prevention for later retention |
| Cancellation/dunning/retention | churn-prevention | emails for message sequences |
| Commerce product/cart/checkout conversion | cro | conversion-tracking if measurement is broken |
| B2B research and outbound drafts | prospecting + cold-email | revops for lifecycle handoffs |
| Hotel/PMS growth strategy | marketing-plan | clarify software adoption vs guest bookings |
| Business decisions and KPI design | business-intelligence-advisor + kpi-analytics-engineering | data-dashboard only for UI |
| Recurring review specification | marketing-loops | scheduler only if requested |
| Marketing asset production | marketing-image / marketing-video | approved available media tools |

marketing-ideas is a conditional reference in marketing-plan. marketing-council is not registered. Source image/video names are narrowed to marketing-image/marketing-video to avoid generic media routing. Plans and drafts never authorize external actions.
