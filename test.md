iverilog -o qqq note2dds.v dds.v  tdds.v
vvp qqq
gtkwave bench.vcd