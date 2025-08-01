`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2025 12:24:33
// Design Name: 
// Module Name: Data_Mem
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


module Data_Mem (
    input clk,
    input reset,
    input MemWrite,
    input MemRead,
    input [31:0] read_address,
    input [31:0] Write_data,
    output [31:0] MemData_out
);

    integer k;
    reg [31:0] D_Memory[1023:0];
    
    initial begin
        $readmemh("data_mem_init.mem", D_Memory);
    end

    always @(posedge clk)  // No more posedge reset
    begin
        if (MemWrite) begin
            D_Memory[read_address[11:2]] <= Write_data;
        end
    end
    
    assign MemData_out = (MemRead) ? D_Memory[read_address[11:2]] : 32'b0;

endmodule
