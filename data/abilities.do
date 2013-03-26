use "../perisparber/Extraction/Abilities_occ1990", clear
run recodeOcc
drop occ1990

tostring isco, gen(isco_str) format("%04.0f")
drop isco
encode isco_str, generate(isco)

*** manual tasks***
** 19 VARIABLES ALL TOGETHER ***
gen manual=(1/19)*(im_a22+im_a23+im_a24+im_a25+im_a26+im_a27+im_a28+im_a29+im_a30+im_a31+im_a32+im_a33+im_a34+im_a35+im_a36+im_a37+im_a38+im_a39+im_a40)

**specific physical functions ****
gen limbs=(1/10)*(im_a22+im_a23+im_a24+im_a25+im_a26+im_a27+im_a28+im_a29+im_a30+im_a31)
gen strength=(1/5)*(im_a32+im_a33+im_a34+im_a35+im_a36)
gen body=(1/4)*(im_a37+im_a38+im_a39+im_a40)


**language tasks***
gen language=(1/4)*(im_a1+im_a2+im_a3+im_a4)
gen oral=(1/2)*(im_a1+im_a3)
gen written=(1/2)*(im_a2+im_a4)

**cognitive tasks ****
gen cognitive=(1/12)*(im_a5+im_a6+im_a7+im_a8+im_a9+im_a10+im_a11+im_a12+im_a13+im_a14+im_a15+im_a16)

**perception-focus tasks ***
gen perception=(1/5)*(im_a17+im_a18+im_a19+im_a20+im_a21)

*** visual tasks
gen visual=(1/7)*(im_a41+im_a42+im_a43+im_a44+im_a45+im_a46+im_a47)

**hearing tasks
gen hearing=(1/3)*(im_a48+im_a49+im_a50)

** vocal tasks
gen vocal=(1/2)*(im_a51+im_a52)

sort isco_str
save abilities, replace
