######################################
#  Read in circuit s953 and synthesis
######################################

# Read the design
read_file -format verilog s953.v  
current_design s953 

# Add the design object(CLK) to the new design
create_clock "CLK" -period 10 -waveform {5 10}
set_fix_hold CLK

# To ensure that your clock network is preserved during subsequent optimizations.
set_dont_touch_network CLK

# compile
compile -exact_map

# Specify ATE timing
##############################################
set test_default_period 100
set test_default_strobe 40

#########################################
#  Scan Chain Insertion (one scan chain)
#########################################

# create scan enable, scan chain in/out ports
##############################################

# Add the design object(port) to the new design
create_port test_se
create_port -direction in {SCAN_IN_1}
create_port -direction out {SCAN_OUT_1}

# Setup the timing of scan clock
##################################
set_dft_signal -view existing_dft -type ScanClock -timing [ list 45 55] -port [find port "CLK"]

# Creat test protocol
######################
create_test_protocol -capture_procedure single_clock

# Check drc rule
#################
dft_drc -verbose
# -verbose : prints verbose message

# Specify the number of scan chains and the type of scan cell
##############################################################
set_scan_configuration -chain_count 1
# Specify the scan style : multiplexed_flip_flop, clocked_scan, lssd, aux_clock_lssd
set_scan_configuration -style multiplexed_flip_flop


# Specify the name of scan enable and the names of scan chain in/out ports
###########################################################################
set_dft_signal -view spec -port "SCAN_IN_1" -type ScanDataIn  
set_dft_signal -view spec -port "SCAN_OUT_1" -type ScanDataOut
set_dft_signal -view spec -port "test_se" -type ScanEnable -active_state 1

# Synthesis the circuit s953 by considering the scan insertion
##############################################################

# uses the scan replacement algorithm
compile -scan
# DFT Compiler stitches the scan registers to form a scan chain, similar to a serial shift register.
insert_dft

# Estimate the fault coverage of the scan-based design
########################################################
dft_drc -coverage_estimate
# apply the Verilog naming rules to all the design objects prior to writing out the design data files.
change_names -rule verilog -hierarchy

# Check if the scan-based design has errors/warnings or not
#############################################################
check_design

report_area -nosplit > s953_scan_area.log
# Using the -map_effort or -area_effort option of the compile command, you can direct 
# Design Compiler to put a medium, or high effort into area optimization. 
# Medium effort : Design Compiler does gate sizing and buffer and inverter cleanup.
# High effort : Design Compiler tries still more gate minimization strategies. The tool adds gate 
#               composition to the process and allocates more CPU time than medium effort
compile -map_effort medium -area_effort medium -incremental_mapping

# Save the block abstraction by using the write_file command.
write -hierarchy -format verilog -output s953_dft.v 
# After protocol is created, use write_test_protocol -output .spf to output a file.
# The format of the file is SPIL format. To be used for DRC in TetraMax.
write_test_protocol -output s953.spf  

exit