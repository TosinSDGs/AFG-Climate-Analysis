* set working directory

cd "/Users/tosingbadegesin/Downloads"

* Load the dataset
use AFG Stata Analysis.dta, clear

import excel "/Users/tosingbadegesin/Downloads/AFG Stata Analysis2.xlsx", sheet("Sheet1") firstrow

sort adm2_name dates

gen time_trend = _n

tsset time_trend

* try the other wages


* Food stress
logit IPC_dummya l(0/12).positive_rainfa l(0/12).negative_rainfa l(0/12).vim_zscore l(0/12).p_avgWageQL l(0/12).p_avgfood l(1/12).p_avgfuelP l(0/12).p_GFoodPrice l(0/12).p_avgexchangeR time_trend lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring, vce(robust)

logit IPC_dummya l(0/12).positive_rainfa l(0/12).negative_rainfa l(0/12).vim_zscore l(0/12).p_avgWageQL l(0/12).p_avgfood l(1/12).p_avgfuelP l(0/12).p_GFoodPrice l(0/12).p_avgexchangeR time_trend lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring, vce(robust)

* obtaining the prob of food stress
predict logit1a, pr

estat gof
estat classification

* Total effect
nlcom (positive_rainfa: (_b[positive_rainfa] + _b[l1.positive_rainfa] + _b[l2.positive_rainfa] + _b[l3.positive_rainfa] + _b[l4.positive_rainfa] + _b[l5.positive_rainfa] + _b[l6.positive_rainfa] + _b[l7.positive_rainfa] + _b[l8.positive_rainfa] + _b[l9.positive_rainfa] + _b[l10.positive_rainfa] + _b[l11.positive_rainfa] + _b[l12.positive_rainfa]))

nlcom (negative_rainfa: (_b[negative_rainfa] + _b[l1.negative_rainfa] + _b[l2.negative_rainfa] + _b[l3.negative_rainfa] + _b[l4.negative_rainfa] + _b[l5.negative_rainfa] + _b[l6.negative_rainfa] + _b[l7.negative_rainfa] + _b[l8.negative_rainfa] + _b[l9.negative_rainfa] + _b[l10.negative_rainfa] + _b[l11.negative_rainfa] + _b[l12.negative_rainfa]))

nlcom (vim_zscore: (_b[vim_zscore] + _b[l1.vim_zscore] + _b[l2.vim_zscore] + _b[l3.vim_zscore] + _b[l4.vim_zscore] + _b[l5.vim_zscore] +  _b[l6.vim_zscore] + _b[l7.vim_zscore] + _b[l8.vim_zscore] + _b[l9.vim_zscore] + _b[l10.vim_zscore] + _b[l11.vim_zscore] + _b[l12.vim_zscore]))

nlcom (p_avgfood: (_b[p_avgfood] + _b[l1.p_avgfood] + _b[l2.p_avgfood] + _b[l3.p_avgfood] + _b[l4.p_avgfood] + _b[l5.p_avgfood] + _b[l6.p_avgfood] + _b[l7.p_avgfood] + _b[l8.p_avgfood] + _b[l9.p_avgfood] + _b[l10.p_avgfood] + _b[l11.p_avgfood] + _b[l12.p_avgfood]))

nlcom (p_avgWageQL: (_b[p_avgWageQL] + _b[l1.p_avgWageQL] + _b[l2.p_avgWageQL] + _b[l3.p_avgWageQL] + _b[l4.p_avgWageQL] + _b[l5.p_avgWageQL] + _b[l6.p_avgWageQL] + _b[l7.p_avgWageQL] + _b[l8.p_avgWageQL] + _b[l9.p_avgWageQL] + _b[l10.p_avgWageQL] + _b[l11.p_avgWageQL] + _b[l12.p_avgWageQL])) 

* overall marginal effect
margin, dydx(*)

* overall marginal effect of the climate variables
margin, dydx(positive_rainfa negative_rainfa vim_zscore p_avgWageQL p_avgfood)

* Food Crisis
logit IPC_dummyb l(0/12).positive_rainfa l(0/12).negative_rainfa l(0/12).vim_zscore l(0/12).p_avgWageQL l(0/12).p_avgfood l(1/12).p_avgfuelP l(0/12).p_GFoodPrice l(0/12).p_avgexchangeR time_trend lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring, vce(robust)

logit IPC_dummyb l(0/12).positive_rainfa l(0/12).negative_rainfa l(0/12).vim_zscore l(0/12).p_avgWageQL l(0/12).p_avgfood l(1/12).p_avgfuelP l(0/12).p_GFoodPrice l(0/12).p_avgexchangeR time_trend lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring, vce(robust)

* obtaining the prob of food crisis
predict logit1b, pr

estat gof
estat classification

* Total effect
nlcom (positive_rainfa: (_b[positive_rainfa] + _b[l1.positive_rainfa] + _b[l2.positive_rainfa] + _b[l3.positive_rainfa] + _b[l4.positive_rainfa] + _b[l5.positive_rainfa] + _b[l6.positive_rainfa] + _b[l7.positive_rainfa] + _b[l8.positive_rainfa] + _b[l9.positive_rainfa] + _b[l10.positive_rainfa] + _b[l11.positive_rainfa] + _b[l12.positive_rainfa]))

nlcom (negative_rainfa: (_b[negative_rainfa] + _b[l1.negative_rainfa] + _b[l2.negative_rainfa] + _b[l3.negative_rainfa] + _b[l4.negative_rainfa] + _b[l5.negative_rainfa] + _b[l6.negative_rainfa] + _b[l7.negative_rainfa] + _b[l8.negative_rainfa] + _b[l9.negative_rainfa] + _b[l10.negative_rainfa] + _b[l11.negative_rainfa] + _b[l12.negative_rainfa]))

nlcom (vim_zscore: (_b[vim_zscore] + _b[l1.vim_zscore] + _b[l2.vim_zscore] + _b[l3.vim_zscore] + _b[l4.vim_zscore] + _b[l5.vim_zscore] +  _b[l6.vim_zscore] + _b[l7.vim_zscore] + _b[l8.vim_zscore] + _b[l9.vim_zscore] + _b[l10.vim_zscore] + _b[l11.vim_zscore] + _b[l12.vim_zscore]))

nlcom (p_avgfood: (_b[p_avgfood] + _b[l1.p_avgfood] + _b[l2.p_avgfood] + _b[l3.p_avgfood] + _b[l4.p_avgfood] + _b[l5.p_avgfood] + _b[l6.p_avgfood] + _b[l7.p_avgfood] + _b[l8.p_avgfood] + _b[l9.p_avgfood] + _b[l10.p_avgfood] + _b[l11.p_avgfood] + _b[l12.p_avgfood]))

nlcom (p_avgWageQL: (_b[p_avgWageQL] + _b[l1.p_avgWageQL] + _b[l2.p_avgWageQL] + _b[l3.p_avgWageQL] + _b[l4.p_avgWageQL] + _b[l5.p_avgWageQL] + _b[l6.p_avgWageQL] + _b[l7.p_avgWageQL] + _b[l8.p_avgWageQL] + _b[l9.p_avgWageQL] + _b[l10.p_avgWageQL] + _b[l11.p_avgWageQL] + _b[l12.p_avgWageQL])) 

* overall marginal effect
margin, dydx(*)

* overall marginal effect of the climate variables
margin, dydx(positive_rainfa negative_rainfa vim_zscore p_avgWageQL p_avgfood)

* export the data to excel
export excel using "/Users/tosingbadegesin/Downloads/AFG Stata Analysis Result.xls", firstrow(variables)


* food prices

* Create interaction terms
gen inWageNrainf = negative_rainfa * p_avgWageQL
gen inWagePrainf= p_avgWageQL * positive_rainfa

gen inFoodNrainf = negative_rainfa * p_avgfood
gen inFoodPrainf = p_avgfood * positive_rainfa

gen inCropPrainf = positive_rainfa * lcropland_pct
gen inCropNrainf = negative_rainfa * lcropland_pct

* Food final
var p_avgfood, lags(1/12) exog(l(1/12).p_avgWageQL l(0/12).positive_rainfa l(0/12).negative_rainfa l(0/12).vim_zscore l(1/12).p_avgfuelP l(0/12).p_GFoodPrice l(0/12).p_avgexchangeR time_trend lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring)

reg p_avgfood l(1/12).p_avgfood l(1/12).p_avgWageQL l(0/12).positive_rainfa l(0/12).negative_rainfa l(0/12).vim_zscore l(1/12).p_avgfuelP l(0/12).p_GFoodPrice l(0/12).p_avgexchangeR time_trend lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring, vce(robust)


var p_avgfood, lags(1/12) exog(l(1/12).p_avgWageQL l(0/12).positive_rainfa l(0/12).negative_rainfa l(0/12).vim_zscore l(1/12).p_avgfuelP l(0/12).p_GFoodPrice l(0/12).p_avgexchangeR inWageNrainf inWagePrainf inFoodNrainf inFoodPrainf inCropPrainf inCropNrainf time_trend lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring)

* Total effect
nlcom (positive_rainfa: (_b[positive_rainfa] + _b[l1.positive_rainfa] + _b[l2.positive_rainfa] + _b[l3.positive_rainfa] + _b[l4.positive_rainfa] + _b[l5.positive_rainfa] + _b[l6.positive_rainfa] + _b[l7.positive_rainfa] + _b[l8.positive_rainfa] + _b[l9.positive_rainfa] + _b[l10.positive_rainfa] + _b[l11.positive_rainfa] + _b[l12.positive_rainfa]))

nlcom (negative_rainfa: (_b[negative_rainfa] + _b[l1.negative_rainfa] + _b[l2.negative_rainfa] + _b[l3.negative_rainfa] + _b[l4.negative_rainfa] + _b[l5.negative_rainfa] + _b[l6.negative_rainfa] + _b[l7.negative_rainfa] + _b[l8.negative_rainfa] + _b[l9.negative_rainfa] + _b[l10.negative_rainfa] + _b[l11.negative_rainfa] + _b[l12.negative_rainfa]))

nlcom (vim_zscore: (_b[vim_zscore] + _b[l1.vim_zscore] + _b[l2.vim_zscore] + _b[l3.vim_zscore] + _b[l4.vim_zscore] + _b[l5.vim_zscore] +  _b[l6.vim_zscore] + _b[l7.vim_zscore] + _b[l8.vim_zscore] + _b[l9.vim_zscore] + _b[l10.vim_zscore] + _b[l11.vim_zscore] + _b[l12.vim_zscore]))

nlcom (p_avgfood: (_b[l1.p_avgfood] + _b[l2.p_avgfood] + _b[l3.p_avgfood] + _b[l4.p_avgfood] + _b[l5.p_avgfood] + _b[l6.p_avgfood] + _b[l7.p_avgfood] + _b[l8.p_avgfood] + _b[l9.p_avgfood] + _b[l10.p_avgfood] + _b[l11.p_avgfood] + _b[l12.p_avgfood]))

nlcom (p_avgWageQL: (_b[l1.p_avgWageQL] + _b[l2.p_avgWageQL] + _b[l3.p_avgWageQL] + _b[l4.p_avgWageQL] + _b[l5.p_avgWageQL] + _b[l6.p_avgWageQL] + _b[l7.p_avgWageQL] + _b[l8.p_avgWageQL] + _b[l9.p_avgWageQL] + _b[l10.p_avgWageQL] + _b[l11.p_avgWageQL] + _b[l12.p_avgWageQL]))
 


* Agricultural wages
var p_avgWageQL, lags(1/12) exog(l(0/12).p_avgfood l(0/12).positive_rainfa l(0/12).negative_rainfa l(0/12).vim_zscore l(1/12).p_avgfuelP l(0/12).p_GFoodPrice l(0/12).p_avgexchangeR time_trend lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring)

reg p_avgWageQL l(1/12).p_avgWageQL l(1/12).p_avgfood l(0/12).positive_rainfa l(0/12).negative_rainfa l(0/12).vim_zscore l(1/12).p_avgfuelP l(0/12).p_GFoodPrice l(0/12).p_avgexchangeR time_trend lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring, vce(robust)

var p_avgWageQL, lags(1/12) exog(l(0/12).p_avgfood l(0/12).positive_rainfa l(0/12).negative_rainfa l(0/12).vim_zscore l(1/12).p_avgfuelP l(0/12).p_GFoodPrice l(0/12).p_avgexchangeR inWageNrainf inWagePrainf inFoodNrainf inFoodPrainf inCropPrainf inCropNrainf time_trend lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring)

* Total effect
nlcom (positive_rainfa: (_b[positive_rainfa] + _b[l1.positive_rainfa] + _b[l2.positive_rainfa] + _b[l3.positive_rainfa] + _b[l4.positive_rainfa] + _b[l5.positive_rainfa] + _b[l6.positive_rainfa] + _b[l7.positive_rainfa] + _b[l8.positive_rainfa] + _b[l9.positive_rainfa] + _b[l10.positive_rainfa] + _b[l11.positive_rainfa] + _b[l12.positive_rainfa]))

nlcom (negative_rainfa: (_b[negative_rainfa] + _b[l1.negative_rainfa] + _b[l2.negative_rainfa] + _b[l3.negative_rainfa] + _b[l4.negative_rainfa] + _b[l5.negative_rainfa] + _b[l6.negative_rainfa] + _b[l7.negative_rainfa] + _b[l8.negative_rainfa] + _b[l9.negative_rainfa] + _b[l10.negative_rainfa] + _b[l11.negative_rainfa] + _b[l12.negative_rainfa]))

nlcom (vim_zscore: (_b[vim_zscore] + _b[l1.vim_zscore] + _b[l2.vim_zscore] + _b[l3.vim_zscore] + _b[l4.vim_zscore] + _b[l5.vim_zscore] +  _b[l6.vim_zscore] + _b[l7.vim_zscore] + _b[l8.vim_zscore] + _b[l9.vim_zscore] + _b[l10.vim_zscore] + _b[l11.vim_zscore] + _b[l12.vim_zscore]))

nlcom (p_avgfood: (_b[l1.p_avgfood] + _b[l2.p_avgfood] + _b[l3.p_avgfood] + _b[l4.p_avgfood] + _b[l5.p_avgfood] + _b[l6.p_avgfood] + _b[l7.p_avgfood] + _b[l8.p_avgfood] + _b[l9.p_avgfood] + _b[l10.p_avgfood] + _b[l11.p_avgfood] + _b[l12.p_avgfood]))

nlcom (p_avgWageQL: (_b[l1.p_avgWageQL] + _b[l2.p_avgWageQL] + _b[l3.p_avgWageQL] + _b[l4.p_avgWageQL] + _b[l5.p_avgWageQL] + _b[l6.p_avgWageQL] + _b[l7.p_avgWageQL] + _b[l8.p_avgWageQL] + _b[l9.p_avgWageQL] + _b[l10.p_avgWageQL] + _b[l11.p_avgWageQL] + _b[l12.p_avgWageQL])) 





