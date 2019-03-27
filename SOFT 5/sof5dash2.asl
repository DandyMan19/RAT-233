

List FileKey 
----------------------------------------------------------------------
C1      C2      C3      C4    || C5
--------------------------------------------------------------
C1:  Address (decimal) of instruction in source file. 
C2:  Segment (code or data) and address (in code or data segment) 
       of inforation associated with current linte. Note that not all
       source lines will contain information in this field.  
C3:  Opcode bits (this field only appears for valid instructions.
C4:  Data field; lists data for labels and assorted directives. 
C5:  Raw line from source code.
----------------------------------------------------------------------


(0001)                            || .DSEG		; indicates data segment
(0002)                       154  || .ORG 0X9A		; sets data segment counter to 0x9A
(0003)                            || SEL_SORT: .DB 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,     	     .DB 0x08, 0x09 ;assigns 10 values to be changed later 
            syntax error
            syntax error
            syntax error
            syntax error

(0004)                            ||   
(0005)                            || ;in assembly code
(0006)                            || .CSEG          ; indicates code segment
(0007)                       154  || .ORG 0x9A      ; sets code segment counter to 0x9A
(0008)                            || 
(0009)                            || ;---------------------------------------------------------------
(0010)                            || 
(0011)                            || ;---------------------------------------------------------------
(0012)                            || ;- Initializations
(0013)                            || ;---------------------------------------------------------------
(0014)  CS-0x09A  0x1A001         || 			CLI			;prevent interrupts
(0015)                            || ;---------------------------------------------------------------
(0016)                            || 
(0017)                            || ;---------------------------------------------------------------
(0018)                            || ;Initialization: Initializes counters R0, R2, and R5 to be ;incremented in code later without changing functions.
(0019)                            || ;---------------------------------------------------------------
(0020)                            || 
(0021)  CS-0x09B  0x3609A         || MOV R0, 0x9A			;Assigns register R0 to 0x9A to be 
(0022)                            || ;utilized as a counter for the array
(0023)                            || 
(0024)  CS-0x09C  0x3629A         || MOV R2, 0x9A			;Assigns register R2 to 0x00 to be 
(0025)                            ||   					;utilized as a counter for main code
(0026)                            || 
(0027)  CS-0x09D  0x3659A         || MOV R5, 0x9A        	;Assigns register R5 to 0x00 to be 
(0028)                            || ;utilized as a counter for array output
(0029)                            || 
(0030)  CS-0x09E  0x084F8         || BRN Start				;Branches the program to Start, the 
(0031)                            || ;program that initializes the array
(0032)                            || 
(0033)                            || ;---------------------------------------------------------------
(0034)                            || ;Start: Initializes every number in the previously created ;array. Then, it branches off to the main code.
(0035)                            || ;---------------------------------------------------------------
(0036)                            || 
(0037)  CS-0x09F  0x3219A  0x09F  || Start: IN R1, 0x9A		;Allows the user to input a number into 
(0038)                            || ;R1 to be loaded into the array.
(0039)                            || 
(0040)  CS-0x0A0  0x04103         ||        ST R1, (R0)		;Stores the user’s value into R0. This 
(0041)                            || ;should be in the position of the 
(0042)                            || ;array’s next value.
(0043)                            || 
(0044)  CS-0x0A1  0x28001         ||        ADD R0, 0x01		;Increments R0 to act as the array’s 
(0045)                            || ;next position.
(0046)                            || 
(0047)  CS-0x0A2  0x300A4         ||        CMP R0, 0xA4   	;Compares R0 with 0xA4; when R0-0xA4 = 
(0048)                            || ;0, each value has been input into the 
(0049)                            || ;array.
(0050)                            || 
(0051)  CS-0x0A3  0x0852A         ||        BREQ Main		;If the zero flag is set, branch to 
(0052)                            ||                          ;main.
(0053)                            || 
(0054)  CS-0x0A4  0x084FB         ||        BRNE Start		;If no zero flag is set, branch to
(0055)                            ||                          ;start.
(0056)                            || 
(0057)                            || ;---------------------------------------------------------------
(0058)                            || ;Main: This function determines if numbers in the array need ;sorting. It compares the number with the next number to ;determine which is greater. If the next number in the array is ;greater, the numbers should switch positions.
(0059)                            || ;---------------------------------------------------------------
(0060)                            || 
(0061)  CS-0x0A5  0x04312  0x0A5  || Main: LD R3, (R2)		;Loads the value of the array at R2
(0062)                            ||                          ;into R3.
(0063)                            || 
(0064)  CS-0x0A6  0x28201         || 	 ADD R2, 0x01		;Increments R2 by 1 to attain the next 
(0065)                            || ;value in the array.
(0066)                            || 
(0067)  CS-0x0A7  0x04412         ||       LD R4, (R2)		;Loads the next value of the array into 
(0068)                            || ;R4.
(0069)                            || 
(0070)  CS-0x0A8  0x2C201         || 	 SUB R2, 0x01		;Resets R2 to the current value in the 
(0071)                            || ;array.
(0072)                            || 
(0073)  CS-0x0A9  0x04418         ||       CMP R4, R3		;Compares R4 with R3 to determine which 
(0074)                            || ;if the value in R3 is less than the ;value in R4.
(0075)                            || 
(0076)  CS-0x0AA  0x0A578         || 	 BRCS LT			;If the value of R4 is less than R3, 
(0077)                            || ;branch to LT.
(0078)                            || 
(0079)                            || 	
(0080)  CS-0x0AB  0x28201         ||       ADD R2, 0x01		;Increments the value of R2 for the
(0081)                            ||                          ;next value in the array.
(0082)                            || 
(0083)  CS-0x0AC  0x302A4         || 	 CMP R2, 0xA4		;Compares R2 to determine if every 
(0084)                            || ;portion of the array is sorted.
(0085)                            || 	 
(0086)  CS-0x0AD  0x085BA         ||  BREQ Output		;If the array has been sorted, branch
(0087)                            ||                     ;to output.
(0088)                            || 
(0089)  CS-0x0AE  0x0852B         || 	 BRNE Main		;If the array has not been sorted, 
(0090)                            || ;branch back to the start of the loop.
(0091)                            || 
(0092)                            || ;---------------------------------------------------------------
(0093)                            || ;LT: This function sorts the array by switching the next value ;in the array with the current value in the array. It then loops ;back to main.
(0094)                            || ;---------------------------------------------------------------
(0095)                            || 
(0096)  CS-0x0AF  0x302A3  0x0AF  || LT: CMP R2, 0xA3         ;Compares R2 to the final value of the 
(0097)                            || ;sort.
(0098)                            || 
(0099)  CS-0x0B0  0x085BA         ||     BREQ Output		;If the final value has occurred, 
(0100)                            ||                          ;branch to Output.
(0101)                            || 
(0102)  CS-0x0B1  0x04413         ||     ST R4, (R2)		;Stores the next value of the array to 
(0103)                            || ;the current value of the array.
(0104)                            ||     
(0105)  CS-0x0B2  0x28201         ||     ADD R2, 0x01		;Increments R2 by 0x01 to attain the 
(0106)                            || ;position of the next value in the 
(0107)                            || ;array.
(0108)                            || 
(0109)  CS-0x0B3  0x04313         ||     ST R3, (R2)		;Stores the current value of the array 
(0110)                            || ;to the next value of the array.
(0111)                            || 
(0112)  CS-0x0B4  0x2C201         ||     SUB R2, 0x01		;Resets R2 to the original position.
(0113)                            || 
(0114)  CS-0x0B5  0x3629A         ||     MOV R2, 0x9A 		;Resets the value of R2 to 0x9A to loop 
(0115)                            || ;back through the array.
(0116)                            || 
(0117)  CS-0x0B6  0x08528         ||     BRN Main			;Branches back to Main.
(0118)                            || 
(0119)                            || ;---------------------------------------------------------------
(0120)                            || ;Output: Acts as the output function for this array. This ;outputs each value in the array to port 0x42.
(0121)                            || ;---------------------------------------------------------------
(0122)                            || 
(0123)  CS-0x0B7  0x0462A  0x0B7  || Output: LD R6, (R5)		;loads the value in R5 into R6 to be 
(0124)                            || ;output.
(0125)                            || 
(0126)  CS-0x0B8  0x34642         || 	   OUT R6, 0x42		;Outputs the loaded value into
(0127)                            ||                                ;port_id 0x42.
(0128)                            || 
(0129)  CS-0x0B9  0x28501         || 	   ADD R5, 0x01		;Increments R5 to go through the
(0130)                            ||                               ;array.
(0131)                            || 
(0132)  CS-0x0BA  0x305A4         || 	   CMP R5, 0xA4		;Compares R5 to the final value in
(0133)                            ||                               ;the array to end the program.
(0134)                            || 	   
(0135)  CS-0x0BB  0x085BB         ||    BRNE Output      ;If R5 is not the final value, branch 
(0136)                            || ;back to output.





Symbol Table Key 
----------------------------------------------------------------------
C1             C2     C3      ||  C4+
-------------  ----   ----        -------
C1:  name of symbol
C2:  the value of symbol 
C3:  source code line number where symbol defined
C4+: source code line number of where symbol is referenced 
----------------------------------------------------------------------


-- Labels
------------------------------------------------------------ 
LT             0x0AF   (0096)  ||  0076 
MAIN           0x0A5   (0061)  ||  0051 0089 0117 
OUTPUT         0x0B7   (0123)  ||  0086 0099 0135 
START          0x09F   (0037)  ||  0030 0054 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
--> No ".EQU" directives used


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
