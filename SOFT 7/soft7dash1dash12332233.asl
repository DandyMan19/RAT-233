

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
(0002)                            || ; ----------------------------------------------------
(0003)                            || ;
(0004)                            || ; SW ASSIGNMENT No. 7 PART 1
(0005)                            || ; DOMINIC GAIERO AND ELIZABETH DAVIS
(0006)                            || ;
(0007)                            || ; DESCRIPTION:
(0008)                            || ; CONVERTS AN UNSIGNED 8 BIT BINARY NUMBER TO BINARY
(0009)                            || ; CODED DECIMAL
(0010)                            || ; ----------------------------------------------------
(0011)                            || 
(0012)                       154  || .EQU IN_PORT = 0x9A
(0013)                       066  || .EQU OUT_PORT = 0x42
(0014)                       010  || .EQU FACTOR_10 = 0x0A
(0015)                       100  || .EQU FACTOR_100 = 0x64
(0016)                            || 
(0017)                            || ;--------------------------------------------------------------------------
(0018)                            || ;-- .ORG used in code segment
(0019)                            || ;--------------------------------------------------------------------------
(0020)                            || .CSEG
(0021)                       001  || .ORG 0x01                ; SET THE DATA SEGMENT COUNTER TO 0x01
(0022)                            || 
-------------------------------------------------------------------------------------------
-STUP-  CS-0x000  0x08008  0x100  ||              BRN     0x01        ; jump to start of .cseg in program mem 
-------------------------------------------------------------------------------------------
(0023)  CS-0x001  0x08088         || BRN MAIN
(0024)                            || 
(0025)                     0x002  || DIVIDE_BY_100:
(0026)  CS-0x002  0x30164         || CMP R1, FACTOR_100; Does an initial compare to see if the number is smaller than the divisor
(0027)  CS-0x003  0x0A080         || BRCS UNDERFLOW; If it is less than it doesn't divide and jumps to Underflow
(0028)  CS-0x004  0x2C164         || SUB R1, FACTOR_100; Subtracts 100 from the input number
(0029)  CS-0x005  0x28601         || ADD R6, 0x01; Adds one to the count register which is the result of the division
(0030)  CS-0x006  0x30164         || CMP R1, FACTOR_100; Compares R1 after the initial subtraction with 100 to check for underflow
(0031)  CS-0x007  0x0A011         || BRCC DIVIDE_BY_100; If the carry is cleared it continues to subtract from the input value
(0032)  CS-0x008  0x18002         || RET; Returns from the subroutine
(0033)                            || 
(0034)                     0x009  || DIVIDE_BY_10:
(0035)  CS-0x009  0x3020A         || CMP R2, FACTOR_10; Does an initial compare to see if the number is smaller than the divisor
(0036)  CS-0x00A  0x0A080         || BRCS UNDERFLOW; If it is less than it doesn't divide and jumps to Underflow
(0037)  CS-0x00B  0x2C20A         || SUB R2, FACTOR_10; Subtracts 10 from the input number
(0038)  CS-0x00C  0x28601         || ADD R6, 0x01; Adds one to the count register which is the result of the division
(0039)  CS-0x00D  0x3020A         || CMP R2, FACTOR_10; Compares R1 after the initial subtraction with 100 to check for underflow
(0040)  CS-0x00E  0x0A049         || BRCC DIVIDE_BY_10; If the carry is cleared it continues to subtract from the input value
(0041)  CS-0x00F  0x18002         || RET; Returnd from the subroutine
(0042)                            || 
(0043)                     0x010  || UNDERFLOW:
(0044)  CS-0x010  0x18002         || RET ; Returns from the subroutine
(0045)                            || 
(0046)  CS-0x011  0x3219A  0x011  || MAIN: IN R1, IN_PORT ; Takes in an initial value
(0047)  CS-0x012  0x36600         || MOV R6, 0x00 ; Makes a counter register
(0048)  CS-0x013  0x08011         || CALL DIVIDE_BY_100 ; Calls the DIVIDE_BY_100 subroutine
(0049)  CS-0x014  0x04209         || MOV R2, R1; Moves the value of R1 into R2 because it is the remainder of the division operation
(0050)  CS-0x015  0x04131         || MOV R1, R6; Moves the value of the count register into R1 because it is the hundreths digit
(0051)  CS-0x016  0x36600         || MOV R6, 0x00; Clears the count register
(0052)  CS-0x017  0x08049         || CALL DIVIDE_BY_10; Calls the DIVIDE_BY_10 subroutine
(0053)  CS-0x018  0x04311         || MOV R3, R2; Moves the value of R2 into R3 because it is the remainder of the division operation
(0054)  CS-0x019  0x04231         || MOV R2, R6; Moves the value in the count register into R2 because it is the tenths digit
(0055)                            || 
(0056)  CS-0x01A  0x34142         || OUT R1, OUT_PORT; Outputs the hundreths digit
(0057)  CS-0x01B  0x34242         || OUT R2, OUT_PORT; Outputs the tenths digit
(0058)  CS-0x01C  0x34342         || OUT R3, OUT_PORT; Outputs the ones digit
t





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
DIVIDE_BY_10   0x009   (0034)  ||  0040 0052 
DIVIDE_BY_100  0x002   (0025)  ||  0031 0048 
MAIN           0x011   (0046)  ||  0023 
UNDERFLOW      0x010   (0043)  ||  0027 0036 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
FACTOR_10      0x00A   (0014)  ||  0035 0037 0039 
FACTOR_100     0x064   (0015)  ||  0026 0028 0030 
IN_PORT        0x09A   (0012)  ||  0046 
OUT_PORT       0x042   (0013)  ||  0056 0057 0058 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
