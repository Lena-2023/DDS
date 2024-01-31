module counter( 
    
    input wire clk,
    input wire reset,

    //saw
    output reg [7:0] saw,

    //reverse saw
    output reg [7:0] revsaw,

    //triangle
    output reg [7:0] triangl = 8'h00,  
    output reg count_down = 1'b0,

    //meabder
    output reg [7:0] meander,

    //0.25 meander  
    output reg [7:0] meander025
);

 always@(posedge clk or posedge reset)

begin

//saw
 begin
  if(reset)
   saw <= 0;
    else
   saw <= saw + 1;
 end


//reverse saw
 begin
  if(reset)
   revsaw <= 0;
    else
   revsaw <= revsaw - 1;
 end

//triangle
begin
if (count_down == 1'b0)
begin
  if (triangl == 8'b01111111) // check for top of count
  begin
    count_down <= 1'b1;
    triangl <= triangl-1;
  end
  else 
    triangl<=triangl+1; 
end
else 
begin
  if(triangl==8'b00000000) // check for bottom of count
   begin
    count_down <= 1'b0;
    triangl<=triangl+1;
  end
  else 
    triangl <= triangl-1; 
end
end 

//meander
//меандр - там просто если больше 127 , то 1, если меньше - 0
//а если больше 64 1, а меньше - 0 , то будет заполнение на 25%
//ну там на выход надо генерить из пилы, но по условию. тупо один if
 begin
  if(triangl <= 8'b00111111)  // 8'b01111111
   meander <= 1;
    else
   meander <= 0;
 end

//meander025
begin
  if(triangl <= 8'b00100000) //8'b01000000
   meander025 <= 1;
    else
   meander025 <= 0;
 end
end  
endmodule

module note2dds_1st_gen(CLK, NOTE, ADDER);			
			
input wire CLK;			
input wire [6:0] NOTE;			
output reg [31:0] ADDER;			
			
initial begin			
	ADDER <= 32'd0;		
end			
			
always @ (posedge CLK) begin			
	case(NOTE)		
		7'd0100: ADDER <= 32'd0884;	
		7'd0101: ADDER <= 32'd0937;	
		7'd0102: ADDER <= 32'd0993;	
		//#ССЫЛ!	
	endcase		
end			
			
endmodule	




