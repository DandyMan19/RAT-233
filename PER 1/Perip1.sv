`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2019 12:55:33 PM
// Design Name: 
// Module Name: Perip1
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

module Perip1(
    input clk,
    input [7:0] switches, 
    output reg speaker_out

    );
 //   reg speaker_out;
   // reg clk_tmp; // internal wire between the dcdr and the counter to the clk divider
    
//    initial begin
//    clk_tmp <= 1'b0;
//    end

    integer frequency;
    integer cnt = 0;
    
    always @(switches, frequency)

        begin
            case (switches)
                8'b00000000 : frequency = 0;
                8'b00000001 : frequency = 47801;
                8'b00000010 : frequency = 45126;
                8'b00000011 : frequency = 42589;
                8'b00000100 : frequency = 40192;
                8'b00000101 : frequency = 37936;
                8'b00000110 : frequency = 35816;
                8'b00000111 : frequency = 33806;
                8'b00001000 : frequency = 31908;
                8'b00001001 : frequency = 30102;
                8'b00001010 : frequency = 28409;
                8'b00001011 : frequency = 26824;
                8'b00001100 : frequency = 25316;
                8'b00001101 : frequency = 23889;
                8'b00001110 : frequency = 22552;
                8'b00001111 : frequency = 21285;
                8'b00010000 : frequency = 20088;
                8'b00010001 : frequency = 18960;
                8'b00010010 : frequency = 17901;
                8'b00010011 : frequency = 16897;
                8'b00010100 : frequency = 15948;
                8'b00010101 : frequency = 15051;
                8'b00010110 : frequency = 14204;
                8'b00010111 : frequency = 13408;
                8'b00011000 : frequency = 12655;
                8'b00011001 : frequency = 11944;
                8'b00011010 : frequency = 11276;
                8'b00011011 : frequency = 10642;
                8'b00011100 : frequency = 10044;
                8'b00011101 : frequency = 9480;
                8'b00011110 : frequency = 8949;
                8'b00011111 : frequency = 8447;
                8'b00100000 : frequency = 7973;
                8'b00100001 : frequency = 7525;
                8'b00100010 : frequency = 7102;
                8'b00100011 : frequency = 6704;
                8'b00100100 : frequency = 6327;
                default frequency = 0;
               endcase
           
            end
                always @ (posedge clk)
                
                    begin
                       if (cnt >= frequency) begin
                         speaker_out <= ~speaker_out;
                        
                        // cnt = 0;
                       end
                   cnt <= cnt + 1;
                   end                    
endmodule
