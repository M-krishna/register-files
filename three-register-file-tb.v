module three_reg_file_tb;
    // Test signals
    reg clk;
    reg reset;
    reg write_enable;
    reg [1:0] write_address;
    reg [7:0] write_data;
    wire [7:0] read_data_0;
    wire [7:0] read_data_1;
    wire [7:0] read_data_2;

    // Initialize the module
    three_reg_file _trf(
        .clk(clk),
        .reset(reset),
        .write_enable(write_enable),
        .write_address(write_address),
        .write_data(write_data),
        .read_data_0(read_data_0),
        .read_data_1(read_data_1),
        .read_data_2(read_data_2)
    );

    always #5 clk = ~clk;

    initial begin
        // Set the initial value
        clk = 0;
        reset = 0;
        write_enable = 0;
        write_address = 2'b0;
        write_data = 8'b0;

        reset = 1;
        #10;
        reset = 0;
        #10;

        // Set the value for register 0
        write_address = 00;
        write_data = 8'b1;
        write_enable = 1;
        #10;
        write_enable = 0;

        // Set the value for register 1
        write_address = 01;
        write_data = 8'hf;
        write_enable = 1;
        #10;
        write_enable = 0;

        // Set the value for register 2
        write_address = 10;
        write_data = 8'hff;
        write_enable = 1;
        #10;
        write_enable = 0;

        #20;
        $finish;
    end

    initial begin
        $monitor("[Time=%0t read_data_0 = %b read_data_1 = %h read_data_2 = %h]", $time, read_data_0, read_data_1, read_data_2);
    end
endmodule