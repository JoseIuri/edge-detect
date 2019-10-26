class stochastic_monitor extends uvm_monitor;

    virtual stochastic_if  dut_vif;
    event begin_record, end_record;
    stochastic_transaction tr;
    uvm_analysis_port #(stochastic_transaction) req_tr_port;
    uvm_analysis_port #(stochastic_transaction) resp_tr_port;
    `uvm_component_utils(stochastic_monitor)
   
    function new(string name, uvm_component parent);
        super.new(name, parent);
        req_tr_port = new("req_tr_port", this);
        resp_tr_port = new("resp_tr_port", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        assert(uvm_config_db#(virtual stochastic_if)::get(this, "", "dut_vif", dut_vif));
        tr = stochastic_transaction::type_id::create("tr", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        fork
            collect_transactions(phase);
            record_tr();
        join
    endtask

    virtual task collect_transactions(uvm_phase phase);
        @(posedge dut_vif.rst);
        
        forever begin
            -> begin_record;
            @(posedge dut_vif.clk);
            
            tr.z1_1 <= dut_vif.z1_1;
            tr.z2_1 <= dut_vif.z2_1;
            tr.z3_1 <= dut_vif.z3_1;
            tr.z4_1 <= dut_vif.z4_1;
            tr.z6_1 <= dut_vif.z6_1;
            tr.z7_1 <= dut_vif.z7_1;
            tr.z8_1 <= dut_vif.z8_1;
            tr.z9_1 <= dut_vif.z9_1;
            tr.z1_2 <= dut_vif.z1_2;
            tr.z2_2 <= dut_vif.z2_2;
            tr.z3_2 <= dut_vif.z3_2;
            tr.z4_2 <= dut_vif.z4_2;
            tr.z6_2 <= dut_vif.z6_2;
            tr.z7_2 <= dut_vif.z7_2;
            tr.z8_2 <= dut_vif.z8_2;
            tr.z9_2 <= dut_vif.z9_2;
            tr.r0 <= dut_vif.r0;
            tr.r1 <= dut_vif.r1;
            tr.r2 <= dut_vif.r2;
            tr.r3 <= dut_vif.r3;
            tr.r4 <= dut_vif.r4;

            tr.z <= dut_vif.z;

            req_tr_port.write(tr);
            resp_tr_port.write(tr);

            @(negedge dut_vif.clk);
            -> end_record;
        end
    endtask

    virtual task record_tr();
        forever begin
            @(begin_record);
            begin_tr(tr, "stochastic_monitor");
            @(end_record);
            end_tr(tr);
        end
    endtask
endclass: stochastic_monitor