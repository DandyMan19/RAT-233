

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
(0003)                            || ;-Software Assignment 4 Part 2: Division
(0004)                            || ;
(0005)                            || ;- Programmers: Jeremiah Glaza and Jason Chandler
(0006)                            || ;
(0007)                            || ;- Date: 1-30-2019
(0008)                            || ;
(0009)                            || ;- Description:  This program will take in two input values and 
(0010)                            || ;                divide the first by the second and then output the
(0011)                            || ;				 results for the quotient and the remainder.
(0012)                            || ;---------------------------------------------------------------
(0013)                            || ;- Assembler Directives
(0014)                            || ;---------------------------------------------------------------
(0015)                            || ; Constants
(0016)                            || ;---------------------------------------------------------------
(0017)                       154  || .EQU INPUT_PORT = 0x9A		;sets the input to port_id 0x9A.
(0018)                       066  || .EQU QUOTIENT = 0x42	;sets the quotient output to port_id 0x42.
(0019)                       067  || .EQU REMAINDER = 0x43	; sets the remainder output to port id 0x43.
(0020)                            || ;----------------------------------------------------------------
(0021)                            || .CSEG		            ; indicates code segment.
(0022)                       048  || .ORG 0X30				; sets the code segment counter to 0x30.
(0023)                            || ;---------------------------------------------------------------
(0024)                            || ;
(0025)                            || ;---------------------------------------------------------------
(0026)                            || ;- Initializations
(0027)                            || ;---------------------------------------------------------------
(0028)  CS-0x030  0x1A001         || 			CLI			;prevent interrupts.
(0029)                            || ;---------------------------------------------------------------
(0030)                            || ; Main Code
(0031)                            || ;---------------------------------------------------------------
(0032)                            || ; Main is the label where the the input value and the 
(0033)                            || ; initializations are enabled. This is where the 8 bit value is 
(0034)                            || ; divided into two different values and stored in R0 and R1. The 
(0035)                            || ; multiplier is determined through 4 rotations and stored into 
(0036)                            || ; R1. 
(0037)                            || ;---------------------------------------------------------------
(0038)                            || 
(0039)                     0x031  || Main:
(0040)  CS-0x031  0x3209A         || 				 IN R0, INPUT_PORT
(0041)  CS-0x032  0x3219A         || 				 IN R1, INPUT_PORT
(0042)  CS-0x033  0x36200         || 				 MOV R2, 0x00
(0043)  CS-0x034  0x36300         || 				 MOV R3, 0x00
(0044)  CS-0x035  0x36600         || 				 MOV R6, 0x00
(0045)  CS-0x036  0x04401         || 				 MOV R4, R0
(0046)  CS-0x037  0x04509         || 				 MOV R5, R1
(0047)  CS-0x038  0x30000         || 				 CMP R0, 0x00
(0048)  CS-0x039  0x081EA         || 				 BREQ Main1
(0049)  CS-0x03A  0x30100         || 				 CMP R1, 0x00
(0050)  CS-0x03B  0x081EA         || 				 BREQ Main1
(0051)  CS-0x03C  0x08248         || 				 BRN Main2
(0052)                     0x03D  || Main1:				 ;
(0053)  CS-0x03D  0x18000         || 				 CLC
(0054)  CS-0x03E  0x30001         || 				 CMP R0, 0x01
(0055)  CS-0x03F  0x2A600         || 				 ADDC R6, 0x00
(0056)  CS-0x040  0x30101         || 				 CMP R1, 0x01
(0057)  CS-0x041  0x2A600         || 				 ADDC R6, 0x00
(0058)  CS-0x042  0x30602         || 				 CMP R6, 0x02
(0059)  CS-0x043  0x08452         || 				 BREQ NUM_DEN_ZERO
(0060)  CS-0x044  0x18000         || 				 CLC
(0061)  CS-0x045  0x30000         || 				 CMP R0, 0x00
(0062)  CS-0x046  0x08422         || 				 BREQ NUM_ZERO
(0063)  CS-0x047  0x30100         || 				 CMP R1, 0x00
(0064)  CS-0x048  0x0843A         || 				 BREQ DEN_ZERO
(0065)                     0x049  || Main2:				 
(0066)  CS-0x049  0x18000         || 				 CLC
(0067)  CS-0x04A  0x04008         || 				 CMP R0, R1
(0068)  CS-0x04B  0x083FA         || 				 BREQ EQUAL_VALUES
(0069)  CS-0x04C  0x0A328         || 				 BRCS DIVIDE_R1_LOOP
(0070)  CS-0x04D  0x08273         || 				 BRNE DIVIDE_R0_LOOP
(0071)                            || 
(0072)                     0x04E  || DIVIDE_R0_LOOP:
(0073)  CS-0x04E  0x0200A         || 				 SUB R0, R1
(0074)  CS-0x04F  0x082A2         || 				 BREQ OUTPUT_IS_EQUAL_R0
(0075)  CS-0x050  0x0A300         || 				 BRCS REMAINDER_R0_LOOP
(0076)  CS-0x051  0x28201         || 				 ADD R2, 0x01
(0077)  CS-0x052  0x28301         || 				 ADD R3, 0x01
(0078)  CS-0x053  0x08270         || 				 BRN DIVIDE_R0_LOOP
(0079)                            || 				 
(0080)                     0x054  || OUTPUT_IS_EQUAL_R0:
(0081)  CS-0x054  0x28201         || 				 ADD R2, 0x01
(0082)  CS-0x055  0x28301         || 				 ADD R3, 0x01
(0083)  CS-0x056  0x04218         || 				 CMP R2, R3
(0084)  CS-0x057  0x082C2         || 				 BREQ REMAINDER_IS_EQUAL_R0
(0085)                            || 				
(0086)                            || 				 
(0087)                     0x058  || REMAINDER_IS_EQUAL_R0:
(0088)  CS-0x058  0x2C301         || 				 SUB R3, 0x01
(0089)  CS-0x059  0x0242A         || 				 SUB R4, R5
(0090)  CS-0x05A  0x30300         || 				 CMP R3, 0X00
(0091)  CS-0x05B  0x082C3         || 				 BRNE REMAINDER_IS_EQUAL_R0
(0092)  CS-0x05C  0x0846A         || 				 BREQ QUOTIENT_OUTPUT		
(0093)                            || 				 		 
(0094)                     0x05D  || REMAINDER_CHECKER_R0:
(0095)  CS-0x05D  0x2C201         || 				SUB R2, 0X01
(0096)  CS-0x05E  0x2C301         || 				SUB R3, 0x01
(0097)  CS-0x05F  0x08300         || 				BRN REMAINDER_R0_LOOP	
(0098)                            || 				
(0099)                     0x060  || REMAINDER_R0_LOOP:
(0100)  CS-0x060  0x2C301         || 				SUB R3, 0X01
(0101)  CS-0x061  0x0242A         || 				SUB R4, R5
(0102)  CS-0x062  0x30300         || 				CMP R3, 0x00
(0103)  CS-0x063  0x08303         || 				BRNE REMAINDER_R0_LOOP
(0104)  CS-0x064  0x0846A         || 				BREQ QUOTIENT_OUTPUT							 				 
(0105)                            || 				 
(0106)                     0x065  || DIVIDE_R1_LOOP:
(0107)  CS-0x065  0x02102         || 				 SUB R1, R0
(0108)  CS-0x066  0x0835A         || 				 BREQ OUTPUT_IS_EQUAL_R1
(0109)  CS-0x067  0x0A3C8         || 				 BRCS REMAINDER_R1_LOOP
(0110)  CS-0x068  0x28201         || 				 ADD R2, 0x01
(0111)  CS-0x069  0x28301         || 				 ADD R3, 0x01
(0112)  CS-0x06A  0x08328         || 				 BRN DIVIDE_R1_LOOP
(0113)                            || 				 
(0114)                     0x06B  || OUTPUT_IS_EQUAL_R1:
(0115)  CS-0x06B  0x28201         || 				 ADD R2, 0x01
(0116)  CS-0x06C  0x28301         || 				 ADD R3, 0x01
(0117)  CS-0x06D  0x04218         || 				 CMP R2, R3
(0118)  CS-0x06E  0x08382         || 				 BREQ REMAINDER_IS_EQUAL_R1
(0119)  CS-0x06F  0x08468         || 				 BRN QUOTIENT_OUTPUT				 
(0120)                            || 				 
(0121)                     0x070  || REMAINDER_IS_EQUAL_R1:
(0122)  CS-0x070  0x2C301         || 				 SUB R3, 0x01
(0123)  CS-0x071  0x02522         || 				 SUB R5, R4
(0124)  CS-0x072  0x30300         || 				 CMP R3, 0X00
(0125)  CS-0x073  0x08383         || 				 BRNE REMAINDER_IS_EQUAL_R1				 
(0126)  CS-0x074  0x04429         || 				 MOV R4, R5
(0127)  CS-0x075  0x0846A         || 				 BREQ QUOTIENT_OUTPUT
(0128)                            || 				 
(0129)                            || 
(0130)                     0x076  || REMAINDER_CHECKER_R1:
(0131)  CS-0x076  0x2C201         || 				SUB R2, 0X01
(0132)  CS-0x077  0x2C301         || 				SUB R3, 0x01
(0133)  CS-0x078  0x083C8         || 				BRN REMAINDER_R1_LOOP
(0134)                            || 				
(0135)                            || 				
(0136)                     0x079  || REMAINDER_R1_LOOP:
(0137)  CS-0x079  0x2C301         || 				SUB R3, 0X01
(0138)  CS-0x07A  0x02522         || 				SUB R5, R4
(0139)  CS-0x07B  0x30300         || 				CMP R3, 0x00
(0140)  CS-0x07C  0x083CB         || 				BRNE REMAINDER_R1_LOOP
(0141)  CS-0x07D  0x04429         || 				MOV R4, R5
(0142)  CS-0x07E  0x0846A         || 				BREQ QUOTIENT_OUTPUT
(0143)                            || 
(0144)                     0x07F  || EQUAL_VALUES:	
(0145)  CS-0x07F  0x04209         || 				MOV R2, R1
(0146)  CS-0x080  0x28201         || 				ADD R2, 0x01
(0147)  CS-0x081  0x0220A         || 				SUB R2, R1
(0148)  CS-0x082  0x0242A         || 				SUB R4, R5
(0149)  CS-0x083  0x08468         || 				BRN QUOTIENT_OUTPUT
(0150)                            || 				
(0151)                     0x084  || NUM_ZERO:
(0152)  CS-0x084  0x04201         || 				MOV R2, R0
(0153)  CS-0x085  0x04409         || 				MOV R4, R1
(0154)  CS-0x086  0x08468         || 				BRN QUOTIENT_OUTPUT
(0155)                            || 
(0156)                     0x087  || DEN_ZERO:
(0157)  CS-0x087  0x362FF         || 				MOV R2, 0xFF
(0158)  CS-0x088  0x364FF         || 				MOV R4, 0xFF
(0159)  CS-0x089  0x08468         || 			    BRN QUOTIENT_OUTPUT
(0160)                            || 				
(0161)                     0x08A  || NUM_DEN_ZERO:
(0162)                            || 
(0163)  CS-0x08A  0x362FF         || 				MOV R2, 0xFF
(0164)  CS-0x08B  0x364FF         || 				MOV R4, 0xFF
(0165)  CS-0x08C  0x08468         || 				BRN QUOTIENT_OUTPUT
(0166)                            || 				
(0167)                     0x08D  || QUOTIENT_OUTPUT:
(0168)  CS-0x08D  0x34242         || 				OUT R2, QUOTIENT
(0169)                            || 
(0170)                     0x08E  || REMAINDER_OUTPUT:	
(0171)  CS-0x08E  0x34443         || 				OUT R4, REMAINDER
(0172)                            || 
(0173)                            || 	 
(0174)                            || 	 
(0175)                            || 	 





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
DEN_ZERO       0x087   (0156)  ||  0064 
DIVIDE_R0_LOOP 0x04E   (0072)  ||  0070 0078 
DIVIDE_R1_LOOP 0x065   (0106)  ||  0069 0112 
EQUAL_VALUES   0x07F   (0144)  ||  0068 
MAIN           0x031   (0039)  ||  
MAIN1          0x03D   (0052)  ||  0048 0050 
MAIN2          0x049   (0065)  ||  0051 
NUM_DEN_ZERO   0x08A   (0161)  ||  0059 
NUM_ZERO       0x084   (0151)  ||  0062 
OUTPUT_IS_EQUAL_R0 0x054   (0080)  ||  0074 
OUTPUT_IS_EQUAL_R1 0x06B   (0114)  ||  0108 
QUOTIENT_OUTPUT 0x08D   (0167)  ||  0092 0104 0119 0127 0142 0149 0154 0159 0165 
REMAINDER_CHECKER_R0 0x05D   (0094)  ||  
REMAINDER_CHECKER_R1 0x076   (0130)  ||  
REMAINDER_IS_EQUAL_R0 0x058   (0087)  ||  0084 0091 
REMAINDER_IS_EQUAL_R1 0x070   (0121)  ||  0118 0125 
REMAINDER_OUTPUT 0x08E   (0170)  ||  
REMAINDER_R0_LOOP 0x060   (0099)  ||  0075 0097 0103 
REMAINDER_R1_LOOP 0x079   (0136)  ||  0109 0133 0140 


-- Directives: .BYTE
------------------------------------------------------------ 
--> No ".BYTE" directives used


-- Directives: .EQU
------------------------------------------------------------ 
INPUT_PORT     0x09A   (0017)  ||  0040 0041 
QUOTIENT       0x042   (0018)  ||  0168 
REMAINDER      0x043   (0019)  ||  0171 


-- Directives: .DEF
------------------------------------------------------------ 
--> No ".DEF" directives used


-- Directives: .DB
------------------------------------------------------------ 
--> No ".DB" directives used
