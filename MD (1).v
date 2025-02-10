`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2023 22:01:18
// Design Name: 
// Module Name: MD
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


//module MD(vco,m,md_out);

//    input vco;
//    input [9:0]m;
//    output md_out;

//    assign md_out = vco*m;

//endmodule

module MD(
    input vco,
    input rst,
    input clk_divider_enable,
    input [9:0]m,

    output md_out
);

    reg [9:0] counter;
    reg divided_clk;
    reg odd_toggle;
    wire [9:0] ratio_divided_by_two;
    wire enable;


    always @(posedge vco or posedge rst) begin
        if (rst) begin
            divided_clk <= 1'b0;
            odd_toggle <= 1'b1;
            counter <= 10'b0;
        end
        else if (enable) begin
            if (~m[0] & counter == ratio_divided_by_two - 1'b1) begin
                divided_clk <= ~divided_clk;
                counter <= 10'b0;
            end
            else if (m[0] & ((counter == ratio_divided_by_two - 1'b1 & odd_toggle)
                                        | (counter == ratio_divided_by_two & ~odd_toggle))) begin
                divided_clk <= ~divided_clk;
                odd_toggle <= ~odd_toggle;
                counter <= 10'b0;
            end
            else begin
                counter <= counter + 10'b1;
            end
        end
    end

    assign enable = clk_divider_enable | (m != 10'b00_0000_0001) | (m != 10'b00_0000_0000);
    assign ratio_divided_by_two = (m >> 1);
    assign md_out = clk_divider_enable ? divided_clk : vco;

endmodule

