# Audit rerun, 20 October 2026

Both audit runners were run on the package as it will be submitted: commit `98759eb` (wxsum 6.3.0, wxprep 1.0.0) exported with `git archive`, without the `audit/` folder. Stata 18.5 MP on Windows 11.

| Runner | Checks | Passed | Failed |
|---|---|---|---|
| `original/`: the auditor's `run_tests.py`, unchanged | 174 | 129 | 45 |
| `revised/`: `run_tests_revised.py` | 173 | 170 | 3 |

`run_tests_revised.py` differs from the auditor's runner in four ways, each following a decision made after the audit (see its header): the B3 mid-window spell rule; no check for `tests/run_all.do`; deviations and z-scores only for the mid-window spells; and the expected `_dta[wxsum_version]` read from the `*!` line of `wxsum.ado` instead of the fixed "6.0.0".

## Findings

B1, B2, and B3 stay fixed: `save_failure_atomic_wxsum`, `save_failure_atomic_prep_tolong`, `save_failure_atomic_prep_towide`, `prep_early_year_eight_digit_names`, `prep_rename_early_year`, and `documented_longest_heat_formula` pass with both runners. All 12 files in `wxsum.pkg` are present. The only failures with the revised runner are manuscript examples 2, 3, and 4 (B4), which omit `heat_threshold()` and wait for the revised article.

## The 45 failures with the auditor's runner

| Failures | Cause |
|---|---|
| 37 oracle cases | Stop at `dev_dry_start` or `dev_heat_start` (r(111)): deviations and z-scores of the leading and trailing spells were dropped on 20 October |
| 3 (`rain_exhaustive_729_spell_patterns`, `temp_exhaustive_729_spell_patterns`, `oracle_temp_event_lag_-2`) | Expected mid-window spells follow the rule before B3 |
| `stored_results_and_metadata` | Expects the version stamp "6.0.0"; the version is now 6.3.0 |
| `manuscript_example_2`, `_3`, `_4` | B4: the article's temperature examples omit `heat_threshold()` |
| `documented_file:tests/run_all.do` | The tests are kept in `audit/tests`, outside the package |

With the revised runner all of these pass except the three manuscript examples, so every other statistic in these cases agrees with the auditor's independently computed values.
