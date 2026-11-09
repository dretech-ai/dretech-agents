# Importing estimates, inspection reports, and invoices

Run this when the user drops documents in `home/inbox/`, attaches a file,
pastes text, or types an estimate in.

1. **Read each document** (PDF, screenshot, photo, email, spreadsheet, pasted
   text). Identify its type: contractor estimate/bid/proposal, signed
   contract, change order, home inspection report, specialist report (roof,
   sewer scope, structural, HVAC service), invoice/receipt, appliance
   receipt, or a photo of a problem.
2. **Match it to a property and a project.** Use the service address only to
   match the property, never write it down. If it fits an existing project in
   `home/projects/`, attach it there; if not, ask whether to start a new
   project (status `estimating`). Ask when unsure — don't guess.
3. **Extract** the fields below. Drop account, loan, policy, and card numbers
   and the street address. Keep contractor license, quote, invoice, and permit
   numbers only on their labeled lines.
4. **Confirm with the user** anything ambiguous: which option of a
   good/better/best bid they're considering, whether an allowance is
   realistic, whether a change order was approved.
5. **Write** the results (see below). Update rows in place; keep a source and
   as-of date per row. Never delete a bid or system row without asking; mark
   bids `declined` or `superseded`.
6. **Archive** — create `home/archive/<today>/` and move every processed file
   out of `home/inbox/` into it, unchanged. `home/inbox/` should be empty
   (except `.gitkeep`) afterwards.
7. **Report** what was imported. Lead with safety or end-of-life findings,
   then bid red flags (see [estimate-compare.md](estimate-compare.md)).

## Contractor estimates → the project file's `## Estimates` section

Per bid: contractor business name, `License:` number and state, insurance
stated (GL / workers' comp), `Quote #:`, date and expiry, scope summary,
line items (materials, labor, permits, disposal, other), allowances (item,
amount), exclusions, options (good/better/best), total, deposit and payment
schedule, timeline (start, duration), warranty (labor and manufacturer),
who pulls the permit, change-order terms, escalation clauses. Then run the
comparison in [estimate-compare.md](estimate-compare.md).

## Signed contracts and change orders → the project file

Contract total, deposit paid, payment milestones with dates, start and
completion dates, warranty terms, `Confirmation:`/contract reference. Set the
project status to `contracted`. Each change order: description, amount,
approved yes/no, new total.

## Inspection and specialist reports → `systems.md` and `backlog.md`

- Update each system row: install year or age, condition, notes, and the
  report as source.
- Every defect becomes a candidate project. Use the report's own severity
  (safety / major / minor / maintenance) as an input, then score it per
  [need-want.md](need-want.md) and add it to `backlog.md`. Group small items
  by trade ("handyman list", "electrician punch list") instead of one row
  each.
- Safety items (gas, electrical hazards, missing CO/smoke detectors, egress,
  structural) go to the top of the report and the backlog as **Need now**.

## Invoices and receipts → `basis.md` and `systems.md`

Date, contractor, what was done, amount paid, and whether it's a capital
improvement or a repair (see [finance-link.md](finance-link.md); ask if
unclear). Add capital improvements to `basis.md`. If it replaced a system,
update that system's install year in `systems.md`. If it closes a project,
set the project to `done` and record actual cost.

## Photos of a problem

Describe what's visible, what it could indicate, and what kind of
professional should look at it. Never diagnose structural, electrical, or gas
issues from a photo; say who to call and how urgently.

## Before saving

Scan for full account, loan, policy, card, and parcel numbers and any street
address. Only `License:`, `Quote #:`, `Estimate #:`, `Invoice #:`, `Permit:`,
and `Confirmation:` lines may carry long IDs.
