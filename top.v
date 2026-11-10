module top(
    input btnU,
    input btnC,
    output [15:0] led
);
    ripple_counter ripple(
        .clk(btnC),
        .reset(btnU),
        .stage1(led[0]),
        .stage2(led[1]),
        .stage3(led[2])
    );

    modulo_counter modulo(
        .clk(btnC),
        .reset(btnU),
        .count(led[5:3]),
        .divided_clock(led[6])
    );

    assign led[15:7] = 0;
endmodule
