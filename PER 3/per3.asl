

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


(0001)                       034  || .EQU KEY_INPUT = 0x22
(0002)                       066  || .EQU OUTPUT = 0x42
(0003)                       067  || .EQU OUT_LED1 = 0x43
(0004)                       068  || .EQU OUT_LED2 = 0x44
(0005)                       069  || .EQU OUT_LED3 = 0x45
(0006)                       070  || .EQU OUT_LED4 = 0x46
(0007)                       071  || .EQU OUT_LED5 = 0x47
(0008)                       072  || .EQU OUT_LED6 = 0x48
(0009)                            || 
(0010)                            || .CSEG
(0011)                       001  || .ORG 0x01
(0012)                            || ;TEST TO SEE IF A SPECIFIC KEY SEQUENCE IS CORRECT. TEST TO SEE IF 7624AB.
(0013)                            || 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x08008  0x100  ||              BRN     0x01        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0014)  CS-0x001  0x1A001         || CLI
(0015)  CS-0x002  0x36000         || MOV R0, 0x00
(0016)  CS-0x003  0x36100         || MOV R1, 0x00
(0017)  CS-0x004  0x36200         || MOV R2, 0x00
(0018)                            || 
(0019)                     0x005  || DIGIT_1: 
(0020)  CS-0x005  0x32022         || IN R0, KEY_INPUT
(0021)  CS-0x006  0x04201         || MOV R2, R0
(0022)  CS-0x007  0x1A000         || SEI
(0023)  CS-0x008  0x30007         || CMP R0, 0x07
(0024)  CS-0x009  0x0802B         || BRNE DIGIT_1
(0025)  CS-0x00A  0x0805A         || BREQ DIGIT_2
(0026)                            || 
(0027)                     0x00B  || DIGIT_2:
(0028)  CS-0x00B  0x1A001         || CLI 
(0029)  CS-0x00C  0x32022         || IN R0, KEY_INPUT
(0030)  CS-0x00D  0x04301         || MOV R3, R0
(0031)  CS-0x00E  0x1A000         || SEI
(0032)  CS-0x00F  0x30306         || CMP R3, 0x06
(0033)  CS-0x010  0x0805B         || BRNE DIGIT_2
(0034)  CS-0x011  0x08092         || BREQ DIGIT_3
(0035)                            || 
(0036)                     0x012  || DIGIT_3: 
(0037)  CS-0x012  0x1A001         || CLI 
(0038)  CS-0x013  0x32022         || IN R0, KEY_INPUT
(0039)  CS-0x014  0x04401         || MOV R4, R0
(0040)  CS-0x015  0x1A000         || SEI
(0041)  CS-0x016  0x30402         || CMP R4, 0x02
(0042)  CS-0x017  0x08093         || BRNE DIGIT_3
(0043)  CS-0x018  0x080CA         || BREQ DIGIT_4
(0044)                            || 
(0045)                     0x019  || DIGIT_4: 
(0046)  CS-0x019  0x1A001         || CLI 
(0047)  CS-0x01A  0x32022         || IN R0, KEY_INPUT
(0048)  CS-0x01B  0x04501         || MOV R5, R0
(0049)  CS-0x01C  0x1A000         || SEI
(0050)  CS-0x01D  0x30504         || CMP R5, 0x04
(0051)  CS-0x01E  0x080CB         || BRNE DIGIT_4
(0052)  CS-0x01F  0x08102         || BREQ DIGIT_5
(0053)                            || 
(0054)                     0x020  || DIGIT_5: 
(0055)  CS-0x020  0x1A001         || CLI 
(0056)  CS-0x021  0x32022         || IN R0, KEY_INPUT
(0057)  CS-0x022  0x04601         || MOV R6, R0
(0058)  CS-0x023  0x1A000         || SEI
(0059)  CS-0x024  0x3060A         || CMP R6, 0x0A
(0060)  CS-0x025  0x08103         || BRNE DIGIT_5
(0061)  CS-0x026  0x0813A         || BREQ DIGIT_6
(0062)                            || 
(0063)                     0x027  || DIGIT_6: 
(0064)  CS-0x027  0x1A001         || CLI 
(0065)  CS-0x028  0x32022         || IN R0, KEY_INPUT
(0066)  CS-0x029  0x04701         || MOV R7, R0
(0067)  CS-0x02A  0x1A000         || SEI
(0068)  CS-0x02B  0x3070B         || CMP R7, 0x0B
(0069)  CS-0x02C  0x0813B         || BRNE DIGIT_6
(0070)  CS-0x02D  0x08172         || BREQ DONE
(0071)                            || 
(0072)                     0x02E  || DONE:
(0073)  CS-0x02E  0x36101         || MOV R1, 0x01
(0074)  CS-0x02F  0x34142         || OUT R1, OUTPUT
(0075)                            || 
(0076)                     0x030  || ISR: 
(0077)  CS-0x030  0x30207         || CMP R2, 0x07
(0078)  CS-0x031  0x0821B         || BRNE CALLBACK
(0079)  CS-0x032  0x34243         || OUT R2, OUT_LED1
(0080)  CS-0x033  0x30006         || CMP R0, 0x06
(0081)  CS-0x034  0x0821B         || BRNE CALLBACK
(0082)  CS-0x035  0x34344         || OUT R3, OUT_LED2
(0083)  CS-0x036  0x30002         || CMP R0, 0x02
(0084)  CS-0x037  0x0821B         || BRNE CALLBACK
(0085)  CS-0x038  0x34445         || OUT R4, OUT_LED3
(0086)  CS-0x039  0x30004         || CMP R0, 0x04
(0087)  CS-0x03A  0x0821B         || BRNE CALLBACK
(0088)  CS-0x03B  0x34546         || OUT R5, OUT_LED4
(0089)  CS-0x03C  0x3000A         || CMP R0, 0x0A
(0090)  CS-0x03D  0x0821B         || BRNE CALLBACK
(0091)  CS-0x03E  0x34647         || OUT R6, OUT_LED5
(0092)  CS-0x03F  0x3000B         || CMP R0, 0x0B
(0093)  CS-0x040  0x0821B         || BRNE CALLBACK
(0094)  CS-0x041  0x34748         || OUT R7, OUT_LED6
(0095)  CS-0x042  0x1A002         || RETID
(0096)                            || 
(0097)                     0x043  || CALLBACK:
(0098)  CS-0x043  0x1A002         || RETID
(0099)                            || 
(0100)                       1023  || .ORG 0x3FF
(0101)  CS-0x3FF  0x08180  0x3FF  || VECTOR: BRN ISR

(0102)                            || VECTOR: BRN ISR






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
CALLBACK       0x043   (0097)  ||  0078 0081 0084 0087 0090 0093 
DIGIT_1        0x005   (0019)  ||  0024 
DIGIT_2        0x00B   (0027)  ||  0025 0033 
DIGIT_3        0x012   (0036)  ||  0034 0042 
DIGIT_4        0x019   (0045)  ||  0043 0051 
DIGIT_5        0x020   (0054)  ||  0052 0060 
DIGIT_6        0x027   (0063)  ||  0061 0069 
DONE           0x02E   (0072)  ||  0070 
ISR            0x030   (0076)  ||  0101 
VECTOR         0x3FF   (0101)  ||  


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
KEY_INPUT      0x022   (0001)  ||  0020 0029 0038 0047 0056 0065 
OUTPUT         0x042   (0002)  ||  0074 
OUT_LED1       0x043   (0003)  ||  0079 
OUT_LED2       0x044   (0004)  ||  0082 
OUT_LED3       0x045   (0005)  ||  0085 
OUT_LED4       0x046   (0006)  ||  0088 
OUT_LED5       0x047   (0007)  ||  0091 
OUT_LED6       0x048   (0008)  ||  0094 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
