# `wxsum`: Stata Weather Command

## Installation

You can install the latest version of `wxsum` directly from this GitHub repository using Stata's `net install` command:

```stata
net install wxsum, from("https://raw.githubusercontent.com/jdavidm/wxsum/master/") replace
```

## Description

The `wxsum` command processes remote sensing rainfall and temperature data and outputs useful statistics. The command can be used with either rainfall or temperature data from any source. 

The data must be wide, where each location is a row and each column is a daily reading. The variables for each column must contain `yyyymmdd`. For example, if the prefix is `pic_`, the variable for May 15, 1979 would be `pic_19790515`.

Z-scores and deviations from long run averages are dynamically computed strictly against the specified number of preceding `lr_years`.
Warning: If there isn't enough historical preceding data to satisfy the user-defined `lr_years` constraint (e.g. asking for 10 years of history when calculating the year 2005 using a dataset that begins in 2000), deviations and z-scores will be skipped for those initial years, though standard variables will still generate.

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
- `bins(#)`: Number of temperature percentile bins. Minimum 4, Maximum 10. Default is 4.
- `lr_years(#)`: Number of strictly preceding years used to calculate rolling deviations and Z-scores. Default is 10. Max is 50.
- `keep(varlist)`: Variables to keep in the final dataset along with the generated wxsum variables.
- `save(filename)`: File path to save the resulting dataset.
- `rain_threshold(#)`: Threshold for defining a rainy day. Defaults to 1.

## Generated Variables

Using data sets as defined above, the wxsum command creates useful statistics in the same fashion for all years. The command seamlessly handles seasons that span across calendar years, such as November to February, keeping the data associated with the year the season starts.

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
- deviation from long run average of days without rain in a season
- percentage of days with rain in a season
- deviation from the long run average of percentage of days with rain in a season
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
- temperature bins

Growing degree days are calculated using the options `gdd_lo(number)` and `gdd_hi(number)` to determine the number of days where the temperature was between that range. Killing degree days are calculated above a user specified `kdd_base(number)`. As with the rainfall option, the temperature option also generates deviations in GDD and KDD from the long-term average and the deviation measured as a z-score.

The command calculates temperature bins as the percentage of days that fall into equal-sized quantiles during the season, defined by the option `bins(number)` ranging from 4 to 10 (default 4).

## Examples

To try the command out on the sample datasets included in this repository:

**Rainfall Example:**
```stata
use rain.dta, clear
wxsum pic_, ini_month(05) fin_month(10) ini_day(15) fin_day(15) rain_data save(rainfall_stats.dta)
```

**Temperature Example:**
```stata
use temp.dta, clear
wxsum t_, ini_month(11) fin_month(02) temp_data gdd_lo(8) gdd_hi(32) keep(id region)
```

## Reporting Bugs
If you run into any issues or bugs, please open an issue on the [GitHub repository](https://github.com/jdavidm/wxsum/issues). Be sure to include your exact Stata version, the command you ran, and a sample of your data (or ideally, reproduce the bug using `rain.dta` or `temp.dta`).

## Authors
- Oscar Barriga Cabanillas
- Aleksandr Michuda
- Jeffrey D. Michler
- Brian McGreal
- Anna Josepshon

