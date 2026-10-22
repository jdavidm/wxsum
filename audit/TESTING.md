# Testing wxsum and wxprep

Everything used to test the package lives in this folder, which is not part of the distributed package. Run the Stata files from the repository root, or start Stata batch runs inside this folder so that batch logs stay here.

| Path | What it is |
|---|---|
| `README.txt`, `audit_report.*`, `findings.json`, `requirements_matrix.csv`, `run_tests.py`, `verified_results/` | The external audit of 15 October 2026, as delivered. `run_tests.py` is the auditor's runner, unchanged. It reads `rain.csv`, `temp.csv`, `rain_full.dta`, `temp_full.dta`, and the manuscript, none of which ship with the package, so it no longer runs on the package. |
| `run_tests_revised.py` | The audit runner to use. It is the auditor's runner with seven changes, described at its top: the revised mid-window spell rule (finding B3); no check for `tests/run_all.do` (the tests are kept out of the package); deviations only for the mid-window spells; the expected version stamp read from `wxsum.ado`; no cases on `rain_full.dta` and `temp_full.dta`; the bundled-data oracle read from `rain.dta` and `temp.dta` instead of the CSV files; and no manuscript examples. It needs only the code and data in the package. |
| `rerun_20261016/`, `rerun_20261020/`, `rerun_20261021/`, `rerun_20261022/` | Reruns on the package as it will be submitted (the repository without `audit/`; from 21 October also without `sj paper/`, `rain.csv`, and `temp.csv`). The first two also ran the auditor's runner. |
| `tests/run_all.do` | Runs the 15 test suites: `do audit/tests/run_all.do` from the root, or batch mode from `audit/tests`. |
| `tests/reference/` | Frozen version 5 output on the sample data (`v5_*.dta`, made by `make_v5_reference.do` with `wxsum_v5.ado`) and the independent reference implementation `wxsum_ref.ado` used by the equivalence suite. |
| `run_examples.do` | Rebuilds `examples/wxsum_examples.log` (and, with the argument `data`, the example datasets) in a folder laid out like the one `net get wxsum` creates. |
| `sync_docs.py` | Copies the twelve examples of `examples/wxsum_examples.do` into `wxsum.sthlp` (1-9), `wxprep.sthlp` (10-12), and `README.md`, and rebuilds `index.html` from `README.md`: `python audit/sync_docs.py` from the root after changing the examples or the README. |

To rerun the audit, export the package to an empty folder and point the runner at it (Python 3 standard library and a licensed Stata; the runner never changes the folder it audits):

```bash
git archive HEAD -- . ':!audit' | tar -x -C <empty folder>
python audit/run_tests_revised.py --source <empty folder> --stata "<path to StataMP-64.exe>" --results audit/rerun_<date>
```

The test suites:

| Suite | Checks |
|---|---|
| `test_dryspells`, `test_finday`, `wxsum_validation`, `wxsum_gddcat_validation`, `wxsum_release_synthetic_validation`, `wxsum_tmpbin_shape_validation` | Hand-computed cases carried over from version 5, updated for version 6 |
| `wxsum_v6_core` | Missing days, spells (including audit B3), windows, calendar options, failed `save()` (audit B1), long `keep()` lists, days on the edges of `tmp_bin()` bins and GDD totals just below `gdd_binhi()`, z-scores for equal reference values |
| `wxsum_v6_features` | Heat spells, `cuts()`, `baseline()`, `minobs()`, stored results, labels, characteristics, rollback on failure |
| `wxsum_v6_unit` | Unit-specific windows: `start()`/`end()`, `event_date()`/`days()`/`lag()`, `partial`, references |
| `wxsum_v6_wxprep` | `towide`, `rename`, `tolong`: dates, `daily()`, round trips, storage types, failed `save()` (B1), years before 1000 (B2) |
| `wxsum_v6_docs` | The example commands in `wxsum_examples.do`, the two help files, `README.md`, and `index.html` are the same, in the same order; the README and help-file commands run in a `net get` style folder |
| `wxsum_v6_regression` | Version 6 against frozen version 5 output where the rules did not change |
| `wxsum_v6_equivalence` | The Mata engine against `wxsum_ref.ado` on random data with missing days (1e-10) |
| `wxsum_v6_performance` | Run times on the sample data and scaled copies |
| `wxsum_v6_install` | `net install` and `net get` from the repository, the help files, that `make_example_data.do` reproduces the example datasets, and the example do-file in the `net get` folder |
