---
description: Set up home/ in this folder (profile, backlog, properties, projects, inbox) and start the property interview
---

Use the home-improvement skill to set up a new home workspace in the current
directory.

1. If `home/profile.md` already exists, say so, show its status line, and ask
   whether to resume the interview or add another property instead. Never
   overwrite existing files.
2. Confirm the location before creating anything. Show the absolute path of
   the current folder and ask the user to confirm it's their finance folder.
   If a parent folder already has `home/profile.md` or
   `portfolio/profile.md`, name it and suggest switching there instead. If
   `portfolio/profile.md` isn't here, say the affordability check will be off.
   If `travel/profile.md` isn't here either, no other agent uses this folder,
   so ask again whether it's the right one. Warn if this is the home folder
   itself or a code repo with source files.
3. Create `home/`, `home/properties/`, `home/projects/`, `home/inbox/`, and
   `home/archive/`. Add an empty `.gitkeep` to `projects/`, `inbox/`, and
   `archive/`.
4. Copy the skill's templates (`templates/profile.md`, `backlog.md`) into
   `home/`. Per-property files are created during the interview, once the
   properties are named. If there's no `README.md` here, copy
   `templates/workspace-readme.md` as `README.md`.
5. If this directory is a git repo, check that `.gitignore` excludes `home/`.
   If it doesn't, warn the user plainly: estimates and inspection reports
   carry addresses and personal data, so keep them out of any remote.
6. If `portfolio/profile.md` exists, say the affordability check will use it.
7. Mention that an inspection report dropped in `home/inbox/` answers most of
   the systems questions.
8. Start the bootstrap interview.
