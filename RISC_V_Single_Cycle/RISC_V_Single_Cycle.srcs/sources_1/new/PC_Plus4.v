`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2025 23:47:29
// Design Name: 
// Module Name: PC_Plus4
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


module PC_Plus4(fromPC, NexttoPC);

input [31:0] fromPC;
output [31:0] NexttoPC;

assign NexttoPC = 32'd4 + fromPC;

endmodule
