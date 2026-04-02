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
{opt temp_data} processes temperature variables to generate mean, median, sd, skew, and max statistics, as well as Growing Degree Days (GDD), Killing Degree Days (KDD), and percentile bins.

{phang}
{opt rain_data} processes rainfall variables to generate mean, median, sd, skew, and total statistics, as well as number of rainy days, number of days without rain, percentage of rainy days, and the longest intra-season dry spell.

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
