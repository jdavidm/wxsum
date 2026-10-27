# Audit rerun, 26 October 2026

The sample data were renamed from `rain.dta` and `temp.dta` to `wxsum_rain.dta` and `wxsum_temp.dta`, because the old names clash with the ancillary data of David Roodman's `extreme` package (pointed out by Chris Baum). This rerun checks the package after the rename.

`run_tests_revised.py` was run on the package as it will ship: commit `e6a9bdd` (wxsum 7.0.0, wxprep 1.0.0), exported with `git archive` without `audit/`, `sj paper/`, and `.gitignore`. The run used Stata 18.5 MP on Windows 11. The runner now reads the sample data under the new names (change 8 in its header).

| Checks | Passed | Failed |
|---|---|---|
| 165 (151 Stata cases, 14 file checks) | 165 | 0 |

Among the passing checks:
- the packaging checks for `wxsum_rain.dta` and `wxsum_temp.dta`, whose names are read from `wxsum.pkg`;
- the four cases on the bundled data: `bundled_rain_dta_oracle`, `bundled_temp_dta_oracle`, and the two cross-year cases.

All 15 test suites pass (`audit/tests/run_all.do`, batch mode from `audit/tests`). Several of them read the sample data and now use the new names:
- `wxsum_v6_docs`: the 92 example commands agree in the do-file, the help files, `README.md`, and `index.html`, and they run in a `net get`-style folder;
- `wxsum_v6_install`: `net install` and `net get` deliver `wxsum_rain.dta` and `wxsum_temp.dta`, `make_example_data.do` reproduces the example datasets, and the examples run from the installed package;
- `wxsum_v6_regression`: version 5 output is reproduced from the renamed files;
- `wxsum_v6_wxprep`, `wxsum_validation`, and `wxsum_v6_performance`.

| Suite | Time (s) |
|---|---|
| `test_dryspells`, `test_finday`, `wxsum_validation`, `wxsum_gddcat_validation`, `wxsum_release_synthetic_validation`, `wxsum_tmpbin_shape_validation` | 0-1 each |
| `wxsum_v6_core`, `wxsum_v6_features`, `wxsum_v6_unit`, `wxsum_v6_regression` | 0-2 each |
| `wxsum_v6_wxprep` | 19 |
| `wxsum_v6_docs` | 45 |
| `wxsum_v6_install` | 32 |
| `wxsum_v6_equivalence` | 302 |
| `wxsum_v6_performance` | 542 (see below) |

The performance suite passed but took longer than on 23 October (123 s). All of the difference comes from one timing: the temperature configuration on 1,000 copies of the sample data took 423.5 s, while the same configuration on 10,000 copies took 34 s in the same run. When the suite was rerun on its own, that timing was 4.14 s (5.46 s on 23 October), and all bundled examples again ran in under 2 seconds. The code did not change with the rename, so the slow timing was a one-off stall of the machine.

The example log and the three example datasets were rebuilt with `audit/run_examples.do data`:
- The rebuilt datasets have the same values as the committed ones (`cf _all`).
- They differ in the note of `weather_hourly.dta`, which now names the renamed files, and in their save dates.
- The log differs only in the commands, the "Contains data from" lines, and those save dates.
