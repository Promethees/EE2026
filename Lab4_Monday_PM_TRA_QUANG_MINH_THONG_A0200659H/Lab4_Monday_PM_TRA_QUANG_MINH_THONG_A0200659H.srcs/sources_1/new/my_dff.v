`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.03.2020 21:01:10
// Design Name: 
// Module Name: my_dff
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


module my_dff(input CLOCK,input [17:0]dff_clock,input dff_in, output reg dff_out = 0 );
    always @ (posedge CLOCK)
    begin
        dff_out <= (dff_clock == 0) ? dff_in : dff_out;
    end
endmodule
