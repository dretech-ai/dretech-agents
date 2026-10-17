# Contributing

Issues and pull requests are welcome.

## Reporting a problem

Open an issue with the agent name, what you asked, and what went wrong.
**Never paste real statements, account numbers, or other personal financial
data** into an issue or PR. Use made-up numbers.

## Making a change

The README has the full steps:

- [Adding an agent](README.md#adding-an-agent)
- [Releasing a change](README.md#releasing-a-change)

In short:

1. Edit skills only under `skills/<agent>/`. The copy under `plugins/` is
   generated; run `scripts/sync-plugins.sh` to update it.
2. Bump `version` in both `plugins/<agent>/.claude-plugin/plugin.json` and
   `.claude-plugin/marketplace.json`. Installed plugins only update when it
   changes.
3. Before opening a PR, these should pass:

   ```bash
   scripts/sync-plugins.sh --check
   claude plugin validate .
   claude plugin validate plugins/<agent>
   ```

If you change a hook, describe the inputs you tested it with in the PR.

## License

By contributing, you agree your contributions are licensed under the
[MIT License](LICENSE).
