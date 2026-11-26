; Personal details removed.
; Personal details removed.
;Phase 1
ORG 0H
MAIN:
	MOV 50H, #'1' ;the type of conversion
	;Reset The decimal number RAM locations 40H - 42H
	MOV 40H, #'0'
	MOV 41H, #'0'
	MOV 42H, #'0'
	MOV A, 50H ;Get the type of conversion from RAM location 50H
;Check the the type of conversion
	CJNE A, #'1', HEXADECIMAL
;Binary to decimal conversion
	ACALL BinToDec
	MOV A, R0
	ACALL Converter
	SJMP STOP
HEXADECIMAL:
	CJNE A, #'2', STOP
;Hexadecimal to decimal conversion
	ACALL HexToDec
	ACALL Converter ;Store the decimal number to RAM
STOP: SJMP $

BinToDec:
mov R2,#8 ;LOOP COUNTER
MOV R0,#0 ;initialize sum to zero
MOV R1,#128 ;initialize power 2^7
MOV DPTR,#Binary

LOOP:
CLR A
MOVC A,@A+DPTR ;READ 1 BITE FROM ROM
CLR C
SUBB A,#30H ;CONVERT ASCII CODE TO BINARY DIGIT
MOV B,R1
MUL AB ;MULTIPLY THE POWER
ADD A,R0
MOV R0,A
MOV A,R1
MOV B,#2
DIV AB
MOV R1,A
INC DPTR
DJNZ R2,LOOP
RET

HexToDec:
MOV DPTR,#HEX
CLR A
MOVC A,@A+DPTR
CLR C
SUBB A,#30H
MOV B,#16
MUL AB  		
MOV R0,A
INC DPTR
CLR A
 MOVC A,@A+DPTR
CLR C
SUBB A,#30H ;CONVERT ASCII TO DECIMAL
ADD A,R0
RET

Converter:
	;100's digit
	MOV B, #100
	DIV AB
	ADD A, #30H ;Convert from normal value to ASCII 
	MOV 40H, A ;Store the 100's digit to RAM location 40H
	;10's digit
	MOV A, B
	MOV B, #10
	DIV AB
	ADD A, #30H ;Convert from normal value to ASCII 
	MOV 41H, A ;Store the 10's digit to RAM location 41H
	;1's digit
	MOV A, B
	ADD A, #30H ;Convert from normal value to ASCII 
	MOV 42H, A ;Store the 1's digit to RAM location 42H
	RET
	
;ROM Data
Binary: DB "10101011"
HEX: DB "85"

END
