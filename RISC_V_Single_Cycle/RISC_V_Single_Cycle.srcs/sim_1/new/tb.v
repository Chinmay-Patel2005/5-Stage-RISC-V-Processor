`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2025 18:04:38
// Design Name: 
// Module Name: tb
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

module tb();

reg clk = 0, reset;
wire [31:0] Rd2_top, address_top;
wire MemWrite_top;

single_cycle_top DUT(
    .clk(clk),
    .reset(reset),
    .Rd2_top(Rd2_top),
    .address_top(address_top),
    .MemWrite_top(MemWrite_top)
);
  
    // Clock generation
    always #5 clk = ~clk;

    // Monitor signals
    initial begin
        $monitor("Time = %0t | MemWrite = %b | Address = %h | Data = %h", $time, MemWrite_top, address_top, Rd2_top);
    end

    // Initialize inputs
    initial begin
        clk = 0;
        reset = 1;

        // Wait for global reset
        #10 reset = 0;

        // Run the simulation for some time
        #245;

        // Optionally print a specific memory address content
        $display("\n=== Final Result ===");
        $display("Determinant Value = %0d", DUT.Data_Memory.D_Memory[9]);
        $stop;
    end

endmodule







