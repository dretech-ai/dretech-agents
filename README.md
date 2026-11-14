# dretech-agents

Agents from dretech-ai for Claude (Desktop and [Claude Code](https://claude.com/claude-code))
and ChatGPT/Codex. Each agent comes in two forms:

- **Plugin:** the skill plus slash commands and hooks. Install it from a
  plugin marketplace in Claude Desktop, Claude Code, or Codex.
- **Standalone skill:** just the skill folder, or a `.skill` file to upload.

Install guide: [dretech.ai/agents.html](https://dretech.ai/agents.html). No GitHub
account needed.

## Agents

| Agent | What it does | Docs |
|-------|--------------|------|
| **portfolio-advisor** | Blunt, US-focused portfolio analysis tool. Reviews your statements for allocation drift, tax moves (TLH, asset location, Roth conversions), concentration risk, and retirement trajectory. Keeps its memory in local markdown and keeps account numbers out of the files it writes. Not a registered investment adviser. | [README](plugins/portfolio-advisor/README.md) |
| **vacation-planner** | Blunt, points-aware vacation planner. Plans trips by tier (economy/standard/luxury) and your preferred hotel, airline, and car; values points in cents per point; tracks timeshare contracts, prepaid trips, and travel credits; offers flexible dates; can hand searches to Perplexity; and checks each trip against your portfolio-advisor files. Never books anything. | [README](plugins/vacation-planner/README.md) |
| **home-improvement** | Blunt home improvement planner. Interviews you about each property and its systems and forecasts replacements; imports contractor estimates and inspection reports and compares bids line by line; scores projects as needs or wants in one ranked backlog across your homes; and checks each project against your portfolio-advisor files, with resale value, cost basis, and rebate notes. Never hires or signs anything. | [README](plugins/home-improvement/README.md) |
| **insurance-advisor** | Blunt insurance advisor. Interviews you about your household and policies or reads your declarations pages and quotes; flags under- and over-coverage across home, auto, umbrella, life, disability, health, Medicare, LTC, and specialty lines; tracks premium history, deductible break-evens, and like-for-like quote comparisons; and keeps a renewal calendar that says when to shop. Checks liability against net worth using your portfolio-advisor files and dwelling coverage against your home-improvement files. Never buys, changes, or cancels a policy. | [README](plugins/insurance-advisor/README.md) |
| **communications** | The one agent that talks to Google Workspace. Turns the dates and follow-ups the other agents queue (trip dates, booking and cancellation deadlines, permit inspections, deposit due dates, tax deadlines, questions for a contractor) into Google Calendar events, Google Tasks, and Gmail drafts, after you confirm a preview. Never sends email, never deletes anything. | [README](plugins/communications/README.md) |

## Install

Desktop apps first; most people want one of these.

### In Claude Desktop

- **Plugin:** Customize → Plugins → Add → Add marketplace, enter
  `dretech-ai/dretech-agents`, then install the agent from Discover.
- **Skill:** download `<agent>.skill` from the
  [latest release](https://github.com/dretech-ai/dretech-agents/releases/latest),
  then Customize → Skills → + Add → upload it.

### In the ChatGPT / Codex desktop app

Open Codex → Plugins → Add → Add marketplace, enter
`dretech-ai/dretech-agents`, then click **+** next to the agent. Codex asks you
to trust a plugin's hooks before they run.

### In Claude Code (terminal)

```
/plugin marketplace add dretech-ai/dretech-agents
/plugin install portfolio-advisor@dretech-ai
/plugin install vacation-planner@dretech-ai
/plugin install home-improvement@dretech-ai
/plugin install insurance-advisor@dretech-ai
/plugin install communications@dretech-ai
```

### In Codex CLI (terminal)

```bash
codex plugin marketplace add dretech-ai/dretech-agents
codex plugin add portfolio-advisor@dretech-ai
codex plugin add vacation-planner@dretech-ai
codex plugin add home-improvement@dretech-ai
codex plugin add insurance-advisor@dretech-ai
codex plugin add communications@dretech-ai
```

### As standalone skills

```bash
git clone https://github.com/dretech-ai/dretech-agents.git
cp -r dretech-agents/skills/portfolio-advisor ~/.claude/skills/    # Claude Code
cp -r dretech-agents/skills/vacation-planner ~/.claude/skills/
cp -r dretech-agents/skills/home-improvement ~/.claude/skills/
cp -r dretech-agents/skills/insurance-advisor ~/.claude/skills/
cp -r dretech-agents/skills/communications ~/.claude/skills/
mkdir -p ~/.agents/skills && cp -r dretech-agents/skills/portfolio-advisor ~/.agents/skills/    # Codex
cp -r dretech-agents/skills/vacation-planner ~/.agents/skills/
cp -r dretech-agents/skills/home-improvement ~/.agents/skills/
cp -r dretech-agents/skills/insurance-advisor ~/.agents/skills/
cp -r dretech-agents/skills/communications ~/.agents/skills/
```

On Windows (PowerShell):

```powershell
git clone https://github.com/dretech-ai/dretech-agents.git
New-Item -ItemType Directory -Force "$HOME\.claude\skills" | Out-Null
Copy-Item -Recurse dretech-agents\skills\portfolio-advisor "$HOME\.claude\skills\"
Copy-Item -Recurse dretech-agents\skills\vacation-planner "$HOME\.claude\skills\"
Copy-Item -Recurse dretech-agents\skills\home-improvement "$HOME\.claude\skills\"
Copy-Item -Recurse dretech-agents\skills\insurance-advisor "$HOME\.claude\skills\"
Copy-Item -Recurse dretech-agents\skills\communications "$HOME\.claude\skills\"
```

See each agent's README for where it runs best.

### Windows

On native Windows, install [Git for Windows](https://git-scm.com/downloads/win)
first: Claude Code runs plugin hooks in Git Bash, and without it they don't run. See each
agent's README for details.

## Repo layout

```
.claude-plugin/marketplace.json   # marketplace: one entry per plugin (Codex reads this too)
skills/<agent>/                   # standalone skill (source of truth)
plugins/<agent>/                  # plugin: .claude-plugin/plugin.json, .codex-plugin/plugin.json,
                                  #   skills/<agent>/ (synced copy), commands/, hooks/, README.md
scripts/sync-plugins.sh           # copy every skills/<agent> into plugins/<agent>/skills/<agent>;
                                  #   --check also verifies the shared files are identical
scripts/package-skills.sh         # build dist/<agent>.skill (zip) for upload in the Claude apps
```

## Adding an agent

1. Create `skills/<agent>/SKILL.md`, plus `references/` and `templates/` as needed.
2. Create `plugins/<agent>/.claude-plugin/plugin.json` and
   `plugins/<agent>/.codex-plugin/plugin.json`, then add any `commands/`,
   `hooks/`, and a `README.md`. Codex ignores `commands/`, and its hook
   handlers take a single `command` string (no `args`), so point the Codex
   manifest's `hooks` at a separate file such as `hooks/codex-hooks.json`.
3. Add an entry to `.claude-plugin/marketplace.json` with
   `"source": "./plugins/<agent>"`.
4. Run `scripts/sync-plugins.sh`, then validate:
   `claude plugin validate . && claude plugin validate plugins/<agent>`.
5. Add a row to the Agents table above.

## Releasing a change

Installed plugins only update when the version number changes. For any change
to an agent:

1. Edit under `skills/<agent>/` (never the copy under `plugins/`), then run
   `scripts/sync-plugins.sh`.
2. Bump `version` in all three: `plugins/<agent>/.claude-plugin/plugin.json`,
   `plugins/<agent>/.codex-plugin/plugin.json`, and the agent's entry in
   `.claude-plugin/marketplace.json`.
3. Users get it with `/plugin marketplace update dretech-ai` (Claude Code) or
   `codex plugin marketplace upgrade dretech-ai` (Codex).
4. To publish a release, run `scripts/package-skills.sh` and attach
   `dist/<agent>.skill` and `dist/<agent>.zip` to the GitHub release under
   those exact names, so `releases/latest/download/<agent>.skill` always
   points at the newest one.

Edit skills only under `skills/`. The copy under `plugins/` is overwritten by
the sync script. Before committing, `scripts/sync-plugins.sh --check` should
pass.

## License

Apache-2.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
