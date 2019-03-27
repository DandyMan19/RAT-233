
;-----------------------------------------------------
;
; PERIPHERAL ASSIGNMENT 2
; JEREMIAH GLAZA and JASON CHANDLER
;
; DESCRIPTION:
; 
;-----------------------------------------------------
; Constants
;----------------------------------------------------
.EQU DELAY_PORT = 0x40 ;this will output the result through every cycle.
;--------------------------------------------------------------------------
;-- ASSEMBLER DIRECTIVES
;--------------------------------------------------------------------------
.CSEG		  ;sets code segment
.ORG 0x01    ; set the data segment counter to 0x01
;------------------------------------------------------
; Initializations
;---------------------------------------------------------
MOV R0, 0x00

;CALL ADD_VALS

ADD_VALS:            
	OUT R0, DELAY_PORT
	CMP R0, 0xFF
	BREQ OUTPUT
	ADD R0, 0x01
	BRNE ADD_VALS
;	RET

OUTPUT:

