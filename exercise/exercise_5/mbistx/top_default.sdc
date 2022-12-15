
set sdc_version 2.0

set TOP top_default

set CLOCK_NAME_0 "top_default_MCK"
set CLOCK_PERIOD_0 100.0

set MAX_FANOUT 32

set MAX_TRANSITION [expr 0.08 * $CLOCK_PERIOD_0]
set RESET_NAME_0 "top_default_SRST"
set RESET_NAME_1 "top_default_RSTN"

set_max_fanout $MAX_FANOUT $TOP
set_max_transition $MAX_TRANSITION $TOP

create_clock -name $CLOCK_NAME_0 -period $CLOCK_PERIOD_0 \
             -waveform [list 0 [expr 0.5 * $CLOCK_PERIOD_0]] \
             [get_ports $CLOCK_NAME_0]

set_ideal_network $CLOCK_NAME_0
set_clock_latency 0 [get_clock $CLOCK_NAME_0]
set_clock_uncertainty 0.2 [get_clock $CLOCK_NAME_0]

set_ideal_network $RESET_NAME_0
set_ideal_network $RESET_NAME_1



set_max_area 0

