# agent-skills

**One curated skill library for better product work.** The same reviewed instructions are shared by Claude Code, Codex, and Cursor through a single local checkout. Skills are scoped to real tasks, so a design review does not load a marketing playbook or an unrelated framework guide.

**31 skills** · **Design, marketing, and SEO** · **Pinned sources** · **No runtime downloads**

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

`skills/hoccotech/` is reserved for future reusable, public-safe HoccoTech skills; none are registered yet.

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
- [docs/ADDING-A-SKILL.md](docs/ADDING-A-SKILL.md) explains how to add a skill. Changes are reviewed on a feature branch before merging to `main`.
- Run `scripts/validate.sh --strict --repo-only` for a clean checkout. `--online` also checks the public GitHub visibility when `gh` is authenticated.

Some skills carry a local policy block because their tasks can write into a project or involve outreach or tracking. Those instructions do not grant extra permissions. The relevant skill's own scope and the user's task authorization still apply. Copied third-party material retains its recorded license; locally authored adaptations cite their reviewed sources.
