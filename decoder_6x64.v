module decoder_6x64 (
		input  wire [5:0] in,    
		input  wire       en,
		output reg  [63:0] out
	 );

	 always @(*) begin
		if (en) begin
			out = 64'b0;         
			out[in] = 1'b1;
		end else begin
			out = 64'b0;
		end
	 end
	endmodule
