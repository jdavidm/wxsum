# Audit rerun, 23 October 2026

`run_tests_revised.py` was run on the package as it will ship: commit `8a4feea` (wxsum 6.3.1, wxprep 1.0.0, with the penultimate draft of the article), exported with `git archive` without `audit/`, `sj paper/`, and `.gitignore`. The export held the files listed in `wxsum.pkg` plus `stata.toc`, `README.md`, and `index.html`. The run used Stata 18.5 MP on Windows 11.

| Checks | Passed | Failed |
|---|---|---|
| 165 (151 Stata cases, 14 file checks) | 165 | 0 |

The runner reports the source folder as unchanged. The checks by group:

| Group | Checks | Passed |
|---|---|---|
| behavior | 51 | 51 |
| validation | 42 | 42 |
| oracle (expected values computed in Python from the rules and from `rain.dta` and `temp.dta`) | 40 | 40 |
| packaging | 14 | 14 |
| performance | 6 | 6 |
| bundled data | 4 | 4 |
| input and output | 3 | 3 |
| capacity | 2 | 2 |
| integration | 2 | 2 |
| documentation | 1 | 1 |

All 15 test suites pass (`audit/tests/run_all.do`, batch mode from `audit/tests`; times rounded to whole seconds by Stata's clock):

| Suite | Result | Time (s) |
|---|---|---|
| `test_dryspells`, `test_finday`, `wxsum_validation`, `wxsum_gddcat_validation`, `wxsum_release_synthetic_validation`, `wxsum_tmpbin_shape_validation` | pass | 0 each |
| `wxsum_v6_core` | pass | 3 |
| `wxsum_v6_features` | pass | 0 |
| `wxsum_v6_unit` | pass | 1 |
| `wxsum_v6_wxprep` | pass | 19 |
| `wxsum_v6_docs` (the 92 example commands agree in the do-file, both help files, `README.md`, and `index.html`, and they run) | pass | 51 |
| `wxsum_v6_regression` (version 5 output reproduced where the rules did not change) | pass | 2 |
| `wxsum_v6_equivalence` (the Mata engine against the reference implementation on random data, to 1e-10) | pass | 329 |
| `wxsum_v6_performance` (bundled data in 0.13-0.18 s for 10 observations; all bundled examples in under 2 s) | pass | 146 |
| `wxsum_v6_install` (`net install` and `net get` from the repository, the help files, `make_example_data.do` reproduces the example datasets, and the examples run from the installed package) | pass | 38 |

What changed since the rerun of 22 October (commit `50725b1`):
- The ado-files did not change.
- The shipped package changed in its examples: the reformatted `wxsum_examples.do` and `make_example_data.do`, example 5 with a 20-year baseline (2003-2022), the rebuilt log, and the commands copied into `wxsum.sthlp`, `README.md`, and `index.html`.
- Your edits to `wxsum.sthlp` (22 October) are also new.
- `rain.csv` and `temp.csv` were removed; they were never part of the package.

All audit cases pass, as on 21 and 22 October.

The review of the text files (article, letters, help files, README) is in `audit/review_20261023.md`.
