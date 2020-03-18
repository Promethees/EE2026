`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2020 22:09:51
// Design Name: 
// Module Name: Switches
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


module Switches(
    input [2:0]SW,
    input CLOCK,
    output blink_LED,
    output reg [5:0] trail_LED = 6'b100000, 
    output reg [7:0] seg_dot = 8'b11000000,
    output reg [3:0] seg_LED = 4'b1001
    );
    blink_LED blinky(CLOCK,blink_LED);
    wire [5:0]new_trail_LED;
    wire [1:0]Cout;
    reg [31:0] COUNT = 0;
    wire [24:0] high_freq;
    wire [25:0] med_freq;
    wire [26:0] low_freq;
    reg [4:0]loop_count = 0;
    always @ (posedge CLOCK)
    begin
        COUNT <= COUNT+1;
        if (SW[2] == 1)
        begin
            trail_LED <= (high_freq == 0) ? new_trail_LED:trail_LED;
            if (trail_LED == 6'b100000 && high_freq == 0)
            begin
                loop_count <= (loop_count == 15) ? 10:loop_count+1;
                if (loop_count == 1)
                    seg_dot <= 8'b11111001;
                else if (loop_count == 2)
                    seg_dot <= 8'b10100100;
                else if (loop_count == 3)
                    seg_dot <= 8'b10110000;
                else if (loop_count == 4)
                    seg_dot <= 8'b10011001;
                else if (loop_count == 5)
                    seg_dot <= 8'b10010010;
                else if (loop_count == 6)
                    seg_dot <= 8'b10000010;
                else if (loop_count == 7)
                    seg_dot <= 8'b11111000;
                else if (loop_count == 8)
                    seg_dot <= 8'b10000000;
                else if (loop_count == 9)
                    seg_dot <= 8'b10010000;
                else if (loop_count == 10)
                    seg_dot <= 8'b10000111;
                else if (loop_count == 11)
                    seg_dot <= 8'b10001001;
                else if (loop_count == 12)
                    seg_dot <= 8'b11000000;
                else if (loop_count == 13)
                    seg_dot <= 8'b10101011;
                else if (loop_count == 14)
                    seg_dot <= 8'b10010000;
                else if (loop_count == 15)
                    seg_dot <= 8'b01111111;
            end
        end    
        else if (SW[1] == 1)
        begin
            trail_LED <= (med_freq == 0) ? new_trail_LED:trail_LED;
            if (trail_LED == 6'b100000 && med_freq == 0)
            begin
                loop_count <= (loop_count == 15) ? 10:loop_count+1;
                if (loop_count == 1)
                    seg_dot <= 8'b11111001;
                else if (loop_count == 2)
                    seg_dot <= 8'b10100100;
                else if (loop_count == 3)
                    seg_dot <= 8'b10110000;
                else if (loop_count == 4)
                    seg_dot <= 8'b10011001;
                else if (loop_count == 5)
                    seg_dot <= 8'b10010010;
                else if (loop_count == 6)
                    seg_dot <= 8'b10000010;
                else if (loop_count == 7)
                    seg_dot <= 8'b11111000;
                else if (loop_count == 8)
                    seg_dot <= 8'b10000000;
                else if (loop_count == 9)
                    seg_dot <= 8'b10010000;
                else if (loop_count == 10)
                    seg_dot <= 8'b10000111;
                else if (loop_count == 11)
                    seg_dot <= 8'b10001001;
                else if (loop_count == 12)
                    seg_dot <= 8'b11000000;
                else if (loop_count == 13)
                    seg_dot <= 8'b10101011;
                else if (loop_count == 14)
                    seg_dot <= 8'b10010000;
                else if (loop_count == 15)
                    seg_dot <= 8'b01111111;
            end
        end
        else if (SW[0] == 1)
        begin
            trail_LED <= (low_freq == 0) ? new_trail_LED:trail_LED;
            if (trail_LED == 6'b100000 && (low_freq == 0))
            begin
                loop_count <= (loop_count == 15) ? 10:loop_count+1;
                if (loop_count == 1)
                    seg_dot <= 8'b11111001;
                else if (loop_count == 2)
                    seg_dot <= 8'b10100100;
                else if (loop_count == 3)
                    seg_dot <= 8'b10110000;
                else if (loop_count == 4)
                    seg_dot <= 8'b10011001;
                else if (loop_count == 5)
                    seg_dot <= 8'b10010010;
                else if (loop_count == 6)
                    seg_dot <= 8'b10000010;
                else if (loop_count == 7)
                    seg_dot <= 8'b11111000;
                else if (loop_count == 8)
                    seg_dot <= 8'b10000000;
                else if (loop_count == 9)
                    seg_dot <= 8'b10010000;
                else if (loop_count == 10)
                    seg_dot <= 8'b10000111;
                else if (loop_count == 11)
                    seg_dot <= 8'b10001001;
                else if (loop_count == 12)
                    seg_dot <= 8'b11000000;
                else if (loop_count == 13)
                    seg_dot <= 8'b10101011;
                else if (loop_count == 14)
                    seg_dot <= 8'b10010000;
                else if (loop_count == 15)
                    seg_dot <= 8'b01111111;           
           end
        end
        else
        begin  
            trail_LED <= (med_freq == 0) ? new_trail_LED:trail_LED;
            if (trail_LED == 6'b100000 && med_freq == 0)
            begin
                loop_count <= (loop_count == 15) ? 10:loop_count+1;
                if (loop_count == 1)
                    seg_dot <= 8'b11111001;
                else if (loop_count == 2)
                    seg_dot <= 8'b10100100;
                else if (loop_count == 3)
                    seg_dot <= 8'b10110000;
                else if (loop_count == 4)
                    seg_dot <= 8'b10011001;
                else if (loop_count == 5)
                    seg_dot <= 8'b10010010;
                else if (loop_count == 6)
                    seg_dot <= 8'b10000010;
                else if (loop_count == 7)
                    seg_dot <= 8'b11111000;
                else if (loop_count == 8)
                    seg_dot <= 8'b10000000;
                else if (loop_count == 9)
                    seg_dot <= 8'b10010000;
                else if (loop_count == 10)
                    seg_dot <= 8'b10000111;
                else if (loop_count == 11)
                    seg_dot <= 8'b10001001;
                else if (loop_count == 12)
                    seg_dot <= 8'b11000000;
                else if (loop_count == 13)
                    seg_dot <= 8'b10101011;
                else if (loop_count == 14)
                    seg_dot <= 8'b10010000;
                else if (loop_count == 15)
                    seg_dot <= 8'b01111111;
            end 
        end
    end
    my_6_bit_adder update_trail(trail_LED,trail_LED,new_trail_LED,0,Cout[0]);
    assign high_freq = COUNT[24:0];
    assign med_freq = COUNT [25:0];
    assign low_freq = COUNT [26:0];
endmodule
