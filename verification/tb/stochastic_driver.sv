class stochastic_driver extends uvm_driver#(stochastic_transaction);
    `uvm_component_utils(stochastic_driver)

    typedef virtual stochastic_if vif;
    typedef stochastic_transaction tr_type;
    typedef enum {WAIT_ADDR, WAIT_DATA, WAIT_RESP} state_rw;

    vif dut_vif;
    tr_type tr;
    bit item_done;
    event begin_record,end_record;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(vif)::get(this, "", "dut_vif", dut_vif)) begin
            `uvm_fatal("NOVIF", "failed to get virtual interface")
        end
    endfunction

    task run_phase (uvm_phase phase);
        super.run_phase(phase);
        fork
            reset_signals();
            get_and_drive(phase);
            record_tr();
        join_any
    endtask

    virtual protected task reset_signals();
        wait (dut_vif.rst === 0);
        forever begin
            dut_vif.z1_1 <= 0;
            dut_vif.z2_1 <= 0;
            dut_vif.z3_1 <= 0;
            dut_vif.z4_1 <= 0;
            dut_vif.z6_1 <= 0;
            dut_vif.z7_1 <= 0;
            dut_vif.z8_1 <= 0;
            dut_vif.z9_1 <= 0;
            dut_vif.z1_2 <= 0;
            dut_vif.z2_2 <= 0;
            dut_vif.z3_2 <= 0;
            dut_vif.z4_2 <= 0;
            dut_vif.z6_2 <= 0;
            dut_vif.z7_2 <= 0;
            dut_vif.z8_2 <= 0;
            dut_vif.z9_2 <= 0;
            dut_vif.r0 <= 0;
            dut_vif.r1 <= 0;
            dut_vif.r2 <= 0;
            dut_vif.r3 <= 0;
            dut_vif.r4 <= 0;
            @(posedge dut_vif.rst);
        end
    endtask

    virtual protected task get_and_drive(uvm_phase phase);
        @(posedge dut_vif.rst);

        forever begin
            seq_item_port.get_next_item(req);
            -> begin_record;
            drive_transfer(req);
            seq_item_port.item_done();
        end
    endtask

    virtual protected task drive_transfer(stochastic_transaction tr);
        @(posedge dut_vif.clk)

        dut_vif.z1_1 <= req.z1_1;
        dut_vif.z2_1 <= req.z2_1;
        dut_vif.z3_1 <= req.z3_1;
        dut_vif.z4_1 <= req.z4_1;
        dut_vif.z6_1 <= req.z6_1;
        dut_vif.z7_1 <= req.z7_1;
        dut_vif.z8_1 <= req.z8_1;
        dut_vif.z9_1 <= req.z9_1;
        dut_vif.z1_2 <= req.z1_2;
        dut_vif.z2_2 <= req.z2_2;
        dut_vif.z3_2 <= req.z3_2;
        dut_vif.z4_2 <= req.z4_2;
        dut_vif.z6_2 <= req.z6_2;
        dut_vif.z7_2 <= req.z7_2;
        dut_vif.z8_2 <= req.z8_2;
        dut_vif.z9_2 <= req.z9_2;
        dut_vif.r0 <= req.r0;
        dut_vif.r1 <= req.r1;
        dut_vif.r2 <= req.r2;
        dut_vif.r3 <= req.r3;
        dut_vif.r4 <= req.r4;

        req.z <= dut_vif.z;


        @(negedge dut_vif.clk); //hold time
        -> end_record;
    endtask

    virtual task record_tr();
        forever begin
            @(begin_record);
            begin_tr(req, "driver");
            @(end_record);
            end_tr(req);
        end
    endtask
endclass: stochastic_driver