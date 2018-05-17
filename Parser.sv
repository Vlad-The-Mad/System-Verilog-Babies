module parser(
	input logic [15:0] data,
	output logic [3:0] ones,
	output logic [3:0] tens,
	output logic [3:0] hundreds,
	output logic [3:0] thousands,
	logic [15:0] comb_data
	);
always_comb
	begin
		comb_data = (data / 13107) * 1000;
		ones = comb_data % 10;
		tens = (comb_data / 10) % 10;
		hundreds = (comb_data / 100) % 10;
		thousands = (comb_data / 1000) % 10;
	end
	
	
endmodule 
