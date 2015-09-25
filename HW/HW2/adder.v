// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder(sum, carryout, a, b, carryin);
output sum, carryout;
input a, b, carryin;
assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder(sum, carryout, a, b, carryin);
output sum, carryout;
input a, b, carryin;
wire carryout1, carryout2, partialsum;

//half adder(a and b)
`AND and1(carryout1, a, b);
`XOR xor1(partialsum, a, b);

//half adder(partial sum and carryin)
`AND and2(carryout2, carryin, partialsum);
`XOR xor2(sum, carryin, partialsum);

//do either half adders output a carry?
`XOR carryxor(carryout, carryout1, carryout2);
endmodule

module testFullAdder;
reg a, b, carryin;
wire sum, carryout;
//behavioralFullAdder adder (sum, carryout, a, b, carryin);
structuralFullAdder adder (sum, carryout, a, b, carryin);

initial begin
$display("a b ci | sum co | Expected Output");
a=0;b=0;carryin=0; #150
$display("%b %b %b  |  %b  %b  | 0 0", a, b, carryin, sum, carryout);
a=1;b=0;carryin=0; #150
$display("%b %b %b  |  %b  %b  | 1 0", a, b, carryin, sum, carryout);
a=0;b=1;carryin=0; #150
$display("%b %b %b  |  %b  %b  | 1 0", a, b, carryin, sum, carryout);
a=1;b=1;carryin=0; #150
$display("%b %b %b  |  %b  %b  | 0 1", a, b, carryin, sum, carryout);
a=0;b=0;carryin=1; #150
$display("%b %b %b  |  %b  %b  | 1 0", a, b, carryin, sum, carryout);
a=1;b=0;carryin=1; #150
$display("%b %b %b  |  %b  %b  | 0 1", a, b, carryin, sum, carryout);
a=0;b=1;carryin=1; #150
$display("%b %b %b  |  %b  %b  | 0 1", a, b, carryin, sum, carryout);
a=1;b=1;carryin=1; #150
$display("%b %b %b  |  %b  %b  | 1 1", a, b, carryin, sum, carryout);
end
endmodule
