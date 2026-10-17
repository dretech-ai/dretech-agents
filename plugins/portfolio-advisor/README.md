# portfolio-advisor

A blunt, US-focused portfolio analysis tool for [Claude Code](https://claude.com/claude-code).
Drop in your brokerage, 401(k), or IRA statements (PDF, CSV, screenshot, or
pasted text) and get a dated, numbers-first review covering:

1. **Allocation & rebalancing** — drift from target, cash drag, expense ratios, fund overlap
2. **Retirement trajectory** — on track / behind / ahead, withdrawal order, Social Security timing
3. **Tax optimization** — tax-loss harvesting, wash sales, asset location, Roth conversion windows
4. **Risk & concentration** — positions over 10%, sectors over 30%, employer stock, a −30% stress test

It remembers you between sessions through plain markdown files in your own
folder: a profile, a target allocation, and a ledger of snapshots. Every review
grades the previous review's recommendations, so ignored advice gets pushed
back on instead of quietly repeated.

It never logs in to your accounts. It only reads the documents you give it.
See [Where your data goes](#where-your-data-goes).

## Install

### Option A: Plugin (recommended)

Includes the skill, the `/review` and `/init-portfolio` commands, and a hook
that blocks account numbers from being written to files.

```
/plugin marketplace add dretech-ai/dretech-agents
/plugin install portfolio-advisor@dretech-ai
```

### Option B: Standalone skill

Just the skill, with no commands or hook:

```bash
git clone https://github.com/dretech-ai/dretech-agents.git
cp -r dretech-agents/skills/portfolio-advisor ~/.claude/skills/
```

On Windows (PowerShell):

```powershell
git clone https://github.com/dretech-ai/dretech-agents.git
New-Item -ItemType Directory -Force "$HOME\.claude\skills" | Out-Null
Copy-Item -Recurse dretech-agents\skills\portfolio-advisor "$HOME\.claude\skills\"
```

## Usage

Create a private folder for your finances. **Don't put it in a public repo.**

```bash
mkdir ~/finances && cd ~/finances && claude
```

On Windows (PowerShell):

```powershell
mkdir "$HOME\finances"; cd "$HOME\finances"; claude
```

```
/init-portfolio          # scaffolds folders, then interviews you (retirement year, income, constraints)
                         # drop statements into inbox/
/review                  # full review → reviews/YYYY-MM-DD-<slug>.md
```

If another plugin or a built-in command also uses `/review`, call these by
their namespaced names: `/portfolio-advisor:review` and
`/portfolio-advisor:init-portfolio`.

Without the plugin, just say *"set up my portfolio advisor"* and then
*"review my portfolio"*.

```
portfolio/
├── profile.md             # life stage, retirement year, income/spend, constraints
├── target-allocation.md   # target mix + glide path (proposed, then you confirm)
└── ledger.md              # dated snapshots, cash flows, recommendation tracker
reviews/                   # one dated report per review
inbox/                     # drop new statements here
archive/YYYY-MM-DD/        # processed statements, moved verbatim
```

## Where your data goes

- **Your files stay local.** The profile, ledger, reviews, and archived
  statements are plain files in your folder. Nothing syncs anywhere.
- **What Claude reads goes to Anthropic.** To analyze a statement, its contents
  are sent to Anthropic's API, like anything else you share with Claude Code,
  under your Claude account's data terms.
- **`archive/` holds your originals unredacted**, account numbers included.
  Account numbers are kept out of the files the advisor *writes*, not the
  statements you give it. Keep the folder private: not in a public repo, and
  think twice before putting it in iCloud, Dropbox, OneDrive, or another
  synced drive. On Windows, Desktop and Documents are often synced to OneDrive
  by default; a folder directly under your user folder (`$HOME\finances`)
  usually isn't.
- **The hook makes no network calls.** `hooks/pii-guard.sh` reads the pending
  write from stdin and exits. Read it yourself; it's short.

## Philosophy

- **US tax rules** built in (401k, Traditional/Roth IRA, HSA, 529, LTCG/STCG, wash sale, backdoor Roth).
- **Horizon-aware.** Under 10 years to retirement, sequence-of-returns risk is
  the first concern. With 25 years to go, savings rate and costs dominate.
- **Not dogmatic.** It will evaluate individual stocks on thesis and valuation,
  and it will tell you to just buy the index when that's the better answer.
- **Blunt.** It calls out mistakes and skips the boilerplate. It surfaces the
  three actions that matter most, not twelve.
- **Benchmarked.** It compares you against the S&P 500 (VOO) and the
  target-date fund for your retirement year.

## The PII guard

The plugin's `PreToolUse` hook checks every `Write`/`Edit` inside a portfolio
workspace. It blocks digit runs that look like account numbers (8+ digits,
optionally hyphenated). Dollar amounts, dates, date ranges, and masked numbers
(`••••1234`) are allowed. It only runs when the working directory has
`portfolio/profile.md`, or when the target path is under `portfolio/` or
`reviews/`.

- Requires `bash` and `perl`, both preinstalled on macOS and most Linux
  distros. On Windows, install [Git for Windows](https://git-scm.com/downloads/win):
  Claude Code runs hooks in Git Bash, which includes `perl`. To check, run
  `perl -MJSON::PP -e 'print "ok\n"'` in Git Bash.
- If `perl` is missing, the hook doesn't block anything. It shows
  "portfolio-advisor PII guard is OFF" in the transcript on each write instead.
- To disable it: `export PORTFOLIO_ADVISOR_PII_GUARD=off` before starting
  Claude Code (PowerShell: `$env:PORTFOLIO_ADVISOR_PII_GUARD = "off"`).
- It doesn't inspect files written through shell commands. The skill's own
  instructions cover that path.
- It's a pattern match, not a guarantee: account numbers shorter than 8 digits
  or written with spaces get through.

## Disclaimer

This is an educational analysis tool. It is not a registered investment
adviser, a fiduciary, a broker-dealer, or a tax professional, and nothing it
produces is personalized investment, tax, or legal advice. It can be wrong,
including about tax rules that change every year. You are responsible for
your own decisions: verify anything consequential, like large trades, Roth
conversions, or retirement dates, before acting. Provided as is, without
warranty, under the Apache License 2.0.

## License

Apache-2.0 — see [LICENSE](../../LICENSE) and [NOTICE](../../NOTICE).
