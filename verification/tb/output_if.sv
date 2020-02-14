interface output_if(input clk, reset);
    logic [7:0] z_bin;
    logic done;
    
    modport port(input clk, reset, output z_bin, done);
endinterface