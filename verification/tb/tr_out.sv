class tr_out extends uvm_sequence_item;
    bit [7:0] z_bin;

    `uvm_object_utils_begin(tr_out)
        `uvm_field_int(z_bin, UVM_ALL_ON|UVM_HEX)
    `uvm_object_utils_end

    function new(string name="tr_out");
        super.new(name);
    endfunction: new
endclass: tr_out