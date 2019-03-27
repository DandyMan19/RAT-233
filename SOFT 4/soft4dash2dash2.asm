;---------------------------------------------------------------
;
;-Software Assignment 4 Part 1: Loops
;
;- Programmers: Jeremiah Glaza and Jason Chandler
;
;- Description: This program will divide any hexadecimal number   
;               by three. After this, it will output the number 
;               and the remainder to port 0x42 and 0x43 
;               respectively.
;---------------------------------------------------------------

;---------------------------------------------------------------
;- Assembler Directives
;---------------------------------------------------------------
.CSEG		; indicates code segment
.ORG 0X9A		; sets the code segment counter to 0x9A
;---------------------------------------------------------------

;---------------------------------------------------------------
;- Initializations
;---------------------------------------------------------------
			CLI			;prevent interrupts
;---------------------------------------------------------------

;---------------------------------------------------------------
; Main Function will take the input values for R0, R1, R2, R3, ;R4, R5, and R6: These registers are utilized to input the ;number, compare the remainder to 3, compute the remainder, ;compute the bit length, and compare the remainder to 4.
;---------------------------------------------------------------

IN R0, 0x9A			;Allows user to input a number into  
                         ;address 0x9A.

MOV R1, 0x03             ;Used for a comparison later to 
                         ;generate a carry.

MOV R2, 0x00             ;Used to keep track of the remainder  
                         ;throughout the division.

MOV R3, 0x00             ;Used to keep track of the number 
                         ;throughout the division.

MOV R4, 0x00             ;Used to keep track of the bit length 
                         ;throughout the division.

MOV R5, 0x04             ;Used for a comparison later to
                         ; generate a carry.

CLC                      ;Clears the carry so as to not change 
                         ;the LSLs.

ADD R4, 0x01             ;Adds 0x01 to R4 to keep track of the 
                         ;bit length.

LSL R0                   ;Shifts R0 left for long division.

LSL R2                   ;Shifts R2 to correspond with the 
                         ;carry.

CMP R1, R2               ;Determines if R2 is greater than or 
                         ;equal to three.

BREQ three               ;Branches to the “three” function if R2 
                         ;equals 0x03.

CMP R5, R2               ;Determines if R2 is greater than or 
                         ;equal to four.

BREQ four                ;Branches to the “four” function if R2 
                         ;equals 0x04.

BRCS five                ;Branches to the “five” function if the  
                         ;carry is activated when R2 is compared 
                         ;to 0x04.

LSL R3                   ;Shifts R3 over to the left to account 
                         ;for the final division.

CMP R4, 0x08             ;Determines if the 8 bits of the number 
                         ;are accounted for.

BREQ carry               ;If the zero flag for the CMP is on, 
                         ;“carry” is executed.

BRN 0x0A1                ;Loops to CLC.

;----------------------------------------------------------------
;Three Function: Affects the remainder if the values of the bits in long division are three.
;----------------------------------------------------------------

three: MOV R2, 0x00      ;Moves 0x00 into R2 to keep track of 
                         ;the remainder.

	  SEC               ;Sets the carry to one so the LSL of R3 
                         ;is 1.

	  BRN 0x0AA         ;Branches to “LSL R3”.



;----------------------------------------------------------------
;Four Function: Affects the remainder if the values of the bits in long division are four.
;----------------------------------------------------------------

four:  MOV R2, 0x01      ;Moves 0x01 into R2 to keep track of 
                         ;the remainder.

       SEC               ;Sets the carry to one so the LSL of R3 
                         ;is 1.

	  BRN 0x0AA         ;Branches to “LSL R3”.

;----------------------------------------------------------------
;Five Function: Affects the remainder if the values of the bits in long division are five.
;----------------------------------------------------------------

five:  MOV R2, 0x02      ;Moves 0x02 into R2 to keep track of
                         ;the remainder.

       SEC               ;Sets the carry to one so the LSL of R3  
                         ;is 1.

	  BRN 0x0AA         ;Branches to “LSL R3”.

;----------------------------------------------------------------
;Carry Function: Acts as the output function
;----------------------------------------------------------------
carry: OUT R3, 0x42      ;Outputs the final quotient to 0x42.

       OUT R2, 0x43      ;Outputs the final remainder to 0x43.

