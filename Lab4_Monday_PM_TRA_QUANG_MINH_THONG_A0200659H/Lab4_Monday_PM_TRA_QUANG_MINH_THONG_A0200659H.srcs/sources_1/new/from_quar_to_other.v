`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2020 21:53:42
// Design Name: 
// Module Name: from_quar_to_other
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


module from_quar_to_other(
    input CLOCK,
    input [17:0] fast_clock,
    input [2:0]mode,
    input pulse,
    input [11:0]led,
    input [3:0]pos_0,
    input [3:0]pos_1,
    input [3:0]pos_2,
    input [3:0]pos_3,
    output reg [2:0]new_mode
    );
    always @ (posedge CLOCK)
    begin
        if (fast_clock == 0)
        begin
            if (mode == 4 || mode == 5)
            begin
                if (led == 0) 
                new_mode <= mode - 1;
                else if (pulse == 1 && pos_0 == 10 && pos_1 == 6 && pos_2 == 7 && pos_3 ==1)
                    new_mode <= mode + 2;
                else new_mode <= mode;
            end
        end
    end
endmodule
