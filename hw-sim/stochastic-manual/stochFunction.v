/*
 * This file was generated by the scsynth tool, and is available for use under
 * the MIT license. More information can be found at
 * https://github.com/arminalaghi/scsynth/
 */
module stochFunction( //the stochastic core of a Stochastic Function
	// In this case, stochFunction is a 3x3 Sobel filter
	// Independent copies of all pixels used in a 3x3 Sobel operation
	input z1_1,
	input z2_1,
	input z3_1,
	input z4_1,
	input z6_1,
	input z7_1,
	input z8_1,
	input z9_1,
	input z1_2,
	input z2_2,
	input z3_2,
	input z4_2,
	input z6_2,
	input z7_2,
	input z8_2,
	input z9_2,
	// Constants
	input r0,
	input r1,
	input r2,
	input r3,
	input r4,

	output z
);
	wire m1;
	wire m2;
	wire m3;
	wire m4;
	wire abs1;
	wire abs2;
	mux4 U1(.i1(z1_1),
			.i2(z2_1),
			.i3(z2_2),
			.i4(z3_1),
			.s1(r0),
			.s2(r1),
			.out(m1)
			);
	mux4 U2(.i1(z7_1),
			.i2(z8_1),
			.i3(z8_2),
			.i4(z9_1),
			.s1(r0),
			.s2(r1),
			.out(m2)
			);
	mux4 U3(.i1(z1_2),
			.i2(z4_1),
			.i3(z4_2),
			.i4(z7_2),
			.s1(r2),
			.s2(r3),
			.out(m3)
			);
	mux4 U4(.i1(z3_2),
			.i2(z6_1),
			.i3(z6_2),
			.i4(z9_2),
			.s1(r2),
			.s2(r3),
			.out(m4)
			);
	assign abs1 = m1^m2;
	assign abs2 = m3^m4;
	mux2 U5(.i1(abs1),
			.i2(abs2),
			.s1(r4),
			.out(z)
			);

endmodule