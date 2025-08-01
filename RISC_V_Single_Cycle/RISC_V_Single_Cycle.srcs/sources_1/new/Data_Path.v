`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2025 12:46:27
// Design Name: 
// Module Name: Data_Path
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

module Data_Path(
    input         clk,
    input         reset,
    input         branch_top,
    input         RegWrite_top,
    input         ALUSrc_top,
    input         MemtoReg_top,
    input  [31:0] Memdata_top,
    input  [3:0]  control_top,
    input  [31:0] instruction_top,
    output [31:0] PC_top,
    output [31:0] address_top,Rd2_top
);

    // Internal wires
    wire [31:0] pc_next;
    wire [31:0] pc_plus_4;
    wire [31:0] immediate_extended;
    wire [31:0] branch_target;
    wire branch_taken;
    wire [31:0] rs1_data;
    wire [31:0] alu_operand2;
    wire alu_zero;
    wire [31:0] writeback_data;

   PC_Reg PC(.clk(clk), .reset(reset), .PC_in(pc_next), .PC_out(PC_top));
   
   PC_Plus4 PC_Adder(.fromPC(PC_top), .NexttoPC(pc_plus_4));

   Add_Block Adder(.in_1(PC_top), .in_2(immediate_extended), .Sum_out(branch_target));

   AND_Gate AND(.branch(branch_top), .zero(alu_zero), .and_out(branch_taken));
   
   PC_Sel PC_Mux(.sel1(branch_taken), .A1(pc_plus_4), .B1(branch_target), .Mux1_out(pc_next));

   Reg_Bank Reg_File(.clk(clk), .reset(reset), .RegWrite(RegWrite_top), 
        .Rs1(instruction_top[19:15]), 
        .Rs2(instruction_top[24:20]), 
        .Rd(instruction_top[11:7]), 
        .Write_data(writeback_data), 
        .read_data1(rs1_data), 
        .read_data2(Rd2_top));
        
   Imm_Gen ImmGen(.Opcode(instruction_top[6:0]), .instruction(instruction_top), .ImmExt(immediate_extended));

   ALU_Sel ALU_mux(.sel2(ALUSrc_top), .A2(Rd2_top), .B2(immediate_extended), .Mux2_out(alu_operand2));
   
   ALU_Block ALU(.A(rs1_data), .B(alu_operand2), .Control_in(control_top), .ALU_Result(address_top), .zero(alu_zero));
   
   Res_Mux Result_Mux(.sel3(MemtoReg_top), .A3(address_top), .B3(Memdata_top), .Mux3_out(writeback_data));
   
endmodule