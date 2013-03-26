run "abilities.do"
run "master1991.do"

use master1991, clear
do "dataCleanup.do"

save data1991, replace

run "skillClean1991.do"
