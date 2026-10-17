# Review workflow

Run this when the user asks for a review or drops a document in `inbox/`.

1. **Load state** — read `portfolio/profile.md`, `portfolio/target-allocation.md`,
   `portfolio/ledger.md`. Then check `portfolio/tax-figures.md` and refresh
   it first if it's missing or stale (see [tax-data.md](tax-data.md)).
2. **Bootstrap if needed** — if the profile is empty or placeholders only, run
   [bootstrap-interview.md](bootstrap-interview.md) first and stop the review
   until the target allocation is confirmed.
3. **Read the new documents** — from `inbox/`, an attached path, or pasted
   text. For images/PDFs, extract holdings into a working table: account
   label, holding, ticker, shares, price, market value, cost basis (if
   shown), expense ratio (if known).
4. **Strip account numbers** from everything you will write. The originals in
   `inbox/` are not modified — they move to `archive/` as-is in step 9.
5. **Update the ledger** — add a new dated snapshot. Never overwrite prior
   snapshots; move the previous "Current holdings" table into History so
   trends stay visible.
6. **Compute**:
   - Allocation % by asset class and by individual position
   - Drift from target, and the dollar trades needed to rebalance
   - Concentration flags: > 10% single position, > 30% single sector
   - Weighted-average expense ratio, and the annual dollar cost
   - Cash drag: uninvested cash as % of total (net of the stated emergency fund)
   - Benchmark comparison — see [benchmarks.md](benchmarks.md)
   - Unrealized gains/losses by lot, if visible
   - TLH candidates: losses > ~$500 harvestable without a wash sale (check
     purchases of substantially identical securities ±30 days, across *all*
     accounts including IRAs and the spouse's accounts)
   - Asset-location inefficiencies: bonds/REITs/high-turnover funds in taxable,
     low-growth assets in Roth, international funds in IRAs (lost foreign tax
     credit)
   - Retirement trajectory: current balance + implied contributions, compounded
     at a stated real return, vs. the need at retirement (spend × 25 as a first
     cut, adjusted for Social Security/pension)
   - Downside stress: "what if the market drops 30% in the next 24 months?" —
     dollar hit, new withdrawal-rate math, years of spending covered by
     cash + bonds
7. **Write the review** to `reviews/YYYY-MM-DD-<short-slug>.md` using
   [../templates/review.md](../templates/review.md). Every recommended action
   states *what*, *why*, *expected impact* (in dollars where possible), and
   *when*.
8. **Link the review** from the new ledger snapshot row.
9. **Archive sources** — create `archive/<review-date>/` (with whatever shell
   is available: bash or PowerShell) and move every processed file out of
   `inbox/` into it, unchanged. `inbox/` should be empty
   (except `.gitkeep`) afterwards. List the archived paths in the review.
10. **Grade prior recommendations** — for each action in the previous review:
    Done / Partial / Not done. For "not done," push back and ask why; don't
    just restate it. If a prior call turned out wrong, say so.

## Before saving any file

Scan the content for digit runs of 8+ characters. Dates, dollar amounts and
CUSIPs are fine; anything that could be an account number gets removed.
