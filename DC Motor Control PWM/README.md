# DC Motor Control PWM

We had to create a circuit that would control two motors to perform different functionalities:

1. A photoresistive circuit that would make the car "light-seeking"
2. Modify the circuit above to incorporate a potentiometer to control the angle of turn that the car would perform, essentially discovering values that would make the car run in a perfectly straight line.
3. Prepare a lock system for the car - incorporate a resistive circuit using Wheatstone Bridge properties and comparators to ensure only a specific resistor with minor tolerance would activate the circuit and run the car.

Circuit Diagram for Potentiometer:

![image](https://user-images.githubusercontent.com/93052774/183144516-0e481bdd-9629-4829-8e04-e00bacb8af10.png)

Duty Cycle Calculation for straight line:

![image](https://user-images.githubusercontent.com/93052774/183145205-d41ca363-3f14-42f2-9c64-ea8c049eeb37.png)

Wheatstone Bridge Property:

![image](https://user-images.githubusercontent.com/93052774/183145435-7e7cac13-36c7-47ac-92d8-a9cbb852d51c.png)

Modified Circuit with Resistive Network:

![image](https://user-images.githubusercontent.com/93052774/183145625-890845fa-2d4c-4860-b154-10be59d5233a.png)
