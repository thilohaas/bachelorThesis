*** first do the individual regressions controlling for experience, education, race and gender ***

reg manual exp1-exp20 exp22-exp45 female HS* nationality* [aweight=howo], robust
predict manual_clean, resid
replace manual=manual_clean+_b[_cons]

reg language exp1-exp20 exp22-exp45 female HS* nationality* [aweight=howo], robust
predict language_clean, resid
replace language=language_clean+_b[_cons]

reg limbs exp1-exp20 exp22-exp45 female HS* nationality* [aweight=howo], robust
predict limbs_clean, resid
replace limbs=limbs_clean+_b[_cons]

reg strength exp1-exp20 exp22-exp45 female HS* nationality* [aweight=howo], robust
predict strength_clean, resid
replace strength=strength_clean+_b[_cons]

reg body exp1-exp20 exp22-exp45 female HS* nationality* [aweight=howo], robust
predict body_clean, resid
replace body=body_clean+_b[_cons]

reg oral exp1-exp20 exp22-exp45 female HS* nationality* [aweight=howo], robust
predict oral_clean, resid
replace oral=oral_clean+_b[_cons]

reg written exp1-exp20 exp22-exp45 female HS* nationality* [aweight=howo], robust
predict written_clean, resid
replace written=written_clean+_b[_cons]

reg cognitive exp1-exp20 exp22-exp45 female HS* nationality* [aweight=howo], robust
predict cognitive_clean, resid
replace cognitive=cognitive_clean+_b[_cons]

reg perception exp1-exp20 exp22-exp45 female HS* nationality* [aweight=howo], robust
predict perception_clean, resid
replace perception=perception_clean+_b[_cons]

reg visual exp1-exp20 exp22-exp45 female HS* nationality* [aweight=howo], robust
predict visual_clean, resid
replace visual=visual_clean+_b[_cons]

reg hearing exp1-exp20 exp22-exp45 female HS* nationality* [aweight=howo], robust
predict hearing_clean, resid
replace hearing=hearing_clean+_b[_cons]

reg vocal exp1-exp20 exp22-exp45 female HS* nationality* [aweight=howo], robust
predict vocal_clean, resid
replace vocal=vocal_clean+_b[_cons]


/*** then take the average by state.
This is identical (I did it) to taking the state-year specific coefficient from the regression **/

sort canton
collapse (mean) manual limbs strength body language oral written cognitive perception visual hearing vocal year [aw=howo], by(canton)
