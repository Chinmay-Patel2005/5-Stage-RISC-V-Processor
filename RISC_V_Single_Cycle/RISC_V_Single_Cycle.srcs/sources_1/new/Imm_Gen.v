`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2025 12:48:12
// Design Name: 
// Module Name: Imm_Gen
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

module Imm_Gen(Opcode, instruction, ImmExt);

input [6:0] Opcode;
input [31:0] instruction;
output reg [31:0] ImmExt;

always @(*) begin
    case (Opcode)
        7'b0000011: // I-type (e.g., lw)
            ImmExt <= {{20{instruction[31]}}, instruction[31:20]};

        7'b0100011: // S-type (e.g., sw)
            ImmExt <= {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};

        7'b1100011: // B-type (e.g., beq)
            ImmExt <= {{19{instruction[31]}}, instruction[31], instruction[30:25], instruction[11:8], 1'b0};

        7'b1101111: // J-type (e.g., jal)
            ImmExt <= {{11{instruction[31]}}, instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0};

        7'b0110111, 7'b0010111: // U-type (lui, auipc)
            ImmExt <= {{12{instruction[31]}}, instruction[31:12], 12'b0};
            
        default:
            ImmExt <= 32'b0;
    endcase
end

endmodule

