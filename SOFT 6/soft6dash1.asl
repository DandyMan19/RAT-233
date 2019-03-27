

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


(0001)                            || 
(0002)                            || ;---------------------------------------------------------------
(0003)                            || ;
(0004)                            || ;-Software Assignment 5 Part 1: Arrays
(0005)                            || ;
(0006)                            || ;- Programmers: Jeremiah Glaza and Jason Chandler
(0007)                            || ;
(0008)                            || ;- Date: 2-13-2019
(0009)                            || ;
(0010)                            || ;- Description:  This program will take use a hardcoded array of ;			  the first 14 values of the fibonacci sequence. ;			  The difference between the first and fourth	;			  values of the sequence will be taken and
(0011)                            || ;                outputted to the output port id until there is ;                no other value in the array for the program to ;                continue. ;---------------------------------------------------------------
(0012)                            || ;- Assembler Directives
(0013)                            || ;---------------------------------------------------------------
(0014)                            || ; Constants
(0015)                            || ;---------------------------------------------------------------
(0016)                       066  || .EQU OUT_DATA = 0x42
(0017)                       154  || .EQU IN_DATA = 0x9A		;sets the output port id to 0x42.
(0018)                            || .CSEG		          ;indicates code segment.
(0019)                       048  || .ORG 0x30				;sets the code segment counter to 0x30.
(0020)                            || ;---------------------------------------------------------------
(0021)                            || ;- Initializations
(0022)                            || ;---------------------------------------------------------------
(0023)                            || ;The code below initializes R0 and R1 to reflect the stack ;pointers pointing for R0 to be the first value in the FIB array ;and R1 to be pointing to the fourth value in the FIB array. ;These registers also act as counters that will increment ;through the

(0024)                            || ;---------------------------------------------------------------
            syntax error
            syntax error
            syntax error
            syntax error
            syntax error

(0025)  CS-0x030  0x1A001         || 			CLI			;prevent interrupts.
(0026)  CS-0x031  0x36000         || MOV R0, 0x00		;sets the stack pointer to the first value
(0027)                            || ;in the array.
(0028)  CS-0x032  0x36100         || MOV R1, 0x00		;sets the stack pointer to the fourth value
(0029)                            || ;in the array.
(0030)                            || ;---------------------------------------------------------------
(0031)                            || ; MAIN code
(0032)                            || ;---------------------------------------------------------------
(0033)                            || ;The MAIN label handles loading the values, the calculation for ;the difference, outputting the values, and moving the stack ;pointer to the next sequence of values in the FIB array. The ;amount of times that the MAIN label will iterate is from the ;fact 

(0034)                            || am.
            syntax error
            syntax error
            syntax error
            syntax error
            syntax error
            syntax error
            syntax error
            syntax error
            syntax error
            syntax error
            syntax error
            syntax error

(0035)                            || ;---------------------------------------------------------------
(0036)                            || 
(0037)                     0x033  || MAIN:
(0038)                            || 
(0039)  CS-0x033  0x3209A         || IN R0, IN_DATA
(0040)  CS-0x034  0x300FF         || CMP R0, 0xFF
(0041)  CS-0x035  0x081CA         || BREQ REVERSE
(0042)  CS-0x036  0x12001         || PUSH R0
(0043)  CS-0x037  0x28101         || ADD R1, 0x01
(0044)  CS-0x038  0x08198         || BRN MAIN
(0045)                            || 
(0046)                     0x039  || REVERSE:
(0047)  CS-0x039  0x12002         || POP R0
(0048)  CS-0x03A  0x30100         || CMP R1, 0x00
(0049)  CS-0x03B  0x081FA         || BREQ DONE
(0050)  CS-0x03C  0x34042         || OUT R0, OUT_DATA
(0051)  CS-0x03D  0x2C101         || SUB R1, 0x01
(0052)  CS-0x03E  0x081CB         || BRNE REVERSE
(0053)                            || 
(0054)                     0x03F  || DONE:
(0055)                            || 





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
DONE           0x03F   (0054)  ||  0049 
MAIN           0x033   (0037)  ||  0044 
REVERSE        0x039   (0046)  ||  0041 0052 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_DATA        0x09A   (0017)  ||  0039 
OUT_DATA       0x042   (0016)  ||  0050 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
