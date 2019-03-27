

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
(0002)                       066  || .EQU OUT_FIB = 0x42
(0003)                            || 
(0004)                            || .DSEG
(0005)                       000  || .ORG 0x00
(0006)  DS-0x000             00E  ||      .DB 0x08, 0x0D, 0x15, 0x22, 0x37, 0x59, 0x90, 0xE9
            syntax error

(0007)                            || 
(0008)                            || .CSEG
(0009)                       048  || .ORG 0x30
(0010)                            || 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x36000  0x000  ||              MOV     r0,0x00     ; write dseg data to reg
-STUP-  CS-0x001  0x3A000  0x000  ||              LD      r0,0x00     ; place reg data in mem 
-STUP-  CS-0x002  0x36001  0x001  ||              MOV     r0,0x01     ; write dseg data to reg
-STUP-  CS-0x003  0x3A001  0x001  ||              LD      r0,0x01     ; place reg data in mem 
-STUP-  CS-0x004  0x36001  0x001  ||              MOV     r0,0x01     ; write dseg data to reg
-STUP-  CS-0x005  0x3A002  0x002  ||              LD      r0,0x02     ; place reg data in mem 
-STUP-  CS-0x006  0x36002  0x002  ||              MOV     r0,0x02     ; write dseg data to reg
-STUP-  CS-0x007  0x3A003  0x003  ||              LD      r0,0x03     ; place reg data in mem 
-STUP-  CS-0x008  0x36003  0x003  ||              MOV     r0,0x03     ; write dseg data to reg
-STUP-  CS-0x009  0x3A004  0x004  ||              LD      r0,0x04     ; place reg data in mem 
-STUP-  CS-0x00A  0x36005  0x005  ||              MOV     r0,0x05     ; write dseg data to reg
-STUP-  CS-0x00B  0x3A005  0x005  ||              LD      r0,0x05     ; place reg data in mem 
-STUP-  CS-0x00C  0x36008  0x008  ||              MOV     r0,0x08     ; write dseg data to reg
-STUP-  CS-0x00D  0x3A006  0x006  ||              LD      r0,0x06     ; place reg data in mem 
-STUP-  CS-0x00E  0x3600D  0x00D  ||              MOV     r0,0x0D     ; write dseg data to reg
-STUP-  CS-0x00F  0x3A007  0x007  ||              LD      r0,0x07     ; place reg data in mem 
-STUP-  CS-0x010  0x36015  0x015  ||              MOV     r0,0x15     ; write dseg data to reg
-STUP-  CS-0x011  0x3A008  0x008  ||              LD      r0,0x08     ; place reg data in mem 
-STUP-  CS-0x012  0x36022  0x022  ||              MOV     r0,0x22     ; write dseg data to reg
-STUP-  CS-0x013  0x3A009  0x009  ||              LD      r0,0x09     ; place reg data in mem 
-STUP-  CS-0x014  0x36037  0x037  ||              MOV     r0,0x37     ; write dseg data to reg
-STUP-  CS-0x015  0x3A00A  0x00A  ||              LD      r0,0x0A     ; place reg data in mem 
-STUP-  CS-0x016  0x36059  0x059  ||              MOV     r0,0x59     ; write dseg data to reg
-STUP-  CS-0x017  0x3A00B  0x00B  ||              LD      r0,0x0B     ; place reg data in mem 
-STUP-  CS-0x018  0x36090  0x090  ||              MOV     r0,0x90     ; write dseg data to reg
-STUP-  CS-0x019  0x3A00C  0x00C  ||              LD      r0,0x0C     ; place reg data in mem 
-STUP-  CS-0x01A  0x360E9  0x0E9  ||              MOV     r0,0xE9     ; write dseg data to reg
-STUP-  CS-0x01B  0x3A00D  0x00D  ||              LD      r0,0x0D     ; place reg data in mem 
-STUP-  CS-0x01C  0x08180  0x100  ||              BRN     0x30        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0011)  CS-0x030  0x36000         || MOV R0, 0x00
(0012)  CS-0x031  0x36103         || MOV R1, 0x03
(0013)                            || 
(0014)                     0x032  || MAIN:
(0015)  CS-0x032  0x04202         || LD R2, (R0)
(0016)  CS-0x033  0x0430A         || LD R3, (R1)
(0017)  CS-0x034  0x02312         || SUB R3, R2
(0018)  CS-0x035  0x34342         || OUT R3, OUT_FIB
(0019)  CS-0x036  0x28001         || ADD R0, 0x01
(0020)  CS-0x037  0x28101         || ADD R1, 0x01
(0021)  CS-0x038  0x18000         || CLC
(0022)  CS-0x039  0x3000B         || CMP R0, 0x0B
(0023)  CS-0x03A  0x0A190         || BRCS MAIN





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
MAIN           0x032   (0014)  ||  0023 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
OUT_FIB        0x042   (0002)  ||  0018 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
