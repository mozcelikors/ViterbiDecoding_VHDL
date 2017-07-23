transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Mustafa/Documents/AlteraQuartus/ViterbiProject/ViterbiDecoder.vhd}
vcom -93 -work work {C:/Users/Mustafa/Documents/AlteraQuartus/ViterbiProject/ViterbiEncoder.vhd}
vcom -93 -work work {C:/Users/Mustafa/Documents/AlteraQuartus/ViterbiProject/ViterbiSystem.vhd}

vcom -93 -work work {C:/Users/Mustafa/Documents/AlteraQuartus/ViterbiProject/viterbi_system_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  viterbi_system_tb

add wave *
view structure
view signals
run -all
