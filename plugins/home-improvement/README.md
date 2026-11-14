# home-improvement

A blunt home improvement planner for Claude (Desktop and
[Claude Code](https://claude.com/claude-code)) and ChatGPT/Codex. Tell it about
your home (or homes), give it your contractor estimates and inspection
reports, and it:

1. **Knows your house** — an interview (or your inspection report) records
   each property and the age of its roof, HVAC, water heater, electrical,
   plumbing, windows, and more, and forecasts what needs replacing in the next
   five years.
2. **Compares estimates like with like** — drop bids in `home/inbox/` and it
   lines them up item by item, prices missing scope and low allowances into an
   adjusted total, checks deposit, permit, warranty, and license terms, and
   calls out red flags.
3. **Separates needs from wants** — every project is scored on safety,
   damage prevention, system age, efficiency, function, resale, and comfort,
   then classed as *Need now*, *Need soon*, *Want — high value*, or *Want*,
   with the cost of putting a need off.
4. **Keeps one ranked backlog** — across your primary home, rentals, and
   vacation homes, sequenced against your cash, with projects bundled when
   they share a trade or depend on each other.
5. **Checks your finances** — when you also use the
   [portfolio-advisor](../portfolio-advisor/README.md) in the same folder, each
   project is checked against your cash, emergency fund, annual spend, other
   upcoming cash events (including trips from the
   [vacation-planner](../vacation-planner/README.md)), and upcoming system
   replacements, and logged as an upcoming cash event for your next portfolio
   review. It also notes resale value, cost basis (or depreciation for a
   rental), and current rebates.

It never hires, signs, schedules, or pays anyone. It gives you the comparison,
the questions to ask, and the steps in order; you decide and sign.

## Install

Same options as the portfolio-advisor; swap the name.

- **Claude Desktop:** Customize → Plugins → Add → Add marketplace,
  `dretech-ai/dretech-agents`, install home-improvement from Discover. Use it
  in Cowork with your finances folder connected. Skill only: download
  [home-improvement.skill](https://github.com/dretech-ai/dretech-agents/releases/latest/download/home-improvement.skill)
  and upload it under Customize → Skills (no hook).
- **ChatGPT / Codex desktop app:** Plugins → Add → Add marketplace,
  `dretech-ai/dretech-agents`, click **+** next to Home Improvement, and trust
  its hook when asked.
- **Claude Code:**
  ```
  /plugin marketplace add dretech-ai/dretech-agents
  /plugin install home-improvement@dretech-ai
  ```
- **Codex CLI:**
  ```bash
  codex plugin marketplace add dretech-ai/dretech-agents
  codex plugin add home-improvement@dretech-ai
  ```
- **Standalone skill:** copy `skills/home-improvement` to `~/.claude/skills/`
  (Claude Code) or `~/.agents/skills/` (Codex).

## Usage

Run it in the same private folder as your portfolio-advisor, so it can read
your finances:

```
/init-home                # scaffolds home/, then interviews you (properties, systems, wish list)
                          # drop estimates, inspection reports, invoices into home/inbox/
/import-home              # imports them → project files, systems.md, basis.md, backlog.md
/plan-project [project]   # full plan → home/projects/YYYY-MM-<property>-<slug>.md
/home-backlog [property]  # re-rank everything and show what fits the next 12 months
```

Always open it from that folder. It creates files only in a folder that
already holds a workspace (its own or a sibling agent's). Anywhere else it
stops and asks, so a question asked from the wrong folder doesn't start a
second set of folders.

In Codex, or without the plugin, just ask: *"set up my home improvement
planner"*, *"compare the roofing bids in my inbox"*, *"what should I fix
first?"*.

```
home/
├── profile.md            # properties (nickname + city/state/ZIP), DIY appetite, default budget
├── backlog.md            # one ranked list across all properties
├── properties/<slug>/
│   ├── property.md       # facts, use, mortgage/HELOC (lender names only), insurance, HOA
│   ├── systems.md        # every system's age, expected life, replace-by, forecast
│   └── basis.md          # capital improvements (cost basis / depreciation)
├── projects/             # one plan per project
├── inbox/                # drop documents here
└── archive/YYYY-MM-DD/   # processed documents, moved verbatim
```

### Need vs. want

Each project gets a 0–3 score on seven factors. Safety hazards, active leaks,
failing systems, and anything an insurer, lender, HOA, or city requires are
*Need now*. A project that's partly both (a bathroom remodel that also fixes a
leaking shower pan) is split into a need portion and a want portion. If you
ask to plan a want while a need is open on the same property, it says so
first.

### The portfolio link

When `portfolio/` exists, the planner reads your profile and latest ledger
snapshot (read-only) and gives each project a verdict: **Fine**, **Tight**, or
**Don't**. If a project would need you to sell investments, it sends you to
the portfolio advisor's `/review` first. When a project moves to planned or
contracted, it asks before adding one line to `portfolio/profile.md` under
*Known upcoming cash events*. That line is the only thing it ever writes in
`portfolio/`. It never reads or writes `travel/`.

## Privacy

There is no dretech-ai server: nothing you give the agent is sent to us. Full
policy: [dretech.ai/privacy](https://dretech.ai/privacy.html).

- **Your files stay local.** Everything is plain markdown in your folder.
- **What the AI reads goes to its provider** (Anthropic for Claude, OpenAI for
  ChatGPT/Codex), under your account's data terms.
- **No addresses in its files.** Properties are a nickname plus city, state,
  and ZIP. Loan, account, policy, and parcel numbers are never written.
- **Searches are generic.** Queries hold only the project type, materials, and
  your city or ZIP, never names, addresses, or anything from `portfolio/`.
- **`home/archive/` holds your originals unredacted**, addresses and account
  numbers included. Keep the folder private.
- **The hook makes no network calls.** `hooks/pii-guard.sh` reads the pending
  write from stdin and exits.

## The PII guard

The plugin's `PreToolUse` hook checks file edits in a home workspace (cwd
with `home/profile.md`, or a path under `home/`). It blocks 8+ digit runs
(optionally hyphenated) and space-grouped card numbers, so mortgage, HELOC,
utility, insurance, bank, and parcel numbers stay out of your files. Lines
labeled `License:`, `Quote #:`, `Estimate #:`, `Invoice #:`, `Permit:`,
`Contract #:`, or `Confirmation:` are allowed, since you need those to verify
a contractor or reference a bid. Dates, date ranges, and dollar amounts are
allowed.

- Requires `bash` and `perl` (on Windows, install Git for Windows).
- Disable with `export HOME_IMPROVEMENT_PII_GUARD=off`.
- It's a pattern match: street addresses, short or alphanumeric account
  numbers, and shell-written files aren't caught. The skill's own instructions
  cover those.

## Disclaimer

This is a planning tool. It is not a contractor, home inspector, engineer, or
tax adviser, and it never hires, signs, or pays anyone. Prices, rebates,
credits, and permit rules change and vary by location; verify them with the
contractor, your permit office, your utility, and a tax professional before
signing. The finance check is arithmetic on your own numbers, not investment
advice. Provided as is, without warranty, under the Apache License 2.0.

## License

Apache-2.0 — see [LICENSE](../../LICENSE) and [NOTICE](../../NOTICE).
