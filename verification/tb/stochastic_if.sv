interface stochastic_if (input logic clk, rst);

    logic z1_1;
    logic z2_1;
    logic z3_1;
    logic z4_1;
    logic z6_1;
    logic z7_1;
    logic z8_1;
    logic z9_1;
    logic z1_2;
    logic z2_2;
    logic z3_2;
    logic z4_2;
    logic z6_2;
    logic z7_2;
    logic z8_2;
    logic z9_2;
    logic r0;
    logic r1;
    logic r2;
    logic r3;
    logic r4;
    logic z;

    modport port(
        input   rst,
        input   clk,
        input   z1_1,
        input   z2_1,
        input   z3_1,
        input   z4_1,
        input   z6_1,
        input   z7_1,
        input   z8_1,
        input   z9_1,
        input   z1_2,
        input   z2_2,
        input   z3_2,
        input   z4_2,
        input   z6_2,
        input   z7_2,
        input   z8_2,
        input   z9_2,
        input   r0,
        input   r1,
        input   r2,
        input   r3,
        input   r4,
        output   z
    );
endinterface : stochastic_if