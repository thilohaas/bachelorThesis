use b015 b022 isu1 bfu5i_88 tbq2 bb04a  b0000  b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake1991, clear
sort b015
save 1991, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a  b0000  b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake1992, clear
sort b015
save 1992, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a  b0000  b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake1993, clear
sort b015
save 1993, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a  b0000  b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake1994, clear
sort b015
save 1994, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a  b0000  b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake1995, clear
sort b015
save 1995, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a  b0000  b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake1996, clear
sort b015
save 1996, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a  b0000  b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake1997, clear
sort b015
save 1997, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a  b0000  b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake1998, clear
sort b015
save 1998, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a  b0000  b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake1999, clear
sort b015
save 1999, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a  b0000  b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake2000, clear
sort b015
save 2000, replace

use b015 b022 isu1 bfu5i_88 tbq2 bb04a  b0000  b017 bb04a bb03a tek3 ixpxh is05 using ../SAKE/rohdaten_stata/sake2001, clear
sort b015
save 2001, replace


use 1991, clear
append using 1992
append using 1993
append using 1994
append using 1995
append using 1996
append using 1997
append using 1998
append using 1999
append using 2000
append using 2001

sort b015 b022

save master1991, replace


erase 1991.dta
erase 1992.dta
erase 1993.dta
erase 1994.dta
erase 1995.dta
erase 1996.dta
erase 1997.dta
erase 1998.dta
erase 1999.dta
erase 2000.dta
erase 2001.dta
