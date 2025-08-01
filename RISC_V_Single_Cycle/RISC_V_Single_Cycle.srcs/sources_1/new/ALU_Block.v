`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.04.2025 15:35:47
// Design Name: 
// Module Name: ALU_Block
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

module ALU_Block(
  input [31:0] A, B,
  input [3:0] Control_in,
  output reg zero,
  output reg [31:0] ALU_Result
);

  always @(Control_in or A or B) begin
    case (Control_in)
      4'b0000: begin 
        ALU_Result = A & B;      // AND
        zero = (ALU_Result == 0);
      end
      4'b0001: begin 
        ALU_Result = A | B;      // OR
        zero = (ALU_Result == 0);
      end
      4'b0010: begin 
        ALU_Result = A + B;      // ADD
        zero = (ALU_Result == 0);
      end
      4'b0011: begin 
        ALU_Result = A ^ B;      // XOR
        zero = (ALU_Result == 0);
      end
      4'b0100: begin 
        ALU_Result = A << B[4:0]; // SLL
        zero = (ALU_Result == 0);
      end
      4'b0101: begin 
        ALU_Result = A >> B[4:0]; // SRL (logical)
        zero = (ALU_Result == 0);
      end
      4'b0110: begin 
        ALU_Result = A - B;      // SUB
        zero = (ALU_Result == 0);
      end
      4'b0111: begin 
        ALU_Result = $signed(A) < $signed(B); // SLT
        zero = (ALU_Result == 0);
      end
      4'b1000: begin 
        ALU_Result = A < B;      // SLTU
        zero = (ALU_Result == 0);
      end
      4'b1001: begin 
        ALU_Result = $signed(A) >>> B[4:0]; // SRA
        zero = (ALU_Result == 0);
      end
      4'b1010: begin
        ALU_Result = A * B;      // MUL
        zero = (ALU_Result == 0);
      end
      default: begin 
        ALU_Result = 32'h00000000; // Default for undefined
        zero = 0;
      end
    endcase
  end
endmodule



