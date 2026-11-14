---
description: Show upcoming calendar events, open Google Tasks, unsent drafts, and pending outbox requests (read-only)
argument-hint: "[range, e.g. today | this week | next 30 days]"
---

Use the communications skill to show the agenda.

Range: $ARGUMENTS (today plus 7 days if empty)

Read-only: don't create, change, or move anything, in Google or locally.
Follow the Agenda section of `references/direct-requests.md`. If
`comms/profile.md` doesn't exist, use the connectors' defaults (primary
calendar, local time zone), skip the drafts and outbox sections, and mention
`/communications:init-comms` once at the end.
