
;---------------------------------------------------------------
;
;-Software Assignment 5 Part 1: Arrays
;
;- Programmers: Jeremiah Glaza and Jason Chandler
;
;- Date: 2-13-2019
;
;- Description:  This program will take use a hardcoded array of ;			  the first 14 values of the fibonacci sequence. ;			  The difference between the first and fourth	;			  values of the sequence will be taken and
;                outputted to the output port id until there is ;                no other value in the array for the program to ;                continue. ;---------------------------------------------------------------
;- Assembler Directives
;---------------------------------------------------------------
; Constants
;---------------------------------------------------------------
.EQU OUT_DATA = 0x42
.EQU IN_DATA = 0x9A		;sets the output port id to 0x42.
.CSEG		          ;indicates code segment.
.ORG 0x30				;sets the code segment counter to 0x30.
;---------------------------------------------------------------
;- Initializations
;---------------------------------------------------------------
;The code below initializes R0 and R1 to reflect the stack ;pointers pointing for R0 to be the first value in the FIB array ;and R1 to be pointing to the fourth value in the FIB array. ;These registers also act as counters that will increment ;through the array until the max value is calculated for the ;difference, this being 0xE9. Interrupts are also prevented from ;interfering with the program using the CLI command.
;---------------------------------------------------------------
			CLI			;prevent interrupts.
MOV R0, 0x00		;sets the stack pointer to the first value
;in the array.
MOV R1, 0x00		;sets the stack pointer to the fourth value
;in the array.
;---------------------------------------------------------------
; MAIN code
;---------------------------------------------------------------
;The MAIN label handles loading the values, the calculation for ;the difference, outputting the values, and moving the stack ;pointer to the next sequence of values in the FIB array. The ;amount of times that the MAIN label will iterate is from the ;fact that there will be 11 passes starting from taking the ;difference from 0x00 to 0x02, then 0x01 to 0x03, all the way up ;to 0x37 to 0xE9. R0 will be compared to the amount of ;iterations that was done when incrementing through the array up ;until 0x0B. If the value in R0 is less than that of 0x0B after ;the comparison, then a carry flag will be enabled and the MAIN ;label will loop. If the 0x0B is present in R0 then there is no ;carry flag enabled and the BRCS instruction will be bypassed ;ending the program.
;---------------------------------------------------------------

MAIN:

IN R0, IN_DATA
CMP R0, 0xFF
BREQ REVERSE
PUSH R0
ADD R1, 0x01
BRN MAIN

REVERSE:
POP R0
CMP R1, 0x00
BREQ DONE
OUT R0, OUT_DATA
SUB R1, 0x01
BRNE REVERSE

DONE:

