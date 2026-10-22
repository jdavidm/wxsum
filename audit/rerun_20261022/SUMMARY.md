# Audit rerun, 22 October 2026

`run_tests_revised.py` was run on the package as it will ship: commit `50725b1` (wxsum 6.3.1, wxprep 1.0.0) exported with `git archive`, without `audit/`, `sj paper/`, `rain.csv`, `temp.csv`, and `.gitignore`. Stata 18.5 MP on Windows 11.

| Checks | Passed | Failed |
|---|---|---|
| 165 (151 Stata cases, 14 file checks) | 165 | 0 |

wxsum 6.3.1 fixes three floating-point edge cases found while checking the formulas of the revised article against the code:

| Fix | Before (6.3.0) |
|---|---|
| The last interior `tmp_bin()` bin ends at `tmp_binhi()` itself | Its edge was `lo + (J-2)*w`, which can differ from `tmp_binhi()` in the last bit: with `tmp_bin(7) tmp_binlo(-10) tmp_binhi(-4.7)`, a day at -4.7 was counted in two bins; with `tmp_bin(21) tmp_binlo(-5) tmp_binhi(-1.8)`, a day at the computed edge was counted in none |
| The last regular `gdd_bin()` category ends at `gdd_binhi()` itself | With `gdd_bin(0.3) gdd_binhi(0.9)`, a GDD total just below 0.9 had no category |
| Equal reference values have that value as their mean | Ten reference values of 0.3 do not add up to exactly 3, which gave a tiny positive sd and a z-score of about 1e15 instead of a missing one |

The new tests 1.21-1.23 in `audit/tests/wxsum_v6_core.do` fail on 6.3.0 and pass on 6.3.1, and all 15 suites pass. All audit cases pass, as they did on 21 October. The example log differs from 6.3.0 only in the version stamp.
