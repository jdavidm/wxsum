# `wxsum`: A command for processing temperature and precipitation data

`wxsum` turns daily weather data into statistics for a window of days: a season that repeats every year (a calendar window), or a window that differs by observation, such as a farm's growing season or the months before a birth (a unit-specific window). The companion command `wxprep` converts long daily data, or wide data with other variable names, into the layout `wxsum` needs.

## Installation

```stata
net install wxsum, from("https://raw.githubusercontent.com/jdavidm/wxsum/main/") replace
```

The sample data and the example do-file are ancillary files:

```stata
net get wxsum, from("https://raw.githubusercontent.com/jdavidm/wxsum/main/")
```

## Requirements

Stata 15 or later. The wide daily layout has one variable per day (40 years are about 14,600 variables), so Stata/SE and Stata/MP need `set maxvar` above the default of 5,000 (`clear all`, then `set maxvar 20000`, then load the data). Stata/BE allows 2,048 variables, about five years of daily data; use `wxprep towide` with `if` to convert part of the years at a time. `wxsum` checks `maxvar` before it starts.

## Data layout

The data must be wide: one observation per location (or household, plot, person, ...) and one numeric variable per day, named `stub` + `yyyymmdd`. For example, with stub `rf_`, rain on 15 May 1979 is in `rf_19790515`. Calendar days without a daily variable are treated as missing days.

Long data (one row per unit-day, possibly with several readings per day) and wide data with other names can be converted with `wxprep`:

```stata
wxprep towide rain, id(hhid) date(date) stub(rf_)            // long -> wide
wxprep rename rain1-rain365, stub(rf_) firstdate(01jan2020)  // other names -> rf_yyyymmdd
wxprep tolong rf_, id(hhid)                                  // wide -> long
```

## Syntax

```stata
* calendar window: the same dates every year
wxsum stub, type(rain|temp) ini_month(#) fin_month(#) [ini_day(#) fin_day(#) options]

* unit-specific window: dates from variables, one window per observation
wxsum stub, type(rain|temp) start(varname) end(varname) [partial options]
wxsum stub, type(rain|temp) event_date(varname) days(#) [lag(#) partial options]
```

### Options

| Option | Meaning |
|---|---|
| `type(rain\|temp)` | Required. Other daily series (humidity, wind, wet-bulb temperature) use `temp`. |
| `ini_month(#) fin_month(#)` | First and last month of a calendar window. A window that crosses the end of the year is labeled with its start year. |
| `ini_day(#) fin_day(#)` | First and last day; by default the window runs from the first day of `ini_month()` to the last day of `fin_month()` (29 February included in leap years). 29 February given here is 28 February in common years. |
| `start(varname) end(varname)` | Each observation's first and last day (`%td` dates). |
| `event_date(varname) days(#) [lag(#)]` | Window of `#` days ending the day before an event; `lag()` moves it earlier. |
| `partial` | Use the available days when a unit-specific window runs past the data. |
| `rain_threshold(#)` | Rainy day if rain >= `#`; default 1. Rain only. |
| `gdd_lo(#) gdd_hi(#)` | Bounds for growing degree days. Required for `temp`. |
| `heat_threshold(#)` | Heat day if temp >= `#`; also the base for killing degree days. Required for `temp`. |
| `kdd_base(#)` | KDD base, only if it should differ from `heat_threshold()`. |
| `gdd_bin(#) gdd_binlo(#) gdd_binhi(#)` | Fixed-width categories of the seasonal GDD total (`gddcat`). |
| `tmp_bin(#) tmp_binlo(#) tmp_binhi(#)` | Equal-width daily temperature bins. |
| `cuts(numlist)` | Bins at your own cutpoints (rain or temp). |
| `lr_years(#)` | Rolling reference period: the `#` preceding years (default 10). |
| `baseline(# #)` | Fixed reference period, e.g. `baseline(1981 2010)`; it must cover at least `ref_min()` windows of the data. |
| `ref_min(#)` | Nonmissing reference years needed for a deviation; default all. |
| `minobs(#)` | Observed days needed for a window's statistics; default 1. |
| `shape(long\|wide)` | Shape of a calendar-window result; default `long`. |
| `outstub(string)` | Prefix for all output names (e.g. to keep rain and temp results together). |
| `keep(varlist)` | Variables to keep, typically identifiers. |
| `save(filename [, replace])` | Save the output. |

## Output

Long output (the default) has one row per observation and window, a variable `year` (the year the window starts), and statistics named `total`, `mean`, ...; wide output has one row per observation and names such as `total_1993`. With unit-specific windows there is one row per observation and no year suffix.

| | Statistics |
|---|---|
| All | `nobs` (observed days), `mean`, `median`, `var`, `sd`, `skew` |
| Rain | `total`, `mean_mo` (mean of monthly totals), `raindays`, `norain`, `pct_raindays`, `dry_start`, `dry`, `dry_end` |
| Temp | `max`, `gdd`, `kdd`, `heatdays`, `pct_heatdays`, `heat_start`, `heat`, `heat_end` |
| Optional | `gddcat`, `tmpbin01`..., `cut01`... |
| Reference | `dev_` and `z_` for `mean_mo`, `total`, `raindays`, `norain`, `pct_raindays`, and the dry spells (rain), or `gdd`, `kdd`, `heatdays`, `pct_heatdays`, and the heat spells (temp) |

Definitions:

- Growing degree days are the sum over observed days of `min(max(T - gdd_lo, 0), gdd_hi - gdd_lo)`; killing (extreme-heat) degree days are the sum of `max(T - k, 0)`, where `k` is `kdd_base()` or `heat_threshold()`.
- Leading and trailing spells (`dry_start`/`dry_end`, `heat_start`/`heat_end`) count from the first and last observed day of the window; missing days at the edges are skipped, and a missing day ends a run. The mid-window spell (`dry`, `heat`) is the longest run strictly between the first and last break day (rainy day, or cooler day) when there are at least two; with none or one, it is the longest run anywhere in the window.
- Windows with no observed day have missing statistics (and `nobs = 0`) and do not enter any reference period. A deviation or z-score needs `ref_min()` nonmissing reference values; a z-score is missing when the reference values do not vary.
- Every variable has a label that states its threshold; characteristics record the statistic and window of each variable, and the command and its settings (`char list _dta[]`).

`wxsum` is r-class: `return list` shows the number of rows, units, windows, and variables created, the window and reference period, the thresholds, and a matrix `r(missing)` that summarizes missing data by window. If anything fails, the data in memory are left unchanged.

## Examples

```stata
clear all
set maxvar 20000

* rainfall, 15 May - 15 October
use rain.dta
wxsum rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) fin_day(15) keep(hhid)
return list

* temperature, November - February (heat days at 27, KDD above 28)
use temp.dta, clear
wxsum tmp_, type(temp) ini_month(11) fin_month(2) gdd_lo(8) gdd_hi(32) heat_threshold(27) kdd_base(28) keep(hhid)

* GDD categories and temperature bins
use temp.dta, clear
wxsum tmp_, type(temp) ini_month(4) fin_month(9) fin_day(15) gdd_lo(18) gdd_hi(30) heat_threshold(30) ///
    gdd_bin(100) gdd_binlo(1100) gdd_binhi(1500) tmp_bin(10) tmp_binlo(20) tmp_binhi(36) keep(hhid)

* fixed baseline, wide output
use rain.dta, clear
wxsum rf_, type(rain) ini_month(5) fin_month(10) baseline(2003 2012) keep(hhid) shape(wide)

* a growing season that differs by household
use rain.dta, clear
generate plant = mdy(5, 1, 2020) + 3 * (hhid - 101)
generate harvest = plant + 120
wxsum rf_, type(rain) start(plant) end(harvest) keep(hhid plant harvest)

* the 273 days before a birth
use temp.dta, clear
generate birth = mdy(3, 15, 2021) + 20 * (hhid - 101)
wxsum tmp_, type(temp) event_date(birth) days(273) gdd_lo(10) gdd_hi(30) heat_threshold(30) keep(hhid birth)

* long daily data
use examples/rain_long.dta, clear
wxprep towide rain, id(hhid) date(date) stub(rf_)
wxsum rf_, type(rain) ini_month(5) fin_month(10) keep(hhid)
```

`examples/wxsum_examples.do` runs all examples in the article, including a merge with a (simulated) household panel and an illustrative regression; `examples/wxsum_examples.log` is its log.

## Changes from version 5

- `heat_threshold()` is required for `type(temp)`. In version 5, `kdd_base()` set the KDD threshold; add `heat_threshold(#)`, and keep `kdd_base()` only if the KDD base should differ.
- Results are long unless `shape(wide)` is specified.
- `save()` overwrites a file only with `replace`.
- Windows with no observed day give missing statistics instead of 0, so rolling deviations differ where version 5 used those zeros.
- Dry spells skip missing days at the edges of a window, and a window with 0 or 1 rainy days reports its longest dry run.
- Monthly totals are grouped by calendar year and month.
- A season inside the data with no daily variables is a window with no observed day (`nobs` = 0) instead of being left out, and 29 February in `ini_day()`/`fin_day()` is 28 February in common years instead of skipping those years.
- New: heat days and spells, `cuts()`, `baseline()`, `ref_min()`, `minobs()`, `nobs`, unit-specific windows, deviations for spells, `outstub()`, stored results, `wxprep`, and a Mata engine that is much faster (0.04-0.2 seconds for each bundled example, against 7-52 seconds in version 5).

## Testing

`tests/run_all.do` runs every test suite (from the repository root: `do tests/run_all.do`). It includes hand-computed checks, a comparison with an independent reference implementation on random data (`tests/reference/wxsum_ref.ado`), and a comparison with frozen version 5 output (`tests/reference/`).

## Reporting bugs

Please open an issue on the [GitHub repository](https://github.com/jdavidm/wxsum/issues) with your Stata version, the command you ran, and a small example, ideally using `rain.dta` or `temp.dta`.

## Citation

If you use `wxsum` in your research, please cite:

> Michler, J. D., A. Josephson, O. Barriga-Cabanillas, A. Michuda, and J. C. Oliver. "wxsum: A command for processing temperature and precipitation data." https://github.com/jdavidm/wxsum, version 6.0.

## Authors

- Jeffrey D. Michler (jdmichler@arizona.edu)
- Anna Josephson (aljosephson@arizona.edu)
- Oscar Barriga-Cabanillas (obarriga@worldbank.org)
- Aleksandr Michuda (amichud1@swarthmore.edu)
- Jeffrey C. Oliver (jcoliver@arizona.edu)
