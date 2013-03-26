use b015 b022 isu1 bfu5i_88 tbq2 bb04a age64 b0000 b023 b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake2002, clear
sort b015
save 2002, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a age64 b0000 b023 b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake2003, clear
sort b015
save 2003, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a age64 b0000 b023 b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake2004, clear
sort b015
save 2004, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a age64 b0000 b023 b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake2005, clear
sort b015
save 2005, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a age64 b0000 b023 b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake2006, clear
sort b015
save 2006, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a age64 b0000 b023 b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake2007, clear
sort b015
save 2007, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a age64 b0000 b023 b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake2008, clear
sort b015
save 2008, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a age64 b0000 b023 b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake2009, clear
sort b015
save 2009, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a age64 b0000 b023 b017 bb04a bb03a tek3 ixpxhj is05 using ../SAKE/rohdaten_stata/sake2010, clear
sort b015
rename ixpxhj ixpxh
save 2010, replace

use B015 B022 ISU1 BFU5I_88 TBQ2 BB04A AGE64 B0000 B023 B017 BB04A BB03A TEK3 IXPXHJ IS05 using ../SAKE/rohdaten_stata/sake2011, clear
rename _all, lower
rename ixpxhj ixpxh
sort b015
save 2011, replace

use 2002, clear
append using 2003
append using 2004
append using 2005
append using 2006
append using 2007
append using 2008
append using 2009
append using 2010
append using 2011

sort b015 b022

save master2002, replace

erase 2002.dta
erase 2003.dta
erase 2004.dta
erase 2005.dta
erase 2006.dta
erase 2007.dta
erase 2008.dta
erase 2009.dta
erase 2010.dta
erase 2011.dta
