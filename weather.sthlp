{smcl}
{* *! version 3.3 02nov2023}{...}
{vieweralsosee "[D] egen" "help egen"}{...}
{viewerjumpto "Syntax" "weather##syntax"}{...}
{viewerjumpto "Description" "weather##description"}{...}
{viewerjumpto "Options" "weather##options"}{...}
{viewerjumpto "Examples" "weather##examples"}{...}
{viewerjumpto "Authors" "weather##authors"}{...}
{title:Title}

{phang}
{bf:weather} {hline 2} Process remote sensing rainfall and temperature data


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmd:weather}
{it:prefix}{cmd:,}
{opt ini_month(#)}
{opt fin_month(#)}
[{it:options}]

{synoptset 24 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opt ini_month(#)}}initial month of the season (1-12){p_end}
{synopt:{opt fin_month(#)}}final month of the season (1-12){p_end}

{syntab:Optional}
{synopt:{opt day_month(#)}}starting and ending day of the season month; default is 1{p_end}
{synopt:{opt temperature_data}}specify that the data is temperature data{p_end}
{synopt:{opt rain_data}}specify that the data is rainfall data{p_end}
{synopt:{opt growbase_low(#)}}lower bound for growing degree days calculation{p_end}
{synopt:{opt growbase_high(#)}}upper bound for growing degree days calculation{p_end}
{synopt:{opt bins(#)}}number of Schlenker/Roberts temperature bins; default is 5{p_end}
{synopt:{opt keep(varlist)}}keep created variables and specified existing variables{p_end}
{synopt:{opt save(filename)}}save dataset as {it:filename}{p_end}
{synoptline}
{p2colreset}{...}
{p 4 6 2}Note: Either {opt temperature_data} or {opt rain_data} must be specified, but they cannot be used simultaneously.{p_end}


{marker description}{...}
{title:Description}

{pstd}
The {cmd:weather} command processes remote sensing rainfall and temperature data, generating useful summary statistics across user-defined seasons. It can be used with data from any source, provided the data conforms to the following structure:
{break}1. The data is in wide format (each location is a row, each column is a daily reading).
{break}2. Observations are recorded daily.
{break}3. Variable names contain the date in {it:yyyymmdd} format, preceded by a uniform {it:prefix} (e.g., {cmd:pic_} or {cmd:y_}).

{pstd}
The command seamlessly handles seasons that span across calendar years (e.g., from November to February). In such cases, the data is kept associated with the year in which the season starts.

{pstd}
{bf:Rainfall Variables}
{break}When the {opt rain_data} option is specified, the command calculates variables for each season, including:
{break}{space 4}- Mean, median, standard deviation, skewness, total, and max daily rainfall
{break}{space 4}- Long-term averages, deviations, and Z-scores of total rainfall
{break}{space 4}- Number of rainy and no-rain days, and percentage of rainy days
{break}{space 4}- Longest intra-season dry spell

{pstd}
{bf:Temperature Variables}
{break}When the {opt temperature_data} option is specified, the command calculates variables for each season, including:
{break}{space 4}- Mean, median, standard deviation, skewness, and max daily temperature
{break}{space 4}- Growing Degree Days (GDD) bounded by {opt growbase_low} and {opt growbase_high}
{break}{space 4}- Long-term averages, deviations, and Z-scores of GDD
{break}{space 4}- Temperature bins representing the percentage of days falling into temperature quintiles


{marker options}{...}
{title:Options}

{dlgtab:Main}

{phang}
{opt ini_month(#)} specifies the numerical month (1 to 12) when the season begins.

{phang}
{opt fin_month(#)} specifies the numerical month (1 to 12) when the season ends. If {opt ini_month} is greater than {opt fin_month}, the command interprets the season as spanning across the new year.

{dlgtab:Optional}

{phang}
{opt day_month(#)} specifies the exact day of the month when the season begins and ends. If not specified, the default is the first day of the month.

{phang}
{opt temperature_data} informs the command that the variables contain temperature readings. Required if processing temperature data.

{phang}
{opt rain_data} informs the command that the variables contain rainfall readings. Required if processing rainfall data.

{phang}
{opt growbase_low(#)} specifies the lower temperature bound for calculating Growing Degree Days. Required when using {opt temperature_data}.

{phang}
{opt growbase_high(#)} specifies the upper temperature bound for calculating Growing Degree Days. Required when using {opt temperature_data}.

{phang}
{opt bins(#)} determines the number of bins (percentiles) used when generating Schlenker/Roberts temperature distributions. The default is 5 (quintiles).

{phang}
{opt keep(varlist)} instructs the command to keep the variables it creates, plus the specific original variables listed in {it:varlist}, to facilitate merging with other datasets.

{phang}
{opt save(filename)} saves the resulting dataset to the specified {it:filename}.


{marker examples}{...}
{title:Examples}

{pstd}Process rainfall data (using variables starting with `pic_`) for a season running from mid-March to mid-June:{p_end}
{phang2}{cmd:. weather pic_, ini_month(3) fin_month(6) day_month(15) rain_data keep(id) save("rain_stats.dta")}{p_end}

{pstd}Process temperature data (using variables starting with `t_`) for a cross-year season from November to February:{p_end}
{phang2}{cmd:. weather t_, ini_month(11) fin_month(2) temperature_data growbase_low(10) growbase_high(30) save("temp_stats.dta")}{p_end}


{marker authors}{...}
{title:Authors}

{pstd}Oscar Barriga Cabanillas{p_end}
{pstd}Aleksandr Michuda{p_end}
{pstd}Jeffrey D. Michler{p_end}
{pstd}Brian McGreal{p_end}
{pstd}Anna Josepshon{p_end}

{pstd}Contact information or bug reports can be sent to {browse "mailto:jdmichler@arizona.edu":jdmichler@arizona.edu}.{p_end}
