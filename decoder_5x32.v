module decoder_5x32 (
		input  wire [4:0] in,     
		input  wire       en,     
		output reg  [31:0] out    
	 );

	 always @(*) begin
		if (en) begin
			out = 32'b0;          
			out[in] = 1'b1;       
		end else begin
			out = 32'b0;           
		end
	 end
	endmodule
