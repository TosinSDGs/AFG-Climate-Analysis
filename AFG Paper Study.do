*************** AFG Climate Shocks Analysis **********************************

* set working directory
cd "C:\Users\tgbadegesin\Downloads\AGFGP\New AFG\AFG Paper Submitted"

import excel "C:\Users\tgbadegesin\Downloads\AGFGP\New AFG\AFG Paper Submitted\AFG Stata Analysis Final.xlsx", sheet("Sheet1") firstrow

sort adm2_name date

gen time_trend = _n

tsset time_trend

* rename column for food prices
rename p_avg_food p_avgfood

*************************** The Logit Model **********************************

* Food stress
logit IPC_dummya l(0/12).positive_rainfa l(0/12).negative_rainfa l(0/12).NDVIPosAnomaly l(0/12).NDVINegAnomaly l(0/12).p_avgWageQL l(0/12).p_avgfood l(0/12).p_avgfuelP l(0/12).p_GFoodPrice l(0/12).p_avgexchangeR time_trend lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring, vce(robust)

* obtaining the prob of food stress
predict logit1a, pr

estat gof
estat classification

* Total effect
nlcom (positive_rainfa: (_b[positive_rainfa] + _b[l1.positive_rainfa] + _b[l2.positive_rainfa] + _b[l3.positive_rainfa] + _b[l4.positive_rainfa] + _b[l5.positive_rainfa] + _b[l6.positive_rainfa] + _b[l7.positive_rainfa] + _b[l8.positive_rainfa] + _b[l9.positive_rainfa] + _b[l10.positive_rainfa] + _b[l11.positive_rainfa] + _b[l12.positive_rainfa]))

nlcom (negative_rainfa: (_b[negative_rainfa] + _b[l1.negative_rainfa] + _b[l2.negative_rainfa] + _b[l3.negative_rainfa] + _b[l4.negative_rainfa] + _b[l5.negative_rainfa] + _b[l6.negative_rainfa] + _b[l7.negative_rainfa] + _b[l8.negative_rainfa] + _b[l9.negative_rainfa] + _b[l10.negative_rainfa] + _b[l11.negative_rainfa] + _b[l12.negative_rainfa]))

nlcom (NDVIPosAnomaly: (_b[NDVIPosAnomaly] + _b[l1.NDVIPosAnomaly] + _b[l2.NDVIPosAnomaly] + _b[l3.NDVIPosAnomaly] + _b[l4.NDVIPosAnomaly] + _b[l5.NDVIPosAnomaly] + _b[l6.NDVIPosAnomaly] + _b[l7.NDVIPosAnomaly] + _b[l8.NDVIPosAnomaly] + _b[l9.NDVIPosAnomaly] + _b[l10.NDVIPosAnomaly] + _b[l11.NDVIPosAnomaly] + _b[l12.NDVIPosAnomaly]))

nlcom (NDVINegAnomaly: (_b[NDVINegAnomaly] + _b[l1.NDVINegAnomaly] + _b[l2.NDVINegAnomaly] + _b[l3.NDVINegAnomaly] + _b[l4.NDVINegAnomaly] + _b[l5.NDVINegAnomaly] + _b[l6.NDVINegAnomaly] + _b[l7.NDVINegAnomaly] + _b[l8.NDVINegAnomaly] + _b[l9.NDVINegAnomaly] + _b[l10.NDVINegAnomaly] + _b[l11.NDVINegAnomaly] + _b[l12.NDVINegAnomaly]))

nlcom (p_avgfood: (_b[p_avgfood] + _b[l1.p_avgfood] + _b[l2.p_avgfood] + _b[l3.p_avgfood] + _b[l4.p_avgfood] + _b[l5.p_avgfood] + _b[l6.p_avgfood] + _b[l7.p_avgfood] + _b[l8.p_avgfood] + _b[l9.p_avgfood] + _b[l10.p_avgfood] + _b[l11.p_avgfood] + _b[l12.p_avgfood]))

nlcom (p_avgWageQL: (_b[p_avgWageQL] + _b[l1.p_avgWageQL] + _b[l2.p_avgWageQL] + _b[l3.p_avgWageQL] + _b[l4.p_avgWageQL] + _b[l5.p_avgWageQL] + _b[l6.p_avgWageQL] + _b[l7.p_avgWageQL] + _b[l8.p_avgWageQL] + _b[l9.p_avgWageQL] + _b[l10.p_avgWageQL] + _b[l11.p_avgWageQL] + _b[l12.p_avgWageQL])) 

nlcom (p_avgfuelP: (_b[p_avgfuelP] + _b[l1.p_avgfuelP] + _b[l2.p_avgfuelP] + _b[l3.p_avgfuelP] + _b[l4.p_avgfuelP] + _b[l5.p_avgfuelP] + _b[l6.p_avgfuelP] + _b[l7.p_avgfuelP] + _b[l8.p_avgfuelP] + _b[l9.p_avgfuelP] + _b[l10.p_avgfuelP] + _b[l11.p_avgfuelP] + _b[l12.p_avgfuelP]))

nlcom (p_GFoodPrice: (_b[p_GFoodPrice] + _b[l1.p_GFoodPrice] + _b[l2.p_GFoodPrice] + _b[l3.p_GFoodPrice] + _b[l4.p_GFoodPrice] + _b[l5.p_GFoodPrice] + _b[l6.p_GFoodPrice] + _b[l7.p_GFoodPrice] + _b[l8.p_GFoodPrice] + _b[l9.p_GFoodPrice] + _b[l10.p_GFoodPrice] + _b[l11.p_GFoodPrice] + _b[l12.p_GFoodPrice]))

nlcom (p_avgexchangeR: (_b[p_avgexchangeR] + _b[l1.p_avgexchangeR] + _b[l2.p_avgexchangeR] + _b[l3.p_avgexchangeR] + _b[l4.p_avgexchangeR] + _b[l5.p_avgexchangeR] + _b[l6.p_avgexchangeR] + _b[l7.p_avgexchangeR] + _b[l8.p_avgexchangeR] + _b[l9.p_avgexchangeR] + _b[l10.p_avgexchangeR] + _b[l11.p_avgexchangeR] + _b[l12.p_avgexchangeR]))

* overall marginal effect
margin, dydx(*)

* overall marginal effect of the climate variables
margin, dydx(positive_rainfa negative_rainfa NDVIPosAnomaly NDVINegAnomaly p_avgWageQL p_avgfood p_avgfuelP p_GFoodPrice p_avgexchangeR lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring)

* Food Crisis
logit IPC_dummyb l(0/12).positive_rainfa l(0/12).negative_rainfa l(0/12).NDVIPosAnomaly l(0/12).NDVINegAnomaly l(0/12).p_avgWageQL l(0/12).p_avgfood l(0/12).p_avgfuelP l(0/12).p_GFoodPrice l(0/12).p_avgexchangeR time_trend lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring, vce(robust)

* obtaining the prob of food crisis
predict logit1b, pr

estat gof
estat classification

* Total effect
nlcom (positive_rainfa: (_b[positive_rainfa] + _b[l1.positive_rainfa] + _b[l2.positive_rainfa] + _b[l3.positive_rainfa] + _b[l4.positive_rainfa] + _b[l5.positive_rainfa] + _b[l6.positive_rainfa] + _b[l7.positive_rainfa] + _b[l8.positive_rainfa] + _b[l9.positive_rainfa] + _b[l10.positive_rainfa] + _b[l11.positive_rainfa] + _b[l12.positive_rainfa]))

nlcom (negative_rainfa: (_b[negative_rainfa] + _b[l1.negative_rainfa] + _b[l2.negative_rainfa] + _b[l3.negative_rainfa] + _b[l4.negative_rainfa] + _b[l5.negative_rainfa] + _b[l6.negative_rainfa] + _b[l7.negative_rainfa] + _b[l8.negative_rainfa] + _b[l9.negative_rainfa] + _b[l10.negative_rainfa] + _b[l11.negative_rainfa] + _b[l12.negative_rainfa]))

nlcom (NDVIPosAnomaly: (_b[NDVIPosAnomaly] + _b[l1.NDVIPosAnomaly] + _b[l2.NDVIPosAnomaly] + _b[l3.NDVIPosAnomaly] + _b[l4.NDVIPosAnomaly] + _b[l5.NDVIPosAnomaly] + _b[l6.NDVIPosAnomaly] + _b[l7.NDVIPosAnomaly] + _b[l8.NDVIPosAnomaly] + _b[l9.NDVIPosAnomaly] + _b[l10.NDVIPosAnomaly] + _b[l11.NDVIPosAnomaly] + _b[l12.NDVIPosAnomaly]))

nlcom (NDVINegAnomaly: (_b[NDVINegAnomaly] + _b[l1.NDVINegAnomaly] + _b[l2.NDVINegAnomaly] + _b[l3.NDVINegAnomaly] + _b[l4.NDVINegAnomaly] + _b[l5.NDVINegAnomaly] + _b[l6.NDVINegAnomaly] + _b[l7.NDVINegAnomaly] + _b[l8.NDVINegAnomaly] + _b[l9.NDVINegAnomaly] + _b[l10.NDVINegAnomaly] + _b[l11.NDVINegAnomaly] + _b[l12.NDVINegAnomaly]))

nlcom (p_avgfood: (_b[p_avgfood] + _b[l1.p_avgfood] + _b[l2.p_avgfood] + _b[l3.p_avgfood] + _b[l4.p_avgfood] + _b[l5.p_avgfood] + _b[l6.p_avgfood] + _b[l7.p_avgfood] + _b[l8.p_avgfood] + _b[l9.p_avgfood] + _b[l10.p_avgfood] + _b[l11.p_avgfood] + _b[l12.p_avgfood]))

nlcom (p_avgWageQL: (_b[p_avgWageQL] + _b[l1.p_avgWageQL] + _b[l2.p_avgWageQL] + _b[l3.p_avgWageQL] + _b[l4.p_avgWageQL] + _b[l5.p_avgWageQL] + _b[l6.p_avgWageQL] + _b[l7.p_avgWageQL] + _b[l8.p_avgWageQL] + _b[l9.p_avgWageQL] + _b[l10.p_avgWageQL] + _b[l11.p_avgWageQL] + _b[l12.p_avgWageQL])) 

nlcom (p_avgfuelP: (_b[p_avgfuelP] + _b[l1.p_avgfuelP] + _b[l2.p_avgfuelP] + _b[l3.p_avgfuelP] + _b[l4.p_avgfuelP] + _b[l5.p_avgfuelP] + _b[l6.p_avgfuelP] + _b[l7.p_avgfuelP] + _b[l8.p_avgfuelP] + _b[l9.p_avgfuelP] + _b[l10.p_avgfuelP] + _b[l11.p_avgfuelP] + _b[l12.p_avgfuelP]))

nlcom (p_GFoodPrice: (_b[p_GFoodPrice] + _b[l1.p_GFoodPrice] + _b[l2.p_GFoodPrice] + _b[l3.p_GFoodPrice] + _b[l4.p_GFoodPrice] + _b[l5.p_GFoodPrice] + _b[l6.p_GFoodPrice] + _b[l7.p_GFoodPrice] + _b[l8.p_GFoodPrice] + _b[l9.p_GFoodPrice] + _b[l10.p_GFoodPrice] + _b[l11.p_GFoodPrice] + _b[l12.p_GFoodPrice]))

nlcom (p_avgexchangeR: (_b[p_avgexchangeR] + _b[l1.p_avgexchangeR] + _b[l2.p_avgexchangeR] + _b[l3.p_avgexchangeR] + _b[l4.p_avgexchangeR] + _b[l5.p_avgexchangeR] + _b[l6.p_avgexchangeR] + _b[l7.p_avgexchangeR] + _b[l8.p_avgexchangeR] + _b[l9.p_avgexchangeR] + _b[l10.p_avgexchangeR] + _b[l11.p_avgexchangeR] + _b[l12.p_avgexchangeR]))

* overall marginal effect
margin, dydx(*)

* overall marginal effect of the climate variables
margin, dydx(positive_rainfa negative_rainfa NDVIPosAnomaly NDVINegAnomaly p_avgWageQL p_avgfood p_avgfuelP p_GFoodPrice p_avgexchangeR lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring)

* export the data to excel for Tables and Figures creation
export excel using "/Users/tosingbadegesin/Downloads/AFG Stata Analysis Result-09-27.csv", firstrow(variables)


****************** The VAR Model *****************************

* Food Prices
var p_avgfood, lags(1/12) exog(l(1/12).p_avgWageQL l(0/12).positive_rainfa l(0/12).negative_rainfa l(0/12).NDVIPosAnomaly l(0/12).NDVINegAnomaly l(1/12).p_avgfuelP l(0/12).p_GFoodPrice l(0/12).p_avgexchangeR ha_dummy time_trend lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring)

* Total effect
nlcom (positive_rainfa: (_b[positive_rainfa] + _b[l1.positive_rainfa] + _b[l2.positive_rainfa] + _b[l3.positive_rainfa] + _b[l4.positive_rainfa] + _b[l5.positive_rainfa] + _b[l6.positive_rainfa] + _b[l7.positive_rainfa] + _b[l8.positive_rainfa] + _b[l9.positive_rainfa] + _b[l10.positive_rainfa] + _b[l11.positive_rainfa] + _b[l12.positive_rainfa]))

nlcom (negative_rainfa: (_b[negative_rainfa] + _b[l1.negative_rainfa] + _b[l2.negative_rainfa] + _b[l3.negative_rainfa] + _b[l4.negative_rainfa] + _b[l5.negative_rainfa] + _b[l6.negative_rainfa] + _b[l7.negative_rainfa] + _b[l8.negative_rainfa] + _b[l9.negative_rainfa] + _b[l10.negative_rainfa] + _b[l11.negative_rainfa] + _b[l12.negative_rainfa]))

nlcom (NDVIPosAnomaly: (_b[NDVIPosAnomaly] + _b[l1.NDVIPosAnomaly] + _b[l2.NDVIPosAnomaly] + _b[l3.NDVIPosAnomaly] + _b[l4.NDVIPosAnomaly] + _b[l5.NDVIPosAnomaly] + _b[l6.NDVIPosAnomaly] + _b[l7.NDVIPosAnomaly] + _b[l8.NDVIPosAnomaly] + _b[l9.NDVIPosAnomaly] + _b[l10.NDVIPosAnomaly] + _b[l11.NDVIPosAnomaly] + _b[l12.NDVIPosAnomaly]))

nlcom (NDVINegAnomaly: (_b[NDVINegAnomaly] + _b[l1.NDVINegAnomaly] + _b[l2.NDVINegAnomaly] + _b[l3.NDVINegAnomaly] + _b[l4.NDVINegAnomaly] + _b[l5.NDVINegAnomaly] + _b[l6.NDVINegAnomaly] + _b[l7.NDVINegAnomaly] + _b[l8.NDVINegAnomaly] + _b[l9.NDVINegAnomaly] + _b[l10.NDVINegAnomaly] + _b[l11.NDVINegAnomaly] + _b[l12.NDVINegAnomaly]))

nlcom (p_avgfood: (_b[l1.p_avgfood] + _b[l2.p_avgfood] + _b[l3.p_avgfood] + _b[l4.p_avgfood] + _b[l5.p_avgfood] + _b[l6.p_avgfood] + _b[l7.p_avgfood] + _b[l8.p_avgfood] + _b[l9.p_avgfood] + _b[l10.p_avgfood] + _b[l11.p_avgfood] + _b[l12.p_avgfood]))

nlcom (p_avgWageQL: (_b[l1.p_avgWageQL] + _b[l2.p_avgWageQL] + _b[l3.p_avgWageQL] + _b[l4.p_avgWageQL] + _b[l5.p_avgWageQL] + _b[l6.p_avgWageQL] + _b[l7.p_avgWageQL] + _b[l8.p_avgWageQL] + _b[l9.p_avgWageQL] + _b[l10.p_avgWageQL] + _b[l11.p_avgWageQL] + _b[l12.p_avgWageQL]))
 
nlcom (p_avgfuelP: (_b[l1.p_avgfuelP] + _b[l2.p_avgfuelP] + _b[l3.p_avgfuelP] + _b[l4.p_avgfuelP] + _b[l5.p_avgfuelP] + _b[l6.p_avgfuelP] + _b[l7.p_avgfuelP] + _b[l8.p_avgfuelP] + _b[l9.p_avgfuelP] + _b[l10.p_avgfuelP] + _b[l11.p_avgfuelP] + _b[l12.p_avgfuelP]))

nlcom (p_GFoodPrice: (_b[p_GFoodPrice] + _b[l1.p_GFoodPrice] + _b[l2.p_GFoodPrice] + _b[l3.p_GFoodPrice] + _b[l4.p_GFoodPrice] + _b[l5.p_GFoodPrice] + _b[l6.p_GFoodPrice] + _b[l7.p_GFoodPrice] + _b[l8.p_GFoodPrice] + _b[l9.p_GFoodPrice] + _b[l10.p_GFoodPrice] + _b[l11.p_GFoodPrice] + _b[l12.p_GFoodPrice]))

nlcom (p_avgexchangeR: (_b[p_avgexchangeR] + _b[l1.p_avgexchangeR] + _b[l2.p_avgexchangeR] + _b[l3.p_avgexchangeR] + _b[l4.p_avgexchangeR] + _b[l5.p_avgexchangeR] + _b[l6.p_avgexchangeR] + _b[l7.p_avgexchangeR] + _b[l8.p_avgexchangeR] + _b[l9.p_avgexchangeR] + _b[l10.p_avgexchangeR] + _b[l11.p_avgexchangeR] + _b[l12.p_avgexchangeR]))
 
 
* Agricultural wages
var p_avgWageQL, lags(1/12) exog(l(0/12).p_avgfood l(0/12).positive_rainfa l(0/12).negative_rainfa l(0/12).NDVIPosAnomaly l(0/12).NDVINegAnomaly l(1/12).p_avgfuelP l(0/12).p_GFoodPrice l(0/12).p_avgexchangeR ha_dummy time_trend lcropland_pct lruggedness_mean lpopdensity lpasture_pct winter summer spring)

* Total effect
nlcom (positive_rainfa: (_b[positive_rainfa] + _b[l1.positive_rainfa] + _b[l2.positive_rainfa] + _b[l3.positive_rainfa] + _b[l4.positive_rainfa] + _b[l5.positive_rainfa] + _b[l6.positive_rainfa] + _b[l7.positive_rainfa] + _b[l8.positive_rainfa] + _b[l9.positive_rainfa] + _b[l10.positive_rainfa] + _b[l11.positive_rainfa] + _b[l12.positive_rainfa]))

nlcom (negative_rainfa: (_b[negative_rainfa] + _b[l1.negative_rainfa] + _b[l2.negative_rainfa] + _b[l3.negative_rainfa] + _b[l4.negative_rainfa] + _b[l5.negative_rainfa] + _b[l6.negative_rainfa] + _b[l7.negative_rainfa] + _b[l8.negative_rainfa] + _b[l9.negative_rainfa] + _b[l10.negative_rainfa] + _b[l11.negative_rainfa] + _b[l12.negative_rainfa]))

nlcom (NDVIPosAnomaly: (_b[NDVIPosAnomaly] + _b[l1.NDVIPosAnomaly] + _b[l2.NDVIPosAnomaly] + _b[l3.NDVIPosAnomaly] + _b[l4.NDVIPosAnomaly] + _b[l5.NDVIPosAnomaly] + _b[l6.NDVIPosAnomaly] + _b[l7.NDVIPosAnomaly] + _b[l8.NDVIPosAnomaly] + _b[l9.NDVIPosAnomaly] + _b[l10.NDVIPosAnomaly] + _b[l11.NDVIPosAnomaly] + _b[l12.NDVIPosAnomaly]))

nlcom (NDVINegAnomaly: (_b[NDVINegAnomaly] + _b[l1.NDVINegAnomaly] + _b[l2.NDVINegAnomaly] + _b[l3.NDVINegAnomaly] + _b[l4.NDVINegAnomaly] + _b[l5.NDVINegAnomaly] + _b[l6.NDVINegAnomaly] + _b[l7.NDVINegAnomaly] + _b[l8.NDVINegAnomaly] + _b[l9.NDVINegAnomaly] + _b[l10.NDVINegAnomaly] + _b[l11.NDVINegAnomaly] + _b[l12.NDVINegAnomaly]))

nlcom (p_avgfood: (_b[l1.p_avgfood] + _b[l2.p_avgfood] + _b[l3.p_avgfood] + _b[l4.p_avgfood] + _b[l5.p_avgfood] + _b[l6.p_avgfood] + _b[l7.p_avgfood] + _b[l8.p_avgfood] + _b[l9.p_avgfood] + _b[l10.p_avgfood] + _b[l11.p_avgfood] + _b[l12.p_avgfood]))

nlcom (p_avgWageQL: (_b[l1.p_avgWageQL] + _b[l2.p_avgWageQL] + _b[l3.p_avgWageQL] + _b[l4.p_avgWageQL] + _b[l5.p_avgWageQL] + _b[l6.p_avgWageQL] + _b[l7.p_avgWageQL] + _b[l8.p_avgWageQL] + _b[l9.p_avgWageQL] + _b[l10.p_avgWageQL] + _b[l11.p_avgWageQL] + _b[l12.p_avgWageQL])) 

nlcom (p_avgfuelP: (_b[l1.p_avgfuelP] + _b[l2.p_avgfuelP] + _b[l3.p_avgfuelP] + _b[l4.p_avgfuelP] + _b[l5.p_avgfuelP] + _b[l6.p_avgfuelP] + _b[l7.p_avgfuelP] + _b[l8.p_avgfuelP] + _b[l9.p_avgfuelP] + _b[l10.p_avgfuelP] + _b[l11.p_avgfuelP] + _b[l12.p_avgfuelP]))

nlcom (p_GFoodPrice: (_b[p_GFoodPrice] + _b[l1.p_GFoodPrice] + _b[l2.p_GFoodPrice] + _b[l3.p_GFoodPrice] + _b[l4.p_GFoodPrice] + _b[l5.p_GFoodPrice] + _b[l6.p_GFoodPrice] + _b[l7.p_GFoodPrice] + _b[l8.p_GFoodPrice] + _b[l9.p_GFoodPrice] + _b[l10.p_GFoodPrice] + _b[l11.p_GFoodPrice] + _b[l12.p_GFoodPrice]))

nlcom (p_avgexchangeR: (_b[p_avgexchangeR] + _b[l1.p_avgexchangeR] + _b[l2.p_avgexchangeR] + _b[l3.p_avgexchangeR] + _b[l4.p_avgexchangeR] + _b[l5.p_avgexchangeR] + _b[l6.p_avgexchangeR] + _b[l7.p_avgexchangeR] + _b[l8.p_avgexchangeR] + _b[l9.p_avgexchangeR] + _b[l10.p_avgexchangeR] + _b[l11.p_avgexchangeR] + _b[l12.p_avgexchangeR]))

