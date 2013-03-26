do regress2002

label variable lnrelative_basic "ln(C/M)"
label variable lnlanguage_basic "ln(c)"
label variable lnmanual_basic "ln(m)"
label variable share_fb "Foreign born's share"

graph twoway (scatter lnrelative_basic share_fb) (lfit lnrelative_basic share_fb ), ytitle("Relative Communication-Manual Tasks Intensity", margin(medium)) title("Immigrant Share and Relative" "Communication-Manual Tasks Intensity") caption("Source: Author's calculations on O*NET and SAKE data from 2002 to 2011.") legend(off)
graph export "immigrantsRelativeBasic.eps", as(eps) preview(off) replace

graph twoway (scatter lnlanguage_basic share_fb) (lfit lnlanguage_basic share_fb ), ytitle("Communication Tasks Intensity", margin(medium)) title("Immigrant Share and Communication Tasks Intensity") caption("Source: Author's calculations on O*NET and SAKE data from 2002 to 2011.") legend(off)
graph export "immigrantsLanguageBasic.eps", as(eps) preview(off) replace

graph twoway (scatter lnmanual_basic share_fb) (lfit lnmanual_basic share_fb ), ytitle("Manual Tasks Intensity", margin(medium)) title("Immigrant Share and Manual Tasks Intensity") caption("Source: Author's calculations on O*NET and SAKE data from 2002 to 2011.") legend(off)
graph export "immigrantsManualBasic.eps", as(eps) preview(off) replace
