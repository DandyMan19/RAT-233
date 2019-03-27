

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
(0003)                            || ;-Software Assignment 4 Part 1: Loops
(0004)                            || ;
(0005)                            || ;- Programmers: Jeremiah Glaza and Jason Chandler
(0006)                            || ;
(0007)                            || ;- Description: This program will divide any hexadecimal number   
(0008)                            || ;               by three. After this, it will output the number 
(0009)                            || ;               and the remainder to port 0x42 and 0x43 
(0010)                            || ;               respectively.
(0011)                            || ;---------------------------------------------------------------
(0012)                            || 
(0013)                            || ;---------------------------------------------------------------
(0014)                            || ;- Assembler Directives
(0015)                            || ;---------------------------------------------------------------
(0016)                            || .CSEG		; indicates code segment
(0017)                       154  || .ORG 0X9A		; sets the code segment counter to 0x9A
(0018)                            || ;---------------------------------------------------------------
(0019)                            || 
(0020)                            || ;---------------------------------------------------------------
(0021)                            || ;- Initializations
(0022)                            || ;---------------------------------------------------------------
(0023)  CS-0x09A  0x1A001         || 			CLI			;prevent interrupts
(0024)                            || ;---------------------------------------------------------------
(0025)                            || 
(0026)                            || ;---------------------------------------------------------------
(0027)                            || ; Main Function will take the input values for R0, R1, R2, R3, ;R4, R5, and R6: These registers are utilized to input the ;number, compare the remainder to 3, compute the remainder, ;compute the bit length, and compare the remainder to 4.
(0028)                            || ;---------------------------------------------------------------
(0029)                            || 
(0030)  CS-0x09B  0x3209A         || IN R0, 0x9A			;Allows user to input a number into  
(0031)                            ||                          ;address 0x9A.
(0032)                            || 
(0033)  CS-0x09C  0x36103         || MOV R1, 0x03             ;Used for a comparison later to 
(0034)                            ||                          ;generate a carry.
(0035)                            || 
(0036)  CS-0x09D  0x36200         || MOV R2, 0x00             ;Used to keep track of the remainder  
(0037)                            ||                          ;throughout the division.
(0038)                            || 
(0039)  CS-0x09E  0x36300         || MOV R3, 0x00             ;Used to keep track of the number 
(0040)                            ||                          ;throughout the division.
(0041)                            || 
(0042)  CS-0x09F  0x36400         || MOV R4, 0x00             ;Used to keep track of the bit length 
(0043)                            ||                          ;throughout the division.
(0044)                            || 
(0045)  CS-0x0A0  0x36504         || MOV R5, 0x04             ;Used for a comparison later to
(0046)                            ||                          ; generate a carry.
(0047)                            || 
(0048)  CS-0x0A1  0x18000         || CLC                      ;Clears the carry so as to not change 
(0049)                            ||                          ;the LSLs.
(0050)                            || 
(0051)  CS-0x0A2  0x28401         || ADD R4, 0x01             ;Adds 0x01 to R4 to keep track of the 
(0052)                            ||                          ;bit length.
(0053)                            || 
(0054)  CS-0x0A3  0x10000         || LSL R0                   ;Shifts R0 left for long division.
(0055)                            || 
(0056)  CS-0x0A4  0x10200         || LSL R2                   ;Shifts R2 to correspond with the 
(0057)                            ||                          ;carry.
(0058)                            || 
(0059)  CS-0x0A5  0x04110         || CMP R1, R2               ;Determines if R2 is greater than or 
(0060)                            ||                          ;equal to three.
(0061)                            || 
(0062)  CS-0x0A6  0x08572         || BREQ three               ;Branches to the “three” function if R2 
(0063)                            ||                          ;equals 0x03.
(0064)                            || 
(0065)  CS-0x0A7  0x04510         || CMP R5, R2               ;Determines if R2 is greater than or 
(0066)                            ||                          ;equal to four.
(0067)                            || 
(0068)  CS-0x0A8  0x0858A         || BREQ four                ;Branches to the “four” function if R2 
(0069)                            ||                          ;equals 0x04.
(0070)                            || 
(0071)  CS-0x0A9  0x0A5A0         || BRCS five                ;Branches to the “five” function if the  
(0072)                            ||                          ;carry is activated when R2 is compared 
(0073)                            ||                          ;to 0x04.
(0074)                            || 
(0075)  CS-0x0AA  0x10300         || LSL R3                   ;Shifts R3 over to the left to account 
(0076)                            ||                          ;for the final division.
(0077)                            || 
(0078)  CS-0x0AB  0x30408         || CMP R4, 0x08             ;Determines if the 8 bits of the number 
(0079)                            ||                          ;are accounted for.
(0080)                            || 
(0081)  CS-0x0AC  0x085BA         || BREQ carry               ;If the zero flag for the CMP is on, 
(0082)                            ||                          ;“carry” is executed.
(0083)                            || 
(0084)  CS-0x0AD  0x08508         || BRN 0x0A1                ;Loops to CLC.
(0085)                            || 
(0086)                            || ;----------------------------------------------------------------
(0087)                            || ;Three Function: Affects the remainder if the values of the bits in long division are three.
(0088)                            || ;----------------------------------------------------------------
(0089)                            || 
(0090)  CS-0x0AE  0x36200  0x0AE  || three: MOV R2, 0x00      ;Moves 0x00 into R2 to keep track of 
(0091)                            ||                          ;the remainder.
(0092)                            || 
(0093)  CS-0x0AF  0x18001         || 	  SEC               ;Sets the carry to one so the LSL of R3 
(0094)                            ||                          ;is 1.
(0095)                            || 
(0096)  CS-0x0B0  0x08550         || 	  BRN 0x0AA         ;Branches to “LSL R3”.
(0097)                            || 
(0098)                            || 
(0099)                            || 
(0100)                            || ;----------------------------------------------------------------
(0101)                            || ;Four Function: Affects the remainder if the values of the bits in long division are four.
(0102)                            || ;----------------------------------------------------------------
(0103)                            || 
(0104)  CS-0x0B1  0x36201  0x0B1  || four:  MOV R2, 0x01      ;Moves 0x01 into R2 to keep track of 
(0105)                            ||                          ;the remainder.
(0106)                            || 
(0107)  CS-0x0B2  0x18001         ||        SEC               ;Sets the carry to one so the LSL of R3 
(0108)                            ||                          ;is 1.
(0109)                            || 
(0110)  CS-0x0B3  0x08550         || 	  BRN 0x0AA         ;Branches to “LSL R3”.
(0111)                            || 
(0112)                            || ;----------------------------------------------------------------
(0113)                            || ;Five Function: Affects the remainder if the values of the bits in long division are five.
(0114)                            || ;----------------------------------------------------------------
(0115)                            || 
(0116)  CS-0x0B4  0x36202  0x0B4  || five:  MOV R2, 0x02      ;Moves 0x02 into R2 to keep track of
(0117)                            ||                          ;the remainder.
(0118)                            || 
(0119)  CS-0x0B5  0x18001         ||        SEC               ;Sets the carry to one so the LSL of R3  
(0120)                            ||                          ;is 1.
(0121)                            || 
(0122)  CS-0x0B6  0x08550         || 	  BRN 0x0AA         ;Branches to “LSL R3”.
(0123)                            || 
(0124)                            || ;----------------------------------------------------------------
(0125)                            || ;Carry Function: Acts as the output function
(0126)                            || ;----------------------------------------------------------------
(0127)  CS-0x0B7  0x34342  0x0B7  || carry: OUT R3, 0x42      ;Outputs the final quotient to 0x42.
(0128)                            || 
(0129)  CS-0x0B8  0x34243         ||        OUT R2, 0x43      ;Outputs the final remainder to 0x43.
(0130)                            || 





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
CARRY          0x0B7   (0127)  ||  0081 
FIVE           0x0B4   (0116)  ||  0071 
FOUR           0x0B1   (0104)  ||  0068 
THREE          0x0AE   (0090)  ||  0062 


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
