# Financial impact, value, and tax (portfolio link)

Every project gets an affordability check and a value & tax block. When the
user also uses the portfolio-advisor, its files are in the same folder; use
them.

## What to read (read-only)

- `portfolio/profile.md`: **Emergency fund target**, **Expected annual
  retirement spend** (use as a proxy for annual spend if no current spend is
  stated), **Target retirement year** (horizon), **Filing status** and
  **State of residence** (for the tax notes), and **Known upcoming cash
  events** (trips logged by the vacation planner count here too).
- `portfolio/ledger.md`: the latest snapshot's **cash and cash-equivalent
  holdings** (money market, sweep, savings) and the snapshot date.
- Each property's `systems.md` replacement forecast.

Never edit anything in `portfolio/` except the one cash-event line below.
Never copy portfolio numbers into `home/` files beyond the computed
percentages in the project's financial-impact block. Never read or write
`travel/`.

## What to compute

| Check | Formula | Flag when |
|-------|---------|-----------|
| Share of annual spend | out-of-pocket ÷ annual spend | > 10% |
| Cash after project | cash − out-of-pocket − other cash events before the project | below emergency-fund target |
| Stacking | this project + other cash events in the same 12 months | total > 20% of annual spend |
| Replacement reserve | systems due for replacement in the next 24 months (from `systems.md`, all properties) | this project would leave too little cash to cover them |
| Funding source | cash covers it, or a sale is needed | any sale needed |
| Horizon | years to retirement | < 5 years and project > 5% of annual spend |

- **Out-of-pocket** = adjusted total of the recommended bid (see
  [estimate-compare.md](estimate-compare.md)) + a contingency (10% for
  replacements, 15–20% for remodels and anything opening walls in a house
  built before 1980) − rebates paid at the point of sale. Rebates paid later
  and tax credits are **not** subtracted; they're shown separately.
- Use the ledger snapshot date in the output ("cash as of 2026-09-30"). If
  the snapshot is more than 90 days old, say the check is on stale numbers.

## Verdict

One blunt line, then the table:

- **Fine** — no flags.
- **Tight** — one flag; say which and what would fix it (phase the project,
  split need and want portions, wait for the off-season, cheaper material
  grade, push a want behind a need).
- **Don't** — cash would drop below the emergency fund, or the project needs
  a sale. If a sale is needed, tell the user to run the portfolio advisor's
  `/review` (or ask it) before signing, because the sale's tax impact
  belongs there, not here. For a **Need now** with a Don't verdict, still
  say the need is real: give the cheapest safe fix (repair vs. replace,
  temporary mitigation) and what it costs.

Existing mortgage and HELOC balances in `property.md` are facts for context.
Don't recommend borrowing or compare loan products; if the user raises it,
say that's a decision for them and their lender, and show only the
cash-only verdict.

## Value & tax block

- **Cost recouped at resale:** a sourced range for this project type and
  region (national cost-vs-value surveys, local agent data), with as-of
  date. Weight it by the plan-to-stay horizon in `profile.md`; past ~5 years,
  say resale value is a minor factor.
- **Capital improvement or repair:** a capital improvement adds value,
  prolongs life, or adapts the property to a new use (new roof, addition,
  HVAC replacement, remodel). A repair keeps it in ordinary condition
  (patching, fixing a leak, repainting). Classify the project and its parts.
- **Primary home:** capital improvements add to cost basis, which reduces
  taxable gain at sale above the § 121 exclusion ($250,000 single / $500,000
  married filing jointly, if ownership and use tests are met). Matters most
  for long-held homes in appreciating markets. Log it in `basis.md` when done.
- **Rental:** repairs are generally deductible in the year paid; capital
  improvements are depreciated (residential rental property over 27.5 years;
  some components and appliances over shorter lives). Mention the de minimis
  and small-taxpayer safe harbors exist and to confirm with a tax
  professional. Log in `basis.md` with the placed-in-service date.
- **Vacation / second home:** basis rules as for a primary home, but no
  § 121 exclusion unless it later becomes the primary residence; mixed
  rental use follows the rental rules for the rental share.
- **Rebates and credits:** search for current utility, state, and local
  rebates for this project and ZIP (heat pumps, insulation, windows, water
  heaters, solar, battery, EV charger, water-efficient fixtures). For federal
  energy credits, search their status as of the plan date — they have
  changed recently — and never assert one from memory. Each rebate or credit
  gets its source, as-of date, eligibility conditions (contractor
  certification, equipment efficiency tier, income limits, pre-approval),
  and a **Verify before signing:** line. Rebates that require pre-approval
  must be applied for before work starts; say so in the booking-steps order.
- **Insurance:** note if the project may lower premiums (new roof, impact
  windows, water-leak sensors, updated electrical) or needs a policy update
  (added square footage, pool, higher replacement cost). If
  `insurance/profile.md` exists, tell the user to run
  `/insurance-advisor:review-coverage` once the work is done (or before it
  starts, for added square footage or a pool). Never read or write
  `insurance/`.

## Logging the cash event

When the project status moves to `planned` or `contracted`, ask once: *"Add
this project to your portfolio profile's upcoming cash events?"* On yes,
insert one line under `## Known upcoming cash events` in
`portfolio/profile.md`, in date order with the existing lines, replacing a
`- TBD` placeholder if that's the only entry:

```
- YYYY-MM: <project> (<property>), ~$X,XXX out-of-pocket (home/projects/<file>.md)
```

If the project already has a line (match on the project file path), update
it in place instead of adding a second. Payment milestones spread over
several months may be one line with the range (`2027-03–2027-05`). When a
project is cancelled or `done`, update or remove its line and tell the user.

## No portfolio files

If `portfolio/profile.md` doesn't exist, use the default budget from
`home/profile.md`, or ask for a budget cap for this project and check against
that. Mention once that the portfolio-advisor adds the cash and
emergency-fund check. The value & tax block still runs; ask the user's
filing status if a tax note depends on it.
