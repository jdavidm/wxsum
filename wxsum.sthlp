{smcl}
{* *! version 3.3 2nov2023}{...}
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
{synopt:{opt bins(#)}}Number of temperature percentile bins. Minimum 4, Maximum 10. Default is 4.{p_end}
{synopt:{opt lr_years(#)}}Number of strictly preceding years used to calculate rolling deviations and Z-scores. Default is 10. Max is 50.{p_end}
{synopt:{opt keep(varlist)}}Variables to keep in the final dataset along with the generated wxsum variables.{p_end}
{synopt:{opt save(filename)}}File path to save the resulting dataset.{p_end}
{synopt:{opt rain_threshold(#)}}Threshold for defining a rainy day. Defaults to 1.{p_end}
{synoptline}
{p2colreset}{...}

{marker description}{...}
{title:Description}

{pstd}
The {cmd:wxsum} command processes remote sensing rainfall and temperature data and outputs useful statistics. 
The command can be used with either rainfall or temperature data from any source. 
The data must be wide, where each location is a row and each column is a daily reading. 
The variables for each column must contain {it:yyyymmdd}. For example, if the prefix is {it:pic_}, the variable for May 15, 1979 would be {it:pic_19790515}.

{pstd}
Z-scores and deviations from long run averages are dynamically computed strictly against the specified number of preceding `lr_years`. 
{break}Warning: If there isn't enough historical preceding data to satisfy the user-defined `lr_years` constraint (e.g. asking for 10 years of history when calculating the year 2005 using a dataset that begins in 2000), deviations and z-scores will be skipped for those initial years, though standard variables will still generate.

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
{break}- temperature bins

{phang}
{opt rain_data} processes rainfall variables to generate:
{break}- mean daily in a season
{break}- median daily in a season
{break}- standard deviation of daily in a season
{break}- skew of daily in a season
{break}- mean total monthly in a season
{break}- median total monthly in a season
{break}- standard deviation of total monthly in a season
{break}- skew of total monthly in a season
{break}- total seasonal
{break}- deviation from long run average of total seasonal
{break}- z-score of total seasonal
{break}- number of rainy days in a season
{break}- number of days without rain in a season
{break}- deviation from long run average of rainy days in a season
{break}- deviation from long run average of days without rain in a season
{break}- percentage of days with rain in a season
{break}- deviation from the long run average of percentage of days with rain in a season
{break}- longest intra-seasonal dry spell

{phang}
{opt gdd_lo(#)} specifies the lower temperature threshold for calculating Growing Degree Days.

{phang}
{opt gdd_hi(#)} specifies the upper temperature threshold for calculating Growing Degree Days.

{phang}
{opt kdd_base(#)} specifies the threshold temperature above which to calculate Killing Degree Days.

{phang}
{opt bins(#)} sets the number of equal-sized percentile bins for the temperature distribution. Allowed values: 4 to 10. Default is 4.

{phang}
{opt keep(varlist)} specifies variables to keep in the final output (e.g., location identifiers).

{phang}
{opt save(filename)} saves the output dataset.

{phang}
{opt rain_threshold(#)} allows the user to define what counts as a rainy day. Default is > 1.

{phang}
{opt lr_years(#)} Sets the rolling window history size for calculating deviations from the long run average. Defaults to 10.

{marker examples}{...}
{title:Examples}

{phang}{cmd:. use rain.dta, clear}{p_end}
{phang}{cmd:. wxsum r_, ini_month(05) fin_month(10) ini_day(15) fin_day(15) rain_data save(rainfall_stats.dta)}{p_end}

{phang}{cmd:. use temp.dta, clear}{p_end}
{phang}{cmd:. wxsum t_, ini_month(11) fin_month(02) temp_data gdd_lo(8) gdd_hi(32) keep(id region)}{p_end}

{title:Authors}

{pstd}Oscar Barriga Cabanillas{p_end}
{pstd}Aleksandr Michuda{p_end}
{pstd}Jeffrey D. Michler{p_end}
{pstd}Brian McGreal{p_end}
{pstd}Anna Josepshon{p_end}
