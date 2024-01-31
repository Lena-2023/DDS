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
		#ССЫЛ!	
	endcase		
end			
			
endmodule			
			