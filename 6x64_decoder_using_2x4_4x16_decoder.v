module decoder_2x4 (
     input en,
	 input [1:0] a,
	 output reg [3:0] y
	 );
	 always @(*) begin
	     y = 4'b0;
	     if(en)
		     y[a] = 1'b1;
		end
	endmodule

module decoder_4x16 (
     input en,
	 input [3:0] a,
	 output reg [15:0] y
	 );
	 always @(*) begin
	     y = 16'b0;
	     if(en)
		    y[a] = 1'b1;
		end
	endmodule
	
module decoder_6x64 (
     input en,
	 input [5:0] a, 
	 output [63:0] y
	 );
	 wire [3:0] first_en;
	 wire [15:0] final_stage[3:0];
	 
	 decoder_2x4 dec1 (
	     .en(en),
		 .a(a[5:4]),
		 .y(first_en)
		 );
	 genvar i;
	     generate 
		     for(i=0; i<4; i=i+1)begin
			     decoder_4x16 dec2 (
				    .en(first_en[i]),
					.a(a[3:0]),
					.y(final_stage[i])
					);
				end
			endgenerate
		assign y = {final_stage[3], final_stage[2], final_stage[1], final_stage[0]};
	endmodule