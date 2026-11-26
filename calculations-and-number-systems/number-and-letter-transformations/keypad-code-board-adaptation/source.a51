; Personal details removed.
; Personal details removed.
; Personal details removed.

LDATA EQU P0
EN EQU P0.2
RS EQU P0.0
RW EQU P0.1
ORG 0H
Ljmp Main
ORG 03H
LJMP START
ORG 30h

MAIN:
;;;;;;;;;;Welcome message
LCALL INLCD ; Initialize LCD
MOV DPTR,#Welcome
LCALL WSTR
mov r5,#2
again:lcall delay
djnz r5,again
MOV IE,#10000001B
SETB IT0


START:

MENU:
LCALL INLCD
MOV DPTR,#ONE
LCALL WSTR
mov r5,#2
again3:lcall delay
djnz r5,again3
mov a,#0CH
acall cmd
mov a,#0h
acall cmd
acall ldelay
MOV DPTR,#ONE_
LCALL WSTR
mov r5,#3
again4:lcall delay
djnz r5,again4
LCALL INLCD
MOV DPTR,#TWO
LCALL WSTR
mov r5,#2
again5:lcall delay
djnz r5,again5
mov a,#0CH
acall cmd
mov a,#0h
acall cmd
acall ldelay
MOV DPTR,#TWOL
LCALL WSTR
mov r5,#3
again6:lcall delay
djnz r5,again6
LCALL INLCD
MOV DPTR,#TWOD
LCALL WSTR
mov r5,#2
again7:lcall delay
djnz r5,again7
LCALL INLCD
MOV DPTR,#EXITT
LCALL WSTR
mov r5,#2
again8:lcall delay
djnz r5,again8
LCALL INLCD
MOV DPTR,#ENTERSEL
LCALL WSTR
mov r5,#2
again9:lcall delay
djnz r5,again9

; MENU SELECTION
mov a,#1

;----------------------
ACALL KEYPAD
ACALL WCHR
SUBB A,#30H

;----------------OP2----------
;OPTION2 START HERE
OPTION2X:
cjne a,#2,exit
LCALL INLCD
MOV DPTR,#ENTERL
LCALL WSTR
mov r5,#2
again6779:lcall delay
djnz r5,again6779

;letter
ACALL KEYPAD
ACALL WCHR
mov r7,a ; r7 = 'C'


MOV A,#0CH
ACALL CMD
MOV A,#0H
ACALL CMD
ACALL LDELAY
MOV DPTR,#ENTERD
LCALL WSTR
mov r5,#2
again67579:lcall delay
djnz r5,again67579

;number
ACALL KEYPAD
ACALL WCHR
SUBB A,#30H
ADD A,#1
MOV 78H,A

mov r1,a
mov r0,#70h ;location
mov a,r7 ; a = 'C'
x:
mov @r0,a
inc r0
djnz r1,x
ACALL INLCD
MOV DPTR,#SECRET
LCALL WSTR
mov r5,#2
again67879:lcall delay
djnz r5,again67879
MOV A,#0CH
ACALL CMD
MOV A,#0H
ACALL CMD
ACALL LDELAY

CODEX:
MOV A,R7
ACALL WCHR
mov r5,#2
again8454:lcall delay
djnz r5,again8454
DJNZ 78H,CODEX
LJMP EXITORMENU

;--------OP3-------

exit:
cjne a,#3,OPTION1
LCALL INLCD
MOV DPTR,#THANKYOU
LCALL WSTR
mov r5,#2
again16:lcall delay
djnz r5,again16
S:SJMP S
LJMP endofcode



OPTION1: ;CODE WITH DIGITS
;message enter 1st digit IN Phase 2
LCALL INLCD


MOV DPTR,#ENTERC
LCALL WSTR
mov r5,#3
again10:lcall delay
djnz r5,again10
MOV A,#0CH
LCALL CMD
MOV A,#2H
LCALL CMD

ACALL KEYPAD
ACALL WCHR
SUBB A,#30H

M:
; convert first digit to hundred
mov b,#100
mul ab
mov r5,a
mov r6,b

T:
ACALL KEYPAD
ACALL WCHR
SUBB A,#30H

mov b,#10
mul ab
add a,r5
mov r5,a
jc more
sjmp O
more:
inc r6

O:
ACALL KEYPAD
ACALL WCHR
SUBB A,#30H

add a,r5
mov r5,a

jc more2
sjmp nextstep


more2:
inc r6

nextstep:
ACALL ENTERED_NUMER
jb acc.0,ODDX
EVENX:
MOV A,R5
subb a,#2
mov r5,a
mov r0,#3

;Display the result in LCD in phase 2
LCALL PRINTOP2
LCALL INLCD
MOV DPTR,#EVENN
LCALL WSTR
mov r4,#3
again1923:lcall delay
djnz r4,again1923


flashing:
mov p3,#0
acall delay
mov p3,#0ffh
acall delay
djnz r0,flashing
LCALL exitORmenu

ODDX:
MOV A,R5
add a,#2
mov r5,a
mov r0,#2
;Display the result in LCD in phase 2
LCALL PRINTOP2
LCALL INLCD
MOV DPTR,#ODDD
LCALL WSTR


flashing2:
mov p3,#0
acall delay
mov p3,#0ffh
acall delay
djnz r0,flashing2
LCALL exitORmenu

;Used to ask the user if he want to exit
;or go back to amin menu
exitORmenu:
LCALL INLCD
MOV DPTR,#EXIT_MEN
LCALL WSTR
mov r5,#3
again17:lcall delay
djnz r5,again17
MOV A,#0CH
LCALL CMD
MOV A,#0H
LCALL CMD
LCALL LDELAY
MOV DPTR,#EXIT_MENU
LCALL WSTR
mov r5,#3
again18:lcall delay
djnz r5,again18

ACALL KEYPAD
ACALL WCHR
SUBB A,#30H

CJNE A,#0,EXITTT
AJMP MENU

EXITTT: LJMP EXIT

ret


;---------------------------

PRINTOP2:
LCALL INLCD
MOV DPTR,#SECRET
LCALL WSTR

MOV A,r5
MOV B,#100
DIV AB
ADD A,#30H
MOV 32h,A ; HUNDERED
MOV A,B
MOV B,#10
DIV AB
ADD A,#30H
MOV 33H,A  ; TENS
MOV A,B
ADD A,#30H
MOV 34H,A  ; UNITS

MOV A,#0CH
LCALL CMD
MOV A,#1H
LCALL CMD
MOV A,32H
LCALL WCHR
MOV A,#0CH
LCALL CMD
MOV A,#2H
LCALL CMD
LCALL LDELAY
MOV A,33H
LCALL WCHR
MOV A,#0CH
LCALL CMD
MOV A,#3H
LCALL CMD
MOV A,34H
LCALL WCHR
LCALL DELAY
LCALL DELAY
LCALL DELAY


RET

ENTERED_NUMER:

MOV A,r5
MOV B,#100
DIV AB
MOV 32h,A ; HUNDERED
MOV A,B
MOV B,#10
DIV AB
MOV 33H,A  ; TENS
MOV A,B
MOV 34H,A  ; UNITS


; THE SECRET NUMBER IS:
MOV A,34H
MOV B,#100
MUL AB
MOV 77H,A
MOV B,#10
MOV A,33H
MUL AB
ADD A,77H
ADD A,32H
MOV 77H,A
MOV R5,A


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
CLR RS ; RS = 0command write
ACALL COMMON
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
;------------ DELAY -------------------------------------------
LDELAY:
PUSH 0
PUSH 1 
MOV R1,#20 
CON4:
MOV R0,#250
DJNZ R0,$
DJNZ R1,CON4 
POP 1
POP 0
RET
DELAY:
PUSH 5
PUSH 4
PUSH 3
MOV R5,#20
X36: MOV R4,#200
X26: MOV R3,#250
X16: DJNZ R3,X16
DJNZ R4,X26
DJNZ R5,X36
POP 3
POP 4
POP 5
RET
TMSEC:
MOV TMOD,#00000001B
MOV TL0,#0CAH
MOV TH0,#27H
SETB TR0
BACK: JNB TF0,BACK
CLR TR0
CLR TF0
RET


KEYPAD:
	MOV P2,#11110000B 		;make bits P2.4-P2.7 input (columns)

K1: MOV P2,#11110000B   		;ground all rows
	MOV A,P2				;read all col. (ensure all keys open)
	ANL A,#11110000B   		;masked unused bits
	CJNE A,#11110000B,K1 		;check till all keys released

K2:	ACALL TMSEC       
	MOV A,P2				;see if any key is pressed
	ANL A,#11110000B			;mask unused bits
	CJNE A,#11110000B,OVER   	;key pressed, await closure
	SJMP K2				;check if key pressed

OVER: 
	ACALL TMSEC
	MOV A,P2				;check key closure
	ANL A,#11110000B			;mask unused bits
	CJNE A,#11110000B,OVER1  	;key pressed, find row
	SJMP K2				;if none keep polling

OVER1: 
	MOV P2,#11111110B		;ground row 0
	MOV A,P2				;read all columns
	ANL A,#11110000B			;mask unused bits
	CJNE A,#11110000B,ROW_0  	;key row 0, find the col.

	MOV P2,#11111101B		;ground row 1
	MOV A,P2				;read all columns
	ANL A,#11110000B			;mask unused bits 
	CJNE A,#11110000B,ROW_1  	;key row 1, find the col.

	MOV P2,#11111011B		;ground row 2
	MOV A,P2				;read all columns
	ANL A,#11110000B       		;mask unused bits
	CJNE A,#11110000B,ROW_2	;key row 2, find the col.

	MOV P2,#11110111B        		;ground row 3
	MOV A,P2				;read all columns
	ANL A,#11110000B			;mask unused bits
	CJNE A,#11110000B,ROW_3  	;key row 3, find the col.

	LJMP K2				;if none, false input, repeat

ROW_0: MOV DPTR,#KCODE0		;set DPTR=start of row 0        
	SJMP FIND				;find col. key belongs to

ROW_1: MOV DPTR,#KCODE1		;set DPTR=start of row 1
	SJMP FIND				;find col. key belongs to

ROW_2: MOV DPTR,#KCODE2		;set DPTR=start of row 2 
	SJMP FIND				;find col. key belongs to

ROW_3: MOV DPTR,#KCODE3		;set DPTR=start of row 3

FIND:  
	SWAP A				;exchange low and high nibble				

FIND1:
	RRC A					;see if any CY bit low
	JNC MATCH				;if zero, get the ASCII code       
	INC DPTR                 			;point to next col. address
	SJMP FIND1               		;keep searching

MATCH: 
	CLR A                    			;set A=0 (match is found)
	MOVC A,@A+DPTR           		;get ASCII code from table
	RET


KCODE0: DB '1','2','3','A' 		;Row0 ASCII codes
KCODE1:	DB '4','5','6','B' 		;Row1
KCODE2:	DB '7','8','9','C' 		;Row2
KCODE3:	DB '*','0','#','D' 		;Row3
	

;WELCOME MESSAGE
WELCOME: DB 'WELCOME',0
;DESCRIPTION
SECRETCODE: DB 'Secret Code',0
;MENU
ONE: DB '1-Enter the code',0
ONE_: DB 'using digits',0
TWO: DB '2-Enter the code',0
TWOL: DB 'using one letter',0
TWOD: DB 'and one digit',0
EXITT: DB '3-EXIT',0
ENTERSEL: DB 'enter selection',0
;OPTION1
ENTERC: DB 'Enter your code',0
;OPTION2
ENTERL: DB 'Enter Letter',0
ENTERD: DB 'Enter  Digit',0
SECRET: DB 'The secret code:',0
EVENN: DB ' EVEN ',0
ODDD: DB ' ODD ',0
EXIT_MEN: DB 'ENTER 1 TO EXIT',0
EXIT_MENU: DB 'OR 0 TO MENU',0
THANKYOU: DB 'Thank you',0
endofcode: RETI
org 500h
n: db 9,9,9
n2: db 'C',4

END
