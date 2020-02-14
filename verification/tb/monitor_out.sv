class monitor_out extends uvm_monitor;
    `uvm_component_utils(monitor_out)
    output_vif  output_if;
    event begin_record, end_record;
    tr_out tr;
    uvm_analysis_port #(tr_out) item_collected_port;
   
    function new(string name, uvm_component parent);
        super.new(name, parent);
        item_collected_port = new ("item_collected_port", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        assert(uvm_config_db#(output_vif)::get(this, "", "output_if", output_if));
        tr = tr_out::type_id::create("tr", this);
    endfunction

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        fork
            collect_transactions(phase);
            record_tr();
        join
    endtask

    virtual task collect_transactions(uvm_phase phase);
        wait(output_if.reset == 1);
        @(negedge output_if.reset);
        
        forever begin
            @(posedge output_if.clk);
            if(output_if.done) begin
                -> begin_record;
                
                tr.z_bin = output_if.z_bin;
                item_collected_port.write(tr);

            end
            @(negedge output_if.clk);
            -> end_record;
        end
    endtask

    virtual task record_tr();
        forever begin
            @(begin_record);
            begin_tr(tr, "monitor_out");
            @(end_record);
            end_tr(tr);
        end
    endtask
endclass