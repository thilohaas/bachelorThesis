* graph foreign born share by education from 1991-2011
use data1991_noDrop, clear
append using data2002_noDrop

*****

collapse (sum) foreign_empl native_empl, by(year edu)

gen fshareLow = foreign_empl/(native_empl + foreign_empl ) if edu == 1
gen fshareMedium = foreign_empl/(native_empl + foreign_empl ) if edu == 2
gen fshareHigh = foreign_empl/(native_empl + foreign_empl ) if edu == 3

collapse (sum) foreign_empl native_empl fshare*, by(year)
gen fshare = foreign_empl/(native_empl + foreign_empl )
label variable fshare "Total"
label variable fshareLow "Low education"
label variable fshareMedium "Medium education"
label variable fshareHigh "High education"
label variable year "Year"

tsset year

* set graph scheme (graph query, schemes)
set scheme s2mono
graph twoway tsline fshare*, ytitle("Share of foreign born's") title("Immigrants share by education groups in Switzerland") caption("Source: Author's calculations on SAKE data from 1991 to 2011.")
graph export "immigrantsShareByEducation.eps", as(eps) preview(off) replace

use data1991_noDrop, clear
append using data2002_noDrop

drop if foreign == 0

collapse (sum) foreign_empl, by(year edu)

drop if edu == .

reshape wide foreign_empl, i(year) j(edu)
gen total = foreign_empl1 +foreign_empl2 + foreign_empl3
gen fshare1 = foreign_empl1/total
gen fshare2 = foreign_empl2/total
gen fshare3 = foreign_empl3/total

label variable fshare1 "Low education"
label variable fshare2 "Medium education"
label variable fshare3 "High education"

tsset year

graph twoway tsline fshare*, ytitle("Share of foreign born's") title("Immigrants by education in Switzerland") caption("Source: Author's calculations on SAKE data from 1991 to 2011.")
graph export "immigrantsByEducation.eps", as(eps) preview(off) replace
