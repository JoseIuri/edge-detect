module stochastic_wrapper (stochastic_if bus);


    stochastic stochastic_sv (
        .rst(bus.rst),
        .clk(bus.clk),
        .z1_1(bus.z1_1),
        .z2_1(bus.z2_1),
        .z3_1(bus.z3_1),
        .z4_1(bus.z4_1),
        .z6_1(bus.z6_1),
        .z7_1(bus.z7_1),
        .z8_1(bus.z8_1),
        .z9_1(bus.z9_1),
        .z1_2(bus.z1_2),
        .z2_2(bus.z2_2),
        .z3_2(bus.z3_2),
        .z4_2(bus.z4_2),
        .z6_2(bus.z6_2),
        .z7_2(bus.z7_2),
        .z8_2(bus.z8_2),
        .z9_2(bus.z9_2),
        .r0(bus.r0),
        .r1(bus.r1),
        .r2(bus.r2),
        .r3(bus.r3),
        .r4(bus.r4),
        .z(bus.z));

endmodule