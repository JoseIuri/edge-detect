class tr_in extends uvm_sequence_item;
    rand bit [7:0] pixel_1_bin;
    rand bit [7:0] pixel_2_bin;
    rand bit [7:0] pixel_3_bin;
    rand bit [7:0] pixel_4_bin;
    rand bit [7:0] pixel_6_bin;
    rand bit [7:0] pixel_7_bin;
    rand bit [7:0] pixel_8_bin;
    rand bit [7:0] pixel_9_bin;
    rand bit       start;

    `uvm_object_utils_begin(tr_in)
        `uvm_field_int(pixel_1_bin, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(pixel_2_bin, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(pixel_3_bin, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(pixel_4_bin, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(pixel_6_bin, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(pixel_7_bin, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(pixel_8_bin, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(pixel_9_bin, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(start, UVM_ALL_ON|UVM_HEX)
    `uvm_object_utils_end

    function new(string name="tr_in");
        super.new(name);
    endfunction: new
endclass: tr_in