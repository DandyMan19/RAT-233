

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
(0003)                            || .DSEG
(0004)                       001  || .ORG 0X01
(0005)  DS-0x001             00B  || .DB 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C
(0006)                            || 
(0007)                            || .CSEG
(0008)                       035  || .ORG 0x23
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x36002  0x002  ||              MOV     r0,0x02     ; write dseg data to reg
-STUP-  CS-0x001  0x3A001  0x001  ||              ST      r0,0x01     ; place reg data in mem 
-STUP-  CS-0x002  0x36003  0x003  ||              MOV     r0,0x03     ; write dseg data to reg
-STUP-  CS-0x003  0x3A002  0x002  ||              ST      r0,0x02     ; place reg data in mem 
-STUP-  CS-0x004  0x36004  0x004  ||              MOV     r0,0x04     ; write dseg data to reg
-STUP-  CS-0x005  0x3A003  0x003  ||              ST      r0,0x03     ; place reg data in mem 
-STUP-  CS-0x006  0x36005  0x005  ||              MOV     r0,0x05     ; write dseg data to reg
-STUP-  CS-0x007  0x3A004  0x004  ||              ST      r0,0x04     ; place reg data in mem 
-STUP-  CS-0x008  0x36006  0x006  ||              MOV     r0,0x06     ; write dseg data to reg
-STUP-  CS-0x009  0x3A005  0x005  ||              ST      r0,0x05     ; place reg data in mem 
-STUP-  CS-0x00A  0x36007  0x007  ||              MOV     r0,0x07     ; write dseg data to reg
-STUP-  CS-0x00B  0x3A006  0x006  ||              ST      r0,0x06     ; place reg data in mem 
-STUP-  CS-0x00C  0x36008  0x008  ||              MOV     r0,0x08     ; write dseg data to reg
-STUP-  CS-0x00D  0x3A007  0x007  ||              ST      r0,0x07     ; place reg data in mem 
-STUP-  CS-0x00E  0x36009  0x009  ||              MOV     r0,0x09     ; write dseg data to reg
-STUP-  CS-0x00F  0x3A008  0x008  ||              ST      r0,0x08     ; place reg data in mem 
-STUP-  CS-0x010  0x3600A  0x00A  ||              MOV     r0,0x0A     ; write dseg data to reg
-STUP-  CS-0x011  0x3A009  0x009  ||              ST      r0,0x09     ; place reg data in mem 
-STUP-  CS-0x012  0x3600B  0x00B  ||              MOV     r0,0x0B     ; write dseg data to reg
-STUP-  CS-0x013  0x3A00A  0x00A  ||              ST      r0,0x0A     ; place reg data in mem 
-STUP-  CS-0x014  0x3600C  0x00C  ||              MOV     r0,0x0C     ; write dseg data to reg
-STUP-  CS-0x015  0x3A00B  0x00B  ||              ST      r0,0x0B     ; place reg data in mem 
-STUP-  CS-0x016  0x08118  0x100  ||              BRN     0x23        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0009)  CS-0x023  0x36007         || MOV R0, 0x07
(0010)  CS-0x024  0x36106         || MOV R1, 0x06
(0011)                            || ;ADD R0, 0x14
(0012)                            || ;ST R1, (R0)
(0013)                            || ;LD R0, 0x12
(0014)  CS-0x025  0x12001         || PUSH R0
(0015)  CS-0x026  0x12102         || POP R1
(0016)                            || 





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
