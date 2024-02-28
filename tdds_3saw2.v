module testbench;

reg CLK;
reg RESET;

reg [7:0] NOTE_57_220;
reg [7:0] NOTE_69_440 ;
reg [7:0] NOTE_81_880;


wire [31:0] ADDER_57_220;
wire [31:0] ADDER_69_440;
wire [31:0] ADDER_81_880;

wire [31:0]  DDS_57_220;
wire [31:0]  DDS_69_440;
wire [31:0]  DDS_81_880;

initial NOTE_69_440 = 8'd00000069;
initial NOTE_57_220 = 8'd00000057;
initial NOTE_81_880 = 8'd00000081;

note2dds_1st_gen note57_220(CLK, NOTE_57_220, ADDER_57_220);
note2dds_1st_gen note69_440(CLK, NOTE_69_440, ADDER_69_440);
note2dds_1st_gen note81_880(CLK, NOTE_81_880, ADDER_81_880);

DDS dds_69_440(CLK, RESET, ADDER_69_440 , DDS_69_440 ); 
DDS dds_57_220(CLK, RESET, ADDER_57_220, DDS_57_220);
DDS dds2(CLK, RESET, ADDER_81_880, DDS_81_880);  

initial
begin
        
    $dumpfile("bench.vcd");
    $dumpvars(0,testbench);
    $display("starting testbench!!!!");
    
    $display("RESET CLK NOTE DDS_57_220 DDS_69_440 DDS_81_880);

    $monitor(RESET,, CLK,, DDS_57_220,,  DDS_69_440,, DDS_81_880);
  
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