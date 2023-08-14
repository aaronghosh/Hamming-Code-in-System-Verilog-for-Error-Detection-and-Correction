# Hamming-Code-in-System-Verilog-for-Error-Detection-and-Correction
This project aims to illustrate the practical implementation of Hamming Code encoding using the SystemVerilog hardware description language. The Encoder and Decoder modules, which are the core components, work in conjunction with the Serial-to-Parallel and Parallel-to-Serial Converter and Counter modules.





# Hamming-Code
Hamming Code is an error-correcting code widely used in digital communication systems to enhance data integrity during transmission. It achieves error detection and correction by adding redundant bits to the original data. These redundant bits, known as parity bits, are strategically placed to detect and, in some cases, correct errors that may occur during data transmission. Hamming Code is particularly effective at detecting single-bit errors and can also detect certain multi-bit errors. This project showcases the implementation of Hamming Code to demonstrate its practical application in data communication. 

![image](https://github.com/aaronghosh/Hamming-Code-in-System-Verilog-for-Error-Detection-and-Correction/assets/124378527/d745d730-0a85-4dcb-813a-7b604a1b47e3)

# Hamming Code Encoder
 The encoder is responsible for adding redundant parity bits to the input data to enable error detection and correction using Hamming Code.

## Modules

### Up-Counter Encoder

The `upcounterencoder` module is responsible for generating an up-counter that increments every clock cycle. This counter is used to keep track of the number of bits in the input data, which is crucial for determining the positions of the parity bits.

### Serial-to-Parallel Converter

The `serialtoparallel` module implements a serial-to-parallel converter. It takes serial data and, based on a clock signal and control signals, converts it into parallel data. The converter also has a reset mechanism to ensure proper synchronization during operation.

### Encoder Function

The `encoderhamming` module is the core of the encoder. It implements the Hamming Code encoding logic, which adds redundant parity bits to the input data. These parity bits are calculated based on the positions determined by the up-counter.

## Usage

To use the Hamming Code Encoder, follow these steps:

1. Instantiate the `encodermain` module, which orchestrates the encoder's functionality by calling the sub-modules.

2. Provide the necessary inputs to the `encodermain` module, including the data to be encoded (`data_inp`), clock signal (`clk`), write enable signal (`write`), and reset signal (`reset`).

3. The `upcounterencoder` generates an up-counter that keeps track of the number of bits in the input data.

4. The `serialtoparallel` module converts the data from serial to parallel based on control signals and clock.

5. The `encoderhamming` module adds redundant parity bits to the data based on Hamming Code logic.

6. Retrieve the encoded data (`data_outp`) from the `encodermain` module's output.

# Hamming Code Decoder

The decoder is responsible for receiving encoded data, performing error detection and correction using Hamming Code, and converting the data back to its original form.

## Modules

### Counter Decoder

The `counter_decoder` module is responsible for generating a counter that increments every clock cycle, except when a reset signal is active. This counter is used to keep track of the position during parallel-to-serial conversion.

### Parallel-to-Serial Converter

The `serialtoparallel` module implements a parallel-to-serial converter. It takes parallel data and, based on a clock signal and control signals, converts it into serial data. The converter also has a reset mechanism to ensure proper synchronization during operation.

### Decoder Function

The `hamming_decoder` module is the core of the decoder. It implements the Hamming Code decoding logic, which detects and corrects errors in the received data. The function checks for parity bits and uses XOR operations to identify and correct erroneous bits.

## Usage

To use the Hamming Code Decoder, follow these steps:

1. Instantiate the `decodermain` module, which orchestrates the decoder's functionality by calling the sub-modules.

2. Provide the necessary inputs to the `decodermain` module, including the encoded data (`in`), clock signal (`clk`), enable signal (`enable`), parallel-to-serial converter control signals (`pts_reset`, `write`, `shift`), and reset signal (`reset`).

3. The `counter_decoder` generates a counter that keeps track of the position during parallel-to-serial conversion.

4. The `serialtoparallel` module converts the data from parallel to serial based on control signals and clock.

5. The `hamming_decoder` module detects and corrects errors in the data based on Hamming Code logic and the enable signal.

6. Retrieve the corrected data (`out`) from the `decodermain` module's output.


 

 
