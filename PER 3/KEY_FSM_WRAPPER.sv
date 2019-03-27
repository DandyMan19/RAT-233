`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2019 12:39:37 PM
// Design Name: 
// Module Name: KEY_FSM_WRAPPER
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


module KEY_FSM_WRAPPER(

    input clk,
    input [2:0] COLS,
    output logic [3:0] ROWS,
    output logic [7:0] BUTTON_PRESS

);

localparam [2:0] ST_ROWS_0 = 0;
localparam [2:0] ST_ROWS_1 = 1;
localparam [2:0] ST_ROWS_2 = 2;
localparam [2:0] ST_ROWS_3 = 3;

logic [1:0] PS;
logic [1:0] NS;
logic CLK_12KHz;
logic MAX_COUNT_FOR_CLK_12KHz = (8333);
logic [7:0] TEMP_BUTTON_PRESS;

integer div_cnt;

always_ff @(posedge CLK_12KHz)
begin: sync_clk
    PS <= NS;
end

always@ (posedge clk)
begin: div_clk
    div_cnt = 1'b0;
    div_cnt = div_cnt + 1;
    
    if (div_cnt == MAX_COUNT_FOR_CLK_12KHz)
    begin
        CLK_12KHz =~ CLK_12KHz;
        div_cnt = 1'b0;
    end
end

always @(PS, COLS)
begin: FSM_STATE_DETECT
    case(PS)
    ST_ROWS_0:
        begin
            ROWS <= 4'b0001;
            case(COLS)
            
                3'b001: TEMP_BUTTON_PRESS = 8'h01;
                3'b010: TEMP_BUTTON_PRESS = 8'h02;
                3'b100: TEMP_BUTTON_PRESS = 8'h03;
                default:
                    TEMP_BUTTON_PRESS = 8'hFF;
            endcase
            NS <= ST_ROWS_1;
//                if (COLS == 3'b000)
//                    TEMP_BUTTON_PRESS <= 4'b0001;
//                else if (COLS == 3'b001)
//                    TEMP_BUTTON_PRESS <= 4'b0010;
//                else if (COLS == 3'B010)
//                    TEMP_BUTTON_PRESS <= 4'b0011;
//                else
//                    TEMP_BUTTON_PRESS <= 4'b1111;
//                    NS <= ST_ROWS_1;
        end
        
     ST_ROWS_1:
        begin
            ROWS <= 4'b0010;
            case(COLS)
            
                3'b001: TEMP_BUTTON_PRESS = 8'h04;
                3'b010: TEMP_BUTTON_PRESS = 8'h05;
                3'b100: TEMP_BUTTON_PRESS = 8'h06;
                default:
                    TEMP_BUTTON_PRESS = 8'hFF;
            endcase
            NS <= ST_ROWS_2;
//            if (COLS == 3'b000)
//                    TEMP_BUTTON_PRESS <= 4'h4;
//                else if (COLS == 3'b001)
//                    TEMP_BUTTON_PRESS <= 4'h5;
//                else if (COLS == 3'B010)
//                    TEMP_BUTTON_PRESS <= 4'h6;
//                else
//                    TEMP_BUTTON_PRESS <= 4'hF;
//                    NS <= ST_ROWS_2;
        end
        
     ST_ROWS_2:
        begin
            ROWS <= 4'b0100;
            case(COLS)
            
                3'b001: TEMP_BUTTON_PRESS = 8'h07;
                3'b010: TEMP_BUTTON_PRESS = 8'h08;
                3'b100: TEMP_BUTTON_PRESS = 8'h09;
                default:
                    TEMP_BUTTON_PRESS = 8'hFF;
            endcase
            NS <= ST_ROWS_3;
//            if (COLS == 3'b000)
//                    TEMP_BUTTON_PRESS <= 4'b0111;
//                else if (COLS == 3'b001)
//                    TEMP_BUTTON_PRESS <= 4'b1000;
//                else if (COLS == 3'B010)
//                    TEMP_BUTTON_PRESS <= 4'b1001;
//                else
//                    TEMP_BUTTON_PRESS <= 4'b1111;
//                    NS <= ST_ROWS_3;
        end  
        
     ST_ROWS_3:
        begin
            ROWS <= 4'b1000;
            case(COLS)
            
                3'b001: TEMP_BUTTON_PRESS = 8'h0A;
                3'b010: TEMP_BUTTON_PRESS = 8'h00;
                3'b100: TEMP_BUTTON_PRESS = 8'h0B;
                default:
                    TEMP_BUTTON_PRESS = 8'hFF;
            endcase
            NS <= ST_ROWS_0;
//            if (COLS == 3'b000)
//                    TEMP_BUTTON_PRESS <= 4'b1010;
//                else if (COLS == 3'b001)
//                    TEMP_BUTTON_PRESS <= 4'b0000;
//                else if (COLS == 3'B010)
//                    TEMP_BUTTON_PRESS <= 4'b1011;
//                else
//                    TEMP_BUTTON_PRESS <= 4'b1111;
//                    NS <= ST_ROWS_0;
        end
   endcase
 end
 
 assign BUTTON_PRESS = TEMP_BUTTON_PRESS;
            
endmodule