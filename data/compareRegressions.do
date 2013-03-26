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

** dummies
tab region, gen (st)
tab year, gen(y)

gen share_fb=foreign_howo/(foreign_howo+native_howo)
gen employment=(foreign_empl+native_empl)

***  variable definitions for the regressions****
gen lnrelative_basic=ln(language/manual)
gen lnlanguage_basic=ln(language)
gen lnmanual_basic=ln(manual)

gen lnrelative_extended3=ln((language)/((manual+perception+visual+hearing)/4))
gen lnlanguage_extended3=ln(language)
gen lnmanual_extended3=ln((manual+perception+visual+hearing)/4)


**2SLS

* with cantons
quietly reg lnrelative_basic share_fb after2002 st2-st3 y* [aweight=employment], robust cluster (canton)
estimates store Relative
quietly reg lnlanguage_basic share_fb after2002 st2-st3 y* [aweight=employment], robust cluster (canton)
estimates store Language
quietly reg lnmanual_basic share_fb after2002 st2-st3 y* [aweight=employment], robust cluster (canton)
estimates store Manual

estimates tab Relative Language Manual, star
estout Relative Language Manual using regressWithRegionsAllTime.tex, style(tex) replace cells(b(star) se(par fmt(2))) stats(r2 N vce) title("Foreign Born Workers and the Native Supply of Tasks with Canton Dummies")

* without regions
quietly reg lnrelative_basic share_fb after2002 y* [aweight=employment], robust cluster (canton)
estimates store Relative2
quietly reg lnlanguage_basic share_fb after2002 y* [aweight=employment], robust cluster (canton)
estimates store Language2
quietly reg lnmanual_basic share_fb after2002 y* [aweight=employment], robust cluster (canton)
estimates store Manual2

estimates tab Relative2 Language2 Manual2, star
estout Relative2 Language2 Manual2 using regressWithoutRegionsAllTime.tex, style(tex) replace cells(b(star) se(par fmt(2))) stats(r2 N vce) title("Foreign Born Workers and the Native Supply of Tasks")


erase data1991WithSkills.dta
erase data2002WithSkills.dta
