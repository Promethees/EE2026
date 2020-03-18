`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 15:33:58
// Design Name: 
// Module Name: Count_down_C
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


module Count_down_C(
    input [11:0] input_LED,
    output [11:0] output_LED
    );
    assign output_LED = (input_LED << 1);
endmodule
