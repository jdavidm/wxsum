{smcl}
{* *! version 4.3 11jun2026}{...}
{vieweralsosee "" "--"}{...}
{viewerjumpto "Syntax" "wxsum##syntax"}{...}
{viewerjumpto "Description" "wxsum##description"}{...}
{viewerjumpto "Options" "wxsum##options"}{...}
{viewerjumpto "Examples" "wxsum##examples"}{...}
{title:Title}

{phang}
{bf:wxsum} {hline 2} Stata wxsum command

{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:wxsum}
{it:prefix}
{cmd:,}
{opt ini_month(month)}
{opt fin_month(month)}
[{it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opt ini_month(month)}}Initial month of the season (e.g., 05 for May){p_end}
{synopt:{opt fin_month(month)}}Final month of the season (e.g., 10 for October){p_end}

{syntab:Options}
{synopt:{opt ini_day(day)}}Start day of the season. Default is 01.{p_end}
{synopt:{opt fin_day(day)}}End day of the season. Default is 01.{p_end}
{synopt:{opt temp_data}}Specify that data is temperature data. Mutually exclusive with rain_data.{p_end}
{synopt:{opt rain_data}}Specify that data is rainfall data. Mutually exclusive with temp_data.{p_end}
{synopt:{opt gdd_lo(#)}}Lower bound for growing degree days calculation (required if temp_data is used).{p_end}
{synopt:{opt gdd_hi(#)}}Upper bound for growing degree days calculation (required if temp_data is used).{p_end}
{synopt:{opt kdd_base(#)}}Temperature threshold for calculating Killing Degree Days (KDD).{p_end}
{synopt:{opt gdd_bin(#)}}Width of fixed-interval seasonal GDD categories.{p_end}
{synopt:{opt gdd_binlo(#)}}Lower endpoint for regular GDD intervals. Default 0.{p_end}
{synopt:{opt gdd_binhi(#)}}Upper endpoint for regular GDD intervals; values at or above are top-coded.{p_end}
{synopt:{opt tmp_bin(#)}}Total number of fixed daily-temperature bin count variables per season. Integer from 1 to 42.{p_end}
{synopt:{opt tmp_binlo(#)}}Lower bound of the temperature range for bin construction. Required with {opt tmp_bin()}.{p_end}
{synopt:{opt tmp_binhi(#)}}Upper bound of the temperature range for bin construction. Required with {opt tmp_bin()}.{p_end}
{synopt:{opt shape(wide|long)}}Shape of the final output. Default is {it:wide}.{p_end}
{synopt:{opt lr_years(#)}}Number of strictly preceding years used to calculate rolling deviations and Z-scores. Default is 10. Max is 50.{p_end}
{synopt:{opt keep(varlist)}}Variables to keep in the final dataset along with the generated wxsum variables.{p_end}
{synopt:{opt save(filename)}}File path to save the resulting dataset.{p_end}
{synopt:{opt rain_threshold(#)}}Threshold for defining a rainy day. Defaults to 1. Missing rainfall values are excluded from rain-day and dry-spell calculations.{p_end}
{synoptline}
{p2colreset}{...}

{marker description}{...}
{title:Description}

{pstd}
The {cmd:wxsum} command processes remote sensing rainfall and temperature data and outputs useful statistics. 
The command can be used with either rainfall or temperature data from any source. 
The data must be wide, where each location is a row and each column is a daily reading. 
Daily weather variable names must be the user-supplied prefix followed by {it:yyyymmdd}. For example, if the prefix is {it:rf_}, the variable for May 15, 1979 would be {it:rf_19790515}.

{pstd}
Z-scores and deviations from long-run averages are computed strictly against the specified number of preceding {opt lr_years}.
{break}If there is not enough historical preceding data to satisfy the user-defined {opt lr_years} constraint, deviations and z-scores are skipped for those initial years, though standard variables are still generated.

{marker remarks}{...}
{title:Remarks}

{pstd}
Using data sets as defined above, the wxsum command creates useful statistics in the same fashion for all years.

{pstd}
The general syntax of the command is as follows:

{pstd}
- After the command name, one has to define what variables contain the rain/temperature information. For example, for CHIRPS datasets, the prefix on the wxsum variables might be {it:pic_} while in the case of ECMWF the prefix could be {it:y_}.

{pstd}
- Next, one needs to tell the command whether the data is {opt rain_data} or {opt temp_data}.

{pstd}
- One then has to select a season to study using the options {opt ini_month(number)}, {opt fin_month(number)} and {opt ini_day(number)} and {opt fin_day(number)}. If the day options are not specified, the default is the first day of the month. For example, to choose a season from the middle of March to the middle of June, you would set ini_month(03), fin_month(06), ini_day(15), fin_day(15). The command seamlessly handles seasons that span across calendar years, such as November to February, keeping the data associated with the year the season starts.

{pstd}
- The option {opt keep} tells the command to keep the variables it creates plus some of the original variables in order to match them with other datasets.

{pstd}
- The {opt save} option tells the program to save the dataset in a given location with a given name.

{marker options}{...}
{title:Options}

{phang}
{opt ini_month(month)} specifies the starting month of the season. 

{phang}
{opt fin_month(month)} specifies the ending month of the season. Seasons can span across calendar years (e.g., November to February).

{phang}
{opt ini_day(day)} specifies the day the season begins. If not specified, it defaults to 01.

{phang}
{opt fin_day(day)} specifies the day the season ends. If not specified, it defaults to 01.

{phang}
{opt temp_data} processes temperature variables to generate:
{break}- mean daily in a season
{break}- median daily in a season
{break}- standard deviation of daily in a season
{break}- skew of temp in a season
{break}- max daily in a season
{break}- gdd in a season
{break}- deviations from long run average gdd in a season
{break}- z-score of gdd in a season
{break}- deviations from long run average kdd in a season
{break}- z-score of kdd in a season
{break}- seasonal GDD category variable {it:gddcat_YEAR} (when {opt gdd_bin()} is specified)
{break}- fixed daily-temperature bin count variables {it:tmpbinXX_YEAR} (when {opt tmp_bin()} is specified)

{phang}
{opt rain_data} processes rainfall variables to generate:
{break}- mean daily in a season
{break}- median daily in a season
{break}- standard deviation of daily in a season
{break}- skew of daily in a season
{break}- mean total monthly in a season
{break}- deviation from long run average of mean total monthly in a season
{break}- z-score of mean total monthly in a season
{break}- total seasonal
{break}- deviation from long run average of total seasonal
{break}- z-score of total seasonal
{break}- number of rainy days in a season
{break}- number of days without rain in a season
{break}- deviation from long run average of rainy days in a season
{break}- deviation from long run average of days without rain in a season
{break}- percentage of days with rain in a season
{break}- deviation from the long run average of percentage of days with rain in a season
{break}- longest mid-season dry spell
{break}- leading dry spell at the start of the season
{break}- trailing dry spell at the end of the season

{phang}
{opt gdd_lo(#)} specifies the lower temperature threshold for calculating Growing Degree Days.

{phang}
{opt gdd_hi(#)} specifies the upper temperature threshold for calculating Growing Degree Days.

{phang}
{opt kdd_base(#)} specifies the threshold temperature above which to calculate Killing Degree Days.

{phang}
{opt gdd_bin(#)} specifies the fixed width of seasonal GDD categories. When specified, {cmd:wxsum} creates one integer categorical variable {it:gddcat_YYYY} for each generated GDD season. The categories are defined over fixed-width intervals of the seasonal GDD total, following the approach used in Deschênes and Greenstone-style specifications. The user can then use Stata's factor-variable notation (e.g., {cmd:i.gddcat_1993}) to generate dummies in estimation commands. The command assigns Stata value labels to each category so that {cmd:tabulate gddcat_1993} displays the GDD intervals. The bin width is specified in the same units as the generated GDD variable. Requires {opt temp_data}.

{phang}
{opt gdd_binlo(#)} specifies the lower endpoint at which regular fixed-width GDD intervals begin. Default is 0 when {opt gdd_bin()} is specified. If any seasonal GDD total falls below this value, a bottom-coded category "GDD < {it:#}" is created. Requires {opt gdd_bin()}.

{phang}
{opt gdd_binhi(#)} specifies the upper endpoint at which regular fixed-width GDD intervals end. Values at or above this endpoint are assigned to a top-coded category "GDD >= {it:#}". When omitted, the command automatically extends the regular intervals to cover the empirical maximum. Requires {opt gdd_bin()}. Must be greater than {opt gdd_binlo()}. The range ({opt gdd_binhi()} - {opt gdd_binlo()}) must be evenly divisible by {opt gdd_bin()}.

{phang}
{opt tmp_bin(#)} specifies the total number of fixed daily-temperature bin count variables to create per season. Must be a positive integer from 1 to 42. Requires {opt temp_data} and both {opt tmp_binlo()} and {opt tmp_binhi()}.

{pmore}
These are fixed daily-temperature bin counts based on one observed daily temperature reading per day, not exact Schlenker-Roberts within-day exposure bins. When only one daily reading is available, the entire day is assigned to the bin containing that reading. This approximates the Schlenker-Roberts temperature-bin idea.

{pmore}
The command is unit agnostic: the user must supply {opt tmp_binlo()} and {opt tmp_binhi()} in the same units as the daily temperature data.

{pmore}
Missing daily temperatures are not counted in any bin. If all daily temperatures for a location-season are missing, all {it:tmpbinXX_YYYY} variables for that location-season are set to missing. Otherwise, the sum of all {it:tmpbinXX_YYYY} equals the number of nonmissing daily temperature readings in that season.

{pmore}
For {opt tmp_bin(J)} with J >= 3, the bins are constructed as follows. Let lo = {opt tmp_binlo()}, hi = {opt tmp_binhi()}, and w = (hi - lo) / (J - 2). Then:
{break}  tmpbin01 counts days with T < lo (lower tail)
{break}  tmpbin02 counts days with lo <= T < lo + w
{break}  tmpbin03 counts days with lo + w <= T < lo + 2w
{break}  ...
{break}  tmpbinJJ counts days with T >= hi (upper tail)

{pmore}
Formally:
{break}  tmpbin_it^(1)   = sum_d 1{c -(}T_id < lo{c )-}
{break}  tmpbin_it^(j)   = sum_d 1{c -(}lo + (j-2)w <= T_id < lo + (j-1)w{c )-},  j = 2,...,J-1
{break}  tmpbin_it^(J)   = sum_d 1{c -(}T_id >= hi{c )-}
{break}  where w = (hi - lo) / (J - 2)

{pmore}
Interior bins are lower-closed and upper-open. The lower tail is strictly below lo. The upper tail is at or above hi.

{pmore}
The usual Schlenker-Roberts-style lower-tail/interior/upper-tail bins are obtained with {opt tmp_bin(3)} or larger. Common fine-bin specifications use values such as {opt tmp_bin(15)} or {opt tmp_bin(42)}.

{pmore}
Special cases for small J:
{break}- {opt tmp_bin(1)}: Creates a single variable counting all nonmissing daily temperature readings. {opt tmp_binlo()} and {opt tmp_binhi()} are required for syntax consistency but are not used for assignment.
{break}- {opt tmp_bin(2)}: Splits at the midpoint m = (lo + hi) / 2. tmpbin01 counts T < m, tmpbin02 counts T >= m.

{phang}
{opt tmp_binlo(#)} specifies the lower bound of the temperature range for bin construction. Required when {opt tmp_bin()} is specified. Must be in the same units as the daily temperature data.

{phang}
{opt tmp_binhi(#)} specifies the upper bound of the temperature range for bin construction. Required when {opt tmp_bin()} is specified. Must be greater than {opt tmp_binlo()} and in the same units as the daily temperature data.

{phang}
{opt shape(wide|long)} specifies the shape of the final output. The default is {it:wide}, producing one row per spatial/analytic unit with year-suffixed variable names (e.g., {it:mean_1993}, {it:tmpbin01_1993}).

{pmore}
When {opt shape(long)} is specified, the final output is stacked long with one row per retained unit-year. A variable named {it:year} is created to identify the season year. Generated variables have their {it:_YYYY} suffixes stripped (e.g., {it:mean}, {it:tmpbin01}). Variables specified in {opt keep()} are repeated across years.

{pmore}
It is strongly recommended to use {opt keep(id ...)} or {opt keep()} with whatever merge keys are needed when {opt shape(long)} is requested. If {opt keep()} is empty, a note is printed but no error occurs.

{pmore}
{opt shape(long)} is a final-output stacking operation; the wide input requirement is unchanged. It can make panel workflows easier and can reduce the final number of variables when many years or temperature bins are generated, although it does not yet reduce the peak number of variables created internally.

{pmore}
If a variable named {it:year} is included in {opt keep()}, the command exits with an error to prevent naming conflicts.

{phang}
{opt keep(varlist)} specifies variables to keep in the final output (e.g., location identifiers).

{phang}
{opt save(filename)} saves the output dataset.

{phang}
{opt rain_threshold(#)} allows the user to define what counts as a rainy day. Default is 1. Missing rainfall values are excluded from rain-day, no-rain-day, percentage, and dry-spell calculations.

{phang}
{opt lr_years(#)} Sets the rolling window history size for calculating deviations from the long run average. Defaults to 10.

{phang}
Growing degree days are calculated as capped degree accumulation: {cmd:min(max(temp - gdd_lo, 0), gdd_hi - gdd_lo)}, summed over the season.

{phang}
Skewness is calculated as the raw third standardized moment. It requires at least 3 non-missing observations.

{phang}
Dry spells are calculated strictly from non-missing rainfall data. A dry day is defined as rainfall strictly less than {opt rain_threshold(#)}. A rainy day is rainfall greater than or equal to {opt rain_threshold(#)}. Missing daily rainfall values are excluded from dry counts and break consecutive dry spells.
{break}- {it:dry_start_YYYY} captures the length of the leading dry spell before the first rainy day or missing value.
{break}- {it:dry_YYYY} captures the longest mid-season dry spell strictly after the first observed rainy day and strictly before the last observed rainy day.
{break}- {it:dry_end_YYYY} captures the trailing dry spell after the last rainy day or missing value.

{phang}
GDD categories are constructed over the seasonal GDD total, not over daily temperatures. Let tau_0 < tau_1 < ... < tau_J be fixed cutpoints generated from {opt gdd_bin()}, {opt gdd_binlo()}, and either {opt gdd_binhi()} or the automatic endpoint. Then {it:gddcat_it} = j if tau_{j-1} <= GDD_it < tau_j. If a bottom-coded category is needed, {it:gddcat_it} = 1 when GDD_it < tau_0. If a top-coded category is requested, {it:gddcat_it} = J+1 when GDD_it >= tau_J.

{marker examples}{...}
{title:Examples}

{phang}{cmd:. use rain.dta, clear}{p_end}
{phang}{cmd:. wxsum rf_, ini_month(05) fin_month(10) ini_day(15) fin_day(15) rain_data save(rainfall_stats.dta)}{p_end}

{phang}{cmd:. use temp.dta, clear}{p_end}
{phang}{cmd:. wxsum tmp_, ini_month(11) fin_month(02) temp_data gdd_lo(8) gdd_hi(32) keep(hhid)}{p_end}

{phang}{cmd:. * GDD categories with 500 degree-day width (Fahrenheit degree-day example)}{p_end}
{phang}{cmd:. wxsum tmp_, ini_month(04) fin_month(09) fin_day(30) temp_data gdd_lo(46.4) gdd_hi(89.6) gdd_bin(500)}{p_end}

{phang}{cmd:. * GDD categories with bottom and top coding}{p_end}
{phang}{cmd:. wxsum tmp_, ini_month(04) fin_month(09) fin_day(30) temp_data gdd_lo(8) gdd_hi(32) gdd_bin(250) gdd_binlo(0) gdd_binhi(3000)}{p_end}

{phang}{cmd:. * Fixed daily-temperature bin counts (15 bins, Celsius)}{p_end}
{phang}{cmd:. wxsum tmp_, ini_month(04) fin_month(09) fin_day(30) temp_data gdd_lo(8) gdd_hi(32) tmp_bin(15) tmp_binlo(0) tmp_binhi(39)}{p_end}

{phang}{cmd:. * Fine 42-bin specification for degree-day style analysis}{p_end}
{phang}{cmd:. wxsum tmp_, ini_month(04) fin_month(09) fin_day(30) temp_data gdd_lo(8) gdd_hi(32) tmp_bin(42) tmp_binlo(1) tmp_binhi(41)}{p_end}

{phang}{cmd:. * Long output for panel workflows}{p_end}
{phang}{cmd:. wxsum tmp_, ini_month(04) fin_month(09) fin_day(30) temp_data gdd_lo(8) gdd_hi(32) tmp_bin(15) tmp_binlo(0) tmp_binhi(39) keep(hhid) shape(long)}{p_end}

{title:Authors}

{pstd}Oscar Barriga Cabanillas{p_end}
{pstd}Anna Josepshon{p_end}
{pstd}Brian McGreal{p_end}
{pstd}Jeffrey D. Michler{p_end}
{pstd}Aleksandr Michuda{p_end}
{pstd}Jeffrey C. Oliver{p_end}
