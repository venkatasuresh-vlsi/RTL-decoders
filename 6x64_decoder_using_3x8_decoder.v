module decoder_3x8 (
     input en,
	 input [2:0] a,
	 output reg [7:0] y
	 );
	 always @(*) begin
	     y = 8'b0;
	     if(en)
		    y[a] = 1'b1;
		end
	endmodule
	
module decoder_6x64 (
     input en,
	 input [5:0] a,
	 output [63:0] y
	 );
	 wire [7:0] first_en;
	 wire [7:0] final_stage[7:0];
	 
	 decoder_3x8 dec1 (
	     .en(en),
		 .a(a[5:3]),
		 .y(first_en)
		 );
	 genvar i;
	 generate
	     for(i=0; i<8; i=i+1)begin
		     decoder_3x8 dec2 (
			     .en(first_en[i]),
				 .a(a[2:0]),
				 .y(final_stage[i])
				);
			end
		endgenerate
	 assign y = {final_stage[7], final_stage[6], final_stage[5], final_stage[4],
            	 final_stage[3], final_stage[2], final_stage[1], final_stage[0]
				 };
	endmodule