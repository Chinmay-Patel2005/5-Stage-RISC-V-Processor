`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2025 12:11:10
// Design Name: 
// Module Name: core_block
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


module core_block(
    input  wire        clk, reset,
    input  wire [31:0] Instr,
    input  wire [31:0] ReadData,
    output wire [31:0] PC,
    output wire        MemWrite,MemRead,
    output wire [31:0] ALUResult, WriteData
);

    wire branch_signal, mem_to_reg_signal, alu_src_signal, reg_write_signal;
    wire [3:0] alu_control_signal;

    // Control Unit
    Ctrl_Top control_unit_top(
        .instruction_top(Instr),
        .branch_top(branch_signal),
        .MemRead_top(MemRead),
        .MemtoReg_top(mem_to_reg_signal),
        .MemWrite_top(MemWrite),
        .ALUSrc_top(alu_src_signal),
        .RegWrite_top(reg_write_signal),
        .control_top(alu_control_signal)
    );

    // Datapath
    Data_Path core_datapath(
        .clk(clk),
        .reset(reset),
        .branch_top(branch_signal),
        .RegWrite_top(reg_write_signal),
        .ALUSrc_top(alu_src_signal),
        .MemtoReg_top(mem_to_reg_signal),
        .Memdata_top(ReadData),
        .control_top(alu_control_signal),
        .instruction_top(Instr),
        .PC_top(PC),
        .address_top(ALUResult),
        .Rd2_top(WriteData)
    );

endmodule

