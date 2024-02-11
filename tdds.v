module testbench;

reg CLK;
reg RESET;

wire [7:0] NOTE;
wire [31:0] ADDER;
wire [31:0]  DDS;

TOP TOP1(.CLK(CLK), .RESET(RESET), .NOTE(NOTE), .DDS(DDS));

initial
begin
    $dumpfile("bench.vcd");
    $dumpvars(0,testbench);

    $display("starting testbench!!!!");
    
    $display("RESET CLK ADDER NOTE       DDS");


    $monitor(RESET,, CLK,, ADDER,, NOTE,, DDS);
  
        CLK <= 0; 
        repeat (300) 
            
        begin
                #10;
                CLK <= 1;
                #10;
                CLK <= 0; 
        end


    $display("finished OK!");
    //$finish;
end

initial
begin
  RESET <= 1;
  #100;
  RESET <= 0;
end

endmodule
