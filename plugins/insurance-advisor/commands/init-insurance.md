---
description: Set up insurance/ in this folder (profile, policy register, policies, reviews, inbox) and start the household and policy interview
---

Use the insurance-advisor skill to set up a new insurance workspace in the
current directory.

1. If `insurance/profile.md` already exists, say so, show its status line,
   and ask whether to resume the interview or add policies instead. Never
   overwrite existing files.
2. Confirm the location before creating anything. Show the absolute path of
   the current folder and ask the user to confirm it's their finance folder.
   If a parent folder already has `insurance/profile.md` or
   `portfolio/profile.md`, name it and suggest switching there instead. If
   `portfolio/profile.md` isn't here, say the net-worth and emergency-fund
   checks will use rough numbers from the interview. If `home/profile.md`,
   `travel/profile.md`, and `comms/profile.md` aren't here either, no other
   agent uses this folder, so ask again whether it's the right one. Warn if
   this is the home folder itself or a code repo with source files.
3. Create `insurance/`, `insurance/policies/`, `insurance/reviews/`,
   `insurance/inbox/`, and `insurance/archive/`. Add an empty `.gitkeep` to
   `policies/`, `reviews/`, `inbox/`, and `archive/`.
4. Copy the skill's templates (`templates/profile.md`, `policies.md`) into
   `insurance/`. Per-policy files are created during the interview or on
   import. If there's no `README.md` here, copy
   `templates/workspace-readme.md` as `README.md`.
5. If this directory is a git repo, check that `.gitignore` excludes
   `insurance/`. If it doesn't, warn the user plainly: declarations pages
   carry policy numbers, addresses, VINs, and health details, so keep them
   out of any remote.
6. Say which sibling checks are on: `portfolio/profile.md` (liability vs. net
   worth, deductibles vs. emergency fund) and `home/profile.md` (dwelling vs.
   rebuild cost, roof and system ages).
7. Mention that declarations pages dropped in `insurance/inbox/` answer most
   of the policy questions.
8. Start the bootstrap interview.
