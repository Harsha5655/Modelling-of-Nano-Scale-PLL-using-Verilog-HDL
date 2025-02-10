`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2023 21:19:25
// Design Name: 
// Module Name: VCO
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




module VCO(cp_out,v_in,vco_out);

    input cp_out;
    input v_in;  // Control voltage input   
    output vco_out;         // VCO output
    
    
    assign vco_out = v_in ? cp_out : 1'b0;
    
endmodule





