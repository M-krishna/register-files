# Register file for RV32I
We will be creating a Register file for RV32I (RISC-V 32-bit Integer base)

## Specifications for Register File
1. Number of Registers:
    * The RV32I ISA provides **32 general purpose integer registers**. These are typically denoted as `x0` and `x31`
2. Register Width:
    * Each register is **32 bits wide**.
3. Special Register `x0` (Zero register):
    * **Always Reads Zero:** Register `x0` is hard-wired to always return the value 0 when read.
    * **Writes are ignored:** Any attempt to write a value to `x0` has no effect; its value remains 0.
4. Register Ports:
    * **Two Read Ports:** A typical register file implementation includes two independent read ports. This allows the processor to fetch two source operands (`rs1_data` and `rs2_data`) concurrently from different registers in a single clock cycle for common instruction types (eg. `ADD`, `SUB`, `AND`).
    * **One Write Port:** There is typically one write port, enabling a single destination register (`rd`) to be updated with a result (`write_data`) per clock cycle.
5. Clocking and Control:
    * **Synchronous Writes:** Writes to the register file are usually synchronous, occuring on a specific clock edge (eg. positive edge of a `clk`).
    * **Write Enable:** A `reg_write_en` (or similar, `write_enable`) control signal is used to enable or disable writes to the destination register. If `reg_write_en` is deasserted, no register is modified.
    * **Reset Behavior:** On reset, the contents of the registers are typically initialized, commonly to zero, although this specific behaviour for general-purpose registers is often implementation-defined beyond `x0`