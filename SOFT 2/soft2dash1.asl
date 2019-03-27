

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


(0001)                            || ;--------------------------------------------------------------------
(0002)                            || ;
(0003)                            || ;-Software Assignment 2 Part 1: Conditional Statements
(0004)                            || ;
(0005)                            || ;- Programmers: Jason Chandler and Jeremiah Glaza
(0006)                            || ;
(0007)                            || ;- Description: This program will take in a 8-bit unsigned value 
(0008)                            || ;               and check to see if the value is greater than or equal 
(0009)                            || ;				to 128. If so then the value is divided by 4 otherwise
(0010)                            || ;				the value is multiplied by 2.
(0011)                            || ;--------------------------------------------------------------------
(0012)                            || 
(0013)                            || ;--------------------------------------------------------------------
(0014)                            || ;- Assembler Directives
(0015)                            || ;--------------------------------------------------------------------
(0016)                            || .CSEG		; indicates code segment
(0017)                       048  || .ORG 0X30	; sets the code segment counter to 0x30
(0018)                            || ;--------------------------------------------------------------------
(0019)                            || 
(0020)                            || ;--------------------------------------------------------------------
(0021)                            || ;- Initializations
(0022)                            || ;--------------------------------------------------------------------
(0023)  CS-0x030  0x1A001         || 			CLI			;prevent interrupts
(0024)                            || ;--------------------------------------------------------------------
(0025)                            || 
(0026)                            || ;--------------------------------------------------------------------
(0027)                            || ; Main_Function will take the input value and compare that value to 
(0028)                            || ; 127. The value is then jumped to the labels multiply or divide
(0029)                            || ; depending on the carry flag.
(0030)                            || ;--------------------------------------------------------------------
(0031)                     0x031  || Main_Function:
(0032)                            || 
(0033)  CS-0x031  0x32030         || IN R0, 0X30		; lines 33-37 will test the input value if it is greater
(0034)  CS-0x032  0x3617F         || MOV R1, 0X7F	; than or equal to 128 or not. We decided to set R1 to 127 
(0035)  CS-0x033  0x02102         || SUB R1, R0		; to be a flag number that will be subtracted from R0. 
(0036)  CS-0x034  0x0A1D9         || BRCC multiply	; To see if a carry is generated, we use R1 and R0 to store 
(0037)  CS-0x035  0x0A1B0         || BRCS divide		; the values andtake the difference between the two. If there 
(0038)                            || 				; is acarry, this will indicate the input value is greater 
(0039)                            || 				; than the set value of 127. Otherwise the value will be less 
(0040)                            || 				; than 127 and the carry flag will be 0. Depending whether its  
(0041)                            || 				; a 1 or 0, the assembler will jump to the appropriate label.
(0042)                            || ;---------------------------------------------------------------------
(0043)                            || ;
(0044)                            || ;---------------------------------------------------------------------
(0045)                            || ; The divide label will execute the set of instructions by dividing 
(0046)                            || ; the result by halving it twice and clearing the results twice. 
(0047)                            || ; The result is then jumped to be displayed in the Output label.
(0048)                            || ;---------------------------------------------------------------------
(0049)                     0x036  || 	divide:
(0050)  CS-0x036  0x18000         || 			CLC			; lines 50-54 show the set of instructions required 
(0051)  CS-0x037  0x10001         || 			LSR R0		; to acheive the result by halving twice on a value 
(0052)  CS-0x038  0x18000         || 			CLC			; greater than 127. This can be done using the LSR 
(0053)  CS-0x039  0x10001         || 			LSR	R0		; instruction on R0 which will shift the result twice. 
(0054)  CS-0x03A  0x081E8         || 			BRN Output	; The result of this value is then jumped to Output label
(0055)                            || 						; which will display the value.
(0056)                            || ;---------------------------------------------------------------------
(0057)                            || ;
(0058)                            || ;---------------------------------------------------------------------
(0059)                            || ; This multiply label will be accessed when the input value is less
(0060)                            || ; than 127, the assembler will jump to this label to be multiplied by 2
(0061)                            || ; then jump to the Output label to display the value.
(0062)                            || ;---------------------------------------------------------------------
(0063)                     0x03B  || 	multiply:
(0064)  CS-0x03B  0x02000         || 			ADD R0, R0	; lines 64-65 will execute the set of instructions
(0065)  CS-0x03C  0x081E8         || 			BRN Output	; to achieve the result. In order to multiply the 
(0066)                            || 						; input by 2, we use the R0 containing the input value 
(0067)                            || 						; and add the register to itself since there 
(0068)                            || 						; isn't an instruction for multiplying. Then the
(0069)                            || 						; Output label will be accessed to display the value.
(0070)                            || ;----------------------------------------------------------------------
(0071)                            || ;
(0072)                            || ;----------------------------------------------------------------------
(0073)                     0x03D  || 	Output:
(0074)  CS-0x03D  0x34042         || 			OUT R0, 0x42
(0075)                            || ;----------------------------------------------------------------------	
(0076)                            || 





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
DIVIDE         0x036   (0049)  ||  0037 
MAIN_FUNCTION  0x031   (0031)  ||  
MULTIPLY       0x03B   (0063)  ||  0036 
OUTPUT         0x03D   (0073)  ||  0054 0065 


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
