module testbenchmux();
logic select, line0, line1, out;

multiplexer MuxExample(
	.select(select), 
	.line0(line0),
	.line1(line1),
	.muxout(out));

initial begin
select = 0; line1 = 0; line0 = 0; #50
assert(out === 0) else $error("0s00failed");
line0 = 1; #50
if(out !== 1) $display("0s10failed");
line0 = 0; line1 = 1; #50
if(out !== 0) $display("0s01failed");
line0 = 1; line1 = 1; #50
if(out !== 1) $display("0s11failed");

select = 1; line0 = 0; line1 = 1; #50
if(out !== 1) $display("1s01failed");
line0 = 0; line1 = 0; #50
if(out !== 0) $display("1s00failed");
line0 = 1; line1 = 0; #50
if(out !== 0) $display("1s10failed");
line0 = 1; line1 = 0; #50
if(out !== 1) $display("1s11failed");

end


endmodule
