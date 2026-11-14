# insurance-advisor

A blunt insurance advisor for Claude (Desktop and
[Claude Code](https://claude.com/claude-code)) and ChatGPT/Codex. Tell it about
your household, give it your declarations pages, renewal notices, and quotes,
and it:

1. **Knows what you carry** — an interview (or your dec pages) builds one
   register of every policy: home, condo, renters, landlord, auto, umbrella,
   life, disability, health, Medicare, long-term care, flood, earthquake,
   valuables, pet, travel, boat/RV. Each policy has its own file with limits,
   deductibles, endorsements, premium history, and quotes.
2. **Finds under-coverage** — liability limits against your net worth,
   dwelling coverage against local rebuild cost, roof settlement terms, water
   backup, flood and earthquake exposure, life and disability needs, Medicare
   enrollment windows. Every gap gets a severity and the dollars it leaves
   uncovered.
3. **Finds over-coverage** — deductibles so low they're buying
   dollar-for-dollar coverage, collision on an old car, gap coverage you no
   longer need, narrow policies (accidental death, credit life, cancer plans)
   that duplicate better coverage, card benefits you're paying for twice.
4. **Checks the price** — premium history and year-over-year changes, cost
   per $1,000 of coverage against sourced state benchmarks, deductible
   break-even, bundle math against the best unbundled pair, missed discounts,
   and a like-for-like quote comparison that prices out lower limits before
   calling a quote cheaper.
5. **Tells you when to shop** — renewal jumps, three years since you last
   shopped, a claim aging off your record, a new roof, a teen driver, turning
   65 — with a renewal calendar and shop-by dates.

It never contacts an insurer or agent and never buys, changes, or cancels a
policy. It gives you the findings, the quote spec to hand to agents, and the
steps in order; you decide and sign.

## Install

Same options as the portfolio-advisor; swap the name.

- **Claude Desktop:** Customize → Plugins → Add → Add marketplace,
  `dretech-ai/dretech-agents`, install insurance-advisor from Discover. Use it
  in Cowork with your finances folder connected. Skill only: download
  [insurance-advisor.skill](https://github.com/dretech-ai/dretech-agents/releases/latest/download/insurance-advisor.skill)
  and upload it under Customize → Skills (no hook).
- **ChatGPT / Codex desktop app:** Plugins → Add → Add marketplace,
  `dretech-ai/dretech-agents`, click **+** next to Insurance Advisor, and trust
  its hook when asked.
- **Claude Code:**
  ```
  /plugin marketplace add dretech-ai/dretech-agents
  /plugin install insurance-advisor@dretech-ai
  ```
- **Codex CLI:**
  ```bash
  codex plugin marketplace add dretech-ai/dretech-agents
  codex plugin add insurance-advisor@dretech-ai
  ```
- **Standalone skill:** copy `skills/insurance-advisor` to `~/.claude/skills/`
  (Claude Code) or `~/.agents/skills/` (Codex).

## Usage

Run it in the same private folder as your portfolio-advisor and
home-improvement planner, so it can read your finances and property facts:

```
/init-insurance            # scaffolds insurance/, then interviews you (household, assets, policies)
                           # drop dec pages, renewal notices, quotes into insurance/inbox/
/import-insurance          # imports them → policy files and the register
/review-coverage [policy]  # gaps, over-coverage, price, when to shop → insurance/reviews/
/renewals [days]           # what renews in the next 90 days, what to shop, shop-by dates
```

Always open it from that folder. It creates files only in a folder that
already holds a workspace (its own or a sibling agent's). Anywhere else it
stops and asks, so a question asked from the wrong folder doesn't start a
second set of folders.

In Codex, or without the plugin, just ask: *"set up my insurance advisor"*,
*"read the dec pages in my inbox"*, *"am I under-insured?"*, *"should I shop
my auto insurance?"*.

```
insurance/
├── profile.md             # household, drivers, assets, risk factors, preferences
├── policies.md            # register, total premium, renewal & shop calendar, open gaps
├── policies/              # one file per policy: coverages, premium history, quotes
├── reviews/               # dated coverage reviews
├── inbox/                 # drop documents here
└── archive/YYYY-MM-DD/    # processed documents, moved verbatim
```

### The portfolio and home links

When `portfolio/` exists, the advisor reads your profile, latest ledger
snapshot, and tax figures (read-only). It compares liability and umbrella
limits with your net worth, every deductible (including percentage wind and
earthquake deductibles, in dollars) with your emergency fund, and life and
disability coverage with your income and horizon. When a new policy or a
renewal changes your annual cost by more than $500, it asks before adding one
line to `portfolio/profile.md` under *Known upcoming cash events*. That line
is the only thing it ever writes in `portfolio/`.

When `home/` exists, it reads `home/profile.md` and `home/properties/`
(read-only) for year built, square feet, use, mortgage, roof age and
material, and system ages, which drive dwelling coverage, roof settlement,
and discounts. It never writes in `home/`, and it never reads `travel/`.

### Communications

When the communications agent is set up, the advisor offers to queue
shop-by dates, non-renewal deadlines, open-enrollment and Medicare windows as
Google Tasks, and a re-quote request to your agent as a Gmail draft. Nothing
is queued without your yes, and drafts are never sent for you.

## Privacy

There is no dretech-ai server: nothing you give the agent is sent to us. Full
policy: [dretech.ai/privacy](https://dretech.ai/privacy.html).

- **Your files stay local.** Everything is plain markdown in your folder.
- **What the AI reads goes to its provider** (Anthropic for Claude, OpenAI for
  ChatGPT/Codex), under your account's data terms. That includes your dec
  pages and any health details you share.
- **Labels, not numbers.** Policy numbers, member and group IDs, Medicare
  numbers, VINs, and driver's license numbers are never written. Policies are
  labels ("State Farm auto"), vehicles are year/make/model, properties are a
  nickname plus city, state, and ZIP.
- **Searches are generic.** Queries hold only the coverage type and your
  state or ZIP, never names, addresses, or anything from `portfolio/`.
- **`insurance/archive/` holds your originals unredacted**, policy numbers
  and addresses included. Keep the folder private.
- **The hook makes no network calls.** `hooks/pii-guard.sh` reads the pending
  write from stdin and exits.

## The PII guard

The plugin's `PreToolUse` hook checks file edits in an insurance workspace
(cwd with `insurance/profile.md`, or a path under `insurance/`). It blocks
8+ digit runs (optionally hyphenated), space-grouped card numbers,
17-character VINs, 11-character Medicare Beneficiary Identifiers, and
letter-and-digit IDs with 6+ digits (most policy, member, and group numbers).
Lines labeled `Quote #:`, `Claim #:`, `License:`, `Confirmation:`, or `NAIC:`
are allowed, since you need those to reference a quote or claim or check an
agent or carrier. Dates, date ranges, dollar amounts, and policy forms
(HO-3, DP-3) are allowed.

- Requires `bash` and `perl` (on Windows, install Git for Windows).
- Disable with `export INSURANCE_ADVISOR_PII_GUARD=off`.
- It's a pattern match: street addresses, short policy numbers, and
  shell-written files aren't caught. The skill's own instructions cover those.

## Disclaimer

This is a planning tool. It is not a licensed insurance agent, broker, or
financial adviser, and it never contacts an insurer, or buys, changes, or
cancels a policy. Premiums, coverage terms, and rules vary by state and
change often; confirm every change with your agent or insurer, and never
cancel a policy until its replacement is in force. The finance checks are
arithmetic on your own numbers, not investment advice. Provided as is,
without warranty, under the Apache License 2.0.

## License

Apache-2.0 — see [LICENSE](../../LICENSE) and [NOTICE](../../NOTICE).
