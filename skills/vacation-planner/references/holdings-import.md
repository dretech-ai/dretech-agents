# Importing points, timeshares, prepaid trips, and credits

Run this when the user drops documents in `travel/inbox/`, attaches a file,
pastes text, or types balances in.

1. **Read each document** (PDF, screenshot, CSV, email, pasted text). Identify
   its type: loyalty statement, timeshare contract or annual statement,
   exchange membership, prepaid confirmation, travel credit, certificate.
2. **Extract** the fields below into a working table. Mask member and
   contract numbers to the last 4; drop card numbers, passport numbers, and
   dates of birth entirely.
3. **Confirm with the user** anything ambiguous (use year vs. calendar year,
   which owner's account, whether points are already reserved).
4. **Write** `travel/points.md` or `travel/holdings.md` (templates in
   `../templates/`). Update rows in place; keep an "As of" date and source per
   row. Never delete a holding without asking; set it to `used`, `expired`, or
   `sold`.
5. **Archive** — create `travel/archive/<today>/` and move every processed
   file out of `travel/inbox/` into it, unchanged. `travel/inbox/` should be
   empty (except `.gitkeep`) afterwards.
6. **Report** what was imported and lead with anything expiring within 12
   months.

## Loyalty programs → `points.md`

Program, member ••••last4, balance, elite status (and qualifying progress if
shown), expiration rule (fixed date, or inactivity months), next expiration
date, as-of date, source document. For credit-card points, add transfer
partners only if the user asks; otherwise reference them by program.

## Points-based vacation clubs → `holdings.md` (Marriott Vacation Club, Hilton Grand Vacations, Wyndham, Disney Vacation Club, etc.)

- Club, membership/contract ••••last4, owner names omitted (use "owner 1/2")
- Home resort(s), points per year, **use year** start month
- Current-use-year points: available, reserved, banked in, borrowed
- **Banking deadline** and **borrowing rules**; points expiration date
- **Booking windows:** home-resort window (e.g., 13 months), club-wide window
  (e.g., 12 months), exchange window
- **Annual maintenance fee** (total) and **fee per point** = fee ÷ points;
  dues/taxes due date
- Loan balance and rate, if financed (flag as a debt for the finance check)
- Exchange affiliation (RCI, Interval International) and membership expiry
- Contract dates, rescission period if still open (flag loudly if it is)

## Fixed or floating weeks → `holdings.md`

Resort, unit size, week number (fixed) or season range (floating), deeded or
right-to-use (end year), annual maintenance fee, special assessments, the
booking deadline for floating weeks, and exchange deposit rules and
deadlines (RCI/Interval deposit lead time, deposit expiry). Cost per night =
maintenance fee ÷ 7.

## Prepaid packages and cruises → `holdings.md`

Provider, what's included, travel window or sailing date, amount paid,
balance due and due date, cancellation/change deadlines and penalties,
`Confirmation:` code, expiry of any promo stay certificate.

## Travel credits and certificates → `holdings.md`

Issuer (airline, hotel, card), type (future-flight credit, free-night
certificate with category/points cap, companion certificate, annual travel
credit), value or cap, restrictions (named traveler, route, category),
**expiration date**, and `Confirmation:` / ticket reference if needed to
redeem.

## Before saving

Scan for full member, contract, card, ticket-holder, and passport numbers.
Only `••••last4` and `Confirmation:` lines may carry IDs.
