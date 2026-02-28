# ROLES.md - Domain Routing

> One assistant, multiple life domains. Route to the right context automatically.

---

## 1. Family & Home

**Triggers:** Kids, partner, school, family events, weekends, holidays, parents, in-laws, pets, babysitter, playdate

**Scope**

- Kids: school schedules, activities, camps, medical, friends, milestones
- Partner: schedule coordination, date nights, shared decisions
- Extended family: visits, birthdays, holidays, communication
- Pets: vet, food, boarding, daily care
- Family calendar and departure reminders
- Family travel planning

**Files to Load**

- `family/overview.md` — household structure and rhythms
- `family/kids/[child].md` — per-child details
- `family/schools/[school].md` — shared school info (calendar, contacts, policies)
- `family/partner.md` — partner context
- `family/extended/[person].md` — grandparents, siblings, etc.
- `family/pets/[pet].md` — pet care
- `CRM.md` — personal relationships (filter to non-work)
- `people/birthdays.md` — birthday reminders
- `GROCERIES.md` — shopping lists
- `travel/upcoming.md` — family trips

---

## 2. Household & Operations

**Triggers:** House, maintenance, repair, vendor, plumber, cleaner, insurance, car, subscription, bills, budget

**Scope**

- Home maintenance schedule and repairs
- Vendor management (babysitters, cleaners, contractors)
- Vehicles: maintenance, registration, insurance
- Subscriptions: tracking, auditing, canceling
- Insurance: policies, claims, renewals
- Budget and spending decisions

**Files to Load**

- `household/vendors.md` — all service providers
- `household/maintenance.md` — seasonal schedule, appliances, repair log
- `household/vehicles.md` — cars, maintenance, registration
- `household/subscriptions.md` — recurring services
- `household/insurance.md` — all policies
- `finances/budget.md` — spending rules and constraints

---

## 3. Work & Professional

**Triggers:** Work, job, project, meeting, colleague, side gig, freelance, consulting, career, resume, professional development

**Scope**

- Main job: projects, stakeholders, meetings, deliverables
- Side gigs / consulting: client work, invoicing, deliverables
- Side projects / creator: content pipeline, publishing, audience
- Professional knowledge base: frameworks, expertise, industry knowledge
- Career development: growth areas, networking, skill building
- Weekly planning and review

**Files to Load**

- `work/overview.md` — all engagements at a glance, weekly priorities
- `work/main-job.md` — full-time role details
- `work/[side-gig].md` — per-engagement details
- `work/knowledge-base/[topic].md` — portable expertise (loaded when domain knowledge is needed)
- `CRM.md` — professional relationships (filter to work)

---

## 4. Health & Wellness

**Triggers:** Doctor, appointment, medication, sick, allergy, gym, workout, fitness, diet, weight, mental health

**Scope**

- Family medical info: doctors, allergies, medications, appointments
- Fitness: routine, goals, tracking
- Hobbies that overlap with wellness

**Files to Load**

- `health/family-medical.md` — providers, per-person health, pharmacy, appointment schedule
- `health/fitness.md` — workout routine, goals, progress
- `household/insurance.md` — health insurance details (when needed)

---

## 5. Finances & Wealth

**Triggers:** Money, budget, investment, tax, 401k, IRA, net worth, estate, will, advisor

**Scope**

- Day-to-day budget and spending authority
- Investment accounts and wealth management
- Tax preparation and document tracking
- Estate planning reminders

**Files to Load**

- `finances/budget.md` — operating budget and assistant rules
- `finances/investments.md` — accounts, advisors, estate planning
- `finances/tax-prep.md` — document checklist, deadlines
- `household/insurance.md` — when insurance questions arise

---

## 6. Travel

**Triggers:** Trip, vacation, flight, hotel, passport, airport, packing, travel

**Scope**

- Trip planning and booking
- Loyalty programs and travel documents
- Packing and pre-trip checklists
- Post-trip reviews

**Files to Load**

- `travel/upcoming.md` — active trips and bookings
- `travel/profiles.md` — loyalty numbers, passports, preferences
- `finances/budget.md` — travel budget allocation

---

## 7. Hobbies & Personal

**Triggers:** [Hobby names], fun, class, lesson, practice, club, personal project

**Scope**

- Activity schedules, equipment, instruction
- Goals and progress tracking
- Community and social connections

**Files to Load**

- `hobbies/[hobby].md` — per-hobby details

---

## How I Route Requests

You talk to **one assistant**. I pick the right domain based on what you say:

1. **Keywords** — I match trigger words to domains (see lists above)
2. **Context** — If we've been talking about work, a follow-up stays in work mode unless you shift
3. **Ambiguous** — I'll ask, or offer perspectives from multiple domains
4. **Cross-domain** — Some things touch multiple domains (e.g., "book a babysitter for our trip" → household + travel). I load files from both.

## Loading Strategy

I don't load everything at once. That would waste tokens.

- **Always loaded:** SOUL.md, USER.md, daily memory
- **Loaded on session start (main session):** MEMORY.md
- **Loaded on demand:** Domain files, based on what you're talking about
- **Cross-referenced:** When one file points to another (→ syntax), I follow the reference

---

## Future Extensions

As life gets more complex, you can add domains:

- **Education** — If you're in school or getting a certification
- **Volunteering / Community** — Board memberships, PTA, charity work
- **Real estate** — If managing rental properties
- **Elder care** — Managing care for aging parents

For now, keep to the domains you actively use. You can always add more.
