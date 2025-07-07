module register_file_tb;
    // input signals
    reg clk;
    reg write_enable;
    reg [4:0] read_addr1;
    reg [4:0] read_addr2;
    reg [4:0] write_addr;
    reg [31:0] write_data;

    // output signals
    wire [31:0] read_data1;
    wire [31:0] read_data2;

    // Initialize the module
    register_file rf(
        .clk(clk),
        .write_enable(write_enable),
        .write_addr(write_addr),
        .read_addr1(read_addr1),
        .read_addr2(read_addr2),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    initial begin
        clk = 0;
        write_enable = 0;
    end

    always #3 clk <= ~clk;

    initial begin
        // First we will write to x1
        #2; write_enable = 1; write_addr = 5'b00001; write_data = 32'hFF;

        // We will read from x1
        #2; write_enable = 0; read_addr1=5'b00001;

        // We will read from x0 (we should get 0 back)
        #1; read_addr2 = 5'b00000;

        // We will write something to x0 (we write 1)
        #1; write_enable = 1; write_addr = 5'b00010; write_data = 32'hBB;

        // We will read from x0 (we should get 0 back)
        #1; read_addr1 = 5'b00010;
        #2; $finish;
    end

    initial
        $monitor("[Time=%0t] clk=%0d read_addr1=%0d read_addr2=%0d write_enable=%0d write_addr=%0d write_data=%0d read_data1=%0d read_data2=%0d", $time, clk, read_addr1, read_addr2, write_enable, write_addr, write_data, read_data1, read_data2);
endmodule