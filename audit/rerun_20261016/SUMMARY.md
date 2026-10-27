# Audit rerun, 16 October 2026

Both audit runners were run on the package as it will be submitted: commit `a7f2e2f` exported with `git archive`, without the `audit/` folder (39 files; hashes in `*/source_inventory.json`). Stata 18.5 MP on Windows 11; the audit itself used StataNow 19.5.

| Runner | Checks | Passed | Failed |
|---|---|---|---|
| `original/`: the auditor's `run_tests.py`, unchanged | 174 | 149 | 25 |
| `revised/`: `run_tests_revised.py` | 173 | 170 | 3 |

`run_tests_revised.py` differs from the auditor's runner in two ways only (see its header): the expected spells follow the revised mid-window rule (finding B3), and there is no check for `tests/run_all.do`.

## Findings

| Finding | Result |
|---|---|
| B1: a failed `save()` replaced the data in memory | Fixed. `save_failure_atomic_wxsum`, `save_failure_atomic_prep_tolong`, and `save_failure_atomic_prep_towide` pass. |
| B2: years before 1000 lost their leading zero in `wxprep` names | Fixed. `prep_early_year_eight_digit_names` and `prep_rename_early_year` pass. |
| B3: `max(heat_start, heat, heat_end)` could understate the longest heat spell | Fixed. `documented_longest_heat_formula` passes: with ≥ 2 break days, the mid-window spell is now the longest run other than the leading and trailing spells. |
| B4: the manuscript describes version 5 | Open (the manuscript is being revised separately). Manuscript examples 2, 3, and 4 fail with r(198) because they omit `heat_threshold()`; examples 1, 5, and 6 pass. |
| B5: files listed by the package were missing | Fixed. All 12 files in `wxsum.pkg` and the documented `examples/wxsum_examples.do` and `.log` are present. The original runner's check for `tests/run_all.do` fails by design: the tests are kept in `audit/tests`, outside the package, and the README no longer refers to them. |

## The other 21 failures in the original runner

These come from the revised spell rule (B3). The auditor's oracle uses the earlier rule, and each of these cases stops at an assertion on a mid-window spell or its deviation:

| Case | First failing variable |
|---|---|
| `rain_exhaustive_729_spell_patterns` | `dry` |
| `temp_exhaustive_729_spell_patterns` | `heat` |
| `oracle_rain_january_rolling_long`, `oracle_rain_january_baseline_long`, `oracle_rain_cross_year_rolling_long` | `dry` |
| `oracle_rain_january_rolling_wide`, `oracle_rain_january_baseline_wide` | `dry_2004` |
| `oracle_rain_cross_year_rolling_wide` | `dry_2002` |
| `oracle_rain_cross_year_baseline_long` | `dev_dry` |
| `oracle_rain_cross_year_baseline_wide` | `dev_dry_2000` |
| `oracle_temp_january_rolling_long`, `oracle_temp_january_baseline_long`, `oracle_temp_cross_year_rolling_long`, `oracle_temp_event_lag_-2` | `heat` |
| `oracle_temp_january_rolling_wide`, `oracle_temp_january_baseline_wide` | `heat_2004` |
| `oracle_temp_cross_year_rolling_wide` | `heat_2001` |
| `oracle_temp_cross_year_baseline_long`, `oracle_temp_unit_rolling_partial`, `oracle_temp_unit_baseline_partial` | `dev_heat` |
| `oracle_temp_cross_year_baseline_wide` | `dev_heat_2000` |

With the revised spell oracle, the only change in `run_tests_revised.py` that affects these cases, all 21 pass. So every other statistic they check (totals, means, medians, variances, GDD, KDD, bins, deviations, and z-scores) agrees with the auditor's independently computed values.

## Files

`original/` and `revised/` hold each runner's generated cases, `results.csv`, `results.json`, and the source inventory. The Stata logs (`stata_full.log`, `run_all.log`) are written there too but are not committed (`*.log` is ignored).
