---
description: Review coverage — gaps, over-coverage, overlaps, price, and when to shop → insurance/reviews/
argument-hint: "[policy label or file]"
---

Use the insurance-advisor skill to run a coverage review.

Scope: $ARGUMENTS
If this names a policy (a label or a file in `insurance/policies/`), review
that policy, but still list any Critical gap elsewhere at the top. If nothing
was given, review every policy.

If `insurance/profile.md` doesn't exist, tell the user to run
`/init-insurance` first and stop.

Load state (import anything in `insurance/inbox/` first). If
`portfolio/profile.md` exists, read it, `portfolio/ledger.md`, and
`portfolio/tax-figures.md`; if `home/profile.md` exists, read it and
`home/properties/`, per `references/finance-link.md`. Then run
`references/coverage-check.md`, `references/price-analysis.md`, and
`references/shopping-triggers.md`, write
`insurance/reviews/YYYY-MM-DD-review.md` from `templates/review.md`, and
update the open gaps and shop calendar in `insurance/policies.md`. Lead with
the largest uncovered exposure. Offer the cash-event line only for a change
over $500/yr, and offer comms hand-offs if `comms/profile.md` exists. Never
buy, change, or cancel a policy, and never write policy numbers, member IDs,
or VINs.
