module two_reg_file_tb;
    // Test signals
    reg clk;
    reg reset;
    reg write_enable;
    reg write_address;
    reg [7:0] write_data;
    wire [7:0] read_data_0;
    wire [7:0] read_data_1;

    // Initialize the module
    two_reg_file _trf(
        .clk(clk),
        .reset(reset),
        .write_enable(write_enable),
        .addr(write_address),
        .write_data(write_data),
        .read_data_0(read_data_0),
        .read_data_1(read_data_1)
    );

    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        write_enable = 0;
        write_address = 0;
        write_data = 8'b0;

        // Apply the reset to set the value of registers to 0
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Write 8'hAA to register 0
        write_address = 0;      // Selects register 0
        write_data = 8'hAA;     // test data
        write_enable = 1;       // enable write
        #10;                    // wait for one clock cycle
        write_enable = 0;

        // Write 8'h55 to register 1
        write_address = 1;
        write_data = 8'h55;
        write_enable = 1;
        #10;
        write_enable = 0;

        #20; // wait for couple of clock cycles
        $finish; // Finish the simulation
    end

    initial begin
        $monitor("[Time=%0t] read_data_0 = %h read_data_1 = %h", $time, read_data_0, read_data_1);
    end
endmodule