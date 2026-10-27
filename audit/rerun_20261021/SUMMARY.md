# Audit rerun, 21 October 2026

`run_tests_revised.py` was run on the package as it will ship: commit `84e8f1b` (wxsum 6.3.0, wxprep 1.0.0) exported with `git archive`, without `audit/`, `sj paper/`, `rain.csv`, `temp.csv`, and `.gitignore`. The export held only the files in `wxsum.pkg`, `stata.toc`, `README.md`, and `index.html`. Stata 18.5 MP on Windows 11.

| Checks | Passed | Failed |
|---|---|---|
| 165 (151 Stata cases, 14 file checks) | 165 | 0 |

The runner now checks only the code and the data shipped with it (changes 5 to 7 in its header):

| Change | Cases |
|---|---|
| The full datasets are not in the package | `bundled_rain_full_cross_year` and `bundled_temp_full_cross_year` dropped; the cross-year cases on `rain.dta` and `temp.dta` are kept |
| The CSV files belong to wxsumR | `bundled_rain_csv_oracle` and `bundled_temp_csv_oracle` replaced by `bundled_rain_dta_oracle` and `bundled_temp_dta_oracle`, which read the daily values from `rain.dta` and `temp.dta` with a reader for the `.dta` format written in Python |
| The manuscript is not in the package | `manuscript_example_1` to `_6` dropped |

The two `.dta` oracle cases cover all 10 households in each file and make 2,942 assertions each, the same as the CSV cases they replace. Before the rerun, the `.dta` reader was checked against Stata: the row totals of `rf_*` and `tmp_*` agree for every household to 10 decimals. On a test file, the largest non-missing byte, int, long, float, and double values were read as numbers, the missing values `.`, `.a`, `.b`, and `.z` as missing, and str5 and strL variables were skipped.

The auditor's `run_tests.py` was not rerun: it reads the CSV files, the full datasets, and the manuscript, and none of these are in the package.
