package stochastic_pkg;
    `include "uvm_macros.svh"
    import uvm_pkg::*;


    `include "./stochastic_types.svh"
    `include "./stochastic_transaction.sv"
    
    `include "./stochastic_sequence.sv"
    `include "./stochastic_driver.sv"
    `include "./stochastic_monitor.sv"
    `include "./stochastic_agent.sv"

    `include "./stochastic_cover.sv"
    `include "./stochastic_refmod.sv"
    `include "./stochastic_scoreboard.sv"
    `include "./stochastic_env.sv"

    `include "./simple_test.sv"
endpackage