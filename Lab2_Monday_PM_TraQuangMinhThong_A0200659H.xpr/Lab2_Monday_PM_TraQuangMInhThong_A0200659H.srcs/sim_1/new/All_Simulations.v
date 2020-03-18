`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2020 16:15:39
// Design Name: 
// Module Name: All_Simulations
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


module All_Simulations( );
    reg [6:0] sim_A, sim_B;
    wire [6:0] S;
    wire Cout;
    my_7_bitsubtractor All_Simulation(.A(sim_A),.B(sim_B),.S(S),.Cout(Cout));
    initial begin
    sim_A = 7'b1111110; sim_B = 7'b0111011; #100;
    sim_A = 7'b0100011; sim_B = 7'b1101111; #100;
    sim_A = 7'b0100111; sim_B = 7'b0011011; #100;
    sim_A = 7'b0100000; sim_B = 7'b1101110; #100;
    sim_A = 7'b0011110; sim_B = 7'b0010011; #100;
    sim_A = 7'b0010111; sim_B = 7'b0100001; #100;
    sim_A = 7'b1100100; sim_B = 7'b1101101; #100;
    sim_A = 7'b1100100; sim_B = 7'b1011100; #100;
    sim_A = 7'b0001111; sim_B = 7'b0011011; #100;
    sim_A = 7'b1101010; sim_B = 7'b0001101; #100;
    end
endmodule
