# Tax figures — 2026 (bundled)

Federal figures for tax year 2026, verified against IRS, SSA, and CMS sources
on 2026-10-17. Use these when live lookup isn't available (see
[tax-data.md](tax-data.md)); copy them into `portfolio/tax-figures.md` with
`Source: bundled`. Update this file each year when the IRS publishes the next
year's inflation adjustments (usually October–November) and add a
`tax-figures-<year>.md` for the new year.

## Federal income tax brackets (taxable income over)

| Rate | Single | Married filing jointly | Head of household | Married filing separately |
|------|--------|------------------------|-------------------|---------------------------|
| 10% | $0 | $0 | $0 | $0 |
| 12% | $12,400 | $24,800 | $17,700 | $12,400 |
| 22% | $50,400 | $100,800 | $67,450 | $50,400 |
| 24% | $105,700 | $211,400 | $105,700 | $105,700 |
| 32% | $201,775 | $403,550 | $201,750 | $201,775 |
| 35% | $256,225 | $512,450 | $256,200 | $256,225 |
| 37% | $640,600 | $768,700 | $640,600 | $384,350 |

Source: Rev. Proc. 2025-32 §4.01, https://www.irs.gov/pub/irs-drop/rp-25-32.pdf;
IR-2025-103, https://www.irs.gov/newsroom/irs-releases-tax-inflation-adjustments-for-tax-year-2026-including-amendments-from-the-one-big-beautiful-bill

## Standard deduction

| Filing status | Amount |
|---------------|--------|
| Single / MFS | $16,100 |
| Married filing jointly | $32,200 |
| Head of household | $24,150 |
| Additional, 65+ or blind (single / HoH) | $2,050 |
| Additional, 65+ or blind (married, each) | $1,650 |
| Senior deduction, 65+ (tax years 2025–2028) | $6,000 per person; reduced by 6% of MAGI over $75,000 ($150,000 MFJ); MFJ required if married |

Source: Rev. Proc. 2025-32 (use §4 figures; §3 restates 2025); senior
deduction: P.L. 119-21 §70103,
https://www.irs.gov/newsroom/one-big-beautiful-bill-act-tax-deductions-for-working-americans-and-seniors

## Long-term capital gains (taxable income)

| Rate | Single | MFJ | HoH | MFS |
|------|--------|-----|-----|-----|
| 0% up to | $49,450 | $98,900 | $66,200 | $49,450 |
| 15% up to | $545,500 | $613,700 | $579,600 | $306,850 |
| 20% above | $545,500 | $613,700 | $579,600 | $306,850 |

Net Investment Income Tax (3.8%) MAGI threshold: single/HoH $200,000, MFJ
$250,000, MFS $125,000 (statutory, IRC §1411; not indexed)

Source: Rev. Proc. 2025-32; https://www.irs.gov/individuals/net-investment-income-tax

## Retirement accounts

| Limit | Amount |
|-------|--------|
| 401(k)/403(b)/457(b) employee deferral | $24,500 |
| Catch-up, age 50+ | $8,000 |
| Catch-up, age 60–63 | $11,250 |
| Catch-up must be Roth if prior-year FICA wages over | $150,000 (2025 wages) |
| Total annual additions, 415(c) | $72,000 |
| IRA contribution | $7,500 |
| IRA catch-up, age 50+ | $1,100 |
| RMD starting age | 73 if born 1951–1958; 75 if born 1960 or later; born 1959: **unverified** (final regulations leave it open) |

| Phase-out (MAGI) | Single / HoH | MFJ | MFS |
|------------------|--------------|-----|-----|
| Roth IRA contribution | $153,000–$168,000 | $242,000–$252,000 | $0–$10,000 |
| Traditional IRA deduction, covered by a workplace plan | $81,000–$91,000 | $129,000–$149,000 | $0–$10,000 |
| Traditional IRA deduction, spouse covered (MFJ) | — | $242,000–$252,000 | — |

Source: IRS Notice 2025-67, https://www.irs.gov/pub/irs-drop/n-25-67.pdf;
IR-2025-111, https://www.irs.gov/newsroom/401k-limit-increases-to-24500-for-2026-ira-limit-increases-to-7500;
RMD age: final regulations in IRB 2024-33, https://www.irs.gov/irb/2024-33_IRB

## HSA

| Limit | Amount |
|-------|--------|
| Self-only | $4,400 |
| Family | $8,750 |
| Catch-up, age 55+ | $1,000 (statutory, not indexed) |

Source: Rev. Proc. 2025-19, https://www.irs.gov/pub/irs-drop/rp-25-19.pdf;
catch-up: IRS Pub 969, https://www.irs.gov/publications/p969

## Social Security & Medicare

- Social Security wage base: $184,500
- Medicare Part B standard premium (monthly): $202.90

IRMAA (based on 2024 MAGI):

| MAGI single | MAGI MFJ | Part B monthly total | Part D monthly add-on |
|-------------|----------|----------------------|-----------------------|
| ≤ $109,000 | ≤ $218,000 | $202.90 | $0.00 |
| ≤ $137,000 | ≤ $274,000 | $284.10 | $14.50 |
| ≤ $171,000 | ≤ $342,000 | $405.80 | $37.50 |
| ≤ $205,000 | ≤ $410,000 | $527.50 | $60.40 |
| < $500,000 | < $750,000 | $649.20 | $83.30 |
| ≥ $500,000 | ≥ $750,000 | $689.90 | $91.00 |

MFS, lived with spouse: ≤ $109,000 standard; < $391,000 $649.20 / +$83.30;
≥ $391,000 $689.90 / +$91.00.

Source: wage base: IRS Pub 15 (2026), https://www.irs.gov/publications/p15;
Medicare: https://www.cms.gov/newsroom/fact-sheets/2026-medicare-parts-b-premiums-deductibles

## Other

- Annual gift tax exclusion: $19,000 per recipient ($194,000 to a non-citizen
  spouse)

Source: Rev. Proc. 2025-32; IR-2025-103
