; Personal details removed.
; Personal details removed.
ORG 0
acall inlcd
;INITIALIZE SCORE, FAILS AND QUESTION COUNTER
	MOV	34H,#1		;QUESTION COUNTER=1
	MOV	35H,#0		;SCORE=0
	MOV	36H,#0		;FAILS=0
ACALL WELCOME
	MOV	DPTR,#QS
    MOV R2,#0
AGAIN:
   	MOV	DPTR,#QS
	CLR	A
    ADD A,R2
	MOVC A,@A+DPTR	;OPERATION
	MOV	R1,A
	INC	DPTR
    
	CLR	A
    ADD A,R2
	MOVC A,@A+DPTR	;NUMBER 1
	MOV	R3,A
	INC	DPTR
	CLR	A
    ADD A,R2
	MOVC A,@A+DPTR	;NUMBER 2
	MOV	R4,A
	INC	DPTR
	CLR	A
    ADD A,R2
	MOVC A,@A+DPTR	;CORRECT ANSWER
	MOV	R5,A
	INC	DPTR
	CLR	A
	ADD A,R2
	MOVC A,@A+DPTR	;SCORE
	INC	DPTR
	MOV	R6,A

    MOV A,R2
	ADD A,#5
	MOV R2,A
    
MOV 77H,R1
USER:

ACALL QUESTION
MOV R1,77H
	CJNE R1,#'+',NPL
;ADDITION PART
;READ USER ANSWER
	MOV	37H,#7
ACALL ANS
	MOV	30H,R5
	MOV	A,30H
	MOV	B,37H
	CJNE A,B,WRONG
   	MOV	A,35H
	ADD	A,R6
	MOV	35H,A
	INC	34H
 ACALL RIGHT
  	SJMP AGAIN

NPL:
	CJNE R1,#'-',NMS
;SUBTRACTION PART
;READ USER ANSWER

	MOV	37H,#4
ACALL ANS
	MOV	31H,R5
	MOV	A,31H
	MOV	B,37H
	CJNE A,B,WRONG
	MOV	A,35H
	ADD	A,R6
	MOV	35H,A
	INC	34H
 ;  ACALL RIGHT
	SJMP AGAIN


NMS:
	CJNE R1,#'*',DVS
;MULTIPLICATION PART
;READ USER ANSWER
	MOV	37H,#12
ACALL ANS

	MOV	32H,R5
	MOV	A,32H
	MOV	B,37H
	CJNE A,B,WRONG
	MOV	A,35H
	ADD	A,R6
	MOV	35H,A
	INC	34H
;ACALL RIGHT
	SJMP AGAIN


DVS:
;DIVISION PART
;READ USER ANSWER
	MOV	37H,#6
ACALL ANS

	MOV	33H,R5
	MOV	A,33H
	MOV	B,37H
	CJNE A,B,WRONG
	MOV	A,35H
	ADD	A,R6
	MOV	35H,A
;ACALL RIGHT
	SJMP STOP

WRONG:
ACALL WRONGG
	INC	36H
	DEC	35H
	SJMP USER


STOP:
ACALL SCORE
ACALL BYE
	SJMP $
;%%%%%%%%%%
;%%%%%%%%%%
welcome:
mov a, #80H 
acall cmd
mov dptr, #str1
acall wstr

mov a,#0c0h
acall cmd
mov dptr, #str2
acall wstr
acall delay
ret

question:
ACALL DELAY
ACALL CLEAR
mov a, #80H ;  
acall cmd
mov A,R3
MOV B,#10
DIV AB
ADD A,#30H
Acall WCHR
MOV A,B
ADD A,#30H
Acall WCHR


MOV R1,77H
mov A,R1
Acall WCHR
mov A,R4
ADD A,#30H
Acall WCHR
ret

ANS:
mov a,#0c0h
ACALL CMD
mov A,37H
MOV B,#10
DIV AB
ADD A,#30H
Acall WCHR
MOV A,B
ADD A,#30H
Acall WCHR
acall delay
RET

WRONGG:
mov a,#0C0h
acall cmd
mov dptr, #WRONGGG
acall wstr
acall delay
ret

right:

ACALL CLEAR
ACALL DELAY
mov a, #80H 
acall cmd
mov dptr, #correctt
acall wstr
mov a,#0c0h
acall cmd
mov dptr, #scoree
acall wstr
mov A,35H
ADD A,#30H
Acall WCHR
ACALL DELAY
ACALL CLEAR
ACALL DELAY
ret

SCORE:
mov a, #80H 
acall cmd
mov dptr, #SCOREE
acall wstr
mov A,35H
MOV B,#10
DIV AB
ADD A,#30H
Acall WCHR
MOV A,B
ADD A,#30H
Acall WCHR

acall delay
mov a,#0c0h
acall cmd
mov dptr, #FAIL
acall wstr
mov A,36H
ADD A,#30H
Acall WCHR
ACALL DELAY
ret

BYE:
ACALL CLEAR 
ACALL DELAY
mov a, #80H 
acall cmd
mov dptr, #OVERR
acall wstr

mov a,#0c0h
acall cmd
mov dptr, #THANKS
acall wstr
acall delay
RET
;---------------
;---------------
DELAY:
MOV R1,#100
he2: MOV R0,#10
he:DJNZ R0,he
djnz r1,he2
RET
;;;;;;

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

COMMON:
 ANL a,#11110000B
 ANL P1, #00001111B
 ORL P1,A
 SETB P1.2
 CLR P1.2
 RET

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

LDELAY:
MOV R0, #50
DJNZ R0, $
RET

clear:
MOV A,#01H
ACALL CMD
MOV R7,#14
WAIT: ACALL LDELAY
DJNZ R7,WAIT
ret 

WSTR: 
        PUSH    ACC             
CONT1:   
       CLR     A               
       MOVC    A,@A+DPTR   ; move character to A 
       JZ Exit1  
PRINT:
        ACALL    WCHR     ; call procedure to write a CHAR 
        INC DPTR          ; get next character        
       AJMP    CONT1      ; go to CONT1  
EXIT1: POP     ACC        ; restore A 
        RET


QS:	DB	'+',5,2,7,1
	DB	'-',5,1,4,2
	DB	'*',2,6,12,3
	DB	'/',12,2,6,4

str1: db "Kuniv Math Tester"
db 0
str2: db "are you ready"
db 0
OP1: db "1.PERRIN 2.Nth num"
db 0
OP2: db "3.QUIT"
db 0
MSG: db "SELECT UR CAT: "
db 0
MSG1: db "you chose PERRIN"
db 0
MSG2: db "you chose Nth num"
db 0
WRONGGG: db "WRONG! TRY AGAIN"
db 0
CORRECTT: db "CORRECT! "
db 0
SCOREE: db "YOUR SCORE:  "
db 0
FAIL: db "FIALS: "
db 0
OVERR: db "GAME IS OVER "
db 0
THANKS: db "THENAK YOU  "
db 0
	END






















 
