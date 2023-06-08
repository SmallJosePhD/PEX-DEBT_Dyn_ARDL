
//First install the Dynamic ARDL Simulation Package
ssc install dynardl

//set stata for time series analysis
tsset year

//ardl model - ardl dep indep, lags() maxlags() aic/sic restricted(case 2) ec1 (ect)
ardl pexgdp debtgdp debtgdp2_ rent gdpg urbang, lags(2 1 1 1 1 1) restricted ec1

//unrestricted ARDL
regress d.pexgdp l.pexgdp d.debtgdp l.debtgdp d.debtgdp2_ l.debtgdp2_ d.rent l.rent d.gdpg l.gdpg d.urbang l.urbang

//test statistics
test l.pexgdp l.debtgdp l.debtgdp2_ l.rent l.gdpg l.urbang

//pss bounds testing
pssbounds, fstat(value) obs(value) case(value) k(value) tstat(value)

//increase mat size
set matsize 5000

//dynamic ARDL simulation
dynardl pexgdp debtgdp debtgdp2_ rent gdpg urbang, lags(1, 1, 1, 1, 1, 1) diffs(., 1, 1, 1, 1, 1) lagdiffs(1, ., ., ., ., .) shockvar(debtgdp) shockval(+5) time(10) range(50) sims(1500) graph ec









