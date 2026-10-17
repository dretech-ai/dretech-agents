# portfolio-advisor

A blunt, US-focused personal financial advisor for [Claude Code](https://claude.com/claude-code).
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

**No account access, no cloud sync.** It only reads the documents you give it,
and it never writes account numbers to disk.

## Install

### Option A: Plugin (recommended)

Includes the skill, the `/review` and `/init-portfolio` commands, and a hook
that blocks account numbers from being written to files.

```
/plugin marketplace add dretech-ai/claude-agents
/plugin install portfolio-advisor@dretech-ai
```

### Option B: Standalone skill

Just the skill, with no commands or hook:

```bash
git clone https://github.com/dretech-ai/claude-agents.git
cp -r claude-agents/skills/portfolio-advisor ~/.claude/skills/
```

## Usage

Create a private folder for your finances. **Don't put it in a public repo.**

```bash
mkdir ~/finances && cd ~/finances && claude
```

```
/init-portfolio          # scaffolds folders, then interviews you (retirement year, income, constraints)
                         # drop statements into inbox/
/review                  # full review → reviews/YYYY-MM-DD-<slug>.md
```

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
optionally hyphenated). Dollar amounts, dates, and masked numbers
(`••••1234`) are allowed. It only runs when the working directory has
`portfolio/profile.md`, or when the target path is under `portfolio/` or
`reviews/`.

- Requires `perl` (preinstalled on macOS and most Linux distros).
- To disable it: `export PORTFOLIO_ADVISOR_PII_GUARD=off`
- It doesn't inspect files written through shell commands. The skill's own
  instructions cover that path.

## Disclaimer

This is an educational tool, not a fiduciary or a registered investment
adviser. It can be wrong. Double-check anything consequential, like large
trades, Roth conversions, or retirement dates, before acting.

## License

MIT — see [LICENSE](../../LICENSE).
