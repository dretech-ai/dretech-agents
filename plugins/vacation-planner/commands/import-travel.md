---
description: Import points statements, timeshare contracts, prepaid trips, and travel credits from travel/inbox/ (or a given path)
argument-hint: "[path-to-document]"
---

Use the vacation-planner skill to import travel holdings.

Source documents: $ARGUMENTS
If no path was given, process every file in `travel/inbox/` (ignore
`.gitkeep`). If `travel/inbox/` is empty and no path was given, ask the user to
drop documents there, paste them, or type balances in.

If `travel/profile.md` doesn't exist, tell the user to run `/init-travel`
first and stop.

Follow the skill's import procedure (`references/holdings-import.md`) end to
end: extract, mask member and contract numbers to the last 4, confirm anything
ambiguous, update `travel/points.md` and `travel/holdings.md`, archive the
sources, and lead the report with anything expiring within 12 months.
