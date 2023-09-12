module full_adder_behavioral_module (
	input a, b, cin,
	output reg sum, cout
	);

	always@(a or b or cin)
	begin
		{cout, sum} <= a + b + cin;
	end

endmodule