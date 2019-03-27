
.EQU TOGGLE_LED = 0x42	;Provides the output port for LEDs.
.EQU SWITCH = 0x9A		;Provides the input port for switches.
.EQU BUTTON_IN = 0x9B	;Provides the input port for buttons.

.CSEG				;Initializes the code segment.
.ORG 0x9A				;Starts the code segment at port 0x9A.

;---------------------------------------------------------------
;-	Instantiations
;---------------------------------------------------------------
;The necessary instantiations are R0, the register that toggles ;and outputs to LED_OUT, R1, the register that reads from ;switches to set the toggle for R0, R2, the register that ;determines if the same input is read from switches as the ;previous, R3, the register that determines the button input, 
;and R4, a placeholder register that acts as 0x00 to be output 
;in the second interrupt loop. Ensure the interrupt is set.
;---------------------------------------------------------------
MOV R0, 0x00			;Register that is output to the LEDs 
;and toggles based on switches.

MOV R1, 0x00			;Register that inputs the switches from 
;the interrupt from R0.

MOV R2, 0x00			;Register that determines if the 
;current switch value is equal to the ;previous.

MOV R3, 0x00			;Register that acts as a button input.

MOV R4, 0x00			;Register that acts as a placeholder.

SEI				



;---------------------------------------------------------------
;	MAIN
;---------------------------------------------------------------
;The main code should only write whatever is in R0. It is an 
;infinite loop that outputs the value of R0, and loops back to 
;itself. Interrupts are enabled, so the only change that can 
;occur on R0 is an interrupt.
;---------------------------------------------------------------

MAIN:

OUT R0, TOGGLE_LED		;Outputs R0 to port 0x42. 

BRN MAIN				;Loops back to main so the only thing 
;that can prevent the LEDs from being 
;output is an interrupt.

;---------------------------------------------------------------
;	ISR
;---------------------------------------------------------------
;The ISR function toggles the value of the LED’s output 
;with the input from the switches. It also keeps track of the ;interrupts used, and if the previous interrupt is equal to the ;current interrupt, the program branches to ISR2, or the second ;interrupt. If both interrupts are different, R0 will change and ;return with interrupts enabled back to main, providing the new ;output for R0.
;---------------------------------------------------------------

ISR: 
	 IN R1, SWITCH		;This puts the input from port 0x9A—the 
;switches—into R1.

	 CMP R1, R2		;R2 acts as the previous value in 
;switches.

	 BREQ ISR2		;If the current value of R1 is equal to 
;the previous value in switches, branch 
;to ISR2.

	 MOV R2, R1		;This moves thE value of R1 into R2 
;for the next value in switches.

	 EXOR R0, R1		;Toggles the value of R0 with R1.
RETIE				;Returns to main with interrupt.

;---------------------------------------------------------------
;	ISR 2
;---------------------------------------------------------------
;The second interrupt first outputs zero to the LED, then ;continuously loops to check if there is a button input entering ;the program. If not, the program loops again. If the button is ;pressed, branch to return.
;---------------------------------------------------------------
ISR2:
	 OUT R4, TOGGLE_LED	;0 is output to port 0x42.
	
 IN R3, BUTTON_IN	;Allows user to input a value for 
;button into R3.

	 LSR R3			;Shifts R3 over to determine if the 
;final bit is a carry.
	
 BRCS RETURN		;If there is a carry, branch to return
	
 BRCC ISR2		;If not, continue looping.

;---------------------------------------------------------------
;	Return
;---------------------------------------------------------------
;This allows a return from ISR2 to Main. The interrupt is 
;enabled.
;---------------------------------------------------------------
RETURN:
RETIE				;This returns to main with interrupt 
;enabled.


;---------------------------------------------------------------
;	Interrupt
;---------------------------------------------------------------	  
;When an interrupt is called, it branches to this function, ;which then branches to ISR.
;---------------------------------------------------------------
.ORG 0x3FF
BRN ISR			;Branches to ISR.



