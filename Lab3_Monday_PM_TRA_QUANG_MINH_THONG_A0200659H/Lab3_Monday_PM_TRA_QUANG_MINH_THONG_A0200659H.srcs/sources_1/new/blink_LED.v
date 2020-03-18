`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2020 12:24:04
// Design Name: 
// Module Name: blink_LED
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


module blink_LED (input CLOCK,output reg blink = 0);
    reg [23:0] COUNT = 0;
    always @ (posedge CLOCK)
    begin 
        COUNT <= COUNT+1;
        blink <= (COUNT == 0) ? ~blink : blink;
    end
endmodule
