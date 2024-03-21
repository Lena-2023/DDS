module form_wave (

input wire CLK,
input wire RESET,

/*output reg count_down = 1'b0,
input wire [31:0] ADDER,
output reg [31:0] DDS, */

 input wire [31:0] DDS, //***
input wire [2:0] form
);


always@(posedge CLK or posedge RESET)

// saw
case(form)
3'b000:                    
 begin
  if(RESET)
   DDS <= 0;
    else
   DDS <= DDS + ADDER;
 end

//reverse saw
3'b001:                   
 begin
  if(RESET)
   DDS <= 0;
    else
   DDS <= DDS - ADDER;
 end

//triangle
3'b010:                  
begin
if (count_down == 1'b0)
  begin
  if (DDS == 8'b01111111)
  begin
    count_down <= 1'b1;
    DDS <= DDS-ADDER;
  end
  else 
    DDS <= DDS+ADDER;
  end
else 
  begin
  if(DDS==8'b00000000)
  begin
    count_down <= 1'b0;
    DDS<=DDS+ADDER;
  end
  else 
    DDS <= DDS-ADDER;
  end
end 

//meander
3'b011:                      
 begin
  if(DDS == 8'b00111111)
   DDS <= 8'b00000001;
    else
   DDS <= 8'b00000000;
 end

//meander025
3'b100:                           
begin
  if(DDS == 8'b00100000)
   DDS <= 1;
    else
   DDS <= 0;
end

endcase   
endmodule
