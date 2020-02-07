typedef virtual input_if input_vif;
<<<<<<< HEAD
typedef virtual output_if output_vif;

class driver_in extends uvm_driver #(tr_in);
    `uvm_component_utils(driver_in)
    input_vif input_if;
    output_vif output_if;
=======

class driver_in extends uvm_driver #(tr_in);
    `uvm_component_utils(driver_in)
    input_vif vif;
    output_vif out_vif;
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2
    event begin_record, end_record;

    function new(string name = "driver_in", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
<<<<<<< HEAD
        assert(uvm_config_db#(input_vif)::get(this, "", "input_if", input_if));
        assert(uvm_config_db#(output_vif)::get(this, "", "output_if", output_if));
=======
        assert(uvm_config_db#(input_vif)::get(this, "", "vif", vif));
        assert(uvm_config_db#(output_vif)::get(this, "", "vif", out_vif));
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2
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
<<<<<<< HEAD
        wait (input_if.reset === 1);
        forever begin
            input_if.pixel_1_bin <= 'x;
            input_if.pixel_2_bin <= 'x;
            input_if.pixel_3_bin <= 'x;
            input_if.pixel_4_bin <= 'x;
            input_if.pixel_6_bin <= 'x;
            input_if.pixel_7_bin <= 'x;
            input_if.pixel_8_bin <= 'x;
            input_if.pixel_9_bin <= 'x;
            input_if.start <= '0;
            @(negedge input_if.reset);
=======
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
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2
        end
    endtask

    virtual protected task get_and_drive(uvm_phase phase);
<<<<<<< HEAD
        wait(input_if.reset === 1);
        @(negedge input_if.reset);
        @(posedge input_if.clk);
=======
        wait(vif.reset === 1);
        @(negedge vif.reset);
        @(posedge vif.clk);
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2
        
        forever begin
            seq_item_port.try_next_item(req);
            -> begin_record;
            drive_transfer(req);
            seq_item_port.item_done();
        end
    endtask

    virtual protected task drive_transfer(tr_in tr);
        
<<<<<<< HEAD
        @(posedge input_if.clk); //hold time
        if(req.start) begin
            input_if.pixel_1_bin <= req.pixel_1_bin;
            input_if.pixel_2_bin <= req.pixel_2_bin;
            input_if.pixel_3_bin <= req.pixel_3_bin;
            input_if.pixel_4_bin <= req.pixel_4_bin;
            input_if.pixel_6_bin <= req.pixel_6_bin;
            input_if.pixel_7_bin <= req.pixel_7_bin;
            input_if.pixel_8_bin <= req.pixel_8_bin;
            input_if.pixel_9_bin <= req.pixel_9_bin;
            
            @(posedge input_if.clk);
            input_if.start <= '1;
            @(posedge input_if.clk);
            input_if.start <= '0;
            @(negedge output_if.done);
        end


        -> end_record;

        
=======
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
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2
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