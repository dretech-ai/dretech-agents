---
description: Plan a trip — tier, dates and flexibility, points and holdings, search, cost, and affordability → travel/trips/
argument-hint: "[destination or trip file]"
---

Use the vacation-planner skill to plan a trip.

Trip: $ARGUMENTS
If this names an existing file in `travel/trips/`, revisit that plan. If it's a
destination, start the trip interview with it. If nothing was given, start the
trip interview from scratch (offer to suggest destinations).

If `travel/profile.md` doesn't exist, tell the user to run `/init-travel`
first and stop.

Follow the skill's trip workflow end to end: load state, holdings-first check,
flexibility options, search (Perplexity if connected), cost model,
financial impact, and write `travel/trips/YYYY-MM-<slug>.md`. Never book
anything, and never write member, contract, or card numbers in full.
