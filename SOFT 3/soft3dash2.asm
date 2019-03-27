;---------------------------------------------------------------
;
;-Software Assignment 3 Part 2: Loops
;
;- Programmers: Jeremiah Glaza and Jason Chandler
;
;- Description: This program will insert a value into R0 at 
;               address 0x09 wait 0.5s, and output R0 onto 
;               address 0x42 
;---------------------------------------------------------------

;---------------------------------------------------------------
;- Assembler Directives
;---------------------------------------------------------------
.CSEG		; indicates code segment
.ORG 0X9A		; sets the code segment counter to 0x30
;---------------------------------------------------------------



;---------------------------------------------------------------
;- Initializations
;---------------------------------------------------------------
			CLI			;prevent interrupts
;---------------------------------------------------------------

;---------------------------------------------------------------
; Main_Function will take the input value and compare that value  ; to 127. The value is then jumped to the labels multiply or    ;divide depending on the carry flag.
;---------------------------------------------------------------
Main Function

IN R0, 0x9A			;Allows user to input any value into R0

MOV R3, 0xE7             ;Moves 0xE7 into register R3. This is
                         ;25 values away from 0x00

MOV R2, 0x06             ;Moves 0x06 into register R2. This is 
                         ;250 values away from 0x00

MOV R1, 0x06             ;Moves 0x06 into register R1. This is               
                         ;250 values away from 0x00

ADD R1, 0x01             ;Adds 0x01 to R1 in the loop 250 times 
                         ;per loop

BRNE 0x09E               ;Loops back to line “ADD R1, 0x01”
                         ;until the value in R1 is 0

ADD R2, 0x01             ;Adds 0x01 to R2 in the loop 250 times 
                         ;per loop

BRNE 0x09D               ;Loops back to the line “MOV R1 0x06” to 
                         ;reset the value stored into R1 back to 
                         ;0x06 for the next loop until the value 
                         ;in R2 is 0x00


ADD R3, 0x01             ;Adds 0x01 into R3 in the loop 25 times 
                         ;per loop

BRNE 0x09C               ;Loops back to the line “MOV R2, 0x06” 
                         ;in order to reset both R1 and R2 to 
                         ;0x06 for the next loop until the value 
                         ;of R3 is 0x00

OUT R0, 0x42             ;Outputs the value of R0 onto address 
                         ;0x42.
