`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2020 14:06:38
// Design Name: 
// Module Name: my_7_bitsubtractor
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


module my_7_bitsubtractor(
    input [6:0] A,
    input [6:0] B,
    output [6:0] S,
    output Cout
    );
    wire [6:0] comp_of_B;
    wire [6:0] temp_S;
    assign comp_of_B[0] = ~ B[0];
    assign comp_of_B[1] = ~ B[1];
    assign comp_of_B[2] = ~ B[2];
    assign comp_of_B[3] = ~ B[3];
    assign comp_of_B[4] = ~ B[4];
    assign comp_of_B[5] = ~ B[5];
    assign comp_of_B[6] = ~ B[6];
    wire C1,C2,C3;
    my_3_bit_adder temp_LSB(.A(A[2:0]),.B(comp_of_B[2:0]),.S(temp_S[2:0]),.Cin(0),.Cout(C1));
    my_4_bit_adder temp_MSB(.A(A[6:3]),.B(comp_of_B[6:3]),.S(temp_S[6:3]),.Cin(C1),.Cout(C2));
    my_3_bit_adder LSB(.A(temp_S[2:0]),.B(3'b000),.S(S[2:0]),.Cin(C2),.Cout(C3));
    my_4_bit_adder MSB(.A(temp_S[6:3]),.B(4'b0000),.S(S[6:3]),.Cin(C3),.Cout(Cout));
    
endmodule
