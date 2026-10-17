# dretech-agents

Agents for [Claude Code](https://claude.com/claude-code) from dretech-ai. Each
agent comes in two forms:

- **Plugin:** the skill plus slash commands and hooks. Install it through the
  Claude Code plugin marketplace.
- **Standalone skill:** just the skill folder. Copy it into `~/.claude/skills/`.

Install guide: [dretech.ai/agents.html](https://dretech.ai/agents.html). No GitHub
account needed.

## Agents

| Agent | What it does | Docs |
|-------|--------------|------|
| **portfolio-advisor** | Blunt, US-focused portfolio analysis tool. Reviews your statements for allocation drift, tax moves (TLH, asset location, Roth conversions), concentration risk, and retirement trajectory. Keeps its memory in local markdown and keeps account numbers out of the files it writes. Not a registered investment adviser. | [README](plugins/portfolio-advisor/README.md) |

## Install

### As plugins (recommended)

```
/plugin marketplace add dretech-ai/dretech-agents
/plugin install portfolio-advisor@dretech-ai
```

### As standalone skills

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

### In Claude Desktop

- **Plugin:** Customize → Plugins → Add → Add marketplace, enter
  `dretech-ai/dretech-agents`, then install the agent from Discover.
- **Skill:** download `<agent>.skill` from the
  [latest release](https://github.com/dretech-ai/dretech-agents/releases/latest),
  then Customize → Skills → + Add → upload it.

See each agent's README for where it runs best.

### Windows

On native Windows, install [Git for Windows](https://git-scm.com/downloads/win)
first: Claude Code runs plugin hooks in Git Bash, and without it they don't run. See each
agent's README for details.

## Repo layout

```
.claude-plugin/marketplace.json   # marketplace: one entry per plugin
skills/<agent>/                   # standalone skill (source of truth)
plugins/<agent>/                  # plugin: .claude-plugin/plugin.json, skills/<agent>/ (synced copy), commands/, hooks/, README.md
scripts/sync-plugins.sh           # copy every skills/<agent> into plugins/<agent>/skills/<agent>
scripts/package-skills.sh         # build dist/<agent>.skill (zip) for upload in the Claude apps
```

## Adding an agent

1. Create `skills/<agent>/SKILL.md`, plus `references/` and `templates/` as needed.
2. Create `plugins/<agent>/.claude-plugin/plugin.json`, then add any
   `commands/`, `hooks/`, and a `README.md`.
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
2. Bump `version` in **both** `plugins/<agent>/.claude-plugin/plugin.json` and
   the agent's entry in `.claude-plugin/marketplace.json`.
3. Users get it with `/plugin marketplace update dretech-ai`.
4. To publish a release, run `scripts/package-skills.sh` and attach
   `dist/<agent>.skill` and `dist/<agent>.zip` to the GitHub release under
   those exact names, so `releases/latest/download/<agent>.skill` always
   points at the newest one.

Edit skills only under `skills/`. The copy under `plugins/` is overwritten by
the sync script. Before committing, `scripts/sync-plugins.sh --check` should
pass.

## License

Apache-2.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
