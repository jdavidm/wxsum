# Audit rerun, 2 November 2026

`run_tests_revised.py` was run on the package as it will ship: commit `1fb8e9b` (wxsum 7.0.0, wxprep 1.0.0), exported with `git archive` without `audit/`, `sj paper/`, and `.gitignore`. The run used Stata 18.5 MP on Windows 11. The package files are the same as on 26 October; the commits since then changed only `sj paper/`.

| Checks | Passed | Failed |
|---|---|---|
| 165 (151 Stata cases, 14 file checks) | 165 | 0 |

All 15 test suites pass (`audit/tests/run_all.do`, batch mode from `audit/tests`):

| Suite | Time (s) |
|---|---|
| `test_dryspells`, `test_finday`, `wxsum_validation`, `wxsum_gddcat_validation`, `wxsum_release_synthetic_validation`, `wxsum_tmpbin_shape_validation` | 0-1 each |
| `wxsum_v6_core`, `wxsum_v6_features`, `wxsum_v6_unit`, `wxsum_v6_regression` | 0-2 each |
| `wxsum_v6_wxprep` | 14 |
| `wxsum_v6_docs` (the 92 example commands agree in the do-file, help files, README, and index.html, and they run) | 41 |
| `wxsum_v6_install` (`net install` and `net get` from the repository; `make_example_data.do` reproduces the example datasets; the examples run from the installed package) | 31 |
| `wxsum_v6_equivalence` | 274 |
| `wxsum_v6_performance` (every bundled example in under 2 s) | 116 |

After the run, example 5 was changed to list `year > 2018`, so that the output shown in section 5.4 of the article comes from the log. The log was rebuilt with `audit/run_examples.do`; it changes only in that command and in the three rows it no longer lists (2016-2018). `wxsum_v6_docs` and `wxsum_v6_install` were then rerun and pass.

The check of the response letters against the article, and of the files for the resubmission, is in `audit/response_check_20261102.md`.
