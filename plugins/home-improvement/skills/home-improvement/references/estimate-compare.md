# Comparing estimates

Run this whenever a project has one or more bids. The goal is to compare the
same scope at the same quality, then judge price, risk, and terms.

## 1. Normalize

Build one table with a column per bid and a row per scope item. Use the most
detailed bid as the row list and fill the rest:

| Scope item | Bid A | Bid B | Bid C | Note |
|------------|-------|-------|-------|------|
| Tear-off / demo | | | | |
| Materials (brand / grade) | | | | |
| Labor | | | | |
| Permits & inspections | | | | |
| Disposal / dumpster | | | | |
| Allowances | | | | |
| Contingency | | | | |
| **Total as quoted** | | | | |
| Missing items (est.) | | | | |
| **Adjusted total** | | | | |

- **Missing items:** when a bid excludes something another bid includes, mark
  it `not included` and add an estimate (from the other bids or a sourced
  range) to that bid's **adjusted total**. Say where the estimate came from.
- **Allowances:** an allowance ("$3,000 for tile") is a placeholder, not a
  price. Compare each allowance with what the user actually wants; if it's
  low, raise it in the adjusted total and say so. Low allowances are the most
  common way a cheap bid becomes an expensive job.
- **Materials:** note brand, model, and grade (shingle line, SEER2 rating,
  window series). A cheaper bid on a lower grade is not the same job; say
  what the upgrade is worth, or ask the user if it matters.
- **Unit price** where it applies: per square (roofing), per sq ft
  (flooring, siding), per linear ft (gutters, fence), per ton (HVAC). Compare
  with a sourced local range.

## 2. Terms and risk

| Check | Bid A | Bid B | Bid C |
|-------|-------|-------|-------|
| License (state lookup link) | | | |
| Insurance stated (GL / workers' comp) | | | |
| Deposit % | | | |
| Payment schedule tied to milestones? | | | |
| Who pulls the permit | | | |
| Start / duration | | | |
| Labor warranty | | | |
| Manufacturer warranty registered by contractor? | | | |
| Change-order process in writing? | | | |
| Price escalation clause | | | |
| Quote expires | | | |

## 3. Red flags (call out every one, bluntly)

- Deposit above the state's legal cap (several states cap home-improvement
  deposits — search the user's state) or above one-third of the total.
- Cash-only, or payment to an individual instead of the business.
- No permit, or "the homeowner pulls the permit" on work that needs a
  licensed contractor.
- No license number, or a license that doesn't match the trade.
- A bid more than 25% below the others — usually missing scope, lower grade,
  or uninsured labor.
- Final payment due before completion or before final inspection.
- Open-ended time-and-materials with no cap.
- Pressure tactics: "price good today only", storm-chaser roofers after a
  weather event.
- Escalation clauses with no ceiling.

## 4. Recommend

- **One bid**, with the reason in one or two lines (adjusted total, scope,
  warranty, risk). At most **one alternative** and the tradeoff. Everything
  else under "other bids."
- **Questions to ask before signing**, per recommended bid: missing scope,
  allowance amounts, permit, warranty registration, start date, payment
  schedule changes.
- **Negotiation points:** deposit down to the state cap or 10%, payments tied
  to milestones, final payment after final inspection, written change orders,
  lien waivers with each payment.

## Only one bid

Compare it against a searched local cost range (with source and as-of date)
and say whether it's low, in range, or high. Recommend getting two more bids
for anything over a few thousand dollars, and say what to ask each
contractor so the bids come back comparable (same scope list, same material
grade, itemized).

## No bids yet

Give a sourced cost range, the scope list to send to contractors, the trade
to look for, and how many bids to get. Set the project status to
`estimating`.
