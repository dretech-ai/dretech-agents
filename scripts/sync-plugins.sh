#!/usr/bin/env bash
# Copy each standalone skill (source of truth) into its plugin.
# Every skills/<name>/ with a matching plugins/<name>/ is synced to
# plugins/<name>/skills/<name>/.
#   scripts/sync-plugins.sh          sync all
#   scripts/sync-plugins.sh --check  exit 1 if any plugin copy has drifted
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
check=false
[ "${1:-}" = "--check" ] && check=true
status=0

for skill_dir in "$root"/skills/*/; do
  name="$(basename "$skill_dir")"
  plugin_dir="$root/plugins/$name"
  [ -d "$plugin_dir" ] || { echo "skip $name (no plugins/$name)"; continue; }
  dst="$plugin_dir/skills/$name/"

  if $check; then
    if diff -r -x .DS_Store "$skill_dir" "$dst" >/dev/null 2>&1; then
      echo "ok    $name"
    else
      echo "DRIFT $name — run scripts/sync-plugins.sh" >&2
      status=1
    fi
  else
    mkdir -p "$dst"
    rsync -a --delete --exclude '.DS_Store' "$skill_dir" "$dst"
    echo "synced $name"
  fi
done
exit $status
