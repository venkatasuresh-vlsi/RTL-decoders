module decoder_4x16 (
		input  wire [3:0] in,    
		input  wire       en,    
		output reg  [15:0] out  
	 );

	 always @(*) begin
		if (en) begin
			case (in)
				4'b0000: out = 16'b0000_0000_0000_0001;
				4'b0001: out = 16'b0000_0000_0000_0010;
				4'b0010: out = 16'b0000_0000_0000_0100;
				4'b0011: out = 16'b0000_0000_0000_1000;
				4'b0100: out = 16'b0000_0000_0001_0000;
				4'b0101: out = 16'b0000_0000_0010_0000;
				4'b0110: out = 16'b0000_0000_0100_0000;
				4'b0111: out = 16'b0000_0000_1000_0000;
				4'b1000: out = 16'b0000_0001_0000_0000;
				4'b1001: out = 16'b0000_0010_0000_0000;
				4'b1010: out = 16'b0000_0100_0000_0000;
				4'b1011: out = 16'b0000_1000_0000_0000;
				4'b1100: out = 16'b0001_0000_0000_0000;
				4'b1101: out = 16'b0010_0000_0000_0000;
				4'b1110: out = 16'b0100_0000_0000_0000;
				4'b1111: out = 16'b1000_0000_0000_0000;
				default: out = 16'b0000_0000_0000_0000;
			endcase
		end else begin
			out = 16'b0000_0000_0000_0000;
		end
	 end
	endmodule
