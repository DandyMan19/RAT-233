

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
(0002)                            || ;-----------------------------------------------------
(0003)                            || ;
(0004)                            || ; PERIPHERAL ASSIGNMENT 2
(0005)                            || ; JEREMIAH GLAZA and JASON CHANDLER
(0006)                            || ;
(0007)                            || ; DESCRIPTION:
(0008)                            || ; 
(0009)                            || ;-----------------------------------------------------
(0010)                            || ; Constants
(0011)                            || ;----------------------------------------------------
(0012)                       064  || .EQU DELAY_PORT = 0x40 ;this will output the result through every cycle.
(0013)                            || ;--------------------------------------------------------------------------
(0014)                            || ;-- ASSEMBLER DIRECTIVES
(0015)                            || ;--------------------------------------------------------------------------
(0016)                            || .CSEG		  ;sets code segment
(0017)                       001  || .ORG 0x01    ; set the data segment counter to 0x01
(0018)                            || ;------------------------------------------------------
(0019)                            || ; Initializations
(0020)                            || ;---------------------------------------------------------
(0021)  CS-0x001  0x36000         || MOV R0, 0x00
(0022)                            || 
(0023)                            || ;CALL ADD_VALS
(0024)                            || 
(0025)                     0x002  || ADD_VALS:            
(0026)  CS-0x002  0x34040         || 	OUT R0, DELAY_PORT
(0027)  CS-0x003  0x300FF         || 	CMP R0, 0xFF
(0028)  CS-0x004  0x0803A         || 	BREQ OUTPUT
(0029)  CS-0x005  0x28001         || 	ADD R0, 0x01
(0030)  CS-0x006  0x08013         || 	BRNE ADD_VALS
(0031)                            || ;	RET
(0032)                            || 
(0033)                     0x007  || OUTPUT:
(0034)                            || 





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
ADD_VALS       0x002   (0025)  ||  0030 
OUTPUT         0x007   (0033)  ||  0028 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
DELAY_PORT     0x040   (0012)  ||  0026 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
