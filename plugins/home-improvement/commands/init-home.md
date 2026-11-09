---
description: Set up home/ in this folder (profile, backlog, properties, projects, inbox) and start the property interview
---

Use the home-improvement skill to set up a new home workspace in the current
directory.

1. If `home/profile.md` already exists, say so, show its status line, and ask
   whether to resume the interview or add another property instead. Never
   overwrite existing files.
2. Create `home/`, `home/properties/`, `home/projects/`, `home/inbox/`, and
   `home/archive/`. Add an empty `.gitkeep` to `projects/`, `inbox/`, and
   `archive/`.
3. Copy the skill's templates (`templates/profile.md`, `backlog.md`) into
   `home/`. Per-property files are created during the interview, once the
   properties are named.
4. If this directory is a git repo, check that `.gitignore` excludes `home/`.
   If it doesn't, warn the user plainly: estimates and inspection reports
   carry addresses and personal data, so keep them out of any remote.
5. If `portfolio/profile.md` exists, say the affordability check will use it.
6. Mention that an inspection report dropped in `home/inbox/` answers most of
   the systems questions.
7. Start the bootstrap interview.
