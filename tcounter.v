module testbench();

reg clk;
reg reset;

wire [7:0] triangl;
wire [7:0] saw;
wire [7:0] revsaw;
wire [7:0] meander;
wire [7:0] meander025;



wire CLK;			
wire [6:0] NOTE;			
wire  [31:0] ADDER;

counter cnt(.clk(clk), .reset(reset), .saw(saw), .revsaw(revsaw), .triangl(triangl), .meander(meander), .meander025(meander025));

note2dds_1st_gen note2dds(.CLK(CLK), .NOTE(NOTE), .ADDER(ADDER));


initial
begin
    $dumpfile("bench.vcd");
    $dumpvars(0,testbench);

    $display("starting testbench!!!!");
    
    $monitor(saw,, revsaw,, triangl,, meander,, meander025,, NOTE,, ADDER); //reset,, clk,, CLC,,???
  
        clk <= 0; 
        repeat (3000) 
            
        begin
                #10;
                clk <= 1;
                #10;
                clk <= 0; 
        end


    $display("finished OK!");
    //$finish;
end

initial
begin
  reset <= 1;
  #100;
  reset <= 0;
end

endmodule