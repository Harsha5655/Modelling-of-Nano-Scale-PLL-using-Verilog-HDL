`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2023 22:19:41
// Design Name: 
// Module Name: scaler
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

    
module scaler (clk,vco,s,bypass,scaled_out);

    input  clk;         // System clock
    input  vco;         // Output signal from the VCO
    input  [2:0] s;    // Scaling factor control (3-bit control)
    input  bypass;     // Bypass control (1-bit)
    output scaled_out;  // Scaled output 
    
    reg [2:0] scale_count;
    reg [2:0] s_count_next;

    assign scaled_out = (bypass) ? vco : (scale_count == s) ? 1'b1 : 1'b0;

    always @(posedge clk or posedge bypass) begin
        if (bypass) begin
            scale_count <= 3'b0; // Reset counter when in bypass mode
        end else if (scale_count == s) begin
            scale_count <= 3'b0; // Reset counter when it reaches the desired scale
        end else begin
            scale_count <= s_count_next;
        end
    end

    always @(posedge clk or posedge bypass) begin
        if (bypass) begin
            s_count_next <= 3'b0; // Reset counter when in bypass mode
        end else if (scale_count == s) begin
            s_count_next <= 3'b0; // Reset counter when it reaches the desired scale
        end else begin
            s_count_next <= scale_count + 1'b1;
        end
    end 

endmodule




