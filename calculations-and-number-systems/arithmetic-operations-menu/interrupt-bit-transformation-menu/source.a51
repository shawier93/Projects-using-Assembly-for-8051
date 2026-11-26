; Personal details removed.

LDATA EQU P0
EN EQU P0.2
RS EQU P0.0
RW EQU P0.1
R BIT P1.3


	ORG 0000H
	LJMP  MAIN
	
	ORG  0003H				; EX0 interrupt vector address   
	LJMP  EX0ISR
	
	
	ORG 0030H
MAIN:  
	MOV 	TMOD,#00010001B		; Timer 0 & Timer1 are used in Mode 1
	MOV  	IE,#10000001B	            ; Enable EX0 and Timer 1 interrupts
    SETB   IT0                                          ;Make EX0 edge-triggered interrupt
	ACALL INLCD
	MOV DPTR,#A16
	ACALL WSTR
	ACALL TIME                                   ;Start Timer 1
	SJMP	$                                             ; Wait in an infinite loop
; *************** MAIN routine ends here ************************
EX0ISR:
ACALL INLCD

MOV DPTR,#A1
ACALL WSTR
ACALL TIME

MOV A,#0c0H
ACALL CMD 
ACALL TIME

MOV DPTR,#A2
ACALL WSTR
ACALL TIME



MENU:
MOV A,#1
ACALL CMD
ACALL TIME

MOV DPTR,#A3
ACALL WSTR
ACALL TIME

MOV A,#0c0H
ACALL CMD 
ACALL TIME

MOV DPTR,#A4
ACALL WSTR
ACALL TIME

MOV A,#1
ACALL CMD 
ACALL TIME

MOV DPTR,#A5
ACALL WSTR
ACALL TIME

MOV A,#0c0H
ACALL CMD
ACALL TIME

MOV DPTR,#A6
ACALL WSTR
ACALL TIME

MOV A,#1
ACALL CMD 
ACALL TIME

MOV DPTR,#A7
ACALL WSTR
ACALL TIME

MOV A,#0c0H
ACALL CMD 
ACALL TIME

MOV DPTR,#A8
ACALL WSTR
ACALL TIME

MOV A,#1
ACALL CMD 
ACALL TIME

MOV DPTR,#A9
ACALL WSTR
ACALL TIME

////////////////////////////////////////////////////////////////////////////////////////////////////////////
ACALL KEYPAD
ACALL WCHR
ACALL TIME
;MOV A,#'A'   ; SELECTION 



ADDITION:
CJNE A,#'A',BIN
ACALL ADDOP
AJMP EXIT

BIN:
CJNE A,#'B',COMP
ACALL BINR
AJMP EXIT

COMP:
CJNE A,#'C',DUP
ACALL COMPLEMENT
AJMP EXIT

DUP:
CJNE A,#'D',EXIT
ACALL DUPLICATE
AJMP EXIT

EXIT:
MOV A,#1
ACALL CMD 
ACALL TIME

MOV DPTR,#A11
ACALL WSTR
ACALL TIME
AJMP OUT

///////////OP1
ADDOP:
MOV A,#1
ACALL CMD
ACALL TIME

MOV DPTR,#A10
ACALL WSTR
ACALL TIME


ACALL KEYPAD
ACALL WCHR
ACALL LDELAY
ACALL CHECK
CLR C
SUBB A,#30H
MOV B,#10
MUL AB
MOV R1,A

ACALL KEYPAD
ACALL WCHR
ACALL LDELAY
ACALL CHECK
CLR C
SUBB A,#30H

ADD A,R1
MOV R2,A      ; R2 NUMBER 1 XY

MOV A,#' '
ACALL WCHR


ACALL KEYPAD
ACALL WCHR
ACALL LDELAY
ACALL CHECK
CLR C
SUBB A,#30H
MOV B,#10
MUL AB
MOV R1,A

ACALL KEYPAD
ACALL WCHR
ACALL LDELAY
ACALL CHECK
CLR C
SUBB A,#30H

ADD A,R1
MOV R3,A      ; R3 NUMBER 2 XY

MOV A,#1
ACALL CMD
ACALL TIME
MOV A,#80H
ACALL CMD 
ACALL TIME

MOV DPTR,#A12
ACALL WSTR
ACALL TIME

MOV A,#0c0H
ACALL CMD 
ACALL TIME 

MOV A,R2
ADD A,R3     ; NUM1 + NUM2


MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
ACALL LDELAY
MOV A,B
ADD A,#30H
ACALL WCHR	
ACALL LDELAY
ACALL TIME
ACALL TIME

RETI


CHECK:
CJNE A,#'#',C1
AJMP ERRORA
C1:CJNE A,#'*',C2
AJMP ERRORA
C2:CJNE A,#'A',C3
AJMP ERRORA
C3:CJNE A,#'B',C4
AJMP ERRORA
C4:CJNE A,#'C',C5
AJMP ERRORA
C5:CJNE A,#'D',C6
AJMP ERRORA
C6:RET

ERRORA:
ACALL RLED
AJMP ADDOP

///////////////END OF OP1

///////////////OP2
BINR:
MOV A,#1
ACALL CMD 
ACALL TIME

MOV DPTR,#A10
ACALL WSTR
ACALL TIME

;MOV A,#55H     ; OUR NUMBER
;MOV R1,A

ACALL KEYPAD   
ACALL WCHR
ACALL TIME
ACALL BINCHECK
CLR C
SUBB A,#30H
SWAP A
MOV R1,A         

ACALL KEYPAD    
ACALL WCHR
ACALL TIME
ACALL BINCHECK
CLR C
SUBB A,#30H

ADD A,R1       
MOV R1,A      ; R1 NUMBER 1 XY
MOV 70H,R1

MOV A,#'H'
ACALL WCHR
ACALL TIME


MOV A,#0c0H
ACALL CMD 
ACALL TIME

MOV DPTR,#A13
ACALL WSTR
ACALL TIME


MOV A,70H      ;R1
MOV R1,70H

MOV R7,#8

LOOP:
MOV A,R1
RLC A
MOV R1,A
JC ONEX
ZEROX:
MOV A,#'0'
ACALL WCHR
ACALL TIME
SJMP OUTNOWX
ONEX:
MOV A,#'1'
ACALL WCHR
ACALL TIME
OUTNOWX:
DJNZ R7,LOOP
MOV A,#'B'
ACALL WCHR
ACALL TIME 
ACALL TIME
RETI



BINCHECK:
CJNE A,#'#',M1
AJMP ERRORB
M1:CJNE A,#'*',M2
AJMP ERRORB
M2:CJNE A,#'A',M3
MOV A,#0AH
ADD A,#30H
RET
M3:CJNE A,#'B',M4
MOV A,#0BH
ADD A,#30H
RET
M4:CJNE A,#'C',M5
MOV A,#0CH
ADD A,#30H
RET
M5:CJNE A,#'D',M6
MOV A,#0DH
ADD A,#30H
RET
M6:
RET

ERRORB:
ACALL RLED
AJMP BINR

////////////////////////OP3
COMPLEMENT:
MOV A,#1
ACALL CMD 
ACALL TIME

MOV DPTR,#A10
ACALL WSTR
ACALL TIME

MOV R1,#0

ACALL KEYPAD
ACALL WCHR
ACALL LDELAY
ACALL ROTATE

ACALL KEYPAD
ACALL WCHR
ACALL LDELAY
ACALL ROTATE

ACALL KEYPAD
ACALL WCHR
ACALL LDELAY
ACALL ROTATE

ACALL KEYPAD
ACALL WCHR
ACALL LDELAY
ACALL ROTATE

ACALL KEYPAD
ACALL WCHR
ACALL LDELAY
ACALL ROTATE

ACALL KEYPAD
ACALL WCHR
ACALL LDELAY
ACALL ROTATE

ACALL KEYPAD
ACALL WCHR
ACALL LDELAY
ACALL ROTATE

ACALL KEYPAD
ACALL WCHR
ACALL LDELAY
ACALL ROTATE

MOV A,R1
CPL A
MOV R1,A

MOV A,#0c0H
ACALL CMD 
ACALL TIME

MOV DPTR,#A14
ACALL WSTR
ACALL TIME

MOV R7,#8

LOOPX:
MOV A,R1
RLC A
MOV R1,A
JC ONE
ZERO:
MOV A,#'0'
ACALL WCHR
ACALL TIME 
SJMP OUTNOW
ONE:
MOV A,#'1'
ACALL WCHR
ACALL TIME
OUTNOW:
DJNZ R7,LOOPX
MOV A,#'B'
ACALL WCHR
ACALL TIME 
ACALL TIME
RETI
///////////////////////

ROTATE:
CJNE A,#'0',NEXTCHECK
CLR C
MOV A,R1
RLC A
MOV R1,A
SJMP OUTY
NEXTCHECK:
CJNE A,#'1',ERRORX
SETB C 
MOV A,R1
RLC A
MOV R1,A
OUTY:
RET

ERRORX:
ACALL RLED
AJMP COMPLEMENT


/////////////////////OP4
DUPLICATE:
MOV A,#1
ACALL CMD 
ACALL TIME

MOV DPTR,#A10
ACALL WSTR
ACALL TIME

;MOV A,#5      ; OUR NUMBER


ACALL KEYPAD
ACALL WCHR
ACALL CHECK2
CLR C
SUBB A,#30H
MOV R1,A


MOV A,#0c0H
ACALL CMD 
ACALL TIME

MOV DPTR,#A15
ACALL WSTR
ACALL TIME

MOV A,R1
MOV B,A
ADD A,B

MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
ACALL LDELAY
MOV A,B
ADD A,#30H
ACALL WCHR	
ACALL LDELAY
ACALL TIME
ACALL TIME
RETI


CHECK2:
CJNE A,#'#',F1
AJMP ERRORD
F1:CJNE A,#'*',F2
AJMP ERRORD
F2:CJNE A,#'A',F3
AJMP ERRORD
F3:CJNE A,#'B',F4
AJMP ERRORD
F4:CJNE A,#'C',F5
AJMP ERRORD
F5:CJNE A,#'D',F6
AJMP ERRORD
F6:RET

ERRORD:
ACALL RLED
AJMP DUPLICATE
/////////////////////////





TIME:   ; 1 SEC                                       
MOV R6,#130
T:   ;10 mSEC
MOV TMOD,#21H ; set timer 0 as timer MOD 1
MOV TL0,#0EEH ; Timer0, low byte
MOV TH0,#0B7H ; Timer0, high byte
SETB TR0 ; Start timer0
BACK:
JNB TF0,BACK ; Check timer overflow flag
CLR TR0 ; Stop timer0
CLR TF0 ; Clear timer-0 overflow flag TF0
DJNZ R6,T
RET

RLED:
MOV R7,#3
RLOOP:
CLR R
ACALL TIME
SETB R
ACALL TIME
DJNZ R7,RLOOP
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





OUT: SJMP OUT	

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

; 30 msec delay
TMSEC:	
	MOV   TMOD,#00000001B   
	MOV   TL0,#0CAH         		; Timer0, 30msec delay
	MOV   TH0,#27H    	
	SETB  TR0      		
BACK32: 
	JNB   	TF0,BACK32    	
	CLR   	TR0         	
	CLR   	TF0        	
	RET   

	
	RETI

	


KCODE0: DB '1','2','3','A' 		;Row0 ASCII codes
KCODE1:	DB '4','5','6','B' 		;Row1
KCODE2:	DB '7','8','9','C' 		;Row2
KCODE3:	DB '*','0','#','D' 		;Row3
	
A1: DB "WELCOME TO Arithmetic ",0
A2: DB "Operations system",0
A3: DB "Select: ",0
A4: DB "A. ADDITION",0
A5: DB "B.Binary representation.",0
A6: DB "C. Complement.",0
A7: DB "D. Duplicate.",0
A8: DB "Exit program.",0
A9: DB "YOU CHOOSE: ",0
A10: DB "YOUR NUMBER: ",0
A11: DB "Thank you",0
A12: DB "THE ADDITION IS ",0
A13: DB "BIN IS ",0	
A14: DB "COMP IS ",0
A15: DB "DUP IS ",0
A16:DB "press interrupt button ",0

END
