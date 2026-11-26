; Personal details removed.
; Personal details removed.
;Phase 2
ORG 0H
MAIN:
	ACALL INLCD ;Initialize LCD

	;Display FIRST Message on LCD
    MOV A,#80H ;position for 1st cursor at the begining of the first line
    ACALL CMD

	MOV DPTR, #WELCOME1 ;display message
	ACALL WSTR 
	MOV A,#0C0H ;position cursor for 2nd line command	
    ACALL CMD

	;Display SECOND Message on LCD
	MOV DPTR, #WELCOME2 
	ACALL WSTR 
	ACALL DELAY_1SEC 
;---------display menu------------
	MOV A, #1H ; Clear LCD
	ACALL CMD
    ACALL TMSEC ;delay for clrear LCD command
	MOV A,#80H 
	ACALL CMD
	MOV DPTR, #MSG1 
	ACALL WSTR
	MOV A,#0C0H 
	ACALL CMD
	MOV DPTR, #MSG2 
	ACALL WSTR
	ACALL DELAY_1SEC

;asks the user to select the type of conversion

   ;asks the user to select the type of conversion
	MOV A, #1H ;Command for Clear LCD
	ACALL CMD
	ACALL TMSEC ;delay for clrear LCD command
	MOV A,#80H 
	ACALL CMD
	MOV DPTR, #ENTER 
	ACALL WSTR 
	MOV A,#0C0H ;2nd line command
	ACALL CMD
	MOV DPTR, #CHOICE 
	ACALL WSTR ;Display a string
MOV 50H,#'2'
	MOV A, 50H ;Get the type of conversion from RAM location 50H
	MOV R5, A
	ACALL WCHR ;write a character on LCD
	ACALL DELAY_1SEC
;----Check the the type of conversion
 MOV R5,50H
CJNE R5, #'1', HEXADECIMAL
;Binary to decimal conversion
	MOV A, #1H ;Command for Clear LCD
	ACALL CMD
	MOV A,#80H ;1st line command
	ACALL CMD
	MOV DPTR, #ENTER1 
	ACALL WSTR ;Display a string
	MOV A,#0C0H ;2nd line command
	ACALL CMD
	MOV DPTR, #NUMBER_MSG 
	ACALL WSTR ;Display a string
	ACALL BinToDec
	MOV A, R0
	ACALL Converter
	SJMP STOP
;HEXADECIMAL:
	CJNE R5, #'2', STOP
;Hexadecimal to decimal conversion
	MOV A, #1H ;Command for Clear LCD
	ACALL CMD
	ACALL TMSEC ;delay for clrear LCD command
	MOV A,#80H ;1st line command
	ACALL CMD
	MOV DPTR, #ENTER2 
	ACALL WSTR ;Display a string
	MOV A,#0C0H ;2nd line command
	ACALL CMD
	MOV DPTR, #NUMBER_MSG 
	ACALL WSTR ;Display a string
	ACALL HexToDec
	ACALL Converter ;Store the decimal number to RAM
STOP: SJMP $
;---------------------------------------------------
MOV 50H, #'2' ;the type of conversion
	;Reset The decimal number RAM locations 40H - 42H
	MOV 40H, #'0'
	MOV 41H, #'0'
	MOV 42H, #'0'
	MOV A, 50H ;Get the type of conversion from RAM location 50H
;Check the the type of conversion
	CJNE A, #'2', HEXADECIMAL
;Binary to decimal conversion
	ACALL BinToDec
	MOV A, R0
	ACALL Converter
	SJMP STOP
HEXADECIMAL:
	CJNE A, #'1', STOP
;Hexadecimal to decimal conversion
	ACALL HexToDec
	ACALL Converter ;Store the decimal number to RAM

BinToDec:
mov R2,#8 ;LOOP COUNTER
MOV R0,#0 ;initialize sum to zero
MOV R1,#128 ;initialize power 2^7
MOV DPTR,#Binary

LOOP:
CLR A
MOVC A,@A+DPTR ;READ 1 BITE FROM ROM
ACALL WCHR
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
ACALL WCHR
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

;---- Subroutine to write A STRING character by character ------- 
WSTR:
	PUSH ACC
CONT1:
	CLR A
	MOVC A,@A+DPTR ; move character to A
	JZ Exit1
PRINT:
	ACALL WCHR ; call procedure to write a CHAR
	INC DPTR ; get next character 
	AJMP CONT1 ; go to CONT1
EXIT1: POP ACC ; restore A
	RET 

;- Subroutine to write character in A to the LCD-----
WCHR:
	PUSH ACC
	PUSH B
	SETB P1.3
	MOV B,A
	ACALL COMMON
	ACALL LDELAY
	MOV A,B
	SWAP A
	ACALL COMMON
	ACALL LDELAY
	POP B
	POP ACC
	RET
;--Subroutine to write COMMAND in A to the LCD----
CMD:
	CLR P1.3
	MOV B,A
	ACALL COMMON
	ACALL LDELAY
	MOV A,B
	SWAP A
	ACALL COMMON
	ACALL LDELAY
	RET
;---Common operation for CHAR write and COMMAND write
COMMON:
	ANL a,#11110000B
	ANL P1, #00001111B
	ORL P1,A
	SETB P1.2
	CLR P1.2
	RET
; ------- procedure init_display -------
INLCD:
	CLR P1.3
	CLR P1.7
	CLR P1.6
	SETB P1.5
	CLR P1.4
	SETB P1.2
	CLR P1.2
	ACALL LDELAY
	SETB P1.2
	CLR P1.2
	SETB P1.7
	CLR P1.6
	CLR P1.5
	CLR P1.4
	SETB P1.2
	CLR P1.2
	ACALL LDELAY
	CLR P1.7
	CLR P1.6
	CLR P1.5
	CLR P1.4
	SETB P1.2
	CLR P1.2
	SETB P1.7
	SETB P1.6
	SETB P1.5
	SETB P1.4
	SETB P1.2
	CLR P1.2
	ACALL LDELAY
	CLR P1.7
	CLR P1.6
	CLR P1.5
	CLR P1.4
	SETB P1.2
	CLR P1.2
	SETB P1.6
	SETB P1.5
	SETB P1.2
	CLR P1.2
	ACALL LDELAY
	RET
; ------- procedure delay -------
LDELAY:
	MOV R3, #50
	DJNZ R3, $
	RET

;DELAY TIME USING TIMER (50 msec)
TMSEC:
	MOV TMOD,#01H ; set timer 0 as timer in mode 1
	MOV TL0,#0B0H ; Timer0, low byte
	MOV TH0,#3CH ; Timer0, high byte
	SETB TR0 ; Start timer0
BACK:
	JNB TF0,BACK ; Check timer overflow flag
	CLR TR0 ; Stop timer0
	CLR TF0 ; Clear timer-0 overflow flag TF0
RET

;----DELAY PROCEDURE------
DELAY_1SEC:
	PUSH 07H
	MOV R7, #20 
LOOP2:
	ACALL TMSEC
	DJNZ R7, LOOP2
	POP 07H
	RET	

;ROM Data
Binary: DB "10101011"
HEX: DB "85"
;LCD messages
WELCOME1: DB "Welcome to" 
DB 0
WELCOME2: DB "base converter" 
DB 0
MSG1: DB "1.BIN to decimal" 
DB 0
MSG2: DB "2.HEX to decimal" 
DB 0
ENTER: DB "Enter your " 
DB 0
CHOICE: DB "choice: " 
DB 0
ENTER1:DB "Enter Binary" 
DB 0
ENTER2:DB "Enter HEX" 
DB 0
NUMBER_MSG:DB "Number: " 
DB 0

END
