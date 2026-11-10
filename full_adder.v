module full_adder(
    input A,
    input B,
    input carry_in,
    output sum,
    output carry_out
);
    assign sum = A ^ B ^ carry_in;
    assign carry_out = (A & B) | (carry_in & (A ^ B));
endmodule
