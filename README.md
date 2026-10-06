# 8-Bit General-Purpose Processor

An 8-bit General-Purpose Processor designed and implemented in VHDL using Intel/Altera Quartus. The project integrates register-based storage, an Arithmetic and Logic Unit (ALU), a finite state machine (FSM), a 4-to-16 decoder, and seven-segment display logic into a functional digital processing system.

## Architecture

The processor consists of:

- **Two 8-bit Registers** – Store input values A and B.
- **ALU Core** – Performs arithmetic and logical operations on the two 8-bit inputs.
- **Finite State Machine (FSM)** – Controls the sequence of processor operations.
- **4-to-16 Decoder** – Converts the FSM state into a 16-bit operation-selection signal.
- **Seven-Segment Displays** – Display the student ID information and 8-bit ALU result in hexadecimal.
- **Control Unit** – Integrates the FSM and decoder to generate the ALU operation selector.

## ALU Operations

The initial ALU design supports nine operations:

| Function | Operation |
| --- | --- |
| 1 | A + B |
| 2 | A - B |
| 3 | NOT A |
| 4 | A NAND B |
| 5 | A NOR B |
| 6 | A AND B |
| 7 | A XOR B |
| 8 | A OR B |
| 9 | A XNOR B |

The ALU receives a 16-bit operation-selection signal from the control unit and produces an 8-bit `Result`.

## Control Unit

The control unit consists of an FSM and a 4-to-16 decoder.

The FSM cycles through states 0 to 8 and produces a 4-bit `current_state`. The decoder converts this state into the 16-bit `OP` signal used to select the corresponding ALU operation.

## Simulation and Implementation

The processor was designed and tested using VHDL and Intel/Altera Quartus. The individual components were integrated into the final processor design and verified through functional simulation.

The final design includes two 8-bit inputs (`A` and `B`), an 8-bit `Result`, clock and control signals, and seven-segment display outputs.

## Tools and Technologies

- VHDL
- Intel/Altera Quartus
- FPGA Design
- Digital Logic Design
- Arithmetic and Logic Units
- Finite State Machines
- Registers and Decoders
- Functional Simulation

## Course

**COE/BME 328 – Digital Systems**  
**Lab 6 – Design of a Simple General-Purpose Processor**

## Author

**Akarshan R Singh**
