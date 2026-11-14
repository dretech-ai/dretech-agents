# Connectors

Check once per session, separately for each capability: **drafts** (Gmail),
**calendar** (Google Calendar), and **tasks** (Google Tasks). A user can have
one connected and not the others. Pick the first path that works for each.

## Detection order

### 1. Claude's Google connectors

The built-in Gmail and Google Calendar connectors in Claude (Desktop, web, and
Claude Code when signed in to claude.ai). Look for tools whose names contain
`Gmail` or `Google_Calendar`:

| Capability | Tools to use | Tools never to use |
|------------|--------------|--------------------|
| Drafts | `create_draft`, `update_draft` (only drafts in your log), `list_drafts`, `get_draft`, `search_threads`, `get_thread`, `get_message` | `send_message`, `reply`, `forward`, `delete_draft`, `trash_*`, `mark_*_spam`, `label_*`, `unlabel_*`, `create_label`, `apply_sensitive_*` |
| Calendar | `create_event`, `update_event` (only events in your log), `list_events`, `search_events`, `get_event`, `list_calendars`, `suggest_time` | `delete_event`, `respond_to_event` |

These connectors have **no Google Tasks tools**. Check paths 2 and 3 for
tasks.

### 2. A Google Workspace MCP server

A self-hosted or third-party Google Workspace MCP server (common in Claude
Code and Codex). Look for tool names containing `gmail`, `calendar`, or
`task`, such as `create_draft`, `create_event`, `list_task_lists`,
`create_task`, or `insert_task`. Use the same allow/deny split as above: drafts
yes and send no; create and list yes, and delete or respond no. For tasks:
list task lists, create task, and list tasks are allowed. Completing or
deleting a task is not.

### 3. The `gws` command-line tool

In Claude Code or Codex with a shell, check `command -v gws`. If it's there,
run `gws --help` once to see its subcommands, and use only the create, insert,
and list commands for drafts, events, and tasks. Never run a send, delete, or
share command. If it isn't authenticated, tell the user to run its login
command themselves (in Claude Code: `! gws auth login`, or whatever its help
says) and stop. Don't try to sign in for them.

### 4. Fallback (nothing connected for this capability)

Don't stop. Produce something the user can use by hand, and keep the request
`status: manual`:

| Capability | Fallback |
|------------|----------|
| Drafts | The email in a fenced block: To, Subject, then the body, ready to paste into Gmail. |
| Calendar | An `.ics` file in `comms/done/<date>/` next to the request (one `VEVENT` per event, `DTSTART;VALUE=DATE` for all-day, `TZID` for timed). Say: "Open it, or import it in Google Calendar → Settings → Import & export." With no workspace, give the `.ics` text in a fenced block. |
| Tasks | A checklist in chat: `- [ ] <title> — due <date>`. |

If **tasks** has no connector, say so once per session:

> Google Tasks isn't connected. Claude's built-in Google connectors don't
> include Tasks. To push tasks, connect a Google Workspace MCP server that
> supports Tasks (Claude Code: `claude mcp add …`; Codex: `codex mcp add …`;
> Claude Desktop: Settings → Connectors), or install the `gws` CLI. For now
> I'll list them for you to add by hand.

Then offer, as an explicit choice, to put each task on the calendar instead
as an all-day event titled `To do: <title>`. Don't do it without a yes.

Mention the missing connector once per session, not on every item.

## Account check

Before the first write in a session, confirm which Google account the
connector is signed in to, if it shows one (the calendar list's primary
calendar or the Gmail profile). If it doesn't match `Google account` in
`comms/profile.md`, stop and ask before writing anything.

## Errors

If a write fails, record the error in the request (`status: failed`, with
the error message), keep it in the outbox, and carry on with the rest of the
batch. Don't retry more than once. Report failures in the summary table.
