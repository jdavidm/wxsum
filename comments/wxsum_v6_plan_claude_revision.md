# wxsum v6.0: Implementation Plan

**Scope:** code changes to the `wxsum` package only (ado files, help files, tests, package files, example files, `index.html`/`README.md`). Manuscript changes come afterwards.
**Status:** ready for author approval. All design decisions are settled (§1). No code has been changed.
**Builds on:** Gemini's revision (`comments/claude_plan_review_and_revised_plan.md`), the earlier Claude plans, the referee report, the editor's comments, the v5.0 code (tested in Stata 18 MP), and the authors' decisions.

> Once this plan is approved, keep it as the only plan file. Delete `comments/claude_plan_review_and_revised_plan.md` and `comments/wxsum_v6_implementation_plan.md`, which are near-duplicates of each other.

---

## 1. Decisions (all settled)

| # | Decision |
|---|---|
| D1 | **`shape(long\|wide)` is kept; long is now the default.** Omitting `shape()` gives long output (one row per unit-year, a `year` variable, no `_YYYY` suffix). `shape(wide)` gives the v5 wide layout. There are no standalone `long`/`wide` options. |
| D2 | **Wide input only.** Long data go through `wxprep` first. |
| D3 | **Leading and trailing spells skip missing days at the window edges.** They count from the first and last *observed* day. `0 0 0 0 . . .` gives `dry_end = 4`. A missing day inside a run still ends it. |
| D4 | **Mid-window spell, rule (ii).** Spell days are the days that make up a spell (dry: R < c; heat: T ≥ h). Break days are the opposite (dry: R ≥ c; heat: T < h). With ≥ 2 break days, the mid-window spell is the longest run of spell days strictly between the first and last break day. With 0–1 break days, it is the longest run of observed spell days anywhere in the window. Missing days end runs. |
| D5 | **`wxprep` has three subcommands:** `towide` (long → wide), `rename` (wide → wide, standard names), `tolong` (wide → long). |
| D6 | **`heat_threshold(#)` is a new required option for `type(temp)`.** It is the threshold for heat days and heat spells, and also the KDD base. **`kdd_base(#)` is optional** and is used only when the KDD base should differ from `heat_threshold()`. This breaks v5 temperature commands (they lack `heat_threshold()`); that cost is accepted. |
| D7 | **GDD, KDD and heat days/spells are core temperature statistics, always computed.** `gdd_lo()`, `gdd_hi()` and `heat_threshold()` are required for `type(temp)`. The only optional statistics are bins and categories (`tmp_bin()`, `cuts()`, `gdd_bin()`). |
| D8 | **Heat spells use the same structure as dry spells:** `heat_start`, `heat` (mid-window, D4) and `heat_end`, all computed by one shared routine. The help file shows that the longest heat spell anywhere is `max(heat_start, heat, heat_end)`. |
| D9 | **Only two types: `rain` and `temp`.** Other daily series (e.g., humidity, wind, wet-bulb temperature) run under `type(temp)` and must supply the temperature thresholds. |
| D10 | **Option names from v5 are kept**, with `heat_threshold()` added (D6). Labels and help text use neutral "window (season)" wording. |
| D11 | **`outstub(string)`** is added to the start of every output variable name. |
| D12 | **Window modes:** calendar (`ini_month() fin_month() [ini_day() fin_day()]`) **or** unit-specific (`start() end()`, or the shortcut `event_date() days() [lag()]`), with `partial` available in unit-specific mode. Exactly one mode per call. |
| D13 | **Defaults:** `ref_min()` = all reference years; `minobs(1)`; unit-specific windows that run past the data get missing statistics unless `partial` is given. |
| D14 | **Deviations and z-scores are not added for `mean`.** |

### 1.1 Considered and not adopted (for the cover letter)

| Proposal | Decision | Reason |
|---|---|---|
| `type(generic)` | Not adopted | Non-rain series run under `type(temp)` (D9). |
| `stats()` option to choose statistics | Not adopted | Every statistic except bins is a core output (D7). |
| Long input to wxsum | Not adopted | `wxprep towide` covers it (D2). |
| Physical composites (heat index, WBGT, wet bulb) and combined heat + rain metrics computed inside wxsum (editor #3) | Not adopted | They need extra inputs (humidity, pressure, radiation) and there are competing formulas. Supported route: build the daily series or indicator with `wxprep tolong` + `generate` + `wxprep towide`, then summarize it with wxsum. |
| Thresholds based on each location's own percentiles (editor #3) | Deferred | Definitions vary (moving windows, choice of baseline); better added once `baseline()` exists. |
| Users naming each output variable (editor #13) | Not adopted | About 25 statistics × S windows. Fixed stems plus `outstub()` keep long output and `i.gddcat` usable. |

### 1.2 Compatibility with v5 (for the help file and README)

- **Temperature commands must add `heat_threshold()`.** If `kdd_base()` is given without `heat_threshold()`, wxsum stops with a message such as: *"heat_threshold() is required in wxsum 6; in v5, kdd_base() set the KDD threshold. Use heat_threshold(#), and add kdd_base(#) only if the KDD base should differ."*
- **Commands without `shape()` now return long output.** Add `shape(wide)` to get v5 output.
- **`save()` no longer overwrites without `replace`.**
- **Windows with no observed days now give missing instead of 0**, so rolling deviations differ wherever v5 used those zeros.
- **Dry-spell values change** where D3/D4 apply.

---

## 2. v5.0 problems to fix

All confirmed by reading the code and, where noted, by running Stata.

| ID | Problem | Evidence |
|---|---|---|
| P1 | **Windows with no data give 0, not missing.** `egen rowtotal()` gives 0 for all-missing rows in `total`, `mean_mo`, `raindays`, `norain`, `gdd`, `kdd` and `gddcat`, and the zeros enter baselines. | An all-missing 2020 season gave `dev_total_2023 = 50`; the correct value is 20. |
| P2 | **Rolling baseline silently uses fewer than L years.** | `wxsum.ado:604-608` |
| P3 | **Monthly totals keyed by month only, not year-month.** | `wxsum.ado:491` |
| P4 | **A name clash or bad `keep()` leaves partial variables behind**, and `keep()` is only checked at the end. | A name clash gave r(110) after 14 variables were created; a bad `keep()` gave r(111) after all computation. |
| P5 | **3 of the 6 test suites fail.** Arithmetic error (validation #3: Jan+Feb 1994 is 59 days, not 32). Assertions that KDD is absent although `kdd_base(0)` is given (validation #13, synthetic #5). Dry-spell assertions written for different rules (test_dryspells seq 2). | Batch runs |
| P6 | **Options that don't apply to the type are silently ignored** (e.g., `rain_threshold()` with temp, `gdd_bin()` checks only partly). | Code review |
| P7 | **Slow.** | 22.7 s (10 rows of rain), 30.5 s (1,000 rows), 65.3 s (10 rows of temp with `tmp_bin(15)`). |
| P8 | **The bundled wide data need `set maxvar`.** | 7,671 / 7,640 variables, against a default limit of 5,000. |
| P9 | **Housekeeping.** `cap program drop`, no `*! version` line, `save()` always overwrites, a stale `wxsum_submission/`, rain and temp outputs clash on the same data, and `index.html`/`README.md` describe v5. | Code review |

---

## 3. Architecture

### 3.1 Principles

- **One Mata engine** inline at the end of `wxsum.ado`. It covers both window modes, so there is no second slow code path.
- **Nothing in the user's data changes unless the whole run succeeds.**
  1. Validate everything, including every output name and name length.
  2. `preserve`.
  3. Compute in Mata.
  4. Create the output variables with `st_addvar` and `st_store`. No `clonevar`: copying doubles peak variable use.
  5. Build the long or wide output, `compress`, `restore, not`.
- **The ado layer only does what Stata does best:** parsing, validation, labels, characteristics, `expand`, and r() results.

### 3.2 Steps

1. **Parse and validate.**
   - `keep()` becomes a real `varlist`.
   - `shape()` must be `long` or `wide` (default `long`).
   - Exactly one window mode (D12). `partial` only in unit-specific mode.
   - `type(temp)` requires `gdd_lo()`, `gdd_hi()` and `heat_threshold()`; `kdd_base()` is optional (D6, D7).
   - Options that don't apply to the type are an error: `rain_threshold()` with temp; `heat_threshold()`, `kdd_base()`, `gdd_*()` and `tmp_bin*()` with rain.
   - `tmp_bin()` cannot be combined with `cuts()`.
   - `lr_years()` cannot be combined with `baseline()`. `lr_years` gets an internal sentinel default so wxsum knows whether the user set it.
   - `confirm new variable` for every planned output name, plus `year` in long mode.
   - Every name must be ≤ 32 characters with the chosen `outstub()`. For example, `dev_pct_heatdays_2001` is 21 characters, so `outstub()` can be at most 11.
   - Projected variable count (inputs + outputs) against `c(maxvar)`, with an error message that names `set maxvar`.
2. **Build the calendar.** Parse the `stub` + `yyyymmdd` variables into a date vector `d`.
   - Calendar mode: column indices for each window.
   - Unit-specific mode: column bounds for each row, `c_start,i = s_i − d_1 + 1`, matched by date so gaps in the data don't shift columns.
3. **Compute, one window at a time,** reading values through `st_view`. Mata has **no built-in row mean, median, variance or skewness**, so the engine implements them:
   - `n = rownonmissing(X)`; sums with missing treated as 0, then set to missing where `n == 0` (fixes P1)
   - mean, variance, SD, skewness (v5 formulas, unchanged)
   - median by sorting each row's non-missing values
   - max
   - GDD and KDD by clamping
   - threshold counts and shares
   - bins (`tmp_bin`, `cuts`) by interval lookup
   - monthly totals grouped by **year-month** (fixes P3)
   - spells, using one shared routine for dry and heat (D3, D4, D8), computed column by column across all rows at once
   - after computing, statistics for windows with `n < minobs` are set to missing
4. **Reference statistics.** `dev_` and `z_` from the N × W matrices for each statistic, rolling or fixed baseline, with the `ref_min()` rule (fixes P2). A zero SD gives a missing `z_`.
5. **GDD categories** from the pooled seasonal GDD totals (v5 rules).
6. **Write the output.**
   - **Long (default).** `keep` the `keep()` variables, keep an internal row-order variable, `expand W`, add `year`, then `st_store` each block of results. This is done in Stata rather than in one Mata matrix because **`keep()` variables may be strings**, which a numeric Mata matrix cannot hold. It replaces v5's tempfile/append loop.
   - **Wide (`shape(wide)`).** `st_addvar` with the v5 `_YYYY` names.
   - **Unit-specific mode.** One window per row, no year suffix; `shape()` has no effect and wxsum prints a note if it was given.
   - **Storage:** byte/int for counts, float for continuous statistics (as in v5), int for `gddcat` with its value label.
   - Labels show the actual thresholds, e.g. `"Killing (extreme-heat) degree days above 32"`, `"Days with temp >= 32"`. Labels stay ≤ 80 characters.
   - Characteristics on each variable (`[wxsum_stat]`, `[wxsum_window]`) and on the dataset (`_dta[wxsum_cmdline]`).
7. **Finish.** `compress`, `restore, not`, set r() results (§5.7), print a summary table.

### 3.3 Files

```
wxsum.ado, wxsum.sthlp      v6 (rclass, inline Mata)
wxprep.ado, wxprep.sthlp    NEW
wxsum.pkg, stata.toc        v6.0, new files, ancillary data
examples/                   wxsum_examples.do + .log, rain_long.dta, temp_long.dta, toy household data
tests/                      repaired v5 suites, new v6 suites, run_all.do
README.md, index.html       updated to v6
```

---

## 4. Syntax and names

### 4.1 `wxsum` options

| Option | Group | Status | Notes |
|---|---|---|---|
| `type(rain\|temp)` | required | v5 | |
| `ini_month() fin_month() [ini_day() fin_day()]` | calendar window | v5 | |
| `start(varname) end(varname)` | unit-specific window | new | `%td`, with `end ≥ start`. Missing dates give missing output. |
| `event_date(varname) days(#) [lag(#)]` | unit-specific window | new | Shortcut: `start = event − days − lag`, `end = event − 1 − lag`. |
| `partial` | unit-specific window | new | Compute windows that run past the data using the days available. |
| `rain_threshold(#)` | rain | v5 | Default 1. |
| `gdd_lo(#) gdd_hi(#)` | temp, **required** | v5 | |
| `heat_threshold(#)` | temp, **required** | **new** | Threshold for heat days and heat spells; also the KDD base. |
| `kdd_base(#)` | temp, optional | v5, **now optional** | Overrides the KDD base only. |
| `gdd_bin() gdd_binlo() gdd_binhi()` | temp, optional | v5 | GDD categories. |
| `tmp_bin() tmp_binlo() tmp_binhi()` | temp, optional | v5 | Equal-width daily bins. |
| `cuts(numlist)` | rain or temp, optional | new | Ascending cutpoints giving bins (−∞, c₁), [c₁, c₂), …, [c_K, ∞). Cannot be combined with `tmp_bin()`. |
| `lr_years(#)` | reference period | v5 | Default 10 when `baseline()` is not given. |
| `baseline(y1 y2)` | reference period | new | Fixed normal. Cannot be combined with an explicitly set `lr_years()`. |
| `ref_min(#)` | reference period | new | Default: all reference years. |
| `minobs(#)` | missing data | new | Default 1. |
| `shape(long\|wide)` | output | v5, **default now `long`** | |
| `outstub(string)` | output | new | Added to the start of every output name. |
| `keep(varlist)` | output | v5 | Now checked first. |
| `save(filename [, replace])` | output | v5, revised | No longer overwrites without `replace`. |

### 4.2 Output stems (long mode; `shape(wide)` adds `_YYYY`, `outstub()` goes in front)

```
Both types:   nobs, mean, median, var, sd, skew
Rain:         total, mean_mo, raindays, norain, pct_raindays, dry_start, dry, dry_end
Temp:         max, gdd, kdd, heatdays, pct_heatdays, heat_start, heat, heat_end
Optional:     gddcat (gdd_bin); tmpbin01..tmpbinJJ (tmp_bin); cut01..cutKK (cuts, K+1 bins)
Reference:    dev_<stem>, z_<stem> for the stems in §5.5
Long mode:    year
```

`var` and `max` are allowed Stata names. Bin names keep v5's two-digit numbering.

### 4.3 `wxprep`

```stata
wxprep towide varname [if] [in], id(varlist) date(varname) stub(string) ///
    [daily(mean|sum|min|max) dateformat(string) nofill clear save(filename [, replace])]
wxprep rename varlist, stub(string) firstdate(string)
wxprep rename varlist, stub(string) from(oldstub) dateformat(string)
wxprep tolong stub, id(varlist) [generate(varname) date(varname) clear]
```

- `date()` accepts `%td`, `%tc`/`%tC` (via `dofc()`), `YYYYMMDD` integers, or strings (strings need `dateformat()`).
- `daily()` is required when an id × date appears more than once; otherwise wxprep stops and reports the duplicates.
- `stub()` is used exactly as typed.
- Every calendar day between the first and last date is created and filled with missing unless `nofill` is given.
- Checks `c(maxvar)` before reshaping.
- `rename` checks every new name (valid date, no duplicate dates, no existing name, numeric) **before** renaming anything, and reports gaps.
- `tolong` produces `id`, a `%td` date, and the value. The round trip with `towide` reproduces the original data exactly.

---

## 5. Statistic definitions that change or are new

**5.1 Missing data.** A window with no observed days has missing values for every statistic, including totals and counts (P1). `minobs(#)` extends this to windows with fewer than # observed days. `nobs` is always created.

**5.2 Monthly mean (`mean_mo`).** The mean of the year-month totals inside the window. Partial months at the window edges count as months (documented).

**5.3 Dry spells.** D3/D4 with R < `rain_threshold` as spell days. All-missing windows give missing.

**5.4 Temperature thresholds and heat spells** (h = `heat_threshold()`, k = `kdd_base()` if given, otherwise h).
- `kdd` = Σ max(T − k, 0) over observed days
- `heatdays` = observed days with T ≥ h
- `pct_heatdays` = `heatdays / nobs`
- `heat_start`, `heat`, `heat_end`: D3/D4 with T ≥ h as spell days (D8)
- The help file explains that the meaning of h depends on the daily series supplied (mean vs. maximum temperature).

**5.5 Reference statistics (`dev_`, `z_`).**
- Rain: `total`, `mean_mo`, `raindays`, `norain`, `pct_raindays`, `dry_start`, `dry`, `dry_end`
- Temp: `gdd`, `kdd`, `heatdays`, `pct_heatdays`, `heat_start`, `heat`, `heat_end`
- Not `mean` (D14).
- Rolling: strictly earlier windows `t−L … t−1`.
- Fixed: windows that start in `[y1, y2]`. Windows inside the baseline are compared with a baseline that includes them; this is documented and recorded in the characteristics.
- `ref_min()` applies to both.
- Unit-specific mode: the same window shifted back 1…L years (or to each baseline year), with Feb 29 mapped to Feb 28.
- The help file notes that z-scores of spell lengths, which are often zero, should be read with care.

**5.6 Wording.**
- Help text and console output use "window (season)".
- KDD label: `"Killing (extreme-heat) degree days above k"`, with the numeric k.
- The longer explanation of the term goes in the paper.

**5.7 r() results and summary** (editor #5).

| r() result | Contents |
|---|---|
| `r(N)` | Rows of output |
| `r(N_units)` | Distinct `keep()` combinations, when given |
| `r(k_created)`, `r(varlist)` | Number and names of variables created |
| `r(n_windows)`, `r(first_year)`, `r(last_year)`, `r(years)` | The windows processed |
| `r(mode)` | `calendar` or `unit` |
| `r(type)`, `r(shape)` | |
| `r(window)` | e.g. `"15may–15oct"`, or the start/end variable names |
| `r(rain_threshold)`, `r(gdd_lo)`, `r(gdd_hi)`, `r(heat_threshold)`, `r(kdd_base)` | Whichever apply |
| `r(ref)` | e.g. `"rolling 10"` or `"baseline 1981–2010"` |
| `r(minobs)`, `r(cmdline)` | |
| `r(missing)` | Matrix, one row per window: days in the window, mean `nobs`, share of unit-windows with any missing day, share with all days missing, number set to missing by `minobs()`. In unit-specific mode, also the number of windows outside the data and the number with missing dates. |

The printed summary repeats these values. The same metadata is stored in characteristics so it survives `save`.

---

## 6. Workstreams

| WS | Content | Done when | Depends on |
|---|---|---|---|
| **WS0** Tests first | **Repair P5:**<br>• validation #3 arithmetic<br>• validation #13 / synthetic #5 now expect KDD present<br>• test_dryspells seq 2 (`dry = 4`, `dry_end = 4`)<br>• add `heat_threshold()` to every temperature test (D6)<br>• add `shape(wide)` where tests assume wide output (D1)<br><br>Add `tests/run_all.do`. Freeze v5 output on the bundled data. | All repaired suites pass under the WS1 reference code. | — |
| **WS1** Reference fixes in the current code | P1, P2 (`ref_min`), P3, P6 validation, D3/D4, `heat_threshold()` + optional `kdd_base()` (D6) with the migration message, long default for `shape()`, P9 code housekeeping (`cap program drop`, `*! version 6.0.0`, `save(…, replace)`). | This fixed version is the **reference implementation** for WS2. | WS0 |
| **WS2** Mata engine | §3.2, calendar mode, existing statistics; `shape()`; `outstub()`; checks before computing; nothing left behind on failure. | **Equivalence:** engine functions called directly in double precision match WS1 to 1e-10 on random data with missing values, cross-year windows and leap years. **Regression:** stored output matches frozen v5 to relative difference < 1e-6 (float storage) for statistics whose meaning didn't change. Bundled examples run in < 2 s, measured. | WS1 |
| **WS3** Features | Heat days/spells, `cuts()`, `baseline()`, spell reference statistics, `nobs`/`minobs()`, r() results and summary, characteristics, labels. | §7 suites pass. | WS2 |
| **WS4** Unit-specific windows | `start()/end()`, `event_date()/days()/lag()`, `partial`, edge and missing-date rules, shifted reference windows. | Unit-window suite passes, including windows of different lengths. | WS2 (reference logic from WS3) |
| **WS5** `wxprep` | §4.3. | wxprep suite and round trip pass. | Independent; can run alongside WS1–WS2 |
| **WS6** Package | Example do-file + log (all article examples, `return list`, `wxprep` demo, merge onto a toy household dataset, one illustrative regression); `rain_long`/`temp_long`; help files with a "changes from v5" section (§1.2); `wxsum.pkg`/`stata.toc`; `README.md` and `index.html`; delete `wxsum_submission/` and the duplicate plan files. | `net install` from a branch works in a clean Stata, and the example log is regenerated from a clean session. | WS3–WS5 |

---

## 7. Verification

| Suite | Checks |
|---|---|
| Legacy | Repaired v5 suites pass. |
| Equivalence | Engine vs. WS1 reference at 1e-10 (double precision, direct Mata calls): 200 rows × 25 years, 10% missing, both types, cross-year windows, Feb 29. |
| Regression | Stored v6 output vs. frozen v5 (relative difference < 1e-6) for statistics whose meaning didn't change. |
| Spells | Dry and heat: edge missing days, a single break day, no break days, missing inside a run, all-missing windows. |
| Temperature thresholds | Missing `heat_threshold()` is an error, with the migration message when `kdd_base()` is given; KDD uses `heat_threshold()` by default and `kdd_base()` when given; missing `gdd_lo()`/`gdd_hi()` is an error. |
| Missing data | P1 cases; `minobs()`; `ref_min()`; contents of `r(missing)`. |
| Reference | Rolling and `baseline()` vs. manual calculations; zero SD gives missing z; `lr_years()` + `baseline()` rejected. |
| Unit-specific windows | Varying-length `start()/end()`; `event_date()/days()/lag()`; `partial`; missing dates; Feb 29; shifted reference windows. |
| Rollback | (a) Name clash and (b) a forced failure after computation. For (b), use a test-only global (`$WXSUM_TEST_FAIL`) checked just before writing the output. The data signature (`datasignature`) must be unchanged with no new variables. Break can only be tested by hand and is noted as such. |
| Output | Default long; `shape(wide)`; `outstub()` and the length limit; string `keep()` variables in long output; `year` clash; `gddcat` value labels; storage types; `save(…, replace)`. |
| Options | Each option that doesn't apply to the type is rejected; `tmp_bin()` + `cuts()` rejected. |
| `wxprep` | Each date form; duplicates rejected without `daily()`; filling and `nofill`; `maxvar` check; `rename` failure leaves the data unchanged; `tolong` → `towide` round trip is exact. |
| End-to-end | Long sample → `wxprep` → `wxsum` (both modes) → merge → regression. This is the example do-file. |
| Performance | Timings for the bundled data and for 1,000 and 10,000 rows, reported in the test log (no assumed numbers). |

---

## 8. Reviewer and editor items (code only)

| Item | Handled by |
|---|---|
| Referee: long-to-wide option | `wxprep` |
| Referee: fixed baseline | `baseline()` |
| Referee: location-varying season | Unit-specific windows |
| Referee: spell deviations and z-scores | §5.5 |
| Editor #1–3: broader use | Unit-specific windows (e.g., pregnancy), heat days/spells, `cuts()` exposure bands. Composites and percentile thresholds handled as in §1.1. |
| Editor #4 | `wxprep` |
| Editor #5 | §5.7 |
| Editor #6, #10 | WS6 example do-file, log and toy data |
| Editor #7 | D1 (long default) |
| Editor #8 | §5.6 |
| Editor #9 | `maxvar` checks, long samples, `wxprep` |
| Editor #11 | Manuscript only |
| Editor #12 | WS1 |
| Editor #13 | §3.1, `outstub()`, §1.1 |
| Editor #14 | `compress`, narrow storage types |
