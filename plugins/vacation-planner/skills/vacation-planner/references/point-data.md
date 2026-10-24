# Point values

Point valuations drift as programs devalue and transfer bonuses come and go.
Never compute with a remembered number. Use `travel/point-values.md`, and keep
it current with the procedure below.

## When to refresh

Refresh before computing any cash-vs-points comparison if any of these is
true:

- `travel/point-values.md` doesn't exist.
- Its **Retrieved** date is more than 3 months old.
- Its **Source** is `bundled` and you have web access now.
- A program the user holds isn't in it.
- The user asks (*"update my point values"*, `/update-point-values`).

## What to collect

For each program in `travel/points.md`, plus the common ones in
[point-values-2026.md](point-values-2026.md):

- A published cents-per-point valuation from at least one major points
  publication (for example The Points Guy, NerdWallet, Upgraded Points, One
  Mile at a Time). If two disagree by more than 20%, record both and use the
  lower one as the working value.
- Any devaluation or award-chart change in the last 6 months, in one line.
- For credit-card points: current transfer bonuses only if the user asks.

Timeshare points have no market cpp. Their working value is the
**maintenance fee per point** from `travel/holdings.md`.

## Privacy: hard constraint

Searches contain only program names and generic terms (`Hyatt points value
2026`). **Never** include balances, member numbers, names, or destinations.

## How to refresh

1. **Web tools available** (Perplexity or built-in search): collect the values
   above. Set `Source: live` and `Retrieved:` today, with a URL per program.
2. **No web access:** copy [point-values-2026.md](point-values-2026.md) and set
   `Source: bundled`. Tell the user these are approximate baselines from the
   skill release and may be out of date.
3. **Neither available or a program is missing:** ask the user for the value
   they use, or carry on with that program's cpp labeled **unverified**.

## User overrides

The user can set their own cpp for any program ("I value Hyatt at 2.0¢").
Record it in the **Override** column. An override always wins over the
published value, and the trip plan says it was used.

## After refreshing

- Write `travel/point-values.md`, replacing the prior version, keeping user
  overrides.
- Tell the user what changed (old → new) for programs they hold. If nothing
  changed, say so in one line.
- Flag changes that affect open trip plans (a devaluation that makes an
  earmarked redemption worse than cash).
