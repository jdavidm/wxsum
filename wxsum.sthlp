{smcl}
{* *! version 4.0 2apr2026}{...}
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
{synopt:{opt temperature_data}}Specify that data is temperature data. Mutually exclusive with rain_data.{p_end}
{synopt:{opt rain_data}}Specify that data is rainfall data. Mutually exclusive with temperature_data.{p_end}
{synopt:{opt growbase_low(#)}}Lower bound for growing degree days calculation (required if temperature_data is used).{p_end}
{synopt:{opt growbase_high(#)}}Upper bound for growing degree days calculation (required if temperature_data is used).{p_end}
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

{pstd}
The data must be wide, where each location is a row and each column is a daily reading. 
The variables for each column must contain {it:yyyymmdd}. For example, if the prefix is {it:pic_}, the variable for May 15, 1979 would be {it:pic_19790515}.

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
{opt temperature_data} processes temperature variables to generate mean, median, sd, skew, and max statistics, as well as Growing Degree Days (GDD) and percentile bins (20th, 40th, 60th, 80th, 100th).

{phang}
{opt rain_data} processes rainfall variables to generate mean, median, sd, skew, and total statistics, as well as number of rainy days, number of days without rain, percentage of rainy days, and the longest intra-season dry spell.

{phang}
{opt growbase_low(#)} specifies the lower temperature threshold for calculating Growing Degree Days.

{phang}
{opt growbase_high(#)} specifies the upper temperature threshold for calculating Growing Degree Days.

{phang}
{opt keep(varlist)} specifies variables to keep in the final output (e.g., location identifiers).

{phang}
{opt save(filename)} saves the output dataset.

{phang}
{opt rain_threshold(#)} allows the user to define what counts as a rainy day. Default is > 1.

{marker examples}{...}
{title:Examples}

{phang}{cmd:. wxsum pic_, ini_month(05) fin_month(10) ini_day(15) fin_day(15) rain_data save(rainfall_stats.dta)}{p_end}
{phang}{cmd:. wxsum t_, ini_month(11) fin_month(02) temperature_data growbase_low(8) growbase_high(32) keep(id region)}{p_end}

{title:Authors}

{pstd}Oscar Barriga Cabanillas{p_end}
{pstd}Aleksandr Michuda{p_end}
{pstd}Jeffrey D. Michler{p_end}
{pstd}Brian McGreal{p_end}
{pstd}Anna Josepshon{p_end}
