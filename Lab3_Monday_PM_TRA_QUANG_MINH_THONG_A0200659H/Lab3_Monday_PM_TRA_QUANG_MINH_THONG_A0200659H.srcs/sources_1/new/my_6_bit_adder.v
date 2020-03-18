`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2020 16:12:25
// Design Name: 
// Module Name: my_6_bit_adder
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


module my_6_bit_adder(input [5:0] A, B, output [5:0] S, input Cin, output Cout);
    wire C1,C2,C3,C4,C5,C6;
    wire temp_S0;
    my_1_bit_adder bit_0(.A(A[0]),.B(B[0]),.S(temp_S0),.Cin(Cin),.Cout(C1));
    my_1_bit_adder bit_1(.A(A[1]),.B(B[1]),.S(S[1]),.Cin(C1),.Cout(C2));
    my_1_bit_adder bit_2(.A(A[2]),.B(B[2]),.S(S[2]),.Cin(C2),.Cout(C3));
    my_1_bit_adder bit_3(.A(A[3]),.B(B[3]),.S(S[3]),.Cin(C3),.Cout(C4));
    my_1_bit_adder bit_4(.A(A[4]),.B(B[4]),.S(S[4]),.Cin(C4),.Cout(C5));
    my_1_bit_adder bit_5(.A(A[5]),.B(B[5]),.S(S[5]),.Cin(C5),.Cout(C6));
    my_1_bit_adder bit_1_final (.A(temp_S0),.B(0),.S(S[0]),.Cin(C6),.Cout(Cout));
endmodule
