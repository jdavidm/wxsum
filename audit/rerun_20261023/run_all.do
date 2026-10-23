clear all
set more off
set maxvar 20000
set type double
set seed 20261015
adopath ++ "C:/Users/aljos/AppData/Local/Temp/claude/C--Users-aljos-git-weather-or-not-complete-replication/d8bead37-47d3-4805-ba70-5a1953e0916e/scratchpad/pkg_20261023_631"
capture log close _all
log using "C:/Users/aljos/git/wxsum/audit/rerun_20261023/stata_full.log", text replace
file open results using "C:/Users/aljos/git/wxsum/audit/rerun_20261023/stata_results.csv", write text replace
file write results "name,group,status,rc" _n
display "AUDIT_CASE_BEGIN rain_hand_calculated"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/001_rain_hand_calculated.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "rain_hand_calculated,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END rain_hand_calculated rc=" `rc'
display "AUDIT_CASE_BEGIN temp_hand_calculated"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/002_temp_hand_calculated.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "temp_hand_calculated,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END temp_hand_calculated rc=" `rc'
display "AUDIT_CASE_BEGIN minobs_and_missing_bins"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/003_minobs_and_missing_bins.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "minobs_and_missing_bins,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END minobs_and_missing_bins rc=" `rc'
display "AUDIT_CASE_BEGIN rain_singleton"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/004_rain_singleton.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "rain_singleton,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END rain_singleton rc=" `rc'
display "AUDIT_CASE_BEGIN rain_all_missing"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/005_rain_all_missing.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "rain_all_missing,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END rain_all_missing rc=" `rc'
display "AUDIT_CASE_BEGIN rain_constant"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/006_rain_constant.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "rain_constant,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END rain_constant rc=" `rc'
display "AUDIT_CASE_BEGIN rain_exhaustive_729_spell_patterns"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/007_rain_exhaustive_729_spell_patterns.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "rain_exhaustive_729_spell_patterns,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END rain_exhaustive_729_spell_patterns rc=" `rc'
display "AUDIT_CASE_BEGIN temp_exhaustive_729_spell_patterns"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/008_temp_exhaustive_729_spell_patterns.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "temp_exhaustive_729_spell_patterns,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END temp_exhaustive_729_spell_patterns rc=" `rc'
display "AUDIT_CASE_BEGIN temp_bins_1"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/009_temp_bins_1.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "temp_bins_1,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END temp_bins_1 rc=" `rc'
display "AUDIT_CASE_BEGIN temp_bins_2"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/010_temp_bins_2.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "temp_bins_2,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END temp_bins_2 rc=" `rc'
display "AUDIT_CASE_BEGIN temp_bins_4"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/011_temp_bins_4.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "temp_bins_4,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END temp_bins_4 rc=" `rc'
display "AUDIT_CASE_BEGIN temp_bins_42"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/012_temp_bins_42.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "temp_bins_42,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END temp_bins_42 rc=" `rc'
display "AUDIT_CASE_BEGIN rain_cuts_edges"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/013_rain_cuts_edges.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "rain_cuts_edges,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END rain_cuts_edges rc=" `rc'
display "AUDIT_CASE_BEGIN temp_cuts_edges"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/014_temp_cuts_edges.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "temp_cuts_edges,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END temp_cuts_edges rc=" `rc'
display "AUDIT_CASE_BEGIN kdd_separate_base"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/015_kdd_separate_base.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "kdd_separate_base,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END kdd_separate_base rc=" `rc'
display "AUDIT_CASE_BEGIN outstub_and_string_keep"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/016_outstub_and_string_keep.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "outstub_and_string_keep,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END outstub_and_string_keep rc=" `rc'
display "AUDIT_CASE_BEGIN stored_results_and_metadata"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/017_stored_results_and_metadata.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "stored_results_and_metadata,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END stored_results_and_metadata rc=" `rc'
display "AUDIT_CASE_BEGIN rollback_forced_long"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/018_rollback_forced_long.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "rollback_forced_long,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END rollback_forced_long rc=" `rc'
display "AUDIT_CASE_BEGIN rollback_forced_wide"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/019_rollback_forced_wide.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "rollback_forced_wide,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END rollback_forced_wide rc=" `rc'
display "AUDIT_CASE_BEGIN reject_type"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/020_reject_type.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_type,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_type rc=" `rc'
display "AUDIT_CASE_BEGIN reject_no_mode"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/021_reject_no_mode.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_no_mode,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_no_mode rc=" `rc'
display "AUDIT_CASE_BEGIN reject_mixed_modes"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/022_reject_mixed_modes.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_mixed_modes,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_mixed_modes rc=" `rc'
display "AUDIT_CASE_BEGIN reject_partial_calendar"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/023_reject_partial_calendar.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_partial_calendar,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_partial_calendar rc=" `rc'
display "AUDIT_CASE_BEGIN reject_bad_month"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/024_reject_bad_month.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_bad_month,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_bad_month rc=" `rc'
display "AUDIT_CASE_BEGIN reject_fractional_day"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/025_reject_fractional_day.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_fractional_day,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_fractional_day rc=" `rc'
display "AUDIT_CASE_BEGIN reject_invalid_month_day"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/026_reject_invalid_month_day.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_invalid_month_day,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_invalid_month_day rc=" `rc'
display "AUDIT_CASE_BEGIN reject_missing_heat"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/027_reject_missing_heat.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_missing_heat,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_missing_heat rc=" `rc'
display "AUDIT_CASE_BEGIN reject_missing_glo"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/028_reject_missing_glo.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_missing_glo,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_missing_glo rc=" `rc'
display "AUDIT_CASE_BEGIN reject_missing_ghi"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/029_reject_missing_ghi.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_missing_ghi,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_missing_ghi rc=" `rc'
display "AUDIT_CASE_BEGIN reject_gdd_order"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/030_reject_gdd_order.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_gdd_order,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_gdd_order rc=" `rc'
display "AUDIT_CASE_BEGIN reject_rain_temp_opt"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/031_reject_rain_temp_opt.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_rain_temp_opt,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_rain_temp_opt rc=" `rc'
display "AUDIT_CASE_BEGIN reject_temp_rain_opt"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/032_reject_temp_rain_opt.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_temp_rain_opt,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_temp_rain_opt rc=" `rc'
display "AUDIT_CASE_BEGIN reject_bin_conflict"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/033_reject_bin_conflict.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_bin_conflict,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_bin_conflict rc=" `rc'
display "AUDIT_CASE_BEGIN reject_bad_cut_order"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/034_reject_bad_cut_order.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_bad_cut_order,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_bad_cut_order rc=" `rc'
display "AUDIT_CASE_BEGIN reject_duplicate_cuts"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/035_reject_duplicate_cuts.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_duplicate_cuts,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_duplicate_cuts rc=" `rc'
display "AUDIT_CASE_BEGIN reject_ref_conflict"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/036_reject_ref_conflict.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_ref_conflict,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_ref_conflict rc=" `rc'
display "AUDIT_CASE_BEGIN reject_ref_min"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/037_reject_ref_min.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_ref_min,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_ref_min rc=" `rc'
display "AUDIT_CASE_BEGIN reject_minobs_zero"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/038_reject_minobs_zero.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_minobs_zero,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_minobs_zero rc=" `rc'
display "AUDIT_CASE_BEGIN reject_negative_rain_threshold"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/039_reject_negative_rain_threshold.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_negative_rain_threshold,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_negative_rain_threshold rc=" `rc'
display "AUDIT_CASE_BEGIN reject_bad_keep"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/040_reject_bad_keep.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_bad_keep,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_bad_keep rc=" `rc'
display "AUDIT_CASE_BEGIN reject_bad_shape"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/041_reject_bad_shape.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_bad_shape,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_bad_shape rc=" `rc'
display "AUDIT_CASE_BEGIN reject_long_stub"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/042_reject_long_stub.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_long_stub,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_long_stub rc=" `rc'
display "AUDIT_CASE_BEGIN reject_gdd_inexact_range"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/043_reject_gdd_inexact_range.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_gdd_inexact_range,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_gdd_inexact_range rc=" `rc'
display "AUDIT_CASE_BEGIN reject_gdd_too_many_categories"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/044_reject_gdd_too_many_categories.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_gdd_too_many_categories,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_gdd_too_many_categories rc=" `rc'
display "AUDIT_CASE_BEGIN reject_bin_too_many"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/045_reject_bin_too_many.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_bin_too_many,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_bin_too_many rc=" `rc'
display "AUDIT_CASE_BEGIN reject_missing_rain_threshold"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/046_reject_missing_rain_threshold.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_missing_rain_threshold,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_missing_rain_threshold rc=" `rc'
display "AUDIT_CASE_BEGIN reject_missing_gdd_lo"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/047_reject_missing_gdd_lo.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_missing_gdd_lo,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_missing_gdd_lo rc=" `rc'
display "AUDIT_CASE_BEGIN reject_missing_gdd_hi"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/048_reject_missing_gdd_hi.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_missing_gdd_hi,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_missing_gdd_hi rc=" `rc'
display "AUDIT_CASE_BEGIN reject_missing_heat_threshold"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/049_reject_missing_heat_threshold.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_missing_heat_threshold,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_missing_heat_threshold rc=" `rc'
display "AUDIT_CASE_BEGIN reject_missing_kdd_base"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/050_reject_missing_kdd_base.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_missing_kdd_base,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_missing_kdd_base rc=" `rc'
display "AUDIT_CASE_BEGIN reject_missing_tmp_binlo"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/051_reject_missing_tmp_binlo.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "reject_missing_tmp_binlo,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END reject_missing_tmp_binlo rc=" `rc'
display "AUDIT_CASE_BEGIN name_clash_rollback"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/052_name_clash_rollback.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "name_clash_rollback,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END name_clash_rollback rc=" `rc'
display "AUDIT_CASE_BEGIN year_clash"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/053_year_clash.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "year_clash,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END year_clash rc=" `rc'
display "AUDIT_CASE_BEGIN gdd_categories_edges"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/054_gdd_categories_edges.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "gdd_categories_edges,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END gdd_categories_edges rc=" `rc'
display "AUDIT_CASE_BEGIN save_success_and_overwrite"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/055_save_success_and_overwrite.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "save_success_and_overwrite,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END save_success_and_overwrite rc=" `rc'
display "AUDIT_CASE_BEGIN prep_fill"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/056_prep_fill.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_fill,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_fill rc=" `rc'
display "AUDIT_CASE_BEGIN prep_nofill"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/057_prep_nofill.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_nofill,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_nofill rc=" `rc'
display "AUDIT_CASE_BEGIN prep_date_daily"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/058_prep_date_daily.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_date_daily,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_date_daily rc=" `rc'
display "AUDIT_CASE_BEGIN prep_date_datetime"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/059_prep_date_datetime.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_date_datetime,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_date_datetime rc=" `rc'
display "AUDIT_CASE_BEGIN prep_date_leap_datetime"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/060_prep_date_leap_datetime.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_date_leap_datetime,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_date_leap_datetime rc=" `rc'
display "AUDIT_CASE_BEGIN prep_date_integer"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/061_prep_date_integer.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_date_integer,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_date_integer rc=" `rc'
display "AUDIT_CASE_BEGIN prep_date_string"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/062_prep_date_string.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_date_string,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_date_string rc=" `rc'
display "AUDIT_CASE_BEGIN prep_daily_mean"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/063_prep_daily_mean.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_daily_mean,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_daily_mean rc=" `rc'
display "AUDIT_CASE_BEGIN prep_daily_sum"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/064_prep_daily_sum.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_daily_sum,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_daily_sum rc=" `rc'
display "AUDIT_CASE_BEGIN prep_daily_min"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/065_prep_daily_min.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_daily_min,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_daily_min rc=" `rc'
display "AUDIT_CASE_BEGIN prep_daily_max"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/066_prep_daily_max.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_daily_max,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_daily_max rc=" `rc'
display "AUDIT_CASE_BEGIN prep_reject_duplicate"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/067_prep_reject_duplicate.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_reject_duplicate,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_reject_duplicate rc=" `rc'
display "AUDIT_CASE_BEGIN prep_reject_changed"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/068_prep_reject_changed.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_reject_changed,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_reject_changed rc=" `rc'
display "AUDIT_CASE_BEGIN prep_reject_missing_id"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/069_prep_reject_missing_id.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_reject_missing_id,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_reject_missing_id rc=" `rc'
display "AUDIT_CASE_BEGIN prep_reject_invalid_date"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/070_prep_reject_invalid_date.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_reject_invalid_date,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_reject_invalid_date rc=" `rc'
display "AUDIT_CASE_BEGIN prep_reject_bad_stub"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/071_prep_reject_bad_stub.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_reject_bad_stub,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_reject_bad_stub rc=" `rc'
display "AUDIT_CASE_BEGIN prep_reject_value_in_id"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/072_prep_reject_value_in_id.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_reject_value_in_id,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_reject_value_in_id rc=" `rc'
display "AUDIT_CASE_BEGIN prep_reject_empty_selection"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/073_prep_reject_empty_selection.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_reject_empty_selection,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_reject_empty_selection rc=" `rc'
display "AUDIT_CASE_BEGIN prep_if_in"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/074_prep_if_in.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_if_in,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_if_in rc=" `rc'
display "AUDIT_CASE_BEGIN prep_date_also_value"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/075_prep_date_also_value.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_date_also_value,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_date_also_value rc=" `rc'
display "AUDIT_CASE_BEGIN prep_roundtrip_exact"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/076_prep_roundtrip_exact.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_roundtrip_exact,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_roundtrip_exact rc=" `rc'
display "AUDIT_CASE_BEGIN prep_single_day_roundtrip"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/077_prep_single_day_roundtrip.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_single_day_roundtrip,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_single_day_roundtrip rc=" `rc'
display "AUDIT_CASE_BEGIN prep_multi_id"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/078_prep_multi_id.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_multi_id,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_multi_id rc=" `rc'
display "AUDIT_CASE_BEGIN prep_rename_consecutive"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/079_prep_rename_consecutive.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_rename_consecutive,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_rename_consecutive rc=" `rc'
display "AUDIT_CASE_BEGIN prep_rename_parsed_gap"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/080_prep_rename_parsed_gap.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_rename_parsed_gap,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_rename_parsed_gap rc=" `rc'
display "AUDIT_CASE_BEGIN prep_rename_reject_clash"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/081_prep_rename_reject_clash.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_rename_reject_clash,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_rename_reject_clash rc=" `rc'
display "AUDIT_CASE_BEGIN prep_rename_reject_invalid"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/082_prep_rename_reject_invalid.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_rename_reject_invalid,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_rename_reject_invalid rc=" `rc'
display "AUDIT_CASE_BEGIN prep_rename_reject_duplicate"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/083_prep_rename_reject_duplicate.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_rename_reject_duplicate,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_rename_reject_duplicate rc=" `rc'
display "AUDIT_CASE_BEGIN prep_tolong_duplicate_id"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/084_prep_tolong_duplicate_id.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_tolong_duplicate_id,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_tolong_duplicate_id rc=" `rc'
display "AUDIT_CASE_BEGIN prep_tolong_name_conflict"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/085_prep_tolong_name_conflict.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_tolong_name_conflict,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_tolong_name_conflict rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_january_rolling_long"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/086_oracle_rain_january_rolling_long.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_january_rolling_long,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_january_rolling_long rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_january_rolling_wide"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/087_oracle_rain_january_rolling_wide.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_january_rolling_wide,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_january_rolling_wide rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_january_baseline_long"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/088_oracle_rain_january_baseline_long.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_january_baseline_long,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_january_baseline_long rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_january_baseline_wide"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/089_oracle_rain_january_baseline_wide.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_january_baseline_wide,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_january_baseline_wide rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_cross_year_rolling_long"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/090_oracle_rain_cross_year_rolling_long.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_cross_year_rolling_long,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_cross_year_rolling_long rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_cross_year_rolling_wide"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/091_oracle_rain_cross_year_rolling_wide.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_cross_year_rolling_wide,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_cross_year_rolling_wide rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_cross_year_baseline_long"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/092_oracle_rain_cross_year_baseline_long.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_cross_year_baseline_long,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_cross_year_baseline_long rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_cross_year_baseline_wide"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/093_oracle_rain_cross_year_baseline_wide.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_cross_year_baseline_wide,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_cross_year_baseline_wide rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_leap_day_rolling_long"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/094_oracle_rain_leap_day_rolling_long.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_leap_day_rolling_long,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_leap_day_rolling_long rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_leap_day_rolling_wide"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/095_oracle_rain_leap_day_rolling_wide.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_leap_day_rolling_wide,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_leap_day_rolling_wide rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_leap_day_baseline_long"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/096_oracle_rain_leap_day_baseline_long.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_leap_day_baseline_long,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_leap_day_baseline_long rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_leap_day_baseline_wide"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/097_oracle_rain_leap_day_baseline_wide.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_leap_day_baseline_wide,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_leap_day_baseline_wide rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_unit_rolling_strict"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/098_oracle_rain_unit_rolling_strict.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_unit_rolling_strict,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_unit_rolling_strict rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_unit_baseline_strict"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/099_oracle_rain_unit_baseline_strict.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_unit_baseline_strict,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_unit_baseline_strict rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_unit_rolling_partial"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/100_oracle_rain_unit_rolling_partial.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_unit_rolling_partial,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_unit_rolling_partial rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_unit_baseline_partial"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/101_oracle_rain_unit_baseline_partial.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_unit_baseline_partial,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_unit_baseline_partial rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_event_lag_-2"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/102_oracle_rain_event_lag_-2.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_event_lag_-2,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_event_lag_-2 rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_event_lag_0"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/103_oracle_rain_event_lag_0.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_event_lag_0,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_event_lag_0 rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_rain_event_lag_3"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/104_oracle_rain_event_lag_3.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_rain_event_lag_3,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_rain_event_lag_3 rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_january_rolling_long"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/105_oracle_temp_january_rolling_long.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_january_rolling_long,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_january_rolling_long rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_january_rolling_wide"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/106_oracle_temp_january_rolling_wide.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_january_rolling_wide,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_january_rolling_wide rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_january_baseline_long"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/107_oracle_temp_january_baseline_long.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_january_baseline_long,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_january_baseline_long rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_january_baseline_wide"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/108_oracle_temp_january_baseline_wide.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_january_baseline_wide,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_january_baseline_wide rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_cross_year_rolling_long"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/109_oracle_temp_cross_year_rolling_long.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_cross_year_rolling_long,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_cross_year_rolling_long rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_cross_year_rolling_wide"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/110_oracle_temp_cross_year_rolling_wide.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_cross_year_rolling_wide,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_cross_year_rolling_wide rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_cross_year_baseline_long"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/111_oracle_temp_cross_year_baseline_long.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_cross_year_baseline_long,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_cross_year_baseline_long rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_cross_year_baseline_wide"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/112_oracle_temp_cross_year_baseline_wide.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_cross_year_baseline_wide,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_cross_year_baseline_wide rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_leap_day_rolling_long"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/113_oracle_temp_leap_day_rolling_long.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_leap_day_rolling_long,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_leap_day_rolling_long rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_leap_day_rolling_wide"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/114_oracle_temp_leap_day_rolling_wide.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_leap_day_rolling_wide,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_leap_day_rolling_wide rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_leap_day_baseline_long"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/115_oracle_temp_leap_day_baseline_long.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_leap_day_baseline_long,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_leap_day_baseline_long rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_leap_day_baseline_wide"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/116_oracle_temp_leap_day_baseline_wide.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_leap_day_baseline_wide,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_leap_day_baseline_wide rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_unit_rolling_strict"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/117_oracle_temp_unit_rolling_strict.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_unit_rolling_strict,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_unit_rolling_strict rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_unit_baseline_strict"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/118_oracle_temp_unit_baseline_strict.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_unit_baseline_strict,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_unit_baseline_strict rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_unit_rolling_partial"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/119_oracle_temp_unit_rolling_partial.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_unit_rolling_partial,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_unit_rolling_partial rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_unit_baseline_partial"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/120_oracle_temp_unit_baseline_partial.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_unit_baseline_partial,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_unit_baseline_partial rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_event_lag_-2"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/121_oracle_temp_event_lag_-2.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_event_lag_-2,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_event_lag_-2 rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_event_lag_0"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/122_oracle_temp_event_lag_0.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_event_lag_0,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_event_lag_0 rc=" `rc'
display "AUDIT_CASE_BEGIN oracle_temp_event_lag_3"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/123_oracle_temp_event_lag_3.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "oracle_temp_event_lag_3,oracle,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END oracle_temp_event_lag_3 rc=" `rc'
display "AUDIT_CASE_BEGIN save_failure_atomic_wxsum"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/124_save_failure_atomic_wxsum.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "save_failure_atomic_wxsum,io,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END save_failure_atomic_wxsum rc=" `rc'
display "AUDIT_CASE_BEGIN save_failure_atomic_prep_tolong"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/125_save_failure_atomic_prep_tolong.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "save_failure_atomic_prep_tolong,io,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END save_failure_atomic_prep_tolong rc=" `rc'
display "AUDIT_CASE_BEGIN save_failure_atomic_prep_towide"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/126_save_failure_atomic_prep_towide.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "save_failure_atomic_prep_towide,io,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END save_failure_atomic_prep_towide rc=" `rc'
display "AUDIT_CASE_BEGIN documented_longest_heat_formula"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/127_documented_longest_heat_formula.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "documented_longest_heat_formula,documentation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END documented_longest_heat_formula rc=" `rc'
display "AUDIT_CASE_BEGIN prep_early_year_eight_digit_names"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/128_prep_early_year_eight_digit_names.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_early_year_eight_digit_names,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_early_year_eight_digit_names rc=" `rc'
display "AUDIT_CASE_BEGIN prep_rename_early_year"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/129_prep_rename_early_year.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "prep_rename_early_year,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END prep_rename_early_year rc=" `rc'
display "AUDIT_CASE_BEGIN default_ref_min_strict"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/130_default_ref_min_strict.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "default_ref_min_strict,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END default_ref_min_strict rc=" `rc'
display "AUDIT_CASE_BEGIN relaxed_ref_min"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/131_relaxed_ref_min.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "relaxed_ref_min,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END relaxed_ref_min rc=" `rc'
display "AUDIT_CASE_BEGIN calendar_interior_year_no_daily_variables"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/132_calendar_interior_year_no_daily_variables.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "calendar_interior_year_no_daily_variables,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END calendar_interior_year_no_daily_variables rc=" `rc'
display "AUDIT_CASE_BEGIN february_last_day_2019"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/133_february_last_day_2019.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "february_last_day_2019,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END february_last_day_2019 rc=" `rc'
display "AUDIT_CASE_BEGIN february_last_day_2020"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/134_february_last_day_2020.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "february_last_day_2020,behavior,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END february_last_day_2020 rc=" `rc'
display "AUDIT_CASE_BEGIN unit_reject_reversed"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/135_unit_reject_reversed.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "unit_reject_reversed,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END unit_reject_reversed rc=" `rc'
display "AUDIT_CASE_BEGIN unit_reject_fractional"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/136_unit_reject_fractional.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "unit_reject_fractional,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END unit_reject_fractional rc=" `rc'
display "AUDIT_CASE_BEGIN unit_reject_datetime"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/137_unit_reject_datetime.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "unit_reject_datetime,validation,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END unit_reject_datetime rc=" `rc'
display "AUDIT_CASE_BEGIN maxvar_wxsum"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/138_maxvar_wxsum.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "maxvar_wxsum,capacity,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END maxvar_wxsum rc=" `rc'
display "AUDIT_CASE_BEGIN maxvar_wxprep"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/139_maxvar_wxprep.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "maxvar_wxprep,capacity,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END maxvar_wxprep rc=" `rc'
display "AUDIT_CASE_BEGIN kelvin_transform_roundtrip"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/140_kelvin_transform_roundtrip.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "kelvin_transform_roundtrip,integration,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END kelvin_transform_roundtrip rc=" `rc'
display "AUDIT_CASE_BEGIN merge_and_analysis"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/141_merge_and_analysis.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "merge_and_analysis,integration,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END merge_and_analysis rc=" `rc'
display "AUDIT_CASE_BEGIN bundled_rain_dta_oracle"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/142_bundled_rain_dta_oracle.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "bundled_rain_dta_oracle,bundled,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END bundled_rain_dta_oracle rc=" `rc'
display "AUDIT_CASE_BEGIN bundled_rain_sample_cross_year"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/143_bundled_rain_sample_cross_year.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "bundled_rain_sample_cross_year,bundled,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END bundled_rain_sample_cross_year rc=" `rc'
display "AUDIT_CASE_BEGIN performance_rain_1000"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/144_performance_rain_1000.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "performance_rain_1000,performance,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END performance_rain_1000 rc=" `rc'
display "AUDIT_CASE_BEGIN performance_rain_10000"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/145_performance_rain_10000.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "performance_rain_10000,performance,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END performance_rain_10000 rc=" `rc'
display "AUDIT_CASE_BEGIN bundled_temp_dta_oracle"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/146_bundled_temp_dta_oracle.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "bundled_temp_dta_oracle,bundled,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END bundled_temp_dta_oracle rc=" `rc'
display "AUDIT_CASE_BEGIN bundled_temp_sample_cross_year"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/147_bundled_temp_sample_cross_year.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "bundled_temp_sample_cross_year,bundled,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END bundled_temp_sample_cross_year rc=" `rc'
display "AUDIT_CASE_BEGIN performance_temp_1000"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/148_performance_temp_1000.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "performance_temp_1000,performance,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END performance_temp_1000 rc=" `rc'
display "AUDIT_CASE_BEGIN performance_temp_10000"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/149_performance_temp_10000.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "performance_temp_10000,performance,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END performance_temp_10000 rc=" `rc'
display "AUDIT_CASE_BEGIN chunk_boundary_calendar_12000x366"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/150_chunk_boundary_calendar_12000x366.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "chunk_boundary_calendar_12000x366,performance,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END chunk_boundary_calendar_12000x366 rc=" `rc'
display "AUDIT_CASE_BEGIN chunk_boundary_unit_12000x366"
capture noisily do "C:/Users/aljos/git/wxsum/audit/rerun_20261023/cases/151_chunk_boundary_unit_12000x366.do"
local rc = _rc
local status = cond(`rc'==0,"PASS","FAIL")
file write results "chunk_boundary_unit_12000x366,performance,`status',`rc'" _n
global WXSUM_TEST_FAIL
display "AUDIT_CASE_END chunk_boundary_unit_12000x366 rc=" `rc'
file close results
display "AUDIT_FINISHED"
log close
exit, clear
