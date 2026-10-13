{smcl}
{* *! version 6.0.0 13oct2026}{...}
{vieweralsosee "wxprep" "help wxprep"}{...}
{viewerjumpto "Syntax" "wxsum##syntax"}{...}
{viewerjumpto "Description" "wxsum##description"}{...}
{viewerjumpto "Modes and Windows" "wxsum##modes"}{...}
{viewerjumpto "Options" "wxsum##options"}{...}
{viewerjumpto "Temperature Thresholds and Physiology" "wxsum##physiology"}{...}
{viewerjumpto "Stored results" "wxsum##results"}{...}
{viewerjumpto "Changes from Version 5" "wxsum##changes"}{...}
{viewerjumpto "Examples" "wxsum##examples"}{...}
{viewerjumpto "Authors" "wxsum##authors"}{...}
{title:Title}

{phang}
{bf:wxsum} {hline 2} Fast processing of remote-sensing weather data into seasonal and exposure-window statistics


{marker syntax}{...}
{title:Syntax}

{pstd}
{bf:Mode 1: Calendar Window Mode (fixed seasonal dates across all units)}

{p 8 17 2}
{cmdab:wxsum} {it:stubname}{cmd:,}
    {opt type(rain|temp)}
    {opt ini_month(month)}
    {opt fin_month(month)}
    [{it:calendar_options} {it:common_options}]


{pstd}
{bf:Mode 2: Unit-Specific Exposure Window Mode (custom dates per observation)}

{p 8 17 2}
{cmdab:wxsum} {it:stubname}{cmd:,}
    {opt type(rain|temp)}
    {opt start(varname)}
    {opt end(varname)}
    [{it:unit_options} {it:common_options}]

{p 8 17 2}
{cmdab:wxsum} {it:stubname}{cmd:,}
    {opt type(rain|temp)}
    {opt event_date(varname)}
    {opt days(#)}
    [{opt lag(#)} {it:unit_options} {it:common_options}]


{synoptset 28 tabbed}{...}
{synopthdr:calendar_options}
{synoptline}
{syntab:Season Timing}
{synopt:{opt ini_month(month)}}initial month of the season (e.g., 05 for May){p_end}
{synopt:{opt fin_month(month)}}final month of the season (e.g., 10 for October; cross-year seasons supported){p_end}
{synopt:{opt ini_day(day)}}start day of the season; default is {cmd:01}{p_end}
{synopt:{opt fin_day(day)}}end day of the season; defaults to true calendar end of final month (accounting for leap years){p_end}
{synoptline}

{synopthdr:unit_options}
{synoptline}
{syntab:Unit Windows}
{synopt:{opt start(varname)}}unit-specific start date variable (%td format){p_end}
{synopt:{opt end(varname)}}unit-specific end date variable (%td format){p_end}
{synopt:{opt event_date(varname)}}reference date variable (%td format) for shortcut window definition{p_end}
{synopt:{opt days(#)}}length of window in calendar days (positive integer){p_end}
{synopt:{opt lag(#)}}calendar day shift relative to {opt event_date()}; default is {cmd:0}{p_end}
{synopt:{opt partial}}allow windows that extend beyond the calendar date boundaries of the input data{p_end}
{synoptline}

{synopthdr:common_options}
{synoptline}
{syntab:Reference Period}
{synopt:{opt lr_years(#)}}number of strictly preceding years used for rolling deviations and z-scores; default is {cmd:10}{p_end}
{synopt:{opt baseline(y1 y2)}}fixed calendar year baseline period (e.g., {cmd:baseline(1981 2010)}) instead of rolling window{p_end}
{synopt:{opt ref_min(#)}}minimum observed reference years required to compute deviations/z-scores; defaults to {opt lr_years()} or baseline duration{p_end}

{syntab:Thresholds & Bins}
{synopt:{opt minobs(#)}}minimum non-missing observed days required in window; default is {cmd:1}. Windows with fewer days return missing for all statistics{p_end}
{synopt:{opt rain_threshold(#)}}threshold for defining a rainy day; default is {cmd:1} (in data units){p_end}
{synopt:{opt gdd_lo(#)}}lower temperature threshold for growing degree days (GDD); required with {cmd:type(temp)}{p_end}
{synopt:{opt gdd_hi(#)}}upper temperature threshold for growing degree days (GDD); required with {cmd:type(temp)}{p_end}
{synopt:{opt heat_threshold(#)}}temperature threshold for heat days, heat spells, and degree days; required with {cmd:type(temp)}{p_end}
{synopt:{opt kdd_base(#)}}base threshold for killing degree days (KDD); defaults to {opt heat_threshold()}{p_end}
{synopt:{opt cuts(numlist)}}user-defined temperature or rainfall threshold cuts creating K+1 count bins{p_end}
{synopt:{opt gdd_bin(#)}}width of fixed-interval seasonal GDD categories (Deschênes & Greenstone){p_end}
{synopt:{opt gdd_binlo(#)}}lower endpoint for regular GDD categories; default is {cmd:0}{p_end}
{synopt:{opt gdd_binhi(#)}}upper endpoint for regular GDD categories; top-codes values at or above{p_end}
{synopt:{opt tmp_bin(#)}}number of daily temperature bins (1 to 42) in the spirit of Schlenker & Roberts{p_end}
{synopt:{opt tmp_binlo(#)}}lower temperature bound for bin construction; required with {opt tmp_bin()}{p_end}
{synopt:{opt tmp_binhi(#)}}upper temperature bound for bin construction; required with {opt tmp_bin()}{p_end}

{syntab:Output & Housekeeping}
{synopt:{opt shape(long|wide)}}shape of output dataset; {bf:default is long} (in v5 was wide){p_end}
{synopt:{opt outstub(string)}}custom prefix for generated variables{p_end}
{synopt:{opt keep(varlist)}}variables to keep in the output dataset (e.g., location or household IDs){p_end}
{synopt:{opt save(filename [, replace])}}file path to save the resulting dataset{p_end}
{synoptline}
{p2colreset}{...}


{marker description}{...}
{title:Description}

{pstd}
{cmd:wxsum} processes wide daily remote-sensing weather data into comprehensive seasonal statistics, agricultural degree-day measures, spell durations, and historical deviations. It is powered by an inline compiled Mata analytical engine that computes multi-year panel summaries in fractions of a second.

{pstd}
{cmd:wxsum} requires daily data organized in wide format where each row is an observational unit (location, pixel, or household) and columns represent daily observations named {it:stub_YYYYMMDD} (e.g., {cmd:rf_20200515} or {cmd:tmp_20200515}). Datasets in long panel format can be reshaped directly using the companion command {helpb wxprep}.

{pstd}
By default in version 6.0, {cmd:wxsum} produces {bf:long-format} output with one observation per unit-year, which integrates seamlessly into panel regression models.


{marker modes}{...}
{title:Modes and Windows}

{pstd}
{cmd:wxsum} supports two distinct analytical window modes:

{dlgtab:1. Calendar Window Mode}

{pstd}
Used when exposure windows follow fixed calendar dates across all spatial units (e.g., the regional agricultural rainy season from May 1 to October 31).

{phang2}
o {bf:Cross-year seasons}: Seasons where {opt fin_month()} is smaller than {opt ini_month()} (e.g., November to February) automatically span calendar year boundaries and are assigned to the year in which the season began.

{phang2}
o {bf:Leap year fidelity}: Dynamic calculation of month endpoints correctly accounts for February 29 in leap years.

{dlgtab:2. Unit-Specific Exposure Window Mode}

{pstd}
Used when exposure windows vary by observation, such as household-specific planting dates, survey recall windows, child birth months, or clinical health events.

{phang2}
o {bf:Flexible syntax}: Specify exact start and end dates via {opt start(varname) end(varname)}, or specify an anchor date and duration via {opt event_date(varname) days(#) [lag(#)]}. Both variables must be Stata {cmd:%td} dates.

{phang2}
o {bf:Historical reference windows}: Historical reference periods for unit-specific windows are shifted strictly by calendar years. February 29 dates in leap years are matched to February 29 in historical leap years and mapped safely to February 28 in non-leap years.

{phang2}
o {bf:Boundary handling}: If a unit window extends outside the available daily data, {cmd:wxsum} halts with an informative error unless {opt partial} is specified.


{marker physiology}{...}
{title:Temperature Thresholds and Physiology}

{pstd}
Agronomic and economic research demonstrates that temperature effects on biological processes are highly non-linear. Moderate heat accumulation supports plant growth (Growing Degree Days, GDD), whereas extreme heat exposure causes thermal stress and physiological damage (Killing Degree Days, KDD).

{pstd}
{cmd:wxsum} 6 requires {opt heat_threshold(#)} whenever {opt type(temp)} is specified:

{phang2}
o {bf:Heat Days & Heat Spells}: {cmd:heatdays} counts observed days where temperature equals or exceeds {opt heat_threshold(#)}. {cmd:pct_heatdays} calculates the share of observed days above this threshold. {cmd:heat_start}, {cmd:heat}, and {cmd:heat_end} quantify the duration of leading, longest mid-season, and trailing consecutive extreme heat spells.

{phang2}
o {bf:Killing Degree Days (KDD)}: Calculated as the sum of max(T - k, 0) over observed days, where k is {opt kdd_base(#)}. If {opt kdd_base()} is omitted, it defaults directly to {opt heat_threshold(#)}.

{phang2}
o {bf:Data Frequency and Biological Meaning}: The appropriate threshold depends critically on whether the user provides daily mean temperature ({it:T_mean}) or daily maximum temperature ({it:T_max}). When using daily mean temperatures, a threshold of 29-30°C represents severe heat stress because afternoon peak temperatures typically reach 35-38°C. When using daily maximum temperatures, higher thresholds (such as 32-34°C) are typically chosen.


{marker options}{...}
{title:Options}

{phang}
{opt type(rain|temp)} specifies whether to process rainfall or temperature data. Required.

{pmore}
{bf:type(rain)} generates:
{break}  {cmd:nobs}           Number of non-missing observed days in the window
{break}  {cmd:mean}           Mean daily rainfall
{break}  {cmd:median}         Median daily rainfall
{break}  {cmd:var}            Sample variance of daily rainfall
{break}  {cmd:sd}             Standard deviation of daily rainfall
{break}  {cmd:skew}           Adjusted Fisher-Pearson sample skewness
{break}  {cmd:mean_mo}        Mean of monthly rainfall totals
{break}  {cmd:total}          Total seasonal rainfall accumulation
{break}  {cmd:raindays}       Count of days with rainfall >= rain_threshold
{break}  {cmd:norain}         Count of days with rainfall < rain_threshold
{break}  {cmd:pct_raindays}   Percentage of observed days with rain (raindays / nobs)
{break}  {cmd:dry_start}      Duration of leading dry spell at season onset
{break}  {cmd:dry}            Longest mid-season dry spell
{break}  {cmd:dry_end}        Duration of trailing dry spell at season close
{break}  {cmd:dev_*}          Deviations from historical rolling or baseline average (for all 8 core metrics)
{break}  {cmd:z_*}            Standardized z-scores against historical reference (for all 8 core metrics)

{pmore}
{bf:type(temp)} generates:
{break}  {cmd:nobs}           Number of non-missing observed days in the window
{break}  {cmd:mean}           Mean daily temperature
{break}  {cmd:median}         Median daily temperature
{break}  {cmd:var}            Sample variance of daily temperature
{break}  {cmd:sd}             Standard deviation of daily temperature
{break}  {cmd:skew}           Adjusted Fisher-Pearson sample skewness
{break}  {cmd:max}            Maximum observed daily temperature
{break}  {cmd:gdd}            Growing degree days accumulated between gdd_lo and gdd_hi
{break}  {cmd:kdd}            Killing degree days accumulated above kdd_base
{break}  {cmd:heatdays}       Count of days with temperature >= heat_threshold
{break}  {cmd:pct_heatdays}   Percentage of observed days with extreme heat (heatdays / nobs)
{break}  {cmd:heat_start}     Duration of leading heat spell
{break}  {cmd:heat}           Longest mid-season heat spell
{break}  {cmd:heat_end}       Duration of trailing heat spell
{break}  {cmd:dev_*}          Deviations from historical reference (for all 7 core temperature metrics)
{break}  {cmd:z_*}            Standardized z-scores against historical reference (for all 7 core temperature metrics)
{break}  {cmd:gddcat}         Integer GDD category (when {opt gdd_bin()} is specified)
{break}  {cmd:tmpbinXX}       Count of days in temperature intervals (when {opt tmp_bin()} is specified)
{break}  {cmd:cutXX}          Count of days in threshold intervals (when {opt cuts()} is specified)

{phang}
{opt minobs(#)} sets the minimum number of observed (non-missing) days required in an exposure window. Defaults to {cmd:1}. Windows with fewer than # observed days yield missing values ({cmd:.}) for all statistics, including totals and counts.

{phang}
{opt lr_years(#)} specifies the number of strictly preceding years used as a rolling reference period. Default is {cmd:10}.

{phang}
{opt baseline(y1 y2)} specifies a fixed historical baseline period (e.g., {cmd:baseline(1981 2010)}). Deviations and z-scores are calculated against this fixed historical benchmark. Mutually exclusive with {opt lr_years()}.

{phang}
{opt cuts(numlist)} specifies an ascending list of threshold cutpoints. Generates K+1 count variables ({cmd:cut01} to {cmd:cutK+1}) counting days strictly below the first cutpoint, within each interior interval [cut_k, cut_k+1), and at or above the final cutpoint.

{phang}
{opt shape(long|wide)} specifies output structure. Default is {cmd:long}. When {cmd:shape(long)} is chosen, generated variables are named without year suffixes, and a variable {cmd:year} identifies the season.

{phang}
{opt keep(varlist)} retains specified original variables in the output dataset (e.g., unit identifiers).


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:wxsum} stores the following in {cmd:r()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Matrices}{p_end}
{synopt:{cmd:r(missing)}}matrix summarizing data completeness and window coverage diagnostics. In calendar mode, rows correspond to seasons; in unit mode, a single row is returned with summary statistics (mean days, mean observed days, share with any missing, share with all missing, windows below minobs, and outside windows).{p_end}

{p2col 5 20 24 2: Scalars}{p_end}
{synopt:{cmd:r(N_seasons)}}number of calendar seasons processed{p_end}
{synopt:{cmd:r(N_units)}}number of observational units{p_end}
{synopt:{cmd:r(minobs)}}minimum observation threshold applied{p_end}
{synopt:{cmd:r(lr_years)}}rolling reference window size{p_end}

{p2col 5 20 24 2: Macros}{p_end}
{synopt:{cmd:r(type)}}data type ({cmd:rain} or {cmd:temp}){p_end}
{synopt:{cmd:r(shape)}}output shape ({cmd:long} or {cmd:wide}){p_end}
{synopt:{cmd:r(reference_type)}}reference model ({cmd:rolling} or {cmd:baseline}){p_end}
{p2colreset}{...}


{marker changes}{...}
{title:Changes from Version 5}

{pstd}
Version 6.0 introduces major enhancements, optimizations, and syntax improvements:

{phang2}
1. {bf:Default output shape}: Output defaults to {cmd:shape(long)} instead of {cmd:wide}.

{phang2}
2. {bf:Missing data handling}: Windows with no observed days (or fewer than {opt minobs(#)}) return missing values ({cmd:.}) for all statistics, rather than zeros.

{phang2}
3. {bf:Heat metrics & threshold syntax}: {opt heat_threshold(#)} is now required for temperature data. New metrics include {cmd:heatdays}, {cmd:pct_heatdays}, and heat spell durations ({cmd:heat_start}, {cmd:heat}, {cmd:heat_end}).

{phang2}
4. {bf:Spell reference statistics}: Historical deviations ({cmd:dev_}) and z-scores ({cmd:z_}) are now computed for all dry-spell and heat-spell measures.

{phang2}
5. {bf:Unit-specific exposure windows}: Users can define custom exposure windows per observation using {opt start() end()} or {opt event_date() days() [lag()]}.

{phang2}
6. {bf:Arbitrary threshold bins}: Added {opt cuts(numlist)} to partition weather distributions into custom intervals.

{phang2}
7. {bf:Fixed baseline reference}: Added {opt baseline(y1 y2)} as an alternative to rolling historical windows.

{phang2}
8. {bf:Quality diagnostics}: Exports matrix {cmd:r(missing)} reporting missing data counts and coverage quality.

{phang2}
9. {bf:Compiled Mata engine}: The core numerical engine was rewritten in Mata, executing 10x-100x faster than v5.

{phang2}
10. {bf:Companion preparation utility}: Introduced {helpb wxprep} to handle long-to-wide reshaping, standardization, and wide-to-long round trips.


{marker examples}{...}
{title:Examples}

{pstd}
{bf:Example 1: Seasonal rainfall summaries in long panel format (default)}

{phang2}{cmd:. use rain.dta, clear}{p_end}
{phang2}{cmd:. wxsum rf_, type(rain) ini_month(05) fin_month(10) ini_day(15) fin_day(15) keep(hhid)}{p_end}

{pstd}
{bf:Example 2: Cross-year temperature season with heat and degree day thresholds}

{phang2}{cmd:. use temp.dta, clear}{p_end}
{phang2}{cmd:. wxsum tmp_, type(temp) ini_month(11) fin_month(02) gdd_lo(8) gdd_hi(32) heat_threshold(32) keep(hhid)}{p_end}

{pstd}
{bf:Example 3: Unit-specific 90-day planting window}

{phang2}{cmd:. wxsum rf_, type(rain) event_date(plant_date) days(90) lr_years(5) keep(hhid plant_date)}{p_end}


{marker authors}{...}
{title:Authors}

{pstd}Jeffrey D. Michler (jdmichler@arizona.edu), University of Arizona{break}
Anna Josephson (aljosephson@arizona.edu), University of Arizona{break}
Oscar Barriga-Cabanillas, World Bank{break}
Aleksandr Michuda, Swarthmore College{break}
Jeffrey C. Oliver, University of Arizona
