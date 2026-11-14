---
description: Show policies renewing in the next 90 days (or a given window), what to shop, and shop-by dates
argument-hint: "[days]"
---

Use the insurance-advisor skill to check upcoming renewals.

Window: $ARGUMENTS days (90 if empty).

If `insurance/profile.md` doesn't exist, tell the user to run
`/init-insurance` first and stop.

Load `insurance/policies.md` and the policy files. Import anything in
`insurance/inbox/` first; renewal notices change the answer. List every
policy renewing in the window, plus any non-renewal effective date and any
time-boxed window in it (open enrollment, Medicare AEP Oct 15 – Dec 7, a
Medigap open-enrollment end, a term-conversion deadline). For each, give the
decision from `references/shopping-triggers.md` (Shop now, Shop at renewal
with a shop-by date, Re-check after an event, or Hold) and the one-line
reason. Lead with non-renewals and anything already past its shop-by date.
Update the calendar in `insurance/policies.md`. If `comms/profile.md`
exists, offer to queue the shop-by dates and deadlines as Google Tasks per
`references/comms-handoff.md`; otherwise list them so the user can add them
by hand.
