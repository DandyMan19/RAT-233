`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2019 12:44:11 PM
// Design Name: 
// Module Name: KEY_BBD_WRAPPER
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


module KEY_BBD_WRAPPER(

    input [2:0] COL, ROW,
    input clk, 
    output logic [7:0] seg,
    output logic [3:0] an
    );
    
    logic [2:0] ROWS;
    logic [2:0] COLS;
    logic [7:0] sseg;
    logic [3:0] ans, val, DISP_NUM, BUTTON_PRESS;
    
    KEY_FSM_WRAPPER FSM(
    .COLS   (COL),
    .ROWS   (ROW),
    .clk    (clk),
    .BUTTON_PRESS   (DISP_NUM)
    );
    
    
endmodule
