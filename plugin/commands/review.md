---
description: Run a portfolio review on new statements in inbox/ (or a given path)
argument-hint: "[path-to-statement]"
---

Use the portfolio-advisor skill to run a full portfolio review.

Source documents: $ARGUMENTS
If no path was given, process every file in `inbox/` (ignore `.gitkeep`). If
`inbox/` is empty and no path was given, ask the user to drop a statement there
or paste holdings.

If `portfolio/profile.md` doesn't exist, tell the user to run `/init-portfolio`
first and stop.

Follow the skill's review workflow end to end: load state, extract holdings,
update the ledger, compute, write `reviews/YYYY-MM-DD-<slug>.md`, archive the
sources, and grade prior recommendations. Never write account numbers to any
file.
