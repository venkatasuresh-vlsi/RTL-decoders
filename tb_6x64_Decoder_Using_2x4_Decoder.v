module tb;
        reg en;
		reg [5:0] a;
		wire [63:0] y;
		
		integer i;

		Decoder_6x64_Using_2x4_Decoder uut (
			.en(en),
			.a(a),
			.y(y)
		);

		initial begin
			$monitor("Time=%0t | a=%b | en=%b | y=%b", $time, a, en, y);
			en = 1;
			for (i=0; i<64; i=i+1) begin
			     a = i;
				 #10;
				end
			en = 0;
			#10;
			$finish;
		end
	endmodule
