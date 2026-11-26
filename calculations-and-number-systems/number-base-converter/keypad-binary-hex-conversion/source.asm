; Personal details removed.
; Personal details removed.
;Phase 2
ORG 0H

MAIN:
	ACALL INLCD ;Initialize LCD


;-------------------------------------------
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
ACALL TMSEC
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

	MOV A, #1H ;Command for Clear LCD
	ACALL CMD
    ACALL TMSEC
	MOV A,#80H 
	ACALL CMD
	MOV DPTR, #ENTER 
	ACALL WSTR 
	MOV A,#0C0H ;2nd line command
	ACALL CMD
	MOV DPTR, #CHOICE 
	ACALL WSTR ;Display a string
ACALL KEYPAD
MOV R5,A
	ACALL WCHR ;write a character on LCD
	ACALL DELAY_1SEC
;----Check the the type of conversion

CJNE R5, #'1', HEXADECIMAL
;Binary to decimal conversion
	MOV A, #1H ;Command for Clear LCD
	ACALL CMD
ACALL TMSEC
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
ACALL DISPLAY
	SJMP STOP
HEXADECIMAL:
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
ACALL DISPLAY
STOP: SJMP $
;---------------------------------------------------

BinToDec:
mov R2,#8 ;LOOP COUNTER
MOV R0,#0 ;initialize sum to zero
MOV R1,#128 ;initialize power 2^7
MOV DPTR,#Binary

LOOP:
CLR A
ACALL KEYPAD
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
DJNZ R2,LOOP
RET

HexToDec:
ACALL KEYPAD
ACALL WCHR
CLR C
SUBB A,#30H
MOV B,#16
MUL AB  		
MOV R0,A
ACALL KEYPAD
ACALL WCHR
CLR C
SUBB A,#30H ;CONVERT ASCII TO DECIMAL
ADD A,R0
ACALL DELAY_1SEC
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

DISPLAY:
	MOV A, #1H ; Clear LCD
	ACALL CMD
ACALL TMSEC
MOV DPTR ,#DISPLAY_MSG
ACALL WSTR
MOV A,40H
CJNE A,#'0',FIRSTZERO
MOV A, 41H
CJNE A,#'0',SECONDZERO
SJMP THIRDDIGIT

FIRSTZERO:
ACALL WCHR
MOV A,41H
ACALL WCHR
SJMP THIRDDIGIT

SECONDZERO:
ACALL WCHR


THIRDDIGIT:
MOV A,42H
ACALL WCHR ;DISPLAY 3RD DIGIT

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

;----KEYPAD PROCEDURE-----

KEYPAD:
 MOV P0,#01110000B ;make bits P0.4-P0.6 input
K1: MOV P0,#01110000B
 MOV A,P0 ;read all col. (ensure all keys open)
 ANL A,#01110000B ;masked unused bits
 CJNE A,#01110000B,K1 ;check til all keys released
K2:
 MOV A,P0 ;see if any key is pressed
 ANL A,#01110000B ;mask unused bits
CJNE A,#01110000B,OVER1 ;key pressed, await closure
 SJMP K2 ;check if key pressed
OVER1:
 MOV P0,#01111110B ;ground row 0
 MOV A,P0 ;read all columns
 ANL A,#01110000B ;mask unused bits
 CJNE A,#01110000B,ROW_0 ;key row 0, find the col.
 MOV P0,#01111101B ;ground row 1
 MOV A,P0 ;read all columns
 ANL A,#01110000B ;mask unused bits
 CJNE A,#01110000B,ROW_1 ;keyrow 1, find the col.
 MOV P0,#01111011B ;ground row 2
 MOV A,P0 ;read all columns
 ANL A,#01110000B ;mask unused bits
 CJNE A,#01110000B,ROW_2 ;key row 2, find the col.
 MOV P0,#01110111B ;ground row 3
 MOV A,P0 ;read all columns
 ANL A,#01110000B ;mask unused bits
 CJNE A,#01110000B,ROW_3 ;keyrow 3, find the col.
 LJMP K2 ;if none, false input, repeat
ROW_0: MOV DPTR,#KCODE0 ;set DPTR=start of row 0
 SJMP FIND ;find col. key belongs to
ROW_1: MOV DPTR,#KCODE1 ;set DPTR=start of row 1
 SJMP FIND ;find col. key belongs to
ROW_2: MOV DPTR,#KCODE2 ;set DPTR=start of row 2
 SJMP FIND ;find col. key belongs to
ROW_3: MOV DPTR,#KCODE3 ;set DPTR=start of row 3
FIND:
 RLC A ;skip D7 data (unused)
FIND1:
 RLC A ;see if any CY bit low
 JNC MATCH ;if zero, get the key number
 INC DPTR ;point to next col. address
 SJMP FIND1 ;keep searching
MATCH: CLR A ;set A=0 (match is found)
 MOVC A,@A+DPTR ;get key number from table
 RET

;ASCII LOOK-UP TABLE FOR EACH ROW
KCODE3: DB '1','2','3' ;Row0 ASCII codes
KCODE2: DB '4','5','6' ;Row1
KCODE1: DB '7','8','9' ;Row2
KCODE0: DB '*','0','#' ;Row3

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
DISPLAY_MSG: DB "RESULT: "
DB 0

END
