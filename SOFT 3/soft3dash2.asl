

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


(0001)                            || ;---------------------------------------------------------------
(0002)                            || ;
(0003)                            || ;-Software Assignment 3 Part 2: Loops
(0004)                            || ;
(0005)                            || ;- Programmers: Jeremiah Glaza and Jason Chandler
(0006)                            || ;
(0007)                            || ;- Description: This program will insert a value into R0 at 
(0008)                            || ;               address 0x09 wait 0.5s, and output R0 onto 
(0009)                            || ;               address 0x42 
(0010)                            || ;---------------------------------------------------------------
(0011)                            || 
(0012)                            || ;---------------------------------------------------------------
(0013)                            || ;- Assembler Directives
(0014)                            || ;---------------------------------------------------------------
(0015)                            || .CSEG		; indicates code segment
(0016)                       154  || .ORG 0X9A		; sets the code segment counter to 0x30
(0017)                            || ;---------------------------------------------------------------
(0018)                            || 
(0019)                            || 
(0020)                            || 
(0021)                            || ;---------------------------------------------------------------
(0022)                            || ;- Initializations
(0023)                            || ;---------------------------------------------------------------
(0024)  CS-0x09A  0x1A001         || 			CLI			;prevent interrupts
(0025)                            || ;---------------------------------------------------------------
(0026)                            || 
(0027)                            || ;---------------------------------------------------------------
(0028)                            || ; Main_Function will take the input value and compare that value  ; to 127. The value is then jumped to the labels multiply or    ;divide depending on the carry flag.
(0029)                            || ;---------------------------------------------------------------
(0030)                            || Main Function
            syntax error

(0031)                            || 
(0032)  CS-0x09B  0x3209A         || IN R0, 0x9A			;Allows user to input any value into R0
(0033)                            || 
(0034)  CS-0x09C  0x363E7         || MOV R3, 0xE7             ;Moves 0xE7 into register R3. This is
(0035)                            ||                          ;25 values away from 0x00
(0036)                            || 
(0037)  CS-0x09D  0x36206         || MOV R2, 0x06             ;Moves 0x06 into register R2. This is 
(0038)                            ||                          ;250 values away from 0x00
(0039)                            || 
(0040)  CS-0x09E  0x36106         || MOV R1, 0x06             ;Moves 0x06 into register R1. This is               
(0041)                            ||                          ;250 values away from 0x00
(0042)                            || 
(0043)  CS-0x09F  0x28101         || ADD R1, 0x01             ;Adds 0x01 to R1 in the loop 250 times 
(0044)                            ||                          ;per loop
(0045)                            || 
(0046)  CS-0x0A0  0x084F3         || BRNE 0x09E               ;Loops back to line “ADD R1, 0x01”
(0047)                            ||                          ;until the value in R1 is 0
(0048)                            || 
(0049)  CS-0x0A1  0x28201         || ADD R2, 0x01             ;Adds 0x01 to R2 in the loop 250 times 
(0050)                            ||                          ;per loop
(0051)                            || 
(0052)  CS-0x0A2  0x084EB         || BRNE 0x09D               ;Loops back to the line “MOV R1 0x06” to 
(0053)                            ||                          ;reset the value stored into R1 back to 
(0054)                            ||                          ;0x06 for the next loop until the value 
(0055)                            ||                          ;in R2 is 0x00
(0056)                            || 
(0057)                            || 
(0058)  CS-0x0A3  0x28301         || ADD R3, 0x01             ;Adds 0x01 into R3 in the loop 25 times 
(0059)                            ||                          ;per loop
(0060)                            || 
(0061)  CS-0x0A4  0x084E3         || BRNE 0x09C               ;Loops back to the line “MOV R2, 0x06” 
(0062)                            ||                          ;in order to reset both R1 and R2 to 
(0063)                            ||                          ;0x06 for the next loop until the value 
(0064)                            ||                          ;of R3 is 0x00
(0065)                            || 
(0066)  CS-0x0A5  0x34042         || OUT R0, 0x42             ;Outputs the value of R0 onto address 
(0067)                            ||                          ;0x42.





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
--> No labels used


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
