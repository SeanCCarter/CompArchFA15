// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address1, address0;
input in0, in1, in2, in3;
wire[3:0] inputs = {in3, in2, in1, in0};
wire[1:0] address = {address1, address0};
assign out = inputs[address];
endmodule

module structuralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address1, address0;
input in0, in1, in2, in3;
wire a1inv, a0inv;
wire A0, A1, A2, A3;
wire out0, out1, out2, out3;

`NOT A1inv(a1inv, address1);
`NOT A0inv(a0inv, address0);
`AND a0and(A0, a1inv, a0inv);
`AND a1and(A1, a1inv, address0);
`AND a2and(A2, address1, a0inv);
`AND a3and(A3, address1, address0);

`AND a0(out0, A0, in0);
`AND a1(out1, A1, in1);
`AND a2(out2, A2, in2);
`AND a3(out3, A3, in3);

`OR result(out, out0, out1, out2, out3);
//I hope I'm allowed to do this. I didn't want to make a chain of or gates.
endmodule

module testMultiplexer;
reg address1, address0;
reg in0, in1, in2, in3;
wire out;
//behavioralMultiplexer multiplexer (out, address0,address1, in0,in1,in2,in3);
structuralMultiplexer multiplexer (out, address0,address1, in0,in1,in2,in3);

initial begin
$display("Testing address 00");
$display("A1 A0 in0 in1 in2 in3 | Out | Expected Output");
address0=0;address1=0;in0=1;in1=1;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=0;in0=1;in1=1;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=0;in0=1;in1=1;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=0;in0=1;in1=1;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=0;in0=1;in1=0;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=0;in0=1;in1=0;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=0;in0=1;in1=0;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=0;in0=1;in1=0;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=0;in0=0;in1=1;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=0;in0=0;in1=1;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=0;in0=0;in1=1;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=0;in0=0;in1=1;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=0;in0=0;in1=0;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=0;in0=0;in1=0;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=0;in0=0;in1=0;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=0;in0=0;in1=0;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
//$display("\n")

$display("Testing address 01");
$display("A1 A0 in0 in1 in2 in3 | Out | Expected Output");
address0=1;address1=0;in0=1;in1=1;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=0;in0=1;in1=1;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=0;in0=1;in1=1;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=0;in0=1;in1=1;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=0;in0=1;in1=0;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=0;in0=1;in1=0;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=0;in0=1;in1=0;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=0;in0=1;in1=0;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=0;in0=0;in1=1;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=0;in0=0;in1=1;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=0;in0=0;in1=1;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=0;in0=0;in1=1;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=0;in0=0;in1=0;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=0;in0=0;in1=0;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=0;in0=0;in1=0;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=0;in0=0;in1=0;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
//$display("\n")

$display("Testing address 10");
$display("A1 A0 in0 in1 in2 in3 | Out | Expected Output");
address0=0;address1=1;in0=1;in1=1;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=1;in0=1;in1=1;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=1;in0=1;in1=1;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=1;in0=1;in1=1;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=1;in0=1;in1=0;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=1;in0=1;in1=0;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=1;in0=1;in1=0;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=1;in0=1;in1=0;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=1;in0=0;in1=1;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=1;in0=0;in1=1;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=1;in0=0;in1=1;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=1;in0=0;in1=1;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=1;in0=0;in1=0;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=1;in0=0;in1=0;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=1;in0=0;in1=0;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=0;address1=1;in0=0;in1=0;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
//$display("\n")

$display("Testing address 11");
$display("A1 A0 in0 in1 in2 in3 | Out | Expected Output");
address0=1;address1=1;in0=1;in1=1;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=1;in0=1;in1=1;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=1;in0=1;in1=1;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=1;in0=1;in1=1;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=1;in0=1;in1=0;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=1;in0=1;in1=0;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=1;in0=1;in1=0;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=1;in0=1;in1=0;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=1;in0=0;in1=1;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=1;in0=0;in1=1;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=1;in0=0;in1=1;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=1;in0=0;in1=1;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=1;in0=0;in1=0;in2=1;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=1;in0=0;in1=0;in2=1;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=1;in0=0;in1=0;in2=0;in3=1; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  1",  address1, address0, in0, in1, in2, in3, out);
address0=1;address1=1;in0=0;in1=0;in2=0;in3=0; #200 
$display("%b  %b  %b   %b   %b   %b   |  %b  |  0",  address1, address0, in0, in1, in2, in3, out);
//$display("\n")
end
endmodule
