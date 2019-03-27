`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 08:00:47 PM
// Design Name: 
// Module Name: Flags
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


module Flags(
        input clk,
        input C,
        input C_CLEAR,
        input C_SET,
        input C_LD,
        output wire C_FLAG,
        input Z_LD,
        input Z,
        output wire Z_FLAG       
    );
    
    C_Flag  UUT(
    .clk    (clk),
    .C      (C),
    .C_CLEAR    (C_CLEAR),
    .C_SET  (C_SET),
    .C_LD   (C_LD),
    .C_FLAG (C_FLAG)
    );
    
    Z_Flag  UUUT(
    .clk    (clk),
    .Z_LD   (Z_LD),
    .Z      (Z),
    .Z_FLAG (Z_FLAG)
    );
    
endmodule
