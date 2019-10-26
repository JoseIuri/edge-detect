class stochastic_env extends uvm_env;
    typedef stochastic_agent agent_type;
    agent_type agent;
    stochastic_scoreboard   sb;
    stochastic_cover cv;
    `uvm_component_utils(stochastic_env)

    function new(string name, uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = agent_type::type_id::create("agent", this);
        sb = stochastic_scoreboard::type_id::create("sb", this);
        cv = stochastic_cover::type_id::create("cv",this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agent.agt_req_port.connect(cv.req_port);
                agent.agt_resp_port.connect(cv.resp_port);
        agent.agt_resp_port.connect(sb.ap_comp);
        agent.agt_req_port.connect(sb.ap_rfm);
    endfunction

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
    endfunction

endclass: stochastic_env