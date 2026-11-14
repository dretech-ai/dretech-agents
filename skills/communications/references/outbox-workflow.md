# Processing the outbox

Run this for `/communications:outbox`, when the user asks to push queued
requests, or after they say yes to the "N requests waiting" note at the start
of a session.

## 1. Load

- `comms/profile.md` (defaults: calendar, task list, time zone, signature)
  and `comms/log.md`.
- Every `comms/outbox/*.md` with `status: pending`, `status: failed`, or
  `status: manual`. Skip anything else.
- Detect connectors per [connectors.md](connectors.md).

## 2. Validate each request

Check it against [comms-handoff.md](comms-handoff.md). Mark it **needs fix**
(and leave it out of the push) when:

- Required fields are missing: an event without `start`, a task without
  `title`, a draft without `subject` or body.
- A date is in the past. Past events and tasks are pointless; flag them for
  the user to drop.
- It breaks the content rules: an account, loan, policy, or card number; a
  home street address; portfolio figures; or a draft from portfolio-advisor.
  Don't fix it silently. Say what's wrong and which agent wrote it.
- A draft's `to` address doesn't appear in the `source` file or in the
  user's own words. It needs the user to confirm the address.

**Check dates against the source.** If `source` is under `travel/`,
`home/`, or `insurance/`, open it and confirm the request's dates match the plan. If they
don't, flag it. Never open a source under `portfolio/` or `reviews/`; trust
the dates in the request.

**Superseded requests.** If a request has `replaces: <file>`, the newer one
wins. Drop the older one if it's still pending. If the older one was already
pushed (it's in `log.md`), treat the newer one as an update to that item.
That's the only case where you update something in Google, and it still goes
through the preview.

## 3. Deduplicate

For each request:

1. Search `comms/log.md` for the same `from`, `type`, `title`, and date. If
   it's there, the request is a **duplicate**.
2. Otherwise search Google: events in the target calendar on the same date
   with the same or a very similar title; tasks in the target list with the
   same title and due date; drafts with the same subject. A match is a
   **likely duplicate**. Show it, and skip it unless the user says otherwise.

## 4. Preview

One message, grouped by agent:

```
Outbox: 5 requests (vacation-planner 3, home-improvement 2)

| # | From   | Type  | Title                              | When                    | Where                  | Status        |
|---|--------|-------|------------------------------------|-------------------------|------------------------|---------------|
| 1 | travel | event | Maui trip                          | Mar 13–20, 2027 all-day | Calendar: Personal     | new           |
| 2 | travel | task  | Transfer Chase points to Hyatt     | due Jan 10, 2027        | Tasks: dretech         | new           |
| 3 | travel | task  | Cancel-by deadline, Kaanapali hotel| due Mar 6, 2027         | Tasks: dretech         | duplicate (skip) |
| 4 | home   | draft | Questions on your roof estimate    | —                       | Gmail drafts           | new           |
| 5 | home   | event | Roof permit inspection             | Dec 3, 2026 9:00 CT     | Calendar: Personal     | needs fix: date ≠ plan (Dec 4) |

Needs a separate yes:
- #4 draft to office@example-roofing.com (address from the estimate in home/archive/)

Tasks: not connected. #2 will be listed for you to add by hand, unless you want it on the calendar as an all-day "To do".
```

Then ask: **"Create 1, 2, and 4? And OK to address #4 to
office@example-roofing.com?"** Wait for an explicit yes. The user can pick
rows ("just 1 and 4"), edit one ("make #1 Mar 14–20"), or drop one.

For drafts, show the full draft body before the yes, below the table.

## 5. Push

For each approved row, in order:

- **Event:** create it in the target calendar with title, start/end (all-day
  end is exclusive in Google, so add one day to the request's inclusive
  `end`), time zone, location, description, and reminders. Add guests only if
  the user approved them separately. Put this line at the end of the
  description: `Created by dretech-ai communications from <source>`.
- **Task:** create it in the target list with title, due date, and notes.
  Add the same `Created by…` line to the notes.
- **Draft:** create it with to, subject, and body, plus the profile's
  signature if it has one. If `thread_hint` is set and a thread matches, make
  it a reply draft in that thread only if the connector can do that without
  sending; otherwise use a new draft with `Re: <thread subject>`.

Record the Google ID each call returns.

## 6. Log and move

- Append one line per created item to `comms/log.md` (see the template's
  format). Don't log Gmail or Calendar links; the Google ID is enough. (Draft
  links carry a long numeric thread ID that the PII guard blocks.)
- Update each processed request's front matter: `status` (`created`,
  `skipped`, `manual`, `failed`), `processed: <date>`, and `google_id` when
  there is one. Then move it to `comms/done/<YYYY-MM-DD>/`.
  - `failed`, `needs fix`, and anything the user didn't approve stay in
    `comms/outbox/` with the status and a one-line `note`.
  - `manual` requests move to `done/` with the fallback output (the `.ics`
    file sits next to them).

## 7. Report

One table: each row's final status and where to find it ("Calendar → Mar 13",
"Gmail → Drafts"). Then list anything still in the outbox and why. Remind the
user that drafts are **not sent** until they send them.
