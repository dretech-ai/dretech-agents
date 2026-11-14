# Finance link: portfolio and home files

The liability, deductible, life, LTC, and dwelling checks need numbers the
sibling agents already keep. When the user also uses the portfolio advisor
or the home improvement planner, their files are in the same folder; use
them, read-only.

## What to read from `portfolio/` (read-only)

- `portfolio/profile.md`: **Age / birth year** (Medicare, LTC, life age
  bands), **Target retirement year** (how long disability and life coverage
  must last), **Current household income** (life and disability need),
  **Filing status** and **State of residence**, **Emergency fund target**
  (deductible ceiling), **Expected annual retirement spend** (proxy for
  annual spend), and **Known upcoming cash events**.
- `portfolio/ledger.md`: the latest snapshot's **total investable assets**,
  the split between taxable and retirement accounts, and **cash and
  cash-equivalent holdings**, with the snapshot date.
- `portfolio/tax-figures.md`: Medicare Part B premium and **IRMAA** tiers,
  and any ACA premium-tax-credit figures it holds. If a figure isn't there,
  search for it; don't edit `tax-figures.md`.

If the ledger snapshot is more than 90 days old, say the checks use stale
numbers.

## What to read from `home/` (read-only)

- `home/profile.md`: the property list (slug, nickname, city/state/ZIP,
  use, plan-to-stay).
- `home/properties/<slug>/property.md`: year built, square feet, stories,
  foundation, use (primary / rental / vacation), mortgage balance (for home
  equity), insurance carrier and deductible as the planner recorded them,
  HOA, rental occupancy.
- `home/properties/<slug>/systems.md`: roof material and install year,
  electrical panel type, supply plumbing material, water heater and HVAC
  ages, sump pump, and anything flagged at or past end of life. Carriers
  price and sometimes refuse these (old roofs, Federal Pacific or Zinsco
  panels, polybutylene or galvanized supply).

Don't read `home/projects/`, `home/backlog.md`, `home/inbox/`, or
`home/archive/`. Never write anything in `home/`. If the planner's recorded
carrier or deductible differs from a dec page you imported, tell the user
so they can update it in the home improvement planner; don't fix it
yourself.

Never read or write `travel/`. Ask the user about travel coverage and card
benefits directly.

## What to compute

| Check | Formula | Used in |
|-------|---------|---------|
| Net worth at risk | investable assets + Σ(home value − mortgage balance) + other assets the user named; also shown without retirement accounts | Liability and umbrella limits |
| Deductible ceiling | emergency fund target (or cash, if lower) | Every deductible, including percentage deductibles in dollars |
| Largest single-event deductible | the biggest deductible a single storm or quake could trigger across all properties and lines | Compared with the ceiling |
| Life need offset | liquid assets earmarked for survivors (taxable + cash; retirement accounts with the tax noted) | Life need |
| Disability horizon | target retirement year − this year | Benefit period needed |
| Premium share | total annual premium ÷ annual spend | Context, not a verdict |
| Rebuild cost | square feet × sourced local rebuild cost per sq ft | Dwelling coverage |
| Roof age | this year − roof install year | ACV roof risk, discounts, carrier eligibility |

Home value: ask the user for a rough estimate, or say it's missing.
Don't search for an estimate of the user's house by address.

Never copy portfolio figures (balances, holdings, income, net worth) into
`insurance/` files. Store only the computed ratios and verdicts ("liability
limits cover ~40% of net worth at risk", "wind deductible = 1.4× emergency
fund"), with the date of the ledger snapshot they came from. Dollar figures
that come from the policies themselves are fine: limits, deductibles,
premiums, a recommended umbrella limit, and exposures stated against them
("a $1M judgment exceeds the $300k limit by $700k").

## Logging a cash event (material premium changes only)

Premiums are recurring, so most of them don't belong in the portfolio's cash
events. Ask once, and log one line, only when:

- a **new policy** adds more than $500/yr (an umbrella, LTC, a new term
  policy, flood), or
- a **renewal or switch** changes a policy's annual premium by more than
  $500/yr, up or down, or
- a **one-time cost** above $500 is coming (a large deductible on an open
  claim, a surrender charge, an LTC premium catch-up).

Ask: *"This changes your annual insurance cost by about $X. Add it to your
portfolio profile's upcoming cash events?"* On yes, insert one line under
`## Known upcoming cash events` in `portfolio/profile.md`, in date order with
the existing lines, replacing a `- TBD` placeholder if it's the only entry:

```
- YYYY-MM: <policy label> <new|renewal|switch>, <+|−>$X/yr (insurance/policies/<file>.md)
```

If the policy already has a line (match on the policy file path), update it
in place. When the change is in effect and the user has updated their
spending figures, offer to remove the line. This line is the only thing you
ever write in `portfolio/`.

## No portfolio files

Use the net-worth range, income, and deductible comfort from
`insurance/profile.md`. Say once that the portfolio advisor adds an exact
net-worth and emergency-fund check. Every check still runs, with the range's
upper end used for liability limits.

## No home files

Ask for year built, square feet, roof age and material, and the major
system updates during the interview, and record them in
`insurance/profile.md` under each property. Mention once that the home
improvement planner tracks system ages that affect premiums and discounts.
