`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2020 16:21:51
// Design Name: 
// Module Name: my_3_bit_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module my_3_bit_adder(
    input [2:0] A,
    input [2:0] B,
    output [2:0] S,
    input Cin,
    output Cout
    );
    wire C1,C2;
    my_1_bit_adder bit_0(.A(A[0]),.B(B[0]),.S(S[0]),.Cin(Cin),.Cout(C1));
    my_1_bit_adder bit_1(.A(A[1]),.B(B[1]),.S(S[1]),.Cin(C1),.Cout(C2));
    my_1_bit_adder bit_2(.A(A[2]),.B(B[2]),.S(S[2]),.Cin(C2),.Cout(Cout));

endmodule
