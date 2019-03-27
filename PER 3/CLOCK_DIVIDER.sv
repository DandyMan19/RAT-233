`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2019 08:41:04 PM
// Design Name: 
// Module Name: CLOCK_DIVIDER
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


module CLOCK_DIVIDER(

    input clk,
    output logic CLK_500KHz 	
);
    logic MAX_COUNT_FOR_CLK_500KHz = 500000;
    logic [21:0] div_cnt = 0;    //Adds continuously for the 

    //This essentially acts as a clock divider. Div_cnt //continuously adds, and when div_count is equal to the maximum //count, the clock is set to not clock and div_count returns to //zero. DIV_COUNT is 1/(20*500000*2) = 5ms, or 500000kHz. This //allows for the numbers to display on the Basys Board. 
    always_ff @(posedge clk)
    begin: div_clk
        div_cnt <= div_cnt + 1; 
        if (div_cnt == MAX_COUNT_FOR_CLK_500KHz)
        begin
            CLK_500KHz <= ~ CLK_500KHz;
            div_cnt <= 0;
        end
    end

 
endmodule
