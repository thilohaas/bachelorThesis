* convert isco88 into string variable to be able to merge it later
tostring bfu5i_88, gen(isco_str) format("%04.0f")
drop bfu5i_88
encode isco_str, generate(isco)

label drop isco
label variable isco `"isco88 groups"'

* renaming education, weight and canton variables
rename tbq2 edu
rename ixpxh weight
rename b017 canton
rename b022 year
rename bb04a gender

*egen regions=cut(canton), at(1,3,7,8)
*drop canton
*rename regions canton



* only 18-64 year olds
drop if bb03a < 18
drop if bb03a > 64
rename bb03a age

* select only people with positive amount of hours worked
drop if tek3 > 5
rename tek hrsweek

generate hours = 4.5*(hrsweek==1) + 15*(hrsweek==2) + 25*(hrsweek==3) + 35*(hrsweek==4) + 42*(hrsweek==5)
generate howo = weight*hours


* foreign flag
generate byte foreign = 0
replace foreign = 1 if isu1 == 1

gen foreign_howo = howo*foreign
gen native_howo = howo*(1-foreign)

gen foreign_empl = foreign*weight
gen native_empl = (1-foreign)*weight

count if weight==.
count if weight==0
drop if weight==.
drop if weight==0

* merge abilities using the isco string
sort isco_str
merge isco_str using abilities
tab _merge
drop _merge

*** aggregate supply of tasks by natives and immigrants

gen manual_f=foreign_howo*manual
gen manual_n=native_howo*manual
gen limbs_f=foreign_howo*limbs
gen limbs_n=native_howo*limbs
gen strength_f=foreign_howo*strength
gen strength_n=native_howo*strength
gen body_f=foreign_howo*body
gen body_n=native_howo*body

gen language_f=foreign_howo*language
gen language_n=native_howo*language
gen oral_f=foreign_howo*oral
gen oral_n=native_howo*oral
gen written_f=foreign_howo*written
gen written_n=native_howo*written

gen cognitive_f=foreign_howo*cognitive
gen cognitive_n=native_howo*cognitive
gen perception_f=foreign_howo*perception
gen perception_n=native_howo*perception
gen visual_f=foreign_howo*visual
gen visual_n=native_howo*visual
gen hearing_f=foreign_howo*hearing
gen hearing_n=native_howo*hearing
gen vocal_f=foreign_howo*vocal
gen vocal_n=native_howo*vocal



sort canton
