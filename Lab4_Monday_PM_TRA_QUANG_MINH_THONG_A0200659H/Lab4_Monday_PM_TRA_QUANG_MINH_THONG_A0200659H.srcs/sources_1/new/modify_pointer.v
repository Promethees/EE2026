`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2020 10:46:08
// Design Name: 
// Module Name: modify_pointer_L
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


module modify_pointer(
    input CLOCK,
    input [17:0]fast_clock,
    input [1:0]pointer,
    input [2:0] mode,
    input pulse1,
    input pulse2,
    output reg [1:0]new_pointer
    );
    always @ ( CLOCK)
    begin
        if (fast_clock == 0)
        begin
        if ((mode == 4 || mode == 5) && (pulse1 == 1 && pulse2 == 0))
        begin
            new_pointer <= (pointer == 3) ? pointer:pointer + 1;
        end
        else if ((mode == 4 || mode == 5) && (pulse1 == 0 && pulse2 == 1))
        begin
            new_pointer <= (pointer == 0) ? pointer:pointer - 1;
        end
        else new_pointer <= pointer;
        end
    end
endmodule
