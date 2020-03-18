`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.02.2020 14:23:08
// Design Name: 
// Module Name: Simulation6
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


module Simulation6( ); //23-33
    reg [6:0] sim_A, sim_B;
    wire [6:0] S;
    wire Cout;
    my_7_bitsubtractor Simulation6(.A(sim_A),.B(sim_B),.S(S),.Cout(Cout));
    initial begin
    sim_A = 7'b0010111; sim_B = 7'b0100001; #100;
    end
endmodule
