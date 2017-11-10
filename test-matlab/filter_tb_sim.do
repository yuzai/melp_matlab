onbreak resume
onerror resume
vsim -novopt work.filter_tb
add wave sim:/filter_tb/u_filter_serial/clk
add wave sim:/filter_tb/u_filter_serial/clk_enable
add wave sim:/filter_tb/u_filter_serial/reset
add wave sim:/filter_tb/u_filter_serial/filter_in
add wave sim:/filter_tb/u_filter_serial/filter_out
add wave sim:/filter_tb/filter_out_ref
run -all
