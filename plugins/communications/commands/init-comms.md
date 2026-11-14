---
description: Set up comms/ in this folder (profile, log, outbox) and connect Google Calendar, Tasks, and Gmail drafts
---

Use the communications skill to set up a new communications workspace in the
current directory.

1. If `comms/profile.md` already exists, say so, show its status line and the
   connectors table, and offer to re-check connectors or edit defaults
   instead. Never overwrite existing files.
2. Confirm the location before creating anything. Show the absolute path of
   the current folder and ask the user to confirm it's the folder their other
   dretech-ai agents use. If a parent folder already has `comms/profile.md`
   or a sibling profile (`portfolio/`, `travel/`, `home/`), name it and
   suggest switching there instead. If no sibling profile is here, say the
   other agents won't queue anything until they're set up in this folder,
   and ask again whether it's the right one. Warn if this is the home folder
   itself or a code repo with source files.
3. Create `comms/`, `comms/outbox/`, and `comms/done/`. Add an empty
   `.gitkeep` to `outbox/` and `done/`.
4. Copy the skill's templates (`templates/profile.md`, `templates/log.md`)
   into `comms/`. If there's no `README.md` here, copy
   `templates/workspace-readme.md` as `README.md`.
5. If this directory is a git repo, check that `.gitignore` excludes
   `comms/`. If it doesn't, warn the user: drafts and the log name the
   people and businesses they deal with.
6. Run the first-session setup (`references/bootstrap-interview.md`),
   including the connector check.
