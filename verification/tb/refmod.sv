<<<<<<< HEAD
typedef struct {
    int p1;
    int p2;
    int p3;
    int p4;
    int p6;
    int p7;
    int p8;
    int p9;
} DpiStructGEN;

import "DPI-C" context gen_init_python = function gen_init_sv();
import "DPI-C" context gen_set_param = function gen_sv_set_param (inout DpiStructGEN dpiStruct);
import "DPI-C" context sobel = function int gen_sv_sobel(inout DpiStructGEN dpiStruct);

DpiStructGEN dpiStruct;
=======
import "DPI-C" context function int adder(int a, int b);
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2

class refmod extends uvm_component;
    `uvm_component_utils(refmod)
    
    tr_in tr;
    tr_out tr_o;
    integer a, b;
    uvm_analysis_imp #(tr_in, refmod) in;
    uvm_analysis_export #(tr_out) out;
    event begin_refmodtask;
    
    function new(string name = "refmod", uvm_component parent);
        super.new(name, parent);
        in = new("in", this);
        out = new("out", this);
<<<<<<< HEAD

        void'(gen_init_sv());
=======
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        tr_o = tr_out::type_id::create("tr_o", this);
    endfunction: build_phase
    
    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        
        forever begin
            @begin_refmodtask;
<<<<<<< HEAD

            dpiStruct.p1 = tr.pixel_1_bin;
            dpiStruct.p2 = tr.pixel_2_bin;
            dpiStruct.p3 = tr.pixel_3_bin;
            dpiStruct.p4 = tr.pixel_4_bin;
            dpiStruct.p6 = tr.pixel_6_bin;
            dpiStruct.p7 = tr.pixel_7_bin;
            dpiStruct.p8 = tr.pixel_8_bin;
            dpiStruct.p9 = tr.pixel_9_bin;

            tr_o.z_bin = gen_sv_sobel(dpiStruct);
=======
            tr_o.data = adder(tr.A, tr.B);
            $display("%d",tr_o.data);
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2
            out.write(tr_o);
        end
    endtask: run_phase

    virtual function write (tr_in t);
        tr = tr_in::type_id::create("tr", this);
        tr.copy(t);
        -> begin_refmodtask;
    endfunction


endclass: refmod