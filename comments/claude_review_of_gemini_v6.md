# Review of the `gemini` branch: wxsum v6 against the implementation plan

- **Reviewer:** Claude (Opus 5.5), 14 October 2026
- **Branch reviewed:** `gemini` at 7542ea6 ("gemini run")
- **Plan:** `comments/wxsum_v6_plan_claude_revision.md`
- **Line numbers** refer to the files at 7542ea6.

## Summary

Gemini's `wxsum` computes the right numbers. All 15 of its test suites pass. On 12 configurations of random data, its output matches the `claude` branch in every value (within 1e-5) and every variable name.

But there are real problems:

- `wxprep tolong` silently puts values under the wrong unit or the wrong date in two common situations.
- `wxprep towide` damages the data in memory when it fails.
- Several `wxsum` behaviors are wrong or silent: gaps in the daily variables, a `baseline()` outside the data, and the window recorded when `fin_day()` is omitted.
- The help file documents stored results that don't exist, and it contradicts the code on unit windows outside the data.
- The plan's main correctness test is not implemented as specified. That test is the equivalence of the Mata engine with the WS1 reference.
- `wxsum.ado` is about twice as long as it needs to be, and 3–5× slower than the `claude` branch at 1,000–10,000 rows.

## What was run

Everything ran on a scratch copy of the branch, in Stata 18.5 MP with 4 cores.

1. **Gemini's test runner.** `tests/run_all.do`: 15 of 15 suites pass, in about 10 seconds.
2. **A differential test.** The same 12 `wxsum` commands were run with the `gemini` and `claude` branches.
   - **Data:** 40 rows × 12 years (2001–2012) of random rain and temperature, with 10% missing days, whole missing windows, and long missing stretches at window edges.
   - **Coverage:** the commands cover cross-year and leap-year windows; rolling and fixed references; `ref_min()`, `minobs()`, `rain_threshold()`, `cuts()` and `tmp_bin()`; `gdd_bin()` with bottom and top coding; and wide output. In unit mode they cover `start()`/`end()`, `event_date()`/`days()`/`lag()`, `partial`, missing dates and 29 February.
   - **Result:** every common variable matched (relative difference ≤ 1e-5), and the variable sets were identical.
   - **Why it counts:** the `claude` branch had been checked against an independent egen-based reference (to 1e-10) and against frozen v5 output. So this confirms Gemini's arithmetic for data without date gaps.
3. **Other checks:**
   - targeted probes of edge cases (section 1)
   - timings at 10, 1,000 and 10,000 rows (section 2)
   - `net install` and `net get` into a temporary PLUS folder
   - a run of the example do-file

## 1. Bugs

| # | Severity | Problem | Evidence |
|---|---|---|---|
| 1 | High | **`wxprep tolong` gives wrong values when the data aren't sorted by id.** It reads the values in row order, then re-sorts the expanded rows by id before storing them (`wxprep.ado:398-402`). | With ids in the order 3, 2, 1, id 1 got id 3's rain: 4 of 6 values wrong. |
| 2 | High | **`wxprep tolong` gives wrong values when the daily variables aren't in date order,** as happens after a `merge`. The date order is applied twice: `wide_varnames = wide_varnames[p]`, then `vec(val_data[., p]')` (`wxprep.ado:438-449`). | 6 of 6 values on the wrong date. |
| 3 | Medium | **`wxprep towide` damages the data when it fails.** It runs `keep if` before validating (`wxprep.ado:71`) and never uses `preserve`. Both `towide` and `tolong` parse `clear` but never use it, so unsaved data are replaced without warning. | A duplicate-date error after `if` left 2 of 3 observations. A `stub()` that makes names too long deleted the value variable. |
| 4 | Medium | **Calendar days with no daily variable are skipped instead of treated as missing.** Both modes keep only the dates that exist (`wxsum.ado:1741`, `2482`). A spell therefore runs straight across the gap, while `r(missing)` counts the same day as missing. Plan §3.2 matches columns by date so that gaps don't shift them. | A 10-day window with no variable for 5 January gives `dry` = 7; the `claude` branch gives 4. |
| 5 | Medium | **A `baseline()` outside the data gives no error and no note.** `ref_min()` defaults to all baseline years, so any baseline that runs past the data does this. Long output has all-missing `dev_`/`z_`; wide output creates no `dev_`/`z_` variables at all. The `claude` branch stops with an error. | `baseline(1981 2010)` on the 2003–2023 sample data. |
| 6 | Medium | **The wrong window is recorded when `fin_day()` is omitted.** The placeholder 28 used for validation (`wxsum.ado:395`) is kept (`wxsum.ado:417`) and used at lines 754, 770 and 820. The calculation itself uses the right end date. | May–October is recorded as "5/1–10/28" in `r(window)`, `_dta[wxsum_window]` and every variable's `[wxsum_window]`. |
| 7 | Low | `tolong` always stores the values as float (`wxprep.ado:466`). Double data therefore change in the round trip that the help file calls exact. | |
| 8 | Low | **Name check too strict.** Long mode refuses data that merely contain an unkept variable named `year` (or any output name), because it checks every variable in memory (`wxsum.ado:665-671`). Unit mode refuses `keep(year)`, though it creates no `year` variable (`wxsum.ado:369-383`). | Long mode stops with r(110), unit mode with r(198). |
| 9 | Low | `r(N_units)` counts input rows, not distinct `keep()` values (plan §5.7). | `keep(region)` with 2 regions gives 10. |
| 10 | Low | **Fixed value-label name.** The `gddcat` value label is always named `_gddcat_lbl`, and every run silently drops and redefines it (`wxsum.ado:1410`). Results from two runs, for example with different `outstub()`s, carry different definitions under the same label name. | |
| 11 | Low | **Invalid input accepted silently:** `days()`/`lag()` without `event_date()`, `ini_day()`/`fin_day()` in unit mode, a negative `lag()`, a non-integer `baseline()`. A missing id in `towide` gives a bare Mata conformability error, r(3200). | |
| 12 | Low | **A season with no daily variables at all** gets `nobs` missing instead of 0. Its `r(missing)` row reports 0% of unit-windows missing. | Drop all `rf_2010*` variables. |

Both branches share one behavior: `fin_month(2) fin_day(29)` silently keeps only the windows that end in a leap year (5 of 21 on the sample data). A note or a fallback to 28 February would help.

### Reproductions

Run these from the repository root after `clear all` and `set maxvar 20000`.

```stata
* 1. tolong on data not sorted by id
clear
set obs 3
gen hhid = 4 - _n
gen float rf_20200101 = 10 * hhid
gen float rf_20200102 = 10 * hhid + 1
wxprep tolong rf_, id(hhid) generate(rain) date(d) clear
list                          // hhid 1 shows 30 and 31, hhid 3's values

* 2. tolong with daily variables out of date order
clear
set obs 2
gen hhid = _n
gen float rf_20200103 = 3
gen float rf_20200101 = 1
gen float rf_20200102 = 2
wxprep tolong rf_, id(hhid) generate(rain) date(d) clear
list                          // rain differs from day(d) on every row

* 3. towide that fails after if
clear
input id date rain
1 21915 1
1 21915 2
2 21915 3
end
format date %td
capture noisily wxprep towide rain if id == 1, id(id) date(date) stub(rf_)
count                         // 2; the data had 3 observations

* 4. a day without a daily variable
clear
set obs 1
gen id = 1
forvalues d = 1/10 {
    gen rf_202001`=string(`d', "%02.0f")' = 0
}
drop rf_20200105
replace rf_20200101 = 5
replace rf_20200110 = 5
wxsum rf_, type(rain) ini_month(1) fin_month(1) ini_day(1) fin_day(10) keep(id)
list dry                      // 7: the run continues across 5 January
matrix list r(missing)        // yet share_any_miss = 1

* 5. baseline() outside the data
use rain.dta, clear
wxsum rf_, type(rain) ini_month(5) fin_month(10) keep(hhid) baseline(1981 2010)
count if !missing(dev_total)  // 0, without an error or a note

* 6. the window when fin_day() is omitted
use rain.dta, clear
wxsum rf_, type(rain) ini_month(5) fin_month(10) keep(hhid)
display "`r(window)'"         // 5/1–10/28
```

## 2. Speed

Times are in seconds, measured on the same machine. The bundled sample data were copied to 1,000 and 10,000 rows.

| Command | `gemini`: 10 / 1,000 / 10,000 rows | `claude`: 10 / 1,000 / 10,000 rows |
|---|---|---|
| rain, 15 May–15 Oct, long | 0.5 / 2.2 / 47 | 0.03 / 0.8 / 13 |
| rain, Nov–Feb, wide | 2.3 / 7.3 / 53 | 0.15 / 1.6 / 15 |
| temp, `gdd_bin()` + `tmp_bin(15)` | 2.3 / 18 / 159 | 0.15 / 4.0 / 33 |
| temp, Nov–Feb, `baseline()` | 2.3 / 11 / 88 | 0.11 / 2.0 / 17 |
| rain, unit windows | 2.2 / 7.9 / 61 | 0.10 / 1.5 / 13 |
| `wxprep towide`, 76,700 rows | 2.7 | 7.8 |

- **Small data.** Each bundled example takes about 0.5 s in a fresh Stata session. Once the session has processed a large dataset, every call takes about 2.2 s, and 2.0 s of that is the Stata-level loop over every variable at `wxsum.ado:459-475`. The Mata copy of the same loop takes 0.14 s. So the plan's target of under 2 seconds per bundled example holds only in a fresh session.
- **Large data.** The 10,000-row times come from Mata loops over every row and every day: moments, spells, monthly totals, bins and references are computed one row at a time.
- **Gemini's own benchmark** (`tests/test_v6_performance.do`) doesn't show this, because its "10,000-row" case has only 90 daily variables.
- **`wxprep towide`** is faster than the `claude` branch's version.

## 3. Plan coverage

**Done as specified:**

- decisions D1–D7, D9 and D11–D14
- v5 problems P1–P6 and P9
- the option set and output names (§4.1–4.2)
- the statistic definitions (§5.1–5.4) and the reference rules in the code (§5.5)
- rollback when a run fails
- the migration message when `kdd_base()` is given without `heat_threshold()`
- the repaired v5 test suites and the frozen v5 output (WS0)
- the feature and unit-window suites (WS3, WS4)

**Short of the plan:**

- **WS2 equivalence (the main correctness check) is not met.**
  - `tests/test_v6_equivalence.do` never runs the WS1 reference: `tests/reference/wxsum_ref.ado` is not used anywhere. Instead it re-codes the same formulas inline, so an error shared by both copies would pass.
  - It doesn't check mid-window spells, monthly totals, heat statistics, bins or `baseline()`.
  - Despite its header, it uses no dates, no cross-year windows and no leap years.
- **WS2 regression.** `tests/test_v6_regression.do` skips rain `mean_mo`, every rain `dev_`/`z_` and the dry spells. Its temperature tolerance is 1e-4. On the bundled data, which have no missing values, all of these should match v5, except `dry` in windows with 0 or 1 rainy days (rule D4).
- **§3.1–3.2 engine.** There are two separate Mata engines: calendar (`wxsum.ado:2316-3157`) and unit (`wxsum.ado:1513-2313`). They duplicate the statistics. Spells are computed one row at a time, not column by column across all rows.
- **Labels (§3.2 step 6, D10).** Rain labels don't state `rain_threshold()`. `tmpbin` labels don't state the bin bounds; v5 did. The wording mixes "season" and "window (season)", and the wide-mode KDD label lacks "(extreme-heat)".
- **Help file (D8, §1.2, §5.2, §5.5, §5.7):**
  - It documents `r(N_seasons)`, `r(lr_years)` and `r(reference_type)`, which don't exist, and omits most of the real results (`wxsum.sthlp:244-252`).
  - It says unit windows outside the data stop with an error (`wxsum.sthlp:145`). In fact they give missing statistics, as the plan specifies.
  - It lacks the spell definitions (D3/D4), the note that the longest spell anywhere is `max(heat_start, heat, heat_end)` (D8), the partial-month note (§5.2), the caution about z-scores of spell lengths, and the note that windows inside a fixed baseline are compared with a baseline that includes them (§5.5).
  - It lacks the list of changes that break v5 commands: `heat_threshold()` required, `save()` needs `replace`, the dry-spell rules.
- **WS6 package:**
  - There is no example log, and `.gitignore` excludes `*.log`.
  - `wxsum.pkg` leaves out the example do-file, although the README tells users to run it.
  - The do-file saves to `examples/`, so it runs only from the repository root.
  - `rain_long.dta` and `temp_long.dta` are at the repository root rather than in `examples/`.
  - There is no toy household dataset: yields are simulated inside the merged weather data.
  - `examples/rainfall_stats.dta`, an output of the example do-file, is committed.
  - The README examples fail at Stata's default `maxvar` of 5,000 (r(900) on `use rain.dta`), and the README doesn't mention `set maxvar`.
- **End-to-end example (§7).** The example does not start from `rain_long.dta`, go through `wxprep towide`, and then run `wxsum`.
- **Wording and examples:**
  - The README (`README.md:131`) and the example do-file (`examples/wxsum_examples.do:123`) describe the `event_date()` window as "following" or "post-planting". It is the `days()` days before the event.
  - The README cites the paper as "*The Stata Journal*, forthcoming" (`README.md:159`).
  - `wxprep.sthlp:78` says `generate()` defaults to `weather`. It defaults to the stub without its trailing underscore.
- **Example parameters on the tropical sample data:**
  - `gdd_binlo(50) gdd_binhi(950)` puts all 210 unit-years in "GDD >= 950" (GDD runs from 1,108 to 1,534).
  - With `tmp_bin(15) tmp_binlo(0) tmp_binhi(39)`, both tail bins that the example displays (`tmpbin01`, `tmpbin15`) are zero for every unit.
  - The illustrative regression has R² = 1.000, because yields are simulated from the regressors.
- **§7 tests not written:** `gddcat` value labels, storage types, the `wxprep` maxvar check, the `towide` failure paths, unsorted input, out-of-order variables, date gaps, and a baseline outside the data.

## 4. Redundancy and verbosity

`wxsum.ado` has 3,159 lines; about 2,000 of them fall into the repeated patterns below. The `claude` branch implements the same plan in 1,567 lines.

1. **Each statistic is written out by hand about eight times.**
   - Where: three lists of output names (`533-662`; the unit and long lists are identical), two label blocks (`861-1054`, with 114 `capture label var` lines), and three storage blocks (unit `2097-2277`, long `2690-2891`, wide `2892-3128`), each with 55 `st_addvar` calls.
   - Fix: one table of statistics (stem, storage type, label template, whether it gets `dev_`/`z_`), read by one loop. The loop builds the names, checks them, and stores the values, labels and characteristics. This would replace about 950 lines with about 100, and the `capture`s would no longer be needed.
2. **The statistics are computed in three places:** calendar windows (`2480-2663`), unit windows (`1715-1861`), and unit reference windows (`1895-2045`). The reference-window code exists twice, once for rolling and once for baseline references. One function that returns every statistic for a block of rows over a set of days could serve all three.
3. **Deviations and z-scores are implemented twice.** There is a matrix version (`1240-1315`) and a scalar version (`1476-1510`), with 31 near-identical calls (`2047-2094`, `2665-2683`). Within the matrix version, the rolling and baseline branches repeat the mean/SD/z code. One routine, called in a loop over the statistics that have a reference, would do.
4. **Each engine repeats its setup.** It reads the same 22 parameters with `strtoreal(st_local())` and declares and initializes about 50 result vectors one by one (`1515-1709`, `2323-2478`). A struct filled once and one N × K result matrix would replace this.
5. **Finding the daily variables is coded three times, with different rules** (`448-475`, `1602-1634`, `2410-2440`): the unit-mode copy doesn't check that the variables are numeric. One vectorized Mata function would replace all three and remove the 2-second Stata loop.
6. **Scalar loops that vector operations could replace.** This is also where the time goes.
   - spells (`1127-1237`): three loops per row and up to four `is_temp ? :` tests per day; building the indicators once and looping over days across all rows would be shorter and faster
   - GDD and KDD: summed day by day in four copies (`1804-1808`, `1950-1954`, `2026-2030`, `2577-2581`)
   - monthly totals, `tmp_bin()` and `cuts()`: computed one row at a time
7. **Smaller items:**
   - `_wxsum_shift_date` and `_wxsum_baseline_date` are the same function, and `_wxsum_is_leap_year` isn't needed (`1447-1474`).
   - Validation has 49 `exit 198` blocks and 13 sentinel `-999999999` defaults. Small helpers for "X requires Y" and "X is not allowed with this type" would shorten it.
   - The window text is built three times (`754`, `770`, `820`), as is the reference text (`759`, `799`, `838`).
   - Dead code:
     - `local dtype` (`690`, `868`) always equals `type`
     - `is_baseline` copies `has_baseline` (`325-326`)
     - the branches that write `r(missing)` directly are never used (`2308-2312`, `3152-3156`)
     - ``if `c' == .`` can't be true for a numlist (`280`)
8. **`wxprep`:**
   - `tolong` passes its data between two Mata steps through external globals (`wxprep.ado:418-471`). One step after `expand`, keyed on an explicit row id, would be shorter and would also fix bug 1.
   - Its variable-discovery loop (`352-366`) repeats `wxsum`'s.
   - `rename` checks names with `list posof` inside loops (`252`, `263`, `283`, `320`), so the time grows with the square of the number of variables: 0.9 s at 3,000 variables.
9. **Tests:**
   - `tests/reference/wxsum_ref.ado` (992 lines) is never run; either use it as the equivalence oracle or delete it.
   - In `tests/wxsum_release_synthetic_validation.do`, test #4 now uses input temperatures of 150–180 for location 2, but the comment still says 50–80 (line 97).

## 5. If this branch is kept: suggested order of work

1. Fix `wxprep tolong` (bugs 1, 2 and 7) and make `towide`/`tolong` atomic with a working `clear` (bug 3). Add tests with unsorted ids, out-of-order variables, double data and failure paths.
2. Fix `wxsum` bugs 4–6 and add tests for gaps, a baseline outside the data, and the recorded window.
3. Correct the help file and README (section 3). Ship the example do-file and its log in the package.
4. Make the equivalence test compare the engine with `wxsum_ref.ado`, as WS2 requires.
5. Refactor along section 4, items 1–6. This also brings the speed into line: the per-row, per-day loops are the bottleneck.
