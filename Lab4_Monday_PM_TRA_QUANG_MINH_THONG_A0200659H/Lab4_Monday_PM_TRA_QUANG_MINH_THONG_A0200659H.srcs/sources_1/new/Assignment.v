`timescale 1ns / 1ps

module Assignment(input btnC, btnU, btnL, btnR, btnD, 
                  input[4:0]sw, 
                  input CLOCK,
                  output reg [3:0]an = 4'b1111, 
                  output reg [7:0]seg = 8'b11111111,
                  output reg [11:0]led = 12'b000000000000
                  );
    parameter [7:0]num_0 = 8'b00000011;
    parameter [7:0]num_1 = 8'b10011111;
    parameter [7:0]num_2 = 8'b00100101;
    parameter [7:0]num_3 = 8'b00001101;
    parameter [7:0]num_4 = 8'b10011001;
    parameter [7:0]num_5 = 8'b01001001;
    parameter [7:0]num_6 = 8'b01000001;
    parameter [7:0]num_7 = 8'b00011111;
    parameter [7:0]num_8 = 8'b00000001;
    parameter [7:0]num_9 = 8'b00001001;
    parameter [7:0]dot = 8'b11111110;
    parameter [7:0]char_1 = 8'b01101111;
    parameter [7:0]char_quar = 8'b01101101;
    parameter [7:0]char_L = 8'b11100011;
    parameter [7:0]char_O = 8'b00000011;
    parameter [7:0]char_A = 8'b00010001;
    parameter [7:0]char_T = 8'b11011101;
    parameter [7:0]char_R = 8'b11110101;
    parameter [7:0]char_Q = 8'b00011001;
    reg [11:0] update_trail_led = 12'b111111111111;
    //reg [11:0] update_trail_led_quar = 12'b111111111111;
    reg [11:0] update_trail_led2 = 12'b111111111111;
    wire [3:0] new_an_LOA;
    wire [3:0] new_an_QUAR_pos_0;
    wire [3:0] new_an_QUAR_pos_1;
    wire [3:0] new_an_QUAR_pos_2;
    wire [3:0] new_an_QUAR_pos_3;
    reg [31:0]COUNTER = 0;
    wire pulse_btnC;
    wire pulse_btnU;
    wire pulse_btnL;
    wire pulse_btnR;
    wire pulse_btnD;
    reg [2:0] mode = 0; 
    wire [2:0] new_mode_1;
    wire [2:0] new_mode_2;
    //mode 0,1 is for first countdown (LED trail)
    //mode 2 for LOA countdown
    //mode 3 for LOA stable
    //mode 4, 5 for QUAR_mode (to modify the password)
    //mode 6 to display TARTZ (task F)
    reg [1:0] pointer = 0;
    reg [3:0] pos_0 = 0;
    reg [3:0] pos_1 = 0;
    reg [3:0] pos_2 = 0;
    reg [3:0] pos_3 = 0;
    wire [1:0] reset_pointer ;
    wire [3:0] reset_pos0 ;
    wire [3:0] reset_pos1 ;
    wire [3:0] reset_pos2 ;
    wire [3:0] reset_pos3 ;
    /*reg blink_0 = 0;
    reg blink_1 = 0;
    reg blink_2 = 0;
    reg blink_3 = 0;*/
    reg blink_0 = 0;
    reg blink_1 = 0;
    reg blink_2 = 0;
    reg blink_3 = 0;
    always @ (posedge CLOCK)
    begin
        COUNTER <= COUNTER + 1;
        if (sw == 5'b11111) 
        begin
            if ( mode == 0|| mode == 1)
            begin
                an <= 4'b0000;
                seg <= char_1;
                if (COUNTER[26:0] == 0)
                begin
                    led <= update_trail_led;
                    update_trail_led <= (update_trail_led << 1);
                    mode <= (led == 0) ? (mode + 1) : mode;
                end
            end 
            else if (mode == 2 )    
            begin
                if (COUNTER [27:0] == 0)
                begin
                    if (an == 4'b0000 ) 
                    begin
                        an <= new_an_LOA;
                        seg <= char_L;
                    end
                    else if (an == 4'b1011)
                    begin
                        an <= new_an_LOA;
                        seg <= char_O;
                    end
                    else if (an == 4'b1101)
                    begin 
                        an <= new_an_LOA;
                       seg <= char_A;
                    end
                    mode <= (an == 4'b1110) ? (mode + 1): mode;
                end
            end
            else if (mode == 3)
            begin
                if (COUNTER [16:0] == 0)
                begin
                    if (an == 4'b1110 || an == 4'b0111) 
                    begin
                        an <= new_an_LOA;
                        seg <= char_L;
                    end
                    else if (an == 4'b1011)
                    begin
                        an <= new_an_LOA;
                        seg <= char_O;
                    end
                    else if (an == 4'b1101)
                    begin 
                        an <= new_an_LOA;
                        seg <= char_A;
                    end
                    //mode <= new_mode_1;
                    mode <= (pulse_btnC == 1) ? 5 : 3;
                    pointer <= 0;
                    pos_0 <= 0;
                    pos_1 <= 0;
                    pos_2 <= 0;
                    pos_3 <= 0;
                    update_trail_led2 <= 12'b111111111111;
                    //an <= (new_mode_1 == 3) ? an : 4'b1110;
               end
            end
            else if (mode == 5 || mode == 4)
            begin
                if (COUNTER [16:0] == 0)
                begin
                    if (pointer == 0)
                    begin
                        if (an == 4'b1110 || an == 4'b1111)
                        begin
                            an <= new_an_QUAR_pos_0;
                            if (pos_3 == 0) seg <= char_quar;
                            else if (pos_3 == 1) seg <= num_0;
                            else if (pos_3 == 2) seg <= num_1;
                            else if (pos_3 == 3) seg <= num_2;
                            else if (pos_3 == 4) seg <= num_3;
                            else if (pos_3 == 5) seg <= num_4;
                            else if (pos_3 == 6) seg <= num_5;
                            else if (pos_3 == 7) seg <= num_6;
                            else if (pos_3 == 8) seg <= num_7;
                            else if (pos_3 == 9) seg <= num_8;
                            else if (pos_3 == 10) seg <= num_9;
                        end
                        else if (an == 4'b0111)
                        begin
                            an <= new_an_QUAR_pos_0;
                            if (pos_2 == 0) seg <= char_quar;
                            else if (pos_2 == 1) seg <= num_0;
                            else if (pos_2 == 2) seg <= num_1;
                            else if (pos_2 == 3) seg <= num_2;
                            else if (pos_2 == 4) seg <= num_3;
                            else if (pos_2 == 5) seg <= num_4;
                            else if (pos_2 == 6) seg <= num_5;
                            else if (pos_2 == 7) seg <= num_6;
                            else if (pos_2 == 8) seg <= num_7;
                            else if (pos_2 == 9) seg <= num_8;
                            else if (pos_2 == 10) seg <= num_9;
                        end
                        else if (an == 4'b1011)
                        begin
                            an <= new_an_QUAR_pos_0;
                            if (pos_1 == 0) seg <= char_quar;
                            else if (pos_1 == 1) seg <= num_0;
                            else if (pos_1 == 2) seg <= num_1;
                            else if (pos_1 == 3) seg <= num_2;
                            else if (pos_1 == 4) seg <= num_3;
                            else if (pos_1 == 5) seg <= num_4;
                            else if (pos_1 == 6) seg <= num_5;
                            else if (pos_1 == 7) seg <= num_6;
                            else if (pos_1 == 8) seg <= num_7;
                            else if (pos_1 == 9) seg <= num_8;
                            else if (pos_1 == 10) seg <= num_9;
                        end
                        else if (an == 4'b1101)
                        begin
                            an <= (blink_0 == 0) ? new_an_QUAR_pos_0 : 4'b1111;
                            //an <= new_an_QUAR_pos_0;
                            if (pos_0 == 0) seg <= char_quar;
                            else if (pos_0 == 1) seg <= num_0;
                            else if (pos_0 == 2) seg <= num_1;
                            else if (pos_0 == 3) seg <= num_2;
                            else if (pos_0 == 4) seg <= num_3;
                            else if (pos_0 == 5) seg <= num_4;
                            else if (pos_0 == 6) seg <= num_5;
                            else if (pos_0 == 7) seg <= num_6;
                            else if (pos_0 == 8) seg <= num_7;
                            else if (pos_0 == 9) seg <= num_8;
                            else if (pos_0 == 10) seg <= num_9;
                            //blink_0 <=  (COUNTER [23:0] == 0) ? (~ blink_0) : blink_0;
                        end
                    end
                    else if (pointer == 1)
                    begin
                        if (an == 4'b1110)
                        begin
                            an <= new_an_QUAR_pos_1;
                            //an <= new_an_QUAR_pos_0;
                            if (pos_3 == 0) seg <= char_quar;
                            else if (pos_3 == 1) seg <= num_0;
                            else if (pos_3 == 2) seg <= num_1;
                            else if (pos_3 == 3) seg <= num_2;
                            else if (pos_3 == 4) seg <= num_3;
                            else if (pos_3 == 5) seg <= num_4;
                            else if (pos_3 == 6) seg <= num_5;
                            else if (pos_3 == 7) seg <= num_6;
                            else if (pos_3 == 8) seg <= num_7;
                            else if (pos_3 == 9) seg <= num_8;
                            else if (pos_3 == 10) seg <= num_9;
                        end
                        else if (an == 4'b0111)
                        begin
                            an <= new_an_QUAR_pos_1;
                            if (pos_2 == 0) seg <= char_quar;
                            else if (pos_2 == 1) seg <= num_0;
                            else if (pos_2 == 2) seg <= num_1;
                            else if (pos_2 == 3) seg <= num_2;
                            else if (pos_2 == 4) seg <= num_3;
                            else if (pos_2 == 5) seg <= num_4;
                            else if (pos_2 == 6) seg <= num_5;
                            else if (pos_2 == 7) seg <= num_6;
                            else if (pos_2 == 8) seg <= num_7;
                            else if (pos_2 == 9) seg <= num_8;
                            else if (pos_2 == 10) seg <= num_9;
                        end
                        else if (an == 4'b1011)
                        begin
                            an <= (blink_1 == 0) ? new_an_QUAR_pos_1 : 4'b1111;
                            if (pos_1 == 0) seg <= char_quar;
                            else if (pos_1 == 1) seg <= num_0;
                            else if (pos_1 == 2) seg <= num_1;
                            else if (pos_1 == 3) seg <= num_2;
                            else if (pos_1 == 4) seg <= num_3;
                            else if (pos_1 == 5) seg <= num_4;
                            else if (pos_1 == 6) seg <= num_5;
                            else if (pos_1 == 7) seg <= num_6;
                            else if (pos_1 == 8) seg <= num_7;
                            else if (pos_1 == 9) seg <= num_8;
                            else if (pos_1 == 10) seg <= num_9;
                            //blink_1 <=  (COUNTER[23:0] == 0) ? (~blink_1) : blink_1;
                        end
                        else if (an == 4'b1101 || an == 4'b1111)
                        begin
                            an <= new_an_QUAR_pos_1;
                            //an <= new_an_QUAR_pos_0;
                            if (pos_0 == 0) seg <= char_quar;
                            else if (pos_0 == 1) seg <= num_0;
                            else if (pos_0 == 2) seg <= num_1;
                            else if (pos_0 == 3) seg <= num_2;
                            else if (pos_0 == 4) seg <= num_3;
                            else if (pos_0 == 5) seg <= num_4;
                            else if (pos_0 == 6) seg <= num_5;
                            else if (pos_0 == 7) seg <= num_6;
                            else if (pos_0 == 8) seg <= num_7;
                            else if (pos_0 == 9) seg <= num_8;
                            else if (pos_0 == 10) seg <= num_9;
                        end
                    end  
                    else if (pointer == 2)
                    begin
                        if (an == 4'b1110)
                            begin
                                an <= new_an_QUAR_pos_2;
                                if (pos_3 == 0) seg <= char_quar;
                                else if (pos_3 == 1) seg <= num_0;
                                else if (pos_3 == 2) seg <= num_1;
                                else if (pos_3 == 3) seg <= num_2;
                                else if (pos_3 == 4) seg <= num_3;
                                else if (pos_3 == 5) seg <= num_4;
                                else if (pos_3 == 6) seg <= num_5;
                                else if (pos_3 == 7) seg <= num_6;
                                else if (pos_3 == 8) seg <= num_7;
                                else if (pos_3 == 9) seg <= num_8;
                                else if (pos_3 == 10) seg <= num_9;
                            end
                            else if (an == 4'b0111)
                            begin
                                an <= (blink_2 == 0) ? new_an_QUAR_pos_2 : 4'b1111;
                                if (pos_2 == 0) seg <= char_quar;
                                else if (pos_2 == 1) seg <= num_0;
                                else if (pos_2 == 2) seg <= num_1;
                                else if (pos_2 == 3) seg <= num_2;
                                else if (pos_2 == 4) seg <= num_3;
                                else if (pos_2 == 5) seg <= num_4;
                                else if (pos_2 == 6) seg <= num_5;
                                else if (pos_2 == 7) seg <= num_6;
                                else if (pos_2 == 8) seg <= num_7;
                                else if (pos_2 == 9) seg <= num_8;
                                else if (pos_2 == 10) seg <= num_9;
                                //blink_2 <=  (COUNTER[23:0] == 0) ? (~blink_2) : blink_2;
                            end
                            else if (an == 4'b1011 || an == 4'b1111)
                            begin
                                an <=  new_an_QUAR_pos_2 ;
                                if (pos_1 == 0) seg <= char_quar;
                                else if (pos_1 == 1) seg <= num_0;
                                else if (pos_1 == 2) seg <= num_1;
                                else if (pos_1 == 3) seg <= num_2;
                                else if (pos_1 == 4) seg <= num_3;
                                else if (pos_1 == 5) seg <= num_4;
                                else if (pos_1 == 6) seg <= num_5;
                                else if (pos_1 == 7) seg <= num_6;
                                else if (pos_1 == 8) seg <= num_7;
                                else if (pos_1 == 9) seg <= num_8;
                                else if (pos_1 == 10) seg <= num_9;
                            end
                            else if (an == 4'b1101)
                            begin
                                an <= new_an_QUAR_pos_2;
                                if (pos_0 == 0) seg <= char_quar;
                                else if (pos_0 == 1) seg <= num_0;
                                else if (pos_0 == 2) seg <= num_1;
                                else if (pos_0 == 3) seg <= num_2;
                                else if (pos_0 == 4) seg <= num_3;
                                else if (pos_0 == 5) seg <= num_4;
                                else if (pos_0 == 6) seg <= num_5;
                                else if (pos_0 == 7) seg <= num_6;
                                else if (pos_0 == 8) seg <= num_7;
                                else if (pos_0 == 9) seg <= num_8;
                                else if (pos_0 == 10) seg <= num_9;
                            end
                        end
                    else if (pointer == 3)
                        begin
                            if (an == 4'b1110)
                            begin
                                an <= (blink_3 == 0) ? new_an_QUAR_pos_3 : 4'b1111;
                                if (pos_3 == 0) seg <= char_quar;
                                else if (pos_3 == 1) seg <= num_0;
                                else if (pos_3 == 2) seg <= num_1;
                                else if (pos_3 == 3) seg <= num_2;
                                else if (pos_3 == 4) seg <= num_3;
                                else if (pos_3 == 5) seg <= num_4;
                                else if (pos_3 == 6) seg <= num_5;
                                else if (pos_3 == 7) seg <= num_6;
                                else if (pos_3 == 8) seg <= num_7;
                                else if (pos_3 == 9) seg <= num_8;
                                else if (pos_3 == 10) seg <= num_9;
                                //blink_3 <=  (COUNTER[23:0] == 0) ? (~blink_3) : blink_3;
                            end
                            else if (an == 4'b0111 || an == 4'b1111)
                            begin
                                an <= new_an_QUAR_pos_3;
                                if (pos_2 == 0) seg <= char_quar;
                                else if (pos_2 == 1) seg <= num_0;
                                else if (pos_2 == 2) seg <= num_1;
                                else if (pos_2 == 3) seg <= num_2;
                                else if (pos_2 == 4) seg <= num_3;
                                else if (pos_2 == 5) seg <= num_4;
                                else if (pos_2 == 6) seg <= num_5;
                                else if (pos_2 == 7) seg <= num_6;
                                else if (pos_2 == 8) seg <= num_7;
                                else if (pos_2 == 9) seg <= num_8;
                                else if (pos_2 == 10) seg <= num_9;
                            end
                            else if (an == 4'b1011)
                            begin
                                an <=  new_an_QUAR_pos_3 ;
                                if (pos_1 == 0) seg <= char_quar;
                                else if (pos_1 == 1) seg <= num_0;
                                else if (pos_1 == 2) seg <= num_1;
                                else if (pos_1 == 3) seg <= num_2;
                                else if (pos_1 == 4) seg <= num_3;
                                else if (pos_1 == 5) seg <= num_4;
                                else if (pos_1 == 6) seg <= num_5;
                                else if (pos_1 == 7) seg <= num_6;
                                else if (pos_1 == 8) seg <= num_7;
                                else if (pos_1 == 9) seg <= num_8;
                                else if (pos_1 == 10) seg <= num_9;
                            end
                            else if (an == 4'b1101)
                            begin
                                an <= new_an_QUAR_pos_3;
                                if (pos_0 == 0) seg <= char_quar;
                                else if (pos_0 == 1) seg <= num_0;
                                else if (pos_0 == 2) seg <= num_1;
                                else if (pos_0 == 3) seg <= num_2;
                                else if (pos_0 == 4) seg <= num_3;
                                else if (pos_0 == 5) seg <= num_4;
                                else if (pos_0 == 6) seg <= num_5;
                                else if (pos_0 == 7) seg <= num_6;
                                else if (pos_0 == 8) seg <= num_7;
                                else if (pos_0 == 9) seg <= num_8;
                                else if (pos_0 == 10) seg <= num_9;
                            end
                        end
                    //mode <= new_mode_2;
                    //blink <= (COUNTER [23:0] == 0) ? ~blink : blink;
                    if (COUNTER [26:0] == 0)
                    begin
                        led <= update_trail_led2;
                        update_trail_led2 <= update_trail_led2 << 1;
                        mode <= (led == 0) ? mode - 1 : mode;
                        
                    end
                    if ( led != 0)
                    begin
                        if (pulse_btnC == 1)
                            mode <= (pos_0 == 10 && pos_1 == 6 && pos_2 == 7 && pos_3 == 1) ? mode + 2 : mode;
                        else mode <= mode;
                    end                    
                    pointer <= reset_pointer;
                    pos_0 <= reset_pos0;
                    pos_1 <= reset_pos1;
                    pos_2 <= reset_pos2;
                    pos_3 <= reset_pos3;
                end
            end
            else if (mode == 6)
            begin
                led <= 0;
                if (COUNTER [16:0] == 0)
                begin
                    if (an == 4'b1110)
                    begin
                        an <= new_an_QUAR_pos_0;
                        seg <= char_T;                         
                    end
                    else if (an == 4'b0111)
                    begin
                        an <= new_an_QUAR_pos_0;
                        seg <= char_R;
                    end
                    else if (an == 4'b1011)
                    begin
                        an <= new_an_QUAR_pos_0;
                        seg <= char_A;
                    end
                    else if (an == 4'b1101)
                    begin
                        an <= new_an_QUAR_pos_0;
                        seg <= char_Q;
                    end
                end
            end
        end
    end
    always @ (posedge CLOCK)
    begin
        if (COUNTER [23:0] == 0)
        begin
            blink_0 <= ~blink_0;
            blink_1 <= ~blink_1;
            blink_2 <= ~blink_2;
            blink_3 <= ~blink_3;
        end
    end
    
    update_an_LOA update_LOA (an, new_an_LOA);
    update_an_QUAR_pos_0 update_QUAR_0 (CLOCK, COUNTER[16:0], an, new_an_QUAR_pos_0);
    update_an_QUAR_pos_1 update_QUAR_1 (CLOCK, COUNTER [16:0], an, new_an_QUAR_pos_1);
    update_an_QUAR_pos_2 update_QUAR_2 (CLOCK, COUNTER [16:0], an, new_an_QUAR_pos_2);
    update_an_QUAR_pos_3 update_QUAR_3 (CLOCK, COUNTER [16:0], an, new_an_QUAR_pos_3);
    
    my_2_dff btn_C_sense(CLOCK,COUNTER[16:0],btnC,pulse_btnC);
    my_2_dff btn_U_sense(CLOCK,COUNTER[16:0],btnU,pulse_btnU);
    my_2_dff btn_L_sense(CLOCK,COUNTER[16:0],btnL,pulse_btnL);
    my_2_dff btn_R_sense(CLOCK,COUNTER[16:0],btnR,pulse_btnR);
    my_2_dff btn_D_sense(CLOCK,COUNTER[16:0],btnD,pulse_btnD);
    
    from_loa_to_quar shift_mode_1 (CLOCK,COUNTER [16:0],mode,pulse_btnC,new_mode_1);
    from_quar_to_other shift_mode_2 (CLOCK,COUNTER [16:0],mode,led,pulse_btnC,pos_0,pos_1,pos_2,pos_3,new_mode_2);
    
    modify_pointer use_but_LR(CLOCK,COUNTER[16:0],pointer,mode,pulse_btnL,pulse_btnR,reset_pointer);
    
    count_digits use_but_UD(CLOCK,COUNTER[16:0],pointer,mode,pulse_btnD,pulse_btnU,pos_0,pos_1,pos_2,pos_3,reset_pos0,reset_pos1,reset_pos2,reset_pos3);    
    
endmodule
