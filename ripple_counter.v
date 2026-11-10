module ripple_counter(
    input clk,
    input reset,
    output stage1,
    output stage2,
    output stage3
);
    tff first_tff(.clk(clk), .reset(reset), .T(1), .Q(stage1));
    tff second_tff(.clk(stage1), .reset(reset), .T(1), .Q(stage2));
    tff third_tff(.clk(stage2), .reset(reset), .T(1), .Q(stage3));
endmodule
