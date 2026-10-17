# Tax data

Tax figures change every year. Never compute with a remembered number. Use
`portfolio/tax-figures.md`, and keep it current with the procedure below.

## When to refresh

Refresh before computing anything tax-related if any of these is true:

- `portfolio/tax-figures.md` doesn't exist.
- Its **Tax year** isn't the year you're analyzing (normally the current
  calendar year).
- Its **Retrieved** date is more than 6 months old.
- Its **Source** is `bundled` or `user-provided` and you have web access now.
- The user asks (*"update my tax figures"*, `/update-tax-data`).

From October to December, the IRS usually publishes next year's figures. If
they're out, note them under **Next year** in the file, because they matter for
year-end moves like Roth conversions, gain harvesting, and next year's
contribution plans. Use the current year for this year's math.

## What to collect (for tax year Y)

| Figure | Primary source |
|--------|----------------|
| Federal brackets: all four filing statuses | IRS inflation-adjustment Rev. Proc. for Y (published in the fall of Y−1) |
| Standard deduction, the 65+/blind additional amount, and any temporary senior deduction | Same Rev. Proc.; IRS.gov page on the senior deduction |
| LTCG 0% / 15% / 20% thresholds | Same Rev. Proc. |
| NIIT thresholds (3.8%; set by statute, not indexed) | IRS.gov "Net Investment Income Tax" page |
| 401(k)/403(b)/457(b) deferral, 50+ catch-up, 60–63 catch-up, Roth-catch-up wage threshold, 415(c) total | IRS news release and Notice on Y retirement plan limits |
| IRA limit and 50+ catch-up | Same release |
| Roth IRA MAGI phase-outs; traditional IRA deduction phase-outs | Same release |
| HSA limits (self-only, family) and 55+ catch-up | IRS Rev. Proc. for Y HSA limits (published in spring of Y−1) |
| Social Security wage base | SSA.gov COLA fact sheet for Y |
| Medicare Part B premium and IRMAA tiers (based on MAGI from Y−2) | CMS.gov fact sheet for Y Medicare Parts B & D premiums |
| RMD starting age | IRS.gov "Retirement plan and IRA required minimum distributions" FAQs |
| Annual gift tax exclusion | IRS inflation-adjustment Rev. Proc. for Y |

Sources, in this order:

1. Government pages: IRS.gov, SSA.gov, CMS.gov, Medicare.gov.
2. A major custodian's or publisher's summary, only if no government page
   can be reached. Mark every figure taken this way as `secondary`.

Record the source URL for every table. If two sources disagree, use the
government figure and say so.

## Privacy: hard constraint

Web searches and fetched URLs contain only generic terms: the year and the
figure name (`2026 IRA contribution limit`, `2026 IRMAA brackets`). **Never**
include anything from the profile, ledger, or statements: income, balances,
age, state, employer, custodian, names, or account details. You're looking up
public tables, not the user's situation.

## How to refresh

1. **Web tools available:** search and fetch the primary sources above. Fill
   every table in [../templates/tax-figures.md](../templates/tax-figures.md).
   Set `Source: live` and `Retrieved:` today.
2. **No web access**, or a source can't be reached: if
   `tax-figures-Y.md` exists next to this file, copy its figures and set
   `Source: bundled`. It was verified when the skill was released. Tell the
   user it may be missing mid-year changes.
3. **Neither:** ask the user to paste the figures from IRS.gov or their tax
   software (`Source: user-provided`), or carry on with each figure you use
   labeled **unverified** in the review. Never present a remembered figure as
   current.

A figure you couldn't confirm stays `unverified` in the file. Don't fill the
gap with a guess.

## After refreshing

- Write `portfolio/tax-figures.md`, replacing the prior version. Keep earlier
  years' figures out of it; the ledger and old reviews show what was used then.
- Tell the user what changed: list each figure whose value differs from the
  previous file, old → new. If nothing changed, say so in one line.
- Flag changes that affect the user's open recommendations, like a raised
  contribution limit, a moved LTCG threshold, or a crossed IRMAA tier.
- Write dollar amounts with commas (`$1,000,000`) and dates as ISO dates. The
  account-number guard blocks bare 8+ digit runs.
