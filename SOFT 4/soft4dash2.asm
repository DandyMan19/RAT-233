;---------------------------------------------------------------
;
;-Software Assignment 4 Part 2: Division
;
;- Programmers: Jeremiah Glaza and Jason Chandler
;
;- Date: 1-30-2019
;
;- Description:  This program will take in two input values and 
;                divide the first by the second and then output the
;				 results for the quotient and the remainder.
;---------------------------------------------------------------
;- Assembler Directives
;---------------------------------------------------------------
; Constants
;---------------------------------------------------------------
.EQU INPUT_PORT = 0x9A		;sets the input to port_id 0x9A.
.EQU QUOTIENT = 0x42	;sets the quotient output to port_id 0x42.
.EQU REMAINDER = 0x43	; sets the remainder output to port id 0x43.
;----------------------------------------------------------------
.CSEG		            ; indicates code segment.
.ORG 0X30				; sets the code segment counter to 0x30.
;---------------------------------------------------------------
;
;---------------------------------------------------------------
;- Initializations
;---------------------------------------------------------------
			CLI			;prevent interrupts.
;---------------------------------------------------------------
; Main Code
;---------------------------------------------------------------
; Main is the label where the the input value and the 
; initializations are enabled. This is where the 8 bit value is 
; divided into two different values and stored in R0 and R1. The 
; multiplier is determined through 4 rotations and stored into 
; R1. 
;---------------------------------------------------------------

Main:
				 IN R0, INPUT_PORT
				 IN R1, INPUT_PORT
				 MOV R2, 0x00
				 MOV R3, 0x00
				 MOV R6, 0x00
				 MOV R4, R0
				 MOV R5, R1
				 CMP R0, 0x00
				 BREQ Main1
				 CMP R1, 0x00
				 BREQ Main1
				 BRN Main2
Main1:				 ;
				 CLC
				 CMP R0, 0x01
				 ADDC R6, 0x00
				 CMP R1, 0x01
				 ADDC R6, 0x00
				 CMP R6, 0x02
				 BREQ NUM_DEN_ZERO
				 CLC
				 CMP R0, 0x00
				 BREQ NUM_ZERO
				 CMP R1, 0x00
				 BREQ DEN_ZERO
Main2:				 
				 CLC
				 CMP R0, R1
				 BREQ EQUAL_VALUES
				 BRCS DIVIDE_R1_LOOP
				 BRNE DIVIDE_R0_LOOP

DIVIDE_R0_LOOP:
				 SUB R0, R1
				 BREQ OUTPUT_IS_EQUAL_R0
				 BRCS REMAINDER_R0_LOOP
				 ADD R2, 0x01
				 ADD R3, 0x01
				 BRN DIVIDE_R0_LOOP
				 
OUTPUT_IS_EQUAL_R0:
				 ADD R2, 0x01
				 ADD R3, 0x01
				 CMP R2, R3
				 BREQ REMAINDER_IS_EQUAL_R0
				
				 
REMAINDER_IS_EQUAL_R0:
				 SUB R3, 0x01
				 SUB R4, R5
				 CMP R3, 0X00
				 BRNE REMAINDER_IS_EQUAL_R0
				 BREQ QUOTIENT_OUTPUT		
				 		 
REMAINDER_CHECKER_R0:
				SUB R2, 0X01
				SUB R3, 0x01
				BRN REMAINDER_R0_LOOP	
				
REMAINDER_R0_LOOP:
				SUB R3, 0X01
				SUB R4, R5
				CMP R3, 0x00
				BRNE REMAINDER_R0_LOOP
				BREQ QUOTIENT_OUTPUT							 				 
				 
DIVIDE_R1_LOOP:
				 SUB R1, R0
				 BREQ OUTPUT_IS_EQUAL_R1
				 BRCS REMAINDER_R1_LOOP
				 ADD R2, 0x01
				 ADD R3, 0x01
				 BRN DIVIDE_R1_LOOP
				 
OUTPUT_IS_EQUAL_R1:
				 ADD R2, 0x01
				 ADD R3, 0x01
				 CMP R2, R3
				 BREQ REMAINDER_IS_EQUAL_R1
				 BRN QUOTIENT_OUTPUT				 
				 
REMAINDER_IS_EQUAL_R1:
				 SUB R3, 0x01
				 SUB R5, R4
				 CMP R3, 0X00
				 BRNE REMAINDER_IS_EQUAL_R1				 
				 MOV R4, R5
				 BREQ QUOTIENT_OUTPUT
				 

REMAINDER_CHECKER_R1:
				SUB R2, 0X01
				SUB R3, 0x01
				BRN REMAINDER_R1_LOOP
				
				
REMAINDER_R1_LOOP:
				SUB R3, 0X01
				SUB R5, R4
				CMP R3, 0x00
				BRNE REMAINDER_R1_LOOP
				MOV R4, R5
				BREQ QUOTIENT_OUTPUT

EQUAL_VALUES:	
				MOV R2, R1
				ADD R2, 0x01
				SUB R2, R1
				SUB R4, R5
				BRN QUOTIENT_OUTPUT
				
NUM_ZERO:
				MOV R2, R0
				MOV R4, R1
				BRN QUOTIENT_OUTPUT

DEN_ZERO:
				MOV R2, 0xFF
				MOV R4, 0xFF
			    BRN QUOTIENT_OUTPUT
				
NUM_DEN_ZERO:

				MOV R2, 0xFF
				MOV R4, 0xFF
				BRN QUOTIENT_OUTPUT
				
QUOTIENT_OUTPUT:
				OUT R2, QUOTIENT

REMAINDER_OUTPUT:	
				OUT R4, REMAINDER

	 
	 
	 
