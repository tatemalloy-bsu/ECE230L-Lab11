module modulo_counter(
    input clk,
    input reset,
    output [2:0] count,
    output divided_clock
);
    wire [2:0] count_plus_one;
    wire carry_bit0;
    wire carry_bit1;
    wire carry_bit2;

    // count + 1
    full_adder adder_bit0(.A(count[0]), .B(0), .carry_in(1), .sum(count_plus_one[0]), .carry_out(carry_bit0));
    full_adder adder_bit1(.A(count[1]), .B(0), .carry_in(carry_bit0), .sum(count_plus_one[1]), .carry_out(carry_bit1));
    full_adder adder_bit2(.A(count[2]), .B(0), .carry_in(carry_bit1), .sum(count_plus_one[2]), .carry_out(carry_bit2));

    // check if count + 1 is 6 (110)
    wire reached_six;
    assign reached_six = count_plus_one[2] & count_plus_one[1] & ~count_plus_one[0];

    // go back to 0 if we hit 6
    wire [2:0] next_count;
    assign next_count[0] = count_plus_one[0] & ~reached_six;
    assign next_count[1] = count_plus_one[1] & ~reached_six;
    assign next_count[2] = count_plus_one[2] & ~reached_six;

    dff count_bit0(.clk(clk), .reset(reset), .D(next_count[0]), .Q(count[0]));
    dff count_bit1(.clk(clk), .reset(reset), .D(next_count[1]), .Q(count[1]));
    dff count_bit2(.clk(clk), .reset(reset), .D(next_count[2]), .Q(count[2]));

    // flip the output every time we hit 6
    dff output_flipflop(.clk(clk), .reset(reset), .D(divided_clock ^ reached_six), .Q(divided_clock));
endmodule
