## What and why

<!-- What this changes and why. Link the issue if there is one. -->

## Checklist

- [ ] Edited skills only under `skills/`, then ran `scripts/sync-plugins.sh`
- [ ] Bumped `version` in `plugin.json` **and** `.claude-plugin/marketplace.json` (if an agent changed)
- [ ] `scripts/sync-plugins.sh --check`, `claude plugin validate .`, and `claude plugin validate plugins/<agent>` pass
- [ ] Hook changes: listed the inputs I tested below
- [ ] No real account numbers, statements, or personal financial data anywhere in this PR, including test inputs

## Testing

<!-- What you ran and what you saw. -->
