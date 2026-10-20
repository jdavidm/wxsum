{smcl}
{* *! version 6.3.0 20oct2026}{...}
{vieweralsosee "wxprep" "help wxprep"}{...}
{viewerjumpto "Syntax" "wxsum##syntax"}{...}
{viewerjumpto "Description" "wxsum##description"}{...}
{viewerjumpto "Options" "wxsum##options"}{...}
{viewerjumpto "Remarks" "wxsum##remarks"}{...}
{viewerjumpto "Changes from version 5" "wxsum##changes"}{...}
{viewerjumpto "Examples" "wxsum##examples"}{...}
{viewerjumpto "Stored results" "wxsum##results"}{...}
{title:Title}

{phang}
{bf:wxsum} {hline 2} A command for creating statistics from daily temperature and precipitation data


{marker syntax}{...}
{title:Syntax}

{pstd}
Calendar window (the same dates for every observation, one window per year)

{p 8 16 2}
{cmd:wxsum} {it:stub}{cmd:,} {opt type(rain|temp)} {opt ini_month(#)} {opt fin_month(#)}
[{opt ini_day(#)} {opt fin_day(#)} {it:options}]

{pstd}
Unit-specific window (dates taken from variables, one window per observation)

{p 8 16 2}
{cmd:wxsum} {it:stub}{cmd:,} {opt type(rain|temp)} {opth start(varname)} {opth end(varname)}
[{opt partial} {it:options}]

{p 8 16 2}
{cmd:wxsum} {it:stub}{cmd:,} {opt type(rain|temp)} {opth event_date(varname)} {opt days(#)}
[{opt lag(#)} {opt partial} {it:options}]

{pstd}
{it:stub} is the common prefix of the daily variables, which must be named
{it:stub}{it:yyyymmdd}; for example, {cmd:rf_19930515} has stub {cmd:rf_}.
{it:stub} is not a varlist.

{synoptset 26 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Required}
{synopt:{opt type(rain|temp)}}type of daily data; other daily series use {cmd:temp}{p_end}

{syntab:Calendar window}
{synopt:{opt ini_month(#)}}first month of the window (1-12){p_end}
{synopt:{opt fin_month(#)}}last month of the window (1-12){p_end}
{synopt:{opt ini_day(#)}}first day; default is 1{p_end}
{synopt:{opt fin_day(#)}}last day; default is the last day of {opt fin_month()}{p_end}

{syntab:Unit-specific window}
{synopt:{opth start(varname)}}daily date ({cmd:%td}) of each observation's first day{p_end}
{synopt:{opth end(varname)}}daily date of each observation's last day{p_end}
{synopt:{opth event_date(varname)}}date of an event; the window ends the day before it{p_end}
{synopt:{opt days(#)}}length of the window that ends before {opt event_date()}{p_end}
{synopt:{opt lag(#)}}move the window {it:#} days earlier; default is 0{p_end}
{synopt:{opt partial}}use the available days when a window runs past the data{p_end}

{syntab:Rain}
{synopt:{opt rain_threshold(#)}}rainy day if rain >= {it:#}; default is 1{p_end}

{syntab:Temperature (all required except kdd_base())}
{synopt:{opt gdd_lo(#)}}lower bound for growing degree days{p_end}
{synopt:{opt gdd_hi(#)}}upper bound for growing degree days{p_end}
{synopt:{opt heat_threshold(#)}}heat day if temp >= {it:#}; also the base for killing degree days{p_end}
{synopt:{opt kdd_base(#)}}base for killing degree days if different from {opt heat_threshold()}{p_end}

{syntab:Optional bins and categories}
{synopt:{opt gdd_bin(#)}}width of seasonal GDD categories ({cmd:gddcat}){p_end}
{synopt:{opt gdd_binlo(#)}}lower end of the regular GDD categories; default is 0{p_end}
{synopt:{opt gdd_binhi(#)}}upper end of the regular GDD categories (top-coded above){p_end}
{synopt:{opt tmp_bin(#)}}number of daily temperature bins (1-42){p_end}
{synopt:{opt tmp_binlo(#)}}lower end of the equal-width temperature bins{p_end}
{synopt:{opt tmp_binhi(#)}}upper end of the equal-width temperature bins{p_end}
{synopt:{opth cuts(numlist)}}bins with your own cutpoints (rain or temp){p_end}

{syntab:Reference period}
{synopt:{opt lr_years(#)}}rolling window of the {it:#} preceding years; default is 10{p_end}
{synopt:{opt baseline(# #)}}fixed reference period, e.g. {cmd:baseline(1981 2010)}{p_end}
{synopt:{opt ref_min(#)}}minimum number of nonmissing reference years; default is all{p_end}

{syntab:Missing data}
{synopt:{opt minobs(#)}}minimum number of observed days per window; default is 1{p_end}

{syntab:Output}
{synopt:{opt shape(long|wide)}}shape of a calendar-window result; default is {cmd:long}{p_end}
{synopt:{opt outstub(string)}}prefix added to every output variable name{p_end}
{synopt:{opth keep(varlist)}}variables to carry into the output, such as identifiers{p_end}
{synopt:{cmd:save(}{it:{help filename}} [{cmd:, replace}]{cmd:)}}save the output dataset{p_end}
{synoptline}
{p2colreset}{...}


{marker description}{...}
{title:Description}

{pstd}
{cmd:wxsum} turns daily weather data into statistics for a window of days: a
season that repeats every year (a calendar window) or a window that differs by
observation, such as a farm's growing season or the months before a birth (a
unit-specific window). It computes the distribution of daily values, totals,
counts of rainy or hot days, dry and heat spells, growing and killing degree
days, optional bins, and deviations and z-scores relative to a rolling or fixed
reference period.

{pstd}
The data must be wide: one observation per location (or household, plot,
person, ...) and one numeric variable per day, named {it:stub}{it:yyyymmdd}.
Daily data in long form (one row per location-day), or wide data with other
variable names, can be converted with {helpb wxprep}.

{pstd}
{cmd:wxsum} replaces the data in memory with the results. If anything fails,
the data are left unchanged.


{marker options}{...}
{title:Options}

{dlgtab:Required}

{phang}
{opt type(rain|temp)} specifies the kind of daily data. {cmd:type(rain)} gives
precipitation statistics; {cmd:type(temp)} gives temperature statistics. Other
daily series, such as humidity, wind speed, or wet-bulb temperature, can be
summarized with {cmd:type(temp)}, though not all produced statistics may be 
meaningful (i.e., GDD when data is windspeed); {opt cuts()} is often useful 
when data is not temperature.

{dlgtab:Calendar window}

{phang}
{opt ini_month(#)} and {opt fin_month(#)} give the first and last month of the
window. If {opt fin_month()} comes before {opt ini_month()} in the calendar year,
the window crosses the end of the year (for example, November to February) and
is labeled with the year in which it starts.

{phang}
{opt ini_day(#)} and {opt fin_day(#)} give the first and last day. By default
the window starts on the first day of {opt ini_month()} and ends on the last day
of {opt fin_month()}, including 29 February in leap years. If {opt ini_day()}
or {opt fin_day()} is 29 February, common years use 28 February. A window is
computed for every year in which the entire window lies completely inside the dates of
the data.

{dlgtab:Unit-specific window}

{phang}
{opth start(varname)} and {opth end(varname)} hold each observation's first and
last day as Stata daily dates ({cmd:%td}). Windows can differ in length.
Observations with a missing date get missing statistics. {cmd:%tc} datetimes
are not accepted; convert them with {cmd:dofc()} or with the {opt convert()}
option of {helpb wxprep}.

{phang}
{opth event_date(varname)} and {opt days(#)} are a shortcut for a window of
{it:#} days ending the day before an event: {cmd:start} = event_date - days -
lag and {cmd:end} = event_date - 1 - lag. {opt lag(#)} moves the window {it:#}
days earlier (default 0); a negative value moves it later.

{phang}
{opt partial} computes windows that run past the first or last date of the
data using only the days inside the data. Without {opt partial}, such windows
get missing statistics (including {cmd:nobs}), and their number is reported.

{pstd}
With a unit-specific window the output has one row per observation and no
year suffix; {opt shape()} has no effect.

{dlgtab:Thresholds}

{phang}
{opt rain_threshold(#)} defines a rainy day as rain >= {it:#}; a dry day
has rain < {it:#}. The default is 1 (in the units of the data). Rain only.

{phang}
{opt gdd_lo(#)} and {opt gdd_hi(#)} are the lower and upper bounds for growing
degree days. Both are required with {cmd:type(temp)}.

{phang}
{opt heat_threshold(#)} defines a heat day as temp >= {it:#} and is used
for heat days, heat spells, and, unless {opt kdd_base()} is given, killing
degree days. Required with {cmd:type(temp)}. The meaning of the threshold
depends on the daily series supplied: 30 degrees reached by daily means is much
rarer than 30 degrees reached by daily maxima.

{phang}
{opt kdd_base(#)} sets a different base for killing degree days. Without it,
KDD are degree days above {opt heat_threshold()}.

{pstd}
All thresholds are in the units of the daily data; {cmd:wxsum} does not
convert units.

{dlgtab:Optional bins and categories}

{phang}
{opt gdd_bin(#)} creates {cmd:gddcat}, the fixed-width interval that contains
the seasonal GDD total ({it:#} is the width, in GDD units). Categories are
pooled over all observations and windows and carry a value label such as
"GDD [500,600)", so {cmd:i.gddcat} can be used in regressions. Temp only.

{phang}
{opt gdd_binlo(#)} is the lower end of the regular intervals (default 0);
totals below it get a bottom-coded category. {opt gdd_binhi(#)} is the upper
end; totals at or above it get a top-coded category. Without {opt gdd_binhi()},
the intervals extend past the largest total. ({opt gdd_binhi()} -
{opt gdd_binlo()}) must be a multiple of {opt gdd_bin()}.

{phang}
{opt tmp_bin(#)} with {opt tmp_binlo(lo)} and {opt tmp_binhi(hi)} creates {it:#}
daily temperature bins {cmd:tmpbin01}, {cmd:tmpbin02}, ...: days below {it:lo},
{it:#}-2 equal-width bins from {it:lo} to {it:hi}, and days at or above {it:hi}.
Bins include their lower edge. {cmd:tmp_bin(1)} counts all observed days;
{cmd:tmp_bin(2)} splits at ({it:lo}+{it:hi})/2. Temp only.

{phang}
{opth cuts(numlist)} creates bins at your own increasing cutpoints
{it:c1} ... {it:cK}: {cmd:cut01} counts days below {it:c1}, {cmd:cut02} days
from {it:c1} up to {it:c2}, ..., and the last bin days at or above {it:cK}. Up to
41 cutpoints. Works with rain (intensity bins) and temperature (exposure
bands). Cannot be combined with {opt tmp_bin()}.

{pstd}
Bins count observed days only; they are missing when a window has fewer than
{opt minobs()} observed days.

{dlgtab:Reference period}

{phang}
{opt lr_years(#)} compares each window with the {it:#} windows that start in
the {it:#} preceding years (2 to 50; default 10). The current window is never
part of its own reference.

{phang}
{opt baseline(# #)} compares each window with a fixed set of years, such as a
climate normal: {cmd:baseline(1981 2010)} uses the windows that start in
1981-2010. Windows inside the baseline are compared with a baseline that
includes them. The baseline must cover at least {opt ref_min()} windows of
the data (years of the data with unit-specific windows). Cannot be combined
with {opt lr_years()}.

{phang}
{opt ref_min(#)} is the number of nonmissing reference values an observation
needs for a deviation and z-score (at least 2). The default is all reference
years: {opt lr_years()}, or the number of years in {opt baseline()}.

{pstd}
With a unit-specific window, the reference windows are the same window moved
back 1, 2, etc. years (or moved to each baseline year), with 29 February moved
to 28 February in common years.

{dlgtab:Missing data}

{phang}
{opt minobs(#)} sets every statistic (except {cmd:nobs}) to missing for a
window with fewer than {it:#} observed days. The default, 1, gives missing
statistics only for windows with no observed day.

{dlgtab:Output}

{phang}
{opt shape(long|wide)} sets the shape of a calendar-window result. {cmd:long}
(the default) has one row per observation and window, a variable {cmd:year}
(the year the window starts), and statistics named {cmd:total}, {cmd:mean},
etc. {cmd:wide} has one row per observation and statistics named
{cmd:total_1993}, {cmd:mean_1993}, etc. Input data are wide in both cases.

{phang}
{opt outstub(string)} adds a prefix to every output name except {cmd:year};
for example, {cmd:outstub(r_)} gives {cmd:r_total}. Use it to keep rain and
temperature results in the same dataset, or several windows side by side.

{phang}
{opth keep(varlist)} lists the variables to keep, typically identifiers and
merge keys. In long output, only {cmd:keep()} variables, {cmd:year}, and the
statistics are kept. In wide output and with unit-specific windows,
{cmd:keep()} keeps only these variables and the statistics; without it, all
variables are kept and the statistics are placed first.

{phang}
{cmd:save(}{it:filename} [{cmd:, replace}]{cmd:)} saves the output. An existing
file is overwritten only with {cmd:replace}.


{marker remarks}{...}
{title:Remarks}

{pstd}
{ul:Statistics}

{pstd}
For each window {cmd:wxsum} creates the following variables (with
{cmd:_}{it:yyyy} added in wide output). Missing daily values are not treated
as observed weather; calendar days without a daily variable count as missing
days.

{p2colset 8 26 28 2}{...}
{p2col:{cmd:nobs}}observed (nonmissing) days in the window{p_end}
{p2col:{cmd:mean median}}mean and median of the daily values{p_end}
{p2col:{cmd:var sd}}sample variance and standard deviation (at least 2 days){p_end}
{p2col:{cmd:skew}}adjusted Fisher-Pearson skewness (at least 3 days, sd > 0){p_end}
{p2colreset}{...}

{pstd}
{cmd:type(rain)} adds

{p2colset 8 26 28 2}{...}
{p2col:{cmd:total}}total rain over the observed days{p_end}
{p2col:{cmd:mean_mo}}mean of the calendar-month totals; months without an observed day are left out, and partial months at the edges of the window count as months{p_end}
{p2col:{cmd:raindays norain}}days with rain >= and < {opt rain_threshold()}{p_end}
{p2col:{cmd:pct_raindays}}share of observed days with rain{p_end}
{p2col:{cmd:dry_start dry dry_end}}leading, mid-window, and trailing dry spells (days){p_end}
{p2colreset}{...}

{pstd}
{cmd:type(temp)} adds

{p2colset 8 26 28 2}{...}
{p2col:{cmd:max}}highest daily value{p_end}
{p2col:{cmd:gdd}}growing degree days: the number of degrees between {opt gdd_lo()} and {opt gdd_hi()} each day, summed over the days: 0 when T <= gdd_lo, T - gdd_lo when gdd_lo < T < gdd_hi, and gdd_hi - gdd_lo when T >= gdd_hi{p_end}
{p2col:{cmd:kdd}}killing degree days: the number of degrees above the KDD base k each day, summed over the days: T - k when T > k, otherwise 0; k is {opt kdd_base()}, or {opt heat_threshold()} when {opt kdd_base()} is not given{p_end}
{p2col:{cmd:heatdays pct_heatdays}}days with T >= {opt heat_threshold()}, and their share{p_end}
{p2col:{cmd:heat_start heat heat_end}}leading, mid-window, and trailing heat spells (days){p_end}
{p2colreset}{...}

{pstd}
plus {cmd:gddcat}, {cmd:tmpbin}{it:##}, or {cmd:cut}{it:##} when requested,
and deviations ({cmd:dev_}) and z-scores ({cmd:z_}) for {cmd:mean_mo},
{cmd:total}, {cmd:raindays}, {cmd:norain}, {cmd:pct_raindays}, and the
mid-window dry spell {cmd:dry} (rain) or {cmd:gdd}, {cmd:kdd},
{cmd:heatdays}, {cmd:pct_heatdays}, and the mid-window heat spell
{cmd:heat} (temp).

{pstd}
{ul:Spells}

{pstd}
A dry spell is a run of consecutive dry days (rain < {opt rain_threshold()});
a heat spell is a run of consecutive heat days (temp >=
{opt heat_threshold()}). The other observed days (rainy days, or cooler days)
end a run as does a missing day.

{phang2}
{cmd:dry_start} ({cmd:heat_start}), the leading spell, is the run that begins
on the first observed day of the window; missing days at the start are
skipped. It is 0 if the first observed day is a rainy (cooler) day.{p_end}
{phang2}
{cmd:dry_end} ({cmd:heat_end}), the trailing spell, is the run that ends on
the last observed day of the window, skipping missing days at the end. It is 0 if the last
observed day is a rainy (cooler) day.{p_end}
{phang2}
{cmd:dry} ({cmd:heat}), the mid-window spell, is the longest run that is
neither the leading nor the trailing spell when the window has at least two
rainy (cooler) days, to create a break between the start and end spells. With none or one, it is the longest run anywhere in the
window (which may also be the leading or trailing spell), so a window without
rain has a long mid-window dry spell, not 0.{p_end}

{pstd}
Every run is therefore the leading spell, the trailing spell, or a candidate
for the mid-window spell, and the longest dry (heat) spell anywhere in the
window is {cmd:max(dry_start, dry, dry_end)}
({cmd:max(heat_start, heat, heat_end)}). For example, with
{cmd:heat_threshold(30)}, daily temperatures 35, ., 35, 35, 20, 20 give
{cmd:heat_start} = 1 (the missing second day ends the leading spell),
{cmd:heat} = 2 (days 3-4), and {cmd:heat_end} = 0. Spell lengths are counts
with many zeros; read their z-scores with care.

{pstd}
{ul:Missing data}

{pstd}
Totals and counts use the observed days, so a window with missing days can
understate total rain; check {cmd:nobs} and the missing-data summary in
{cmd:r(missing)}, and use {opt minobs()} to require enough observed days. A
window with no observed day has missing statistics and {cmd:nobs} = 0, and it
does not enter any reference period. A deviation or z-score is missing unless
the observation has {opt ref_min()} nonmissing reference values; a z-score is
missing when the reference values do not vary.

{pstd}
{ul:Memory and maxvar}

{pstd}
Wide daily data have one variable per day: 40 years are about 14,600
variables. Stata/SE and Stata/MP need {cmd:set maxvar} above the default of
5,000 for such data (type {cmd:clear all}, then {cmd:set maxvar 20000}, then
load the data). Stata/BE allows 2,048 variables, about five years; use
{helpb wxprep} with {cmd:if} to convert part of the years at a time, and make
sure each part contains the reference years you need. {cmd:wxsum} checks
{cmd:maxvar} before it starts. Long output needs few variables.

{pstd}
{ul:Labels, characteristics, and storage}

{pstd}
Every variable that {cmd:wxsum} creates has a label that states its threshold,
and the characteristics {cmd:[wxsum_stat]} and {cmd:[wxsum_window]} record the
statistic and the window (with the year in wide output). The dataset
characteristics {cmd:_dta[wxsum_cmdline]}, {cmd:_dta[wxsum_version]},
{cmd:_dta[wxsum_type]}, {cmd:_dta[wxsum_shape]}, {cmd:_dta[wxsum_window]},
{cmd:_dta[wxsum_ref]}, {cmd:_dta[wxsum_thresholds]}, and
{cmd:_dta[wxsum_minobs]} record the last {cmd:wxsum} command and its
settings, so they survive {cmd:save}; type {cmd:char list} to see them.

{pstd}
Continuous statistics are stored in the default storage type
({helpb generate:set type}, normally {cmd:float}); counts are stored as
integers. Output variables are compressed.

{marker examples}{...}
{title:Examples}

{pstd}
These are the examples of the article. The do-file {cmd:wxsum_examples.do}
runs all twelve and {cmd:wxsum_examples.log} shows their output;
{cmd:net get wxsum} copies them, the sample data, and the example datasets
into the current folder, where the examples run. Examples 1-9 are below;
examples 10-12, which start with {cmd:wxprep}, are in
{help wxprep##examples:help wxprep}. The example datasets
{cmd:hh_panel.dta}, {cmd:births.dta}, and {cmd:weather_hourly.dta} are
simulated: they illustrate the commands and are not observed data.

{pstd}Setup: the sample data have about 7,700 daily variables, more than
the default {cmd:maxvar}{p_end}
{phang2}{cmd:. clear all}{p_end}
{phang2}{cmd:. set maxvar 20000}{p_end}

{pstd}{bf:Example 1.} Rainfall in a growing season (15 May - 15 October){p_end}
{phang2}{cmd:. use rain, clear}{p_end}
{phang2}{cmd:. describe, short}{p_end}
{phang2}{cmd:. wxsum rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) fin_day(15) keep(hhid)}{p_end}
{phang2}{cmd:. list hhid year nobs total raindays dry_start dry dry_end in 1/5, noobs abbreviate(9)}{p_end}

{pstd}{bf:Example 2.} What wxsum created: stored results, labels, characteristics{p_end}
{phang2}{cmd:. return list}{p_end}
{phang2}{cmd:. matrix list r(missing)}{p_end}
{phang2}{cmd:. describe total dev_total z_total dry_start}{p_end}
{phang2}{cmd:. char list _dta[]}{p_end}

{pstd}{bf:Example 3.} Growing degree days, killing degree days, and heat spells{p_end}
{phang2}{cmd:. use temp, clear}{p_end}
{phang2}{cmd:. wxsum tmp_, type(temp) ini_month(5) ini_day(15) fin_month(10) fin_day(15) gdd_lo(10) gdd_hi(30) heat_threshold(29) keep(hhid)}{p_end}
{phang2}{cmd:. summarize gdd kdd heatdays heat_start heat heat_end}{p_end}

{pstd}{bf:Example 4.} Exposure bins and GDD categories{p_end}
{pstd}Days in temperature bands over the hot, dry season, November to April; the season crosses the end of the year and takes the year in which it starts{p_end}
{phang2}{cmd:. use temp, clear}{p_end}
{phang2}{cmd:. wxsum tmp_, type(temp) ini_month(11) fin_month(4) gdd_lo(10) gdd_hi(30) heat_threshold(30) cuts(24 27 30) keep(hhid)}{p_end}
{phang2}{cmd:. describe cut*}{p_end}
{phang2}{cmd:. summarize cut*}{p_end}
{pstd}Equal-width temperature bins and categories of seasonal GDD{p_end}
{phang2}{cmd:. use temp, clear}{p_end}
{phang2}{cmd:. quietly wxsum tmp_, type(temp) ini_month(5) ini_day(15) fin_month(10) fin_day(15) gdd_lo(10) gdd_hi(30) heat_threshold(29) tmp_bin(8) tmp_binlo(20) tmp_binhi(32) gdd_bin(100) gdd_binlo(2000) gdd_binhi(2400) keep(hhid)}{p_end}
{phang2}{cmd:. summarize tmpbin*}{p_end}
{phang2}{cmd:. tabulate gddcat}{p_end}

{pstd}{bf:Example 5.} Deviations and z-scores against a fixed baseline{p_end}
{phang2}{cmd:. use rain, clear}{p_end}
{phang2}{cmd:. wxsum rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) fin_day(15) baseline(2003 2012) keep(hhid)}{p_end}
{phang2}{cmd:. format dev_total %7.1f}{p_end}
{phang2}{cmd:. format z_total z_dry %5.2f}{p_end}
{phang2}{cmd:. list year total dev_total z_total dry z_dry if hhid == 101 & year >= 2016, noobs abbreviate(9)}{p_end}

{pstd}{bf:Example 6.} Missing days: minobs() and ref_min(){p_end}
{pstd}Suppose that the rainfall of household 103 is missing in June and July 2015{p_end}
{phang2}{cmd:. use rain, clear}{p_end}
{phang2}{cmd:. quietly recode rf_201506* rf_201507* (nonmissing = .) if hhid == 103}{p_end}
{phang2}{cmd:. preserve}{p_end}
{phang2}{cmd:. wxsum rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) fin_day(15) minobs(140) keep(hhid)}{p_end}
{phang2}{cmd:. format dev_total %7.1f}{p_end}
{phang2}{cmd:. list year nobs total dev_total if hhid == 103 & inrange(year, 2014, 2017), noobs abbreviate(9)}{p_end}
{phang2}{cmd:. restore}{p_end}
{pstd}Deviations that need 9 of the 10 reference seasons, not all 10{p_end}
{phang2}{cmd:. quietly wxsum rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) fin_day(15) minobs(140) ref_min(9) keep(hhid)}{p_end}
{phang2}{cmd:. format dev_total %7.1f}{p_end}
{phang2}{cmd:. list year nobs total dev_total if hhid == 103 & inrange(year, 2014, 2017), noobs abbreviate(9)}{p_end}

{pstd}{bf:Example 7.} Rain and temperature together; wide output{p_end}
{phang2}{cmd:. use rain, clear}{p_end}
{phang2}{cmd:. wxsum rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) fin_day(15) outstub(r_) keep(hhid) save(rain_season, replace)}{p_end}
{phang2}{cmd:. use temp, clear}{p_end}
{phang2}{cmd:. quietly wxsum tmp_, type(temp) ini_month(5) ini_day(15) fin_month(10) fin_day(15) gdd_lo(10) gdd_hi(30) heat_threshold(29) outstub(t_) keep(hhid)}{p_end}
{phang2}{cmd:. merge 1:1 hhid year using rain_season, nogenerate}{p_end}
{phang2}{cmd:. describe, short}{p_end}
{phang2}{cmd:. format t_gdd t_kdd %7.1f}{p_end}
{phang2}{cmd:. list hhid year r_total r_dry t_gdd t_kdd in 1/3, noobs}{p_end}
{pstd}The rainfall statistics in wide form: one row per household{p_end}
{phang2}{cmd:. use rain, clear}{p_end}
{phang2}{cmd:. quietly wxsum rf_, type(rain) ini_month(5) ini_day(15) fin_month(10) fin_day(15) keep(hhid) shape(wide)}{p_end}
{phang2}{cmd:. describe, short}{p_end}
{phang2}{cmd:. ds *_2023, varwidth(21)}{p_end}

{pstd}{bf:Example 8.} Farm-specific growing seasons and an illustrative regression{p_end}
{phang2}{cmd:. use hh_panel, clear}{p_end}
{phang2}{cmd:. describe}{p_end}
{phang2}{cmd:. list in 1/3, noobs}{p_end}
{phang2}{cmd:. merge m:1 hhid using rain, nogenerate}{p_end}
{phang2}{cmd:. merge m:1 hhid using temp, nogenerate}{p_end}
{phang2}{cmd:. wxsum rf_, type(rain) start(plant) end(harvest) outstub(r_) keep(hhid year plant harvest yield tmp_*)}{p_end}
{phang2}{cmd:. quietly wxsum tmp_, type(temp) start(plant) end(harvest) gdd_lo(10) gdd_hi(30) heat_threshold(29) outstub(t_) keep(hhid year plant harvest yield r_*)}{p_end}
{phang2}{cmd:. format t_gdd t_kdd %7.1f}{p_end}
{phang2}{cmd:. list hhid year plant harvest r_total t_gdd t_kdd in 1/4, noobs}{p_end}
{phang2}{cmd:. xtset hhid year}{p_end}
{phang2}{cmd:. xtreg yield r_total t_gdd t_kdd, fe vce(cluster hhid)}{p_end}

{pstd}{bf:Example 9.} Heat exposure in each trimester of pregnancy{p_end}
{phang2}{cmd:. use births, clear}{p_end}
{phang2}{cmd:. describe}{p_end}
{phang2}{cmd:. merge m:1 hhid using temp, nogenerate}{p_end}
{pstd}Third trimester: the 91 days before birth{p_end}
{phang2}{cmd:. wxsum tmp_, type(temp) event_date(birthdate) days(91) gdd_lo(10) gdd_hi(30) heat_threshold(30) outstub(t3_) keep(childid hhid birthdate bweight tmp_*)}{p_end}
{pstd}Second and first trimesters: the same window moved 91 and 182 days earlier{p_end}
{phang2}{cmd:. quietly wxsum tmp_, type(temp) event_date(birthdate) days(91) lag(91) gdd_lo(10) gdd_hi(30) heat_threshold(30) outstub(t2_) keep(childid hhid birthdate bweight t3_* tmp_*)}{p_end}
{phang2}{cmd:. quietly wxsum tmp_, type(temp) event_date(birthdate) days(91) lag(182) gdd_lo(10) gdd_hi(30) heat_threshold(30) outstub(t1_) keep(childid hhid birthdate bweight t3_* t2_*)}{p_end}
{phang2}{cmd:. summarize t1_heatdays t2_heatdays t3_heatdays}{p_end}
{phang2}{cmd:. regress bweight t1_heatdays t2_heatdays t3_heatdays, vce(cluster hhid)}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:wxsum} stores the following in {cmd:r()}:

{synoptset 24 tabbed}{...}
{p2col 5 24 28 2: Scalars}{p_end}
{synopt:{cmd:r(N)}}observations in the output{p_end}
{synopt:{cmd:r(N_units)}}distinct combinations of the {cmd:keep()} variables{p_end}
{synopt:{cmd:r(k_created)}}number of variables created{p_end}
{synopt:{cmd:r(n_windows)}}number of calendar windows (1 for unit-specific){p_end}
{synopt:{cmd:r(first_year)}}first window year (calendar){p_end}
{synopt:{cmd:r(last_year)}}last window year (calendar){p_end}
{synopt:{cmd:r(minobs)}}{opt minobs()}{p_end}
{synopt:{cmd:r(ref_min)}}{opt ref_min()}{p_end}
{synopt:{cmd:r(lr_years)}}{opt lr_years()} (rolling reference){p_end}
{synopt:{cmd:r(baseline_first)}}first baseline year (fixed reference){p_end}
{synopt:{cmd:r(baseline_last)}}last baseline year (fixed reference){p_end}
{synopt:{cmd:r(rain_threshold)}}rain threshold (rain){p_end}
{synopt:{cmd:r(gdd_lo)}, {cmd:r(gdd_hi)}}GDD bounds (temp){p_end}
{synopt:{cmd:r(heat_threshold)}}heat threshold (temp){p_end}
{synopt:{cmd:r(kdd_base)}}KDD base used (temp){p_end}

{p2col 5 24 28 2: Macros}{p_end}
{synopt:{cmd:r(cmdline)}}command as typed{p_end}
{synopt:{cmd:r(type)}}{cmd:rain} or {cmd:temp}{p_end}
{synopt:{cmd:r(stub)}}stub of the daily variables{p_end}
{synopt:{cmd:r(outstub)}}{opt outstub()}{p_end}
{synopt:{cmd:r(mode)}}{cmd:calendar} or {cmd:unit}{p_end}
{synopt:{cmd:r(shape)}}{cmd:long}, {cmd:wide}, or {cmd:unit}{p_end}
{synopt:{cmd:r(window)}}window, e.g. {cmd:15may-15oct}{p_end}
{synopt:{cmd:r(years)}}window years (calendar){p_end}
{synopt:{cmd:r(ref)}}reference period, e.g. {cmd:rolling 10} or {cmd:baseline 1981-2010}{p_end}
{synopt:{cmd:r(varlist)}}variables created{p_end}

{p2col 5 24 28 2: Matrices}{p_end}
{synopt:{cmd:r(missing)}}one row per window: calendar days in the window
({cmd:days}), mean observed days ({cmd:mean_nobs}), share of observations with
any missing day ({cmd:any_missing}) and with no data ({cmd:all_missing}), and
the number below {opt minobs()} ({cmd:below_minobs}); with unit-specific
windows, one row that also gives the number of windows that run past the first
or last date of the data ({cmd:outside}; their statistics are missing unless
{opt partial} is specified) and with missing dates ({cmd:missing_dates}){p_end}
{p2colreset}{...}


{title:Authors}

{pstd}Jeffrey D. Michler (jdmichler@arizona.edu){p_end}
{pstd}Anna Josephson (aljosephson@arizona.edu){p_end}
{pstd}Oscar Barriga-Cabanillas (obarriga@worldbank.org){p_end}
{pstd}Aleksandr Michuda (amichud1@swarthmore.edu){p_end}
{pstd}Jeffrey C. Oliver (jcoliver@arizona.edu){p_end}


{title:Also see}

{psee}
Help: {helpb wxprep}
{p_end}
