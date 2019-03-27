

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
(0002)                       154  || .EQU TOGGLE_LED = 0x9A	;Provides the input port for R0.
(0003)                       066  || .EQU SWITCH = 0x42		;Provides the output port for the final 
(0004)                            || ;value.
(0005)                            || 
(0006)                            || .CSEG				;Initiates code segment.
(0007)                       154  || .ORG 0x9A				;Starts code segment at 0x9A.
(0008)                            || 
(0009)                            || ;---------------------------------------------------------------
(0010)                            || ;	INST Code
(0011)                            || ;---------------------------------------------------------------
(0012)                            || ;This code initializes all registers that are necessary for 
(0013)                            || ;main. This includes a register to be the output for the LEDs, 
(0014)                            || ;and a register that reads the switches. The interrupt flag 
(0015)                            || ;should also be set.
(0016)                            || ;---------------------------------------------------------------
(0017)                            || 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x084D0  0x100  ||              BRN     0x9A        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0018)  CS-0x09A  0x36000         || MOV R0, 0x00			;Register that is always output to the 
(0019)                            || ;LEDs and is affected by switches.
(0020)  CS-0x09B  0x36100         || MOV R1, 0x00			;Register that inputs the switches from 
(0021)                            || ;the interrupt to R0.
(0022)  CS-0x09C  0x1A000         || SEI					;This sets the interrupts.
(0023)                            || 
(0024)                            || ;---------------------------------------------------------------
(0025)                            || ;	MAIN
(0026)                            || ;---------------------------------------------------------------
(0027)                            || ;The main code should only write whatever is in R0. It is an 
(0028)                            || ;infinite loop that outputs the value of R0, and loops back to 
(0029)                            || ;itself. Interrupts are enabled, so the only change that can 
(0030)                            || ;occur on R0 is an interrupt.
(0031)                            || ;---------------------------------------------------------------
(0032)                     0x09D  || MAIN:
(0033)                            || 
(0034)  CS-0x09D  0x3409A         || OUT R0, TOGGLE_LED		;Always outputs the value in R0 to port 
(0035)                            || ;0x42.
(0036)  CS-0x09E  0x084E8         || BRN MAIN				;Loops back to main to ensure there is 
(0037)                            || ;an infinite loop until an interrupt.
(0038)                            || ;---------------------------------------------------------------
(0039)                            || ;	ISR
(0040)                            || ;--------------------------------------------------------------
(0041)                            || ;The ISR function only toggles the value of the LED’s output 
(0042)                            || ;with the input from the switches. This will change R0 and 
(0043)                            || ;return with interrupts enabled back to main, providing the new 
(0044)                            || ;output for R0.
(0045)                            || ;---------------------------------------------------------------
(0046)                     0x09F  || ISR: 				
(0047)  CS-0x09F  0x32142         || 	 IN R1, SWITCH		;Inputs the value obtained by the 
(0048)                            || ;switches into R1.
(0049)  CS-0x0A0  0x0000A         || 	 EXOR R0, R1		;Toggles the bits in R0 to the new 
(0050)                            || ;switches input.
(0051)  CS-0x0A1  0x1A003         || RETIE				;Returns to main with interrupts 
(0052)                            || ;enabled.
(0053)                            || 
(0054)                            || ;---------------------------------------------------------------
(0055)                            || ;	Interrupt
(0056)                            || ;---------------------------------------------------------------	  
(0057)                            || ;When an interrupt is called, it branches to this function, ;which then branches to ISR.
(0058)                            || ;---------------------------------------------------------------
(0059)                       1023  || .ORG 0x3FF
(0060)  CS-0x3FF  0x084F8         || BRN ISR				;This branches to the interrupt 
(0061)                            || ;function in the RAT.





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
ISR            0x09F   (0046)  ||  0060 
MAIN           0x09D   (0032)  ||  0036 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
SWITCH         0x042   (0003)  ||  0047 
TOGGLE_LED     0x09A   (0002)  ||  0034 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
