# wxsum v6.0: Implementation Plan

**Scope:** code changes to the `wxsum` package only (ado files, help files, tests, package files, example files). Manuscript changes are not covered here and come afterwards.
**Status:** all design decisions settled (§1). No code has been changed.
**Sources:** referee report (11 Sep 2026), editor comments (S. Jenkins), a review of the v5.0 code (including runs in Stata 18 MP), author decisions made so far, and the useful parts of a separate plan drafted with Gemini.

---

## 1. Decisions

### 1.1 Already decided by the authors

| # | Decision |
|---|---|
| D1 | **Output is long by default.** One row per unit-year, with a `year` variable and no `_YYYY` suffixes. Adding the `wide` option gives today's wide layout. `shape()` is removed. |
| D2 | **wxsum accepts wide input only.** Users with long data run the companion command `wxprep` first. wxsum gets no long-input mode. |
| D3 | **Missing days at the start or end of a season are skipped when counting leading and trailing dry spells.** `dry_start` counts forward from the first observed day and `dry_end` counts backward from the last observed day. Example: `0 0 0 0 . . .` gives `dry_end = 4`. |
| D4 | **Mid-season dry spell (`dry`), rule (ii).** With two or more rainy days, `dry` is the longest dry run strictly between the first and last rainy day (unchanged). With zero or one rainy days, it is the longest run of consecutive observed dry days anywhere in the season. Missing days always break a run. |
| D5 | **`wxprep` does three conversions:** long → wide, wide → wide (renaming data whose names don't follow `stub` + `yyyymmdd`), and wide → long (so users can transform daily values and convert back). See §4.2. |
| D6 | **One heat threshold.** `kdd_base()` is used for both killing degree days and the heat-day / heat-spell variables. There is no separate `heat_threshold()`. `heat` is the longest hot run anywhere in the window; leading and trailing heat runs follow D3. See §5.4. |
| D7 | **The v5 option names are kept** (`ini_month`, `fin_month`, `kdd_base`, …). Only labels and help text use neutral "window" wording (§5.10). |
| D8 | **Defaults confirmed:** `ref_min()` = all reference years; `minobs(1)`; in unit-specific mode, windows running past the data get missing statistics unless `partial` is given; `lag()` is available for event windows. |

**Why one threshold (D6).** In the crop literature the threshold for killing (extreme) degree days and for "days above" counts is the same number: about 29 °C for corn, 30 °C for soybeans and 32 °C for cotton (Schlenker and Roberts 2009). Days above k measure how often; degree days above k measure how intense. Fixed cutoffs in the health literature are often 30, 32 or 35 °C, or a local percentile, so no single default fits every field. Users set their own value, and anyone who wants a different heat-day threshold can run wxsum again with `prefix()`. The help file will stress that the meaning depends on the daily series supplied: 30 °C on daily means is far rarer than 30 °C on daily maxima.

### 1.2 Still open

None.

---

## 2. Problems found in v5.0

Each item below was confirmed by reading `wxsum.ado` and, where noted, by running Stata.

| ID | Problem | Evidence | Fix in |
|---|---|---|---|
| P1 | **Seasons with no data give 0 instead of missing.** `egen rowtotal()` returns 0 for an all-missing row in `total`, `mean_mo`, `raindays`, `norain`, `gdd`, `kdd` and the GDD categories. These zeros then enter the long-run baselines. | Probe: an all-missing 2020 season gave `total_2020 = 0` and `dev_total_2023 = 50`; the correct value is 20. | WS1 |
| P2 | **The rolling baseline silently uses fewer years.** The code checks that L earlier season variables exist, but `rowmean`/`rowsd` skip missing values row by row. | `wxsum.ado:604-608` | WS1 |
| P3 | **Monthly totals are grouped by month only, not year and month.** A season like 15 May to 10 May of the next year merges two Mays. Partial months count as full months. | `wxsum.ado:491` | WS1 |
| P4 | **An error part-way through leaves partial output.** `keep()` is only checked at the end. | Probe: an existing `dry_2020` gave r(110) after 14 variables had been created. A bad `keep()` name gave r(111) after all computation. | WS2 |
| P5 | **3 of the 6 test suites fail.** Some have stale assertions, some have wrong arithmetic (validation #3 assumes Jan+Feb 1994 = 32 days), and the dry-spell tests contradict each other. | Batch runs | WS0 |
| P6 | **Code and paper disagree.** The paper says `kdd_base()` is optional and `rain_threshold()` is rain-only; the code requires `kdd_base()` and silently ignores options that don't apply to the type. | | WS1 |
| P7 | **Slow.** Each statistic loops over every day with `gen`/`egen`, so command overhead dominates. | 10 rows of rain: 22.7 s. 1,000 rows: 30.5 s. 10 rows of temp with `tmp_bin(15)`: 65.3 s. | WS2 |
| P8 | **The bundled data need `set maxvar`.** `rain.dta` has 7,671 variables and `temp.dta` 7,640, above the default of 5,000. | `describe` | WS6 |
| P9 | **Housekeeping.** `cap program drop`, no `*! version` line, `save()` always overwrites, a stale `wxsum_submission/` copy, and running rain then temp on the same data gives clashing names (`mean_YYYY`). | | WS1, WS3, WS6 |

---

## 3. Architecture

### 3.1 Overview

- **One Mata engine for every mode.** The ado file parses options, validates and writes the output. All statistics are computed in Mata. Mata is part of base Stata 15, so there are no new dependencies. The Mata code goes inline at the end of `wxsum.ado`.
- **One code path.** Calendar seasons and unit-specific windows both reduce to the same object: an N × D matrix of daily values plus a mask marking which cells fall inside the window. There is no separate slow path that could drift from the fast one.
- **Nothing changes until everything succeeds.**
  1. Validate all options and **all output names** before computing (`confirm new variable` on every planned name, and on `year` in long mode).
  2. `preserve`.
  3. Compute.
  4. Create the final variables directly with `st_addvar`, or by renaming tempvars. Renaming makes no copy. **Do not use `clonevar`**: copying doubles peak variable use, which works against the `maxvar` fix.
  5. Apply `keep()`, reshape for long output, `compress`, then `restore, not`.

  On any error or Break, the user's data come back unchanged.

### 3.2 Steps inside `wxsum`

1. **Parse and validate.**
   - `keep()` becomes a real `varlist`.
   - Check that options suit the chosen type (e.g., an error if `gdd_bin()` is used with rain or `rain_threshold()` with temp).
   - Enforce mutual exclusions (calendar vs. event window; `lr_years()` vs. `baseline()`).
   - Check the projected output variables against `c(maxvar) - c(k)`, with an error message that tells the user to `set maxvar`.
2. **Build the calendar.** Parse the `stub` + `yyyymmdd` variables into a date vector (as v5 does). Compute the column indices for each season, or the per-row window bounds in event mode.
3. **Compute, one season or window at a time.** Load the season's values with `st_view(X, ., cols)` into an N × D matrix and apply the mask. In one vectorized pass, compute:
   - observed-day count, mean, median, variance, SD, skewness, max
   - totals that are missing when no day is observed
   - monthly totals grouped by year and month
   - threshold counts and shares
   - run lengths (dry and heat spells), computed column by column across all rows at once
   - GDD/KDD by clamping
   - bin counts (equal-width or user cutpoints)
   - GDD categories
4. **Compute deviations and z-scores** from the N × S matrix of seasonal statistics, using the rolling or fixed baseline and the missing-data rules in §5.6.
5. **Write the output.**
   - Use the narrowest storage type that fits (byte/int for counts; float/double for statistics).
   - Write variable labels, plus characteristics (`[wxsum_stat]`, `[wxsum_window]`) and a dataset-level `_dta[wxsum_cmdline]`.
   - Long output by default, with no per-year preserve/tempfile loop. Wide output if `wide` is given.
6. **Finish.** `compress`, set `r()` results, print the summary table.

### 3.3 Files

```
wxsum.ado      v6 parser + inline Mata engine (rclass)
wxsum.sthlp    revised help
wxprep.ado     NEW companion: towide / rename / tolong subcommands
wxprep.sthlp   NEW
wxsum.pkg / stata.toc   updated file list, v6.0
examples/      NEW: wxsum_examples.do + .log, sample long data, toy merge data
tests/         repaired v5 suites + new v6 suites + run_all.do
```

---

## 4. v6 syntax

### 4.1 `wxsum`

```stata
* Calendar window (default mode)
wxsum stub, type(rain|temp|generic) ini_month(#) fin_month(#) [ini_day(#) fin_day(#) options]

* Unit-specific window
wxsum stub, type(rain|temp|generic) start(varname) end(varname) [options]
wxsum stub, type(rain|temp|generic) event_date(varname) days(#) [lag(#) options]
```

**Window options**

| Option | Meaning |
|---|---|
| `ini_month() fin_month() ini_day() fin_day()` | Calendar window, as in v5. |
| `start(varname) end(varname)` | `%td` variables giving each row its own first and last day. Supports planting → harvest windows of different lengths, and conception → birth. |
| `event_date(varname) days(#)` | Shortcut for a backward-looking window: `start = event − days − lag`, `end = event − 1 − lag`. `lag(#)` defaults to 0. |

You must choose exactly one window mode, or wxsum stops with error 198.

**Statistic options**

| Option | Meaning |
|---|---|
| `stats(list)` | Which statistic groups to create (e.g., `stats(dist total days spells gdd kdd bins)`). Default: all groups that apply to the type. |
| `rain_threshold(#)` | Rain only. Default 1. |
| `gdd_lo() gdd_hi()` | Required only if GDD is requested. |
| `kdd_base()` | Temp only. Threshold for killing degree days **and** for the heat-day / heat-spell group (D6). Required only if either is requested. |
| `threshold(#)` | Generic only. Counts of days at or above the threshold, their share, and the longest run. |
| `gdd_bin() gdd_binlo() gdd_binhi()` | As in v5. |
| `tmp_bin() tmp_binlo() tmp_binhi()` | As in v5 (equal-width bins). |
| `cuts(numlist)` | NEW. User-set ascending cutpoints giving bins (−∞, c₁), [c₁, c₂), …, [c_K, ∞). Works with any type, so it also gives rain-intensity bins and the exposure "bands" favored by the heat-exposure literature. Cannot be combined with `tmp_bin()`. |
| `minobs(#)` | NEW. Set a season's statistics to missing when it has fewer than # observed days. Default 1. |

**Reference period options**

| Option | Meaning |
|---|---|
| `lr_years(#)` | Rolling window of strictly earlier seasons. Default 10 when `baseline()` is not given. |
| `baseline(y1 y2)` | NEW. Fixed climate normal. Cannot be combined with an explicitly set `lr_years()`. |
| `ref_min(#)` | NEW. Minimum number of non-missing reference seasons a unit needs. Default: all of them (L for rolling; y2 − y1 + 1 for fixed). |

**Output options**

| Option | Meaning |
|---|---|
| `wide` | Wide output. Default is long. |
| `prefix(string)` | Added to the start of every output name (e.g., `prefix(rf_)` gives `rf_total`). Prevents clashes when rain and temp are processed on the same data. |
| `keep(varlist)` | Variables to carry into the output. |
| `save(filename [, replace])` | No longer overwrites unless `replace` is given. |

### 4.2 `wxprep`

`wxprep` uses three subcommands, one for each conversion (D5). Each one ends with data ready for wxsum (`towide`, `rename`) or ready for daily transformations (`tolong`).

**Long → wide**

```stata
wxprep towide varname [if] [in], id(varlist) date(varname) stub(string) ///
    [daily(mean|sum|min|max) dateformat(string) nofill clear save(filename [, replace])]
```

- `date()` accepts `%td`, `%tc`/`%tC` (reduced with `dofc()`), `YYYYMMDD` integers, or strings. Strings require `dateformat()`, e.g. `"YMD"` or `"DMY"`.
- `daily()` collapses readings taken within the same day (e.g., hourly ERA5). It is required if any id × date appears more than once; otherwise the command stops and reports the duplicates.
- `stub()` is used exactly as typed. `stub(rf_)` gives `rf_19930101`.
- By default it creates a variable for every calendar day between the first and last date, filled with missing where there is no data. Without this, days missing from the source silently drop out of wxsum's observed-day count. `nofill` turns this off.
- Checks `c(maxvar)` before reshaping and reports the number of variables needed.
- The option is named `daily()` rather than `type()` so it doesn't clash with wxsum's `type()`.

**Wide → wide (renaming)**

```stata
* Consecutive daily variables in varlist order (e.g., rain1-rain365)
wxprep rename varlist, stub(string) firstdate(string)

* Variable names that contain a date in another format (e.g., rain_01jan1993)
wxprep rename varlist, stub(string) from(oldstub) dateformat(string)
```

- With `firstdate()`, the variables are taken as consecutive days in `varlist` order, starting at that date. The date can be any `%td` date literal, e.g. `firstdate(01jan1993)`.
- With `from()`/`dateformat()`, the old stub is removed from each name and the remainder is read as a date using the given mask (e.g., `"DMY"`).
- **Safety checks before renaming:** every name must give a valid date, there must be no duplicate dates, and no new name may already exist. Gaps in the dates are reported. Non-numeric variables are rejected.

**Wide → long**

```stata
wxprep tolong stub, id(varlist) [generate(varname) date(varname) clear]
```

- Turns `stub` + `yyyymmdd` variables into rows of `id`, a `%td` date, and a value variable (`generate()`, default = `stub` without a trailing underscore).
- Intended round trip: `wxprep tolong` → transform the daily values (e.g., Kelvin to Celsius, build a daily composite) → `wxprep towide` → `wxsum`.

---

## 5. Workstreams

### WS0: Test baseline (do first)

1. **Repair the v5 suites:**
   - Fix the arithmetic in `wxsum_validation` #3.
   - Remove the "KDD is absent" assertions (validation #13, synthetic #5).
   - Align every dry-spell assertion with D3/D4. `test_dryspells` seq 2 should expect `dry = 4`; validation #6/#7 and synthetic #1 already match D4.
2. **Add `tests/run_all.do`.** It runs every suite in batch mode and reports pass/fail per suite.
3. **Freeze reference output.** Save v5 output on the bundled data for the statistics that v6 should leave unchanged. This is the regression oracle.
4. **Write a plain-Stata reference implementation** (the WS1-fixed v5 logic) to check the Mata engine against.

### WS1: Correctness fixes (in the current Stata code, before Mata)

These fixes go into the current code first, so the reference implementation in WS0.4 is correct.

- **P1:** totals, `mean_mo`, `raindays`, `norain`, `gdd`, `kdd` and bin counts are missing when a season has no observed days.
- **P2:** a unit needs `ref_min()` non-missing reference seasons; otherwise its `dev_`/`z_` are missing.
- **P3:** monthly totals are grouped by year and month. Document that partial months at the season edges count as months.
- **D3/D4:** new dry-spell rules.
- **P6:** make `kdd_base` optional, and reject options that don't apply to the chosen type.
- **P9:** remove `cap program drop`; add `*! version 6.0.0 ddmmmyyyy`; `save(…, replace)`.

### WS2: Mata engine (same results as WS1, much faster)

- Implement §3.2 steps 3–5 for calendar mode, and move the existing outputs onto the engine with no changes in meaning.
- **Acceptance:**
  - matches the WS1 reference to 1e-10 on randomized synthetic data, including missing days, cross-year seasons and leap years
  - passes all repaired suites
  - takes under 2 s for each bundled example (currently 22.7–65.3 s)
  - leaves no variables behind after an induced error
- Fixes P4 and P7.

### WS3: New features in the existing calendar mode

**5.1 Long output by default and `wide` (D1).**
- Long output is built directly from the N × S result matrices.
- In long output, `gddcat` keeps its value label, `year` is checked against `keep()`, and `keep()` variables are repeated across years.

**5.2 `prefix()` and `stats()`.**
- Naming stays predictable: fixed stems such as `mean`, `total`, `gdd` plus an optional prefix. Users cannot name each variable individually: with about 23 statistics × S seasons that isn't practical, and fixed stems keep long output and `i.gddcat` usable.

**5.3 `type(generic)`.**
- For any daily series (humidity, wind, PM2.5, NDVI). It creates distribution statistics, `nobs`, `max`, and optionally `threshold()` counts, share and longest run, plus `cuts()` bins.
- Temperature-like series (wet-bulb, heat index, Tmin/Tmax) keep using `type(temp)`.

**5.4 Heat days and heat spells** (`type(temp)` with `kdd_base(#)`; see D6). They can be turned off with `stats()`.

| Variable | Meaning |
|---|---|
| `heatdays` | Observed days with T ≥ threshold |
| `pct_heatdays` | Share of observed days with T ≥ threshold |
| `heat_start` | Hot run from the first observed day (D3 edge rule) |
| `heat_end` | Hot run back from the last observed day (D3 edge rule) |
| `heat` | Longest run of hot days anywhere in the window; missing days break runs |

- The threshold is `kdd_base()`, shared with KDD (D6): "days at or above k" and "degree days above k" are the frequency and intensity of the same exposure. A different heat-day threshold means a second run with `prefix()`.
- There is no `noheat` variable. It would just be `nobs − heatdays`.
- Labels show the threshold, e.g. `"Days with temp >= 32"`, `"Longest heat spell (temp >= 32)"`.

**5.5 `cuts(numlist)`:** see §4.1.

**5.6 Reference periods.**
- `baseline(y1 y2)`: for each unit and statistic, the mean and SD over seasons that start in [y1, y2], with at least `ref_min()` non-missing values. Seasons inside the baseline are compared with a baseline that includes them, as is standard for climate normals. This is recorded in the variable characteristics and the help file.
- `lr_years()` gets a sentinel default so wxsum can tell when the user set it explicitly.
- When the reference SD is zero, `z_` is missing. Stata already does this when dividing by zero, but it gets an explicit test.

**5.7 Deviations and z-scores for spell variables.**
- Added for `dry_start`, `dry`, `dry_end`, and for `heatdays`, `heat_start`, `heat`, `heat_end` when heat spells are requested.
- The help file notes that z-scores of spell lengths, which are often zero, should be interpreted with care.

**5.8 Missing-data reporting.**
- Every season gets an `nobs` variable (observed days).
- `minobs(#)` sets a season's statistics to missing when there are too few observed days.

**5.9 r-class results and a summary table.**

| r() result | Contents |
|---|---|
| `r(N)` | Rows of output |
| `r(N_units)` | Number of distinct `keep()` id combinations, when `id` variables are kept |
| `r(k_created)`, `r(varlist)` | Number and list of variables created |
| `r(n_windows)`, `r(first_year)`, `r(last_year)`, `r(years)` | The seasons (windows) processed |
| `r(mode)` | `calendar` or `event` |
| `r(ini_date)`, `r(fin_date)`, `r(type)`, thresholds, `r(ref)`, `r(cmdline)` | The options used |
| `r(missing)` | Matrix, one row per season: days in the window, mean observed days, share of unit-seasons with any missing day, share with all days missing, count dropped by `minobs()` |

The printed summary repeats the main items so users can check the output without opening the data.

**5.10 Labels and wording.**
- Help text and console output use neutral wording such as "window (season)". Generic labels avoid farm-specific words.
- KDD label: `"Killing (extreme-heat) degree days above 32"`. Labels stay under 80 characters and show the actual threshold value.
- The longer explanation of KDD belongs in the paper.

### WS4: Unit-specific windows

- `start()`/`end()`, with `event_date()`/`days()`/`lag()` translated into start and end dates.
- **Mata:** use `st_view` for the daily matrix. For each row, the window covers columns `start_i − d₁ + 1` to `end_i − d₁ + 1`, read into a padded N × maxlen matrix plus an in-window mask. Statistics are the same as in calendar mode, so spell edges are measured within each row's own window.
- **Output:** one window per row, so names have no `_YYYY` and `wide` is ignored with a note.
- **Windows that run past the data:**
  - a row whose window starts before the first date or ends after the last date gets missing statistics, unless `partial` is specified
  - rows with a missing start or end date get missing statistics
  - both counts are reported in r()
- **Deviations and z-scores:** compare with the same calendar window shifted back 1…L years (Feb 29 maps to Feb 28), or with each year in `baseline()`. The `ref_min()` rule applies.
- **Validation:** `start` and `end` must be numeric daily dates with `end ≥ start`.

### WS5: `wxprep`

- Implement the three subcommands in §4.2 (`towide`, `rename`, `tolong`).
- `towide` checks `c(maxvar)` before reshaping.
- `rename` runs every safety check before renaming anything, so a failure leaves the data unchanged.

### WS6: Package files

- `examples/wxsum_examples.do` with its plain-text `.log`. It reproduces every Stata example in the article and shows how to:
  - check results with `return list`
  - merge onto a toy dataset
  - run a small illustrative regression
  - use `wxprep`
- **Sample data:**
  - long-format `rain_long.dta` and `temp_long.dta`, which load without `set maxvar` and demonstrate `wxprep`
  - a small toy household/outcome dataset for the merge example
  - keep the wide samples; their help entries note the `set maxvar` requirement (P8)
- Update `wxsum.pkg`/`stata.toc` (v6.0, new files, ancillary data).
- Remove `wxsum_submission/` from the repo (or move it to an archive branch).
- Help files: `wxsum.sthlp` (new syntax, examples, stored results), new `wxprep.sthlp`. README brought in line.

---

## 6. How each reviewer comment is handled (code only)

### Referee

| Comment | Action |
|---|---|
| Option to convert long data to wide | `wxprep` (WS5). |
| Fixed-baseline deviations and z-scores | `baseline()` (§5.6). |
| Season that varies by location | `start()`/`end()` and `event_date()`/`days()` (WS4). |
| Spell deviations and z-scores | Added (§5.7). |

### Editor

| # | Comment | Action |
|---|---|---|
| 1–2 | Wider usefulness | `type(generic)`, `cuts()`, heat spells, unit-specific windows, `stats()`, `prefix()`. |
| 3 | Other metrics; composites; non-calendar periods | Covered by `type(generic)`, the `cuts()` bands, heat spells and unit windows (e.g., pregnancy). **Not done:** physical composites (heat index, WBGT, wet bulb) and heat+rain composites inside wxsum. They need extra inputs (humidity, pressure, radiation), there are competing formulas, and they belong in data preparation. Supported instead: build the daily series or indicator first (with `wxprep`), then summarize it with `type(temp)`/`type(generic)`. **Deferred:** thresholds based on each location's own percentiles. Definitions vary, and `baseline()` should exist first. |
| 4 | Companion prep command | `wxprep`. |
| 5 | Post-calculation checks; r() | §5.8, §5.9, characteristics. |
| 6, 10 | Examples, do-files, logs | WS6. |
| 7 | Long output | D1. |
| 8 | KDD term | §5.10 labels; the explanation goes in the paper. |
| 9 | `set maxvar` | `c(maxvar)` checks in wxsum and wxprep; long sample data. |
| 11 | Conclusions | Manuscript only. |
| 12 | `cap program drop` | Removed. |
| 13 | Hard-coded variable names / tempvars | §3.1 (validate names first, compute in Mata, nothing left behind on error, `prefix()`). Fixed stems are kept, for the reasons in §5.2. |
| 14 | `compress` | Done, plus narrow storage types. |

---

## 7. Verification

| Test suite | Checks |
|---|---|
| Repaired v5 suites | All pass under D3/D4. |
| Engine equivalence | Mata vs. the plain-Stata reference on random data: 200 rows, 25 years, 10% missing, cross-year and leap-year seasons, all types. Tolerance 1e-10. |
| Regression | v6 output equals the frozen v5 output for statistics whose meaning didn't change. |
| Dry and heat spells | Hand-computed sequences: missing days at the edges, a single rainy day, an all-dry season, missing days inside a run, an all-hot window. |
| Missing data | All-missing seasons give missing totals and GDD; `minobs()`; `ref_min()`; `r(missing)` values. |
| Baseline | `baseline()` vs. manual mean and SD; zero SD gives missing z; cannot be combined with `lr_years()`. |
| Event windows | Windows of different lengths, `event_date`/`days`/`lag`, windows past the data, Feb 29, deviations from shifted windows. |
| Rollback | Run with an output name that already exists. The data must be unchanged (`datasignature`) with no new variables. Same check after a mid-run error in Mata. |
| Output | Long default, `wide`, `prefix()`, `keep()` with `year`, `gddcat` value labels, storage types, `save(…, replace)`. |
| `wxprep` | `towide`: each date input form, duplicates rejected without `daily()`, calendar filling and `nofill`, `maxvar` check. `rename`: `firstdate()` and `from()`/`dateformat()` paths; bad dates, duplicate dates and name clashes rejected with the data unchanged. `tolong`: values and dates correct. Round trip `tolong` → `towide` reproduces the original data exactly, and feeds into wxsum. |
| End-to-end | Long sample → `wxprep` → `wxsum` (calendar and event) → merge → regression. This is the example do-file. |
| Performance | Benchmark on the bundled data and on 1,000/10,000 rows; reported in the test log. |

`tests/run_all.do` runs everything in batch mode. The examples log is regenerated from a clean session.

---

## 8. Order of work

| Step | Work | Depends on |
|---|---|---|
| 1 | WS0 test baseline | — |
| 2 | WS1 correctness fixes | 1 |
| 3 | WS2 Mata engine | 2 |
| 4 | WS5 `wxprep` | can run alongside 2–3 (separate files) |
| 5 | WS3 features | 3 |
| 6 | WS4 unit windows | 3, 5 (shares §5.6 reference logic) |
| 7 | WS6 package, help, examples | 4–6 |

## 9. Risks

- **Long output becoming the default breaks v5 scripts.** Mitigation: a clear note when the command runs, the help file, and the major version bump.
- **Wide input still needs `maxvar`.** Mitigation: early checks, long sample data and `wxprep`. For very long histories, users can split the years and append (the help file explains how much overlap the reference period needs).
- **More options make the command harder to learn.** Mitigation: `stats()` defaults, presets for each type, and help examples ordered from simple to advanced.
