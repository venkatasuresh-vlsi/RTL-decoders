module tb_decoder_4x16;
		reg [3:0] in;
		reg en;
		wire [15:0] out;
		
		integer i;

		decoder_4x16 uut (
			.in(in),
			.en(en),
			.out(out)
		);

		initial begin
			$monitor("Time=%0t | in=%b | en=%b | out=%b", $time, in, en, out);
			en = 1;
			for (i=0; i<16; i=i+1) begin
			     in = i;
				 #10;
				end
			en = 0;
			#10;
			$finish;
		end

	endmodule
