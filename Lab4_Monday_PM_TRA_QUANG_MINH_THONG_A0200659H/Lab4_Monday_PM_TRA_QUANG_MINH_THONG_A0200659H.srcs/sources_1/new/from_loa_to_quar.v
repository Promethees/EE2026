`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2020 21:43:27
// Design Name: 
// Module Name: from_loa_to_quar
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


module from_loa_to_quar(
    input CLOCK,
    input [17:0] fast_clock,
    input [2:0]mode,
    input pulse,
    output reg [2:0] new_mode
    );
    always @ (posedge CLOCK)
    begin
        if (fast_clock == 0)
        begin
            if (mode == 3)
            begin
                if (pulse == 1)
                new_mode <= mode + 3;
            end
            else new_mode <= mode + 1;
        end
    end
endmodule
