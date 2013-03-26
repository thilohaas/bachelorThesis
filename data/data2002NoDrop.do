run "abilities.do"
run "master2002.do"

use master2002, clear
do "dataCleanupNoDrop.do"
save data2002_noDrop, replace

run "skillClean2002NoDrop.do"
