# communications

The communications agent for the dretech-ai agents, for Claude (Desktop and
[Claude Code](https://claude.com/claude-code)) and ChatGPT/Codex. It's the
only one of the agents that talks to your Google Workspace. The others work
out *what* needs doing and *when*; this one puts it where you'll see it:

1. **Google Calendar.** Trip dates from the
   [vacation-planner](../vacation-planner/README.md), and work days and
   permit inspections from the
   [home-improvement](../home-improvement/README.md) planner.
2. **Google Tasks.** Booking windows, points transfers, cancellation
   deadlines, deposit due dates, bid expirations, rebate deadlines, and
   estimated tax and RMD deadlines from the
   [portfolio-advisor](../portfolio-advisor/README.md).
3. **Gmail drafts.** Questions and follow-ups to a contractor about their
   bid, and any email you ask it to draft. **It never sends.** You review the
   draft in Gmail and send it yourself.

The other agents never touch Google. When a plan is done, they ask whether to
queue its dates and drafts, and they write request files to `comms/outbox/`.
This agent shows you everything in one preview, checks your calendar and task
list for duplicates, and creates only what you approve.

It never sends email. It never deletes, declines, or shares anything, and it
never changes an event, task, or draft it didn't create.

## Install

Same options as the other agents; swap the name.

- **Claude Desktop:** Customize → Plugins → Add → Add marketplace,
  `dretech-ai/dretech-agents`, install communications from Discover. Use it in
  Cowork with your finances folder connected. Skill only: download
  [communications.skill](https://github.com/dretech-ai/dretech-agents/releases/latest/download/communications.skill)
  and upload it under Customize → Skills (no hook).
- **ChatGPT / Codex desktop app:** Plugins → Add → Add marketplace,
  `dretech-ai/dretech-agents`, click **+** next to Communications, and trust
  its hook when asked.
- **Claude Code:**
  ```
  /plugin marketplace add dretech-ai/dretech-agents
  /plugin install communications@dretech-ai
  ```
- **Codex CLI:**
  ```bash
  codex plugin marketplace add dretech-ai/dretech-agents
  codex plugin add communications@dretech-ai
  ```
- **Standalone skill:** copy `skills/communications` to `~/.claude/skills/`
  (Claude Code) or `~/.agents/skills/` (Codex).

## Connect Google

The agent finds a Google connection by itself, separately for drafts,
calendar, and tasks:

| Connection | Drafts | Calendar | Tasks |
|------------|--------|----------|-------|
| Claude's Gmail and Google Calendar connectors (Settings → Connectors) | ✓ | ✓ | — |
| A Google Workspace MCP server (`claude mcp add …` / `codex mcp add …`) | ✓ | ✓ | ✓ if it supports Tasks |
| The `gws` command-line tool | ✓ | ✓ | ✓ |
| Nothing connected | paste-ready email | `.ics` file to import | checklist |

Claude's built-in Google connectors don't include Google Tasks, so for tasks
you need a Workspace MCP server or `gws`. Without either, the agent lists
your tasks for you to add by hand, or, if you say so, puts them on your
calendar as all-day "To do" events.

## Usage

Run it in the same private folder as your other dretech-ai agents:

```
/communications:init-comms   # scaffolds comms/, asks for your defaults, checks connectors
/communications:outbox       # preview what the other agents queued, then create it in Google
/communications:agenda       # this week's events, open tasks, unsent drafts, and the queue
```

Always open it from that folder. It creates files only in a folder that
already holds a workspace (its own or a sibling agent's). Anywhere else it
stops and asks.

Or just ask: *"put my Maui trip on my calendar"*, *"draft an email to the
roofer asking about the permit"*, *"what's on my agenda this week?"*,
*"find an hour for a contractor walkthrough next week"*.

```
comms/
├── profile.md          # Google account, default calendar and task list, time zone, signature
├── log.md              # everything it created in Google: date, title, Google ID
├── outbox/             # requests queued by the other agents (or by you)
└── done/YYYY-MM-DD/    # processed requests, with what happened to each
```

### The preview

Every run ends in one table before anything is written: each request's
type, title, date, target calendar or list, and status (new, duplicate, or
needs fix). Calendar guests and draft recipients get their own line and their
own yes, because Google emails guests an invitation as soon as the event
exists. If a request's date doesn't match the trip or project plan it came
from, the agent flags it rather than picking one.

## Privacy

There is no dretech-ai server: nothing you give the agent is sent to us. Full
policy: [dretech.ai/privacy](https://dretech.ai/privacy.html).

- **Your files stay local.** Everything is plain markdown in your folder.
- **What the AI reads goes to its provider** (Anthropic for Claude, OpenAI for
  ChatGPT/Codex), under your account's data terms. That includes any email
  thread you ask it to reply to.
- **Google access is yours.** The agent acts through the connector you set
  up, with that connector's permissions. It only creates drafts, events, and
  tasks.
- **The log is minimal.** `comms/log.md` keeps titles, dates, and Google IDs,
  not email bodies, and recipients by domain only.
- **No account numbers or home addresses** in anything it creates. Events and
  tasks use a property nickname and city, not a street address. Nothing from
  `portfolio/` goes into an email.
- **The hook makes no network calls.** `hooks/pii-guard.sh` reads the pending
  write from stdin and exits.

## The PII guard

The plugin's `PreToolUse` hook checks file edits in a comms workspace (cwd
with `comms/profile.md`, or a path under `comms/`), including the request
files other agents write to `comms/outbox/`. It blocks 8+ digit runs
(optionally hyphenated) and space-grouped card numbers. Lines labeled
`Confirmation:`, `Quote #:`, `Estimate #:`, `Invoice #:`, `Permit:`,
`License:`, `Phone:`, or `Google ID:` are allowed, as are dates, date
ranges, dollar amounts, and IDs where the digits are attached to letters
(`r-8123456789`).

- Requires `bash` and `perl` (on Windows, install Git for Windows).
- Disable with `export COMMUNICATIONS_PII_GUARD=off`.
- It's a pattern match: short or alphanumeric account numbers, and anything
  sent straight to Google rather than written to a file, aren't caught. The
  skill's own instructions cover those.

## Disclaimer

This agent writes to your Google account on your behalf after you confirm.
Check drafts before you send them and events before you rely on them. It
gives no financial, travel, or contractor advice; that comes from the agent
that queued the request. Provided as is, without warranty, under the Apache
License 2.0.

## License

Apache-2.0 — see [LICENSE](../../LICENSE) and [NOTICE](../../NOTICE).
