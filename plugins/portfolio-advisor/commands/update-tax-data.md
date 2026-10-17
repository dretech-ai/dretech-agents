---
description: Refresh portfolio/tax-figures.md with current IRS, SSA, and Medicare figures (brackets, contribution limits, IRMAA)
argument-hint: "[tax-year]"
---

Use the portfolio-advisor skill to refresh the workspace's tax figures.

Tax year: $ARGUMENTS
If no year was given, use the current calendar year.

If `portfolio/` doesn't exist, tell the user to run `/init-portfolio` first and
stop.

Follow the skill's tax-data procedure (`references/tax-data.md`) end to end,
even if `portfolio/tax-figures.md` looks current: collect every figure from
official sources, fall back to the bundled figures or ask the user if you
can't, write `portfolio/tax-figures.md`, and report what changed from the
previous version. Searches contain only the year and the figure name, never
anything about the user.
