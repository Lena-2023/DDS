iverilog -o qqq note2dds_1st_gen.v dds.v  tdds_3saw2.v
vvp qqq
gtkwave bench.vcd