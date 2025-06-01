module adder_tb();
    // Input
    reg clk;
    reg reset;
    reg [7:0] a;
    reg [7:0] b;
    // Output
    wire [7:0] c;

    adder uut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .c(c)
    );

    initial begin
        $dumpfile("sim/adder.vcd");
        $dumpvars(0, adder_tb);
        clk = 0;
        reset = 0;
        a = 0;
        b = 0;
        #10;
        reset = 1;
        #10;
        reset = 0;
        #10;
        a = 4;
        b = 7;
        #10;
        a = 8;
        b = 17;
        #10;
        $finish;
    end

    always #5 clk = ~clk;
endmodule
