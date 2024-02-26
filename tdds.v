module testbench;

reg CLK;
reg RESET;

reg [7:0] NOTE;
wire [31:0] ADDER;
wire [31:0]  DDS;

initial NOTE = 8'd00000069;

note2dds_1st_gen n2d(CLK, NOTE, ADDER);
DDS dds2(CLK, RESET, ADDER, DDS);

initial
begin
    
    
    $dumpfile("bench.vcd");
    $dumpvars(0,testbench);

    $display("starting testbench!!!!");
    
    $display("RESET CLK  NOTE      ADDER       DDS");


    $monitor(RESET,, CLK,, NOTE,, ADDER,,  DDS);
  
        CLK <= 0; 
        repeat (500000)  
            
        begin
                #10;
                CLK <= 1;
                #10;
                CLK <= 0; 
        end
           

    $display("finished OK!");
    
end

initial
begin
  RESET <= 1;
  #100;
  RESET <= 0;
end

endmodule