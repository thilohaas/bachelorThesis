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

keep if year == 2002
do "skillRegressionNoDrop.do"
save ONET_2002_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 2003
do "skillRegressionNoDrop.do"
save ONET_2003_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 2004
do "skillRegressionNoDrop.do"
save ONET_2004_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 2005
do "skillRegressionNoDrop.do"
save ONET_2005_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 2006
do "skillRegressionNoDrop.do"
save ONET_2006_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 2007
do "skillRegressionNoDrop.do"
save ONET_2007_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 2008
do "skillRegressionNoDrop.do"
save ONET_2008_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 2009
do "skillRegressionNoDrop.do"
save ONET_2009_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 2010
do "skillRegressionNoDrop.do"
save ONET_2010_clean_noDrop, replace

use tmpSkillDataset, clear
keep if year == 2011
do "skillRegressionNoDrop.do"
save ONET_2011_clean_noDrop, replace


use ONET_2002_clean_noDrop, clear
append using ONET_2003_clean_noDrop
append using ONET_2004_clean_noDrop
append using ONET_2005_clean_noDrop
append using ONET_2006_clean_noDrop
append using ONET_2007_clean_noDrop
append using ONET_2008_clean_noDrop
append using ONET_2009_clean_noDrop
append using ONET_2010_clean_noDrop
append using ONET_2011_clean_noDrop

sort year canton

save ONET_2002_2011_clean_noDrop, replace

erase ONET_2002_clean_noDrop.dta
erase ONET_2003_clean_noDrop.dta
erase ONET_2004_clean_noDrop.dta
erase ONET_2005_clean_noDrop.dta
erase ONET_2006_clean_noDrop.dta
erase ONET_2007_clean_noDrop.dta
erase ONET_2008_clean_noDrop.dta
erase ONET_2009_clean_noDrop.dta
erase ONET_2010_clean_noDrop.dta
erase ONET_2011_clean_noDrop.dta

erase tmpSkillDataset.dta
