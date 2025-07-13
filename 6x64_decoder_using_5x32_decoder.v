module decoder_5x32 (
     input en,
	 input [4:0] a,
	 output reg [31:0] y
	 );
	 always @(*) begin
	     y = 32'b0;
	     if(en)
	        y[a] = 1'b1;
		end
	endmodule
	
module decoder_6x64 (
     input en,
	 input [5:0] a,
	 output [63:0] y
	 );
	 wire [31:0] lowerbit, higherbit;
	 
	 decoder_5x32 dec1 (
	     .en(en & ~a[5]),
		 .a(a[4:0]),
		 .y(lowerbit)
		 );
	 decoder_5x32 dec2 (
	     .en(en & a[5]),
		 .a(a[4:0]),
		 .y(higherbit)
		 );
	 assign y = {higherbit, lowerbit};
	endmodule
	 