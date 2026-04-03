# ``` wxsum ``` : Stata Weather Command

The following package processes remote sensing rainfall and temperature data and outputs 

## Data

The command can be used with either rainfall or temperature data from any source. The only requirements are that:

1. The data is “wide,” meaning each location is a row and each column is rainfall or temperature reading from a different day.
2. The data is measured daily.
3. The variable names for each column contain yyyymmdd. The variable names can have any prefix but must contain the year, month, and day.

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

## Command: set up

Using data sets as defined above, the wxsum command creates useful statistics in the same fashion for all years. The command together with an example do file is in the zipped folder wxsum_command. Place the file wxsum.ado into wherever Stata stores your .ado files. The file wxsum_wrapper.do provides an example of the syntax and how to run the command.

The general syntax of the command is as follows.

- After the command name, one has to define what variables contain the rain/temperature information. I provide examples for CHIRPS and ECMWF. For the CHIRPS datasets, the prefix on the wxsum variables is pic_ while in the case of ECMWF the prefix is y_.
- Next, one needs to tell the command whether the data is rain_data or temperature_data.
- One then has to select a season to study using the options ini_month(number), fin_month(number) and ini_day(number) and fin_day(number), if not specified, the default is the first day of the month. For example, in the example .do file I chose a season from the middle of March to the middle of June. The command also seamlessly handles seasons that span across calendar years, such as November to February, keeping the data associated with the year the season starts.
- The option keep tells the command to keep the variables it creates plus some of the original variables in order to match them with other datasets.
- The save of option tells the program to save the dataset in a given location with a given name.

## Command: Results

1. **Rainfall variables**

When the rainfall option is chosen, the command generates the following variables for each season:

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

In addition to these basic statistics, the command computes Z-scores and deviations dynamically against a rolling long run average defined by the option `lr_years` (default 10).
Warning: If there isn't enough historical preceding data to satisfy the user-defined `lr_years` constraint (e.g. asking for 10 years of history when calculating the year 2005 using a dataset that begins in 2000), deviations and z-scores will be skipped for those initial years, though standard variables will still generate.

2. **Temperatire variables**

When the temperature option is chosen, the command generates the following variables for each season:

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
