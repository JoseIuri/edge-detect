class driver_out extends uvm_driver #(tr_out);
    `uvm_component_utils(driver_out)
    output_vif output_if;

    function new(string name = "driver_out", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        assert(uvm_config_db#(output_vif)::get(this, "", "output_if", output_if));
    endfunction

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        fork
            reset_signals();
            drive(phase);
        join
    endtask

    virtual protected task reset_signals();
        wait (output_if.reset === 1);
        @(negedge output_if.reset);
    endtask

    virtual protected task drive(uvm_phase phase);
        wait(output_if.reset === 1);
        @(negedge output_if.reset);
        @(posedge output_if.clk);
        
    endtask
endclass