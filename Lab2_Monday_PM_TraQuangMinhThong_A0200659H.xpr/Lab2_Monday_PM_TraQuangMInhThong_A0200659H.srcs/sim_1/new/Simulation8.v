`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2020 14:23:44
// Design Name: 
// Module Name: Simulation8
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

module Simulation8( ); //-27-(-35)
    reg [6:0] sim_A, sim_B;
    wire [6:0] S;
    wire Cout;
    my_7_bitsubtractor Simulation8(.A(sim_A),.B(sim_B),.S(S),.Cout(Cout));
    initial begin
    sim_A = 7'b1100100; sim_B = 7'b1011100; #100;
    end
endmodule
