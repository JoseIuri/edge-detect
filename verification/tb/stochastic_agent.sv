class stochastic_agent extends uvm_agent;
    uvm_sequencer#(stochastic_transaction) sqr;
    stochastic_driver    drv;
    stochastic_monitor   mon;

    uvm_analysis_port #(stochastic_transaction) agt_resp_port;
    uvm_analysis_port #(stochastic_transaction) agt_req_port;

    `uvm_component_utils(stochastic_agent)

    function new(string name = "stochastic_agent", uvm_component parent = null);
        super.new(name, parent);
        agt_resp_port = new("agt_resp_port", this);
        agt_req_port = new("agt_req_port", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        mon = stochastic_monitor::type_id::create("mon", this);
        sqr = uvm_sequencer#(stochastic_transaction)::type_id::create("sqr", this);
        drv = stochastic_driver::type_id::create("drv", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        mon.req_tr_port.connect(agt_req_port);
        mon.resp_tr_port.connect(agt_resp_port);
        drv.seq_item_port.connect(sqr.seq_item_export);
    endfunction
endclass: stochastic_agent