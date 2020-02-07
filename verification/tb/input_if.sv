interface input_if(input clk, reset);
<<<<<<< HEAD
    logic [7:0] pixel_1_bin, pixel_2_bin, pixel_3_bin, pixel_4_bin, pixel_6_bin, pixel_7_bin, pixel_8_bin, pixel_9_bin;
    logic start;
    
    modport port(input clk, reset, pixel_1_bin, pixel_2_bin, pixel_3_bin, pixel_4_bin, pixel_6_bin, pixel_7_bin, pixel_8_bin, pixel_9_bin, start);
=======
    logic [7:0] pixel_1_bin, pixel_2_bin, pixel_3_bin, pixel_4_bin, pixel_5_bin, pixel_6_bin, pixel_7_bin, pixel_8_bin, pixel_9_bin;
    logic start;
    
    modport port(input clk, reset, pixel_1_bin, pixel_2_bin, pixel_3_bin, pixel_4_bin, pixel_5_bin, pixel_6_bin, pixel_7_bin, pixel_8_bin, pixel_9_bin, start);
>>>>>>> bdcae14d55d1a0a6f313d7387306f7a104a01fe2
endinterface