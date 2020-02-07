<<<<<<< HEAD
interface output_if(input clk, reset);
    logic [7:0] z_bin;
    logic done;
    
    modport port(input clk, reset, output z_bin, done);
=======
interface output_if(input clk, rst);
    logic [7:0] z_bin;
    logic done;
    
    modport port(input clk, rst, output z_bin, done);
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2
endinterface