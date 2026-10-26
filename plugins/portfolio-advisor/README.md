# portfolio-advisor

A blunt, US-focused portfolio analysis tool for Claude (Desktop and
[Claude Code](https://claude.com/claude-code)) and ChatGPT/Codex.
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
See [Privacy](#privacy).

## Install

Pick the app you already use. The desktop apps come first; the terminal
options are further down.

### Option A: Claude Desktop

Use it in **Cowork** with a folder connected (or in Desktop's Code tab), so the
advisor can keep its profile, ledger, and reviews between sessions. In a
regular chat it can analyze what you attach, but it can't remember anything
from one chat to the next.

- **Plugin (includes the hook):** Customize → Plugins → Add → Add marketplace,
  enter `dretech-ai/dretech-agents`, then install portfolio-advisor from
  Discover. The account-number hook runs in Cowork and the Code tab, not in
  chat.
- **Skill only:** turn on Settings → Capabilities → *Code execution and file
  creation*. Download
  [portfolio-advisor.skill](https://github.com/dretech-ai/dretech-agents/releases/latest/download/portfolio-advisor.skill)
  (or the identical
  [.zip](https://github.com/dretech-ai/dretech-agents/releases/latest/download/portfolio-advisor.zip)),
  then go to Customize → Skills → + Add and upload it. No hook.

### Option B: ChatGPT / Codex desktop app

1. Open **Codex** (in the ChatGPT desktop app, or the Codex app) and go to
   **Plugins**.
2. Click **Add → Add marketplace** and enter `dretech-ai/dretech-agents`.
3. Find **Portfolio Advisor** in the list and click **+** to install it.
4. Start a new chat in a private folder (see [Usage](#usage)) so the advisor
   can keep its files between sessions.
5. The first time it runs, Codex asks you to review and trust the plugin's
   account-number hook. Trust it, or the hook is skipped.

Codex has no `/review`, `/init-portfolio`, or `/update-tax-data` commands.
Just ask: *"set up my portfolio advisor"*, then *"review my portfolio"* or
*"update my tax figures"* (or mention `$portfolio-advisor`). The hook needs `bash` and `perl`.

### Option C: Claude Code (terminal)

Includes the skill, the `/review`, `/init-portfolio`, and `/update-tax-data`
commands, and a hook
that blocks account numbers from being written to files.

```
/plugin marketplace add dretech-ai/dretech-agents
/plugin install portfolio-advisor@dretech-ai
```

### Option D: Codex CLI (terminal)

```bash
codex plugin marketplace add dretech-ai/dretech-agents
codex plugin add portfolio-advisor@dretech-ai
```

Then start `codex` in your finances folder and run `/hooks` once to trust the
account-number hook. The CLI and the desktop app share this install.

### Option E: Standalone skill

Just the skill, with no commands or hook: see the
[repository README](https://github.com/dretech-ai/dretech-agents#readme) for
copy-into-place steps for Claude Code and Codex.

## Usage

Create a private folder for your finances. **Don't put it in a public repo.**
In a desktop app, create the folder (for example `finances` in your home
folder) and connect it: a Cowork folder in Claude Desktop, or the chat's
project folder in Codex. In a terminal:

```bash
mkdir ~/finances && cd ~/finances && claude    # or: codex
```

On Windows (PowerShell):

```powershell
mkdir "$HOME\finances"; cd "$HOME\finances"; claude
```

```
/init-portfolio          # scaffolds folders, then interviews you (retirement year, income, constraints)
                         # drop statements into inbox/
/review                  # full review → reviews/YYYY-MM-DD-<slug>.md
/update-tax-data [year]  # refresh brackets, contribution limits, IRMAA → portfolio/tax-figures.md
```

If another plugin or a built-in command also uses `/review`, call these by
their namespaced names: `/portfolio-advisor:review`,
`/portfolio-advisor:init-portfolio`, and `/portfolio-advisor:update-tax-data`.

Without the plugin, just say *"set up my portfolio advisor"* and then
*"review my portfolio"*.

### Tax figures

Brackets, contribution limits, LTCG thresholds, IRMAA tiers, and the RMD age
change every year, so the advisor doesn't rely on what the model remembers.
It keeps the current year's figures, with a source link for each table, in
`portfolio/tax-figures.md`. Each review checks that file first and refreshes
it when it's missing, from a previous year, or more than six months old.
`/update-tax-data` (or *"update my tax figures"*) forces a refresh.

Where the figures come from, in order:

1. **Live:** IRS.gov, SSA.gov, and CMS.gov, when the app gives the model web
   access.
2. **Bundled:** a copy of the current year's figures that ships with the
   skill and was checked against those sites at release.
3. **You:** otherwise it asks you to paste them, or it labels each figure it
   uses as unverified.

Each review states which tax year and source it used.

```
portfolio/
├── profile.md             # life stage, retirement year, income/spend, constraints
├── target-allocation.md   # target mix + glide path (proposed, then you confirm)
├── ledger.md              # dated snapshots, cash flows, recommendation tracker
└── tax-figures.md         # this year's brackets and limits, with sources
reviews/                   # one dated report per review
inbox/                     # drop new statements here
archive/YYYY-MM-DD/        # processed statements, moved verbatim
```

## Privacy

There is no dretech-ai server: nothing you give the agent is sent to us. Full
policy: [dretech.ai/privacy](https://dretech.ai/privacy.html).

- **Your files stay local.** The profile, ledger, reviews, and archived
  statements are plain files in your folder. Nothing syncs anywhere.
- **What the AI reads goes to its provider.** To analyze a statement, its
  contents are sent to the model's provider, like anything else you share in
  that app: Anthropic for Claude, OpenAI for ChatGPT/Codex, under your
  account's data terms there.
- **`archive/` holds your originals unredacted**, account numbers included.
  Account numbers are kept out of the files the advisor *writes*, not the
  statements you give it. Keep the folder private: not in a public repo, and
  think twice before putting it in iCloud, Dropbox, OneDrive, or another
  synced drive. On Windows, Desktop and Documents are often synced to OneDrive
  by default; a folder directly under your user folder (`$HOME\finances`)
  usually isn't.
- **Tax-figure lookups are generic.** When it refreshes tax figures, the
  advisor searches public government pages using only the year and the figure
  name (for example, "2026 IRA contribution limit"). It never puts your income,
  balances, age, or any account details into a search.
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

The plugin's `PreToolUse` hook checks every file edit inside a portfolio
workspace (`Write`/`Edit` in Claude Code, `apply_patch` in Codex). It
blocks digit runs that look like account numbers (8+ digits, optionally
hyphenated). Dollar amounts, dates, date ranges, and masked numbers
(`••••1234`) are allowed. It only runs when the working directory has
`portfolio/profile.md`, or when the target path is under `portfolio/` or
`reviews/`. It skips files under `travel/`, which belong to the
vacation-planner and its own guard.

- Requires `bash` and `perl`, both preinstalled on macOS and most Linux
  distros. On Windows, install [Git for Windows](https://git-scm.com/downloads/win):
  Claude Code runs hooks in Git Bash, which includes `perl`. To check, run
  `perl -MJSON::PP -e 'print "ok\n"'` in Git Bash.
- If `perl` is missing, the hook doesn't block anything. It shows
  "portfolio-advisor PII guard is OFF" in the transcript on each write instead.
- Codex skips plugin hooks until you trust them: accept the prompt in the
  app, or run `/hooks` in the CLI. Codex runs plugin hooks only in its desktop
  app and CLI, not in ChatGPT on the web.
- To disable it: `export PORTFOLIO_ADVISOR_PII_GUARD=off` before starting
  Claude Code or Codex (PowerShell: `$env:PORTFOLIO_ADVISOR_PII_GUARD = "off"`).
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
