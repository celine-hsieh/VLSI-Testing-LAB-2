
#/* define variable */
set WORK_PATH /home/user2/test22/test2225/exercise/exercise_5/mbistcp
set TOP top

read_verilog "/home/user2/test22/test2225/exercise/exercise_5/mbistcp/top_INS_f.v"
read_verilog "/home/user2/test22/test2225/exercise/exercise_5/mbistcp/top_default.v"

current_design $TOP

source top_default.tcl

set verilogout_no_tri true
set verilogout_equation false
set bus_inference_style {%s[%d]}
set bus_naming_style {%s[%d]}
set hdlout_internal_busses true
change_names -rule verilog -hier
define_name_rules name_rule -allowed "a-z A-Z 0-9 _" -max_length 255 -type cell
define_name_rules name_rule -allowed "a-z A-Z 0-9 _[]" -max_length 255 -type net
define_name_rules name_rule -map {{"\\*cell\\*" "cell"}}
define_name_rules name_rule -case_insensitive
change_names -hierarchy -rules name_rule
remove_unconnected_ports [get_cells -h * ]

set TOP top
current_design $TOP
#/*************** Write out your design and timing **************/
write -f ddc -o [format "%s%s"  [format "%s%s"  "${WORK_PATH}/" $TOP] ".ddc"] -no_implicit -hier
write_sdf -version 1.0 -context verilog -load_delay net ${WORK_PATH}/${TOP}_netlist.sdf
write -f verilog -o ${WORK_PATH}/${TOP}_netlist.v -no_implicit -hier
write_sdc ${WORK_PATH}/${TOP}_netlist.sdc

exit
