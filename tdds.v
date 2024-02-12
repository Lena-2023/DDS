module testbench;

reg CLK;
reg RESET;

reg [7:0] NOTE;
wire [31:0] ADDER;
wire [31:0]  DDS;

initial NOTE = 8'd00000000;

note2dds_1st_gen n2d(CLK, NOTE, ADDER);
DDS dds2(CLK, RESET, ADDER, DDS);

integer i;

initial
begin
    
    
    $dumpfile("bench.vcd");
    $dumpvars(0,testbench);

    $display("starting testbench!!!!");
    
    $display("RESET CLK NOTE ADDER       DDS");


    $monitor(RESET,, CLK,, NOTE,, ADDER,,  DDS);
  
        CLK <= 0; 
        repeat (300) 
            
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
                for (i=0;  i < 168; i = i  + 1) 
                  begin
                    #10
                    NOTE <= NOTE + 8'd01;
                  end
        end

initial
begin
  RESET <= 1;
  #100;
  RESET <= 0;
end

endmodule