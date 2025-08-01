`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2025 16:12:30
// Design Name: 
// Module Name: Res_Mux
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


module Res_Mux(sel3, A3, B3, Mux3_out);
    input sel3;
    input [31:0] A3, B3;
    output [31:0] Mux3_out;

    assign Mux3_out = (sel3 == 1'b0) ? A3 : B3;
endmodule
