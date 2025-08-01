# RISC-V Single Cycle Processor Project

This project implements a simple RISC-V single-cycle processor in Verilog. It includes all the necessary modules for instruction execution, memory access, and register operations. The processor is capable of running RISC-V assembly code, such as a program to solve a linear equation, which is assembled and loaded into instruction memory.

## Project Structure

- **RISC_V_Single_Cycle/**
  - **RISC_V_Single_Cycle.xpr**: Vivado project file.
  - **RISC_V_Single_Cycle.srcs/sources_1/new/**: Contains all Verilog source files for the processor modules:
    - `ALU_Control.v`, `ALU_Mux.v`, `ALU_unit.v`, `AND_logic.v`, `Adder.v`, `Control_Unit.v`, `Control_Unit_Top.v`, `Core_Datapath.v`, `Data_Mem.v`, `ImmGen.v`, `Inst_Mem.v`, `Instruction_memory.v`, `PC_Mux.v`, `Reg_File.v`, `Result_Mux.v`, `pc.v`, `pc_plus_4.v`, `single_cycle_core.v`, `single_cycle_top.v`, `top_level.v`
  - **RISC_V_Single_Cycle.srcs/sim_1/new/**: Testbench files (e.g., `tb.v`).
  - **RISC_V_Single_Cycle.srcs/sources_1/imports/memfiles/**: Memory initialization files:
    - `output.mem`, `determinant.mem`, `data_mem_init.mem`
- **C++ Code**: (Not included here) Used to generate the assembly for solving a linear equation.
- **Assembly Code**: (Not included here) Used to initialize instruction memory.

## How to Use

1. **Open the Project**: Open `RISC_V_Single_Cycle.xpr` in Vivado.
2. **Memory Initialization**: Ensure the memory files (`.mem`) are present in the correct directory. These files contain the machine code for the linear equation solver or other programs.
3. **Simulation**: Run the simulation using the provided testbench (`tb.v`). The testbench will display memory writes and the final result (e.g., the solution to the linear equation).
4. **Synthesis/Implementation**: You can synthesize and implement the design for the specified FPGA part (e.g., xc7z010iclg400-1L).

## Notes

- The processor expects RISC-V machine code in hexadecimal format for instruction memory.
- You can modify the `.mem` files to run different programs.
- The testbench prints the result stored in a specific memory location after execution.

## Credits

- Developed by Chinmay Patel.
- Based on the RISC-V ISA and standard single-cycle processor architecture.

---
