<p align="center">
  <img src="https://img.shields.io/badge/templates-35%2B-7c5cfc?style=for-the-badge" alt="35+ templates">
  <img src="https://img.shields.io/badge/domains-8-22d3ee?style=for-the-badge" alt="8 life domains">
  <img src="https://img.shields.io/badge/dependencies-0-34d399?style=for-the-badge" alt="Zero dependencies">
  <img src="https://img.shields.io/badge/license-MIT-f472b6?style=for-the-badge" alt="MIT License">
</p>

# OpenClaw Ops Playbook

**A complete agent architecture for running your entire life — family, work, household, health, finances, travel, and hobbies — through one AI assistant.**

Most AI assistant setups stop at "here's a prompt." This playbook gives you the full operating system: agent identity, domain routing, cross-referenced files, persistent memory, and proactive automation. Designed for busy professionals managing families, careers, side gigs, and everything in between.

> **No dependencies. No build step. Just Markdown templates and your OpenClaw workspace.**

<p align="center">
  <a href="#quick-start"><strong>Quick Start</strong></a> &nbsp;&middot;&nbsp;
  <a href="product/playbook.md"><strong>Full Playbook</strong></a> &nbsp;&middot;&nbsp;
  <a href="#template-inventory"><strong>All Templates</strong></a> &nbsp;&middot;&nbsp;
  <a href="https://lymcho.github.io/openclaw-ops-playbook"><strong>Website</strong></a>
</p>

---

## Why This Exists

| Without a system | With the Playbook |
|---|---|
| Assistant forgets everything each session | Persistent memory across sessions |
| Work, family, and personal life bleed together | 8 clean domains with automatic routing |
| No proactive reminders or check-ins | Departure reminders, CRM nudges, heartbeats |
| Generic personality, no real identity | Unique personality via bootstrap discovery |
| Details scattered across apps and notes | Structured, cross-referenced, one source of truth |

---

## What Makes This Different

- **Domain routing** — One assistant that knows when you're in "work mode" vs "family mode" and loads the right context automatically
- **Cross-referencing** — Files point to each other. Multiple kids share one school file. Side gigs share one knowledge base. One source of truth, many pointers.
- **Agent identity** — Not just a prompt, but a personality with values, opinions, and memory that evolves over time
- **Comprehensive templates** — 35+ ready-to-use files covering every domain of a busy life, each with "How This Works" sections that teach the assistant how to interact with your data

---

## Architecture

### Layers (How the assistant operates)

| Layer | Purpose | Key Files |
|-------|---------|-----------|
| Bootstrap | First-run identity discovery | `BOOTSTRAP.md` |
| Foundation | Agent OS, personality | `AGENTS.md`, `SOUL.md`, `IDENTITY.md` |
| Context | User profile, routing | `USER.md`, `ROLES.md` |
| Memory | Session continuity | `MEMORY.md`, `memory/` |
| Domains | 8 life domains | `family/`, `work/`, `health/`, etc. |
| Automation | Proactive behavior | `HEARTBEAT.md`, `TOOLS.md`, `scripts/` |

### Domains (What the assistant knows about)

| Domain | Covers | Templates |
|--------|--------|-----------|
| **Family** | Kids (per-child), partner, extended family, pets, schools | `family/` |
| **Household** | Vendors, maintenance, vehicles, subscriptions, insurance | `household/` |
| **Work** | Main job, side gigs, professional knowledge base | `work/` |
| **Health** | Family medical, fitness | `health/` |
| **Finances** | Budget, investments, tax prep | `finances/` |
| **Travel** | Trips, loyalty programs, passports | `travel/` |
| **Hobbies** | Per-hobby tracking | `hobbies/` |
| **People** | CRM, birthdays, emergency contacts, groceries | Root + `people/` |

---

## Quick Start

```bash
# Clone the repo
git clone https://github.com/lymcho/openclaw-ops-playbook.git
```

1. **Copy** `templates/` into your OpenClaw workspace
2. **Rename** files (drop `.template` suffixes)
3. **Start with `BOOTSTRAP.md`** — let the assistant discover its identity
4. **Fill in `USER.md`** with your details
5. **Set up `ROLES.md`** — your domain routing rules
6. **Add one domain at a time** — start with what matters most (family? work? both?)
7. **Wire up automation** when ready (HEARTBEAT, TOOLS, scripts)

You don't need everything on day one. Even just foundation + one domain is a big upgrade.

---

## Template Inventory

### Foundation (5 files)

| Template | Lines | Purpose |
|----------|-------|---------|
| `AGENTS.template.md` | 200+ | Agent operating system — session protocol, file architecture, memory, safety, routing |
| `SOUL.template.md` | 46 | Personality, values, communication style |
| `IDENTITY.template.md` | 11 | Name, creature type, emoji (filled during bootstrap) |
| `BOOTSTRAP.template.md` | 55 | First-run identity discovery conversation |
| `USER.template.md` | 17 | User profile — name, timezone, family, priorities |

### Context & Memory (2 files)

| Template | Purpose |
|----------|---------|
| `ROLES.template.md` | Domain routing — 7 domains with triggers, scope, and file references |
| `MEMORY.template.md` | Long-term curated memory structure |

### Family Domain (6 files)

| Template | Purpose |
|----------|---------|
| `family/overview.template.md` | Household roster, weekly rhythms, meal patterns |
| `family/kids/child.template.md` | Per-child: school, activities, medical, friends, milestones |
| `family/partner.template.md` | Spouse: personality, work, health, relationship notes |
| `family/extended/family-member.template.md` | Per-relative: contact, health, relationship with kids |
| `family/pets/pet.template.md` | Vet, daily care, boarding, personality |
| `family/schools/school.template.md` | Calendar, contacts, policies, parent community |

### Household Domain (5 files)

| Template | Purpose |
|----------|---------|
| `household/vendors.template.md` | All service providers (childcare, cleaning, trades, auto) |
| `household/maintenance.template.md` | Seasonal checklists, appliance inventory, repair log |
| `household/vehicles.template.md` | Per-vehicle maintenance, registration, service history |
| `household/subscriptions.template.md` | All recurring services with quarterly audit checklist |
| `household/insurance.template.md` | All policies — health, home, auto, umbrella, life |

### Work Domain (4 files)

| Template | Purpose |
|----------|---------|
| `work/overview.template.md` | All engagements, priorities, idea inbox, quick wins |
| `work/main-job.template.md` | Full-time role: projects, stakeholders, career context |
| `work/side-gig.template.md` | Per-engagement: scope, revenue, pipeline, knowledge refs |
| `work/knowledge-base/topic.template.md` | Portable expertise: frameworks, concepts, your opinions |

### Health, Finances, Travel, Hobbies (7 files)

| Template | Purpose |
|----------|---------|
| `health/family-medical.template.md` | Providers, per-person health, pharmacy, appointments |
| `health/fitness.template.md` | Workout routine, goals, nutrition, progress |
| `finances/budget.template.md` | Operating budget with assistant-enforceable rules |
| `finances/investments.template.md` | Accounts, advisors, estate planning, net worth |
| `finances/tax-prep.template.md` | Annual document checklist and deadlines |
| `travel/profiles.template.md` | Passports, loyalty programs, preferences, packing list |
| `travel/upcoming.template.md` | Active trip plans, bookings, pre-trip checklist |

### People & Automation (7 files)

| Template | Purpose |
|----------|---------|
| `CRM.template.md` | Relationship tracking with cadence and assistant instructions |
| `GROCERIES.template.md` | Store-based lists with smart routing |
| `HEARTBEAT.template.md` | Departure reminders, CRM nudges, state tracking |
| `TOOLS.template.md` | Tool configs, CLI recipes, saved locations |
| `people/birthdays.template.md` | Birthday tracking |
| `people/emergency-contacts.template.md` | Print-friendly emergency contact page |
| `scripts/driving-eta.sh` | Driving ETA with real-time traffic (Google Directions API) |

---

## Target Workspace Layout

```
~/.openclaw/workspace/
├── AGENTS.md                    # Operating system
├── SOUL.md                      # Personality & values
├── IDENTITY.md                  # Name, vibe, emoji
├── USER.md                      # Your profile
├── ROLES.md                     # Domain routing
├── MEMORY.md                    # Long-term memory
├── HEARTBEAT.md                 # Proactive checks
├── TOOLS.md                     # Tool configs
├── CRM.md                       # Relationship tracking
├── GROCERIES.md                 # Shopping lists
├── family/                      # Kids, partner, schools, pets
├── household/                   # Vendors, maintenance, vehicles
├── work/                        # Job, side gigs, knowledge base
├── health/                      # Medical, fitness
├── finances/                    # Budget, investments, taxes
├── travel/                      # Trips, loyalty programs
├── hobbies/                     # Personal interests
├── people/                      # Birthdays, emergency contacts
├── memory/                      # Daily notes, heartbeat state
└── scripts/                     # Automation scripts
```

---

## Full Playbook

The complete walkthrough with architecture deep-dives, patterns, and examples:

**[Read the Playbook &rarr;](product/playbook.md)**

---

## Contributing

Contributions are welcome! Whether it's a new template, a better pattern, or a typo fix.

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Support

If this playbook helps you run your life more sanely:

- **Venmo:** [`@ling-zhou-3`](https://venmo.com/u/ling-zhou-3)

Totally optional. Stars are free and also appreciated.

---

## Related

- **[AI Analytics Prompt Library](https://github.com/lymcho/analyticslibrary)** — Prompts that turn metrics into decisions and narratives

---

## License

[MIT](LICENSE) — Use it, fork it, make it yours.
