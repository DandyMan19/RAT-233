

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
(0002)                       154  || .EQU IN_DATA = 0x9A
(0003)                       066  || .EQU OUT_DATA = 0x42
(0004)                            || 
(0005)                            || .CSEG
(0006)                       048  || .ORG 0x30				; initialize the counter to 0x01
(0007)                            || 
(0008)  CS-0x030  0x36200         || MOV R2, 0x00 			; initialize the multiply counter 
(0009)                            || 
(0010)  CS-0x031  0x3209A         || IN R0, IN_DATA;		
(0011)  CS-0x032  0x04101         || MOV R1, R0
(0012)                            || 
(0013)  CS-0x033  0x2000F         || AND R0, 0x0F;			; using bit masking with AND instruction, I was able to isolate the upper and lower bits 
(0014)  CS-0x034  0x201F0         || AND R1, 0xF0;
(0015)                            || 
(0016)  CS-0x035  0x10102         || ROL R1					; using the LSR instruction will rotate the upper 4 bits to the right side
(0017)  CS-0x036  0x10102         || ROL R1					; and will therefore be in the lower 4 bits as the divided lower 4 bits.
(0018)  CS-0x037  0x10102         || ROL R1
(0019)  CS-0x038  0x10102         || ROL R1;
(0020)                            || 
(0021)                            || 
(0022)                     0x039  || multiply_combinations:
(0023)                            || 
(0024)  CS-0x039  0x04208         || CMP R2, R1
(0025)  CS-0x03A  0x081F2         || BREQ Output
(0026)  CS-0x03B  0x02300         || ADD R3, R0;
(0027)  CS-0x03C  0x28201         || ADD R2, 0x01;
(0028)  CS-0x03D  0x081C8         || BRN multiply_combinations
(0029)                            || 
(0030)                     0x03E  || Output:
(0031)                            || 
(0032)  CS-0x03E  0x34342         || OUT R3, OUT_DATA;
(0033)                            || 





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
MULTIPLY_COMBINATIONS 0x039   (0022)  ||  0028 
OUTPUT         0x03E   (0030)  ||  0025 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
IN_DATA        0x09A   (0002)  ||  0010 
OUT_DATA       0x042   (0003)  ||  0032 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
