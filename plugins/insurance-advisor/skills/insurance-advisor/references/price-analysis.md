# Price analysis and quote comparison

Run this for every review and whenever a renewal notice or quote is
imported. The question is whether the user is paying a fair price for the
coverage they need, not whether a cheaper policy exists. A cheaper quote with
lower limits is not a better price.

## 1. Premium history

From each policy file's premium history table:

| Policy | Prior term premium | Current premium | Change $ | Change % | Carrier's stated reason | Years with carrier | Last shopped |
|--------|--------------------|-----------------|----------|----------|-------------------------|--------------------|--------------|

- Convert six-month auto terms to annual.
- A change with no change in coverage, vehicles, drivers, or claims is a
  **rate** change. A change that also follows a coverage change (a higher
  Coverage A from inflation guard, a new driver) needs the coverage change
  priced out separately before calling it a rate increase.
- Flag a rate increase of 10% or more, or two consecutive increases above the
  state's average rate change for that line (*search* the state insurance
  department's rate filings or recent news for the line and state, with
  as-of date).

## 2. Cost per unit of coverage

A rough fairness check, not a quote:

- **Home:** annual premium per $1,000 of Coverage A. Compare to a sourced
  state average (*search*: "average homeowners premium <state> <year>"),
  scaled to the user's Coverage A. Note that roof age, claims, credit-based
  insurance score (in states that allow it), construction, and distance to
  the coast change this a lot; a figure 30%+ above average is a reason to
  shop, not proof of overpaying.
- **Auto:** annual premium per vehicle, and per vehicle at the user's
  limits. Compare to a sourced state average for full coverage. Teen drivers
  and recent claims or tickets explain a lot of difference; account for them
  before calling the premium high.
- **Umbrella:** premium for the first $1M and each additional $1M. Compare
  to a sourced range.
- **Term life:** premium per $100,000 of face amount, compared with a current
  quote for the same term length, age, and health class (*search* or a quote
  the user gets). Older policies bought at a younger age are often cheap;
  don't replace them just because a new quote looks similar.
- **Health:** total expected annual cost (12 × premium + expected
  out-of-pocket) across the options available at open enrollment.

Every benchmark gets a source and an as-of date. If you can't find one,
say the benchmark is missing; don't estimate it.

## 3. Deductible break-even

For each deductible option the user has (from the dec page, a renewal offer,
or a quote):

```
Annual premium saved ÷ Added deductible = share of the extra risk recovered per year
Added deductible ÷ Annual premium saved = years without a claim to break even
```

- Break-even under ~4 years, and the higher deductible is within the
  emergency fund: recommend the higher deductible.
- Break-even over ~7 years: the higher deductible isn't worth much; keep
  the current one unless cash flow matters more.
- In between: the user's call; show the numbers.
- Never recommend a deductible above the emergency fund. A percentage wind or
  hurricane deductible counts in dollars.
- Small claims can raise premiums and count against the user on a claims
  history database for years. A claim just above a low deductible often
  isn't worth filing, which makes the low deductible mostly wasted premium.
  Say so.

## 4. Bundle math

- Bundle discount = (home premium unbundled + auto premium unbundled) −
  bundled total. Get the carrier's unbundled prices or the discount line
  from the dec page.
- Compare the bundled total with the **best unbundled pair** from quotes:
  best home quote + best auto quote at the same limits. A bundle that costs
  more than the best unbundled pair isn't a discount.
- Umbrella carriers usually require the underlying home and auto with them
  or with approved carriers. Check before unbundling.

## 5. Discount checklist

Check each one against the dec pages and say which ones are missing and
plausible (the user confirms eligibility):

- Multi-policy (home + auto + umbrella), multi-car
- Claims-free, accident-free, good driver, defensive driving course
- Telematics or usage-based (and whether the user is comfortable with
  driving data being collected)
- Low mileage (remote work, retired)
- Good student, student away at school without a car
- Paid in full, autopay, paperless (and installment fees avoided)
- New roof, impact-resistant roof (Class 4), wind mitigation inspection
  (coastal states), fortified roof certification; read the roof install year
  from `home/` systems.md
- Updated electrical, plumbing, HVAC (read from `home/` systems.md)
- Monitored alarm, water-leak shutoff, smart smoke detectors
- Gated community, sprinklers, distance to fire hydrant/station
- Affinity or employer group discounts, professional associations, military
- Loyalty discount (often smaller than the renewal creep it hides)

## 6. Quote comparison

Run when a policy has one or more quotes in its `## Quotes` section. Build
one table, a column per option (current policy first), a row per coverage:

| Coverage | Current | Quote A | Quote B | Note |
|----------|---------|---------|---------|------|
| Limit / deductible rows for this line | | | | |
| Endorsements (water backup, ordinance & law, UM/UIM, rental, gap) | | | | |
| Roof / contents settlement (RC vs. ACV) | | | | |
| **Annual premium as quoted** | | | | |
| Coverage differences priced (est.) | | | | |
| **Adjusted annual premium** | | | | |
| Fees (installment, policy fee) | | | | |
| Carrier financial rating (AM Best, as of) | | | | |
| Complaint index (state DOI or NAIC, as of) | | | | |
| Quote expires | | | | |

- **Normalize:** when a quote has lower limits, a higher deductible, or a
  missing endorsement, note it and price the difference if the quote or
  another quote shows the cost; otherwise mark it `not priced — ask` and
  don't call the quote cheaper.
- **Red flags:** a quote that switches the roof to ACV, drops water backup,
  uses a percentage wind deductible, cuts liability, or carries a much lower
  Coverage A than the current policy. Cheap often means less coverage.
- **Carrier quality:** search the AM Best rating and the state's complaint
  ratio for each carrier, with as-of dates. A carrier rated below A- or with
  a complaint ratio well above the state average is a reason to pay more
  elsewhere.
- **Recommend one option**, with at most one alternative and the tradeoff.
- **Switching steps, in order:** confirm quote details in writing, check the
  mortgage lender's requirements (the lender needs the new dec page), bind
  the new policy with an effective date on or before the old one ends, then
  cancel the old one in writing and confirm the prorated refund. Never the
  other way round. Add the **Verify before switching:** line.

## 7. Total cost of insurance

Sum annual premiums across all policies in `policies.md`, by line. If
`portfolio/profile.md` has annual spend, show the total as a share of it.
Rough healthy ranges vary too much by state and household to judge the total
alone; use it to show where the money goes and which line has the most
room.
