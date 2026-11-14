---
from: communications              # portfolio-advisor | vacation-planner | home-improvement | communications
type: event                       # event | task | draft
source:                           # path to the plan or review this came from, or "user"
created: YYYY-MM-DD
status: pending
replaces:
# --- event ---
title:
all_day: true
start:                            # YYYY-MM-DD, or YYYY-MM-DDTHH:MM with time_zone
end:                              # all-day: last day, inclusive
time_zone:
location:                         # city or business/venue name; never the user's street address
reminders: []
guests: []
# --- task ---
# title:
# due: YYYY-MM-DD
# list:
# --- draft ---
# to: []
# subject:
# thread_hint:
---

Description, task notes, or email body.
