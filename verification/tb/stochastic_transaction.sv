class stochastic_transaction extends uvm_sequence_item;
    rand bit z1_1;
    rand bit z2_1;
    rand bit z3_1;
    rand bit z4_1;
    rand bit z6_1;
    rand bit z7_1;
    rand bit z8_1;
    rand bit z9_1;
    rand bit z1_2;
    rand bit z2_2;
    rand bit z3_2;
    rand bit z4_2;
    rand bit z6_2;
    rand bit z7_2;
    rand bit z8_2;
    rand bit z9_2;
    rand bit r0;
    rand bit r1;
    rand bit r2;
    rand bit r3;
    rand bit r4;
    bit z;
    //Alterar os dados para sua aplicação

    `uvm_object_utils_begin(stochastic_transaction)
        `uvm_field_int(z1_1, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z2_1, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z3_1, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z4_1, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z6_1, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z7_1, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z8_1, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z9_1, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z1_2, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z2_2, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z3_2, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z4_2, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z6_2, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z7_2, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z8_2, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z9_2, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(r0, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(r1, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(r2, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(r3, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(r4, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(z, UVM_ALL_ON|UVM_HEX)
    `uvm_object_utils_end

    function new(string name="stochastic_transaction");
        super.new(name);
    endfunction: new

    function string convert2string();
        return $sformatf("{z1_1 = %h, z2_1 = %h, z3_1 = %h, z4_1 = %h, z6_1  = %h, z7_1 = %h, z8_1 = %h, z9_1 = %h, z1_2 = %h, z2_2 = %h, z3_2 = %h, z4_2 = %h, z6_2 = %h, z7_2 = %h, z8_2 = %h, z9_2 = %h, r0 = %h, r1 = %h, r2 = %h, r3 = %h, r4 = %h, z = %h}", z1_1, z2_1, z3_1, z4_1, z6_1 , z7_1, z8_1, z9_1, z1_2, z2_2, z3_2, z4_2, z6_2, z7_2, z8_2, z9_2, r0, r1, r2, r3, r4, z);
    endfunction
endclass: stochastic_transaction