`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2020 01:22:01
// Design Name: 
// Module Name: update_an_QUAR
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


module update_an_QUAR_pos_0(
    input CLOCK,
    input [17:0] fast_clock,
    input [3:0] input_an,
    output reg [3:0] output_an
    );
    always @ (CLOCK)
    begin
        if (fast_clock == 0)
        begin
            if ( input_an == 4'b1111)
                output_an <= 4'b0111;
            else output_an <= (input_an == 4'b1110) ? 4'b0111 : ~ ( (~input_an) >> 1);
        end 
    end
endmodule
