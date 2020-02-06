interface output_if(input clk, rst);
    logic [7:0] z_bin;
    logic done;
    
    modport port(input clk, rst, output z_bin, done);
endinterface