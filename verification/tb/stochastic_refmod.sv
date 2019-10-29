class stochastic_refmod extends uvm_component;
    `uvm_component_utils(stochastic_refmod)
    
    stochastic_transaction tr_in;
    stochastic_transaction tr_out;
    bit z;
    uvm_analysis_imp #(stochastic_transaction, stochastic_refmod) in;
    uvm_analysis_export #(stochastic_transaction) out;

    event begin_refmodtask;
    
    function new(string name = "stochastic_refmod", uvm_component parent);
        super.new(name, parent);
        in = new("in", this);
        out = new("out", this);
        z = 0;
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        tr_out = stochastic_transaction::type_id::create("tr_out", this);
    endfunction: build_phase
    
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        
        forever begin
            @begin_refmodtask;

            tr_out.z1_1 = tr_in.z1_1;
            tr_out.z2_1 = tr_in.z2_1;
            tr_out.z3_1 = tr_in.z3_1;
            tr_out.z4_1 = tr_in.z4_1;
            tr_out.z6_1 = tr_in.z6_1;
            tr_out.z7_1 = tr_in.z7_1;
            tr_out.z8_1 = tr_in.z8_1;
            tr_out.z9_1 = tr_in.z9_1;
            tr_out.z1_2 = tr_in.z1_2;
            tr_out.z2_2 = tr_in.z2_2;
            tr_out.z3_2 = tr_in.z3_2;
            tr_out.z4_2 = tr_in.z4_2;
            tr_out.z6_2 = tr_in.z6_2;
            tr_out.z7_2 = tr_in.z7_2;
            tr_out.z8_2 = tr_in.z8_2;
            tr_out.z9_2 = tr_in.z9_2;
            tr_out.r0 = tr_in.r0;
            tr_out.r1 = tr_in.r1;
            tr_out.r2 = tr_in.r2;
            tr_out.r3 = tr_in.r3;
            tr_out.r4 = tr_in.r4;

            tr_out.z = tr_in.z;

            z <= tr_in.z;
            out.write(tr_out);
        end
    endtask: run_phase

    virtual function write (stochastic_transaction t);
        tr_in = stochastic_transaction::type_id::create("tr_in", this);
        tr_in.copy(t);
        -> begin_refmodtask;
    endfunction
endclass: stochastic_refmod