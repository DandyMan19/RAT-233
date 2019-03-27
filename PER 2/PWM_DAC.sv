`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2019 01:12:08 AM
// Design Name: 
// Module Name: PWM_DAC
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


module PWM_DAC(
    input clk,
    input [7:0] switches,
    output logic PWM_SIGNAL, LED
    );
    
    logic temp_analog_signal;
    
    initial begin
    temp_analog_signal <= 1'b0;
    end     
        
    logic [7:0] count_variable = 8'b00000000;
    
    always @(posedge clk)
        begin     
                 
                    count_variable = count_variable + 8'b00000001;
                    
//               //check with the count variables where as more switches are high then the square waves showuld be bigger.
//                else if (count_variable == 255)
//                    begin
//                      //  temp_analog_signal <= 1'b0;    
//                        count_variable = 8'b00000000;
//                    end
                    
////                else if (count_variable >= switches)
////                    begin 
////                    temp_analog_signal <= 1'b1;
////                    count_variable = count_variable + 8'b00000001;
////                    end  
//                 else begin
//                    temp_analog_signal <= 1'b1;
//                    count_variable = count_variable + 8'b00000001;
//                   end
                 end 
    
    always_comb 
    begin 
       if (switches == 255)   
       begin     
          temp_analog_signal <= 1'b1;
       end 
       else if (switches == 0)
       begin
        temp_analog_signal <= 1'b0;
       end    
       else if (switches <= count_variable)
       begin     
          temp_analog_signal <= 1'b0;  
       end
       else
       begin     
          temp_analog_signal <= 1'b1;
       end  
    end 
          
      assign PWM_SIGNAL = temp_analog_signal;
      assign LED = temp_analog_signal;          
endmodule
