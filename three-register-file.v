module three_reg_file(
    input wire clk,
    input wire reset,
    input wire write_enable,
    input wire [1:0] write_address,
    input wire [7:0] write_data,
    output wire [7:0] read_data_0,
    output wire [7:0] read_data_1,
    output wire [7:0] read_data_2
);

    // Register array
    reg [7:0] regs [0:2];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            regs[0] <= 8'b0;
            regs[1] <= 8'b0;
            regs[2] <= 8'b0;
        end else if (write_enable) begin
            regs[write_address] <= write_data;
        end
    end

    // Continuous assignment
    assign read_data_0 = regs[0];
    assign read_data_1 = regs[1];
    assign read_data_2 = regs[2];
endmodule