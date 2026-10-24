# Financial impact (portfolio link)

Every trip gets an affordability check. When the user also uses the
portfolio-advisor, its files are in the same folder; use them.

## What to read (read-only)

- `portfolio/profile.md`: **Emergency fund target**, **Expected annual
  retirement spend** (use as a proxy for annual spend if no current spend is
  stated), **Target retirement year** (horizon), and **Known upcoming cash
  events**.
- `portfolio/ledger.md`: the latest snapshot's **cash and cash-equivalent
  holdings** (money market, sweep, savings) and the snapshot date.

Never edit anything in `portfolio/` except the one cash-event line below.
Never copy portfolio numbers into `travel/` files beyond the computed
percentages in the trip's financial-impact block.

## What to compute

| Check | Formula | Flag when |
|-------|---------|-----------|
| Share of annual spend | out-of-pocket ÷ annual spend | > 10% |
| Cash after trip | cash − out-of-pocket − other cash events before the trip | below emergency-fund target |
| Stacking | this trip + other events in the same 12 months | total > 20% of annual spend |
| Funding source | cash covers it, or a sale is needed | any sale needed |
| Horizon | years to retirement | < 5 years and trip > 5% of annual spend |

Use the ledger snapshot date in the output ("cash as of 2026-09-30"). If the
snapshot is more than 90 days old, say the check is on stale numbers.

## Verdict

One blunt line, then the table:

- **Fine** — no flags.
- **Tight** — one flag; say which and what would fix it (cheaper dates, use
  points, push the trip, trim the tier).
- **Don't** — cash would drop below the emergency fund, or the trip needs a
  sale. If a sale is needed, tell the user to run the portfolio advisor's
  `/review` (or ask it) before booking, because the sale's tax impact belongs
  there, not here.

## Logging the cash event

When the trip status moves to `planned` or `booked`, ask once: *"Add this trip
to your portfolio profile's upcoming cash events?"* On yes, append one line
under `## Known upcoming cash events` in `portfolio/profile.md`, replacing a
`- TBD` placeholder if that's the only entry:

```
- YYYY-MM: <trip name>, ~$X,XXX out-of-pocket (travel/trips/<file>.md)
```

If the trip already has a line (match on the trip file path), update it in
place instead of adding a second. When a trip is cancelled or `done`, update
or remove its line and tell the user.

## No portfolio files

If `portfolio/profile.md` doesn't exist, use the default budget from
`travel/profile.md`, or ask for a budget cap for this trip and check against
that. Mention once that the portfolio-advisor adds the cash and emergency-fund
check.
