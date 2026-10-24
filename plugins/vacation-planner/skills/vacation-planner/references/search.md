# Search

Live prices, award space, and timeshare availability aren't in your memory.
Search for them, cite each result, and date it.

## Pick the search path (in this order)

1. **Perplexity, if connected.** Look at your available tools for one from a
   Perplexity MCP server (names containing `perplexity`, such as
   `perplexity_search`, `perplexity_ask`, `perplexity_research`). If there is
   one, use it: Perplexity is better at multi-source travel research than a
   plain web search. Prefer the `ask`/`research`-style tool for "compare
   options" questions and the `search`-style tool for a single fact (a fare
   range, a resort fee, a booking-window rule).
2. **Built-in web search / fetch**, if the app gives you one.
3. **Paste-ready prompts.** No search tool at all: write 1–3 prompts the user
   can paste into Perplexity (perplexity.ai) or any search assistant, in a
   fenced block each, and ask them to paste the answers back. Then continue
   the workflow with what they paste.

Perplexity is optional. Never tell the user they need it; mention once, in
the first trip, that connecting a Perplexity MCP server makes searches
better, and how (in Claude Desktop: Settings → Connectors; in Claude Code:
`claude mcp add`; in Codex: `codex mcp add`).

## Privacy: hard constraint

Queries contain only: destination, dates, number of travelers (count, not
names), tier/cabin/room class, brand and program names, and airport codes.
**Never** include names, member numbers, contract numbers, confirmation codes,
balances, income, or anything from `portfolio/`. You're looking up public
prices and rules, not the user's account.

## What to ask for

Write each query so the answer comes back as a table you can drop into the
cost model. Ask for:

- **Flights:** cheapest and best-schedule options per cabin for the dates and
  each flexibility variant; nonstop vs. 1-stop; the airline's award price
  (and partner award options) if the user holds those miles; bag fees.
- **Lodging:** nightly cash rate (with taxes and resort fees) and award rate
  for the preferred brand(s) at the tier, plus 1–2 non-brand alternatives;
  the timeshare club's resorts at the destination and its booking-window
  rules.
- **Car:** daily rate for the class from the preferred company and one
  alternative; airport vs. off-airport.
- **Season:** typical price and crowd difference between the dates and the
  shoulder season.

### Example (Perplexity or paste-ready)

```
Compare round-trip flights SFO→OGG for 2 adults, depart 2027-03-13 or 2027-03-16,
return 7 nights later, main cabin and first. For each: airline, nonstop or stops,
typical cash fare range, and the Alaska and United award prices in miles + fees.
Return a table and cite sources with dates.
```

## Using the results

- Record each price with its source and **as of** date. Perplexity and web
  results are often stale or approximate: label them "estimate — verify on
  <site>" unless the source is the airline/hotel's own page.
- Never fill a gap with a remembered price. Missing stays missing, with what
  you'd need to fill it.
- If results conflict, use the provider's own site figure and say so.
- Booking links go in the plan as plain URLs to the provider's site (no
  affiliate or tracking links).
