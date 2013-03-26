use data1991_noDrop, clear
append using data2002_noDrop

*****

gen isco_tmp=substr(isco_str,1,1)
drop isco_str
drop if isco_tmp == "-"
drop if isco_tmp == "0"
encode isco_tmp, generate(isco_mayor)
drop isco_tmp
label drop isco_mayor
label variable isco_mayor `"isco88 major groups"'

drop if isco_mayor == .
tab isco_mayor

egen iscoSkillLevel = cut(isco_mayor), at(0,2,3,4,9,10)

collapse (sum) foreign_empl native_empl foreign_howo native_howo, by(year iscoSkillLevel)
*gen fshare = foreign_howo/(native_howo + foreign_howo )
gen fshare = foreign_empl/(native_empl + foreign_empl )


keep fshare year iscoSkillLevel

reshape wide fshare, i(year) j(iscoSkillLevel)

label variable fshare0 `"Legislators, senior officials, managers"'
label variable fshare2 `"4th ISCO skill level"'
label variable fshare3 `"3rd ISCO skill level"'
label variable fshare4 `"2nd ISCO skill level"'
label variable fshare9 `"1st ISCO skill level"'

drop fshare0

/*label variable fshare1 `"Legislators, senior officials..."'
label variable fshare2 `"Professionals"'
label variable fshare3 `"Technicians and associate..."'
label variable fshare4 `"Clerks"'
label variable fshare5 `"Service workers, shop, market..."'
label variable fshare6 `"Skill agricultural and fishery..."'
label variable fshare7 `"Craft and related workers"'
label variable fshare8 `"Plant and machine operators..."'
label variable fshare9 `"Elementary occupations"'
*/
tsset year

set scheme s2mono

*set scheme s2color
graph twoway tsline fshare*, ytitle("Share of foreign born's on total population") title("Immigrant Share by ISCO Skill Groups") caption("Source: Author's calculations on SAKE data from 1991 to 2011.")
graph export "immigrantsByIscoSkills.eps", as(eps) preview(off) replace
