---
description: Import declarations pages, renewal notices, quotes, and plan documents from insurance/inbox/ (or a given path)
argument-hint: "[path-to-document]"
---

Use the insurance-advisor skill to import insurance documents.

Source documents: $ARGUMENTS
If no path was given, process every file in `insurance/inbox/` (ignore
`.gitkeep`). If `insurance/inbox/` is empty and no path was given, ask the
user to drop declarations pages, renewal notices, quotes, or plan summaries
there, or paste them.

If `insurance/profile.md` doesn't exist, tell the user to run
`/init-insurance` first and stop.

Follow the skill's import procedure (`references/import.md`) end to end:
match each document to a policy, extract, drop policy numbers, member IDs,
MBIs, VINs, driver's license numbers, and street addresses, confirm anything
ambiguous, update the policy files and `insurance/policies.md`, compare any
quotes, archive the sources, and lead the report with non-renewals, large
increases, and coverage cut at renewal, then gaps, then price notes.
