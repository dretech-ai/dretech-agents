---
description: Set up portfolio/, reviews/, inbox/, archive/ in this folder and start the bootstrap interview
---

Use the portfolio-advisor skill to set up a new portfolio workspace in the
current directory.

1. If `portfolio/profile.md` already exists, say so, show its status line, and
   ask whether to resume the interview instead. Never overwrite existing files.
2. Confirm the location before creating anything. Show the absolute path of
   the current folder and ask the user to confirm it's their finance folder.
   If a parent folder already has `portfolio/profile.md`, name it and suggest
   switching there instead. Warn if this is the home folder itself or a code
   repo with source files.
3. Create `portfolio/`, `reviews/`, `inbox/`, and `archive/`. Add an empty
   `.gitkeep` to `reviews/`, `inbox/`, and `archive/`.
4. Copy the skill's templates (`templates/profile.md`, `target-allocation.md`,
   `ledger.md`) into `portfolio/`. If there's no `README.md` here, copy
   `templates/workspace-readme.md` as `README.md`.
5. If this directory is a git repo, check that `.gitignore` excludes
   `portfolio/`, `reviews/`, `inbox/`, and `archive/`. If it doesn't, warn the
   user plainly: this is personal financial data, so keep it out of any remote.
6. Start the bootstrap interview.
