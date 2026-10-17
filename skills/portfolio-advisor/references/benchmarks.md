# Benchmarks

Compare the portfolio against two benchmarks. Report YTD and trailing 1/3/5-year
total return where the data is visible in the documents. If a return isn't
available, say so — don't estimate it silently.

## 1. S&P 500

Use **VOO** (Vanguard S&P 500 ETF) as the stand-in. This answers "would I have
done better just owning the index?"

## 2. Target-date fund for the user's retirement year

Read the target retirement year from `portfolio/profile.md` and use the
nearest-vintage target-date fund. This answers "would I have done better with
the one-fund default for my horizon?"

| Retirement year | Vanguard | Fidelity Freedom Index | Schwab Target Index |
|-----------------|----------|------------------------|---------------------|
| 2028–2032       | VTHRX (2030) | FXIFX (2030)       | SWYEX (2030)        |
| 2033–2037       | VTTHX (2035) | FIHFX (2035)       | SWYFX (2035)        |
| 2038–2042       | VFORX (2040) | FBIFX (2040)       | SWYGX (2040)        |
| 2043–2047       | VTIVX (2045) | FIOFX (2045)       | SWYHX (2045)        |
| 2048–2052       | VFIFX (2050) | FIPFX (2050)       | SWYMX (2050)        |
| 2053–2057       | VFFVX (2055) | FDEWX (2055)       | SWYJX (2055)        |
| 2058+           | VTTSX (2060) | FDKLX (2060)       | SWYNX (2060)        |

Default to Vanguard unless the user's primary custodian offers its own series.
Verify tickers when you can — fund families rename and merge share classes.

Also compare the **risk profile**, not just the return: the TDF's current
stock/bond split is the plain default the user's allocation should beat or
justify deviating from.

If the profile has no retirement year, skip the TDF comparison and flag it as a
gap in the review.
