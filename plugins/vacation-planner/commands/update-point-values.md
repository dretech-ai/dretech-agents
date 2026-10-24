---
description: Refresh travel/point-values.md with current published cents-per-point valuations
---

Use the vacation-planner skill to refresh the workspace's point values.

If `travel/` doesn't exist, tell the user to run `/init-travel` first and
stop.

Follow the skill's point-data procedure (`references/point-data.md`) end to
end, even if `travel/point-values.md` looks current: collect a published value
for every program in `travel/points.md` plus the common ones, keep user
overrides, fall back to the bundled values or ask the user if you can't
search, write `travel/point-values.md`, and report what changed. Searches
contain only program names, never anything about the user.
