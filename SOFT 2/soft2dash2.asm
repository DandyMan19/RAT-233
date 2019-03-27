;--------------------------------------------------------------------
;
;-Software Assignment 2 Part 2: Conditional Statements
;
;- Programmers: Jason Chandler and Jeremiah Glaza
;
;- Description: This program will take in a 8-bit unsigned value 
;               and check to see if the value is a multiple of 4.
;				If not, then the value will be compared to see if it
;				is even or odd. Certain instructions will execute 
;				depending on the magnitude of the input.
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

IN R0, 0X30
MOV R1, R0

;--------------------------------------------------------------------

;--------------------------------------------------------------------
;The Main Function will accept the given input value above and check 
;to see if the value is a multiple of 4. Doing so will jump to the 
;Mult_4_Function that will invert the input value, otherwise it will
;check if the value is even or odd.
;--------------------------------------------------------------------
Main_Function:

;-----------------------------
		LSR R1				  ; line 43-47 will check to see if the	
		ADDC R2, 0X00		  ; value is a multiiple of 4 by halving
		ADD R1, R2			  ; the value twice. If no carry is found
		CLC					  ; then Mult_4_Function will activate. 
		LSR R1				  ; Using the carry flags we can tell if 
							  ; the input value is even or odd value.
							  ; Using ADDC we can add to register 2
							  ; the carry flag from the original value.
							  ; The ADD instruction will add the carry
							  ; and the reduced value to bypass the
							  ; Mult_4_Function. 
;----------------------------
;----------------------------
		BRCC Mult_4_Function  ; lines 56-61 describe the conditions
		CLC					  ; needed to check to see if the input
		MOV R1, R0			  ; value is even or odd. To do this,
		LSR R1				  ; the flags are cleared and R1 is 
		BRCS Odd_Yes		  ; restored to the input value and
		BRCC Odd_No			  ; is divided once. Doing so will
							  ; give a carry if the original  
							  ; is odd or 0 if even. Depending on 
							  ; the flag, the assembler wil jump to 
							  ; the appropriate labels.
;----------------------------
;------------------------------------------------------------------
; Mult_4_Function will accessed if the input value is a multiple of 4
; and will invert the data after restoring to the original value.
;------------------------------------------------------------------
Mult_4_Function:

		MOV R1, R0		; lines 73-76 will execute the set of 	
		EXOR R1, 0XFF	; instructions given by the lab manual.
		MOV R0, R1		; The input value is restored and inverted
		BRN Output		; using the EXOR instruction and return the
						; new value to the Output label to display 
						; the value.
;----------------------------
;------------------------------------------------------------------
; Odd_Yes will be accessed if the input value is an odd number.
; This label will Add 17 to R0 then divide the added result by 2 
; and jump to the Output label to display the overall result.
;------------------------------------------------------------------
Odd_Yes:

		ADD R0, 0X11	; lines 87-89 will just take the original
		LSR R0			; even value in R0, subtract by 17 and divide 
		BRN Output		; by 2, return the value to Output label 
						; to be displayed.
;----------------------------
;------------------------------------------------------------------
; Odd_No will be accessed if the input value is an even number.
; This label will just subtract the value 1 from the original 
; result and then jump to the output label to display the result.
;------------------------------------------------------------------
Odd_No:
		SUB R0, 0X01	; lines 98-99 will take the unaltered value
		BRN Output		; in R0 and subtract it by 1 and jump to the
						; Output label to display the value. 
;----------------------------
;----------------------------		
Output:
		OUT R0, 0X42	
;-------------------------------------------------------------------
