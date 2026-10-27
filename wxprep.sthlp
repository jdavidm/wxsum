{smcl}
{* *! version 1.0.0 20oct2026}{...}
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
Long to wide: one row per unit-day to one row per unit and one variable per day

{p 8 16 2}
{cmd:wxprep towide} {varname} {ifin}{cmd:,} {opth id(varlist)} {opth date(varname)}
{opt stub(string)} [{opt daily(mean|sum|min|max)} {opt dateformat(string)}
{opt nofill} {opth convert(varlist)} {opt clear} {cmd:save(}{it:{help filename}} [{cmd:, replace}]{cmd:)}]

{pstd}
Wide to wide: rename daily variables to {it:stub}{it:yyyymmdd}

{p 8 16 2}
{cmd:wxprep rename} {varlist}{cmd:,} {opt stub(string)} {opt firstdate(date)} [{opth convert(varlist)}]

{p 8 16 2}
{cmd:wxprep rename} {varlist}{cmd:,} {opt stub(string)} {opt from(string)} {opt dateformat(string)}
[{opth convert(varlist)}]

{pstd}
Wide to long: one row per unit and one variable per day to one row per unit-day

{p 8 16 2}
{cmd:wxprep tolong} {it:stub}{cmd:,} {opth id(varlist)} [{opth gen:erate(newvar)}
{opth date(newvar)} {opth convert(varlist)} {opt clear} {cmd:save(}{it:{help filename}} [{cmd:, replace}]{cmd:)}]


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
fails, including {cmd:save()}, the data in memory are left unchanged. The new weather 
variables get the narrowest storage type that holds every value exactly 
({cmd:byte}, {cmd:int}, or {cmd:long} for whole numbers; otherwise {cmd:float}, 
or {cmd:double} when the input is {cmd:double} or {cmd:long}), so a 
{cmd:tolong} - {cmd:towide} round trip reproduces the data.


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
are ignored. Without {opt daily()}, two readings with the same unit and date 
are an error.

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
{opth convert(varlist)} turns {cmd:%tc} and {cmd:%tC} datetime variables into
{cmd:%td} daily dates ({cmd:dofc()} or {cmd:dofC()}), keeping their names and labels, so
that they can be used in the {opt start()}, {opt end()}, and {opt event_date()} options of
{helpb wxsum}. With {cmd:towide}, the variables must be {cmd:id()} variables, the only other variables {cmd:towide} keeps; they are converted before readings are combined, so two datetimes on the same day become one unit. A {cmd:%tc} {opt date()} is converted without this option.

{phang}
{opt clear} allows {cmd:towide} to replace data in memory that have changed
since they were last saved.

{phang}
{cmd:save(}{it:filename} [{cmd:, replace}]{cmd:)} saves the wide data.


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

{phang}
{opth convert(varlist)} turns {cmd:%tc} and {cmd:%tC} datetime variables into
{cmd:%td} daily dates ({cmd:dofc()} or {cmd:dofC()}), keeping their names and labels, so
that they can be used in the {opt start()}, {opt end()}, and {opt event_date()} options of
{helpb wxsum}. With {cmd:rename}, any variables other than the daily variables being renamed can be converted.

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
{opth convert(varlist)} turns {cmd:%tc} and {cmd:%tC} datetime variables into
{cmd:%td} daily dates ({cmd:dofc()} or {cmd:dofC()}), keeping their names and labels, so
that they can be used in the {opt start()}, {opt end()}, and {opt event_date()} options of
{helpb wxsum}. With {cmd:tolong}, the variables must be {cmd:id()} variables, which must still identify the observations after the conversion.

{phang}
{opt clear} allows {cmd:tolong} to replace data in memory that have changed
since they were last saved.

{phang}
{cmd:save(}{it:filename} [{cmd:, replace}]{cmd:)} saves the long data.


{marker examples}{...}
{title:Examples}

{pstd}
These are examples 10-12 of the article; examples 1-9 are in
{help wxsum##examples:help wxsum}. The do-file {cmd:wxsum_examples.do} runs
all twelve; {cmd:net get wxsum} copies it, the sample data, and the example
datasets into the current folder. {cmd:weather_hourly.dta} is simulated.

{pstd}Setup: the sample data have about 7,700 daily variables, more than
the default {cmd:maxvar}{p_end}
{phang2}{cmd:. clear all}{p_end}
{phang2}{cmd:. set maxvar 20000}{p_end}

{pstd}{bf:Example 10.} wxprep rename: daily variables with other names{p_end}
{pstd}One year of rainfall in variables named day1, day2, ..., day365{p_end}
{phang2}{cmd:. use hhid rf_2023* using wxsum_rain, clear}{p_end}
{phang2}{cmd:. rename rf_2023* day#, renumber}{p_end}
{phang2}{cmd:. describe, short}{p_end}
{phang2}{cmd:. wxprep rename day1-day365, stub(rf_) firstdate(01jan2023)}{p_end}
{phang2}{cmd:. describe rf_20230101 rf_20231231}{p_end}

{pstd}{bf:Example 11.} wxprep towide: hourly temperature and humidity{p_end}
{phang2}{cmd:. use weather_hourly, clear}{p_end}
{phang2}{cmd:. describe}{p_end}
{phang2}{cmd:. list in 1/3, noobs}{p_end}
{pstd}Daily maximum temperature in degrees Celsius{p_end}
{phang2}{cmd:. generate tempc = t2m - 273.15}{p_end}
{phang2}{cmd:. wxprep towide tempc, id(hhid) date(time) stub(tmax_) daily(max) clear}{p_end}
{phang2}{cmd:. wxsum tmax_, type(temp) ini_month(3) fin_month(5) gdd_lo(10) gdd_hi(30) heat_threshold(38) keep(hhid)}{p_end}
{phang2}{cmd:. summarize max heatdays heat}{p_end}
{pstd}Daily maximum wet-bulb temperature, from hourly temperature and relative humidity with the formula of Stull (2011){p_end}
{phang2}{cmd:. use weather_hourly, clear}{p_end}
{phang2}{cmd:. generate tempc = t2m - 273.15}{p_end}
{phang2}{cmd:. generate tw = tempc*atan(0.151977*sqrt(rh + 8.313659)) + atan(tempc + rh) - atan(rh - 1.676331) + 0.00391838*rh^1.5*atan(0.023101*rh) - 4.686035}{p_end}
{phang2}{cmd:. wxprep towide tw, id(hhid) date(time) stub(tw_) daily(max) clear}{p_end}
{phang2}{cmd:. wxsum tw_, type(temp) ini_month(4) fin_month(9) gdd_lo(10) gdd_hi(30) heat_threshold(26) keep(hhid)}{p_end}
{phang2}{cmd:. summarize max heatdays heat_start heat heat_end}{p_end}

{pstd}{bf:Example 12.} wxprep tolong: compound hot and dry days{p_end}
{phang2}{cmd:. use wxsum_rain, clear}{p_end}
{phang2}{cmd:. wxprep tolong rf_, id(hhid) generate(rain) clear save(rain_long, replace)}{p_end}
{phang2}{cmd:. use wxsum_temp, clear}{p_end}
{phang2}{cmd:. wxprep tolong tmp_, id(hhid) generate(temp) clear}{p_end}
{phang2}{cmd:. merge 1:1 hhid date using rain_long, keep(match) nogenerate}{p_end}
{pstd}A hot and dry day: less than 1 mm of rain and a mean temperature of 29 degrees C or more{p_end}
{phang2}{cmd:. generate byte hotdry = rain < 1 & temp >= 29 if !missing(rain, temp)}{p_end}
{phang2}{cmd:. wxprep towide hotdry, id(hhid) date(date) stub(hd_) clear}{p_end}
{phang2}{cmd:. wxsum hd_, type(temp) ini_month(5) ini_day(15) fin_month(10) fin_day(15) gdd_lo(0) gdd_hi(1) heat_threshold(1) keep(hhid)}{p_end}
{phang2}{cmd:. summarize heatdays heat_start heat heat_end z_heatdays}{p_end}

{pstd}Other uses, with hypothetical variable names{p_end}

{pstd}Rename variables {cmd:rain1}-{cmd:rain365} that start on 1 January 2020{p_end}
{phang2}{cmd:. wxprep rename rain1-rain365, stub(rf_) firstdate(01jan2020)}{p_end}

{pstd}Rename variables such as {cmd:rain_01jan2020}{p_end}
{phang2}{cmd:. wxprep rename rain_*, stub(rf_) from(rain_) dateformat(DMY)}{p_end}

{pstd}Daily rain from hourly readings, with the visit time (a {cmd:%tc} id()
variable) turned into a daily date{p_end}
{phang2}{cmd:. wxprep towide rain, id(site visit) date(time) stub(rf_) daily(sum) convert(visit) clear}{p_end}


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
{synopt:{cmd:r(converted)}}variables converted by {opt convert()}{p_end}

{pstd}{cmd:wxprep rename} stores{p_end}
{synopt:{cmd:r(n_vars)}}variables renamed{p_end}
{synopt:{cmd:r(n_gaps)}}days between the first and last date without a variable{p_end}
{synopt:{cmd:r(first_date)}, {cmd:r(last_date)}}first and last date{p_end}
{synopt:{cmd:r(stub)}, {cmd:r(first_var)}, {cmd:r(last_var)}}stub and first and last new names{p_end}
{synopt:{cmd:r(converted)}}variables converted by {opt convert()}{p_end}

{pstd}{cmd:wxprep tolong} stores{p_end}
{synopt:{cmd:r(N)}}observations (units x days){p_end}
{synopt:{cmd:r(n_units)}, {cmd:r(n_days)}}units and days{p_end}
{synopt:{cmd:r(first_date)}, {cmd:r(last_date)}}first and last date{p_end}
{synopt:{cmd:r(generate)}, {cmd:r(date)}}names of the new variables{p_end}
{synopt:{cmd:r(converted)}}variables converted by {opt convert()}{p_end}
{p2colreset}{...}


{title:Authors}

{pstd}Jeffrey D. Michler (jdmichler@arizona.edu){p_end}
{pstd}Anna Josephson (aljosephson@arizona.edu){p_end}


{title:Also see}

{psee}
Help: {helpb wxsum}
{p_end}
