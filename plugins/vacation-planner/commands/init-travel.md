---
description: Set up travel/ in this folder (profile, points, holdings, trips, inbox) and start the bootstrap interview
---

Use the vacation-planner skill to set up a new travel workspace in the current
directory.

1. If `travel/profile.md` already exists, say so, show its status line, and
   ask whether to resume the interview instead. Never overwrite existing files.
2. Create `travel/`, `travel/trips/`, `travel/inbox/`, and `travel/archive/`.
   Add an empty `.gitkeep` to `trips/`, `inbox/`, and `archive/`.
3. Copy the skill's templates (`templates/profile.md`, `points.md`,
   `holdings.md`) into `travel/`.
4. If this directory is a git repo, check that `.gitignore` excludes
   `travel/`. If it doesn't, warn the user plainly: contracts and loyalty
   statements are personal data, so keep them out of any remote.
5. If `portfolio/profile.md` exists, say the affordability check will use it.
6. Start the bootstrap interview.
