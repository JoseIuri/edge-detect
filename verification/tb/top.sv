module top;
    import uvm_pkg::*;
    import stochastic_pkg::*;
    logic clk;
    logic reset;
    parameter min_cover = 70;
    parameter min_transa = 2000;

    initial begin
    clk = 0;
    reset = 1;
    #22 reset = 0;
    #1  reset = 1;
    end

    always #5 clk = !clk;

    stochastic_if stochastic_vif (.clk(clk), .rst(reset));

    stochFunction DUT (
        .z1_1(stochastic_vif.z1_1),
        .z2_1(stochastic_vif.z2_1),
        .z3_1(stochastic_vif.z3_1),
        .z4_1(stochastic_vif.z4_1),
        .z6_1(stochastic_vif.z6_1),
        .z7_1(stochastic_vif.z7_1),
        .z8_1(stochastic_vif.z8_1),
        .z9_1(stochastic_vif.z9_1),
        .z1_2(stochastic_vif.z1_2),
        .z2_2(stochastic_vif.z2_2),
        .z3_2(stochastic_vif.z3_2),
        .z4_2(stochastic_vif.z4_2),
        .z6_2(stochastic_vif.z6_2),
        .z7_2(stochastic_vif.z7_2),
        .z8_2(stochastic_vif.z8_2),
        .z9_2(stochastic_vif.z9_2),
        .r0(stochastic_vif.r0),
        .r1(stochastic_vif.r1),
        .r2(stochastic_vif.r2),
        .r3(stochastic_vif.r3),
        .r4(stochastic_vif.r4),
        .z(stochastic_vif.z)
    );

    initial begin
    `ifdef XCELIUM
       $recordvars();
    `endif
    `ifdef VCS
       $vcdpluson;
    `endif
    `ifdef QUESTA
       $wlfdumpvars();
       set_config_int("*", "recording_detail", 1);
    `endif

    uvm_config_db#(virtual stochastic_if)::set(uvm_root::get(), "*", "dut_vif", stochastic_vif);
    uvm_config_db#(int)::set(uvm_root::get(),"*", "min_cover", min_cover);
    uvm_config_db#(int)::set(uvm_root::get(),"*", "min_transa", min_transa);
    run_test("simple_test");
    end
endmodule