iverilog -o qqq note2dds_1st_gen.v dds.v  tdds.v
vvp qqq
gtkwave bench.vcd