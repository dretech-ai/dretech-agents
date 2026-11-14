# Coverage check: under-coverage, over-coverage, overlaps

Run this for every review, and for one policy when the user asks about it.
Inputs: `insurance/profile.md`, `insurance/policies.md`, the policy files,
and the sibling files in [finance-link.md](finance-link.md).

Each finding gets:

- **Severity:** `Critical` (a loss that could wipe out a large share of net
  worth or the home), `High` (a five-figure loss left uncovered, or a
  required coverage missing), `Medium` (a real but bounded gap, or
  over-coverage costing $300+/yr), `Low` (housekeeping, small savings).
- **The exposure in dollars:** what a bad day costs the user under the
  current policy, compared with the fix.
- **Not checked:** when a check needs data you don't have (rebuild cost
  without a search, a policy the profile mentions but no document shows,
  a hazard with no search result), don't guess a severity. List it under
  **Not checked** in the review with what's needed to run it.
- **The fix,** with a rough premium effect when you have a sourced figure or
  a quote, and a **Verify before switching:** line when it's high-stakes
  (see SKILL.md).

The rules below are rules of thumb, not law. Where a state rule, lender
requirement, or HOA bylaw applies, it wins: say which and where to check.
Rules marked *search* need a current figure from a search, with source and
as-of date.

## Net worth and emergency fund

Get these first; half the checks depend on them. See
[finance-link.md](finance-link.md) for where they come from.

- **Net worth at risk** = taxable investments and cash (latest ledger
  snapshot) + home equity (estimated value − mortgage balance, per
  property) + other significant assets. Retirement accounts (401(k), IRA)
  have strong federal or state creditor protection in many cases, so size
  limits on net worth at risk **without** them, and say in one line that
  including them would raise the number and that protection varies by
  state and account type. A homestead exemption can protect some or all of
  home equity in some states (*search* the state); mention it, but still
  count the equity unless the user confirms full protection.
- **Future earnings** matter too: a judgment can garnish wages. For a
  household with high income and low assets, liability limits still matter.
- **Emergency fund** = the target in `portfolio/profile.md`, or the
  deductible comfort figure in `insurance/profile.md`.

## Liability and umbrella

| Check | Flag when | Severity |
|-------|-----------|----------|
| Home liability (Coverage E) | below $300,000 | Medium; High if net worth > $500k |
| Auto bodily injury | below 100/300 | High (state minimums are far too low for almost everyone) |
| Auto property damage | below $100,000 | Medium |
| Umbrella | none, and net worth at risk > ~$500k, or any of: teen driver, pool, trampoline, dog with bite history or a restricted breed, rental property, household employee, frequent hosting, public profile | High; Critical if net worth at risk > 2× the largest underlying liability limit (home Coverage E or auto BI per accident) |
| Umbrella limit | below net worth at risk (round up to the next $1M) | High |
| Underlying limits | home or auto liability below the umbrella's required underlying limits | Critical: the umbrella won't drop down, and the user pays the gap |
| Uninsured/underinsured motorist | UM/UIM bodily injury below BI limits, or not carried on the umbrella when available | Medium |
| Rentals | a rental property with no landlord liability, or the umbrella doesn't list it | High |
| Short-term rental | hosting without an STR endorsement or STR policy (homeowners usually excludes business use) | High |
| Watercraft / RV / golf cart | owned but not listed on any policy, or not scheduled on the umbrella | Medium |
| Household employee | nanny, caregiver, or housekeeper with no workers' comp where the state requires it | High |
| Board or volunteer roles | nonprofit board seat without D&O confirmed | Low |

An umbrella is usually the cheapest liability dollar there is (*search* the
user's state for the typical first-$1M premium). When it's missing and the
flags above apply, it goes first in the review.

## Property

| Check | Flag when | Severity |
|-------|-----------|----------|
| Dwelling (Coverage A) vs. rebuild cost | Coverage A < estimated rebuild cost. Rebuild cost = square feet (from `home/` or the user) × local rebuild cost per sq ft (*search*: city or ZIP, construction quality, year). Use the carrier's replacement-cost estimate if a dec page or renewal shows one. | High if 10–20% short; Critical if > 20% short |
| Dwelling far above rebuild cost | Coverage A > 125% of rebuild cost with no stated reason (custom finishes, historic) | Medium (over-insurance) |
| Market value confusion | the user set Coverage A to the purchase price or market value | Explain the difference; land isn't rebuilt |
| Extended / guaranteed replacement cost | none, in a high-cost-growth or disaster-prone area | Medium |
| Roof on ACV or a roof-surfacing schedule | yes | High if the roof is more than ~10 years old (payout drops with age); say what a claim would pay on a roof of that age |
| Ordinance or law | under 10% of Coverage A on a home built before ~1990, or anywhere code changes are steep | Medium |
| Water backup / sump overflow | none, and the home has a basement, a sump pump, or a finished lower level | High |
| Service line | none on an older home with a long buried sewer or water line | Low |
| Personal property (Coverage C) | on ACV instead of replacement cost | Medium |
| Loss of use (Coverage D) | below ~12 months of local rent for a comparable home | Medium |
| Special limits | jewelry, watches, firearms, collectibles, or instruments over the sublimit (often $1,500–$2,500 theft) and not scheduled | Medium; High if a single item > $10,000 |
| Condo (HO-6) walls-in | Coverage A below what it would cost to redo the interior the master policy excludes (read the HOA master policy type: bare walls, single entity, all-in) | High |
| Condo loss assessment | below the HOA master policy's deductible (often $25k+) | Medium |
| Renters | no renters policy (cheap liability plus contents) | Medium |
| Vacant or vacation home | vacant 30–60+ days with no vacancy permit (many policies cut coverage after that) | High |
| Lender requirement | coverage below the mortgage's required amount, or flood required and missing | Critical |

## Natural hazards

- **Flood:** Standard homeowners policies exclude flood. Look up the flood
  zone (FEMA Flood Map Service Center by address — tell the user to run it;
  don't send their address). In a high-risk zone (A or V) without flood
  coverage: Critical, and usually mortgage-required. In a moderate- or
  low-risk zone: Medium if the home is near water, low-lying, has a
  basement, or the region floods from heavy rain; mention that a big share of
  flood claims come from outside high-risk zones, and that NFIP has a
  30-day waiting period (*search* for private flood availability in the
  state).
- **Earthquake:** excluded from standard policies. In a high-hazard region
  (*search* USGS hazard maps for the state), no earthquake coverage is
  Medium to High depending on how much of net worth is the house. Show the
  deductible in dollars: a 15% deductible on a $600k dwelling is $90,000.
- **Wind / hurricane / hail:** a percentage deductible (1–5% of Coverage A)
  must be shown in dollars. If it's larger than the emergency fund: High.
  Coastal states may have a separate wind pool policy; confirm it exists.
- **Wildfire:** in a high-risk area, check the carrier hasn't non-renewed,
  and whether the state FAIR plan plus a difference-in-conditions policy is
  the realistic option (*search*).
- **No search available:** list flood, earthquake, and wildfire under **Not
  checked**, and ask the user for their flood zone and whether they're in a
  known earthquake or wildfire area.

## Auto

| Check | Flag when | Severity |
|-------|-----------|----------|
| Collision and comprehensive on an old car | annual collision + comprehensive premium > 10% of the car's value, or the car is worth less than ~2× the emergency fund and is paid off | Medium (over-insurance) |
| Deductibles | $250 or lower when the emergency fund could cover $1,000 | Low to Medium (over-insurance) |
| Gap / loan-lease payoff | financed or leased with a loan balance above the car's value and no gap coverage | Medium |
| Gap still carried | loan balance now below the car's value | Low (over-insurance: drop it) |
| Rental reimbursement | none and the household has only one car per driver | Low |
| Rideshare / delivery driving | driving for an app without a rideshare endorsement | High |
| Teen driver | not listed, or listed on the wrong car (the cheapest car usually costs least) | Medium |
| Drivers who've moved out | still on the policy | Low (over-insurance) |
| Medical payments / PIP | high limits that duplicate good health insurance in a state that doesn't require PIP | Low (consider lowering it; in no-fault states PIP is required) |

## Life

- **Need** (DIME method): Debt (non-mortgage) + Income replacement (years
  until the youngest child is independent or the surviving spouse retires ×
  the income that stops, net of survivor Social Security if you have a
  figure) + Mortgage payoff + Education goals. Subtract liquid assets
  earmarked for these (from `portfolio/` if present) and existing coverage.
  A simpler cross-check: 10–12× the insured's income for a young family.
- **Under-insured:** need minus coverage > 25% of need: High. A stay-at-home
  parent with no coverage: High (replacement childcare and household costs
  are real).
- **Group life only:** if most of the coverage is through an employer, it
  usually ends or reprices when the job ends. High if a job change or
  retirement is likely and the user's health might make new coverage
  expensive.
- **Over-insured:** no dependents, no debts others would inherit, and the
  estate is liquid enough. Term life past that point is over-insurance:
  Medium.
- **Term ends too early:** the level period ends before the youngest child
  is independent or the mortgage is paid: Medium. Check the conversion
  deadline.
- **Permanent life (whole, UL, IUL, VUL):** not wrong by default (estate
  liquidity, special-needs dependents, business continuation), but flag it
  for review when the main need is income replacement: compare its premium to
  term for the same death benefit. For UL/IUL, flag when the illustration
  shows a lapse before life expectancy at current or guaranteed rates, or a
  policy loan is eating the cash value: High. Never recommend surrender
  without the **Verify before switching** line and a hand-off to the
  portfolio advisor for the tax.
- **Accidental death, mortgage life, credit life:** pay only on narrow
  events; usually over-insurance next to adequate term: Low to Medium.

## Disability

- **Need:** about 60–70% of gross income (which is close to take-home pay
  when the benefit is tax-free) until retirement age.
- **No long-term disability coverage** for an earner whose income the
  household depends on: High. For many working-age people, disability is
  more likely than death before retirement.
- **Group LTD gaps:** benefit capped at a monthly maximum below 60% of the
  earner's income (common for higher earners); benefits taxable because the
  employer pays the premium; any-occupation definition after 24 months;
  bonus or commission income not covered. Each is Medium; together High.
  Supplemental individual coverage fills them.
- **Elimination period** longer than the emergency fund lasts: Medium.
- **Self-employed with no disability coverage:** High.
- **Over-insured:** retired or financially independent (portfolio could
  replace the income): drop it.

## Health

- **Out-of-pocket max** above the emergency fund: Medium (High for a family
  with known recurring care).
- **HDHP without funding the HSA:** Low (it's a missed tax break, hand off to
  the portfolio advisor for contribution limits).
- **Plan fit:** compare total expected cost (12 × premium + expected
  out-of-pocket) across the options the user has at open enrollment, not the
  premium alone. If the user's expected use is high, a lower deductible plan
  may be cheaper overall.
- **Network:** doctors or hospitals the user named are out of network:
  Medium.
- **ACA subsidies:** income near a premium tax credit cliff or phase-out
  (*search*, or read `portfolio/tax-figures.md`): hand off to the portfolio
  advisor for MAGI planning. Don't compute the tax here.
- **Duplicate coverage:** both spouses on two employer plans with family
  coverage: check whether one family plan plus an HSA is cheaper.
- **Gap at 26 or at a job change:** children aging off a parent's plan,
  COBRA vs. marketplace.

## Medicare

- **Turning 65 within 12 months:** time-sensitive. Explain the Initial
  Enrollment Period and late-enrollment penalties for Part B and Part D
  (*search* for current figures). If still covered by an employer plan, ask
  whether the employer has 20+ employees (affects whether delaying Part B is
  safe).
- **Medigap open enrollment:** the 6-month window starting when the person
  is 65+ and enrolled in Part B is the one time Medigap must accept them
  without medical underwriting (some states give more rights; *search* the
  state). Missing it is irreversible in most states: High.
- **Medicare Advantage vs. Original + Medigap:** Advantage often has lower
  premiums but a network and an annual out-of-pocket max; Medigap costs more
  per month but has wide access and little out-of-pocket. Leaving Advantage
  for Medigap later can require underwriting. Say this plainly before any
  switch.
- **Annual check (AEP, Oct 15 – Dec 7):** compare the Annual Notice of
  Change: premium, MOOP, drug formulary and tiers for the user's
  prescriptions, network changes. Part D plans change every year.
- **IRMAA:** if `portfolio/tax-figures.md` has IRMAA tiers and income is
  within ~10% of a tier, note it and hand off to the portfolio advisor. A
  life-changing event (retirement, death of a spouse) can justify an appeal
  with Form SSA-44.
- **Medigap rating:** attained-age policies get more expensive every year;
  community- or issue-age-rated ones don't for age. Flag attained-age
  pricing at renewal.

## Long-term care

- **Window:** coverage is cheapest and easiest to qualify for in the
  mid-50s to mid-60s. If the user is in or near that window and hasn't
  decided, raise it once: Medium.
- **Need depends on assets:** very high net worth can self-insure; low
  assets may lead to Medicaid; the middle has the most to lose. Show the
  current cost of care in their state (*search*) next to their assets.
- **Existing traditional LTC:** note every rate increase (they aren't
  guaranteed) and the carrier's offered reduced-benefit options. Don't
  recommend dropping it without the **Verify before switching** line:
  re-qualifying may be impossible.
- **Inflation protection** missing on a policy bought before 70: Medium.

## Specialty lines

- **Scheduled valuables:** each item over the homeowners sublimit,
  appraisal more than ~5 years old (values change): Low to Medium.
- **Pet:** compare the annual premium plus the deductible and co-pay to the
  emergency fund. Many households can self-insure; flag Low over-insurance
  if the emergency fund easily covers a $5,000–$10,000 vet bill, unless the
  user wants it for peace of mind.
- **Travel:** ask whether the user's credit cards include trip
  cancellation, interruption, rental-car collision, and baggage coverage
  (don't read `travel/`). Annual travel medical coverage matters for travel
  outside the US when the health plan or Medicare doesn't cover abroad.
- **Boat / RV / motorcycle:** liability limits match auto, the umbrella
  lists them, and the stated value is current.

## Over-coverage and overlaps (look for every one)

- Deductibles so low the premium difference buys back the extra deductible in
  a few years (see the break-even in [price-analysis.md](price-analysis.md)).
- Collision and comprehensive on cars worth little.
- Rental-car collision bought at the counter when the user's auto policy or
  card covers it; trip insurance that duplicates a card benefit.
- Accidental death and dismemberment, mortgage life, credit life, credit
  disability, cancer or dread-disease, hospital indemnity: narrow policies
  that usually duplicate adequate term life, disability, and health coverage.
- Extended warranties and home warranties: compare the annual cost to the
  emergency fund and the age of the covered items (home-improvement's
  `systems.md` has the ages).
- Life insurance with no one depending on it; disability insurance after
  financial independence.
- Two policies covering the same thing (two health plans, two umbrellas, a
  scheduled item on both homeowners and a separate valuables policy).
- Gap coverage on a car now worth more than the loan.
- Drivers, vehicles, or properties no longer in the household still on a
  policy.

## Output

A table, most severe first:

| # | Severity | Policy / area | Finding | Exposure today | Fix | Premium effect (source) |
|---|----------|---------------|---------|----------------|-----|-------------------------|

Then one line each for **Fine** areas so the user sees what was checked.
