module testbenchmux();
logic select, [1:0] lines, out;

multiplexer MuxExample(select, lines, out);

initial begin
select = 0, lines[1] = 0, lines[0] = 0; #50
if(out !== 0) $display("0s00failed");
lines[0] = 1; #50
if(out !== 0) $display("0s10failed");
lines[0] = 0; lines[1] = 1; #50
if(out !== 0) $display("0s01failed");
lines[0] = 1; lines[1] = 1; #50
if(out !== 1) $display("0s11failed");

select = 1; lines[0] = 0; lines[1] = 1; #50
if(out !== 1) $display("1s01failed");
lines[0] = 0; lines[1] = 0; #50
if(out !== 0) $display("1s00failed");
lines[0] = 1; lines[1] = 0; #50
if(out !== 0) $display("1s10failed");
lines[0] = 1; lines[1] = 0; #50
if(out !== 1) $display("1s11failed");

end


endmodule
