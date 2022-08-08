# 8-bit Multiplier

In this experiment, we designed a multiplier in SystemVerilog. This multiplied two 8-bit 2’s Complement numbers using an add-shift algorithm. This multiplier was displayed on the De10-Lite FPGA board. We use the add-shift system being very similar to the method done by hand on pen-and-paper, however, it uses the MSB of the 2’s complement number to determine whether the last step of the add-shift system is an addition or a subtraction. We store one value in our B register, then save the value to be multiplied in the switches. The result gets added and stored in the register combination of A and B, which slowly gets shifted to the right before another add (or subtract) is performed.

<img width="675" alt="image" src="https://user-images.githubusercontent.com/93052774/183303328-a466dd8b-dfc7-4501-8318-ecd1e3de5679.png">

Block Diagram for the multiplier:

<img width="400" alt="image" src="https://user-images.githubusercontent.com/93052774/183303351-8b4557e8-dcbd-42ac-81f3-ca1daf3aaa52.png">


