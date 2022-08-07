# A Logic Processor

In this experiment, we implement a bitwise logic operator. Our circuit takes in two 4-bit inputs stored in two shift registers, performs one of eight functions (preselected by the user) bit-by-bit using a computation unit, and stores values back into the registers via a routing unit. The operation of the circuit is controlled by a Mealy machine which uses a Double Flip Flop and a Counter. The logic operator executes the following functions: AND, OR, XOR, 1111, NAND, NOR, XNOR and 0000.

Overall Block Diagram:

<img width="518" alt="image" src="https://user-images.githubusercontent.com/93052774/183278903-adaa31e0-c681-4c90-81c9-277fcee5bcf6.png">

Function Table:

<img width="165" alt="image" src="https://user-images.githubusercontent.com/93052774/183278958-be727f97-1a1f-4c13-bdaa-0746cc63c767.png">

Routing Table:

<img width="190" alt="image" src="https://user-images.githubusercontent.com/93052774/183278963-e2fc61d8-5201-49f8-b636-7fa043056d51.png">

Fritzing Schematic for function on the board:

<img width="418" alt="image" src="https://user-images.githubusercontent.com/93052774/183279000-ef6d3d0a-1014-4761-97b8-746bd1288c38.png">
