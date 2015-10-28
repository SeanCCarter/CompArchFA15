module register32zero
(
output reg[0:31]  q,
input[0:31]       d,
input       wrenable,
input       clk
);
    always @(posedge clk) begin
        if(wrenable) begin
            q[0:31] = 0;
        end
    end
endmodule
