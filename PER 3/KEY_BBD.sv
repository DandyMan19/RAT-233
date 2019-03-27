`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2019 07:27:10 PM
// Design Name: 
// Module Name: KEY_BBD
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


module KEY_BBD(

    input [2:0] COL,		   //Input for columns to the FSM.

    input clk, 			   //Clock signal for keypad.

    output logic [7:0] seg,	   //Segment for the the 
   //seven-segment decoder.

    output logic [3:0] an, ROW,   //Outputs row value from the 
   //Basys Board.
    output INTERRUPT	   //Outputs the interrupt signal 
   //from the Basys Board
    );
    
    logic CLK_500KHz ;		   //Provides a signal for the 
   //clock divider.

    logic REG_LD;
    
    logic MAX_COUNT_FOR_CLK_500KHz = 500000;
//				//Provides a frequency for div_cnt to reach 
////to change the signal of the clock divider

    logic [21:0] div_cnt = 0;    //Adds continuously for the 
   //clock divider, and is set to 
   //zero when frequency is equal 
   //to MAX_COUNT.

//    logic INTERRUPT_SIGNAL = 0;  //Provides the signal for the 
//////   //interrupt.

//    logic MAX_COUNT_FOR_INTERRUPT_FREQUENCY = 6;
//////				//Provides a frequency for int_cnt to change 
////////the signal of the clock divider.

//    logic [1:0] int_cnt;  	   //Adds continuously for the  
////   //interrupt clock and is set to 
////   //zero when frequency if equal 
//   //to MAX_COUNT

//    This essentially acts as a clock divider. Div_cnt //continuously adds, and when div_count is equal to the maximum //count, the clock is set to not clock and div_count returns to //zero. DIV_COUNT is 1/(20*500000*2) = 5ms, or 500000kHz. This //allows for the numbers to display on the Basys Board. 
//    always_ff @(posedge clk)
//    begin: div_clk
//        div_cnt <= div_cnt + 1; 
//        if (div_cnt == MAX_COUNT_FOR_CLK_500KHz)
//        begin
//            CLK_500KHz <= ~ CLK_500KHz;
//            div_cnt <= 0;
//        end
//    end

    logic [3:0] ROWS;		   //Provides a wire for the rows 
   //in the FSM.

    logic [2:0] COLS;		   //Provides a wire for the cols 
   //in the FSM.

    logic [7:0] sseg;		   //Provides a wire for segments 
   //in the seven-segment decoder.

    logic [3:0] ans, DISP_NUM, BUTTON_PRESS;

						   //ans acts as the anodes for the 
   //seven-segment decoder and    
   //DISP_NUM acts as the value 
   //returned by the FSM.
    
//This acts as instantiation for the FSM. COLS is an input 
//for the output ROWS in the FSM, CLK_500KHz acts as the 
//frequency value for the clock divider for rows and columns, and 
//DISP_NUM acts as a button for the value of the number for the //interrupt and seven-segment decoder.

    KEY_FSM FSM(
    .COLS   (COL),
    .ROWS   (ROW),
    .REG_LD (REG_LD),
    .CLK_500KHz    (CLK_500KHz),
    .BUTTON_PRESS   (DISP_NUM)
    );
    
//This acts as a seven-segment decoder. The value is the number //that should be displayed on the Basys Board, and the sseg and //an act as the segments and anodes for the analog clock.

    KEY_DEC DEC(
        .val    (DISP_NUM),
        .sseg   (seg),
        .ans    (an)
    );
    
    CLOCK_DIVIDER   CLK_DIV(

    .clk    (clk),
    .CLK_500KHz (CLK_500KHz) 	
);

INTERRUPT_PULSE_GENERATOR   IPG(
    .clk    (clk),
    .REG_LD   (REG_LD),
    .INTERRUPT  (INTERRUPT)
    );	   //Outputs the interrupt signal 
   //from the Basys Board
//This acts as the clock divider for the interrupt. If there is //no button pressed (DISP_NUM == 4’hF), then there should be no //interrupt signal. If DISP_NUM is anything else, the clock //divider for the interrupt starts. This should be 60ns on and //off, so a clock divider of three ticks should provide the //correct period (20ns*3 = 60ns). When the interrupt counter //(int_cnt) is greater than the MAX_COUNT, then the interrupt //signal goes to not interrupt signal.	
//    always_ff @(posedge clk)
//    begin
//       if (DISP_NUM == 4'hF)
//	   begin
//		int_cnt <= 0;
//          INTERRUPT_SIGNAL <= 0;
//       end
//        if (DISP_NUM == 4'hF)
//        begin
//            int_cnt <= 0;
//            INTERRUPT_SIGNAL <= 0;
//        end
//  else
//       begin
//          int_cnt <= int_cnt + 1;
//		if(int_cnt == MAX_COUNT_FOR_INTERRUPT_FREQUENCY)
//		begin 
//	        INTERRUPT_SIGNAL <= ~INTERRUPT_SIGNAL;
//		   int_cnt <= 0;
//          end
//	  end
//    end
    
//    assign INTERRUPT = INTERRUPT_SIGNAL;

    
endmodule


