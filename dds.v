module DDS( 
input wire CLK,
input wire RESET,
input wire [31:0] ADDER,
output reg [31:0]  DDS 

);

integer i;

initial begin
          DDS <= 32'd0;
          i = 50000000 / (16777216 / ADDER); 
         
           
end

always @ (posedge CLK) 

begin
  if(DDS == i)
   DDS <= 0;
    else
   DDS <= DDS + 1;
 end


endmodule
