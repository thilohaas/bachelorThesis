drop if foreign==1

tab edu, gen(HS)
gen byte female=(gender==2)

generate experience=age-17 if HS1==1
replace experience=age-19 if HS2==1
replace experience=age-24 if HS3==1
drop if experience<0 | experience>45

tab is05, gen(nationality)

tab experience, gen (exp)

save tmpSkillDataset, replace

keep if year == 1991
do "skillRegressionNoDrop.do"
save ONET_1991_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 1992
do "skillRegressionNoDrop.do"
save ONET_1992_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 1993
do "skillRegressionNoDrop.do"
save ONET_1993_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 1994
do "skillRegressionNoDrop.do"
save ONET_1994_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 1995
do "skillRegressionNoDrop.do"
save ONET_1995_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 1996
do "skillRegressionNoDrop.do"
save ONET_1996_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 1997
do "skillRegressionNoDrop.do"
save ONET_1997_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 1998
do "skillRegressionNoDrop.do"
save ONET_1998_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 1999
do "skillRegressionNoDrop.do"
save ONET_1999_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 2000
do "skillRegressionNoDrop.do"
save ONET_2000_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 2001
do "skillRegressionNoDrop.do"
save ONET_2001_clean_noDrop, replace


use ONET_1991_clean_noDrop, clear
append using ONET_1992_clean_noDrop
append using ONET_1993_clean_noDrop
append using ONET_1994_clean_noDrop
append using ONET_1995_clean_noDrop
append using ONET_1996_clean_noDrop
append using ONET_1997_clean_noDrop
append using ONET_1998_clean_noDrop
append using ONET_1999_clean_noDrop
append using ONET_2000_clean_noDrop
append using ONET_2001_clean_noDrop

sort year canton

save ONET_1991_2001_clean_noDrop, replace

erase ONET_1991_clean_noDrop.dta
erase ONET_1992_clean_noDrop.dta
erase ONET_1993_clean_noDrop.dta
erase ONET_1994_clean_noDrop.dta
erase ONET_1995_clean_noDrop.dta
erase ONET_1996_clean_noDrop.dta
erase ONET_1997_clean_noDrop.dta
erase ONET_1998_clean_noDrop.dta
erase ONET_1999_clean_noDrop.dta
erase ONET_2000_clean_noDrop.dta
erase ONET_2001_clean_noDrop.dta

erase tmpSkillDataset.dta
