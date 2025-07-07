// Register file for 32-bit RISC-V processor
module register_file(
    input [4:0] read_addr1,
    input [4:0] read_addr2,
    input [4:0] write_addr,
    input write_enable,
    input [31:0] write_data,
    input clk,
    output [31:0] read_data1,
    output [31:0] read_data2
);
    reg [31:0] registers [0:31];    // 32 registers, each 32-bit wide

    localparam reg0 = 5'b0;     // this will hold 00000

    assign read_data1 = (read_addr1 == reg0) ? 32'b0 : registers[read_addr1];
    assign read_data2 = (read_addr2 == reg0) ? 32'b0 : registers[read_addr2];

    always @(posedge clk) begin
        if (write_enable && write_addr != reg0) begin
            registers[write_addr] <= write_data;
        end 
    end
endmodule