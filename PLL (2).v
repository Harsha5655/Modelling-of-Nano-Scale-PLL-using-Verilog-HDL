`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2023 19:17:13
// Design Name: 
// Module Name: PLL
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


module PLL(clkin,rst,en,p,m,s,bypass,clkout);   ////

    input clkin;
    input rst;
    input en;
    input bypass;
    input [5:0]p;
    input [9:0]m;
    input [2:0]s;
    output clkout;
    
    wire ref;
    wire cp_out;
    wire md_out;
    wire vco_out;
    wire up,dn;
    
    
    pre_div Ins1(clkin,p,ref);
    PD      Ins2(ref,rst,md_out,up,dn);
    CP      Ins3(up,dn,cp_out);
    VCO     Ins4(clkin,cp_out,vco_out);
    MD      Ins5(vco_out,rst,en,m,md_out);
    scaler  Ins6(clkin,vco_out,s,bypass,clkout);
    
       

endmodule
