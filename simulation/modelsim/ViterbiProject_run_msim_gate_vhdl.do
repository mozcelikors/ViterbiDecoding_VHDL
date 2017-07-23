transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {ViterbiProject_6_1200mv_85c_slow.vho}

vcom -93 -work work {C:/Users/Mustafa/Documents/AlteraQuartus/ViterbiProject/viterbi_system_tb.vhd}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /NA=ViterbiProject_6_1200mv_85c_vhd_slow.sdo -L altera -L cycloneiii -L gate_work -L work -voptargs="+acc"  viterbi_system_tb

add wave *
view structure
view signals
run -all
