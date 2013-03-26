use data1991, clear

egen region = cut(canton), at(1,21,22,28)

collapse (sum) foreign_empl native_empl foreign_howo native_howo (mean)region, by(canton year)

sort year canton

merge year canton using ONET_1991_2001_clean
tab _merge
drop if _merge != 3
drop _merge

sort year canton

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
quietly reg lnrelative_basic share_fb st2-st3 y2-y11 [aweight=employment], robust cluster (canton)
estimates store Relative
quietly reg lnlanguage_basic share_fb st2-st3 y2-y11 [aweight=employment], robust cluster (canton)
estimates store Language
quietly reg lnmanual_basic share_fb st2-st3 y2-y11 [aweight=employment], robust cluster (canton)
estimates store Manual

estimates tab Relative Language Manual, star
estout Relative Language Manual using regressWithRegions1991.tex, style(tex) replace cells(b(star) se(par fmt(2))) stats(r2 N vce) title("1991-2000 Foreign Born Workers and the Native Supply of Tasks with Canton Dummies")


* without regions
quietly reg lnrelative_basic share_fb y2-y11 [aweight=employment], robust cluster (canton)
estimates store Relative2
quietly reg lnlanguage_basic share_fb y2-y11 [aweight=employment], robust cluster (canton)
estimates store Language2
quietly reg lnmanual_basic share_fb y2-y11 [aweight=employment], robust cluster (canton)
estimates store Manual2

estimates tab Relative2 Language2 Manual2, star
estout Relative2 Language2 Manual2 using regressWithoutRegions1991.tex, style(tex) replace cells(b(star) se(par fmt(2))) stats(r2 N vce) title("1991-2000 Foreign Born Workers and the Native Supply of Tasks")
