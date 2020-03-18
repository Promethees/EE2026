`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2020 22:46:58
// Design Name: 
// Module Name: Simulation
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


module Simulation(

    );
    reg A1, A2, A3, A4, B1, B2, B3, B4, B5, B6;
    
    wire dp,LED1,LED2,LED3,LED4;
    wire H1, H2, H3, H4, H5, H6, H7;
    
    Password_Control test(A1, A2, A3, A4, B1, B2, B3, B4, B5, B6, LED1, LED2, LED3, LED4, H1, H2, H3, H4, H5, H6, H7, dp);
    initial begin
        B1 = 0 ; B2 = 0; B3 = 0; B4 = 0; B6 = 0;
        A1 = 1 ;A2 = 1 ; A3 = 1 ; A4 = 0 ; #100;
        B1 = 0 ; B2 = 0; B3 = 0; B4 = 0; B6 = 0;
        A1 = 1 ;A2 = 1 ; A3 = 1 ; A4 = 1 ; #100;
        B1 = 1 ; B2 = 0; B3 = 0; B4 = 0; B6 = 0;
        A1 = 1 ;A2 = 1 ; A3 = 1 ; A4 = 1 ; #100;
    end
    
endmodule
