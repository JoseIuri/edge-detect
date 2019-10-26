class stochastic_sequence extends uvm_sequence #(stochastic_transaction);
    `uvm_object_utils(stochastic_sequence)

    function new(string name="stochastic_sequence");
        super.new(name);
    endfunction: new

    task body;
        stochastic_transaction tr;

        forever begin
            tr = stochastic_transaction::type_id::create("tr");
            start_item(tr);
                assert(tr.randomize());
            finish_item(tr);
            //Alterar caso necessite de uma sequencia direcionada.
        end
    endtask: body
endclass