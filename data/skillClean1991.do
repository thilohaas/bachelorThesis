drop if foreign==1

gen byte HS=(edu==2)
gen byte female=(gender==2)

generate experience=age-17 if HS==0
replace experience=age-19 if HS==1
drop if experience<0 | experience>45

tab is05, gen(nationality)

tab experience, gen (exp)

save tmpSkillDataset, replace

keep if year == 1991
do "skillRegression.do"
save ONET_1991_clean, replace

use tmpSkillDataset, clear
keep if year == 1992
do "skillRegression.do"
save ONET_1992_clean, replace

use tmpSkillDataset, clear
keep if year == 1993
do "skillRegression.do"
save ONET_1993_clean, replace

use tmpSkillDataset, clear
keep if year == 1994
do "skillRegression.do"
save ONET_1994_clean, replace

use tmpSkillDataset, clear
keep if year == 1995
do "skillRegression.do"
save ONET_1995_clean, replace

use tmpSkillDataset, clear
keep if year == 1996
do "skillRegression.do"
save ONET_1996_clean, replace

use tmpSkillDataset, clear
keep if year == 1997
do "skillRegression.do"
save ONET_1997_clean, replace

use tmpSkillDataset, clear
keep if year == 1998
do "skillRegression.do"
save ONET_1998_clean, replace

use tmpSkillDataset, clear
keep if year == 1999
do "skillRegression.do"
save ONET_1999_clean, replace

use tmpSkillDataset, clear
keep if year == 2000
do "skillRegression.do"
save ONET_2000_clean, replace

use tmpSkillDataset, clear
keep if year == 2001
do "skillRegression.do"
save ONET_2001_clean, replace


use ONET_1991_clean, clear
append using ONET_1992_clean
append using ONET_1993_clean
append using ONET_1994_clean
append using ONET_1995_clean
append using ONET_1996_clean
append using ONET_1997_clean
append using ONET_1998_clean
append using ONET_1999_clean
append using ONET_2000_clean
append using ONET_2001_clean

sort year canton

save ONET_1991_2001_clean, replace

erase ONET_1991_clean.dta
erase ONET_1992_clean.dta
erase ONET_1993_clean.dta
erase ONET_1994_clean.dta
erase ONET_1995_clean.dta
erase ONET_1996_clean.dta
erase ONET_1997_clean.dta
erase ONET_1998_clean.dta
erase ONET_1999_clean.dta
erase ONET_2000_clean.dta
erase ONET_2001_clean.dta

erase tmpSkillDataset.dta
