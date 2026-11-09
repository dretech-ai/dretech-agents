# First-session bootstrap interview

Run this when `home/profile.md` is missing or still has placeholders. Ask in
batches, not one question at a time. Accept rough answers ("roof is maybe 15
years old") — precision can come later. If the user has a home inspection
report, take it first: it answers most of Batch 3.

## Disclosure (say this first, once)

> Before we start: this is a planning tool, not a contractor or inspector, and
> it never hires, signs, or pays anyone. Prices, rebates, and permit rules
> change and vary by location, so verify every number with the contractor,
> your permit office, or your utility before you sign. The tax notes are
> general rules, not tax advice. Your files stay in this folder, but anything
> I read, including your estimates and inspection reports, is sent to the AI
> provider you're using (Anthropic for Claude, OpenAI for ChatGPT/Codex) under
> your account's data terms. Web searches contain only the project type and
> your city or ZIP, never your name or address. `home/archive/` keeps your
> original documents unredacted, addresses and account numbers included, so
> keep this folder private and out of any public repo or shared cloud drive.

Then continue with the questions.

## Batch 1 — the household

- **Properties:** for each one, a short nickname ("main house", "lake
  cabin", "Elm St rental"), **city, state, and ZIP** (no street address), and
  its **use**: primary, rental, or vacation/second home.
- **How long you've owned it** and **how long you plan to stay** (or hold, for
  a rental). This drives how much resale value counts.
- **DIY appetite:** none, small jobs (paint, fixtures), or bigger (tile,
  flooring, decks). Note any trades you're licensed in.
- **Default project budget,** or "use my finances to decide" (if `portfolio/`
  exists).
- **Known projects:** anything already on your mind — needs and wants both.
  These seed the backlog.

## Batch 2 — each property

- Year built, square feet, beds/baths, stories, foundation (slab, crawl,
  basement), lot notes (slope, drainage, trees over the roof).
- **Mortgage and HELOC:** lender name, balance, rate, and payment — no loan
  numbers. Whether a HELOC is open and its available line (recorded as a fact;
  the planner doesn't recommend borrowing).
- **Insurance:** carrier, deductible (and wind/hail deductible if separate),
  roof age requirements if the carrier has mentioned any.
- **HOA:** whether one exists, architectural-approval rules, and any special
  assessments.
- Rentals: tenant-occupied or not, and lease end (affects scheduling).

## Batch 3 — systems

For each, ask the **install year** (or "original to the house"), **condition**
(good / fair / poor / failing), and anything notable. Offer the shortcut:
*"Drop your inspection report in `home/inbox/` and I'll pull these from it."*

- Roof (material), gutters
- HVAC: furnace / heat pump, AC, ductwork; fuel type
- Water heater (tank / tankless, fuel)
- Electrical: panel amperage and brand (flag Federal Pacific, Zinsco, fuses),
  wiring type (flag knob-and-tube, aluminum branch circuits)
- Plumbing: supply (copper, PEX, galvanized, polybutylene), drain/sewer line
  material, water source (municipal / well), sewer vs. septic
- Windows, exterior doors, siding/paint
- Foundation and drainage: cracks, water in basement/crawl, sump pump
- Major appliances (age only)
- Decks, driveway, fences, pool if any
- Safety: smoke/CO detectors, radon test, GFCI/AFCI, egress

## Then

1. Write `home/profile.md`, and for each property create
   `home/properties/<slug>/` with `property.md`, `systems.md`, and `basis.md`
   (templates in `../templates/`). Slugs are short, lowercase, hyphenated
   nicknames (`main-house`, `elm-rental`).
2. Fill `systems.md`: for each system, expected life and replace-by year from
   a search for current figures or, failing that,
   [lifecycle-data.md](lifecycle-data.md), and an estimated replacement cost
   range with source and as-of date. Build the **replacement forecast** table
   (next 5 years).
3. Ask whether they have records of past improvements (purchase price, past
   remodels, roof/HVAC invoices) for `basis.md`; say why it matters (see
   [finance-link.md](finance-link.md)). Invoices can go in `home/inbox/`.
4. Seed `home/backlog.md` with the known projects and any system at or past
   end of life, scored per [need-want.md](need-want.md).
5. Anything in `home/inbox/` goes through [import.md](import.md).
6. Lead the summary with systems at or past end of life and any "Need now"
   item.
7. If `portfolio/profile.md` exists, say you'll check each project against
   it. If not, mention that the portfolio advisor adds a cash and
   emergency-fund check, and use the default budget meanwhile.
