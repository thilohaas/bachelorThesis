run "abilities.do"
run "master2002.do"

use master2002, clear
do "dataCleanup.do"
save data2002, replace

run "skillClean2002.do"
