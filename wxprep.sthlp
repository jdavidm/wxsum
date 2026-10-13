{smcl}
{* *! version 6.0.0 13oct2026}{...}
{vieweralsosee "wxsum" "help wxsum"}{...}
{viewerjumpto "Syntax" "wxprep##syntax"}{...}
{viewerjumpto "Description" "wxprep##description"}{...}
{viewerjumpto "Subcommands" "wxprep##subcommands"}{...}
{viewerjumpto "Options" "wxprep##options"}{...}
{viewerjumpto "Stored results" "wxprep##results"}{...}
{viewerjumpto "Examples" "wxprep##examples"}{...}
{viewerjumpto "Authors" "wxprep##authors"}{...}
{title:Title}

{phang}
{bf:wxprep} {hline 2} Data preparation companion utility for wxsum


{marker syntax}{...}
{title:Syntax}

{pstd}
Reshape long daily or sub-daily weather data to wide daily format:

{p 8 17 2}
{cmd:wxprep towide} {varname} {ifin}{cmd:,}
    {opt id(varlist)}
    {opt date(varname)}
    {opt stub(string)}
    [{it:towide_options}]


{pstd}
Standardize existing wide daily variables to wxsum naming conventions:

{p 8 17 2}
{cmd:wxprep rename} {varlist}{cmd:,}
    {opt stub(string)}
    {opt firstdate(string)}

{p 8 17 2}
{cmd:wxprep rename} {varlist}{cmd:,}
    {opt stub(string)}
    {opt from(oldstub)}
    {opt dateformat(string)}


{pstd}
Reshape wide daily weather data back to long panel format:

{p 8 17 2}
{cmd:wxprep tolong} {it:stub}{cmd:,}
    {opt id(varlist)}
    [{it:tolong_options}]


{synoptset 30 tabbed}{...}
{synopthdr:towide_options}
{synoptline}
{syntab:Required}
{synopt:{opt id(varlist)}}identifier variable(s) for observational units (e.g., household or pixel ID){p_end}
{synopt:{opt date(varname)}}date variable (%td daily, %tc/%tC clock, integer YYYYMMDD, or string){p_end}
{synopt:{opt stub(string)}}variable prefix for the reshaped daily columns (e.g., {cmd:rf_}){p_end}

{syntab:Optional}
{synopt:{opt daily(method)}}method to aggregate sub-daily readings: {opt mean}, {opt sum}, {opt min}, or {opt max}. Required if duplicate {it:id} x {it:date} observations exist.{p_end}
{synopt:{opt dateformat(string)}}date parsing mask for string date variables (e.g., {cmd:YMD}, {cmd:DMY}, {cmd:MDY}){p_end}
{synopt:{opt nofill}}do not create missing columns for omitted calendar days; default is to fill all calendar dates between minimum and maximum date{p_end}
{synopt:{opt clear}}replace data in memory{p_end}
{synopt:{opt save(filename [, replace])}}save the reshaped wide dataset to file{p_end}
{synoptline}

{synoptset 30 tabbed}{...}
{synopthdr:tolong_options}
{synoptline}
{syntab:Required}
{synopt:{opt id(varlist)}}identifier variable(s) identifying observational units{p_end}

{syntab:Optional}
{synopt:{opt generate(varname)}}name of the weather variable in long format; default is {it:weather}{p_end}
{synopt:{opt date(varname)}}name of the date variable in long format; default is {it:date}{p_end}
{synopt:{opt clear}}replace data in memory{p_end}
{synoptline}
{p2colreset}{...}


{marker description}{...}
{title:Description}

{pstd}
{cmd:wxprep} prepares weather data for analysis with {helpb wxsum}. While {cmd:wxsum} requires daily columns organized in wide format ({it:stub_YYYYMMDD}), raw weather datasets are frequently provided in long format or follow irregular variable naming conventions.

{pstd}
{cmd:wxprep} provides three primary subcommands:
{break}
1. {cmd:wxprep towide}: Reshapes long daily or sub-daily observations into wide format where each date becomes an individual column named {it:stub_YYYYMMDD}. Checks {cmd:c(maxvar)} before reshaping, aggregates sub-daily readings, and optionally fills missing calendar days.
{break}
2. {cmd:wxprep rename}: Renames existing wide variables into standardized {it:stub_YYYYMMDD} format using either a known start date ({opt firstdate()}) or by parsing dates from variable name suffixes ({opt from()} and {opt dateformat()}). Validates all target names prior to execution to prevent accidental data modification.
{break}
3. {cmd:wxprep tolong}: Converts wide daily weather variables back into long panel format with a formatted %td date variable, enabling custom user transformations, indicators, or physical composites before re-aggregating with {cmd:wxprep towide}.


{marker subcommands}{...}
{title:Subcommands}

{dlgtab:towide}

{pstd}
{cmd:wxprep towide} converts long weather records into wide daily columns. 

{phang2}
o {bf:Date formats supported}: Accepts standard Stata %td dates, %tc or %tC datetime clocks (automatically converted via {cmd:dofc()}), integer dates in {cmd:YYYYMMDD} format, or string dates (when {opt dateformat()} is specified).

{phang2}
o {bf:Sub-daily duplicates}: If multiple records exist for any {it:id} and date, {cmd:wxprep} halts with error code 459 unless {opt daily()} is specified. Choose {cmd:daily(mean)} for temperature, or {cmd:daily(sum)} for precipitation.

{phang2}
o {bf:Calendar filling}: By default, all calendar dates between the earliest and latest dates in the sample are created and populated with missing values ({cmd:.}) if unobserved. Specify {opt nofill} to restrict creation strictly to observed dates.

{phang2}
o {bf:Maxvar safeguard}: Checks current Stata {cmd:c(maxvar)} against the required number of variables prior to reshaping, reporting an informative message if {cmd:set maxvar} must be increased.

{dlgtab:rename}

{pstd}
{cmd:wxprep rename} standardizes wide daily variables to {it:stub_YYYYMMDD}.

{phang2}
o {bf:Sequence-based renaming}: With {opt firstdate("YYYY-MM-DD")}, variables in {it:varlist} are renamed sequentially assuming consecutive daily observations starting from the specified date.

{phang2}
o {bf:Pattern-based renaming}: With {opt from(oldstub)} and {opt dateformat(mask)}, dates are extracted directly from each variable's suffix and formatted as {cmd:YYYYMMDD}.

{phang2}
o {bf:Atomic pre-validation}: Prior to renaming any variable, {cmd:wxprep} verifies that all variables are numeric, all target names are valid Stata identifiers, no collisions exist with other variables, and no duplicate target dates occur. If any validation fails, the dataset remains completely unchanged. Reports detected date gaps as warnings.

{dlgtab:tolong}

{pstd}
{cmd:wxprep tolong} reshapes wide daily columns beginning with {it:stub} into a long dataset.

{phang2}
o Generates a formatted {cmd:%td} date variable and an extracted daily weather measure.

{phang2}
o Guarantees exact round-trip fidelity: reshaping wide data to long with {cmd:tolong} and back to wide with {cmd:towide, nofill} reproduces the original dataset exactly.


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:wxprep} stores the following in {cmd:r()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Scalars}{p_end}
{synopt:{cmd:r(n_days)}}number of daily date columns created or processed{p_end}
{synopt:{cmd:r(min_date)}}earliest %td date in sample ({cmd:towide}){p_end}
{synopt:{cmd:r(max_date)}}latest %td date in sample ({cmd:towide}){p_end}
{synopt:{cmd:r(n_renamed)}}number of variables renamed ({cmd:rename}){p_end}
{synopt:{cmd:r(n_gaps)}}number of missing calendar days detected ({cmd:rename}){p_end}
{synopt:{cmd:r(n_obs)}}total long observations created ({cmd:tolong}){p_end}

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Macros}{p_end}
{synopt:{cmd:r(stub)}}stub name used{p_end}
{p2colreset}{...}


{marker examples}{...}
{title:Examples}

{pstd}
{bf:Example 1: Convert long rainfall records to wide format}

{phang2}{cmd:. use rain_long.dta, clear}{p_end}
{phang2}{cmd:. wxprep towide rain, id(hhid) date(date) stub(rf_) clear}{p_end}
{phang2}{cmd:. wxsum rf_, type(rain) ini_month(5) fin_month(10)}{p_end}

{pstd}
{bf:Example 2: Standardize existing columns using first date}

{phang2}{cmd:. wxprep rename day1-day184, stub(rf_) firstdate("2020-05-01")}{p_end}

{pstd}
{bf:Example 3: Create custom indicator using tolong -> towide round trip}

{phang2}{cmd:. wxprep tolong rf_, id(hhid) generate(prcp) date(day) clear}{p_end}
{phang2}{cmd:. gen byte extreme_rain = (prcp >= 50 & !missing(prcp))}{p_end}
{phang2}{cmd:. wxprep towide extreme_rain, id(hhid) date(day) stub(ext_rf_) nofill clear}{p_end}


{marker authors}{...}
{title:Authors}

{pstd}
Jeffrey D. Michler, University of Arizona{break}
Anna Josephson, University of Arizona
