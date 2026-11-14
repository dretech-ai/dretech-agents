---
description: Set up travel/ in this folder (profile, points, holdings, trips, inbox) and start the bootstrap interview
---

Use the vacation-planner skill to set up a new travel workspace in the current
directory.

1. If `travel/profile.md` already exists, say so, show its status line, and
   ask whether to resume the interview instead. Never overwrite existing files.
2. Confirm the location before creating anything. Show the absolute path of
   the current folder and ask the user to confirm it's their finance folder.
   If a parent folder already has `travel/profile.md` or
   `portfolio/profile.md`, name it and suggest switching there instead. If
   `portfolio/profile.md` isn't here, say the affordability check will be off.
   If `home/profile.md` and `insurance/profile.md` aren't here either, no
   other agent uses this folder, so ask again whether it's the right one. Warn if this is the home folder
   itself or a code repo with source files.
3. Create `travel/`, `travel/trips/`, `travel/inbox/`, and `travel/archive/`.
   Add an empty `.gitkeep` to `trips/`, `inbox/`, and `archive/`.
4. Copy the skill's templates (`templates/profile.md`, `points.md`,
   `holdings.md`) into `travel/`. If there's no `README.md` here, copy
   `templates/workspace-readme.md` as `README.md`.
5. If this directory is a git repo, check that `.gitignore` excludes
   `travel/`. If it doesn't, warn the user plainly: contracts and loyalty
   statements are personal data, so keep them out of any remote.
6. If `portfolio/profile.md` exists, say the affordability check will use it.
7. Start the bootstrap interview.
