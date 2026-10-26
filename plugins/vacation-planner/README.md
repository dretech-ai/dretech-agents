# vacation-planner

A blunt, points-aware vacation planner for Claude (Desktop and
[Claude Code](https://claude.com/claude-code)) and ChatGPT/Codex. Tell it how
you travel, give it your points and timeshare documents, and it plans trips
that:

1. **Fit your tier** — economy, standard, or luxury, with your preferred
   hotel, airline, and rental car.
2. **Use what you've already paid for** — timeshare and vacation-club points,
   deeded or floating weeks, prepaid packages and cruises, travel credits, and
   free-night certificates, with use years, booking windows, and expirations
   tracked.
3. **Value every point** — cash vs. points per flight, room, and car, in cents
   per point, with poor redemptions called out.
4. **Flex the dates** — shifted dates, shoulder season, alternate airports,
   and the day a booking window opens.
5. **Check your finances** — when you also use the
   [portfolio-advisor](../portfolio-advisor/README.md) in the same folder, each
   trip is checked against your cash, emergency fund, and annual spend, and
   logged as an upcoming cash event for your next portfolio review.

Searches can go to **Perplexity** when you connect it (optional). Without it,
the planner uses the app's own web search or gives you prompts to paste into
Perplexity yourself.

It never books, holds, transfers, or redeems anything. It gives you the plan
and the booking steps; you book.

## Install

Same options as the portfolio-advisor; swap the name.

- **Claude Desktop:** Customize → Plugins → Add → Add marketplace,
  `dretech-ai/dretech-agents`, install vacation-planner from Discover. Use it
  in Cowork with your finances folder connected. Skill only: download
  [vacation-planner.skill](https://github.com/dretech-ai/dretech-agents/releases/latest/download/vacation-planner.skill)
  and upload it under Customize → Skills (no hook).
- **ChatGPT / Codex desktop app:** Plugins → Add → Add marketplace,
  `dretech-ai/dretech-agents`, click **+** next to Vacation Planner, and trust
  its hook when asked.
- **Claude Code:**
  ```
  /plugin marketplace add dretech-ai/dretech-agents
  /plugin install vacation-planner@dretech-ai
  ```
- **Codex CLI:**
  ```bash
  codex plugin marketplace add dretech-ai/dretech-agents
  codex plugin add vacation-planner@dretech-ai
  ```
- **Standalone skill:** copy `skills/vacation-planner` to `~/.claude/skills/`
  (Claude Code) or `~/.agents/skills/` (Codex).

### Optional: connect Perplexity

Any Perplexity MCP server works; the planner looks for tools with
`perplexity` in the name. You need a Perplexity API key.

- **Claude Desktop:** Settings → Connectors → add a Perplexity connector.
- **Claude Code:** `claude mcp add perplexity --env PERPLEXITY_API_KEY=... -- npx -y @perplexity-ai/mcp-server`
- **Codex:** `codex mcp add perplexity --env PERPLEXITY_API_KEY=... -- npx -y @perplexity-ai/mcp-server`

## Usage

Run it in the same private folder as your portfolio-advisor, so it can read
your finances:

```
/init-travel              # scaffolds travel/, then interviews you (tier, brands, airports, points)
                          # drop points statements, timeshare contracts, confirmations into travel/inbox/
/import-travel            # imports them → travel/points.md, travel/holdings.md
/plan-trip [destination]  # full plan → travel/trips/YYYY-MM-<slug>.md
/update-point-values      # refresh cents-per-point valuations → travel/point-values.md
```

In Codex, or without the plugin, just ask: *"set up my vacation planner"*,
*"import my timeshare contract"*, *"plan a trip to Maui in March"*.

```
travel/
├── profile.md        # tier, travelers, home airports, preferred brands + status
├── points.md         # balances, status, expirations (member numbers masked)
├── point-values.md   # cents per point, with sources and your overrides
├── holdings.md       # timeshares, prepaid trips, credits, certificates
├── trips/            # one plan per trip
├── inbox/            # drop documents here
└── archive/YYYY-MM-DD/   # processed documents, moved verbatim
```

### Point values

Valuations come, in order, from a live search of published valuations, a
baseline bundled with the skill, or you. Set your own value for any program
("I value Hyatt at 2.0¢") and it always wins. Values refresh when they're more
than three months old or with `/update-point-values`.

### The portfolio link

When `portfolio/` exists, the planner reads your profile and latest ledger
snapshot (read-only) and gives each trip a verdict: **Fine**, **Tight**, or
**Don't**. When a trip moves to planned or booked, it asks before adding one
line to `portfolio/profile.md` under *Known upcoming cash events*, so your next
portfolio review accounts for it. That line is the only thing it ever writes
in `portfolio/`.

## Privacy

There is no dretech-ai server: nothing you give the agent is sent to us. Full
policy: [dretech.ai/privacy](https://dretech.ai/privacy.html).

- **Your files stay local.** Everything is plain markdown in your folder.
- **What the AI reads goes to its provider** (Anthropic for Claude, OpenAI for
  ChatGPT/Codex), under your account's data terms.
- **Searches are generic.** Queries hold only destination, dates, traveler
  count, class, brands, and airports, never names, member numbers,
  confirmation codes, balances, or anything from `portfolio/`. With Perplexity
  connected, those queries go to Perplexity.
- **`travel/archive/` holds your originals unredacted**, member and contract
  numbers included. Keep the folder private.
- **The hook makes no network calls.** `hooks/pii-guard.sh` reads the pending
  write from stdin and exits.

## The PII guard

The plugin's `PreToolUse` hook checks file edits in a travel workspace (cwd
with `travel/profile.md`, or a path under `travel/`). It blocks 8+ digit runs
(optionally hyphenated) and space-grouped card numbers, so member, contract,
and card numbers get masked to `••••1234`. Lines labeled `Confirmation:` (or
Conf, Record locator, Booking ref) are allowed, since you need those codes.
Dates, date ranges, and dollar amounts are allowed.

- Requires `bash` and `perl` (on Windows, install Git for Windows).
- Disable with `export VACATION_PLANNER_PII_GUARD=off`.
- It's a pattern match: alphanumeric member numbers (some airline programs)
  and shell-written files aren't caught. The skill's own instructions cover
  those.

## Disclaimer

This is a planning tool. It is not a travel agent, and it never books
anything. Prices, award rates, and availability change constantly; verify them
on the provider's site before booking. The finance check is arithmetic on your
own numbers, not investment advice. Provided as is, without warranty, under
the Apache License 2.0.

## License

Apache-2.0 — see [LICENSE](../../LICENSE) and [NOTICE](../../NOTICE).
