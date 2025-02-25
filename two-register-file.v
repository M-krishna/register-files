module two_reg_file(
    input wire clk,
    input wire reset,
    input wire write_enable,      // write enable
    input wire addr,              // 1-bit address, 0 selects register 0 and 1 selects register 1
    input wire [7:0] write_data,  // Data to write to a register
    output wire [7:0] read_data_0,
    output wire [7:0] read_data_1
);

    // Define the registers
    reg [7:0] regs [0:1];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            regs[0] <= 8'b0;
            regs[1] <= 8'b0;
        end else if (write_enable) begin
            regs[addr] <= write_data;
        end
    end

    // Continuous assignment
    assign read_data_0 = regs[0];
    assign read_data_1 = regs[1];
endmodule