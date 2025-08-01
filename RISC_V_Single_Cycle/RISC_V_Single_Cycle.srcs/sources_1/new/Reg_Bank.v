`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2025 00:52:40
// Design Name: 
// Module Name: Reg_Bank
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


module Reg_Bank (
    input clk,
    input reset,
    input RegWrite,
    input [4:0] Rs1, Rs2, Rd,
    input [31:0] Write_data,
    output [31:0] read_data1,
    output [31:0] read_data2
);

  reg [31:0] Registers [31:0];  // 32 registers (x0 to x31)
  integer i;

  // Initialize register file to zero on reset
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      for (i = 0; i < 32; i = i + 1)
        Registers[i] <= 32'b0;
    end else if (RegWrite && Rd != 5'b00000) begin
      Registers[Rd] <= Write_data;  // x0 is hardwired to zero
    end
  end

  // Read operations (combinational)
  assign read_data1 = Registers[Rs1];
  assign read_data2 = Registers[Rs2];

endmodule

