* graph foreign born share from 1991-2011
use data1991, clear
append using data2002

*****

collapse (sum) foreign_empl native_empl, by(year)

gen fshare = foreign_empl/(native_empl + foreign_empl )

tsset year
label variable year "Year"
label variable fshare "Foreign born's share on total population"

graph twoway tsline fshare, title("Immigrants Share on Total Population in Switzerland")
graph export "immigrantsShare.eps", as(eps) preview(off) replace
