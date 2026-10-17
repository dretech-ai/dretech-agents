# claude-agents

Agents for [Claude Code](https://claude.com/claude-code) from dretech-ai. Each
agent comes in two forms:

- **Plugin:** the skill plus slash commands and hooks. Install it through the
  Claude Code plugin marketplace.
- **Standalone skill:** just the skill folder. Copy it into `~/.claude/skills/`.

## Agents

| Agent | What it does | Docs |
|-------|--------------|------|
| **portfolio-advisor** | Blunt, US-focused financial advisor. Reviews your statements for allocation drift, tax moves (TLH, asset location, Roth conversions), concentration risk, and retirement trajectory. Keeps its memory in local markdown and blocks account numbers from being written to disk. | [README](plugins/portfolio-advisor/README.md) |

## Install

### As plugins (recommended)

```
/plugin marketplace add dretech-ai/claude-agents
/plugin install portfolio-advisor@dretech-ai
```

### As standalone skills

```bash
git clone https://github.com/dretech-ai/claude-agents.git
cp -r claude-agents/skills/portfolio-advisor ~/.claude/skills/
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

Edit skills only under `skills/`. The copy under `plugins/` is overwritten by
the sync script. Before committing, `scripts/sync-plugins.sh --check` should
pass.

## License

MIT
