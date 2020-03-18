`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2020 12:43:20
// Design Name: 
// Module Name: LED_trail_M
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


module LED_trail_M(input CLOCK, output reg[5:0] trail_LED = 6'b000001);
    reg [31:0] COUNT = 0;
    wire [5:0] new_trail_LED;
    wire [25:0] freq;
    wire Cout;
    always @ (posedge CLOCK)
    begin
        COUNT <= COUNT + 1;
        trail_LED <= (freq == 0) ? new_trail_LED : trail_LED;     
    end
    my_6_bit_adder new_trail(trail_LED,trail_LED,new_trail_LED,0,Cout);
    assign freq = COUNT[25:0];
endmodule 
