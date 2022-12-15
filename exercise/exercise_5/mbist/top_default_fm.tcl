
# Modify variables to fit your own environment
set DB_LIST [list ""]
#set DWROOT [getenv SYNTHESIS]

# Define variable
set WORK_PATH "/home/user2/test22/test2225/exercise/exercise_5/mbist"
set TOP "top_default"
set RTL [list "/home/user2/test22/test2225/exercise/exercise_5/mbist/top_default.v" "/home/user2/test22/test2225/exercise/exercise_5/mbist/top_default_top.v"]
set NETLIST "${WORK_PATH}/${TOP}_netlist.v"

# Guidance
set synopsys_auto_setup true
set_svf ${WORK_PATH}/${TOP}.svf

#set hdlin_dwroot $DWROOT
set verification_verify_unread_compare_points true

# Reference
#read_db $DB_LIST
read_verilog -container r -libname WORK -01 $RTL
set_top r:/WORK/${TOP}

# Implementation
read_db $DB_LIST
read_verilog -container i -libname WORK -01 $NETLIST
set_top i:/WORK/${TOP}

# Setup

# Match
match

# Verify
verify


save_session ${WORK_PATH}/${TOP}_fm

unset DB_LIST
unset WORK_PATH
unset TOP
unset RTL
unset NETLIST

quit
