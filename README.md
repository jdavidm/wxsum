# `wxsum`: Processing Temperature and Precipitation Data (Version 6.0)

[![Stata 15+](https://img.shields.io/badge/Stata-15%2B-blue.svg)](https://www.stata.com)
[![Version 6.0](https://img.shields.io/badge/version-6.0.0-green.svg)](https://github.com/jdavidm/wxsum)

`wxsum` is a high-performance Stata command that processes daily remote-sensing weather data into comprehensive seasonal statistics, agricultural degree days, extreme heat and dry spell durations, and historical weather-shock measures.

Version 6.0 includes a completely redesigned, inline-compiled **Mata analytical engine** for order-of-magnitude speedups, support for **unit-specific exposure windows** (such as household-level planting dates), an official data-preparation companion command **`wxprep`**, and refined handling of missing data and extreme heat physiology.

---

## Installation

Install the package directly into Stata from GitHub:

```stata
net install wxsum, from("https://raw.githubusercontent.com/jdavidm/wxsum/main/") replace
```

This installs:
- `wxsum.ado` and `wxsum.sthlp`: Core calculation command and documentation.
- `wxprep.ado` and `wxprep.sthlp`: Companion data reshaping and preparation utility.
- Bundled sample datasets: `rain.dta`, `temp.dta`, `rain_long.dta`, and `temp_long.dta`.

---

## Core Capabilities in Version 6.0

1. **High-Speed Mata Engine:**
   Processes millions of cell-days across multi-year panels in seconds with zero dataset modification on errors.

2. **Dual Window Modes:**
   - **Calendar Window Mode:** Fixed seasonal exposure windows (e.g., May–October or cross-year November–February).
   - **Unit-Specific Exposure Windows:** Individual exposure periods anchored to household-level planting dates, survey recall windows, or health events (`start(var) end(var)` or `event_date(var) days(#) [lag(#)]`).

3. **Long Output by Default:**
   Produces panel-ready long-format output with one row per unit-year (`shape(long)`), ready for immediate econometric estimation.

4. **Extreme Heat & Temperature Physiology:**
   Captures non-linear thermal damage using `heat_threshold(#)`: computes `heatdays`, `pct_heatdays`, leading/longest/trailing heat spells (`heat_start`, `heat`, `heat_end`), and Killing Degree Days (`kdd`).

5. **Historical Anomaly Benchmarks:**
   Computes deviations (`dev_`) and standardized z-scores (`z_`) for all core totals, monthly means, rainy days, and spell metrics using rolling historical windows (`lr_years(#)`) or fixed reference periods (`baseline(y1 y2)`).

6. **Quality & Coverage Diagnostics:**
   Exports a complete data-quality matrix `r(missing)` reporting observed-day counts, missing rates, and boundary diagnostics. Windows with fewer than `minobs(#)` observed days return missing for all metrics rather than false zeros.

7. **Companion Command `wxprep`:**
   Streamlines long-to-wide reshaping (`wxprep towide`), variable standardization (`wxprep rename`), and wide-to-long panel conversion (`wxprep tolong`) with exact round-trip fidelity.

---

## Syntax Overview

### 1. `wxsum` (Calendar Window Mode)

```stata
wxsum stubname, type(rain|temp) ini_month(month) fin_month(month) [options]
```

### 2. `wxsum` (Unit-Specific Window Mode)

```stata
* Explicit start and end date variables (%td format)
wxsum stubname, type(rain|temp) start(varname) end(varname) [options]

* Shortcut anchor date with fixed duration in days
wxsum stubname, type(rain|temp) event_date(varname) days(#) [lag(#) options]
```

### 3. `wxprep` (Data Preparation Companion)

```stata
* Reshape long weather series into wide daily columns:
wxprep towide varname [if] [in], id(varlist) date(varname) stub(string) ///
    [daily(mean|sum|min|max) dateformat(string) nofill clear save(filename [, replace])]

* Standardize existing wide variable names to stub_YYYYMMDD:
wxprep rename varlist, stub(string) firstdate(string)
wxprep rename varlist, stub(string) from(oldstub) dateformat(string)

* Reshape wide daily weather data back to long panel:
wxprep tolong stub, id(varlist) [generate(varname) date(varname) clear]
```

---

## Key Options

| Option | Description |
| :--- | :--- |
| `type(rain\|temp)` | Weather measure: `rain` for precipitation, `temp` for temperature (Required). |
| `ini_month(#) fin_month(#)` | Start and end months for calendar seasons. Cross-year seasons (e.g., 11 to 02) supported. |
| `start(var) end(var)` | Unit-specific %td date variables defining exposure windows. |
| `event_date(var) days(#)` | Anchor %td date and window length for unit-specific exposure. |
| `heat_threshold(#)` | Extreme heat threshold for heat days, heat spells, and KDD base (Required for `type(temp)`). |
| `kdd_base(#)` | Degree-day base for Killing Degree Days (defaults to `heat_threshold()`). |
| `gdd_lo(#) gdd_hi(#)` | Temperature bounds for Growing Degree Days (Required for `type(temp)`). |
| `rain_threshold(#)` | Precipitation threshold defining a rainy day (defaults to 1). |
| `minobs(#)` | Minimum non-missing observed days required in window (defaults to 1). |
| `lr_years(#)` | Number of strictly preceding years for rolling deviations/z-scores (defaults to 10). |
| `baseline(y1 y2)` | Fixed reference period (e.g., `baseline(1981 2010)`) instead of rolling window. |
| `cuts(numlist)` | Custom threshold cuts generating $K+1$ daily count bins. |
| `gdd_bin(#)` | Deschênes & Greenstone fixed-width seasonal GDD categories. |
| `tmp_bin(#)` | Schlenker & Roberts daily temperature bin counts (1 to 42 bins). |
| `shape(long\|wide)` | Output dataset layout (Default is `long`). |
| `keep(varlist)` | Variables to retain in output (e.g., location or household identifiers). |
| `partial` | Allow unit windows that extend beyond the calendar range of wide data. |

---

## Replication & Examples

Run the complete example suite included with the package:

```stata
do examples/wxsum_examples.do
```

### Quick Code Examples

```stata
* 1. Seasonal rainfall summaries (long format)
use rain.dta, clear
wxsum rf_, type(rain) ini_month(05) fin_month(10) ini_day(15) fin_day(15) keep(hhid)

* 2. Temperature degree days and heat spells (November to February season)
use temp.dta, clear
wxsum tmp_, type(temp) ini_month(11) fin_month(02) gdd_lo(8) gdd_hi(32) heat_threshold(32) keep(hhid)

* 3. Unit-specific 90-day exposure following household planting date
use rain.dta, clear
gen long plant_date = td(15may2015) + _n * 2
format plant_date %td
wxsum rf_, type(rain) event_date(plant_date) days(90) lr_years(5) keep(hhid plant_date)

* 4. Prepare raw long weather data using wxprep
use rain_long.dta, clear
wxprep towide rain, id(hhid) date(date) stub(rf_) clear
wxsum rf_, type(rain) ini_month(05) fin_month(10) keep(hhid)
```

---

## Authors

- **Jeffrey D. Michler** (<jdmichler@arizona.edu>), University of Arizona
- **Anna Josephson** (<aljosephson@arizona.edu>), University of Arizona
- **Oscar Barriga-Cabanillas** (<obarriga@worldbank.org>), World Bank
- **Aleksandr Michuda** (<amichud1@swarthmore.edu>), Swarthmore College
- **Jeffrey C. Oliver** (<jcoliver@arizona.edu>), University of Arizona

---

## Citation

If you use `wxsum` in published work, please cite:

> Michler, J. D., A. Josephson, O. Barriga-Cabanillas, A. Michuda, and J. C. Oliver. (2026). "wxsum: A command for processing temperature and precipitation data." *The Stata Journal*, forthcoming.
