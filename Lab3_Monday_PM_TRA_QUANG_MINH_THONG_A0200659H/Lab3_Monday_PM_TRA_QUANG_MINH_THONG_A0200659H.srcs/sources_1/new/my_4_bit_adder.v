`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.02.2020 13:37:11
// Design Name: 
// Module Name: my_4_bit_adder
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


module my_5_bit_adder(
    input [4:0] A,
    input [4:0] B,
    output [4:0] S,
    input Cin,
    output Cout
    );
    wire C1,C2,C3,C4;
    my_1_bit_adder bit0(A[0],B[0],S[0],Cin,C1);
    my_1_bit_adder bit1(A[1],B[1],S[1],C1,C2);
    my_1_bit_adder bit2(A[2],B[2],S[2],C2,C3);
    my_1_bit_adder bit3(A[3],B[3],S[3],C3,C4);
    my_1_bit_adder bit4(A[4],B[4],S[4],C4,Cout);
endmodule
