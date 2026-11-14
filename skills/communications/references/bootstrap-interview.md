# First-session setup

Run this when `comms/profile.md` is missing or still has placeholders. It's
short: one batch of questions, then a connector check.

## Disclosure (say this first, once)

> Before we start: I create Gmail drafts, Google Calendar events, and Google
> Tasks for you and the other dretech-ai agents. I never send email, and I
> never delete, decline, or share anything in your Google account. You see a
> preview of everything before I write it. To do this I use the Google
> connector you've set up, which acts with your account's permissions. Anything
> I read, including email threads I reply to, is sent to the AI provider
> you're using (Anthropic for Claude, OpenAI for ChatGPT/Codex) under your
> account's data terms. My local files keep titles, dates, and Google IDs, not
> email bodies or account numbers.

## Questions (one batch)

- **Google account:** which one to use (a label like "personal Gmail" plus
  the address, which is stored in `comms/profile.md` so a wrong sign-in gets
  caught).
- **Default calendar** for events from the agents (`primary`, or a dedicated
  one like "Plans"). Suggest a dedicated calendar if they want to see agent
  entries at a glance; they create it in Google Calendar themselves.
- **Task list** name (default: `dretech`). They create it in Google Tasks if
  it doesn't exist; you don't create lists.
- **Time zone** (IANA name, e.g. `America/Chicago`).
- **Working hours** for finding time (e.g. Mon–Fri 9:00–17:00).
- **Email signature** to add to drafts, or none.
- **Draft tone:** brief and direct (default), or warmer.
- **Default reminders:** for all-day events (e.g. 7 days and 1 day before)
  and timed events (e.g. 1 hour before).

## Then

1. Write `comms/profile.md` from [../templates/profile.md](../templates/profile.md).
2. Check connectors per [connectors.md](connectors.md) and show the result:

   | Capability | Status |
   |------------|--------|
   | Gmail drafts | connected (Claude Gmail connector) |
   | Calendar | connected (Claude Google Calendar connector) |
   | Tasks | not connected (how to add it) |

3. If connected, list calendars and confirm the default calendar exists.
   Check the task list too if Tasks is connected.
4. Tell the user which sibling agents are in this folder, and that they'll
   now offer to queue dates and drafts here.
5. If `comms/outbox/` already has requests, offer to process them.
