

List FileKey 
----------------------------------------------------------------------
C1      C2      C3      C4    || C5
--------------------------------------------------------------
C1:  Address (decimal) of instruction in source file. 
C2:  Segment (code or data) and address (in code or data segment) 
       of inforation associated with current linte. Note that not all
       source lines will contain information in this field.  
C3:  Opcode bits (this field only appears for valid instructions.
C4:  Data field; lists data for labels and assorted directives. 
C5:  Raw line from source code.
----------------------------------------------------------------------


(0001)                            || 
(0002)                       066  || .EQU TOGGLE_LED = 0x42	;Provides the output port for LEDs.
(0003)                       154  || .EQU SWITCH = 0x9A		;Provides the input port for switches.
(0004)                       155  || .EQU BUTTON_IN = 0x9B	;Provides the input port for buttons.
(0005)                            || 
(0006)                            || .CSEG				;Initializes the code segment.
(0007)                       154  || .ORG 0x9A				;Starts the code segment at port 0x9A.
(0008)                            || 
(0009)                            || ;---------------------------------------------------------------
(0010)                            || ;-	Instantiations
(0011)                            || ;---------------------------------------------------------------
(0012)                            || ;The necessary instantiations are R0, the register that toggles ;and outputs to LED_OUT, R1, the register that reads from ;switches to set the toggle for R0, R2, the register that ;determines if the same input is read from switches as the ;previous, R3, t

(0013)                            || he register that determines the button input, 
            syntax error
            syntax error
            syntax error
            syntax error

(0014)                            || ;and R4, a placeholder register that acts as 0x00 to be output 
(0015)                            || ;in the second interrupt loop. Ensure the interrupt is set.
(0016)                            || ;---------------------------------------------------------------
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x084D0  0x100  ||              BRN     0x9A        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0017)  CS-0x09A  0x36000         || MOV R0, 0x00			;Register that is output to the LEDs 
(0018)                            || ;and toggles based on switches.
(0019)                            || 
(0020)  CS-0x09B  0x36100         || MOV R1, 0x00			;Register that inputs the switches from 
(0021)                            || ;the interrupt from R0.
(0022)                            || 
(0023)  CS-0x09C  0x36200         || MOV R2, 0x00			;Register that determines if the 
(0024)                            || ;current switch value is equal to the ;previous.
(0025)                            || 
(0026)  CS-0x09D  0x36300         || MOV R3, 0x00			;Register that acts as a button input.
(0027)                            || 
(0028)  CS-0x09E  0x36400         || MOV R4, 0x00			;Register that acts as a placeholder.
(0029)                            || 
(0030)  CS-0x09F  0x1A000         || SEI				
(0031)                            || 
(0032)                            || 
(0033)                            || 
(0034)                            || ;---------------------------------------------------------------
(0035)                            || ;	MAIN
(0036)                            || ;---------------------------------------------------------------
(0037)                            || ;The main code should only write whatever is in R0. It is an 
(0038)                            || ;infinite loop that outputs the value of R0, and loops back to 
(0039)                            || ;itself. Interrupts are enabled, so the only change that can 
(0040)                            || ;occur on R0 is an interrupt.
(0041)                            || ;---------------------------------------------------------------
(0042)                            || 
(0043)                     0x0A0  || MAIN:
(0044)                            || 
(0045)  CS-0x0A0  0x34042         || OUT R0, TOGGLE_LED		;Outputs R0 to port 0x42. 
(0046)                            || 
(0047)  CS-0x0A1  0x08500         || BRN MAIN				;Loops back to main so the only thing 
(0048)                            || ;that can prevent the LEDs from being 
(0049)                            || ;output is an interrupt.
(0050)                            || 
(0051)                            || ;---------------------------------------------------------------
(0052)                            || ;	ISR
(0053)                            || ;---------------------------------------------------------------
(0054)                            || ;The ISR function toggles the value of the LED’s output 
(0055)                            || ;with the input from the switches. It also keeps track of the ;interrupts used, and if the previous interrupt is equal to the ;current interrupt, the program branches to ISR2, or the second ;interrupt. If both interrupts are different, R0 will change and 

(0056)                            || ;return with interrupts enabled back to main, providing the new ;output for R0.
(0057)                            || ;---------------------------------------------------------------
(0058)                            || 
(0059)                     0x0A2  || ISR: 
(0060)  CS-0x0A2  0x3219A         || 	 IN R1, SWITCH		;This puts the input from port 0x9A—the 
(0061)                            || ;switches—into R1.
(0062)                            || 
(0063)  CS-0x0A3  0x04110         || 	 CMP R1, R2		;R2 acts as the previous value in 
(0064)                            || ;switches.
(0065)                            || 
(0066)  CS-0x0A4  0x08542         || 	 BREQ ISR2		;If the current value of R1 is equal to 
(0067)                            || ;the previous value in switches, branch 
(0068)                            || ;to ISR2.
(0069)                            || 
(0070)  CS-0x0A5  0x04209         || 	 MOV R2, R1		;This moves thE value of R1 into R2 
(0071)                            || ;for the next value in switches.
(0072)                            || 
(0073)  CS-0x0A6  0x0000A         || 	 EXOR R0, R1		;Toggles the value of R0 with R1.
(0074)  CS-0x0A7  0x1A003         || RETIE				;Returns to main with interrupt.
(0075)                            || 
(0076)                            || ;---------------------------------------------------------------
(0077)                            || ;	ISR 2
(0078)                            || ;---------------------------------------------------------------
(0079)                            || ;The second interrupt first outputs zero to the LED, then ;continuously loops to check if there is a button input entering ;the program. If not, the program loops again. If the button is ;pressed, branch to return.
(0080)                            || ;---------------------------------------------------------------
(0081)                     0x0A8  || ISR2:
(0082)  CS-0x0A8  0x34442         || 	 OUT R4, TOGGLE_LED	;0 is output to port 0x42.
(0083)                            || 	
(0084)  CS-0x0A9  0x3239B         ||  IN R3, BUTTON_IN	;Allows user to input a value for 
(0085)                            || ;button into R3.
(0086)                            || 
(0087)  CS-0x0AA  0x10301         || 	 LSR R3			;Shifts R3 over to determine if the 
(0088)                            || ;final bit is a carry.
(0089)                            || 	
(0090)  CS-0x0AB  0x0A568         ||  BRCS RETURN		;If there is a carry, branch to return
(0091)                            || 	
(0092)  CS-0x0AC  0x0A541         ||  BRCC ISR2		;If not, continue looping.
(0093)                            || 
(0094)                            || ;---------------------------------------------------------------
(0095)                            || ;	Return
(0096)                            || ;---------------------------------------------------------------
(0097)                            || ;This allows a return from ISR2 to Main. The interrupt is 
(0098)                            || ;enabled.
(0099)                            || ;---------------------------------------------------------------
(0100)                     0x0AD  || RETURN:
(0101)  CS-0x0AD  0x1A003         || RETIE				;This returns to main with interrupt 
(0102)                            || ;enabled.
(0103)                            || 
(0104)                            || 
(0105)                            || ;---------------------------------------------------------------
(0106)                            || ;	Interrupt
(0107)                            || ;---------------------------------------------------------------	  
(0108)                            || ;When an interrupt is called, it branches to this function, ;which then branches to ISR.
(0109)                            || ;---------------------------------------------------------------
(0110)                       1023  || .ORG 0x3FF
(0111)  CS-0x3FF  0x08510         || BRN ISR			;Branches to ISR.
(0112)                            || 
(0113)                            || 
(0114)                            || 





Symbol Table Key 
----------------------------------------------------------------------
C1             C2     C3      ||  C4+
-------------  ----   ----        -------
C1:  name of symbol
C2:  the value of symbol 
C3:  source code line number where symbol defined
C4+: source code line number of where symbol is referenced 
----------------------------------------------------------------------


-- Labels
------------------------------------------------------------ 
ISR            0x0A2   (0059)  ||  0111 
ISR2           0x0A8   (0081)  ||  0066 0092 
MAIN           0x0A0   (0043)  ||  0047 
RETURN         0x0AD   (0100)  ||  0090 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
BUTTON_IN      0x09B   (0004)  ||  0084 
SWITCH         0x09A   (0003)  ||  0060 
TOGGLE_LED     0x042   (0002)  ||  0045 0082 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
