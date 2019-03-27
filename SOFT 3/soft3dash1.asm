
.EQU IN_DATA = 0x9A
.EQU OUT_DATA = 0x42

.CSEG
.ORG 0x30				; initialize the counter to 0x01

MOV R2, 0x00 			; initialize the multiply counter 

IN R0, IN_DATA;		
MOV R1, R0

AND R0, 0x0F;			; using bit masking with AND instruction, I was able to isolate the upper and lower bits 
AND R1, 0xF0;

ROL R1					; using the LSR instruction will rotate the upper 4 bits to the right side
ROL R1					; and will therefore be in the lower 4 bits as the divided lower 4 bits.
ROL R1
ROL R1;


multiply_combinations:

CMP R2, R1
BREQ Output
ADD R3, R0;
ADD R2, 0x01;
BRN multiply_combinations

Output:

OUT R3, OUT_DATA;

