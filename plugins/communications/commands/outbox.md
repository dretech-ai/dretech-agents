---
description: Review the requests other agents queued in comms/outbox/ and create the approved ones in Google Calendar, Tasks, and Gmail drafts
argument-hint: "[agent: portfolio | travel | home]"
---

Use the communications skill to process the outbox.

Agent filter: $ARGUMENTS (all agents if empty)

If `comms/profile.md` doesn't exist, tell the user to run
`/communications:init-comms` first and stop.

Follow `references/outbox-workflow.md`: load the profile, the log, and the
pending requests, detect connectors, then validate, deduplicate, and preview
everything in one table. Create nothing until the user says yes, and get a
separate yes for any guests or draft recipients. Never send email; drafts
only. After the push, log each item, move processed requests to
`comms/done/<today>/`, and report each item's status and where to find it.
