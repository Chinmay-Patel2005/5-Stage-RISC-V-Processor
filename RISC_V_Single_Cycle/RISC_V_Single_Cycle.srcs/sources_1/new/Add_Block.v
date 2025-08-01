`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2025 16:23:38
// Design Name: 
// Module Name: Add_Block
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

module Add_Block(in_1, in_2, Sum_out);
    input [31:0] in_1, in_2;
    output [31:0] Sum_out;

    assign Sum_out = in_1 + in_2;
endmodule
