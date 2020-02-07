//Top
module top;

  import uvm_pkg::*;
  import my_pkg::*;
  logic clk;
<<<<<<< HEAD
  logic reset;
  
  initial begin
    clk = 0;
    reset = 0;
    #22 reset = 1;
    #1 reset = 0;
=======
  logic rst;
  
  initial begin
    clk = 0;
    rst = 1;
    #22 rst = 0;
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2
    
  end
  
  always #5 clk = !clk;
<<<<<<< HEAD
    
  input_if in_if(clk, reset);
  output_if out_if(clk, reset);
  
  stochWrapper stoch(.pixel_1_bin(in_if.pixel_1_bin),
  .pixel_2_bin(in_if.pixel_2_bin),
  .pixel_3_bin(in_if.pixel_3_bin),
  .pixel_4_bin(in_if.pixel_4_bin),
  .pixel_6_bin(in_if.pixel_6_bin),
  .pixel_7_bin(in_if.pixel_7_bin),
  .pixel_8_bin(in_if.pixel_8_bin),
  .pixel_9_bin(in_if.pixel_9_bin),
  .start(in_if.start), 
  .done(out_if.done),
  .z_bin(out_if.z_bin),
  .clk(clk),
  .reset(reset));
=======
  
  logic [1:0] state;
  
  input_if in(clk, rst);
  output_if out(clk, rst);
  
  adder sum(in, out, state);
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2

  initial begin
    `ifdef XCELIUM
       $recordvars();
    `endif
    `ifdef VCS
       $vcdpluson;
    `endif
    `ifdef QUESTA
       $wlfdumpvars();
       set_config_int("*", "recording_detail", 1);
    `endif
    
<<<<<<< HEAD
    uvm_config_db#(input_vif)::set(uvm_root::get(), "*.env_h.mst.*", "input_if", in_if);
    uvm_config_db#(output_vif)::set(uvm_root::get(), "*.env_h.*",  "output_if", out_if);
=======
    uvm_config_db#(input_vif)::set(uvm_root::get(), "*.env_h.mst.*", "vif", in);
    uvm_config_db#(output_vif)::set(uvm_root::get(), "*.env_h.slv.*",  "output_vif", out);
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2
    
    run_test("simple_test");
  end
endmodule