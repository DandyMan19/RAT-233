

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
(0002)                            || 
(0003)                       154  || .EQU INPUT = 0x9A
(0004)                       065  || .EQU OUTPUT_100 = 0x41
(0005)                       066  || .EQU OUTPUT_10 = 0x42
(0006)                       067  || .EQU OUTPUT_1 = 0x43
(0007)                       100  || .EQU DIVISOR_100 = 0x64
(0008)                       010  || .EQU DIVISOR_10 = 0x0A
(0009)                            || 
(0010)                            || .CSEG
(0011)                       001  || .ORG 0x01
(0012)                            || 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x08008  0x100  ||              BRN     0x01        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0013)  CS-0x001  0x3209A         || IN R0, INPUT
(0014)  CS-0x002  0x36100         || MOV R1, 0x00
(0015)  CS-0x003  0x36200         || MOV R2, 0x00
(0016)  CS-0x004  0x36300         || MOV R3, 0x00
(0017)  CS-0x005  0x36400         || MOV R4, 0x00
(0018)  CS-0x006  0x36500         || MOV R5, 0x00
(0019)  CS-0x007  0x080B8         || BRN MAIN
(0020)                            || 
(0021)                     0x008  || DIVIDE_100: 
(0022)                            || 
(0023)  CS-0x008  0x30064         || CMP R0, DIVISOR_100
(0024)  CS-0x009  0x0A0B0         || BRCS UNDERFLOW
(0025)  CS-0x00A  0x2C064         || SUB R0, DIVISOR_100
(0026)  CS-0x00B  0x28101         || ADD R1, 0x01
(0027)  CS-0x00C  0x30064         || CMP R0, DIVISOR_100
(0028)  CS-0x00D  0x0A041         || BRCC DIVIDE_100
(0029)  CS-0x00E  0x18002         || RET
(0030)                            || 
(0031)                     0x00F  || DIVIDE_10: 
(0032)                            || 
(0033)  CS-0x00F  0x3000A         || CMP R0, DIVISOR_10
(0034)  CS-0x010  0x0A0B0         || BRCS UNDERFLOW
(0035)  CS-0x011  0x2C00A         || SUB R0, DIVISOR_10
(0036)  CS-0x012  0x28201         || ADD R2, 0x01
(0037)  CS-0x013  0x3000A         || CMP R0, DIVISOR_10
(0038)  CS-0x014  0x0A079         || BRCC DIVIDE_10
(0039)  CS-0x015  0x18002         || RET
(0040)                            || 
(0041)                     0x016  || UNDERFLOW: 
(0042)                            || 
(0043)  CS-0x016  0x18002         || RET
(0044)                            || 
(0045)                     0x017  || MAIN:
(0046)                            || 
(0047)  CS-0x017  0x08041         || CALL DIVIDE_100 
(0048)  CS-0x018  0x04309         || MOV R3, R1
(0049)  CS-0x019  0x08079         || CALL DIVIDE_10
(0050)  CS-0x01A  0x04411         || MOV R4, R2
(0051)  CS-0x01B  0x04501         || MOV R5, R0
(0052)  CS-0x01C  0x080E8         || BRN OUTPUT
(0053)                            || 
(0054)                     0x01D  || OUTPUT:
(0055)                            || 
(0056)  CS-0x01D  0x34341         || OUT R3, OUTPUT_100
(0057)  CS-0x01E  0x34442         || OUT R4, OUTPUT_10
(0058)  CS-0x01F  0x34543         || OUT R5, OUTPUT_1
(0059)                            || 
(0060)                            || 
(0061)                            || 
(0062)                            || 
(0063)                            || 
(0064)                            || 
(0065)                            || 





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
DIVIDE_10      0x00F   (0031)  ||  0038 0049 
DIVIDE_100     0x008   (0021)  ||  0028 0047 
MAIN           0x017   (0045)  ||  0019 
OUTPUT         0x01D   (0054)  ||  0052 
UNDERFLOW      0x016   (0041)  ||  0024 0034 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
DIVISOR_10     0x00A   (0008)  ||  0033 0035 0037 
DIVISOR_100    0x064   (0007)  ||  0023 0025 0027 
INPUT          0x09A   (0003)  ||  0013 
OUTPUT_1       0x043   (0006)  ||  0058 
OUTPUT_10      0x042   (0005)  ||  0057 
OUTPUT_100     0x041   (0004)  ||  0056 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
