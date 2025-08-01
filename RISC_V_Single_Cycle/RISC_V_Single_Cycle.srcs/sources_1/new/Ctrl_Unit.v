`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2025 15:24:32
// Design Name: 
// Module Name: Ctrl_Unit
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

module Ctrl_Unit(
  input  [6:0] instruction,
  output reg Branch,
  output reg MemRead,
  output reg MemtoReg,
  output reg MemWrite,
  output reg ALUSrc,
  output reg RegWrite,
  output reg [1:0] ALUOp
);

always @(*) begin
    case (instruction)
        // R-type (e.g., add, sub, and, or)
        7'b0110011: begin
            ALUSrc   = 0;
            MemtoReg = 0;
            RegWrite = 1;
            MemRead  = 0;
            MemWrite = 0;
            Branch   = 0;
            ALUOp    = 2'b10;
        end
        // lw (Load Word)
        7'b0000011: begin
            ALUSrc   = 1;
            MemtoReg = 1;
            RegWrite = 1;
            MemRead  = 1;
            MemWrite = 0;
            Branch   = 0;
            ALUOp    = 2'b00;
        end
        // sw (Store Word)
        7'b0100011: begin
            ALUSrc   = 1;
            MemtoReg = 0;  // X (don't care)
            RegWrite = 0;
            MemRead  = 0;
            MemWrite = 1;
            Branch   = 0;
            ALUOp    = 2'b00;
        end
        // B-type (e.g., beq, bne)
        7'b1100011: begin
            ALUSrc   = 0;
            MemtoReg = 0;  // X (don't care)
            RegWrite = 0;
            MemRead  = 0;
            MemWrite = 0;
            Branch   = 1;
            ALUOp    = 2'b01;
        end
        // I-type (e.g., addi, andi, ori, xori)
        7'b0010011: begin
            ALUSrc   = 1;
            MemtoReg = 0;
            RegWrite = 1;
            MemRead  = 0;
            MemWrite = 0;
            Branch   = 0;
            ALUOp    = 2'b11;
        end
        // jal (Jump and Link)
        7'b1101111: begin
            ALUSrc   = 1;
            MemtoReg = 0;  // Return address written to rd
            RegWrite = 1;
            MemRead  = 0;
            MemWrite = 0;
            Branch   = 0;
            ALUOp    = 2'b11;
        end
        // jalr (Jump and Link Register)
        7'b1100111: begin
            ALUSrc   = 1;
            MemtoReg = 0;
            RegWrite = 1;
            MemRead  = 0;
            MemWrite = 0;
            Branch   = 0;
            ALUOp    = 2'b11;
        end
        // lui (Load Upper Immediate)
        7'b0110111: begin
            ALUSrc   = 1;
            MemtoReg = 0;
            RegWrite = 1;
            MemRead  = 0;
            MemWrite = 0;
            Branch   = 0;
            ALUOp    = 2'b11;
        end
        // auipc (Add Upper Immediate to PC)
        7'b0010111: begin
            ALUSrc   = 1;
            MemtoReg = 0;
            RegWrite = 1;
            MemRead  = 0;
            MemWrite = 0;
            Branch   = 0;
            ALUOp    = 2'b00;
        end
        // Default - Safe fallback
        default: begin
            ALUSrc   = 0;
            MemtoReg = 0;
            RegWrite = 0;
            MemRead  = 0;
            MemWrite = 0;
            Branch   = 0;
            ALUOp    = 2'b00;
        end
    endcase
end

endmodule
