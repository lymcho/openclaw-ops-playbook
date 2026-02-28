# OpenClaw Ops Playbook

A complete agent architecture for running your life and work on OpenClaw.

The persona: a busy professional with a family, managing a full-time job, side gigs, a household, kids, a partner, extended family, pets, health, finances, travel, and hobbies — all through one assistant.

---

## 0. Architecture Overview

The assistant is organized in **layers**, and your life is organized in **domains**. Layers define how the assistant operates. Domains define what it knows about.

### Layers

| Layer | What | Key Files |
|-------|------|-----------|
| **Bootstrap** | First-run identity discovery | `BOOTSTRAP.md` |
| **Foundation** | Agent OS, personality, values | `AGENTS.md`, `SOUL.md`, `IDENTITY.md` |
| **Context** | User profile, domain routing | `USER.md`, `ROLES.md` |
| **Memory** | Continuity across sessions | `MEMORY.md`, `memory/` |
| **Domains** | Life content (see below) | Domain-specific files |
| **Automation** | Proactive behavior | `HEARTBEAT.md`, `TOOLS.md`, `scripts/`, `skills/` |

### Domains

| Domain | What It Covers | Key Files |
|--------|---------------|-----------|
| **Family** | Kids, partner, extended family, pets, schools | `family/` |
| **Household** | Vendors, maintenance, vehicles, subscriptions, insurance | `household/` |
| **Work** | Main job, side gigs, knowledge base | `work/` |
| **Health** | Medical, fitness, wellness | `health/` |
| **Finances** | Budget, investments, taxes | `finances/` |
| **Travel** | Trips, loyalty programs, passports | `travel/` |
| **Hobbies** | Personal interests and activities | `hobbies/` |
| **People** | CRM, birthdays, emergency contacts, groceries | Root + `people/` |

### Cross-Referencing

Files reference each other using `→` syntax:

```markdown
→ See `family/schools/latin-school.md` for calendar and contacts.
```

When the assistant sees a reference, it follows it. This means:
- Multiple kids at the same school share one school file
- Work engagements pull from the same knowledge base
- Vendors are referenced from maintenance, vehicles, and pet files
- Insurance is referenced from health, vehicles, and household files

One source of truth, many pointers.

### Loading Strategy

The assistant doesn't load everything at once. That would waste tokens.

- **Always loaded:** SOUL.md, USER.md, daily memory
- **Session start (main):** MEMORY.md
- **On demand:** Domain files, based on conversation topic
- **Cross-referenced:** Follow `→` links when files point to each other

---

## 1. Bootstrap & First Run

**Goal:** Let the assistant discover its identity through conversation.

`BOOTSTRAP.md` scripts a first conversation where the assistant and user figure out:
- The assistant's name, nature, vibe, and emoji
- The user's name, preferences, and priorities

After bootstrapping, the assistant updates `IDENTITY.md`, `USER.md`, and `SOUL.md`, then deletes `BOOTSTRAP.md`.

This matters because an assistant that _discovered_ its identity has a stronger sense of self than one assigned a config file.

---

## 2. Agent Foundation

Three files define who the assistant is:

### AGENTS.md — The Operating System

The master file. Defines:
- **Session startup protocol** — what to read every time
- **File architecture** — complete map of all domain files
- **Memory rules** — daily notes, long-term memory, what to load when
- **Domain routing** — how to pick the right files for a conversation
- **Safety** — what's safe vs. needs permission
- **Group chat behavior** — when to speak, when to stay silent
- **Heartbeat behavior** — proactive checks and quiet hours

### SOUL.md — Personality & Values

How the assistant behaves:
- Be genuinely helpful, not performatively helpful
- Have opinions — disagree, find things amusing or boring
- Be resourceful before asking
- Be a friend, not a servant — call out bad ideas, hold the user accountable
- Brevity is respect

### IDENTITY.md — Name & Creature

Short file filled in during bootstrap: name, creature type, vibe, emoji, avatar.

---

## 3. User Profile & Domain Routing

### USER.md

The user's profile: name, pronouns, timezone, family situation, priorities, personality notes.

### ROLES.md — The Router

This is the architectural centerpiece. It defines **7 domains** with:
- **Trigger words** — what topics activate each domain
- **Scope** — what the domain covers (and doesn't)
- **Files to load** — which files the assistant should read

The assistant uses one simple rule: match the topic to a domain, load the relevant files, follow cross-references.

For cross-domain requests ("book a babysitter for our trip"), it loads files from both domains.

---

## 4. Memory System

### Daily Notes — `memory/YYYY-MM-DD.md`

Raw logs tagged by domain:

```markdown
### Family
- Soccer game Saturday at 9am
- Need to RSVP for birthday party

### Work
- Finished KPI Hub review
- Published new video

### Household
- Dishwasher noise — check warranty
```

### Long-Term Memory — `MEMORY.md`

Curated knowledge about the user: personality, family, career, important people, life patterns, financial posture. Distilled from daily notes over time.

Security: only loaded in main session, never in group chats.

### Heartbeat State — `memory/heartbeat-state.json`

Tracks what's been checked and reminded to prevent duplicates.

### Memory Maintenance

During heartbeats (every few days), the assistant reviews recent daily notes, extracts insights, updates MEMORY.md, and removes stale info.

---

## 5. Family Domain

### Family Overview — `family/overview.md`

Household roster with links to per-person files. Weekly rhythms, bedtime routines, meal patterns.

### Per-Child Files — `family/kids/[child].md`

Each child gets their own file with:
- **School:** Current school, grade, teacher, start/end times, drop-off/pickup logistics
- **Activities:** Weekly schedule table — day, time, activity, location, notes
- **Medical:** Pediatrician, allergies, medications, immunizations, checkup schedule
- **Preferences:** Favorite foods, current interests, comfort items, temperament
- **Friends:** Names, parents' contact info, playdate history
- **Milestones:** Timeline of firsts and achievements

School-level info (calendar, contacts, policies) is in the school file. The child file just has their specific details and a pointer.

### School Files — `family/schools/[school].md`

Shared by all kids at the same school:
- **Calendar:** School year dates, breaks, holidays, recurring events
- **Contacts:** Front office, teachers (per-child), principal, nurse, after-school program
- **Logistics:** Drop-off/pickup, carpool, late policies
- **Policies:** Sick days, snow days, dress code, lunch, communication platform
- **Parent community:** Other parents' contact info

### Partner — `family/partner.md`

Personality, work schedule, preferences, health basics, family relationships, anniversary, date night preferences.

### Extended Family — `family/extended/[person].md`

One file per grandparent, sibling, or key relative: contact info, health notes, relationship with kids, important dates, communication preferences.

### Pets — `family/pets/[pet].md`

Vet info, daily care (food, walks, grooming), boarding/pet sitting contacts, personality notes.

---

## 6. Household Domain

### Vendors — `household/vendors.md`

Every service provider: babysitters (with rates and availability), cleaners, handyman, plumber, electrician, HVAC, pest control, landscaping, snow removal, mechanic, dry cleaner, IT support.

### Home Maintenance — `household/maintenance.md`

Seasonal checklists (spring/summer/fall/winter), appliance inventory with warranties, and a maintenance log.

### Vehicles — `household/vehicles.md`

Per-vehicle: registration, insurance, maintenance schedule (oil, tires, brakes), service history.

### Subscriptions — `household/subscriptions.md`

Every recurring charge organized by category: streaming, productivity, home delivery, fitness, kids, insurance, news. Includes a quarterly audit checklist and totals.

### Insurance — `household/insurance.md`

All policies in one place: health, dental, vision, homeowners, auto, umbrella, life, disability. With policy numbers, coverage limits, deductibles, renewal dates.

---

## 7. Work Domain

### Work Overview — `work/overview.md`

All professional engagements at a glance, weekly priorities, idea inbox (sorted: work / product / content), and a quick wins pool.

### Main Job — `work/main-job.md`

Full-time role: current projects, stakeholders, tools, career context, performance tracking.

### Side Gigs — `work/[engagement].md`

One file per engagement: scope, time commitment, revenue, key people, content pipeline (for creators), knowledge base references.

### Professional Knowledge Base — `work/knowledge-base/[topic].md`

Portable expertise that feeds across engagements:
- Frameworks and mental models
- Key concepts and terminology
- Tools and technologies
- Your perspective and opinions
- "Applied In" section linking to which engagements use this knowledge

This is your intellectual capital. It travels with you between jobs.

---

## 8. Health & Wellness

### Family Medical — `health/family-medical.md`

All providers (primary, specialists, urgent care, ER), per-person health summaries (allergies, medications, immunizations), pharmacy info, and an appointment tracking table.

### Fitness — `health/fitness.md`

Workout routine, gym memberships, current goals, nutrition notes, progress log.

---

## 9. Finances & Wealth

### Budget — `finances/budget.md`

Operating budget with income, fixed costs, discretionary categories, and **rules for the assistant** — spending constraints it can enforce without asking.

### Investments — `finances/investments.md`

Account overview (retirement, taxable, 529, other), advisor contacts, key dates (contribution deadlines), estate planning summary, net worth snapshot.

### Tax Prep — `finances/tax-prep.md`

Annual checklist: document tracking (W-2s, 1099s, deductions), key dates, estimated payments, optimization notes, prior year summary.

---

## 10. Travel

### Profiles — `travel/profiles.md`

Family passports (with expiration tracking), TSA PreCheck / Global Entry, all loyalty programs (airlines, hotels, car rental), credit card travel benefits, family travel preferences, packing checklist.

### Upcoming — `travel/upcoming.md`

Active trip planning: flights, accommodation, car rental, activity reservations, packing status, pre-trip checklist (passports, pet care, house prep, prescriptions). Plus a trip wishlist and past trip reviews.

---

## 11. People & Social

### CRM — `CRM.md`

Relationship tracking with cadence: name, relationship, check-in frequency, last contact, next due, method, notes. With "How This Works" instructions for the assistant.

### Birthdays — `people/birthdays.md`

Dates, gift ideas, celebration preferences.

### Emergency Contacts — `people/emergency-contacts.md`

Print-friendly page: immediate family, emergency services, trusted adults for kids, quick medical reference, key vendor emergency numbers.

### Groceries — `GROCERIES.md`

Store-based lists, preference routing table, store notes, per-store quick lists in `lists/`.

---

## 12. Hobbies

### Per-Hobby Files — `hobbies/[hobby].md`

One file per hobby: schedule, equipment, classes/instruction, community, goals, progress log, budget.

---

## 13. Automation

### Heartbeats — `HEARTBEAT.md`

Periodic checks:
- **Departure reminders** — calendar events + driving ETA
- **CRM nudges** — overdue check-ins
- **Appointments** — medical, maintenance, registration renewals
- **Email triage** — urgent messages
- **Weather** — relevant for outdoor plans

State tracked in `memory/heartbeat-state.json`.

### Tools — `TOOLS.md`

Local tool configs: `gog` (Gmail/Calendar), driving ETA script, audio transcription, saved locations, project paths.

### Scripts — `scripts/`

- `driving-eta.sh` — Real-time driving time via Google Directions API
- [Add your own utility scripts]

### Skills — `skills/`

Packaged capabilities with their own `SKILL.md` and references:
- Travel manager
- Flight tracker
- [Add your own]

---

## 14. Heartbeats vs Cron

### Heartbeats

Batch checks every ~30-60 minutes. Good for:
- Multiple checks that can run together
- Tasks that benefit from conversational context
- Timing that can drift slightly

### Cron

Exact-time scheduling. Good for:
- Precise reminders ("9:00am every Monday")
- Isolated tasks that don't need chat history
- Heavy background tasks
- One-shot reminders

Rule of thumb: batch periodic checks into HEARTBEAT.md. Use cron for precise, standalone tasks.

---

## Target Workspace Layout

```
~/.openclaw/workspace/
├── AGENTS.md                           # Operating system
├── SOUL.md                             # Personality & values
├── IDENTITY.md                         # Name, vibe, emoji
├── USER.md                             # Your human's profile
├── ROLES.md                            # Domain routing (7 domains)
├── MEMORY.md                           # Long-term curated memory
├── HEARTBEAT.md                        # Proactive checks
├── TOOLS.md                            # Tool configs & CLI recipes
├── CRM.md                              # Personal relationships
├── GROCERIES.md                        # Shopping lists & preferences
│
├── family/
│   ├── overview.md                     # Household roster & rhythms
│   ├── partner.md                      # Spouse/partner details
│   ├── kids/
│   │   ├── [child-1].md               # Per-child hub
│   │   └── [child-2].md
│   ├── schools/
│   │   └── [school-name].md           # Shared school info
│   ├── extended/
│   │   ├── [grandparent].md           # Extended family
│   │   └── [sibling].md
│   └── pets/
│       └── [pet-name].md              # Pet care
│
├── household/
│   ├── vendors.md                      # All service providers
│   ├── maintenance.md                  # Home maintenance & appliances
│   ├── vehicles.md                     # Cars & maintenance
│   ├── subscriptions.md                # Recurring services
│   └── insurance.md                    # All policies
│
├── work/
│   ├── overview.md                     # All engagements & priorities
│   ├── main-job.md                     # Full-time role
│   ├── [side-gig].md                   # Per-engagement
│   └── knowledge-base/
│       └── [topic].md                  # Portable expertise
│
├── health/
│   ├── family-medical.md               # Doctors, meds, appointments
│   └── fitness.md                      # Workout routine & goals
│
├── finances/
│   ├── budget.md                       # Operating budget & rules
│   ├── investments.md                  # Accounts & estate planning
│   └── tax-prep.md                     # Annual document checklist
│
├── travel/
│   ├── profiles.md                     # Loyalty, passports, preferences
│   └── upcoming.md                     # Active trip plans
│
├── people/
│   ├── birthdays.md                    # Birthday tracking
│   └── emergency-contacts.md           # Print-friendly emergency page
│
├── hobbies/
│   └── [hobby].md                      # Per-hobby details
│
├── lists/
│   └── groceries-[store].md            # Per-store quick lists
│
├── memory/
│   ├── YYYY-MM-DD.md                   # Daily notes (tagged by domain)
│   └── heartbeat-state.json            # Heartbeat tracking
│
├── scripts/
│   └── driving-eta.sh                  # Driving ETA with traffic
│
└── skills/
    └── [skill-name]/
        └── SKILL.md                    # Packaged capability
```

---

## Quick Start

1. Copy `templates/` into your OpenClaw workspace
2. Start with `BOOTSTRAP.md` — discover your assistant's identity
3. Fill in `USER.md` and `ROLES.md`
4. Add one domain at a time — start with what matters most
5. Wire up `HEARTBEAT.md` and `TOOLS.md` when ready

You don't need everything on day one. Start with foundation + one domain. Add more as life demands.

---

This playbook is meant to evolve. Fork it, tweak it, and adapt it to your own life.
