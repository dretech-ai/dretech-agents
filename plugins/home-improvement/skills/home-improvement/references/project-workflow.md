# Project workflow

Run this when the user asks to plan a project, or returns to one.

1. **Load state** — read `home/profile.md`, `home/backlog.md`, the property's
   `property.md`, `systems.md`, and `basis.md`, and any open project files in
   `home/projects/`. If `portfolio/profile.md` exists, read it and
   `portfolio/ledger.md` too (see [finance-link.md](finance-link.md)). If
   `home/inbox/` has files, import them first ([import.md](import.md)).
2. **Bootstrap if needed** — if the home profile is empty or placeholders
   only, run [bootstrap-interview.md](bootstrap-interview.md) first.
3. **Surface what's urgent** — before discussing this project, list any
   **Need now** backlog items and any system past its expected life on this
   property, in two or three lines.
4. **Project interview** — one batch:
   - **Property** (if more than one) and **what** — the project in the user's
     words.
   - **Why now:** something broken or failing, an inspection/insurer/HOA
     requirement, efficiency, selling soon, or it's wanted.
   - **Must-haves vs. nice-to-haves** — this is what splits the need and want
     portions later.
   - **Quality level:** builder grade, mid-range, or high-end; any brands or
     materials already chosen.
   - **DIY vs. pro:** which parts, if any, the user will do.
   - **Timing:** deadline, seasons to avoid, tenant/lease constraints.
   - **Estimates in hand?** If yes, ask them to drop the files in
     `home/inbox/` or paste them.
   - **Budget cap** for this project, if any.
5. **Need vs. want** — score and classify per [need-want.md](need-want.md).
   Split mixed projects into need and want portions. Write the cost-of-deferral
   line for any need. If a Want is being planned while a Need is open on the
   same property, say so now.
6. **Search** — with the built-in web search, look up: a current local cost
   range for the project (project type + city or ZIP + year), permit
   requirements for the city/county, expected lifespan if it replaces a
   system, current rebates and credits, and cost recouped at resale. Queries
   contain only the project type, materials, and city/ZIP — never names,
   addresses, or anything from `portfolio/`. Cite each figure with source and
   as-of date. Without web search, use [lifecycle-data.md](lifecycle-data.md)
   for lifespans and mark every cost and rebate missing.
7. **Estimates** — compare the bids per
   [estimate-compare.md](estimate-compare.md). With no bids, give the sourced
   range, the scope list to send contractors, and set status `estimating`.
8. **Financial impact** — follow [finance-link.md](finance-link.md):
   out-of-pocket with contingency, the checks table, the verdict, and the
   value & tax block.
9. **Write the plan** to `home/projects/YYYY-MM-<property>-<slug>.md`
   (YYYY-MM = target start when first written) using [../templates/project.md](../templates/project.md).
   Never rename a project file afterwards — the backlog and the portfolio
   cash-event line link to it by path. A changed start date goes in the
   file's header only.
   Status starts at `idea`, or `estimating` if bids are still needed. Include:
   the need/want class and score, the recommendation, at most one
   alternative, the estimate comparison, the financial-impact and value & tax
   blocks, next steps in order, and **Verify before signing:** lines.
10. **Update the backlog** — add or update this project's row in
    `home/backlog.md` and re-rank per [need-want.md](need-want.md). Show the
    user where it landed and what, if anything, it jumped ahead of.

## Next steps order

Put the steps in the order that avoids losing money:

1. Apply for any rebate that requires pre-approval.
2. Verify license and insurance for the chosen contractor.
3. HOA architectural approval, if required.
4. Negotiate terms (deposit, milestones, final payment after final
   inspection, written change orders, lien waivers).
5. Confirm who pulls the permit, and that it's pulled before work starts.
6. Sign. Record the contract on the project file.
7. During work: approve change orders in writing; pay against milestones.
8. Final inspection, then final payment and lien waiver.
9. Register manufacturer warranties; submit rebate paperwork; keep the
   invoice for `basis.md`.

## Status changes

`idea → estimating → planned → contracted → in-progress → done`, or
`cancelled` at any point.

- **planned** — a bid is chosen (or the user is doing it themselves).
  Follow the cash-event step in [finance-link.md](finance-link.md).
- **contracted** — record contract total, deposit, milestones, warranty,
  and `Confirmation:` / contract reference. Update the cash-event line if the
  amount changed.
- **in-progress** — track change orders and payments against milestones.
  Flag when change orders push the total past the contingency.
- **done** — ask for the actual total and any rebates received. Record
  variance against the estimate. Add capital improvements to `basis.md`;
  update the system's install year and replace-by in `systems.md`; remove or
  update the portfolio cash-event line; mark the backlog row done.
- **cancelled** — remove or update the portfolio cash-event line and the
  backlog row, and say so.

## Revisiting a project

When the user returns to an existing plan: if it's `idea`/`estimating`/
`planned`, check whether any bid has expired, re-run steps 6–8 if prices are
more than 90 days old, and import any new bids. If it's `contracted` or
`in-progress`, check payment milestones, change orders, and permit status.

## Before saving any file

Scan the content for account, loan, policy, card, and parcel numbers, and
street addresses. License, quote, invoice, permit, and confirmation numbers
are fine on their labeled lines. Drop everything else.
