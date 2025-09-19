# Cola vending machine
## A Cola vending machine implemented in VHDL (structural architecture)

This project is implemented in VHDL, using a structural architecture. It describes the functioning of a Cola vending machine. The board used is Nexys4 DDR.

<img width="648" height="540" alt="image" src="https://github.com/user-attachments/assets/141f96ac-e527-4506-bf91-4c218d62fcbe" />


The vending machine accepts 5, 10, and 50 "bani" coins (Romanian currency RON). The insertion of these coins is simulated by pressing the buttons available on the board. If no Cola is available, coins are not accepted. The total amount is verified, and the coins are returned if the required sum is not reached. Change is dispensed, if necessary. The entire interaction between the user and the vending machine is simulated using the buttons and LEDs available on the board. Signals are generated and indicated for coin acceptance, total amount verification, and Cola dispensing.

The 7-segment display is used to indicate the total amount inserted and the change to be returned (if necessary). The following convention was used: one 5 "bani" coin is considered as one unit. Due to the representation of the total and change values using 5 bits, the maximum amount accepted by the vending machine is 1.55 lei (31 units).

<img width="519" height="188" alt="image" src="https://github.com/user-attachments/assets/0d13e492-b622-430e-8aac-caacb1188829" />



