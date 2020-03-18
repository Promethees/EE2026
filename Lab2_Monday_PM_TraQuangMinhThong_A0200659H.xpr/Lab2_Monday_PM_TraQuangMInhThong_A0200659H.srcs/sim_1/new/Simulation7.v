`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2020 14:23:27
// Design Name: 
// Module Name: Simulation7
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


module Simulation7( ); //-27-(-18)
    reg [6:0] sim_A, sim_B;
    wire [6:0] S;
    wire Cout;
    my_7_bitsubtractor Simulation7(.A(sim_A),.B(sim_B),.S(S),.Cout(Cout));
    initial begin
    sim_A = 7'b1100100; sim_B = 7'b1101101; #100;
    end
endmodule
