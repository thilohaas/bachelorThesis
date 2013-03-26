* Table A.1
use data1991_noDrop, clear
append using data2002_noDrop

**

keep if year == 1993 | year == 2002 | year == 2011
gen yeart = 1
replace yeart = 2 if year == 2002
replace yeart = 3 if year == 2011

drop if manual == .
drop if language == .

gen isco_tmp=substr(isco_str,1,2)

drop if isco_tmp == "-0"
drop if isco_tmp == "00"

encode isco_tmp, generate(isco_mayor)

tab edu, gen(eduGroup)

collapse (mean)year language manual eduGroup* (sum) native_howo foreign_howo native_empl foreign_empl, by(yeart isco_mayor)

gen fshare = foreign_empl/(native_empl + foreign_empl )

drop if fshare == .
drop if fshare == 0
drop if fshare == 1

tsset isco_mayor yeart

gen df = D.fshare/L.fshare

gen lastFshare = L.fshare
gen dFshare = D.fshare

gsort year -df

drop if df == .

export excel using "dataSorted.xls", firstrow(variables) replace
