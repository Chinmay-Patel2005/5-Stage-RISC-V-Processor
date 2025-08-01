`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.04.2025 11:27:36
// Design Name: 
// Module Name: top_level
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

module top_level(
			input 	      clk,reset,
			output [31:0] Rd2_top,address_top,
			output        MemWrite_top );

   wire [31:0] PC_top, instruction_top, Memdata_top;
   wire MemRead_top;
      
   core_block core_top (
			       .clk(clk),
			       .reset(reset),
			       .Instr(instruction_top),
			       .ReadData(Memdata_top),
			       .PC(PC_top),
			       .MemRead(MemRead_top),
			       .MemWrite(MemWrite_top),
			       .ALUResult(address_top),
			       .WriteData(Rd2_top) );

    Inst_Mem Instr_Memory(.read_address(PC_top), .instruction_out(instruction_top)); 
    
    Data_Mem Data_Memory(
                        .clk(clk),
                        .reset(reset), 
                        .MemWrite(MemWrite_top), 
                        .MemRead(MemRead_top), 
                        .read_address(address_top),
                        .Write_data(Rd2_top), 
                        .MemData_out(Memdata_top));

endmodule
