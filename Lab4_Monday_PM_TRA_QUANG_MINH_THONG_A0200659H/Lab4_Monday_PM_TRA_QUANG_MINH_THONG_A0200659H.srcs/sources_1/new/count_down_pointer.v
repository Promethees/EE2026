`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2020 16:05:38
// Design Name: 
// Module Name: count_down_pointer
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
module count_digits(
    input CLOCK,
    input [17:0]fast_clock,
    input [1:0]pointer,
    input [2:0] mode,
    input pulse1,
    input pulse2,
    input [3:0]pos_0,
    input [3:0]pos_1,
    input [3:0]pos_2,
    input [3:0]pos_3,
    output reg [3:0]reset_pos0,
    output reg [3:0]reset_pos1,
    output reg [3:0]reset_pos2,
    output reg [3:0]reset_pos3
    );
    always @ ( CLOCK)
    begin
            if (fast_clock == 0)
            begin
                if (mode == 4 || mode == 5)
                begin
                if (pulse1 == 1 && pulse2 == 0)
                begin
                    if (pointer == 0)
                    begin
                        reset_pos0 <= (pos_0 == 0) ? 10: pos_0 - 1;
                        reset_pos1 <= pos_1;
                        reset_pos2 <= pos_2;
                        reset_pos3 <= pos_3; 
                    end
                    else if (pointer == 1)
                    begin
                    reset_pos1 <= (pos_1 == 0) ? 10: pos_1 - 1;
                    reset_pos0 <= pos_0;
                    reset_pos2 <= pos_2;
                    reset_pos3 <= pos_3;
                    end
                    else if (pointer == 2)
                    begin
                    reset_pos2 <= (pos_2 == 0) ? 10: pos_2 - 1;
                    reset_pos1 <= pos_1;
                    reset_pos0 <= pos_0;
                    reset_pos3 <= pos_3;
                    end
                    else if (pointer == 3)
                    begin
                    reset_pos3 <= (pos_3 == 0) ? 10: pos_3 - 1;
                    reset_pos1 <= pos_1;
                    reset_pos2 <= pos_2;
                    reset_pos0 <= pos_0;
                    end
                end
                else if (pulse1 == 0 && pulse2 == 1)
                begin
                    if (pointer == 0)
                    begin
                        reset_pos0 <= (pos_0 == 10) ? 0: pos_0 + 1;
                        reset_pos1 <= pos_1;
                        reset_pos2 <= pos_2;
                        reset_pos3 <= pos_3; 
                    end
                    else if (pointer == 1)
                    begin
                    reset_pos1 <= (pos_1 == 10) ? 0: pos_1 + 1;
                    reset_pos0 <= pos_0;
                    reset_pos2 <= pos_2;
                    reset_pos3 <= pos_3;
                    end
                    else if (pointer == 2)
                    begin
                    reset_pos2 <= (pos_2 == 10) ? 0: pos_2 + 1;
                    reset_pos1 <= pos_1;
                    reset_pos0 <= pos_0;
                    reset_pos3 <= pos_3;
                    end
                    else if (pointer == 3)
                    begin
                    reset_pos3 <= (pos_3 == 10) ? 0: pos_3 + 1;
                    reset_pos1 <= pos_1;
                    reset_pos2 <= pos_2;
                    reset_pos0 <= pos_0;
                    end
                end
                else 
                begin
                    reset_pos0 <= pos_0;
                    reset_pos1 <= pos_1;
                    reset_pos2 <= pos_2;
                    reset_pos3 <= pos_3;
                end
            end
        end
    end
endmodule


