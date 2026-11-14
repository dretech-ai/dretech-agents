# Personal advisor agents

This folder is the workspace for the dretech-ai advisor agents. Each agent owns one
part of it and reads the others only where noted. Agents you haven't installed
simply have no folder here.

| Agent | Plugin | Owns | Reads |
|-------|--------|------|-------|
| Portfolio advisor | `portfolio-advisor` | `portfolio/`, `reviews/`, `inbox/`, `archive/` | — |
| Vacation planner | `vacation-planner` | `travel/` | `portfolio/` (read-only, plus one cash-event line) |
| Home improvement | `home-improvement` | `home/` | `portfolio/` (read-only, plus one cash-event line) |

## Layout

```
<this folder>/
├── README.md                 # This file
├── portfolio/                # profile.md, ledger.md, target-allocation.md, tax-figures.md
├── reviews/                  # Dated portfolio reviews
├── inbox/                    # Drop brokerage/bank statements here
├── archive/<YYYY-MM-DD>/     # Processed statements (unredacted)
├── travel/
│   ├── profile.md  points.md  holdings.md  point-values.md
│   ├── trips/                # One plan per trip
│   ├── inbox/                # Drop points statements, timeshare contracts, travel credits
│   └── archive/<YYYY-MM-DD>/
└── home/
    ├── profile.md  backlog.md
    ├── properties/<slug>/    # property.md, systems.md, basis.md
    ├── projects/             # One plan per project: YYYY-MM-<property>-<slug>.md
    ├── inbox/                # Drop estimates, inspection reports, invoices, water tests
    └── archive/<YYYY-MM-DD>/
```

## Always work from this folder

Every agent resolves its paths relative to the folder you open it in. Open
Claude Code or Codex from here (`cd <this folder> && claude`), or connect this
folder in Cowork or the Codex desktop app.

The agents only create files in a folder that already holds one of their
workspaces. If you open one somewhere else, it stops and asks instead of
starting a new set of folders. If that happens, switch back to this folder.

## First run for each agent

Skip any agent that's already set up:

- `/portfolio-advisor:init-portfolio`
- `/vacation-planner:init-travel`
- `/home-improvement:init-home`

## Daily use

| Task | Command |
|------|---------|
| Review new statements in `inbox/` | `/portfolio-advisor:review` |
| Refresh tax brackets / limits | `/portfolio-advisor:update-tax-data` |
| Import travel docs from `travel/inbox/` | `/vacation-planner:import-travel` |
| Plan a trip | `/vacation-planner:plan-trip` |
| Refresh point valuations | `/vacation-planner:update-point-values` |
| Import estimates / reports from `home/inbox/` | `/home-improvement:import-home` |
| Plan a home project | `/home-improvement:plan-project` |
| Re-rank the home backlog against cash | `/home-improvement:home-backlog` |

After processing, files move from each `inbox/` to that inbox's dated `archive/` folder.

## Cross-agent rules

- `portfolio/` belongs to the portfolio advisor. The other two agents only read it,
  except for one line each under **Known upcoming cash events** in
  `portfolio/profile.md`, added only after you confirm.
- The travel and home agents never read or write each other's folders.
- Affordability checks use the cash in `portfolio/ledger.md`, the emergency-fund
  target, and the upcoming cash events. Keep the ledger current or the checks go stale.

## Privacy

- `archive/`, `travel/archive/`, and `home/archive/` hold original documents
  **unredacted**, including addresses and account numbers.
- Keep this folder out of public repos and shared cloud drives. If you put it under
  git, use a private remote only, or add the archive folders and the inboxes to
  `.gitignore`.
- Working files store labels, not numbers: no account, loan, policy, or card numbers.
  Properties are stored as a nickname plus city, state, and ZIP.
- Everything the agents read is sent to the model provider under your account's data
  terms. Web searches include only the topic and the city or ZIP.
