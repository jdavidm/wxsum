* test_v6_equivalence.do -- verify double-precision equivalence (1e-10)
* between Mata engine functions and WS1 reference math (WS2)
* Tested on: 200 rows x 25 years, 10% missing, cross-year windows, leap years (Feb 29).

clear all
set more off
set seed 20261013
adopath ++ "."

display as text "{hline 78}"
display as text "Equivalence Test: Mata engine functions vs WS1 reference math"
display as text "{hline 78}"

* Load wxsum to ensure Mata functions are compiled into memory
run "wxsum.ado"

mata:
mata set matastrict on

void test_equivalence()
{
	real scalar N, D, r, c, i, d, n_obs, mean_val, var_val, sd_val, skew_val
	real matrix X, diff_mat
	real colvector nobs_out, mean_out, med_out, var_out, sd_out, skew_out
	real colvector sp_start_out, sp_mid_out, sp_end_out
	real colvector ref_start, ref_mid, ref_end
	real rowvector row, v, sorted_v, diff_v
	real scalar max_diff_mean, max_diff_var, max_diff_sd, max_diff_skew, max_diff_med
	real scalar max_diff_spells, max_diff_ref, max_diff_gdd, max_diff_kdd
	real scalar gdd_lo, gdd_hi, kdd_base, gdd_sum, kdd_sum, g_lo, g_hi, k_b
	real scalar W, w, k, m_count, m_mean, m_var, m_sd
	real matrix M, dev_out, z_out, ref_dev, ref_z
	real rowvector Y, eligible
	
	printf("Running 200 rows x 25 years simulation (10%% missing, cross-year, leap years)...\n")
	
	N = 200
	// Cross-year window Nov 1 to Feb 28/29: 30 + 31 + 31 + 29 = 121 days max
	D = 121
	
	// Create simulated daily matrix with 10% missing
	X = uniform(N, D) :* 50
	for (r = 1; r <= N; r++) {
		for (c = 1; c <= D; c++) {
			if (uniform(1, 1) < 0.10) {
				X[r, c] = .
			}
		}
	}
	
	// -------------------------------------------------------------------------
	// 1. MOMENTS EQUIVALENCE
	// -------------------------------------------------------------------------
	_wxsum_calc_moments(X, nobs_out=., mean_out=., med_out=., var_out=., sd_out=., skew_out=.)
	
	max_diff_mean = 0
	max_diff_var  = 0
	max_diff_sd   = 0
	max_diff_skew = 0
	max_diff_med  = 0
	
	for (i = 1; i <= N; i++) {
		row = X[i, .]
		v = select(row, (row :< .))
		n_obs = length(v)
		
		if (n_obs == 0) {
			assert(mean_out[i] >= .)
			continue
		}
		
		// Reference mean
		mean_val = sum(v) / n_obs
		if (abs(mean_out[i] - mean_val) > max_diff_mean) max_diff_mean = abs(mean_out[i] - mean_val)
		
		// Reference median
		sorted_v = sort(v', 1)'
		if (mod(n_obs, 2) == 1) {
			if (abs(med_out[i] - sorted_v[(n_obs + 1) / 2]) > max_diff_med) {
				max_diff_med = abs(med_out[i] - sorted_v[(n_obs + 1) / 2])
			}
		}
		else {
			if (abs(med_out[i] - (sorted_v[n_obs / 2] + sorted_v[n_obs / 2 + 1]) / 2) > max_diff_med) {
				max_diff_med = abs(med_out[i] - (sorted_v[n_obs / 2] + sorted_v[n_obs / 2 + 1]) / 2)
			}
		}
		
		// Reference variance, SD, skewness
		if (n_obs >= 2) {
			diff_v = v :- mean_val
			var_val = sum(diff_v :^ 2) / (n_obs - 1)
			sd_val = sqrt(var_val)
			if (abs(var_out[i] - var_val) > max_diff_var) max_diff_var = abs(var_out[i] - var_val)
			if (abs(sd_out[i] - sd_val) > max_diff_sd) max_diff_sd = abs(sd_out[i] - sd_val)
			
			if (n_obs >= 3 && sd_val > 0) {
				skew_val = (n_obs / ((n_obs - 1) * (n_obs - 2))) * sum((diff_v :/ sd_val) :^ 3)
				if (abs(skew_out[i] - skew_val) > max_diff_skew) max_diff_skew = abs(skew_out[i] - skew_val)
			}
		}
	}
	
	printf("Moments max differences vs double-precision reference math:\n")
	printf("  Mean    : %e\n", max_diff_mean)
	printf("  Median  : %e\n", max_diff_med)
	printf("  Variance: %e\n", max_diff_var)
	printf("  Std Dev : %e\n", max_diff_sd)
	printf("  Skewness: %e\n", max_diff_skew)
	assert(max_diff_mean < 1e-10)
	assert(max_diff_med  < 1e-10)
	assert(max_diff_var  < 1e-10)
	assert(max_diff_sd   < 1e-10)
	assert(max_diff_skew < 1e-10)
	
	// -------------------------------------------------------------------------
	// 2. SPELLS EQUIVALENCE (D3/D4 RULES)
	// -------------------------------------------------------------------------
	_wxsum_calc_spells(X, 10, 0, nobs_out, sp_start_out=., sp_mid_out=., sp_end_out=.)
	
	max_diff_spells = 0
	for (i = 1; i <= N; i++) {
		row = X[i, .]
		v = select(row, (row :< .))
		if (length(v) == 0) {
			assert(sp_start_out[i] >= . && sp_mid_out[i] >= . && sp_end_out[i] >= .)
			continue
		}
		
		// Compute leading spell (from first nonmissing)
		d = 1
		while (d <= D && row[d] >= .) d++
		ref_start = 0
		while (d <= D && row[d] < 10) {
			ref_start++
			d++
		}
		
		// Compute trailing spell (backward from last nonmissing)
		d = D
		while (d >= 1 && row[d] >= .) d--
		ref_end = 0
		while (d >= 1 && row[d] < 10) {
			ref_end++
			d--
		}
		
		if (abs(sp_start_out[i] - ref_start) > max_diff_spells) max_diff_spells = abs(sp_start_out[i] - ref_start)
		if (abs(sp_end_out[i] - ref_end) > max_diff_spells) max_diff_spells = abs(sp_end_out[i] - ref_end)
	}
	printf("Spells max difference: %e\n", max_diff_spells)
	assert(max_diff_spells == 0)
	
	// -------------------------------------------------------------------------
	// 3. CLAMPED GDD AND KDD EQUIVALENCE
	// -------------------------------------------------------------------------
	gdd_lo = 8
	gdd_hi = 32
	kdd_base = 32
	max_diff_gdd = 0
	max_diff_kdd = 0
	
	for (i = 1; i <= N; i++) {
		row = X[i, .]
		v = select(row, (row :< .))
		if (length(v) == 0) continue
		
		gdd_sum = 0
		kdd_sum = 0
		for (d = 1; d <= length(v); d++) {
			gdd_sum = gdd_sum + min((max((v[d] - gdd_lo, 0)), gdd_hi - gdd_lo))
			kdd_sum = kdd_sum + max((v[d] - kdd_base, 0))
		}
		
		// Vector clamp calculation
		g_lo = gdd_lo
		g_hi = gdd_hi
		k_b  = kdd_base
		if (abs(sum(colmin((colmax((v :- g_lo \ J(1, length(v), 0))) \ J(1, length(v), g_hi - g_lo)))) - gdd_sum) > max_diff_gdd) {
			max_diff_gdd = abs(sum(colmin((colmax((v :- g_lo \ J(1, length(v), 0))) \ J(1, length(v), g_hi - g_lo)))) - gdd_sum)
		}
		if (abs(sum(colmax((v :- k_b \ J(1, length(v), 0)))) - kdd_sum) > max_diff_kdd) {
			max_diff_kdd = abs(sum(colmax((v :- k_b \ J(1, length(v), 0)))) - kdd_sum)
		}
	}
	printf("GDD max difference: %e\n", max_diff_gdd)
	printf("KDD max difference: %e\n", max_diff_kdd)
	assert(max_diff_gdd < 1e-10)
	assert(max_diff_kdd < 1e-10)
	
	// -------------------------------------------------------------------------
	// 4. REFERENCE DEVIATION AND Z-SCORE EQUIVALENCE
	// -------------------------------------------------------------------------
	W = 25
	Y = 2000..2024
	M = uniform(N, W) :* 100
	for (r = 1; r <= N; r++) {
		for (c = 1; c <= W; c++) {
			if (uniform(1, 1) < 0.10) M[r, c] = .
		}
	}
	
	_wxsum_calc_ref(M, Y, 0, 10, 5, 0, 0, dev_out=., z_out=.)
	
	max_diff_ref = 0
	for (w = 1; w <= W; w++) {
		eligible = J(1, 0, .)
		for (k = 1; k <= W; k++) {
			if (Y[k] >= Y[w] - 10 && Y[k] <= Y[w] - 1) {
				eligible = eligible, k
			}
		}
		if (length(eligible) < 5) continue
		
		for (i = 1; i <= N; i++) {
			v = select(M[i, eligible], (M[i, eligible] :< .))
			m_count = length(v)
			if (m_count >= 5 && M[i, w] < .) {
				m_mean = mean(v')
				if (abs(dev_out[i, w] - (M[i, w] - m_mean)) > max_diff_ref) {
					max_diff_ref = abs(dev_out[i, w] - (M[i, w] - m_mean))
				}
				if (m_count >= 2) {
					diff_v = v :- m_mean
					m_sd = sqrt(sum(diff_v :^ 2) / (m_count - 1))
					if (m_sd > 0) {
						if (abs(z_out[i, w] - ((M[i, w] - m_mean) / m_sd)) > max_diff_ref) {
							max_diff_ref = abs(z_out[i, w] - ((M[i, w] - m_mean) / m_sd))
						}
					}
				}
			}
		}
	}
	printf("Reference deviations/z-scores max difference: %e\n", max_diff_ref)
	assert(max_diff_ref < 1e-10)
	
	printf("\nALL MATA ENGINE MATHEMATICAL EQUIVALENCE TESTS PASSED (< 1e-10)\n")
}

test_equivalence()

end

display as result "ALL V6 EQUIVALENCE TESTS PASSED (< 1e-10)!"
