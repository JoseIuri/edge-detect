class monitor_out extends uvm_monitor;
    `uvm_component_utils(monitor_out)
    output_vif  vif;
    event begin_record, end_record;
    tr_out tr;
    uvm_analysis_port #(tr_out) item_collected_port;
   
    function new(string name, uvm_component parent);
        super.new(name, parent);
        item_collected_port = new ("item_collected_port", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        assert(uvm_config_db#(output_vif)::get(this, "", "vif", vif));
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
        wait(vif.rst === 1);
        @(negedge vif.rst);
        
        forever begin
            @(posedge vif.clk);
            if(vif.done) begin
                -> begin_record;
                
                tr.z_bin = vif.z_bin;
                item_collected_port.write(tr);

            end
            @(negedge vif.clk);
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