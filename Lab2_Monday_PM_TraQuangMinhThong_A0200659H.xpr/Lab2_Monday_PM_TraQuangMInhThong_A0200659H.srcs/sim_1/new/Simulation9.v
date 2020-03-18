`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2020 14:24:20
// Design Name: 
// Module Name: Simulation9
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


module Simulation9( ); //15-27
    reg [6:0] sim_A, sim_B;
    wire [6:0] S;
    wire Cout;
    my_7_bitsubtractor Simulation9(.A(sim_A),.B(sim_B),.S(S),.Cout(Cout));
    initial begin
    sim_A = 7'b0001111; sim_B = 7'b0011011; #100;
    end
endmodule
