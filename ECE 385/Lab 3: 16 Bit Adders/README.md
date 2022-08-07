# 3 Kinds of 16-bit Adders

In this experiment, we designed 3 different 16-bit binary adders using SystemVerilog. The adders implemented were Ripple Adder, Carry Lookahead Adder, and Carry Select Adder. Each adder took in two 16-bit values and a Carry in as inputs, and outputted a 16-bit sum and a Carry Out. We designed 16-bit adders with a 10-bit input set by the switches. The sum is stored in a 17-bit register(to account for overflow) and displayed on 4 hex displays. When the run_accumalate button is pressed, the 10-bit input from the switches is added to the current sum, with each button press accumulating the switch value to the previous sum. The sum can be cleared by pressing the Reset_Clear button.

Tradeoffs between the adders:

<img width="700" alt="image" src="https://user-images.githubusercontent.com/93052774/183280773-3c936b68-8a59-482f-b79e-8a95d6eb9e64.png">


### 1. Carry Ripple Adder (CRA):

The Carry Ripple Adder is the simplest adder, constructed with 16 Full Adders.
A full adder (Figure 2) is a 1-bit adder, which takes in two 1-bit inputs and a carry-in, adds them together, and produces a 1-bit sum and carry out as the output. The 16 full adders are serially connected.

We created a 4-bit CRA using four Full Adders placed in series:

<img width="300" alt="image" src="https://user-images.githubusercontent.com/93052774/183280350-24b9a33e-821a-453b-a880-a8a0eeb553c3.png">

We then created the 16-bit CRA by connecting four 4-bit CRAs in series:

<img width="700" alt="image" src="https://user-images.githubusercontent.com/93052774/183280394-932de5dc-d7a9-48f3-9eb2-3e2b2887903f.png">

### 2. Carry Lookahead Adder (CLA):

The Carry Lookahead Adder is a relatively time-efficient adder, which makes use of Generating and Propagating logic to anticipate and determine the carry-in bits of each Full Adder quicker. Our implementation is a 4x4 hierarchical adder making use of four 4-bit CLAs.

The carry-out of the Nth adder, which serves as the carry-in bit for the subsequent N+1th full adder is determined by the 1-bit inputs A and B and the Carry-in bit.
The Carry-out is guaranteed to be 1 if A and B are both 1, or if either A or B are 1 and the Carry-in is 1. Based on this, each Full Adder outputs a Propagate Signal. A Carry-out is guaranteed when A and B are one, which then creates a Generate signal. Using this information, we can determine that:
- Propagate Signal (P) = A⊕B
- Generate Signal (G) = A.B

4-bit version of the CLA:

<img width="700" alt="image" src="https://user-images.githubusercontent.com/93052774/183280486-c23bc356-0e95-4e89-b28a-63184ea7a2eb.png">

4x4 Hierarchiacal version of the 16-bit CLA:

<img width="700" alt="image" src="https://user-images.githubusercontent.com/93052774/183280556-faf5aa95-9b1d-4d0d-87a8-0781367d9d74.png">

Block diagram of the hierarchiacal 16-bit CLA:

<img width="300" alt="image" src="https://user-images.githubusercontent.com/93052774/183280596-255006db-9ca0-4930-b6d9-83eac440ca29.png">

### 3. Carry Select Adder (CSA):

A carry select adder makes use of 2 full adders or a group of 2 ripple adders and a multiplexer. The first full adder pre-computes the sum using the carry in as 1, while the other assumes the carry in as 0. When the actual carry in arrives, the sums have already been computed and the mux is used to determine which sum to output as the final sum. In our implementation, we design a hierarchical adder consisting of 7 carry ripple adders and divide the 16 bits into groups of 4. The first unit corresponding to the lowest bits requires only 1 CRA since the carry in is known. Each other unit contains a multiplexer 2 CRAs which compute the sum using 0 and 1 as the carry in. The carry-in of the previous unit, when computed, is used as the select signal to determine which Full Adders sum to output.

4x4 Hierarchiacal version of the 16-bit CSA:

<img width="700" alt="image" src="https://user-images.githubusercontent.com/93052774/183280719-b070a1c4-d8f4-4092-9f3b-3ad1e5f99cf4.png">

Block diagram of the hierarchiacal 16-bit CSA:

<img width="500" alt="image" src="https://user-images.githubusercontent.com/93052774/183280704-4fc2c519-07c4-404c-90ba-53a47ccb8f58.png">

Information about actual project:

In our overall design, we had a run_accumulate button and a clear button. When the run_accumulate button was clicked, then the sum from the FPGA switches were added to the sum currently being displayed on the LEDs. However, in order to prevent the accumulator from adding the value on the switches on every rising clock edge, we had to desgin a control system that controlled the FSM that would ensure the values were loaded from the switches into the accumulator only once. The FSM is below:

<img width="350" alt="image" src="https://user-images.githubusercontent.com/93052774/183287171-eeabad7c-4f07-4e91-9252-65c8f13d65d4.png">



