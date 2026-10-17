# First-session bootstrap interview

Run this when `portfolio/profile.md` is missing or still has placeholders. Ask
in one or two batches, not one question at a time. Accept rough answers —
precision can come later.

## Disclosure (say this first, once)

> Before we start: this is an analysis tool, not a registered investment
> adviser, fiduciary, or tax professional, and it can be wrong. Verify
> anything consequential (large trades, Roth conversions, retirement dates)
> before acting. Your files stay in this folder, but anything I read,
> including your statements, is sent to the AI provider you're using
> (Anthropic for Claude, OpenAI for ChatGPT/Codex) under your account's data
> terms. `archive/` keeps your original statements
> unredacted, account numbers included, so keep this folder private and out of
> any public repo or shared cloud drive.

Then continue with the questions.

## Required

- **Target retirement year** (and current age or birth year). Drives the
  horizon, the target-date benchmark, and the trajectory math.
- **Current annual income** (rough bracket) and **filing status** — sets the
  marginal federal bracket, LTCG bracket, and Roth IRA eligibility.
- **State of residence** — state income tax changes asset-location and Roth
  conversion math.
- **Expected annual spend in retirement** (today's dollars, rough).
- **Investment lens:** active (individual positions on thesis), passive
  (index funds), or mixed.

## Balances & accounts

- Rough split: taxable vs. tax-deferred (401k/Traditional IRA) vs. Roth vs. HSA.
- Expected Social Security at full retirement age (from ssa.gov), pension if
  any.
- Emergency fund target (so it isn't counted as cash drag).

## Hard constraints

- Employer-stock holding windows, blackout dates, or vesting schedules
- ESG or sector exclusions
- Illiquid holdings (private equity, real estate) to exclude from rebalance math
- Accounts to exclude entirely (kids' 529s, a spouse's accounts, etc.)

## Known cash events

Large expenses, inheritance, equity vests, home purchase or sale, job change,
early-retirement separation date.

## Then

1. Write `portfolio/profile.md` from the answers (template in
   `../templates/profile.md`). Compute and record key age milestones: 50
   (catch-up contributions), 55 (Rule of 55), 59½, 63 (IRMAA lookback for
   Medicare), 65 (Medicare), full retirement age for Social Security, 73/75
   (RMDs).
2. Propose `portfolio/target-allocation.md` — asset-class mix and a glide path
   to and through retirement, sized to the horizon and lens. Explain the
   reasoning in 3–5 bullets.
3. **Get explicit confirmation** of the target before running the first review.
