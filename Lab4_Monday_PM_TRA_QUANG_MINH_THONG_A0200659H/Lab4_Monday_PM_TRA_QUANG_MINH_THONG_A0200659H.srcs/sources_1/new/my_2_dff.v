`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2020 21:09:41
// Design Name: 
// Module Name: my_2_dff
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


module my_2_dff(
    input CLOCK,
    input [17:0]dff_clock,
    input dff_input,
    output pulse
    );
    wire dff_out_one;
    wire dff_out_two;
    my_dff first_mod(CLOCK,dff_clock,dff_input,dff_out_one);
    my_dff second_mod(CLOCK,dff_clock,dff_out_one,dff_out_two);
    assign pulse = dff_out_one & ~dff_out_two;
endmodule
