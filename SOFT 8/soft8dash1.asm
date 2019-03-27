
.EQU TOGGLE_LED = 0x9A	;Provides the input port for R0.
.EQU SWITCH = 0x42		;Provides the output port for the final 
;value.

.CSEG				;Initiates code segment.
.ORG 0x9A				;Starts code segment at 0x9A.

;---------------------------------------------------------------
;	INST Code
;---------------------------------------------------------------
;This code initializes all registers that are necessary for 
;main. This includes a register to be the output for the LEDs, 
;and a register that reads the switches. The interrupt flag 
;should also be set.
;---------------------------------------------------------------

MOV R0, 0x00			;Register that is always output to the 
;LEDs and is affected by switches.
MOV R1, 0x00			;Register that inputs the switches from 
;the interrupt to R0.
SEI					;This sets the interrupts.

;---------------------------------------------------------------
;	MAIN
;---------------------------------------------------------------
;The main code should only write whatever is in R0. It is an 
;infinite loop that outputs the value of R0, and loops back to 
;itself. Interrupts are enabled, so the only change that can 
;occur on R0 is an interrupt.
;---------------------------------------------------------------
MAIN:

OUT R0, TOGGLE_LED		;Always outputs the value in R0 to port 
;0x42.
BRN MAIN				;Loops back to main to ensure there is 
;an infinite loop until an interrupt.
;---------------------------------------------------------------
;	ISR
;--------------------------------------------------------------
;The ISR function only toggles the value of the LED’s output 
;with the input from the switches. This will change R0 and 
;return with interrupts enabled back to main, providing the new 
;output for R0.
;---------------------------------------------------------------
ISR: 				
	 IN R1, SWITCH		;Inputs the value obtained by the 
;switches into R1.
	 EXOR R0, R1		;Toggles the bits in R0 to the new 
;switches input.
RETIE				;Returns to main with interrupts 
;enabled.

;---------------------------------------------------------------
;	Interrupt
;---------------------------------------------------------------	  
;When an interrupt is called, it branches to this function, ;which then branches to ISR.
;---------------------------------------------------------------
.ORG 0x3FF
BRN ISR				;This branches to the interrupt 
;function in the RAT.
