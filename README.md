# `wxsum`: Stata Weather Command

## Installation

You can install the latest version of `wxsum` directly from this GitHub repository using Stata's `net install` command:

```stata
net install wxsum, from("https://raw.githubusercontent.com/jdavidm/wxsum/main/") replace
```

## Requirements

The command requires Stata 15 or later. Users working with long time series in Stata/IC may need to split the data into shorter panels due to variable limits.

## Description

The `wxsum` command processes remote sensing rainfall and temperature data and outputs useful statistics. The command can be used with either rainfall or temperature data from any source.

The data must be wide, where each location is a row and each column is a daily reading. Daily weather variable names must be the user-supplied prefix followed by `yyyymmdd`. For example, if the prefix is `rf_`, the variable for May 15, 1979 would be `rf_19790515`.

Z-scores and deviations from long-run averages are computed strictly against the specified number of preceding `lr_years`. If there is not enough preceding data to satisfy the requested window, deviations and z-scores are skipped for those initial years, though standard variables still generate.

## Syntax

```stata
wxsum prefix , ini_month(month) fin_month(month) [options]
```

### Main
- `ini_month(month)`: Initial month of the season (e.g., 05 for May)
- `fin_month(month)`: Final month of the season (e.g., 10 for October)

### Options
- `ini_day(day)`: Start day of the season. Default is 01.
- `fin_day(day)`: End day of the season. Default is 01.
- `temp_data`: Specify that data is temperature data. Mutually exclusive with rain_data.
- `rain_data`: Specify that data is rainfall data. Mutually exclusive with temp_data.
- `gdd_lo(#)`: Lower bound for growing degree days calculation (required if temp_data is used).
- `gdd_hi(#)`: Upper bound for growing degree days calculation (required if temp_data is used).
- `kdd_base(#)`: Temperature threshold for calculating Killing Degree Days (KDD).
- `gdd_bin(#)`: Width of fixed-interval seasonal GDD categories. When specified, creates one integer categorical variable `gddcat_YYYY` for each generated GDD season. Requires `temp_data`.
- `gdd_binlo(#)`: Lower endpoint for regular fixed-width GDD intervals. Default is 0 when `gdd_bin()` is specified. Values below this threshold are assigned to a bottom-coded category. Requires `gdd_bin()`.
- `gdd_binhi(#)`: Upper endpoint for regular fixed-width GDD intervals. Values at or above this threshold are assigned to a top-coded category. When omitted, the command automatically extends intervals to cover the empirical maximum. Requires `gdd_bin()`.
- `tmp_bin(#)`: Total number of fixed daily-temperature bin count variables to create per season. Must be a positive integer from 1 to 42. Requires `temp_data`, `tmp_binlo()`, and `tmp_binhi()`.
- `tmp_binlo(#)`: Lower bound of the temperature range for bin construction. Required with `tmp_bin()`. Must be in the same units as the daily temperature data.
- `tmp_binhi(#)`: Upper bound of the temperature range for bin construction. Required with `tmp_bin()`. Must be greater than `tmp_binlo()`.
- `shape(wide|long)`: Shape of the final output. Default is `wide`. When `long` is specified, output is stacked with one row per retained unit-year and a variable named `year`. It is strongly recommended to use `keep()` with unit identifiers when `shape(long)` is requested.
- `lr_years(#)`: Number of strictly preceding years used to calculate rolling deviations and Z-scores. Default is 10. Max is 50.
- `keep(varlist)`: Variables to keep in the final dataset along with the generated wxsum variables.
- `save(filename)`: File path to save the resulting dataset.
- `rain_threshold(#)`: Threshold for defining a rainy day. Defaults to 1. Missing rainfall values are excluded from rain-day, no-rain-day, percentage, and dry-spell calculations.

## Generated Variables

Using data sets as defined above, the wxsum command creates useful statistics in the same fashion for all detected season years. The command handles seasons that span calendar years, such as November to February, and labels the output with the year the season starts.

### 1. Rainfall Variables

When the `rain_data` option is chosen, the command generates the following variables for each season:

- mean daily in a season
- median daily in a season
- standard deviation of daily in a season
- skew of daily in a season
- mean total monthly in a season
- median total monthly in a season
- standard deviation of total monthly in a season
- skew of total monthly in a season
- total seasonal
- deviation from long run average of total seasonal
- z-score of total seasonal
- number of rainy days in a season
- number of days without rain in a season
- deviation from long run average of rainy days in a season
- z-score of rainy days in a season
- deviation from long run average of days without rain in a season
- z-score of days without rain in a season
- percentage of days with rain in a season
- deviation from the long run average of percentage of days with rain in a season
- z-score of percentage of days with rain in a season
- longest intra-seasonal dry spell

### 2. Temperature Variables

When the `temp_data` option is chosen, the command generates the following variables for each season:

- mean daily in a season
- median daily in a season
- standard deviation of daily in a season
- skew of temp in a season
- max daily in a season
- gdd in a season
- deviations from long run average gdd in a season
- z-score of gdd in a season
- deviations from long run average kdd in a season
- z-score of kdd in a season
- GDD category variable `gddcat_YYYY` (when `gdd_bin()` is specified)
- Fixed daily-temperature bin count variables `tmpbinXX_YYYY` (when `tmp_bin()` is specified)

Growing degree days are calculated as capped degree accumulation between `gdd_lo(number)` and `gdd_hi(number)`: `min(max(temp - gdd_lo, 0), gdd_hi - gdd_lo)`, summed over the season. Killing degree days are calculated above a user specified `kdd_base(number)`. As with the rainfall option, the temperature option also generates deviations in GDD and KDD from the long-term average and the deviation measured as a z-score.

When `gdd_bin(number)` is specified, the command creates an integer categorical variable `gddcat_YYYY` for each season that identifies the fixed-width interval containing the seasonal GDD total. Value labels define the GDD intervals (e.g., `GDD [0,500)`, `GDD [500,1000)`). Users can employ Stata's factor-variable notation such as `i.gddcat_YYYY` to create dummies in estimation commands. This follows the fixed-interval seasonal degree-day approach used in Deschênes and Greenstone-style specifications, while remaining unit agnostic. The bin width should be specified in the same units as the generated GDD variable.

When `tmp_bin(number)` is specified, the command creates fixed daily-temperature bin count variables `tmpbin01_YYYY` through `tmpbinJJ_YYYY` for each season. These count the number of nonmissing daily temperature readings falling into fixed temperature intervals, approximating the Schlenker-Roberts temperature-bin idea when only one daily reading is available. The command is unit agnostic; `tmp_binlo()` and `tmp_binhi()` must be in the same units as the daily temperature data. For J >= 3, the lower tail counts days with T < lo, interior bins cover equal-width intervals over [lo, hi), and the upper tail counts days with T >= hi. Missing daily temperatures are not counted.

### 3. Long Output

When `shape(long)` is specified, the final output is stacked long with one row per retained unit-year. Generated variables have their `_YYYY` suffixes stripped and a variable `year` identifies the season. This is a final-output stacking operation; the wide input requirement is unchanged. It can make panel workflows easier and reduce the final number of variables, although it does not yet reduce the peak number of variables created internally.

## Examples

To try the command out on the sample datasets included in this repository:

**Rainfall Example:**
```stata
use rain.dta, clear
wxsum rf_, ini_month(05) fin_month(10) ini_day(15) fin_day(15) rain_data lr_years(10) rain_threshold(1) keep(hhid) save(rainfall_stats.dta)
```

**Temperature Example:**
```stata
use temp.dta, clear
wxsum tmp_, ini_month(11) fin_month(02) temp_data gdd_lo(8) gdd_hi(32) kdd_base(32) keep(hhid) save(temperature_stats.dta)
```

**GDD Categories Example (Fahrenheit degree-days):**
```stata
use temp.dta, clear
wxsum tmp_, ini_month(04) fin_month(09) fin_day(30) temp_data gdd_lo(46.4) gdd_hi(89.6) gdd_bin(500)
```

Note: 500 is in the units of the generated GDD variable (here, Fahrenheit degree-days). For Celsius data, the user should choose a width appropriate for their units.

**GDD Categories with Bottom and Top Coding:**
```stata
use temp.dta, clear
wxsum tmp_, ini_month(04) fin_month(09) fin_day(30) temp_data gdd_lo(8) gdd_hi(32) gdd_bin(250) gdd_binlo(0) gdd_binhi(3000)
```

**Fixed Daily-Temperature Bin Counts (15 bins, Celsius):**
```stata
use temp.dta, clear
wxsum tmp_, ini_month(04) fin_month(09) fin_day(30) temp_data gdd_lo(8) gdd_hi(32) tmp_bin(15) tmp_binlo(0) tmp_binhi(39)
```

**Fine 42-Bin Specification:**
```stata
use temp.dta, clear
wxsum tmp_, ini_month(04) fin_month(09) fin_day(30) temp_data gdd_lo(8) gdd_hi(32) tmp_bin(42) tmp_binlo(1) tmp_binhi(41)
```

**Long Output for Panel Workflows:**
```stata
use temp.dta, clear
wxsum tmp_, ini_month(04) fin_month(09) fin_day(30) temp_data gdd_lo(8) gdd_hi(32) tmp_bin(15) tmp_binlo(0) tmp_binhi(39) keep(hhid) shape(long)
```

## Reporting Bugs
If you run into any issues or bugs, please open an issue on the [GitHub repository](https://github.com/jdavidm/wxsum/issues). Be sure to include your exact Stata version, the command you ran, and a sample of your data (or ideally, reproduce the bug using `rain.dta` or `temp.dta`).

## Citation

If you use `wxsum` in your research, please cite:

> Michler, J. D., A. Josephson, O. Barriga-Cabanillas, A. Michuda, and J. C. Oliver. "wxsum: A command for processing temperature and precipitation data." https://github.com/jdavidm/wxsum, version 1.

## Authors
- Oscar Barriga-Cabanillas
- Anna Josephson
- Jeffrey D. Michler
- Aleksandr Michuda
- Jeffrey C. Oliver
