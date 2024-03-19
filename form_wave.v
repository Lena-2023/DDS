module form_wave (

input wire CLK,
input wire RESET,

output reg count_down = 1'b0,
input wire [31:0] ADDER,
output reg [31:0] DDS, 

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

//if (form == 3'b010)
3'b010:                  //triangle
begin
if (count_down == 1'b0)
begin
  if (DDS == 8'b01111111) // check for top of count
  begin
    count_down <= 1'b1;
    DDS <= DDS-ADDER; //or DDS-1
  end
  else 
    DDS <= DDS+ADDER; // or DDS+1
end
else 
begin
  if(DDS==8'b00000000) // check for bottom of count
   begin
    count_down <= 1'b0;
    DDS<=DDS+ADDER;   // or DDS+1
  end
  else 
    DDS <= DDS-ADDER; // or DDS-1
end
end 

//meander
//if (form == 3'b011)
3'b011:                      
 begin
  if(DDS == 8'b00111111)  // 8'b01111111
   DDS <= 8'b00000001;
    else
   DDS <= 8'b00000000;
 end


//if (form == 3'b100)
3'b100:                           //meander025
begin
  if(DDS == 8'b00100000) //8'b01000000
   DDS <= 1;
    else
   DDS <= 0;
 end

endcase  
//end  
endmodule