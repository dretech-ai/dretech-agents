# Importing insurance documents

Run this when the user drops documents in `insurance/inbox/`, attaches a
file, pastes text, or types policy details in.

1. **Read each document** (PDF, screenshot, photo, email, pasted text).
   Identify its type: declarations page, renewal notice or offer, rate
   increase letter, non-renewal or cancellation notice, quote or proposal,
   policy jacket or endorsement, ID card, Summary of Benefits and Coverage
   (SBC), Medicare plan document (Annual Notice of Change, Evidence of
   Coverage, plan finder printout), life or disability illustration or
   policy summary, LTC policy summary, claim letter, or a billing statement.
2. **Match it to a policy.** Match on line, carrier, and the insured item
   (property nickname, vehicle year/make/model, insured person). Use the
   policy number only to match, never write it down. If it fits an existing
   file in `insurance/policies/`, update that file. A dec page or renewal
   for a policy not yet in the register becomes a new policy file without
   asking (say so in the report). Ask only when a document could match more
   than one policy, or when a quote's competing policy isn't obvious. Don't
   guess.
3. **Extract** the fields below. Drop policy numbers, member and group IDs,
   MBIs, VINs, driver's license numbers, card and bank numbers, and street
   addresses. Keep quote and claim numbers only on their labeled lines.
4. **Confirm with the user** anything ambiguous: which vehicle is which, an
   endorsement you can't read, whether a quote's limits were what they asked
   for, whether a renewal offer has been accepted.
5. **Write** the results (see below). Update rows in place and add a premium
   history row with the term dates. Keep a source and as-of date per row.
   Never delete a policy or quote; mark policies `cancelled` or
   `replaced` and quotes `declined`, `expired`, or `accepted`.
6. **Archive** — create `insurance/archive/<today>/` and move every processed
   file out of `insurance/inbox/` into it, unchanged. `insurance/inbox/`
   should be empty (except `.gitkeep`) afterwards.
7. **Report** what was imported. Lead with anything urgent (non-renewal,
   cancellation for non-payment, a renewal increase of 15% or more, a
   coverage that was removed or reduced at renewal), then gaps found
   ([coverage-check.md](coverage-check.md)), then price notes.

## Fields by line → the policy file

**Every policy:** carrier, `NAIC:` code if shown, agent or broker business
name, policy form, term start and end, annual premium (convert 6-month auto
terms to annual and say so), payment plan and fees, discounts listed,
deductibles, and every endorsement or rider with its limit and premium.

- **Home / condo / renters / landlord:** property nickname, form (HO-3, HO-5,
  HO-6, HO-4, DP-1, DP-3). Coverage A dwelling, B other structures, C
  personal property, D loss of use / fair rental value, E liability, F
  medical payments. Replacement cost vs. actual cash value for dwelling,
  roof, and contents. Extended or guaranteed replacement cost (%). Ordinance
  or law (%). Water backup / sump overflow. Service line, equipment
  breakdown. Special limits (jewelry, firearms, cash). All-peril deductible,
  and separate wind/hail, hurricane, or named-storm deductible (dollar or %
  of Coverage A — compute the dollars). Roof surfacing or cosmetic-damage
  exclusions. Condo: loss assessment limit, walls-in (Coverage A) amount.
- **Auto:** each vehicle (year/make/model, use, annual miles, garaging ZIP
  only), each driver (role and age only). Bodily injury per person / per
  accident, property damage, uninsured/underinsured motorist BI and PD,
  medical payments or PIP, collision and comprehensive deductibles, rental
  reimbursement, roadside, gap or loan/lease payoff, OEM parts, rideshare
  endorsement. Telematics enrollment.
- **Umbrella:** limit, retained limit / self-insured retention, required
  underlying limits (auto BI, home liability, watercraft), whether UM/UIM is
  included, covered household members, vehicles, and properties.
- **Life:** insured (role, age), type (term with level period, whole,
  universal, variable, group), face amount, premium and how long it's level,
  conversion deadline, riders (waiver of premium, accelerated death benefit,
  child term), beneficiaries by role only. Permanent: cash value, surrender
  value, loan balance, current vs. guaranteed crediting rate, projected
  lapse age from the illustration.
- **Disability:** group or individual, benefit (% of income and monthly
  cap), elimination period, benefit period, definition of disability
  (own-occupation, modified own-occ, any-occupation, and when it switches),
  taxable or not (employer-paid premiums make benefits taxable), riders
  (residual, COLA, future increase option), portability.
- **Health (employer or ACA):** plan type (HMO, PPO, EPO, HDHP), metal tier,
  monthly premium (employee share), deductible and out-of-pocket max
  (individual and family), copays/coinsurance, HSA eligibility, employer HSA
  contribution, network notes the user cares about (doctors, hospitals),
  premium tax credit received (ACA).
- **Medicare:** Part B and Part D premiums including any IRMAA surcharge,
  Medigap plan letter and rating method (community, issue-age, attained-age),
  or Advantage plan type with in-network MOOP, Part D formulary notes for the
  user's drugs, Annual Notice of Change highlights (premium, MOOP, network,
  formulary changes).
- **Long-term care:** daily or monthly benefit, benefit period or pool,
  elimination period, inflation rider, shared care, hybrid (life/annuity)
  vs. traditional, premium history (LTC rates are not guaranteed; note every
  increase).
- **Flood / earthquake / wind:** NFIP or private, building and contents
  limits, deductibles (earthquake is usually a % of dwelling — compute the
  dollars), waiting period, flood zone from the dec page.
- **Valuables / scheduled items:** each item by description and appraised
  value, appraisal date, deductible, agreed value vs. replacement.
- **Pet, travel, boat/RV, other:** limits, deductibles, exclusions that
  matter, and annual premium.

## Quotes → the policy file's `## Quotes` section

Per quote: carrier, agent or channel (captive, independent, direct),
`Quote #:`, date, expiry, every limit and deductible, endorsements, and
annual premium. Mark any limit or deductible that differs from the current
policy. Then run the quote comparison in
[price-analysis.md](price-analysis.md).

## Renewal notices, rate letters, non-renewals

Add a premium history row: new term dates, new premium, change in dollars and
percent, and the reason the carrier gives. The register and the policy
header show the term **in force today**; a renewal offer for a future term
goes in the premium history marked `offered`, and its premium change drives
the shop decision. When the new term starts, it becomes the in-force term.
If the household changed during the prior term (a driver or vehicle added,
coverage changed), ask before calling the increase a rate change. Note any coverage that changed
at renewal (a roof switched to ACV, a new wind/hail percentage deductible, a
sublimit cut). A non-renewal or cancellation notice sets the policy status
to `non-renewed` and records the effective date: that's the deadline for a
replacement to be in force. Flag it at the top of the report and offer a comms
task for the deadline.

## Claim letters

Record the date of loss, line, type of loss, amount paid, and status, with
the `Claim #:` on its own line. Claims stay on most carriers' records (CLUE)
for 5 years; note when each ages off, because that's a shopping trigger.

## Billing statements and ID cards

Use only to confirm premium, payment plan, and term dates. Never record the
card's policy number, member ID, or VIN.

## Before saving

Scan for policy numbers, member and group IDs, MBIs, VINs, driver's license
numbers, card and account numbers, and street addresses. Only `Quote #:`,
`Claim #:`, `License:`, `Confirmation:`, and `NAIC:` lines may carry long
IDs.
