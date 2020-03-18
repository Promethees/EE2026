`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2020 16:17:03
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


module my_4_bit_adder(
    input [3:0] A,
    input [3:0] B,
    output [3:0] S,
    input Cin,
    output Cout
    );
    wire C1,C2,C3;
    my_1_bit_adder clone1(.A(A[0]),.B(B[0]),.S(S[0]),.Cin(Cin),.Cout(C1));
    my_1_bit_adder clone2(.A(A[1]),.B(B[1]),.S(S[1]),.Cin(C1),.Cout(C2));
    my_1_bit_adder clone3(.A(A[2]),.B(B[2]),.S(S[2]),.Cin(C2),.Cout(C3));
    my_1_bit_adder clone4(.A(A[3]),.B(B[3]),.S(S[3]),.Cin(C3),.Cout(Cout));

endmodule
