---
description: Re-rank the home project backlog across all properties and show what fits the next 12 months of cash
argument-hint: "[property]"
---

Use the home-improvement skill to review the backlog.

Property filter: $ARGUMENTS (all properties if empty)

If `home/profile.md` doesn't exist, tell the user to run `/init-home` first
and stop.

Load `home/backlog.md`, every property's `systems.md`, and open project files.
If `portfolio/profile.md` exists, read it and `portfolio/ledger.md` per
`references/finance-link.md`. Re-score anything whose facts changed (a system
aged past its expected life, a bid expired), re-rank per
`references/need-want.md`, and rebuild the cash sequence and bundles. Lead
with Need-now items and systems past end of life, then show what fits in the
next 12 months of cash above the emergency fund and what gets a target year.
Write the updated `home/backlog.md`.
