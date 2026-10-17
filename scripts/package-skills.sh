#!/usr/bin/env bash
# Package each standalone skill as dist/<name>.skill for upload in the Claude
# apps (Settings > Customize > Skills > Add). A .skill file is a zip whose top
# level is the skill folder (<name>/SKILL.md), matching anthropics/skills'
# package_skill.py. LICENSE and NOTICE are added inside the folder.
#   scripts/package-skills.sh          package all skills into dist/
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
dist="$root/dist"
mkdir -p "$dist"

for skill_dir in "$root"/skills/*/; do
  name="$(basename "$skill_dir")"
  [ -f "$skill_dir/SKILL.md" ] || { echo "skip $name (no SKILL.md)"; continue; }
  stage="$(mktemp -d)"
  cp -R "$skill_dir" "$stage/$name"
  cp "$root/LICENSE" "$root/NOTICE" "$stage/$name/"
  out="$dist/$name.skill"
  rm -f "$out"
  (cd "$stage" && zip -qrX "$out" "$name" -x '*.DS_Store')
  rm -rf "$stage"
  echo "packaged $out"
done
