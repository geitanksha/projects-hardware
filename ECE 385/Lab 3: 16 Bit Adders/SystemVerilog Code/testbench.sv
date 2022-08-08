module testbench ();

timeunit 10ns; // Half clock cycle at 50 MHz
// This is the amount of time represented by #1
timeprecision 1ns;

// These signals are internal because the processor will be
// instantiated as a submodule in testbench.
logic [15:0] A, B;
logic cin;
logic [15:0] S;
logic cout;
logic Clk = 0;
 
logic [15:0] ans_1a;
logic ans_2b;

// To store expected results

// A counter to count the instances where simulation results
// do no match with expected results
integer ErrorCnt = 0;

// Instantiating the DUT
// Make sure the module and signal names match with those in your design
ripple_adder adder1(.*);

//lookahead_adder adder1(.*);

//select_adder adder1(.*);


// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
//A = 16'b0000111100001111;
//B = 16'b1111000011110000;
//cin = 0;


//#2  ans_1a = 16'b1111111111111111; // Expected result of 1st cycle
// ans_2b = 0;
//    if (S != ans_1a)
// ErrorCnt++;
//    if (cout != ans_2b)
// ErrorCnt++;

A = 16'b1111111100000000;
B = 16'b1111111111111111;
cin = 1;

#2  ans_1a = 16'b1111111100000000; // Expected result of 1st cycle
ans_2b = 1'b1;
    if (S != ans_1a)
ErrorCnt++;
    if (cout != ans_2b)
ErrorCnt++;


if (ErrorCnt == 0)
$display("Success!");  // Command line output in ModelSim
else
$display("%d error(s) detected. Try again!", ErrorCnt);
end
endmodule