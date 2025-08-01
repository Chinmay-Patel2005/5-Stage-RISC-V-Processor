`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2025 16:10:06
// Design Name: 
// Module Name: PC_Sel
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


module PC_Sel(sel1, A1, B1, Mux1_out);
    input sel1;
    input [31:0] A1, B1;
    output [31:0] Mux1_out;

    assign Mux1_out = (sel1 == 1'b0) ? A1 : B1;
endmodule
