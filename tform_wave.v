module tform_wave;

reg CLK;
reg RESET;

reg [7:0] NOTE;
wire [31:0] ADDER;
wire [31:0] DDS;
reg [2:0] form;


initial NOTE = 8'd00000069;
initial form = 3'b000;

note2dds_1st_gen n2d(CLK, NOTE, ADDER);
DDS dds2(CLK, RESET, ADDER, DDS);
form_wave formw(CLK, RESET, count_down, ADDER, DDS, form);

initial
begin
    
    
    $dumpfile("bench.vcd");
    $dumpvars(0,tform_wave);    ///testbench);
    $display("starting testbench!!!!");
    
    $display("RESET CLK  NOTE      ADDER       DDS  form  count_down");

    $monitor(RESET,, CLK,, NOTE,, ADDER,,  DDS,, form,, count_down);
  
        CLK <= 0; 
        repeat (500000)  //500000
            
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