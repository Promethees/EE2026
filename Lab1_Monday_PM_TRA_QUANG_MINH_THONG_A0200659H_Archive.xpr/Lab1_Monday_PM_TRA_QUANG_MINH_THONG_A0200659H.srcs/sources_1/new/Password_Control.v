`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.01.2020 22:26:05
// Design Name: 
// Module Name: Password_Control
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


module Password_Control(input A1,input A2,input A3,input A4,input B1,input B2,input B3, input B4,input B5,input B6, 
output LED1,output LED2, output LED3, output LED4, output H1,output H2,output H3,output H4,output H5,output H6,output H7,output dp);
    assign H1 = 1 , H2 = 0, H3 = 0, H4 = 1, 
    H5 = 0, H6 = 0, H7 = 0; 
    assign dp = 1;   
    
    assign LED2 = ~( A1 && A2 && A3 && A4 && ~B1 && ~B2 && ~B3 && ~B4 && ~B5 && ~B6 );
    assign LED3 = ~( A1 && A2 && A3 && A4 && ~B1 && ~B2 && ~B3 && ~B4 && ~B5 && ~B6 );
    
    assign LED1 = 1;
    assign LED4 = 1;
endmodule
