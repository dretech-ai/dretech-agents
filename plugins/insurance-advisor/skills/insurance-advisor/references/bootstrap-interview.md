# First-session bootstrap interview

Run this when `insurance/profile.md` is missing or still has placeholders.
Ask in batches, not one question at a time. Accept rough answers ("auto is
around $1,800 a year"); precision comes from the dec pages. The fastest path
is the documents: offer the shortcut up front.

## Disclosure (say this first, once)

> Before we start: I'm a planning tool, not a licensed insurance agent or
> broker. I never contact an insurer or agent, and I never buy, change, or
> cancel a policy. Premiums, rules, and coverage terms vary by state and
> change often, so confirm every number and every change with your agent or
> insurer before you act, and never cancel a policy until its replacement is
> in force. Your files stay in this folder, but anything I read, including
> your declarations pages and plan documents, is sent to the AI provider
> you're using (Anthropic for Claude, OpenAI for ChatGPT/Codex) under your
> account's data terms. Web searches contain only the coverage type and your
> state or ZIP, never your name or address. `insurance/archive/` keeps your
> original documents unredacted, policy numbers and addresses included, so
> keep this folder private and out of any public repo or shared cloud drive.

Then offer the shortcut:

> The quickest start is your declarations pages. Drop the current dec page
> for each policy (home, auto, umbrella, life, and so on), plus any recent
> renewal notice, into `insurance/inbox/` and I'll pull the coverages and
> premiums from them. Then I only need to ask about what's not on paper.

If the user drops documents, run [import.md](import.md) first, then ask only
what's still missing below.

## Read sibling files first

- If `home/profile.md` exists, read it and every
  `home/properties/<slug>/property.md` (see
  [finance-link.md](finance-link.md)). Don't ask again for properties, use,
  year built, square feet, or carrier and deductible already recorded there;
  confirm them in one line instead.
- If `portfolio/profile.md` exists, read it and the latest
  `portfolio/ledger.md` snapshot. Don't ask for income bracket, filing
  status, state, emergency-fund target, or ages already recorded there.

## Batch 1 — the household

- **Who's in the household:** adults (ages or birth years), children
  (ages), and anyone else who depends on the household's income (parents,
  a former spouse with support orders).
- **Income:** rough household income, and who earns it. Whether either
  earner's income would stop if they couldn't work (salaried vs. business
  owner, and what the employer provides).
- **Drivers:** each driver's age, years licensed, and any accidents,
  tickets, or claims in the last 5 years. Note teen or soon-to-be drivers.
- **Health and coverage stage:** employer plan, marketplace (ACA), Medicare,
  or uninsured, for each adult. Anyone within 2 years of 65. Only as much
  health detail as the user volunteers.
- **Risk factors:** pool, trampoline, dog (breed matters to some carriers),
  rental properties, short-term rental hosting, household employees (nanny,
  caregiver), board seats or volunteer roles, a home business.

## Batch 2 — what you own

- **Properties** (skip what `home/` already has): nickname, city, state, ZIP,
  use (primary, condo, rental, vacation), owned or rented, year built, square
  feet, roof age and material, mortgage (lender name only), HOA (condo master
  policy type if known).
- **Vehicles:** year, make, model, rough value, owned / financed / leased,
  annual miles, who drives it. No VINs.
- **Valuables:** jewelry, art, collectibles, instruments, cameras, firearms
  worth more than about $1,500 each, and whether any are scheduled.
- **Other:** boats, RVs, motorcycles, ATVs, golf carts; pets; business
  equipment at home.
- **Net worth range** if `portfolio/` doesn't exist (under $250k, $250k–$1M,
  $1M–$3M, $3M–$10M, over $10M), including home equity.

## Batch 3 — policies held

For each policy not already imported from a dec page: line, carrier, rough
annual premium, deductible, renewal month, what it covers, and **when it was
last shopped**. Ask specifically about the policies people forget:

- Umbrella
- Life through work (and whether it's portable), and any individual life
- Disability through work (short- and long-term), and any individual policy
- Flood, earthquake, or a wind/hurricane policy separate from homeowners
- Scheduled valuables rider or a separate valuables policy
- Pet, travel (annual plan), or a cancer, accident, or hospital-indemnity
  policy
- Extended warranties and home warranties, mortgage life or credit life
- Medicare supplement, Part D, or Advantage plan; long-term care

## Batch 4 — preferences

- **Deductible comfort:** the largest surprise bill they could pay from cash
  without stress. (If `portfolio/` has an emergency fund target, use it and
  ask only if they want a different number for insurance.)
- **How they buy:** captive agent (one carrier), independent agent or broker,
  direct online, or no preference. Agent business name and email if they want
  drafts sent there later.
- **Carriers to avoid** and why (bad claim experience, non-renewed them).
- **Bundling:** whether they care about keeping home and auto together.

## Then

1. Write `insurance/profile.md` from the answers.
2. For each policy, create `insurance/policies/<line>-<slug>.md` from
   [../templates/policy.md](../templates/policy.md). A policy the user
   described but hasn't shared a document for (employer life and
   disability are common) gets a file and register row with status
   `unverified` and only what the user said; ask for the plan summary or
   benefits statement. Lines: `home`, `condo`,
   `renters`, `landlord`, `auto`, `umbrella`, `life`, `disability`, `health`,
   `medicare`, `ltc`, `flood`, `earthquake`, `valuables`, `pet`, `travel`,
   `watercraft`, `rv`, `other`. Slugs are short and lowercase
   (`home-main-house`, `auto-statefarm`, `life-term-owner1`).
3. Fill `insurance/policies.md`: one register row per policy, the total
   annual premium, the renewal and shop calendar
   ([shopping-triggers.md](shopping-triggers.md)), and open gaps.
4. Run [coverage-check.md](coverage-check.md) and
   [price-analysis.md](price-analysis.md) at a first-pass level, and write
   the first review from [../templates/review.md](../templates/review.md).
5. Lead the summary with the largest uncovered exposure (liability vs. net
   worth, dwelling vs. rebuild cost, missing flood or disability coverage),
   then any policy overdue for shopping, then over-coverage savings.
6. If `portfolio/profile.md` exists, say the liability and deductible
   checks use it. If not, mention once that the portfolio advisor adds an
   exact net-worth and emergency-fund check, and use the range they gave.
7. If `home/` exists, say dwelling and roof checks read its property and
   systems files. If not, mention that the home improvement planner tracks
   roof and system ages that affect premiums.
