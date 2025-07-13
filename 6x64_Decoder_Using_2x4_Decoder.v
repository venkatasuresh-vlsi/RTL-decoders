module decoder_2x4 (
     input en,
	 input [1:0] a,
	 output reg [3:0] y
	 );
	 always @(*) begin
	     if(en)begin
		     case(a)
			     2'b00 : y = 4'b0001;
				 2'b01 : y = 4'b0010;
				 2'b10 : y = 4'b0100;
				 2'b11 : y = 4'b1000;
				 default : y = 4'b0000;
				endcase
			end
		 else
		     y = 4'b0000;
		end
	endmodule
module Decoder_6x64_Using_2x4_Decoder (
     input en,
	 input [5:0] a,
	 output [63:0] y
	 );
	 wire [3:0] first_en;
	 wire [3:0] mid_en[3:0];
	 wire [3:0] final_stage[3:0][3:0];
	 decoder_2x4 dec1 (
	     .en(en),
		 .a(a[5:4]),
		 .y(first_en)
		 );
	 genvar i, j;
	 generate 
	     for(i=0; i<4; i=i+1) begin
		     decoder_2x4 dec2 (
			     .en(first_en[i]),
				 .a(a[3:2]),
				 .y(mid_en[i])
				 );
		     for(j=0; j<4; j=j+1) begin
		         decoder_2x4 dec3 (
			         .en(mid_en[i][j]),
			    	 .a(a[1:0]),
				     .y(final_stage[i][j])
				     );
				end
			end
	    endgenerate
	 assign y = {final_stage[3][3], final_stage[3][2], final_stage[3][1], final_stage[3][0],
	             final_stage[2][3], final_stage[2][2], final_stage[2][1], final_stage[2][0],
				 final_stage[1][3], final_stage[1][2], final_stage[1][1], final_stage[1][0],
				 final_stage[0][3], final_stage[0][2], final_stage[0][1], final_stage[0][0]
				 };
	 endmodule
		     