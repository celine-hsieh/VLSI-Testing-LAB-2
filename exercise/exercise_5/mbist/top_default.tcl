
set_svf top_default.svf

#/* define variable */
set WORK_PATH /home/user2/test22/test2225/exercise/exercise_5/mbist
set TOP top_default
set RTL [list "/home/user2/test22/test2225/exercise/exercise_5/mbist/top_default.v" "/home/user2/test22/test2225/exercise/exercise_5/mbist/top_default_top.v"]
set SDC "/home/user2/test22/test2225/exercise/exercise_5/mbist/top_default.sdc"

set DC_SHELL_STATUS [ read_file -format verilog $RTL]
if { $DC_SHELL_STATUS == "" } {
   echo [concat {** Error ** File $RTL not found}]
   quit
}
sh rm -rf ./MMP
sh mkdir  ./MMP
define_design_lib MMP  -path ./MMP
analyze -library MMP -format verilog $RTL

elaborate $TOP -architecture verilog -library MMP

current_design $TOP

read_sdc -version Latest $SDC

link
uniquify

set verilogout_show_unconnected_pins TRUE

current_design $TOP


set_fix_multiple_port_nets -all -buffer_constants
set_fix_multiple_port_nets -feedthroughs

#compile -map_effort high
compile_ultra -timing_high_effort_script -no_seq_output_inversion -no_autoungroup -no_boundary_optimization

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
#remove_unconnected_ports [get_cells -h * ]


#/*************** Write out your design and timing **************/
write -f ddc -o [format "%s%s"  [format "%s%s"  "${WORK_PATH}/" $TOP] ".ddc"] -no_implicit -hier
write_sdf -version 1.0 -context verilog -load_delay net ${WORK_PATH}/${TOP}_netlist.sdf
write -f verilog -o ${WORK_PATH}/${TOP}_netlist.v -no_implicit -hier
write_sdc ${WORK_PATH}/${TOP}_netlist.sdc

#/*************** worst case timing report *******************/
redirect ${WORK_PATH}/REPORT/${TOP}_maxtiming.rpt { report_timing -nets -delay max -max_paths 5 -transition_time -nosplit }

redirect ${WORK_PATH}/REPORT/${TOP}_mintiming.rpt { report_timing -nets -delay min -max_paths 5 -transition_time -nosplit }

redirect ${WORK_PATH}/REPORT/${TOP}_looptim.rpt { report_timing -loops -max_paths 5 }
#/******************** area report *******************/
redirect ${WORK_PATH}/REPORT/${TOP}_area.rpt { report_area -hier }

redirect -append ${WORK_PATH}/REPORT/${TOP}_area.rpt { report_reference }

redirect ${WORK_PATH}/REPORT/${TOP}_power.rpt {report_power}

redirect ${WORK_PATH}/REPORT/${TOP}_qor.rpt {report_qor}
#/******************** write_script *******************/
write_script -output ${WORK_PATH}/REPORT/${TOP}_scrip.rpt

#/******************** all violation *****************/
redirect ${WORK_PATH}/REPORT/${TOP}_constraint.rpt { report_constraint -all_violators -verbose -nosplit }

#/******************** check_design *****************/
#redirect ${WORK_PATH}/REPORT/${TOP}_check_design.rpt { check_design }

#/******************** check_test *****************/
#redirect ${WORK_PATH}/REPORT/${TOP}_check_test.rpt { check_design }

#/******************** check_timing *****************/
#redirect ${WORK_PATH}/REPORT/${TOP}_check_timing.rpt { check_timing }

exit
