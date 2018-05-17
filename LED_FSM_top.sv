module LED_top_module( 
	/**************************/
	/* Set inputs and outputs */
	/* to the whole FPGA here */
	/**************************/
	input logic reset_n, //be sure to set this input to PullUp, or connect the pin to 3.3V
	input logic MISO,
	input logic adc_mod_reset,
	output logic [2:0] state,
	output logic [6:0] segment,
	output logic MOSI, adc_reset, SCK
	
	);
		/*******************************/
		/* Set internal variables here */
		/*******************************/
		logic clk;		//used for the oscillator's 2.08 MHz clock
		logic clk_slow;	//used for slowed down, 5 Hz clock
		logic [3:0] one;
		logic [3:0] ten;
		logic [3:0] hundred;
		logic [3:0] thousand;
		logic [3:0] muxz;
		logic [15:0] raw_data;
		
		
		
		/***********************/
		/* Define modules here */
		/***********************/
		//This is an instance of a special, built in module that accesses our chip's oscillator
		OSCH #("2.08") osc_int (	//"2.08" specifies the operating frequency, 2.08 MHz.
									//Other clock frequencies can be found in the MachX02's documentation
			.STDBY(1'b0),			//Specifies active state
			.OSC(clk),				//Outputs clock signal to 'clk' net
			.SEDSTDBY());			//Leaves SEDSTDBY pin unconnected
		
		
		//This module is instantiated from another file, 'Clock_Counter.sv'
		//It will take an input clock, slow it down based on parameters set inside of the module, and
		//output the new clock. Reset functionality is also built-in
		clock_counter counter_1(
			.clk_i(clk),
			.reset_n(reset_n),
			.clk_o(clk_slow));
			
		//This module is instantiated from another file, 'State_Machine.sv'
		//It contains a Moore state machine that will take a clock and reset, and output a state
		state_machine FSM_1(
			.clk_i(clk_slow),
			.reset_n(reset_n),
			.state(state));
			
		/*ADC*/
		adc volt_meter(
		//inputs
			.reset(adc_mod_reset),
			.clk_2Mhz(clk),
			.MISO(MISO),
			.adc_reset(adc_reset),
		//outputs to FPGA modules
			.raw_data(raw_data),
		//outputs to physical ADC
			.MOSI(MOSI),
			.SCK(SCK)
		);
		
		
			
		/************************************************/
		/* Add modules for:								*/
		/* Parser 		Determines the 1000's, 100's,   */
		/*				10's and 1's place of the number*/
		parser Parser_1(
			.data(raw_data),
			.ones(one),
			.tens(ten),
			.hundreds(hundred),
			.thousands(thousand)
		);
		/* Multiplexer	Determines which parser output  */
		/*				to pass to the decoder			*/
		mux Multiplexer(
			.i0(one),
			.i1(ten),
			.i2(hundred),
			.i3(thousand),
			.st(state),
			.z(muxz)
		);
		/* Decoder		Convert 4-bit binary to 7-seg   */
		/*				output for numbers 0-9			*/
		/************************************************/
		sevenseg Decoder(
			.data(muxz),
			.segments(segment)
		);
		
	
endmodule

