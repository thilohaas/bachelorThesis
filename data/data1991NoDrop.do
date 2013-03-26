run "abilities.do"
run "master1991.do"

use master1991, clear
do "dataCleanupNoDrop.do"

save data1991_noDrop, replace

run "skillClean1991NoDrop.do"
