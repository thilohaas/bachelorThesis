use data1991_noDrop, clear
append using data2002_noDrop

*****
gen isco_tmp=substr(isco_str,1,1)
drop isco_str
drop if isco_tmp == "-"
drop if isco_tmp == "0"
rename isco_tmp isco_mayor
*encode isco_tmp, generate(isco_mayor)
*drop isco_tmp
*label drop isco_mayor
label variable isco_mayor `"isco88 major groups"'

keep if year == 1991 | year == 2002 | year == 2011

collapse (sum) foreign_empl native_empl foreign_howo native_howo, by(year isco_mayor)
*gen fshare = foreign_howo/(native_howo + foreign_howo )
gen fshare = foreign_empl/(native_empl + foreign_empl )*100


keep fshare year isco_mayor

reshape wide fshare, i(isco_mayor) j(year)

label variable fshare1991 `"Foreign born share in 1991"'
label variable fshare2002 `"Foreign born share in 2002"'
label variable fshare2011 `"Foreign born share in 2011"'

gen isco = ""
replace isco = "1) Legislators, senior..." if isco_mayor == "1"
replace isco = "2) Professionals" if isco_mayor == "2"
replace isco = "3) Technicians and..." if isco_mayor == "3"
replace isco = "4) Clerks" if isco_mayor == "4"
replace isco = "5) Service workers,..." if isco_mayor == "5"
replace isco = "6) Skill agricultural..." if isco_mayor == "6"
replace isco = "7) Craft and related..." if isco_mayor == "7"
replace isco = "8) Plant and machine..." if isco_mayor == "8"
replace isco = "9) Elementary occup..." if isco_mayor == "9"

graph hbar fshare*, over(isco) legend(label(1 "1991") label(2 "2002") label(3 "2011") row(1) span) ytitle("Share of immigrants in %") title("Immigrant Share by ISCO Mayor Groups", span)
graph export "immigrantsIsco.eps", as(eps) preview(off) replace


use abilities, clear

gen isco_tmp=substr(isco_str,1,1)
drop isco_str
drop if isco_tmp == "-"
drop if isco_tmp == "0"
rename isco_tmp isco_mayor

collapse language manual, by(isco_mayor)

gen relative=language/manual


gen isco = ""
replace isco = "1) Legislators, senior..." if isco_mayor == "1"
replace isco = "2) Professionals" if isco_mayor == "2"
replace isco = "3) Technicians and..." if isco_mayor == "3"
replace isco = "4) Clerks" if isco_mayor == "4"
replace isco = "5) Service workers,..." if isco_mayor == "5"
replace isco = "6) Skill agricultural..." if isco_mayor == "6"
replace isco = "7) Craft and related..." if isco_mayor == "7"
replace isco = "8) Plant and machine..." if isco_mayor == "8"
replace isco = "9) Elementary occup..." if isco_mayor == "9"

graph hbar relative language manual, over(isco) legend(label(1 "Relative Communication/Manual") label(2 "Communication") label(3 "Manual") row(1) span) ytitle("Task Intensities") title("Task Intensities by ISCO Mayor Groups", span)
graph export "iscoSkills.eps", as(eps) preview(off) replace
