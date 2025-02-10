`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2023 20:41:26
// Design Name: 
// Module Name: PD
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


module PD(ref,rst,md,up,dn);
    
    input ref,rst,md;
    output reg up,dn;
    
    wire ff_rst;

    assign ff_rst = dn & up; // the AND gate
    
    always @( posedge ref or posedge ff_rst or posedge rst )
        begin
            if (rst) 
                up<=1'b0;
            else if (ff_rst) 
                up <= 1'b0;
            else 
                up <= 1'b1;
        end
    
    always @( posedge md or posedge ff_rst or posedge rst )
        begin
            if (rst) 
                dn<=1'b0;
            else if (ff_rst) 
                dn <= 1'b0;
            else 
                dn <= 1'b1;
        end
    
endmodule
