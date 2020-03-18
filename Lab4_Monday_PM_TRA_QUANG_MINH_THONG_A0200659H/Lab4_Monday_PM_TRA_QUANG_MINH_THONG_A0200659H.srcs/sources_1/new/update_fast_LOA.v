`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2020 16:43:45
// Design Name: 
// Module Name: update_fast_LOA
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


module update_an_LOA(
    input [3:0] input_an,
    output [3:0] output_an
    );
    assign output_an = (input_an == 4'b1110 || input_an == 4'b0000 || input_an == 4'b1111  ) ? 4'b1011: ~((~input_an) >> 1);
endmodule
