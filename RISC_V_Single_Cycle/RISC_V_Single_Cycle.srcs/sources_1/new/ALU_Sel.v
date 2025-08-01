`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2025 16:12:06
// Design Name: 
// Module Name: ALU_Sel
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


module ALU_Sel(sel2, A2, B2, Mux2_out);
    input sel2;
    input [31:0] A2, B2;
    output [31:0] Mux2_out;

    assign Mux2_out = (sel2 == 1'b0) ? A2 : B2;
endmodule
