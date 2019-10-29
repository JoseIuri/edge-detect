`uvm_analysis_imp_decl(_req)
`uvm_analysis_imp_decl(_resp)

class stochastic_cover extends uvm_component;
    `uvm_component_utils(stochastic_cover)

    stochastic_transaction req;
    stochastic_transaction resp;

    uvm_analysis_imp_req#(stochastic_transaction, stochastic_cover) req_port;
    uvm_analysis_imp_resp#(stochastic_transaction, stochastic_cover) resp_port;
    int min_cover = 100;
    int min_transa = 5120;
    int transa = 0;

    function new(string name = "stochastic_cover", uvm_component parent= null);
        super.new(name, parent);
        req_port = new("req_port", this);        resp_port = new("resp_port", this);
        resp=new;        req=new;
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase (phase);
        uvm_config_db#(int)::get(this, "", "min_cover", min_cover);
        uvm_config_db#(int)::get(this, "", "min_transa", min_transa);
    endfunction

    protected uvm_phase running_phase;
    task run_phase(uvm_phase phase);
        running_phase = phase;
        running_phase.raise_objection(this);        
        running_phase.raise_objection(this);    
    endtask: run_phase

//============= Função para copiar transações do agent (Requisições) ======================
    function void write_req(stochastic_transaction t);
        req.copy (t);
        //req_cover.sample();
        transa = transa + 1;
        $display("transa:%d",transa);
        $display("min_transa:%d",min_transa);
        if(transa >= min_transa) begin
            $display("dropou");
            running_phase.drop_objection(this);
        end
    //if($get_coverage() >= min_cover)
    //  running_phase.drop_objection(this);

    endfunction: write_req
//============= Função para copiar transações do agent (Respostas) ========================
    function void write_resp(stochastic_transaction t);
        resp.copy(t);

        //resp_cover.sample();

        // //$display("cobertura:%d",$get_coverage());
        // if($get_coverage() >= min_cover)
        //     running_phase.drop_objection(this);

    endfunction: write_resp
endclass : stochastic_cover