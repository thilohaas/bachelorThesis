* graph foreign born share by education from 1991-2011
use data1991_noDrop, clear
append using data2002_noDrop

*****

egen region = cut(canton), at(1,21,22,28)

collapse (sum) foreign_empl native_empl, by(year edu region)

gen fshareLow = foreign_empl/(native_empl + foreign_empl ) if edu == 1
gen fshareMedium = foreign_empl/(native_empl + foreign_empl ) if edu == 2
gen fshareHigh = foreign_empl/(native_empl + foreign_empl ) if edu == 3

keep if year == 1991 | year == 2002 | year == 2011

collapse (sum) foreign_empl native_empl fshare*, by(year region)
gen fshare = foreign_empl/(native_empl + foreign_empl )
label variable fshare "Total"
label variable fshareLow "Low education"
label variable fshareMedium "Medium education"
label variable fshareHigh "High education"
label variable year "Year"

label define region_1 1 "North-East Switzerland" 
label define region_1 21 "South Switzerland", add
label define region_1 22 "North-West Switzerland", add
label values region region_1

* set graph scheme (graph query, schemes)
set scheme s2mono
graph bar fshare*, over(year) over(region, relabel(1 "North-East Switzerland" 21 "South Switzerland" 22 "North-West Switzerland")) ytitle("Share of foreign born's on population") title("Immigrants by education in Switzerland by region") caption("Source: Author's calculations on SAKE data from 1991 to 2011.") legend(label(1 "Low education") label(2 "Medium education") label(3 "High education") label(4 "Total"))
graph export "immigrantsByEducationByRegion.eps", as(eps) preview(off) replace
