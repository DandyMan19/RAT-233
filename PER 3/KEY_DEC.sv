`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2019 07:17:10 PM
// Design Name: 
// Module Name: KEY_DEC
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


module KEY_DEC(

    input [3:0] val,
    output logic [3:0] ans,
    output logic [7:0] sseg
    );
    
    always_comb begin
        case (val) 
            4'b0000: sseg = 8'b00000011;//0
            4'b0001: sseg = 8'b10011111;//1
            4'b0010: sseg = 8'b00100101;//2
            4'b0011: sseg = 8'b00001101;//3
            4'b0100: sseg = 8'b10011001;//4
            4'b0101: sseg = 8'b01001001;//5
            4'b0110: sseg = 8'b01000001;//6
            4'b0111: sseg = 8'b00011011;//7
            4'b1000: sseg = 8'b00000001;//8
            4'b1001: sseg = 8'b00011001;//9
            4'b1010: sseg = 8'b00010001;//* or A
            4'b1011: sseg = 8'b11000001;//# or b
//            4'b1111: sseg = 8'b11111111;// no button press is present from the keypad.
        default: sseg = 8'b11111111;
        endcase
        end
        
        assign ans = 4'b1110;
        
endmodule
