

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


(0001)                            || .CSEG
(0002)                       048  || .ORG 0X30
(0003)                            || 
(0004)  CS-0x030  0x32030         || IN R0, 0X30
(0005)  CS-0x031  0x04101         || MOV R1, R0
(0006)                            || 
(0007)  CS-0x032  0x10101         || LSR R1
(0008)  CS-0x033  0x2A200         || ADDC R2, 0X00
(0009)  CS-0x034  0x02110         || ADD R1, R2
(0010)  CS-0x035  0x18000         || CLC
(0011)  CS-0x036  0x10101         || LSR R1 
(0012)  CS-0x037  0x0A1E9         || BRCC MULT_4
(0013)  CS-0x038  0x18000         || CLC
(0014)  CS-0x039  0x04101         || MOV R1, R0
(0015)  CS-0x03A  0x10101         || LSR R1
(0016)  CS-0x03B  0x0A208         || BRCS ODD_YES
(0017)  CS-0x03C  0x0A221         || BRCC ODD_NO
(0018)                            || 
(0019)                     0x03D  || MULT_4:
(0020)  CS-0x03D  0x04101         || 		MOV R1, R0
(0021)  CS-0x03E  0x241FF         || 		EXOR R1, 0XFF
(0022)  CS-0x03F  0x04009         || 		MOV R0, R1
(0023)  CS-0x040  0x08230         || 		BRN OUTPUT
(0024)                            || 
(0025)                     0x041  || ODD_YES:
(0026)  CS-0x041  0x28011         || 		ADD R0, 0X11
(0027)  CS-0x042  0x10001         || 		LSR R0
(0028)  CS-0x043  0x08230         || 		BRN OUTPUT
(0029)                     0x044  || ODD_NO:
(0030)  CS-0x044  0x2C001         || 		SUB R0, 0X01
(0031)  CS-0x045  0x08230         || 		BRN OUTPUT
(0032)                            || 		
(0033)                     0x046  || OUTPUT:
(0034)  CS-0x046  0x34042         || 		OUT R0, 0X42





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
MULT_4         0x03D   (0019)  ||  0012 
ODD_NO         0x044   (0029)  ||  0017 
ODD_YES        0x041   (0025)  ||  0016 
OUTPUT         0x046   (0033)  ||  0023 0028 0031 


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
