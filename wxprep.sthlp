{smcl}
{* *! version 1.0.0 11oct2026}{...}
{vieweralsosee "wxsum" "help wxsum"}{...}
{viewerjumpto "Syntax" "wxprep##syntax"}{...}
{viewerjumpto "Description" "wxprep##description"}{...}
{viewerjumpto "Options" "wxprep##options"}{...}
{viewerjumpto "Examples" "wxprep##examples"}{...}
{viewerjumpto "Stored results" "wxprep##results"}{...}
{title:Title}

{phang}
{bf:wxprep} {hline 2} Prepare daily weather data for {helpb wxsum}


{marker syntax}{...}
{title:Syntax}

{pstd}
Long to wide: one row per unit-day to one variable per day

{p 8 16 2}
{cmd:wxprep towide} {varname} {ifin}{cmd:,} {opth id(varlist)} {opth date(varname)}
{opt stub(string)} [{opt daily(mean|sum|min|max)} {opt dateformat(string)}
{opt nofill} {opt clear} {cmd:save(}{it:{help filename}} [{cmd:, replace}]{cmd:)}]

{pstd}
Wide to wide: rename daily variables to {it:stub}{it:yyyymmdd}

{p 8 16 2}
{cmd:wxprep rename} {varlist}{cmd:,} {opt stub(string)} {opt firstdate(date)}

{p 8 16 2}
{cmd:wxprep rename} {varlist}{cmd:,} {opt stub(string)} {opt from(string)} {opt dateformat(string)}

{pstd}
Wide to long: one variable per day to one row per unit-day

{p 8 16 2}
{cmd:wxprep tolong} {it:stub}{cmd:,} {opth id(varlist)} [{opth gen:erate(newvar)}
{opth date(newvar)} {opt clear}]


{marker description}{...}
{title:Description}

{pstd}
{helpb wxsum} needs wide data: one row per unit and one numeric variable per
day, named {it:stub}{it:yyyymmdd}. {cmd:wxprep} converts other layouts into
that form, and back.

{phang2}
{cmd:wxprep towide} converts long data (one row per unit and day, or per unit
and reading) to wide data. It combines several readings per day with
{opt daily()}, creates one variable per calendar day, and checks
{cmd:maxvar} before it starts.{p_end}
{phang2}
{cmd:wxprep rename} renames wide daily variables whose names do not follow
the {it:stub}{it:yyyymmdd} convention, such as {cmd:rain1}-{cmd:rain365} or
{cmd:rain_01jan1993}.{p_end}
{phang2}
{cmd:wxprep tolong} converts wide data to long data. Daily transformations,
such as converting Kelvin to Celsius or computing a heat index from
temperature and humidity, are easiest in long form: convert with
{cmd:tolong}, transform with {cmd:generate}, and convert back with
{cmd:towide}.{p_end}

{pstd}
{cmd:towide} and {cmd:tolong} replace the data in memory. If the data in memory
have changed since they were last saved, specify {opt clear}. If anything
fails, the data are left unchanged.


{marker options}{...}
{title:Options for wxprep towide}

{phang}
{opth id(varlist)} identifies the units (numeric or string). Each
combination of the {cmd:id()} variables becomes one row. Missing identifiers
are not allowed.

{phang}
{opth date(varname)} holds the date of each reading: a Stata daily date
({cmd:%td}), a datetime ({cmd:%tc} or {cmd:%tC}; the day is kept), a
{it:yyyymmdd} integer such as 19930515, or a string date with
{opt dateformat()}.

{phang}
{opt stub(string)} is the prefix of the new daily variables, used exactly as
typed: {cmd:stub(rf_)} gives {cmd:rf_19930515}. At most 24 characters.

{phang}
{opt daily(mean|sum|min|max)} combines several readings on the same day, for
example hourly data: {cmd:daily(mean)} for mean temperature, {cmd:daily(sum)}
for rainfall, {cmd:daily(max)} for daily maximum temperature. Missing readings
are ignored; a day whose readings are all missing stays missing. Without
{opt daily()}, two readings with the same unit and date are an error.

{phang}
{opt dateformat(string)} gives the order of day, month, and year in a string
{cmd:date()}, as in {helpb datetime_functions:date()}: for example {cmd:YMD}
for "2020-01-31" or {cmd:DMY} for "31jan2020".

{phang}
{opt nofill} creates variables only for dates that appear in the data. By
default {cmd:towide} creates a variable for every calendar day from the first
to the last date and leaves days without data missing, so that
{helpb wxsum} counts them as missing days.

{phang}
{opt clear} allows {cmd:towide} to replace data in memory that have changed
since they were last saved.

{phang}
{cmd:save(}{it:filename} [{cmd:, replace}]{cmd:)} also saves the wide data.


{title:Options for wxprep rename}

{phang}
{opt stub(string)} is the prefix of the new names.

{phang}
{opt firstdate(date)} gives the date of the first variable; the variables in
{varlist} are taken as consecutive days in the order given. The date can be
written as {cmd:01jan1993}, {cmd:1993-01-01}, or {cmd:19930101}.

{phang}
{opt from(string)} and {opt dateformat(string)} read the date from each name:
{opt from()} is the old prefix and {opt dateformat()} the order of the date
that follows it. For example, {cmd:rain_01jan1993} has {cmd:from(rain_)} and
{cmd:dateformat(DMY)}.

{pstd}
Before renaming anything, {cmd:rename} checks that every name gives a valid
date, that no two variables have the same date, and that no new name exists
already. It reports gaps between the first and last date.


{title:Options for wxprep tolong}

{phang}
{opth id(varlist)} identifies the units and must identify the observations
uniquely. Other variables, apart from the daily variables, are dropped;
include unit-level variables that you want to keep in {cmd:id()}.

{phang}
{opth generate(newvar)} names the weather variable. The default is the stub
without a trailing underscore: {cmd:rf_} gives {cmd:rf}.

{phang}
{opth date(newvar)} names the {cmd:%td} date variable; the default is
{cmd:date}.

{phang}
{opt clear} allows {cmd:tolong} to replace data in memory that have changed
since they were last saved.


{marker examples}{...}
{title:Examples}

{pstd}Long daily data to wide, then {cmd:wxsum}{p_end}
{phang2}{cmd:. use rain_long.dta, clear}{p_end}
{phang2}{cmd:. wxprep towide rain, id(hhid) date(date) stub(rf_)}{p_end}
{phang2}{cmd:. wxsum rf_, type(rain) ini_month(5) fin_month(10) keep(hhid)}{p_end}

{pstd}Hourly temperature (a {cmd:%tc} variable {cmd:time}) to daily maxima{p_end}
{phang2}{cmd:. wxprep towide t2m, id(site) date(time) stub(tmax_) daily(max)}{p_end}

{pstd}A daily transformation in long form: Kelvin to Celsius{p_end}
{phang2}{cmd:. wxprep tolong k_, id(hhid) generate(kelvin)}{p_end}
{phang2}{cmd:. generate celsius = kelvin - 273.15}{p_end}
{phang2}{cmd:. wxprep towide celsius, id(hhid) date(date) stub(tmp_) clear}{p_end}

{pstd}Rename variables {cmd:rain1}-{cmd:rain365} that start on 1 January 2020{p_end}
{phang2}{cmd:. wxprep rename rain1-rain365, stub(rf_) firstdate(01jan2020)}{p_end}

{pstd}Rename variables such as {cmd:rain_01jan2020}{p_end}
{phang2}{cmd:. wxprep rename rain_*, stub(rf_) from(rain_) dateformat(DMY)}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}{cmd:wxprep towide} stores{p_end}
{synoptset 20 tabbed}{...}
{synopt:{cmd:r(N)}}units (rows){p_end}
{synopt:{cmd:r(n_days)}}daily variables created{p_end}
{synopt:{cmd:r(n_filled)}}days created without any data{p_end}
{synopt:{cmd:r(n_combined)}}readings combined by {opt daily()}{p_end}
{synopt:{cmd:r(first_date)}, {cmd:r(last_date)}}first and last date{p_end}
{synopt:{cmd:r(stub)}, {cmd:r(first_var)}, {cmd:r(last_var)}}stub and first and last new variables{p_end}

{pstd}{cmd:wxprep rename} stores{p_end}
{synopt:{cmd:r(n_vars)}}variables renamed{p_end}
{synopt:{cmd:r(n_gaps)}}days between the first and last date without a variable{p_end}
{synopt:{cmd:r(first_date)}, {cmd:r(last_date)}}first and last date{p_end}
{synopt:{cmd:r(stub)}, {cmd:r(first_var)}, {cmd:r(last_var)}}stub and first and last new names{p_end}

{pstd}{cmd:wxprep tolong} stores{p_end}
{synopt:{cmd:r(N)}}observations (units x days){p_end}
{synopt:{cmd:r(n_units)}, {cmd:r(n_days)}}units and days{p_end}
{synopt:{cmd:r(first_date)}, {cmd:r(last_date)}}first and last date{p_end}
{synopt:{cmd:r(generate)}, {cmd:r(date)}}names of the new variables{p_end}
{p2colreset}{...}


{title:Authors}

{pstd}Jeffrey D. Michler (jdmichler@arizona.edu){p_end}
{pstd}Anna Josephson (aljosephson@arizona.edu){p_end}
{pstd}Oscar Barriga-Cabanillas (obarriga@worldbank.org){p_end}
{pstd}Aleksandr Michuda (amichud1@swarthmore.edu){p_end}
{pstd}Jeffrey C. Oliver (jcoliver@arizona.edu){p_end}


{title:Also see}

{psee}
Help: {helpb wxsum}
{p_end}
