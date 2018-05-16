module multiplexer (input logic select,
                    input logic [1:0] lines,
                    output logic muxout)
      always (select)
        if (select) muxout <= lines[1];
        else muxout <= lines[0];
      end
endmodule

module adder (input logic a, b,
              output logic c)
      always_comb
        c =  a + b;
endmodule

module register (input logic [7:0] input_bus,
                  input logic clk,
                  input logic reset,
                  output logic [7:0] output_bus)
      always_ff@(posege clk, reset)
          if (reset) output_bus <= 0;
          else output_bus <= input_bus;
      end
endmodule
