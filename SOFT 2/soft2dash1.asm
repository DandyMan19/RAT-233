;--------------------------------------------------------------------
;
;-Software Assignment 2 Part 1: Conditional Statements
;
;- Programmers: Jason Chandler and Jeremiah Glaza
;
;- Description: This program will take in a 8-bit unsigned value 
;               and check to see if the value is greater than or equal 
;				to 128. If so then the value is divided by 4 otherwise
;				the value is multiplied by 2.
;--------------------------------------------------------------------

;--------------------------------------------------------------------
;- Assembler Directives
;--------------------------------------------------------------------
.CSEG		; indicates code segment
.ORG 0X30	; sets the code segment counter to 0x30
;--------------------------------------------------------------------

;--------------------------------------------------------------------
;- Initializations
;--------------------------------------------------------------------
			CLI			;prevent interrupts
;--------------------------------------------------------------------

;--------------------------------------------------------------------
; Main_Function will take the input value and compare that value to 
; 127. The value is then jumped to the labels multiply or divide
; depending on the carry flag.
;--------------------------------------------------------------------
Main_Function:

IN R0, 0X30		; lines 33-37 will test the input value if it is greater
MOV R1, 0X7F	; than or equal to 128 or not. We decided to set R1 to 127 
SUB R1, R0		; to be a flag number that will be subtracted from R0. 
BRCC multiply	; To see if a carry is generated, we use R1 and R0 to store 
BRCS divide		; the values andtake the difference between the two. If there 
				; is acarry, this will indicate the input value is greater 
				; than the set value of 127. Otherwise the value will be less 
				; than 127 and the carry flag will be 0. Depending whether its  
				; a 1 or 0, the assembler will jump to the appropriate label.
;---------------------------------------------------------------------
;
;---------------------------------------------------------------------
; The divide label will execute the set of instructions by dividing 
; the result by halving it twice and clearing the results twice. 
; The result is then jumped to be displayed in the Output label.
;---------------------------------------------------------------------
	divide:
			CLC			; lines 50-54 show the set of instructions required 
			LSR R0		; to acheive the result by halving twice on a value 
			CLC			; greater than 127. This can be done using the LSR 
			LSR	R0		; instruction on R0 which will shift the result twice. 
			BRN Output	; The result of this value is then jumped to Output label
						; which will display the value.
;---------------------------------------------------------------------
;
;---------------------------------------------------------------------
; This multiply label will be accessed when the input value is less
; than 127, the assembler will jump to this label to be multiplied by 2
; then jump to the Output label to display the value.
;---------------------------------------------------------------------
	multiply:
			ADD R0, R0	; lines 64-65 will execute the set of instructions
			BRN Output	; to achieve the result. In order to multiply the 
						; input by 2, we use the R0 containing the input value 
						; and add the register to itself since there 
						; isn't an instruction for multiplying. Then the
						; Output label will be accessed to display the value.
;----------------------------------------------------------------------
;
;----------------------------------------------------------------------
	Output:
			OUT R0, 0x42
;----------------------------------------------------------------------	

