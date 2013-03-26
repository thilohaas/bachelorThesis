use data1991, clear

egen region = cut(canton), at(1,21,22,28)

collapse (sum) foreign_empl native_empl foreign_howo native_howo (mean)region, by(canton year)

sort year canton

merge year canton using ONET_1991_2001_clean
tab _merge
drop if _merge != 3
drop _merge

sort year canton
gen after2002 = 0
save data1991WithSkills, replace

use data2002, clear

*rename b023 region
egen region = cut(canton), at(1,21,22,28)

collapse (sum) foreign_empl native_empl foreign_howo native_howo (mean)region, by(canton year)

sort year canton

merge year canton using ONET_2002_2011_clean
tab _merge
drop if _merge != 3
drop _merge

sort year canton
gen after2002 = 1
save data2002WithSkills, replace

***

use data1991WithSkills, clear

append using data2002WithSkills


gen howo = native_howo

collapse (mean) manual language [aw=howo], by(year)

tsset year

gen rel = language/manual

label variable year "Year"
label variable rel "Relative task intensity"
label variable manual "Manual task intensity"
label variable language "Communication task intensity"

graph twoway tsline manual language, title("Communication and Manual Task Intensities from 1991-2011")
graph export "skillIntensities.eps", as(eps) preview(off) replace
