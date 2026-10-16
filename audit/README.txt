WXSum / WXPrep audit — 15 October 2026

Open audit_report.html for the complete assessment. audit_report.txt contains the same prose and tables in plain text.

python run_tests.py --source "C:\Users\annal\Downloads\wxsum" --stata "C:\Program Files\StataNow19\StataMP-64.exe"

Python 3.10+ standard library and licensed Stata required; no network or package installation.

Results: 159 Stata cases, 150 pass / 9 fail. Separate file checks: 15 checks, 6 pass / 9 fail.
The failures intentionally remain failing tests for the defects documented in the report.
No source files were modified. The reviewed source folder is not included in this bundle.

run_tests.py regenerates fixtures and scripts for the supplied source and chosen output path.
verified_results/run_all.do is ready to run directly at its original generated path.
verified_results/stata_full.log is the complete run log.
verified_results/results.csv and results.json are machine-readable results.
verified_results/failure_excerpts.txt contains compact failure evidence.
verified_results/source_inventory.json records SHA-256 hashes of all 33 source files.
requirements_matrix.csv maps every editor/reviewer request to findings.
findings.json records the six principal findings.

Exit code 1 means at least one check failed; exit code 0 requires a completed all-pass run.
Use --results NEW_DIRECTORY to preserve the delivered run when rerunning.
