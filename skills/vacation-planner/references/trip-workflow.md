# Trip workflow

Run this when the user asks to plan a trip.

1. **Load state** — read `travel/profile.md`, `points.md`, `point-values.md`,
   `holdings.md`, and any open plans in `travel/trips/`. If
   `portfolio/profile.md` exists, read it and `portfolio/ledger.md` too (see
   [finance-link.md](finance-link.md)). Refresh `point-values.md` first if
   it's missing or stale ([point-data.md](point-data.md)).
2. **Bootstrap if needed** — if the travel profile is empty or placeholders
   only, run [bootstrap-interview.md](bootstrap-interview.md) first.
3. **Trip interview** — one batch:
   - **Destination**, or "suggest one" (then ask for vibe, max flight time,
     and climate, and propose 2–3 that fit the tier and holdings — a
     destination where they own timeshare inventory or have a certificate
     goes first).
   - **Purpose / vibe:** beach, city, ski, family, adventure, cruise, event.
   - **Dates:** one of
     - **Fixed** (exact dates),
     - **Flexible ±N days** around a date,
     - **Window** (a month or a range; give a length),
     - **Best time** (let the planner pick by season, price, and crowds).
   - **Length** (nights), **travelers** if different from the profile.
   - **Tier override** and **budget cap** for this trip, if any.
4. **Holdings-first check** — before searching, list what could cover part of
   the trip:
   - Timeshare: does the club have inventory at or near the destination? Is
     the date inside the booking window (home-resort vs. club/exchange
     window)? Are there enough points in the current use year, or would
     banking/borrowing be needed (and by when)?
   - Prepaid packages, cruises, credits, certificates that fit the dates or
     destination, and their expirations and restrictions.
   - Points balances that could cover flights or hotel, including transfer
     partners of card points.
   Flag anything expiring before or soon after the trip.
5. **Flexibility options** — unless the dates are fixed *and* the user said no
   alternatives, build a short grid:
   - Shifted dates: ±1–3 days, weekday vs. weekend departure, Tues/Wed returns.
   - Season: peak vs. shoulder for the destination, with the crowd and
     weather tradeoff in one line.
   - Alternate airports at either end (within the drive time the user gave).
   - Length variants (one night shorter or longer if it changes the price
     tier, the timeshare points chart, or a 5th-night-free award).
   - Timeshare/award booking-window open dates: "home-resort window opens
     2027-01-14 for these dates — book that day."
6. **Search** — follow [search.md](search.md). Search the recommended dates
   plus the best 2–3 flexibility variants, not every combination.
7. **Cost model** — per component (air, lodging, car, extras such as resort
   fees, parking, baggage):

   | Component | Option | Cash price | Points | cpp achieved | Award taxes/fees | Out-of-pocket |
   |-----------|--------|-----------|--------|--------------|------------------|---------------|

   - **cpp achieved** = (cash price − award taxes/fees) ÷ points × 100.
     Compare to the program's value in `point-values.md`. Below that value →
     recommend cash unless the points are expiring or the user has no other
     use for them.
   - **Timeshare stays:** cost per night = (points used × maintenance fee per
     point) ÷ nights, plus any reservation/exchange fee. Sunk-cost note: the
     maintenance fee is owed either way; unused points that would expire have
     zero alternative value.
   - **Out-of-pocket** = cash actually spent on this trip (excludes points,
     already-paid timeshare fees, and prepaid amounts). Also show the
     **points opportunity cost** (points × cpp) on a separate line.
   - Taxes, resort fees, and baggage fees go in; missing ones are marked
     missing, not guessed.
8. **Financial impact** — follow [finance-link.md](finance-link.md).
9. **Write the plan** to `travel/trips/YYYY-MM-<slug>.md` (YYYY-MM = trip start)
   using [../templates/trip.md](../templates/trip.md). Status starts at
   `idea`. Include: the recommended itinerary, at most one alternative, the
   flexibility grid, the cost table, the financial-impact block, booking steps
   in order (book the scarcest piece first — usually award space or the
   timeshare window), and **Verify before booking:** lines.
10. **Update state** — if the plan would use points, credits, certificates, or
    timeshare points, note them as *earmarked* (not spent) in `points.md` /
    `holdings.md` with the trip file name. When the user says they booked,
    set status `booked`, record confirmation codes under `Confirmation:` lines,
    move earmarked to spent, and follow the cash-event step in
    [finance-link.md](finance-link.md).

## Revisiting a trip

When the user returns to an existing plan: re-run steps 6–8 if it's still
`idea`/`planned`; if `booked`, check for price drops on refundable components,
expiring holds, and the timeshare/airline schedule-change rules. After the
trip, set status `done` and ask for the actual spend so the next estimate is
better.

## Before saving any file

Scan the content for member, contract, card, passport, and Known Traveler
numbers. Confirmation codes are fine on `Confirmation:` lines. Mask everything
else to the last 4 or drop it.
