class monitor_in extends uvm_monitor;
    `uvm_component_utils(monitor_in)

<<<<<<< HEAD
    input_vif  input_if;
    output_vif output_if;
=======
    input_vif  vif;
    output_vif out_vif;
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2
    event begin_record, end_record;
    tr_in tr;
    uvm_analysis_port #(tr_in) item_collected_port;
   
    function new(string name, uvm_component parent);
        super.new(name, parent);
        item_collected_port = new ("item_collected_port", this);
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
        tr = tr_in::type_id::create("tr", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        fork
            collect_transactions(phase);
            record_tr();
<<<<<<< HEAD
        join_none
    endtask

    virtual task collect_transactions(uvm_phase phase);
        wait(input_if.reset === 1);
        @(negedge input_if.reset);
        
        forever begin
            @(posedge input_if.clk);
            
            @(negedge input_if.start);
            -> begin_record;
            tr.pixel_1_bin <= input_if.pixel_1_bin;
            tr.pixel_2_bin <= input_if.pixel_2_bin;
            tr.pixel_3_bin <= input_if.pixel_3_bin;
            tr.pixel_4_bin <= input_if.pixel_4_bin;
            tr.pixel_6_bin <= input_if.pixel_6_bin;
            tr.pixel_7_bin <= input_if.pixel_7_bin;
            tr.pixel_8_bin <= input_if.pixel_8_bin;
            tr.pixel_9_bin <= input_if.pixel_9_bin;
            item_collected_port.write(tr);
            @(negedge input_if.clk);
=======
        join
    endtask

    virtual task collect_transactions(uvm_phase phase);
        wait(vif.reset === 1);
        @(negedge vif.reset);
        
        forever begin
            @(posedge vif.clk);
            if (vif.start) begin
                @(posedge vif.clk);
                tr.pixel_1_bin <= vif.pixel_1_bin;
                tr.pixel_2_bin <= vif.pixel_2_bin;
                tr.pixel_3_bin <= vif.pixel_3_bin;
                tr.pixel_4_bin <= vif.pixel_4_bin;
                tr.pixel_6_bin <= vif.pixel_6_bin;
                tr.pixel_7_bin <= vif.pixel_7_bin;
                tr.pixel_8_bin <= vif.pixel_8_bin;
                tr.pixel_9_bin <= vif.pixel_9_bin;
                item_collected_port.write(tr);
            end
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2
            -> end_record;
        end
    endtask

    virtual task record_tr();
        forever begin
            @(begin_record);
            begin_tr(tr, "monitor");
            @(end_record);
            end_tr(tr);
        end
    endtask
endclass