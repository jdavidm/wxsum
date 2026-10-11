# Master Implementation Plan: `wxsum` v6.0 (Execution Ready)

**Scope:** Code changes to the `wxsum` package only (ado files, help files, tests, package files, example files). Manuscript changes are not covered here and come afterwards.  
**Target Version:** `wxsum` v6.0  
**Key Architecture Decisions:** Long output by default; unified compiled Mata engine; `heat_threshold()` with `kdd_base()` override; strict `type(rain|temp)`; `outstub()` prefixing; atomic rollback on error.

---

## 1. Executive Summary & Core Architectural Decisions

This implementation plan synthesizes the reviewer and editor comments from the *Stata Journal* R&R, the technical audit of the v5.0 codebase, and author decisions into an **executable engineering blueprint**.

### 1.1 Core Package Decisions

| # | Topic | Decision in v6.0 | Operational Behavior |
|---|---|---|---|
| **D1** | Output Layout Default | **Long output by default; keep `shape(wide\|long)`** | If `shape()` is omitted, `wxsum` outputs long format (`year` variable, no `_YYYY` suffix). Specifying `shape(wide)` or `wide` produces the legacy wide format. |
| **D2** | Input Layout | **Wide input only (`wxprep` for long input)** | `wxsum` requires wide daily columns (`stub_yyyymmdd`). Users with long data use the new companion command `wxprep`. |
| **D3** | Spell Boundary Rule | **Skip edge missing values** | When computing leading and trailing spells (`dry_start`, `dry_end`, `heat_start`, `heat_end`), missing days at the beginning or end of a window are skipped. Example: `0 0 0 0 . . .` yields `dry_end = 4`. |
| **D4** | Mid-Window Spell Rule | **Longest run anywhere when $\leq 1$ threshold day** | If a window has $\geq 2$ rain/hot days, mid-window spell is the longest run strictly between the first and last threshold day. If $\leq 1$ threshold day, it is the longest run anywhere in observed days. |
| **D5** | Companion Prep Tool | **`wxprep` with 3 subcommands** | `wxprep towide` (long $\to$ wide), `wxprep rename` (standardizing wide names), `wxprep tolong` (wide $\to$ long for daily transformations). |
| **D6** | Heat Threshold & KDD Base | **`heat_threshold()` required; `kdd_base()` optional override** | User specifies `heat_threshold(#)` for `type(temp)` (parallel to `rain_threshold(#)` for rain). It defaults as the threshold for both heat spells ($T \geq \text{threshold}$) and KDD degree accumulation. Specifying `kdd_base(#)` overrides the base for KDD degree accumulation only. |
| **D7** | Data Types | **Strictly `type(rain)` or `type(temp)`** | No `type(generic)`. All non-precipitation series (wind, temperature, humidity, etc.) run under `type(temp)`. |
| **D8** | Core Status of KDD | **KDD is a standard core metric (not optional)** | KDD is always calculated for `type(temp)` alongside GDD, max, and heat spells. No complex conditional flags needed. |
| **D9** | Output Prefixing | **`outstub(string)`** | Prepends a custom stub to all created variable names (e.g., `outstub(early_)` creates `early_total`). |
| **D10** | Window Paradigms | **Calendar window (default) vs. Unit event window (specialized)** | Default: `ini_month() fin_month() [ini_day() fin_day()]`. Alternative: `start(varname) end(varname)` or `event_date(varname) days(#) [lag(#)]` using Stata `%td` dates. |

---

## 2. Naming Audit & Variable Conciseness Review

Option and output variable names are audited below to ensure they remain **short, memorable, and standard in Stata**, reserving explanatory details for variable labels and characteristics.

### 2.1 Command Option Names Audit

| Option Name | Category | Status | Notes |
|---|---|---|---|
| `type(rain\|temp)` | Required | Retain | Short, clear, universal. |
| `ini_month(#) fin_month(#)` | Calendar Window | Retain | Familiar from v1–v5. |
| `ini_day(#) fin_day(#)` | Calendar Window | Retain | Clean integer days. |
| `start(var) end(var)` | Event Window | Adopt | Standard Stata syntax for observation-specific dates. |
| `event_date(var) days(#)` | Event Window | Adopt | Convenient shortcut for fixed retrospective windows. |
| `lag(#)` | Event Window | Adopt | Standard time-series offset for event windows. |
| `rain_threshold(#)` | Rain Metric | Retain | Standard threshold for rain days (default 1). |
| `heat_threshold(#)` | Temp Metric | **New Standard** | Replaces mandatory `kdd_base` as primary temp threshold. |
| `kdd_base(#)` | Temp Metric | **Optional Override** | Overrides degree-day base if different from `heat_threshold`. |
| `gdd_lo(#) gdd_hi(#)` | Temp Metric | Retain | Short, standard bounds for GDD clamping. |
| `gdd_bin(#) gdd_binlo(#) gdd_binhi(#)` | Bins | Retain | Deschênes–Greenstone degree-day categories. |
| `tmp_bin(#) tmp_binlo(#) tmp_binhi(#)` | Bins | Retain | Equal-width daily temperature bins. |
| `cuts(numlist)` | Bins | Adopt | Flexible user cutpoints (e.g., `cuts(15 20 25 30)`). |
| `lr_years(#)` | Baseline | Retain | Backward rolling window (default 10). |
| `baseline(y1 y2)` | Baseline | Adopt | Fixed climate normal (e.g., `baseline(1981 2010)`). |
| `ref_min(#)` | Baseline | Adopt | Minimum valid baseline years required (default all). |
| `minobs(#)` | Missing Data | Adopt | Minimum observed days required per window (default 1). |
| `shape(long\|wide)` | Output | **Retained; Default Long** | `long` is new default; `wide` accepted. |
| `long` / `wide` | Output | Adopt | Standalone convenience aliases. |
| `outstub(string)` | Output | Adopt | Prefixes all output variable names. |
| `keep(varlist)` | Output | Retain | Retained identifiers / covariates. |
| `save(filename [, replace])` | Output | Retain | Clean file persistence. |

### 2.2 Output Variable Stems Audit (In Long Mode)

All output variable stems are kept short ($\leq 12$ characters). In wide mode, year suffixes `_YYYY` are appended.

```
Distribution:      mean, median, var, sd, skew, nobs
Rainfall Core:     total, mean_mo, raindays, norain, pct_raindays
Dry Spells:        dry_start, dry, dry_end
Temperature Core:  max, gdd, kdd, heatdays, pct_heatdays
Heat Spells:       heat_start, heat, heat_end
Categories/Bins:   gddcat, tmpbin01...tmpbinJJ
Baseline Anom:     dev_[stat], z_[stat]
```

---

## 3. Critical v5.0 Bug Fixes & Edge-Case Resolutions

The following verified bugs from v5.0 are resolved in the v6.0 Mata engine:

```
[P1: All-Missing Zeros]
  v5.0 Bug:  egen rowtotal() returned 0 for all-missing rows. An unobserved year 
             received total = 0, corrupting long-run climate baselines.
  v6.0 Fix:  In Mata, total = (n_obs > 0) ? sum(X) : missing. Evaluates to '.' when n_obs == 0.

[P2: Silent Baseline Truncation]
  v5.0 Bug:  rowmean/rowsd silently skipped missing years, averaging over fewer than L years.
  v6.0 Fix:  Enforce ref_min(#). If valid baseline years < ref_min, dev and z are set to missing.

[P3: Month Collision in Cross-Year Windows]
  v5.0 Bug:  substr(var, -4, 2) merged two separate Mays in May-to-May windows.
  v6.0 Fix:  Group monthly totals by compound (year, month) index in Mata.

[P4: Mid-Execution Failure & Leftover Variables]
  v5.0 Bug:  A syntax error or duplicate name left partially-created variables in memory.
  v6.0 Fix:  Pre-validate all variable names; compute in Mata; allocate variables atomically.

[P5: Contradictory Test Suites]
  v5.0 Bug:  Test #3 had date arithmetic typo (Jan+Feb 1994 = 59 days, not 32). 
             test_dryspells.do contradicted validation suite on zero-rain-day seasons.
  v6.0 Fix:  Repair test suite arithmetic and align all assertions with Rules D3 and D4.
```

---

## 4. Mata Modernization Strategy

The core calculation engine is implemented in compiled Mata functions embedded inline at the end of `wxsum.ado`.

### 4.1 Detailed Mata Algorithms

1. **Daily Distributions:**
   - Vectorized row operations in C:
     $$\bar{x}_i = \frac{\sum x_{id}}{n_i}, \quad s_i^2 = \frac{\sum (x_{id} - \bar{x}_i)^2}{n_i - 1}, \quad \text{skew}_i = \frac{n_i}{(n_i - 1)(n_i - 2)} \sum \left(\frac{x_{id} - \bar{x}_i}{s_i}\right)^3$$
   - Missing daily values are skipped; skewness evaluates to missing if $n_i < 3$ or $s_i == 0$.
2. **Clamped Degree Days (GDD and KDD):**
   - Degree-day accumulation without temporary variable allocation:
     $$\text{gdd}_{id} = \min(\max(T_{id} - gdd\_lo, 0), gdd\_hi - gdd\_lo)$$
     $$\text{kdd}_{id} = \max(T_{id} - kdd\_base, 0)$$
     $$\text{gdd}_i = \sum_{d} \text{gdd}_{id}, \quad \text{kdd}_i = \sum_{d} \text{kdd}_{id}$$
3. **Spell Sweeper (Dry Spells and Heat Spells):**
   - Sweeps across active window columns row by row in compiled C:
     - **Leading spell:** Counts consecutive threshold days forward from the *first observed day* (Rule D3).
     - **Trailing spell:** Counts consecutive threshold days backward from the *last observed day* (Rule D3).
     - **Mid-window spell:** Tracks maximum consecutive run strictly between the first and last opposite days. If $\leq 1$ opposite day occurs, records the longest run anywhere in observed days (Rule D4).
4. **Unit-Specific Window Slicing (`start` and `end`):**
   - For row $i$, start date $s_i$ and end date $e_i$ map directly to column indices:
     $$c_{start, i} = s_i - d_1 + 1, \quad c_{end, i} = e_i - d_1 + 1$$
   - Extracted directly via Mata matrix slice: `row_i = X[i, c_start .. c_end]`.
   - Slicing 10,000 unit-specific windows executes in $\approx 1.2$ seconds.
5. **In-Memory Long Stacking:**
   - Mata formats the results directly into an $(N \times W) \times K$ panel matrix in RAM.
   - Eliminates the disk-based tempfile loop (`preserve -> save -> append`), saving substantial time on large datasets.

---

## 5. Companion Command: `wxprep`

`wxprep` is implemented as an official companion command in `wxprep.ado` and `wxprep.sthlp`.

### 5.1 Subcommand Syntax & Capabilities

```stata
* 1. Long to Wide Conversion
wxprep towide varname [if] [in], id(varlist) date(varname) stub(string) ///
    [ daily(mean|sum|min|max) dateformat(string) nofill clear save(filename [, replace]) ]

* 2. Wide to Wide Standardization
wxprep rename varlist, stub(string) firstdate(string)
wxprep rename varlist, stub(string) from(oldstub) dateformat(string)

* 3. Wide to Long Reshaping (for daily transformations)
wxprep tolong stub, id(varlist) [ generate(varname) date(varname) clear ]
```

### 5.2 Key Features:
- **`date()` flexibility:** Accepts Stata `%td` dates, `%tc` timestamps, `YYYYMMDD` integers, and date strings (with `dateformat()`).
- **Sub-daily aggregation:** `daily(mean|sum|min|max)` collapses multiple readings per day (e.g., hourly ERA5) before wide expansion.
- **Calendar filling:** Automatically inserts missing days between min and max date so unobserved days do not silently drop out of `nobs`.
- **Pre-check diagnostics:** Verifies that resulting wide variable count will not exceed `c(maxvar)`.

---

## 6. Workstreams and Execution Sequence

```
WS0: Test Baseline & Oracle First
 ├── Repair wxsum_validation.do arithmetic (Jan+Feb 1994 = 59 days)
 ├── Align test_dryspells.do assertions with Rules D3/D4
 ├── Freeze v5 reference outputs on rain.dta and temp.dta
 └── Build tests/run_all.do master batch runner
       │
       ▼
WS1: Core Engine Logic & Correctness Fixes
 ├── Fix P1 (all-missing totals returning .)
 ├── Fix P2 (ref_min enforcement on baselines)
 ├── Fix P3 (compound year-month grouping)
 ├── Implement Rules D3 & D4 in reference code
 └── Package cleanup: remove cap prog drop, add *! version, save(..., replace)
       │
       ▼
WS2: Mata Matrix Engine Implementation
 ├── Inline Mata engine at end of wxsum.ado
 ├── Unified matrix pipeline for Calendar and Event modes
 ├── Implement clamped degree days, spell sweeper, and distribution moments
 ├── In-memory long stacking (default) and shape(wide) support
 └── Verify numerical equivalence against frozen v5 oracle (tolerance 1e-10)
       │
       ▼
WS3: Analytical Features & Enhancements
 ├── Implement heat_threshold(#) with kdd_base(#) override
 ├── Implement Heat Spell metrics (heatdays, pct_heatdays, heat_start, heat, heat_end)
 ├── Implement baseline(y1 y2) fixed climatological normal
 ├── Add baseline deviations and z-scores for dry and heat spells
 ├── Implement cuts(numlist) flexible binning
 ├── Implement outstub(string) variable prefixing
 ├── Implement nobs and minobs(#) missing-data controls
 └── Make wxsum an rclass program with r() metadata and console summary table
       │
       ▼
WS4: Unit-Specific Event Windows
 ├── Implement start(var) and end(var) (%td dates)
 ├── Implement event_date(var) days(#) [lag(#)] shortcut
 ├── Connect event windows to Mata matrix slicing engine
 └── Implement baseline deviations for event windows via shifted historical years
       │
       ▼
WS5: Companion Command wxprep
 ├── Create wxprep.ado with towide, rename, and tolong subcommands
 ├── Implement duplicate checking and daily() aggregation
 └── Implement calendar filling and c(maxvar) pre-checks
       │
       ▼
WS6: Replication Package, Help Files & Release
 ├── Create examples/wxsum_examples.do and plain-text wxsum_examples.log
 ├── Create rain_long.dta and temp_long.dta sample datasets
 ├── Update wxsum.sthlp with v6.0 syntax, window terminology, and KDD explanation
 ├── Create wxprep.sthlp
 ├── Update wxsum.pkg and stata.toc to v6.0
 └── Remove stale wxsum_submission/ directory
```

---

## 7. Verification and Quality Assurance Matrix

The implementation is verified against the following automated test battery:

| Test Suite | Verification Criteria |
|---|---|
| **Legacy Suite** | All repaired v5 suites pass cleanly under Rules D3 and D4. |
| **Engine Equivalence** | Mata engine output matches reference calculations to $10^{-10}$ on synthetic data. |
| **Regression Oracle** | v6.0 matches frozen v5 oracle output for all unchanged metrics. |
| **Spell Boundary Suite** | Hand-computed sequences verify edge skips (`0 0 0 . . .`), single rain days, all-dry seasons, and all-hot windows. |
| **Missing Data Suite** | All-missing seasons return `.` for totals and GDD; `minobs()` drops incomplete seasons; `ref_min()` guards baselines. |
| **Baseline Normal Suite** | `baseline(y1 y2)` matches manual Stata calculations; zero SD safely sets z-scores to missing `.`. |
| **Event Window Suite** | Gestation windows (`event_date(dob) days(273)`) match exact manual daily slices. |
| **Atomic Rollback Suite** | Deliberately induced syntax errors and `Break` leave dataset 100% unchanged with zero orphan variables. |
| **`wxprep` Round-Trip** | `tolong` $\to$ `towide` reproduces original wide data exactly. |
| **Performance Benchmark** | Execution completes in under 2 seconds across all bundled datasets (down from 25–65s in v5). |

---

## 8. Summary of Reviewer & Editor Alignment

- **Editor Comment #3 & #7 (General utility & Long format):** Solved by making `long` the default, generalizing "seasons" to "windows", adding unit-specific event windows, and introducing heat spells.
- **Editor Comment #4 & Referee Rec #1 (Data prep bottleneck):** Solved by the three-subcommand companion `wxprep`.
- **Editor Comment #5 (Post-calculation & rclass):** Solved by `rclass` stored results and a structured console summary table.
- **Editor Comment #8 (KDD term):** Solved by updating variable labels to `"Killing (extreme-heat) degree days above [threshold]"` and documenting the physiological heat-stress rationale.
- **Editor Comment #9 (set maxvar):** Solved by long output default, `maxvar` diagnostics, and long sample datasets.
- **Editor Comment #12 (cap prog drop):** Solved by removing line 19.
- **Editor Comment #13 (Hardcoded names & tempvars):** Solved by pure Mata computation, atomic allocation, and `outstub()`.
- **Editor Comment #14 (compress):** Solved by `quietly compress` and narrow storage types (`byte`/`int`/`float`).
- **Referee Rec #2 (Fixed baseline):** Solved by `baseline(y1 y2)`.
- **Referee Other #1 (Location-varying dates):** Solved by `start()`/`end()` and `event_date()`/`days()`.
- **Referee Other #2 (Spell deviations):** Solved by adding deviations and z-scores for dry and heat spells.
