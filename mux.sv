module multiplexer (input logic select,
                    input logic line0, line1,
                    output logic muxout);
      always 
        if (select) muxout = line1;
        else muxout = line0;
endmodule

//module adder (input logic a, b,
 //             output logic c)
 //     always_comb
 //       c =  a + b;
//endmodule

//module register (input logic [7:0] input_bus,
//                  input logic clk,
//                  input logic reset,
//                  output logic [7:0] output_bus)
//      always_ff@(posege clk, reset)
//          if (reset) output_bus <= 0;
//          else output_bus <= input_bus;
//      end
//endmodule
