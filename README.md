# Hamming-Code-in-System-Verilog-for-Error-Detection-and-Correction

# Hamming-Code
Hamming Code is an error-correcting code widely used in digital communication systems to enhance data integrity during transmission. It achieves error detection and correction by adding redundant bits to the original data. These redundant bits, known as parity bits, are strategically placed to detect and, in some cases, correct errors that may occur during data transmission. Hamming Code is particularly effective at detecting single-bit errors and can also detect certain multi-bit errors. This project showcases the implementation of Hamming Code to demonstrate its practical application in data communication. 

# Overview
This project aims to illustrate the practical implementation of Hamming Code encoding using the SystemVerilog hardware description language. The Encoder and Decoder modules, which are the core components, work in conjunction with the Serial-to-Parallel and Parallel-to-Serial Converter and Counter modules to accomplish the following:

# Encoder

The Encoder takes a stream of input data and transforms it into a Hamming Code with added parity bits. These parity bits enable the detection and correction of errors that may occur during data transmission.

# Serial-to-Parallel Converter 
The Serial-to-Parallel Converter is responsible for converting the serialized Hamming Code into parallel data format. It utilizes memory elements and clock signals to ensure accurate conversion.

# Counter

 The Counter module monitors the number of transmitted data bits. When a predefined count is reached, it triggers the operation of the Encoder. This controlled activation ensures that encoding occurs only after a specific number of data bits have been received.
