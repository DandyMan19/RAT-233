.DSEG		; indicates data segment
.ORG 0X9A		; sets data segment counter to 0x9A
SEL_SORT: .DB 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,     	     .DB 0x08, 0x09 ;assigns 10 values to be changed later 
  
;in assembly code
.CSEG          ; indicates code segment
.ORG 0x9A      ; sets code segment counter to 0x9A

;---------------------------------------------------------------

;---------------------------------------------------------------
;- Initializations
;---------------------------------------------------------------
			CLI			;prevent interrupts
;---------------------------------------------------------------

;---------------------------------------------------------------
;Initialization: Initializes counters R0, R2, and R5 to be ;incremented in code later without changing functions.
;---------------------------------------------------------------

MOV R0, 0x9A			;Assigns register R0 to 0x9A to be 
;utilized as a counter for the array

MOV R2, 0x9A			;Assigns register R2 to 0x00 to be 
  					;utilized as a counter for main code

MOV R5, 0x9A        	;Assigns register R5 to 0x00 to be 
;utilized as a counter for array output

BRN Start				;Branches the program to Start, the 
;program that initializes the array

;---------------------------------------------------------------
;Start: Initializes every number in the previously created ;array. Then, it branches off to the main code.
;---------------------------------------------------------------

Start: IN R1, 0x9A		;Allows the user to input a number into 
;R1 to be loaded into the array.

       ST R1, (R0)		;Stores the user’s value into R0. This 
;should be in the position of the 
;array’s next value.

       ADD R0, 0x01		;Increments R0 to act as the array’s 
;next position.

       CMP R0, 0xA4   	;Compares R0 with 0xA4; when R0-0xA4 = 
;0, each value has been input into the 
;array.

       BREQ Main		;If the zero flag is set, branch to 
                         ;main.

       BRNE Start		;If no zero flag is set, branch to
                         ;start.

;---------------------------------------------------------------
;Main: This function determines if numbers in the array need ;sorting. It compares the number with the next number to ;determine which is greater. If the next number in the array is ;greater, the numbers should switch positions.
;---------------------------------------------------------------

Main: LD R3, (R2)		;Loads the value of the array at R2
                         ;into R3.

	 ADD R2, 0x01		;Increments R2 by 1 to attain the next 
;value in the array.

      LD R4, (R2)		;Loads the next value of the array into 
;R4.

	 SUB R2, 0x01		;Resets R2 to the current value in the 
;array.

      CMP R4, R3		;Compares R4 with R3 to determine which 
;if the value in R3 is less than the ;value in R4.

	 BRCS LT			;If the value of R4 is less than R3, 
;branch to LT.

	
      ADD R2, 0x01		;Increments the value of R2 for the
                         ;next value in the array.

	 CMP R2, 0xA4		;Compares R2 to determine if every 
;portion of the array is sorted.
	 
 BREQ Output		;If the array has been sorted, branch
                    ;to output.

	 BRNE Main		;If the array has not been sorted, 
;branch back to the start of the loop.

;---------------------------------------------------------------
;LT: This function sorts the array by switching the next value ;in the array with the current value in the array. It then loops ;back to main.
;---------------------------------------------------------------

LT: CMP R2, 0xA3         ;Compares R2 to the final value of the 
;sort.

    BREQ Output		;If the final value has occurred, 
                         ;branch to Output.

    ST R4, (R2)		;Stores the next value of the array to 
;the current value of the array.
    
    ADD R2, 0x01		;Increments R2 by 0x01 to attain the 
;position of the next value in the 
;array.

    ST R3, (R2)		;Stores the current value of the array 
;to the next value of the array.

    SUB R2, 0x01		;Resets R2 to the original position.

    MOV R2, 0x9A 		;Resets the value of R2 to 0x9A to loop 
;back through the array.

    BRN Main			;Branches back to Main.

;---------------------------------------------------------------
;Output: Acts as the output function for this array. This ;outputs each value in the array to port 0x42.
;---------------------------------------------------------------

Output: LD R6, (R5)		;loads the value in R5 into R6 to be 
;output.

	   OUT R6, 0x42		;Outputs the loaded value into
                               ;port_id 0x42.

	   ADD R5, 0x01		;Increments R5 to go through the
                              ;array.

	   CMP R5, 0xA4		;Compares R5 to the final value in
                              ;the array to end the program.
	   
   BRNE Output      ;If R5 is not the final value, branch 
;back to output.
