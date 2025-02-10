`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2023 19:19:27
// Design Name: 
// Module Name: pre_div
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


module pre_div(clk_in,p,clk_ref);

    input clk_in;
    input [5:0]p;
    output clk_ref;
    
    assign clk_ref = clk_in*p;    
    
    
endmodule


