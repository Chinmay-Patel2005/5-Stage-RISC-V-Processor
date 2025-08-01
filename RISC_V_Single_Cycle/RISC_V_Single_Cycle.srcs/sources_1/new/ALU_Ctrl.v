`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2025 12:09:32
// Design Name: 
// Module Name: ALU_Ctrl
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

module ALU_Ctrl (
  input  [6:0] fun7,          // 7-bit funct7
  input  [2:0] fun3,          // 3-bit funct3
  input  [1:0] ALUOp,         // 2-bit ALUOp
  output reg [3:0] Control_out // 4-bit ALU control output
);

  always @(*) begin
    case (ALUOp)
      2'b00: Control_out <= 4'b0010; // Load/Store: ADD
      2'b01: Control_out <= 4'b0110; // Branch: SUB

      2'b10: begin // R-type instructions including MUL
        case ({fun7[5], fun3})
          4'b0000: Control_out <= 4'b0010; // ADD
          4'b1000: Control_out <= 4'b0110; // SUB
          4'b0111: Control_out <= 4'b0000; // AND
          4'b0110: Control_out <= 4'b0001; // OR
          4'b0100: Control_out <= 4'b0011; // XOR
          4'b0001: Control_out <= 4'b0100; // SLL
          4'b0101: Control_out <= 4'b0101; // SRL
          4'b1101: Control_out <= 4'b1001; // SRA
          4'b0010: Control_out <= 4'b0111; // SLT
          4'b0011: Control_out <= 4'b1000; // SLTU
          4'b1001: Control_out <= 4'b1010; // MUL (funct7[5]=1, fun3=000)
          default: Control_out <= 4'b1111; // Invalid R-type
        endcase
      end

      2'b11: begin // I-type arithmetic instructions
        case (fun3)
          3'b000: Control_out <= 4'b0010; // ADDI
          3'b111: Control_out <= 4'b0000; // ANDI
          3'b110: Control_out <= 4'b0001; // ORI
          3'b100: Control_out <= 4'b0011; // XORI
          3'b010: Control_out <= 4'b0111; // SLTI
          3'b011: Control_out <= 4'b1000; // SLTIU
          3'b001: Control_out <= 4'b0100; // SLLI
          3'b101: begin
            if (fun7[5] == 1'b0)
              Control_out <= 4'b0101; // SRLI
            else
              Control_out <= 4'b1001; // SRAI
          end
          default: Control_out <= 4'b1111; // Invalid I-type
        endcase
      end

      default: Control_out <= 4'b1111; // Invalid ALUOp
    endcase
  end
endmodule


