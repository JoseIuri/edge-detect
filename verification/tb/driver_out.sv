<<<<<<< HEAD
class driver_out extends uvm_driver #(tr_out);
    `uvm_component_utils(driver_out)
    output_vif output_if;
=======
typedef virtual output_if output_vif;

class driver_out extends uvm_driver #(tr_out);
    `uvm_component_utils(driver_out)
    output_vif output_vif;
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2

    function new(string name = "driver_out", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
<<<<<<< HEAD
        assert(uvm_config_db#(output_vif)::get(this, "", "output_if", output_if));
=======
        assert(uvm_config_db#(output_vif)::get(this, "", "output_vif", output_vif));
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2
    endfunction

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        fork
            reset_signals();
            drive(phase);
        join
    endtask

    virtual protected task reset_signals();
<<<<<<< HEAD
        wait (output_if.reset === 1);
        @(negedge output_if.reset);
    endtask

    virtual protected task drive(uvm_phase phase);
        wait(output_if.reset === 1);
        @(negedge output_if.reset);
        @(posedge output_if.clk);
=======
        wait (vif.reset === 1);
        @(negedge vif.reset);
    endtask

    virtual protected task drive(uvm_phase phase);
        wait(vif.rst === 1);
        @(negedge vif.reset);
        @(posedge vif.clk);
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2
        
    endtask
endclass