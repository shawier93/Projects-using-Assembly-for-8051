; Personal details removed.
ORG 0H
ACALL INLCD

MOV a, #80H 
ACALL cmd
mov dptr, #STR
acall wstr
acall delay
acall delay

MOV a, #80H 
ACALL cmd
mov dptr, #NAME
acall wstr
acall delay
acall delay

mov a,#0c0h
acall cmd
mov dptr, #ID
acall wstr
acall delay
acall delay

;;;;;;;;;;;;;;;;;;;;;;MENU;;;;
MENU:
; LCD SHOW MENU
ACALL CLEAR
ACALL DELAY
	MOV A, #80H 
ACALL cmd
mov dptr, #CHOSE
acall wstr
acall delay
acall delay

MOV A, #80H 
ACALL cmd
mov dptr, #MODE1
acall wstr
acall delay
acall delay

mov A,#0c0h
acall cmd
mov dptr, #MODE2
acall wstr
acall delay
acall delay


;;|||||||||||||||START|||||||
;|||||||||||||||||||||||||||||||||||
MOV R7,#4
CJNE R7,#1, LOOP2
LOOP1:

MOV R1,#90
MOV A,R1 ;A=90
ADD A,#1 ;A=91
ADD A,R1 ; A=91+90
MOV B,#2
DIV AB
MOV 70H,A

;
; DISPLAY MESSGAE 
ACALL CLEAR
ACALL DELAY
MOV A, #80H 
ACALL cmd
mov dptr, #AVGMSG
acall wstr
acall delay
acall delay
mov A,#0c0h
acall cmd

acall delay
acall delay

MOV A,70H
MOV B,#10 
DIV AB
ADD A,#30H
acall WCHR
MOV A,B
ADD A,#30H
acall WCHR
ACALL DELAY

AJMP FINISH

LOOP2:
CJNE R7,#2,LOOP3
ACALL CLEAR
ACALL DELAY
MOV A, #80H 
ACALL cmd
mov dptr, #YOUCHOSE
acall wstr
acall delay
acall delay
mov A,#0c0h
acall cmd
mov dptr, #ZZ
acall wstr
acall delay
acall delay

MOV R1,#31H ;R1=30H
MOV R5,#8
MOV 20H,#0 ; COUNTER ZEROS
CLR A
MOV A,R1 ;A=30H
X8: ; COUNTING NUMBER OF ZEROS
RRC A ; EVERY VALUE INSIDE C
JNC ZEROS
DJNZ R5,X8 ;CHECKING NEXT NO.
AJMP MENU



ZEROS:
INC 20H
DJNZ R5,X8


;; MESSGA LCD
ACALL CLEAR
ACALL DELAY
MOV A, #80H 
ACALL cmd
mov dptr, #ZZMSG
acall wstr
acall delay
acall delay
mov A,#0c0h
acall cmd

acall delay
acall delay

MOV A,20H
ADD A,#30H
acall WCHR
ACALL DELAY
AA: SJMP AA
SJMP FINISH

LOOP3:
CJNE A,#3,ERROR
SJMP FINISH

ERROR:
SETB P1.6
ACALL DELAY
CLR P1.6
ACALL DELAY
SETB P1.6
ACALL DELAY
CLR P1.6
ACALL DELAY
SETB P1.6
ACALL DELAY
CLR P1.6
ACALL DELAY


FINISH: SJMP FINISH




DELAY:
MOV R1,#100
he2: MOV R0,#100
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


STR: db "welome...."
db 0
NAME : db "8051 DEMO        "
db 0
ID: db "8051 DEMO     "
db 0
CHOSE: db "CHOSE MODE:"
db 0
MODE1: db "1-DECIML AVERAGE"
db 0
MODE2: db "2-HEADECML ZEROS"
db 0
YOUCHOSE: db " you chose:"
db 0
AVG: db " AVG MODE"
db 0
ZZ: db " ZERO MODE"
db 0
AVGMSG: db " AVERAGE IS:"
db 0
ZZMSG: db " ZEROS ="
db 0
END
