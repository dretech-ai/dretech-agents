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

## Repo layout

```
.claude-plugin/marketplace.json   # marketplace: one entry per plugin
skills/<agent>/                   # standalone skill (source of truth)
plugins/<agent>/                  # plugin: .claude-plugin/plugin.json, skills/<agent>/ (synced copy), commands/, hooks/, README.md
scripts/sync-plugins.sh           # copy every skills/<agent> into plugins/<agent>/skills/<agent>
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

Edit skills only under `skills/`. The copy under `plugins/` is overwritten by
the sync script. Before committing, `scripts/sync-plugins.sh --check` should
pass.

## License

Apache-2.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
