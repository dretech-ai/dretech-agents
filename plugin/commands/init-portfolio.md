---
description: Set up portfolio/, reviews/, inbox/, archive/ in this folder and start the bootstrap interview
---

Use the portfolio-advisor skill to set up a new portfolio workspace in the
current directory.

1. If `portfolio/profile.md` already exists, say so, show its status line, and
   ask whether to resume the interview instead. Never overwrite existing files.
2. Create `portfolio/`, `reviews/`, `inbox/`, and `archive/`. Add an empty
   `.gitkeep` to `reviews/`, `inbox/`, and `archive/`.
3. Copy the skill's templates (`templates/profile.md`, `target-allocation.md`,
   `ledger.md`) into `portfolio/`.
4. If this directory is a git repo, check that `.gitignore` excludes
   `portfolio/`, `reviews/`, `inbox/`, and `archive/`. If it doesn't, warn the
   user plainly: this is personal financial data, so keep it out of any remote.
5. Start the bootstrap interview.
