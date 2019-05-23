/*
 * This file was generated by the scsynth tool, and is available for use under
 * the MIT license. More information can be found at
 * https://github.com/arminalaghi/scsynth/
 */
module stochLFSR8bit(//Linear feedback shift register
	input [7:0] seed, //Initial value
	output [7:0] data, //Current value
	input enable, //When on, new state every clock cycle
	input restart, //Restart the LFSR at its seed state

	input reset,
	input clk
);

	reg [7:0] shift_reg;
	wire shift_in;

	always @(posedge clk or posedge reset) begin
		if (reset) shift_reg <= seed;
		else if (restart) shift_reg <= seed;
		else if (enable) shift_reg <= {shift_reg[6:0], shift_in};
	end


	wire xor_out;
	assign xor_out = shift_reg[7] ^ shift_reg[6] ^ shift_reg[5] ^ shift_reg[0];

	wire zero_detector;
	assign zero_detector = ~(|(shift_reg[6:0]));
	assign shift_in = xor_out ^ zero_detector;


	assign data = shift_reg;
endmodule
