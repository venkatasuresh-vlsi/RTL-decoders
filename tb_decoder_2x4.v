module tb_decoder_2x4;
		reg [1:0] in;
		reg en;
		wire [3:0] out;
		
		integer i;

		decoder_2x4 uut (
			.in(in),
			.en(en),
			.out(out)
		);

		initial begin
			$monitor("Time=%0t | in=%b | en=%b | out=%b", $time, in, en, out);
			en = 1;
			for (i=0; i<4; i=i+1) begin
			     in = i;
				 #10;
				end
			en = 0;
			#10;
			$finish;
		end

	endmodule
