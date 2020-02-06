typedef virtual input_if input_vif;

class driver_in extends uvm_driver #(tr_in);
    `uvm_component_utils(driver_in)
    input_vif vif;
    output_vif out_vif;
    event begin_record, end_record;

    function new(string name = "driver_in", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        assert(uvm_config_db#(input_vif)::get(this, "", "vif", vif));
        assert(uvm_config_db#(output_vif)::get(this, "", "vif", out_vif));
    endfunction

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        fork
            reset_signals();
            get_and_drive(phase);
            record_tr();
        join
    endtask

    virtual protected task reset_signals();
        wait (vif.reset === 1);
        forever begin
            vif.pixel_1_bin <= 'x;
            vif.pixel_2_bin <= 'x;
            vif.pixel_3_bin <= 'x;
            vif.pixel_4_bin <= 'x;
            vif.pixel_6_bin <= 'x;
            vif.pixel_7_bin <= 'x;
            vif.pixel_8_bin <= 'x;
            vif.pixel_9_bin <= 'x;
            vif.start <= '0;
            @(negedge vif.reset);
        end
    endtask

    virtual protected task get_and_drive(uvm_phase phase);
        wait(vif.reset === 1);
        @(negedge vif.reset);
        @(posedge vif.clk);
        
        forever begin
            seq_item_port.try_next_item(req);
            -> begin_record;
            drive_transfer(req);
            seq_item_port.item_done();
        end
    endtask

    virtual protected task drive_transfer(tr_in tr);
        
        @(posedge vif.clk); //hold time
        if(req.start) begin
            vif.pixel_1_bin <= req.pixel_1_bin;
            vif.pixel_2_bin <= req.pixel_2_bin;
            vif.pixel_3_bin <= req.pixel_3_bin;
            vif.pixel_4_bin <= req.pixel_4_bin;
            vif.pixel_6_bin <= req.pixel_6_bin;
            vif.pixel_7_bin <= req.pixel_7_bin;
            vif.pixel_8_bin <= req.pixel_8_bin;
            vif.pixel_9_bin <= req.pixel_9_bin;
            vif.start <= req.start;
        end

        @(posedge vif.clk);
        vif.start <= '0;

        wait(negedge output_vif.done);

        
        -> end_record;
    endtask

    virtual task record_tr();
        forever begin
            @(begin_record);
            begin_tr(req, "driver_in");
            @(end_record);
            end_tr(req);
        end
    endtask
endclass