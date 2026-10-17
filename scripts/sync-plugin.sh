#!/usr/bin/env bash
# Copy the standalone skill (source of truth) into the plugin.
#   scripts/sync-plugin.sh          sync
#   scripts/sync-plugin.sh --check  exit 1 if the plugin copy has drifted
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
src="$root/skills/portfolio-advisor/"
dst="$root/plugin/skills/portfolio-advisor/"

if [ "${1:-}" = "--check" ]; then
  if diff -r "$src" "$dst" >/dev/null 2>&1; then
    echo "plugin skill is in sync"
  else
    echo "plugin skill has drifted from skills/ — run scripts/sync-plugin.sh" >&2
    diff -r "$src" "$dst" >&2 || true
    exit 1
  fi
  exit 0
fi

mkdir -p "$dst"
rsync -a --delete --exclude '.DS_Store' "$src" "$dst"
echo "synced skills/portfolio-advisor -> plugin/skills/portfolio-advisor"
