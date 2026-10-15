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

- `towide` combines several readings per day with `daily(mean|sum|min|max)` (without it, duplicate unit-days are an error), reads string dates with `dateformat()` (e.g. `dateformat(YMD)`), and accepts `%td` dates, `%tc` datetimes, and YYYYMMDD integers. By default it creates a variable for every calendar day from the first to the last date, so days without data become missing days in `wxsum`; `nofill` creates variables only for dates in the data. `if`/`in` convert part of the data, and `save()` saves the result.
- `rename` takes `firstdate()` for consecutive days, or `from()` and `dateformat()` to read the dates from the old names.
- `tolong` names the value and date variables with `generate()` (default: the stub without a trailing `_`) and `date()` (default `date`); `id()` must identify the observations.
- `towide` and `tolong` replace the data in memory: they need `clear` if the data have changed since the last save, and they leave the data unchanged if they fail. The daily values get the narrowest storage type that holds them exactly (`byte`, `int`, or `long` for whole numbers; otherwise `float`, or `double` if the input is `double` or `long`).

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
| `ini_month(#) fin_month(#)` | First and last month of a calendar window, whole numbers from 1 to 12 (`05` is read as 5). A window that crosses the end of the year is labeled with its start year. Only windows that lie entirely within the dates of the daily variables are summarized. |
| `ini_day(#) fin_day(#)` | First and last day (1-31, and a valid date with its month); by default the window runs from the first day of `ini_month()` to the last day of `fin_month()` (29 February included in leap years). 29 February given here is 28 February in common years. |
| `start(varname) end(varname)` | Each observation's first and last day (`%td` dates; `%tc` datetimes are rejected). A window that ends before it starts is an error; a missing date gives missing statistics. |
| `event_date(varname) days(#) [lag(#)]` | Window of `#` days ending the day before an event, i.e. from `event_date - days - lag` to `event_date - 1 - lag`; `lag()` (default 0) moves it `#` days earlier. |
| `partial` | Use the days inside the data when a unit-specific window runs past the first or last daily variable; without it, such windows have missing statistics. |
| `rain_threshold(#)` | Rainy day if rain >= `#` (nonnegative); default 1. Rain only. |
| `gdd_lo(#) gdd_hi(#)` | Bounds for growing degree days (`gdd_hi()` > `gdd_lo()`). Required for `temp`. |
| `heat_threshold(#)` | Heat day if temp >= `#`; also the base for killing degree days. Required for `temp`. |
| `kdd_base(#)` | KDD base, only if it should differ from `heat_threshold()`. |
| `gdd_bin(#) gdd_binlo(#) gdd_binhi(#)` | Categories of width `gdd_bin()` of the seasonal GDD total (`gddcat`), starting at `gdd_binlo()` (default 0). Totals below `gdd_binlo()` get a bottom category; with `gdd_binhi()` (which must lie a whole number of widths above `gdd_binlo()`), totals at or above it share a top category, otherwise the categories extend to the largest total. At most 100 categories. Temp only. |
| `tmp_bin(#) tmp_binlo(#) tmp_binhi(#)` | `#` daily temperature bins (at most 42): below `tmp_binlo()`, `#` - 2 equal-width bins from `tmp_binlo()` to `tmp_binhi()`, and `tmp_binhi()` or above (`tmp_bin(2)` splits at the midpoint, `tmp_bin(1)` counts all observed days). Temp only. |
| `cuts(numlist)` | Bins at your own cutpoints (at most 41, strictly increasing; each bin includes its lower cutpoint). Rain or temp; cannot be combined with `tmp_bin()`. |
| `lr_years(#)` | Rolling reference period: the `#` preceding years (2-50; default 10). |
| `baseline(# #)` | Fixed reference period, e.g. `baseline(1981 2010)`; it must cover at least `ref_min()` windows (calendar) or years (unit-specific) of the data. Cannot be combined with `lr_years()`. |
| `ref_min(#)` | Nonmissing reference values needed for a deviation, at least 2; default: all reference years. |
| `minobs(#)` | Observed days a window needs for its statistics (`nobs` is always reported); default 1. |
| `shape(long\|wide)` | Shape of a calendar-window result; default `long`. Ignored with unit-specific windows. |
| `outstub(string)` | Prefix for all output names (e.g. to keep rain and temp results in one dataset). |
| `keep(varlist)` | Variables to keep, typically identifiers; with long output it cannot include `year`. |
| `save(filename [, replace])` | Save the output (`.dta` is added if the name has no extension); an existing file is overwritten only with `replace`. |

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

- All statistics use the observed (nonmissing) days of the window. `var` and `sd` need 2 observed days, and `skew` (sample skewness) needs 3 and a nonzero `sd`. `pct_raindays` and `pct_heatdays` are shares (0 to 1) of the observed days. `mean_mo` is `total` divided by the number of calendar months with at least one observed day.
- Growing degree days are the sum over observed days of `min(max(T - gdd_lo, 0), gdd_hi - gdd_lo)`; killing (extreme-heat) degree days are the sum of `max(T - k, 0)`, where `k` is `kdd_base()` or `heat_threshold()`.
- Leading and trailing spells (`dry_start`/`dry_end`, `heat_start`/`heat_end`) count from the first and last observed day of the window; missing days at the edges are skipped, and a missing day ends a run. The mid-window spell (`dry`, `heat`) is the longest run strictly between the first and last break day (rainy day, or cooler day) when there are at least two; with none or one, it is the longest run anywhere in the window.
- Windows with fewer than `minobs()` observed days (by default, no observed day) have missing statistics, although `nobs` is reported, and do not enter any reference period. A season inside the data with no daily variables is such a window (`nobs = 0`).
- A deviation (`dev_`) is the statistic minus the mean of its reference values, and a z-score (`z_`) divides the deviation by their standard deviation; both need `ref_min()` nonmissing reference values, and a z-score is missing when the reference values do not vary. For calendar windows the reference values are the same statistic in the seasons of the reference period that are in the data (the `lr_years()` preceding seasons, or the `baseline()` seasons); a season gets deviations only when at least `ref_min()` such seasons exist, so wide output has `dev_` and `z_` variables only for those seasons. For unit-specific windows the reference values come from the same window (same days of the year) in each of the `lr_years()` preceding years or in each `baseline()` year.
- Every variable has a label that states its threshold. Characteristics record the statistic and window of each variable (`[wxsum_stat]`, `[wxsum_window]`) and the command and its settings (`_dta[wxsum_cmdline]`, `[wxsum_version]`, `[wxsum_type]`, `[wxsum_shape]`, `[wxsum_window]`, `[wxsum_ref]`, `[wxsum_thresholds]`, `[wxsum_minobs]`; see `char list _dta[]`).
- An output name that already exists (in `keep()`, or among all variables when wide or unit-specific output has no `keep()`) is an error; use `outstub()`. `wxsum` also checks `maxvar` before computing anything.

`wxsum` is r-class: `return list` shows the number of rows, units (`r(N_units)`, the distinct `keep()` combinations), windows, and variables created (`r(varlist)`), the window and reference period, the thresholds, and a matrix `r(missing)` that summarizes missing data: for calendar windows one row per season with `days`, `mean_nobs`, `any_missing`, `all_missing` (shares of observations), and `below_minobs`; for unit-specific windows one row that adds `outside` (windows that run past the data) and `missing_dates`. If anything fails, the data in memory are left unchanged.

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
