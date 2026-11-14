# When to shop: triggers and the renewal calendar

Run this for every review and for `/insurance-advisor:renewals`. The output
is a shop decision per policy and the renewal and shop calendar in
`insurance/policies.md`.

## Shop now (before the next renewal)

- **Non-renewal or cancellation notice.** The effective date is a hard
  deadline. Start immediately; in hard markets (coastal, wildfire), it can
  take weeks to place coverage. Mention the state FAIR plan or residual
  market as a last resort and *search* the state's rules.
- **Renewal increase of 15% or more** with no change in coverage, drivers,
  vehicles, or claims.
- **A coverage was cut at renewal** (roof moved to ACV, a new percentage
  deductible, a sublimit lowered, water backup removed).
- **A gap from the coverage check** that the current carrier can't or won't
  fix (no umbrella offered, won't write flood, won't insure the dog).
- **Carrier downgrade** below A- (AM Best) or news that the carrier is
  leaving the state.

## Shop at the next renewal

- Renewal increase of 10–15%.
- **Three or more years** since the policy was last shopped (the
  `Last shopped` column).
- **A claim or violation is about to age off** (most claims stay on
  carriers' records for about 5 years; tickets and accidents for 3–5 years,
  depending on the carrier and state). Shop the renewal after it ages off.
- **Credit improved** a lot, in a state that allows credit-based insurance
  scores (*search* whether the user's state allows it for home and auto).

## Life events (shop or re-check within 30 days of the event)

| Event | What to re-check |
|-------|------------------|
| Move to a new state or ZIP | All P&C lines; health networks; umbrella underlying requirements |
| Marriage or divorce | Combine or split auto, home, umbrella; beneficiaries on life and retirement accounts (beneficiaries go to the portfolio advisor) |
| New child | Life and disability need; health plan (30–60-day special enrollment) |
| Teen starts driving | Auto (which car, good-student discount), umbrella |
| Child moves out or off to college | Remove drivers or add the student-away discount; renters for the student |
| New job, job loss, self-employment | Group life and disability end or change; health (COBRA vs. marketplace) |
| Retirement | Group life and disability end; health until 65; Medicare at 65; auto mileage drops |
| Turning 65 | Medicare enrollment and the Medigap open-enrollment window (see [coverage-check.md](coverage-check.md)) |
| Car paid off, or car gets old | Drop gap; reconsider collision and comprehensive |
| Mortgage paid off | Lender requirements end (flood may still be wise); coverage choices are now entirely the user's |
| New roof, rewiring, new plumbing or HVAC (from `home/` systems.md or the user) | Ask for roof, update, and mitigation discounts; shop if the carrier won't re-rate |
| Renovation adds square feet or value | Raise Coverage A; tell the carrier before work starts (some policies need notice for major renovations) |
| Start hosting short-term rentals, buy a rental, hire a nanny, add a pool or trampoline, get a dog | Liability, umbrella, endorsements |
| Buy jewelry, art, or collectibles above the sublimit | Schedule them |
| Big jump in net worth (inheritance, business sale, equity vesting) | Umbrella limit |

## Timing

- **Home, auto, umbrella:** start 30–45 days before renewal. Some carriers
  price better when you shop ahead of the effective date than at the last
  minute. Insurers send renewal offers 30–60 days before renewal (*search* the
  state's notice rules if the user wants more warning).
- **Shop home and auto together** when they're bundled, and price the
  unbundled pair too ([price-analysis.md](price-analysis.md)).
- **Life:** premiums are set by age band and health. Lock in term coverage
  before a birthday that moves the age band and before a known health event
  (new diagnosis, starting a medication). Never let an existing policy lapse
  while shopping.
- **Health (employer):** the employer's open-enrollment window, usually in
  the fall. **ACA marketplace:** open enrollment is in the fall and winter
  (*search* the current dates and the user's state exchange, since some
  states run longer windows). Special enrollment periods follow qualifying
  life events.
- **Medicare:** Annual Enrollment Period October 15 – December 7 (Part D
  and Advantage changes, effective January 1). Medicare Advantage Open
  Enrollment January 1 – March 31 (one switch for people already in
  Advantage). Medigap can be shopped any time, but outside guaranteed-issue
  windows it's underwritten.
- **LTC:** no window, but the price and approval odds change with age and
  health. Decide by the mid-60s.

## How to shop

- **Captive agent** (one carrier): good for that carrier's options only.
- **Independent agent or broker:** several carriers in one go; best default
  for home, auto, and umbrella, and for hard-to-place risks.
- **Direct online:** fast for simple auto and renters; get at least one
  agent quote too.
- **Life and disability:** an independent broker who works with many
  carriers, and term quotes from at least three carriers. For disability,
  check the occupation class and own-occ definition, not only price.
- **Medicare:** the Medicare.gov plan finder for Part D and Advantage, and
  the state's SHIP counseling program for free, unbiased help (*search* the
  user's state SHIP).
- **How many quotes:** at least three for home and auto, at the **same limits
  and deductibles** as the target coverage from the coverage check, not the
  current policy if it has gaps. Give the user a one-paragraph spec to hand to
  every agent: limits, deductibles, endorsements, drivers, vehicles,
  property facts (nickname, year built, square feet, roof age and material),
  and claims history.

## Output

Per policy, one decision: **Shop now**, **Shop at renewal (shop-by
YYYY-MM-DD)**, **Re-check after <event>**, or **Hold** (shopped recently,
price fair, coverage right). Then update the calendar in
`insurance/policies.md`:

| Policy | Renews | Decision | Shop by | Why |
|--------|--------|----------|---------|-----|

Shop-by date = renewal date − 45 days (or the event date + 30 days). If that
date has already passed, the decision is **Shop now** and the shop-by date
is "as soon as possible, before <renewal date>". A policy can also be
switched mid-term (the old carrier refunds the unused premium, sometimes
minus a fee); say so when a renewal has already taken effect. Offer
to queue the shop-by dates as Google Tasks
([comms-handoff.md](comms-handoff.md)).
