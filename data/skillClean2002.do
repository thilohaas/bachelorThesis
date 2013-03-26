drop if foreign==1

gen byte HS=(edu==2)
gen byte female=(gender==2)

generate experience=age-17 if HS==0
replace experience=age-19 if HS==1
drop if experience<0 | experience>45

tab is05, gen(nationality)

tab experience, gen (exp)

save tmpSkillDataset, replace

keep if year == 2002
do "skillRegression.do"
save ONET_2002_clean, replace

use tmpSkillDataset, clear
keep if year == 2003
do "skillRegression.do"
save ONET_2003_clean, replace

use tmpSkillDataset, clear
keep if year == 2004
do "skillRegression.do"
save ONET_2004_clean, replace

use tmpSkillDataset, clear
keep if year == 2005
do "skillRegression.do"
save ONET_2005_clean, replace

use tmpSkillDataset, clear
keep if year == 2006
do "skillRegression.do"
save ONET_2006_clean, replace

use tmpSkillDataset, clear
keep if year == 2007
do "skillRegression.do"
save ONET_2007_clean, replace

use tmpSkillDataset, clear
keep if year == 2008
do "skillRegression.do"
save ONET_2008_clean, replace

use tmpSkillDataset, clear
keep if year == 2009
do "skillRegression.do"
save ONET_2009_clean, replace

use tmpSkillDataset, clear
keep if year == 2010
do "skillRegression.do"
save ONET_2010_clean, replace

use tmpSkillDataset, clear
keep if year == 2011
do "skillRegression.do"
save ONET_2011_clean, replace


use ONET_2002_clean, clear
append using ONET_2003_clean
append using ONET_2004_clean
append using ONET_2005_clean
append using ONET_2006_clean
append using ONET_2007_clean
append using ONET_2008_clean
append using ONET_2009_clean
append using ONET_2010_clean
append using ONET_2011_clean

sort year canton

save ONET_2002_2011_clean, replace

erase ONET_2002_clean.dta
erase ONET_2003_clean.dta
erase ONET_2004_clean.dta
erase ONET_2005_clean.dta
erase ONET_2006_clean.dta
erase ONET_2007_clean.dta
erase ONET_2008_clean.dta
erase ONET_2009_clean.dta
erase ONET_2010_clean.dta
erase ONET_2011_clean.dta

erase tmpSkillDataset.dta