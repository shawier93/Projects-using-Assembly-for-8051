; Personal details removed.
; Personal details removed.
;ADD TWO DES NUMBERS
; Displaying a line of characters
EN EQU P0.2
RS EQU P0.0
RW EQU P0.1
 ORG 0H
START:
 ACALL INLCD ; Initialize LCD
 
 MOV R1,#0FH
 MOV R2,#0FH
 MOV A,#80H;COMMAND TO MOVE CURSER TO POSITION 1 IN LINE 1
 ACALL CMD ;WRITING A COMAND 
 MOV DPTR,#STR1
 ACALL WSTR 
 ;3+4=7
 MOV A ,#0C0H ;GO TO LINE 2
 ACALL CMD
;DO  THE CALCULATION
MOV A,R1
ACALL CONVERT
ACALL WCHR
MOV A,#'+'
ACALL WCHR
MOV A,R2
ACALL CONVERT
ACALL WCHR
MOV A,#'='
ACALL WCHR
;PRINT THE RESULD
MOV A,R1
ADD A,R2
MOV B,#16
DIV AB ; A HAS 10S AND B HAS ONES
ACALL CONVERT ;TO DISPLAY THE 10S
ACALL WCHR
MOV A,B ; ;TO DISPLAY THE ONES
ACALL CONVERT ;TO DISPLAY THE 10S
ACALL WCHR



STOP: AJMP $
	;------------------CONVERT HEX NUMBER TO ASCI
	CONVERT:
	CJNE A,#0,NEXT1
	ADD A,#30H
		AJMP BACK
	NEXT1:
	CJNE A,#1,NEXT2
	ADD A,#30H
		AJMP BACK
	NEXT2:
	CJNE A,#2,NEXT3
	ADD A,#30H
		AJMP BACK
	NEXT3:
	CJNE A,#3,NEXT4
	ADD A,#30H
		AJMP BACK
		NEXT4:
	CJNE A,#4,NEXT5
	ADD A,#30H
		AJMP BACK
		NEXT5:
	CJNE A,#5,NEXT6
	ADD A,#30H
		AJMP BACK
		NEXT6:
	CJNE A,#6,NEXT7
	ADD A,#30H
		AJMP BACK
		NEXT7:
	CJNE A,#7,NEXT8
	ADD A,#30H
		AJMP BACK
		NEXT8:
	CJNE A,#8,NEXT9
	ADD A,#30H
		AJMP BACK
		NEXT9:
	CJNE A,#9,NEXTCHAR
	ADD A,#30H
	AJMP BACK
	NEXTCHAR:
	ADD A,#37H
	BACK:
	RET
;-- LCD Initialization Procedure starts here -----
INLCD:
 PUSH 7
 MOV R7,#20
WAIT:
 ACALL LDELAY ; Step 1
 DJNZ R7,WAIT

 MOV P0,#00000111B ; Initialise 3 control signals=1
 MOV A,#0011B ; Step 2
 ACALL CMD
 ACALL LDELAY ; Step 3
 MOV A,#0011B ; Step 4
 ACALL CMD
 MOV A,#0011B ; Step 5
 ACALL CMD
 MOV A,#0010B ; Step 6
 ACALL CMD
 MOV A,#0010B ; Step 7 – send high nibble
 ACALL CMD
 MOV A,#1000B ; send low nibble
 ACALL CMD
 MOV A,#0000B ; Step 8 – Turn off display – send high nibble
 ACALL CMD
 MOV A,#1000B ; send low nibble
 ACALL CMD
 MOV A,#0 ; Step 9 - Clear Display – send high nibble
 ACALL CMD
 MOV A,#0001B ; send low nibble
 ACALL CMD
 ACALL LDELAY ; 4.1 msec required for this command
 MOV A,#0000B ; Step 10 - Set cursor Move RIGHT- send high nibble
 ACALL CMD
 MOV A,#0110B ; send low nibble
 ACALL CMD
 MOV A,#0000B ; Step 11 –send high nibble
 ACALL CMD ; Turn ON Display, Cursor ON, Blink Cursor
 MOV A,#1111B ; send low nibble
 ACALL CMD

 POP 7
 RET
;--- End of LCD initialization -----
;---- Subroutine to write COMMAND in A to the LCD -------
CMD:
 PUSH ACC
 PUSH B
 CLR RS ; RS = 0 command write
MOV B,A

 SWAP A ; Move higher nibble to lower nibble
 ACALL COMMON ; write operation
 MOV A,B
ACALL COMMON

 POP B
 POP ACC
 RET
;---- Subroutine to write character in A to the LCD -------
WCHR:
 PUSH ACC
 PUSH B
 SETB RS ; RS = 1 data write
 MOV B,A

 SWAP A ; Move higher nibble to lower nibble
 ACALL COMMON ; write operation
MOV A,B
 ACALL COMMON

 POP B
 POP ACC
 RET
;----- Common operation for CHAR write and COMMAND write
COMMON:
 CLR RW
 SWAP A ; Move Lower nibble to higher nibble
 ANL A,#11110000B
 ANL P0,#00000111B
 ORL P0,A
 SETB EN
 CLR EN
 ACALL LDELAY
 RET
;---- Subroutine to write A STRING character by character -------
WSTR:
 PUSH ACC
CONT1:
 CLR A
 MOVC A,@A+DPTR ; move character to A
 JZ EXIT1
 ACALL WCHR ; call procedure to write a CHAR
 INC DPTR ; get next character
 AJMP CONT1 ; go to CONT1
EXIT1:
 POP ACC ; restore A
 RET
 ;------------ ˜ 5.4msec DELAY -------------------------------------------
LDELAY:
PUSH 0
PUSH 1 ; save register1.
MOV R1,#20 ; move 12 to register R1
CON4:
MOV R0,#250
DJNZ R0,$
DJNZ R1,CON4 ; decrease R1, if R1 !=0, go to CON4
POP 1
POP 0
RET
STR1: DB 'ADDING TWO NUMBERS', 0 ; message to be displayed.
END
