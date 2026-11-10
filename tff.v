module tff(
    input clk,
    input reset,
    input T,
    output Q
);
    dff flipflop(
        .clk(clk),
        .reset(reset),
        .D(T ^ Q),
        .Q(Q)
    );
endmodule
