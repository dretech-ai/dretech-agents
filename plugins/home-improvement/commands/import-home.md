---
description: Import contractor estimates, inspection reports, and invoices from home/inbox/ (or a given path)
argument-hint: "[path-to-document]"
---

Use the home-improvement skill to import home documents.

Source documents: $ARGUMENTS
If no path was given, process every file in `home/inbox/` (ignore `.gitkeep`).
If `home/inbox/` is empty and no path was given, ask the user to drop
estimates, inspection reports, or invoices there, or paste them.

If `home/profile.md` doesn't exist, tell the user to run `/init-home` first
and stop.

Follow the skill's import procedure (`references/import.md`) end to end:
match each document to a property and project, extract, drop account, loan,
policy, and parcel numbers and street addresses, confirm anything ambiguous,
update the project files, `systems.md`, `basis.md`, and `backlog.md`, compare
any bids, archive the sources, and lead the report with safety and
end-of-life findings, then bid red flags.
