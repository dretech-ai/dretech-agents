# First-session bootstrap interview

Run this when `travel/profile.md` is missing or still has placeholders. Ask
in one or two batches, not one question at a time. Accept rough answers —
precision can come later.

## Disclosure (say this first, once)

> Before we start: this is a planning tool, not a travel agent, and it never
> books or redeems anything. Prices and award availability change constantly,
> so verify every price on the airline, hotel, or club site before booking.
> Your files stay in this folder, but anything I read, including your
> contracts and statements, is sent to the AI provider you're using (Anthropic
> for Claude, OpenAI for ChatGPT/Codex) under your account's data terms. If you
> connect Perplexity for searches, the search queries (destination, dates,
> brands — never your names or member numbers) go to Perplexity too.
> `travel/archive/` keeps your original documents unredacted, member and
> contract numbers included, so keep this folder private and out of any
> public repo or shared cloud drive.

Then continue with the questions.

## Batch 1 — how you travel

- **Travel tier:** economy, standard, or luxury. Explain briefly:
  - **Economy** — basic/main cabin, 2–3★ or vacation rental, economy car;
    cheapest reasonable option wins.
  - **Standard** — main cabin with seat selection (premium economy on 6h+
    flights if cheap), 3–4★ or brand mid-tier, mid-size car.
  - **Luxury** — business/first on long-haul, premium cabin domestic, 5★ or
    brand top tier, premium or SUV car.
- **Travelers:** number of adults and children (ages, not names), and
  whether that's the usual party.
- **Home airport(s):** primary and any you'd drive to (with drive time).
- **Preferred hotel brand(s)**, **airline(s)**, and **rental car company**,
  with elite status in each, if any.

## Batch 2 — points and holdings

- **Loyalty programs and balances:** hotel, airline, credit-card points
  (Amex MR, Chase UR, Capital One, Citi, Bilt, etc.), rental car. Offer two
  ways: drop statements or screenshots in `travel/inbox/`, or type them in.
- **Timeshare / vacation club:** club name, points or week, use year,
  maintenance fee. Ask them to drop the contract in `travel/inbox/` if they
  have it.
- **Prepaid trips, cruises, travel credits, free-night certificates** — with
  expiration dates.
- **Travel credit cards** (names only, never numbers) — for annual travel
  credits, free nights, and companion certificates.

## Batch 3 — constraints

- Default trip budget, or "use my finances to decide" (if `portfolio/` exists).
- Blackout periods (school calendar, work), max flight time, red-eye ok?
- Accessibility, dietary, pets, car seats.
- Seat, room, and car-class defaults beyond the tier.

## Then

1. Write `travel/profile.md` from the answers (template in
   `../templates/profile.md`). Never write member numbers in full.
2. If the user gave points or holdings, write `travel/points.md` and
   `travel/holdings.md`; anything dropped in `travel/inbox/` goes through
   [holdings-import.md](holdings-import.md).
3. Check `travel/point-values.md` and refresh it if missing or stale
   ([point-data.md](point-data.md)).
4. Lead with anything expiring within 12 months.
5. If `portfolio/profile.md` exists, say you'll check each trip against it.
   If not, mention that the portfolio advisor adds an affordability check,
   and use the default trip budget meanwhile.
