# agent-skills — HoccoTech Agent Skills

**One curated skill library for better product work.** The same reviewed instructions are shared by Claude Code, Codex, and Cursor through a single local checkout. Skills are scoped to real tasks, so a design review does not load a marketing playbook or an unrelated framework guide.

**97 skills** · **Engineering, design, marketing, SEO, and business systems** · **Pinned sources** · **No runtime downloads**

> This repository is public. It contains reusable workflows, not customer data, secrets, project files, or private business context.

## Find the right skill

Use the skill that matches the job. A few useful pairings: `frontend-design` sets visual direction; `emil-design-eng` polishes implementation. `design-critique` judges a rendered screen; `design-qa` checks measurable defects. `data-dashboard` decides what an operational view should show; `design-reference-search` only supplies optional reference rows.

### Product design and engineering

| Skill | Use it for | What it adds |
|---|---|---|
| [figma-deliverables](skills/design/figma-deliverables/SKILL.md) | Full Figma project delivery for responsive web and native iOS/Android | Mobile-first or desktop-first checklists, shared foundations, screen/state completeness and handoff gates |
| [frontend-design](skills/design/frontend-design/SKILL.md) | A web page needs a distinctive visual direction | Brief-led typography, layout, palette, and self-critique |
| [data-dashboard](skills/design/data-dashboard/SKILL.md) | CMS, PMS, analytics, or monitoring screens | Decision-led hierarchy, honest metrics, meaningful charts, and the full page journey |
| [design-critique](skills/design/design-critique/SKILL.md) | Reviewing a rendered screen or prototype | Prioritized visual and UX findings tied to visible evidence |
| [a11y-audit](skills/design/a11y-audit/SKILL.md) | Auditing accessibility | Keyboard, semantics, contrast, reflow, and clear tested/unverified evidence |
| [design-qa](skills/design/design-qa/SKILL.md) | Preventing UI regressions | Project-aware checks for states, tokens, overflow, contrast, and breakpoints |
| [design-tokens](skills/design/design-tokens/SKILL.md) | Building a consistent design system | Semantic tokens and validation across web, Figma, and Flutter workflows |
| [design-component](skills/design/design-component/SKILL.md) | Specifying or building reusable components | Anatomy, variants, states, accessibility, and implementation API |
| [design-reference-search](skills/design/design-reference-search/SKILL.md) | Looking up a chart, style, palette, or pattern | An offline, pinned Pro Max catalog with cautious matching |
| [react-performance](skills/design/react-performance/SKILL.md) | React or Next.js performance work | Evidence-led fetching, bundle, rendering, and rerender decisions |
| [react-composition](skills/design/react-composition/SKILL.md) | React component APIs becoming hard to maintain | Clear state ownership, variants, and compound composition |

### Engineering

| Skill | Use it for | What it adds |
|---|---|---|
| [typescript-safety](skills/engineering/typescript-safety/SKILL.md) | TypeScript API boundaries and unsafe type assumptions | Runtime validation, precise narrowing, and project-aware type checks |
| [postgres-query-review](skills/engineering/postgres-query-review/SKILL.md) | Measured PostgreSQL query issues | Safe plan interpretation and reviewable query or index proposals |
| [security-code-review](skills/engineering/security-code-review/SKILL.md) | Scoped application source review | Evidence-backed findings, redaction, and controlled testing scope |
| [nextjs-developer](skills/engineering/nextjs-developer/SKILL.md) | Next.js routes, data, and mutations | Version-aware server/client and security decisions |
| [api-designer](skills/engineering/api-designer/SKILL.md) | HTTP API contracts and evolution | Resource semantics, failures, compatibility, and contract checks |
| [architecture-designer](skills/engineering/architecture-designer/SKILL.md) | System boundaries and tradeoffs | ADRs with failure and operational verification |
| [test-master](skills/engineering/test-master/SKILL.md) | Risk-based test strategy | Layer selection, edge cases, and failure analysis |
| [playwright-expert](skills/engineering/playwright-expert/SKILL.md) | Browser test implementation | Stable locators, fixtures, traces, and flake diagnosis |
| [monitoring-expert](skills/engineering/monitoring-expert/SKILL.md) | Service observability | Defined signals, actionable alerts, and rollout checks |
| [spec-miner](skills/engineering/spec-miner/SKILL.md) | Recovering legacy behavior | Evidence-linked rules and uncertainty tracking |
| [postgres-concurrency](skills/engineering/postgres-concurrency/SKILL.md) | MVCC, isolation, locks and deadlocks | Safe two-session diagnosis and invariant checks |
| [postgres-schema-migrations](skills/engineering/postgres-schema-migrations/SKILL.md) | Schema and migration review | Constraint, lock, backfill and rollback analysis |
| [postgres-reliability](skills/engineering/postgres-reliability/SKILL.md) | WAL, replication, backup and recovery | Isolated restore drills and failover planning |
| [postgres-capacity](skills/engineering/postgres-capacity/SKILL.md) | Pooling and database capacity | Read-only telemetry and guarded experiments |
| [ci-cd-engineering](skills/engineering/ci-cd-engineering/SKILL.md) | Pipeline and release gates | PR trust boundaries and artifact provenance |
| [container-engineering](skills/engineering/container-engineering/SKILL.md) | Container image and runtime review | Build, secret and runtime verification |
| [infrastructure-code-review](skills/engineering/infrastructure-code-review/SKILL.md) | IaC plan review | Replacement, drift and sensitive-state analysis |
| [deployment-recovery](skills/engineering/deployment-recovery/SKILL.md) | Rollout and rollback planning | Staged release and recovery criteria |
| [configuration-secrets](skills/engineering/configuration-secrets/SKILL.md) | Config and credential lifecycle | Schema, rotation and exposure review |
| [incident-runbooks](skills/engineering/incident-runbooks/SKILL.md) | Production incident planning | Evidence-led containment and recovery checks |

### Business systems and data

Generic patterns for PMS, marketplace, clinic, salon, and studio systems; see [skill routing](docs/skill-routing.md).

| Skill | Use it for | What it adds |
|---|---|---|
| [product-domain-discovery](skills/hoccotech/product-domain-discovery/SKILL.md) | Unclear business system or scope | Actors, rules, states, and a measurable first slice |
| [business-intelligence-advisor](skills/hoccotech/business-intelligence-advisor/SKILL.md) | Decisions from business data | Baselines, diagnosis, and calibrated recommendations |
| [kpi-analytics-engineering](skills/hoccotech/kpi-analytics-engineering/SKILL.md) | KPI definitions and tracking | Metric specs and reconciliation |
| [data-modeling-engineering](skills/hoccotech/data-modeling-engineering/SKILL.md) | Schemas and pipelines | Constraints, history, tenancy, idempotent ETL |
| [business-workflow-operations](skills/hoccotech/business-workflow-operations/SKILL.md) | Bookings, approvals, billing flows | State machines, exceptions, audit |
| [mobile-engineering](skills/hoccotech/mobile-engineering/SKILL.md) | React Native, Flutter, SwiftUI, Compose | Architecture, offline, security, release checks |
| [applied-ai-forecasting](skills/hoccotech/applied-ai-forecasting/SKILL.md) | Forecasts and AI features | Baselines, validation, human oversight |

### Interaction and craft

| Skill | Use it for | What it adds |
|---|---|---|
| [emil-design-eng](skills/design/emil-design-eng/SKILL.md) | Polishing product UI implementation | Component detail, motion, and interaction craft |
| [apple-design](skills/design/apple-design/SKILL.md) | Gesture-driven or physical-feeling web interactions | Springs, interruption, momentum, and accessible motion |
| [animate](skills/design/animate/SKILL.md) | Creating purposeful UI animation | A deliberate choice of behavior, tool, timing, and exit |
| [review-animations](skills/design/review-animations/SKILL.md) | Reviewing existing motion | Specific quality findings and verdicts; explicit invocation only |
| [improve-animations](skills/design/improve-animations/SKILL.md) | Planning motion improvements across a codebase | A read-only source audit and implementation plans |
| [prototype](skills/design/prototype/SKILL.md) | Comparing distinct UI directions | Full-size variants in a visual picker; optional journey and error-path tests; explicit invocation only |
| [pick-ui-library](skills/design/pick-ui-library/SKILL.md) | Choosing a frontend dependency | A fit-based library choice using the project's existing stack; explicit invocation only |
| [mobile-native](skills/design/mobile-native/SKILL.md) | Making mobile web feel native | Touch, viewport, safe-area, keyboard, and device-specific fixes |

### Marketing and research

| Skill | Use it for | What it adds |
|---|---|---|
| [product-marketing](skills/marketing/product-marketing/SKILL.md) | Defining product positioning and audience | Reusable project context, created only under its local policy |
| [content-strategy](skills/marketing/content-strategy/SKILL.md) | Planning what to publish | Topics, priorities, and a coherent content plan |
| [customer-research](skills/marketing/customer-research/SKILL.md) | Learning from interviews, surveys, or feedback | Evidence-backed customer needs and patterns |
| [competitor-profiling](skills/marketing/competitor-profiling/SKILL.md) | Researching a competitor from public sources | Structured strengths, gaps, and positioning context |
| [prospecting](skills/marketing/prospecting/SKILL.md) | Finding and qualifying potential customers | A research-first prospect list within its data-use limits |
| [cold-email](skills/marketing/cold-email/SKILL.md) | Drafting outbound email | Clear, relevant drafts and follow-ups; no automatic sending |
| [cro](skills/marketing/cro/SKILL.md) | Improving a landing page or conversion flow | Friction analysis and testable improvements |
| [analytics](skills/marketing/analytics/SKILL.md) | Planning or auditing measurement | Events, attribution, and tracking requirements with consent in mind |

### Search and site structure

| Skill | Use it for | What it adds |
|---|---|---|
| [seo-audit](skills/seo-geo/seo-audit/SKILL.md) | Diagnosing search visibility | Technical and content findings grounded in current search-engine guidance |
| [ai-seo](skills/seo-geo/ai-seo/SKILL.md) | Improving visibility in AI answers | Sourceability and answer-engine content guidance without ranking guarantees |
| [schema](skills/seo-geo/schema/SKILL.md) | Adding or checking structured data | Appropriate schema markup and validation |
| [site-architecture](skills/seo-geo/site-architecture/SKILL.md) | Planning page hierarchy and internal links | Clear navigation, URLs, and information structure |

`skills/hoccotech/` contains reusable business-system and data workflows; private project context stays outside this library.

### Specialized growth and revenue skills

Self-contained, pinned-source adaptations; no upstream runtime tooling. See [integration assessment](docs/marketing-integration.md).

| Skill | Use it for |
|---|---|
| [ab-testing](skills/marketing/ab-testing/SKILL.md) | Design marketing A/B tests, sample-size plans, or growth experiment programs. |
| [ad-creative](skills/marketing/ad-creative/SKILL.md) | Draft and iterate paid ad headlines, static concepts, UGC briefs, and video storyboards. |
| [ads](skills/marketing/ads/SKILL.md) | Plan or audit paid campaigns on Google Ads, Meta, LinkedIn and other ad networks: PPC, targeting, search terms, bidding, budgets, CPA and ROAS. |
| [aso](skills/marketing/aso/SKILL.md) | Audit App Store or Google Play listing visibility and install conversion: ASO, metadata, screenshots, localization and store experiments. |
| [attribution](skills/marketing/attribution/SKILL.md) | Interpret marketing channel contribution, reconcile platform versus revenue reports, or plan first-party attribution, multi-touch models and incrementality. |
| [churn-prevention](skills/marketing/churn-prevention/SKILL.md) | Design SaaS retention, transparent cancellation, save offers, dunning and failed-payment recovery. |
| [co-marketing](skills/marketing/co-marketing/SKILL.md) | Plan partner selection and joint campaigns, integration marketing, cross-promotion and co-branded programs. |
| [community-marketing](skills/marketing/community-marketing/SKILL.md) | Design customer communities, forums, ambassador programs and community-led growth. |
| [competitors](skills/marketing/competitors/SKILL.md) | Create truthful alternative, versus and comparison pages with evidence-backed differentiation. |
| [conversion-tracking](skills/marketing/conversion-tracking/SKILL.md) | Implement, audit or fix confirmed website conversions reaching GA4, Google Ads, Meta CAPI, LinkedIn or other destinations: GTM, dataLayer, duplicate purchases, missing bookings or Enhanced Conversions. |
| [copy-editing](skills/marketing/copy-editing/SKILL.md) | Edit existing marketing copy for clarity, evidence, consistency and conversion while preserving approved voice. |
| [copywriting](skills/marketing/copywriting/SKILL.md) | Draft marketing pages, product messages, headlines and calls to action from audience evidence. |
| [directory-submissions](skills/marketing/directory-submissions/SKILL.md) | Plan and track relevant product, industry, app and review directory listings for qualified discovery. |
| [emails](skills/marketing/emails/SKILL.md) | Design opted-in lifecycle email sequences: welcome, nurture, activation, cart recovery and win-back. |
| [events](skills/marketing/events/SKILL.md) | Plan webinars, workshops, conferences, sponsorships and speaking programs with a measurable follow-up funnel.. |
| [free-tools](skills/marketing/free-tools/SKILL.md) | Scope free calculators, checkers, generators or templates as useful acquisition products. |
| [influencer-marketing](skills/marketing/influencer-marketing/SKILL.md) | Plan creator partnerships, UGC programs, affiliate creators and newsletter sponsorships with fit, rights and disclosure controls.. |
| [launch](skills/marketing/launch/SKILL.md) | Plan product, feature and market launches: readiness, audience sequencing, release communications and post-launch learning.. |
| [lead-magnets](skills/marketing/lead-magnets/SKILL.md) | Design useful gated or ungated guides, checklists, templates and research offers that qualify demand. |
| [link-building](skills/seo-geo/link-building/SKILL.md) | Plan ethical earned-link acquisition, digital PR, resource placement and relevant partnership links. |
| [marketing-loops](skills/marketing/marketing-loops/SKILL.md) | Design bounded recurring marketing reviews, alerts and draft workflows with cadence, state, idempotency and stop conditions. |
| [marketing-plan](skills/marketing/marketing-plan/SKILL.md) | Build a proportionate marketing or product growth strategy across acquisition, activation, retention, referrals and revenue for SaaS, commerce, hospitality and services. |
| [marketing-psychology](skills/marketing/marketing-psychology/SKILL.md) | Apply behavioral models to ethical marketing decisions, message clarity, choice architecture and experiment hypotheses. |
| [offers](skills/marketing/offers/SKILL.md) | Design product/service offers, bundles, bonuses, guarantees and honest urgency around a real customer outcome. |
| [onboarding](skills/marketing/onboarding/SKILL.md) | Improve post-signup activation, first-run setup, minimum path to value, empty states and time to first value. |
| [paywalls](skills/marketing/paywalls/SKILL.md) | Design transparent in-product upgrade prompts, usage limits and subscription paywalls, including mobile purchase/restore states. |
| [popups](skills/marketing/popups/SKILL.md) | Design or evaluate marketing modals, banners, slide-ins and opt-in prompts for conversion with accessible dismissal. |
| [pricing](skills/marketing/pricing/SKILL.md) | Design SaaS and service monetization, value metrics, tiers, usage pricing and pricing research. |
| [programmatic-seo](skills/seo-geo/programmatic-seo/SKILL.md) | Plan scalable search pages from structured data and templates: location, integration, inventory and comparison page families. |
| [public-relations](skills/marketing/public-relations/SKILL.md) | Develop earned-media strategy, journalist pitch drafts, announcements, podcast preparation and crisis-response drafts.. |
| [referrals](skills/marketing/referrals/SKILL.md) | Design customer referral, affiliate, advocacy and review programs with incentives, attribution and anti-abuse controls.. |
| [reverse-engineer-marketing](skills/marketing/reverse-engineer-marketing/SKILL.md) | Research evidence-backed growth timelines, channel patterns and funnel teardowns from public sources. |
| [revops](skills/marketing/revops/SKILL.md) | Design CRM lifecycle stages, lead qualification/scoring, routing, sales handoffs, pipeline hygiene and revenue operations. |
| [sales-enablement](skills/marketing/sales-enablement/SKILL.md) | Create sales decks, demo scripts, one-pagers, battlecards, objection handling and win/loss analysis grounded in approved product evidence.. |
| [signup](skills/marketing/signup/SKILL.md) | Improve registration, account creation and free-trial signup conversion while preserving identity/security controls. |
| [sms](skills/marketing/sms/SKILL.md) | Plan consent-based SMS, MMS and WhatsApp lifecycle messaging, opt-ins, suppression and recovery campaigns. |
| [social](skills/marketing/social/SKILL.md) | Draft organic social posts, carousels, short-form scripts, content calendars and public listening summaries. |
| [marketing-image](skills/marketing/marketing-image/SKILL.md) | Plan and produce marketing images, product mockups, social graphics and OG assets using approved available tools. |
| [marketing-video](skills/marketing/marketing-video/SKILL.md) | Plan marketing video production, product-demo recordings, storyboards, edit analysis and programmatic video briefs using available tools. |

## How the library works

```text
GitHub main ──pull──> one local checkout
                       ├── ~/.agents/skills/<name>  → Codex, Cursor, compatible agents
                       └── ~/.claude/skills/<name>  → Claude Code
```

Each link points to the same skill folder. GitHub is the source of truth and backup; agents read the local checkout. There are no per-project copies, automatic updates, startup installs, or required network calls when a skill runs. Project-specific rules stay in their own project.

### Set up on a Mac

```bash
git clone https://github.com/ehsaanhosseini/agent-skills.git "$HOME/Dev Projects/agent-skills"
cd "$HOME/Dev Projects/agent-skills"
scripts/validate.sh --repo-only
scripts/link.sh --dry-run
scripts/link.sh
```

The linking script skips existing paths it does not own. On an existing installation, pull the latest `main`, review the link preview, and run `scripts/link.sh` to expose newly added skills. Restart an agent if it caches its available-skill list.

### Choose, update, and verify

- `registry/skills.tsv` is the complete inventory, including source, reviewed commit, status, and local restrictions. Run `scripts/inventory.sh` for a compact table.
- [UPSTREAM.md](UPSTREAM.md) records provenance and local adaptations. [SECURITY.md](SECURITY.md) sets the review and public-repository hygiene rules.
- [Existing skills audit](docs/existing-skills-audit.md) covers the 34-skill baseline; [Jeffallan candidate assessment](docs/jeffallan-candidate-assessment.md) records all 12 pinned candidates and naming decisions. [Engineering behavior evaluations](docs/engineering-behavior-evaluations.md) and [quality gates](docs/quality-gates.md) describe the review evidence and its limits. The [first integration record](docs/engineering-skills-vetting.md) remains for history.
- [Professional quality rubric](docs/professional-quality-rubric.md), [remediation review](docs/remediation-review.md), [PostgreSQL/DevOps coverage](docs/postgres-devops-coverage.md), [evaluation results](docs/evaluation-results.md), [governance](docs/engineering-governance.md), and [improvement backlog](docs/improvement-backlog.md) track the next quality pass. GitHub CI runs structural, provenance and security checks; agent behavior evidence is reviewed separately.
- [docs/ADDING-A-SKILL.md](docs/ADDING-A-SKILL.md) explains how to add a skill. Changes are reviewed on a feature branch before merging to `main`.
- Run `scripts/validate.sh --strict --repo-only` for a clean checkout. `--online` also checks public GitHub visibility using authenticated `gh`, or the official public REST API when `gh` is unavailable. Network errors, invalid responses, and a repository identity or visibility mismatch fail the check.

Some skills carry a local policy block because their tasks can write into a project or involve outreach or tracking. Those instructions do not grant extra permissions. The relevant skill's own scope and the user's task authorization still apply. Copied third-party material retains its recorded license; locally authored adaptations cite their reviewed sources.
