module mux(
	input logic [3:0] i0,
	input logic [3:0] i1,
	input logic [3:0] i2,
	input logic [3:0] i3,
	input logic [2:0] st,
	output logic [3:0] z

);
	always_comb
	begin
		case(st)
				0:	z = i0;
				1:	z = i1;
				3:	z = i2;
				4:	z = i3;
		endcase
	end
endmodule
