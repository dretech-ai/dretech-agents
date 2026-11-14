# Hand-offs to the communications agent

The communications agent (`comms/`) is the only agent that touches the user's
Google account: Gmail drafts, Google Calendar events, and Google Tasks. The
other agents don't call Google tools. They queue a **request file** in
`comms/outbox/`, and the communications agent shows it to the user, then
pushes it to Google once the user confirms.

This file is identical in every dretech-ai skill. Don't edit one copy alone.

## When to queue

Queue a request only when **all** of these are true:

1. `comms/profile.md` exists in the workspace (the user has set up the
   communications agent).
2. The user said yes to this specific hand-off. Offer it once, at the end of
   a plan or review, as a short list: "Want me to queue these for your
   calendar and tasks?" Never queue silently.
3. The request has a concrete date or recipient. "Sometime next spring" is
   not a calendar event.

If `comms/profile.md` doesn't exist, show the would-be requests inline as a
plain list (date, title, one-line note) so the user can add them by hand, and
mention once that the communications agent can push them to Google. Don't
create `comms/`.

`comms/outbox/` is the **only** place in `comms/` a sibling agent may write.
Never read or edit other files in `comms/`, and never edit or delete a request
after writing it. To change one, write a new request whose `replaces` field
names the old file.

## What each agent queues

| From | Type | Examples |
|------|------|----------|
| vacation-planner | event | Trip dates (all-day, travel start to end); flight times once booked |
| vacation-planner | task | Booking window opens, points transfer, cancellation/refund deadline, timeshare reservation deadline, certificate expiry |
| home-improvement | draft | Follow-up or questions to a contractor about a bid |
| home-improvement | event | Scheduled work days, permit inspection, walkthrough |
| home-improvement | task | Deposit or progress payment due, bid expires, system replace-by within 12 months, rebate application deadline |
| insurance-advisor | draft | Re-quote request or coverage-change questions to the user's agent or broker |
| insurance-advisor | task | Shop-by date (~45 days before a renewal), non-renewal effective date, premium due, open enrollment, Medicare enrollment windows, Medigap open-enrollment end, term-conversion deadline |
| portfolio-advisor | task | Quarterly estimated tax due, RMD deadline, contribution deadline, rebalance or tax-loss-harvest review date, wash-sale window ends |

The portfolio advisor never queues an email draft. No agent puts balances,
holdings, income, or portfolio figures in any request.

## File name and format

`comms/outbox/YYYY-MM-DD-<agent>-<slug>.md`. Use today's date, the sending
agent's short name (`portfolio`, `travel`, `home`, or `insurance`), and a short
lowercase-hyphenated slug. Example:
`comms/outbox/2026-11-14-travel-maui-trip-dates.md`.

```markdown
---
from: vacation-planner            # portfolio-advisor | vacation-planner | home-improvement | insurance-advisor
type: event                       # event | task | draft
source: travel/trips/2027-03-maui.md
created: 2026-11-14
status: pending                   # always "pending" when you write it
replaces:                         # optional: file name of an earlier request this supersedes
# --- event ---
title: Maui trip
all_day: true
start: 2027-03-13                 # date (all-day) or YYYY-MM-DDTHH:MM with time_zone
end: 2027-03-20                   # all-day end is the last day, inclusive
time_zone:                        # IANA name, e.g. America/Chicago; blank = profile default
location: Kaanapali, HI           # city or business/venue name only, never the user's street address
reminders: [7d]                   # optional: 30m, 1h, 1d, 7d
guests: []                        # optional: business email addresses; the user confirms guests separately
# --- task ---
# title: Transfer Chase points to Hyatt
# due: 2027-01-10
# list:                           # blank = profile default
# --- draft ---
# to: [office@example-roofing.com]
# subject: Questions on your roof replacement estimate
# thread_hint: "from:example-roofing.com estimate"   # optional: Gmail search to find the thread to reply in
---

Body: the event description, the task notes, or the full email body.
Plain text. Reference the source plan by name, not by copying figures from
it.
```

## Content rules (all requests)

- No account, loan, policy, member, or card numbers, and no VINs. Labeled
  reference numbers are fine on their own line: `Confirmation:`, `Quote #:`,
  `Estimate #:`, `Invoice #:`, `Permit:`, `License:`, `Claim #:`.
- No street addresses of the user's own homes. City, state, and ZIP, or a
  property nickname ("main house"), are fine. A business's address is fine
  when the user needs it to get there.
- No balances, income, holdings, or anything from `portfolio/`.
- Drafts go only to business addresses the user gave you or that appear in a
  document they shared (a contractor's estimate, for example). Never guess an
  address.
- Write drafts in the user's voice, short and plain: what you need, by when.
  They are drafts, and the user edits and sends them.
