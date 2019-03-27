`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2019 01:20:24 PM
// Design Name: 
// Module Name: CathodeDriver
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

module CathodeDriver(
    input CLK_500KHz,                  // 100 MHz clock
    input [15:0] HEX,
    output logic [7:0] CATHODES,
    output logic [3:0] ANODES
    );
    
    logic s_clk_500 = 1'b0;             // 250Hz refresh clock
    logic [1:0] r_disp_digit = 2'b00;   // current digit being displayed
    logic [19:0] clk_div_counter = 20'h00000;

    // Clock Divider to create 500 Hz refresh from 100 MHz clock
//	always_ff @(posedge CLK_500KHz) begin
//        clk_div_counter = clk_div_counter + 1;
//        if ( clk_div_counter == 20'h186A0) begin     // x186A0 = 1*10^5 = 1 ms toggle (x30D40)
//            clk_div_counter = 20'h00000;
//            s_clk_500 = ~s_clk_500;         // toggle every 1 ms creates 500 Hz clock
//        end
//    end
    
    // Refresh Seven Segment Display every 240 Hz
    always_ff @(posedge CLK_500KHz) begin
        case (r_disp_digit)
            2'b00: begin
                ANODES= 4'b1110;
                case (HEX[3:0])
                    4'b0000: CATHODES = 8'b00000011;//0
                    4'b0001: CATHODES = 8'b10011111;//1
                    4'b0010: CATHODES = 8'b00100101;//2
                    4'b0011: CATHODES = 8'b00001101;//3
                    4'b0100: CATHODES = 8'b10011001;//4
                    4'b0101: CATHODES = 8'b01001001;//5
                    4'b0110: CATHODES = 8'b01000001;//6
                    4'b0111: CATHODES = 8'b00011011;//7
                    4'b1000: CATHODES = 8'b00000001;//8
                    4'b1001: CATHODES = 8'b00011001;//9
                    4'b1010: CATHODES = 8'b10001000; //a
                    4'b1011: CATHODES = 8'b11100000;//b
//                    4'b1100: CATHODES = 8'b10110001;//c
//                    4'b1101: CATHODES = 8'b11000010;//d
//                    4'b1110: CATHODES = 8'b10110000;//e
//                    4'b1111: CATHODES = 8'b10111000;//f
                    default: CATHODES = 8'b11111111; // all off on error
                endcase
            end
            2'b01: begin
                ANODES= 4'b1101;
                case (HEX[7:4])
                    4'b0000: CATHODES = 8'b00000011;
                    4'b0001: CATHODES = 8'b10011111;
                    4'b0010: CATHODES = 8'b00100101;
                    4'b0011: CATHODES = 8'b00001101;
                    4'b0100: CATHODES = 8'b10011001;
                    4'b0101: CATHODES = 8'b01001001;
                    4'b0110: CATHODES = 8'b01000001;
                    4'b0111: CATHODES = 8'b00011011;
                    4'b1000: CATHODES = 8'b00000001;
                    4'b1001: CATHODES = 8'b00011001;
                    4'b1010: CATHODES = 8'b10001000; //a
                    4'b1011: CATHODES = 8'b11100000;
//                    4'b1100: CATHODES = 8'b10110001;
//                    4'b1101: CATHODES = 8'b11000010;
//                    4'b1110: CATHODES = 8'b10110000;
//                    4'b1111: CATHODES = 8'b10111000;
                    default: CATHODES = 8'b11111111; // all off on error
                endcase
            end
            2'b10: begin
                ANODES= 4'b1011;
                case (HEX[11:8])
                    4'b0000: CATHODES = 8'b00000011;
                    4'b0001: CATHODES = 8'b10011111;
                    4'b0010: CATHODES = 8'b00100101;
                    4'b0011: CATHODES = 8'b00001101;
                    4'b0100: CATHODES = 8'b10011001;
                    4'b0101: CATHODES = 8'b01001001;
                    4'b0110: CATHODES = 8'b01000001;
                    4'b0111: CATHODES = 8'b00011011;
                    4'b1000: CATHODES = 8'b00000001;
                    4'b1001: CATHODES = 8'b00011001;
                    4'b1010: CATHODES = 8'b10001000; //a
                    4'b1011: CATHODES = 8'b11100000;
//                    4'b1100: CATHODES = 8'b10110001;
//                    4'b1101: CATHODES = 8'b11000010;
//                    4'b1110: CATHODES = 8'b10110000;
//                    4'b1111: CATHODES = 8'b10111000;
                    default: CATHODES = 8'b11111111; // all off on error
                endcase
            end
            2'b11: begin
                ANODES= 4'b0111;
                case (HEX[15:12])
                    4'b0000: CATHODES = 8'b00000011;
                    4'b0001: CATHODES = 8'b10011111;
                    4'b0010: CATHODES = 8'b00100101;
                    4'b0011: CATHODES = 8'b00001101;
                    4'b0100: CATHODES = 8'b10011001;
                    4'b0101: CATHODES = 8'b01001001;
                    4'b0110: CATHODES = 8'b01000001;
                    4'b0111: CATHODES = 8'b00011011;
                    4'b1000: CATHODES = 8'b00000001;
                    4'b1001: CATHODES = 8'b00011001;
                    4'b1010: CATHODES = 8'b10001000; //a
                    4'b1011: CATHODES = 8'b11100000;
//                    4'b1100: CATHODES = 8'b10110001;
//                    4'b1101: CATHODES = 8'b11000010;
//                    4'b1110: CATHODES = 8'b10110000;
//                    4'b1111: CATHODES = 8'b10111000;
                    default: CATHODES = 8'b11111111; // all off on error
                endcase
            end
            default: begin      // digit error turn everything off
                ANODES = 4'hF;
                CATHODES = 8'hFF;
                r_disp_digit = 2'b00;
            end
        endcase
        
        r_disp_digit = r_disp_digit + 1;
    end

endmodule
