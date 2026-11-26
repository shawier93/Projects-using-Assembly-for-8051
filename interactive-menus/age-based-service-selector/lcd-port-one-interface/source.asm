ORG 00H
MOV 30H,#2 ; OPTION SELECTION
MOV 31H,#2 ;AGE 
MOV 32H,#2; MALE OR FEMALE >40
MOV 33H,#1; RETURN OR EXIT
MOV 35H,#00 ; INDICATE WHICH OPTION

ACALL FLASHING

ACALL INLCD
; WELCOME MESSAGE
ACALL CLEAR
mov a, #80H 
acall cmd
mov dptr, #STR1
acall WSTR
ACALL DELAY
ACALL DELAY
mov a, #0C0H 
acall cmd
mov dptr, #STR2
acall WSTR
ACALL DELAY
ACALL DELAY

START:	
ACALL MENU
MOV A,30H

CJNE A,#1,COVIDCHEACK
ACALL AGE
ACALL CECKUP
SJMP ASK

COVIDCHEACK:
CJNE A,#2,EXIT
ACALL AGE
ACALL COVID
SJMP ASK

ASK:
ACALL RETURN
MOV A,33H
CJNE A,#1,EXIT
AJMP START
EXIT:
SJMP EXIT

;--------produres-------
FLASHING:
MOV R3,#6
HERE:
CPL P1.0
ACALL DELAY
DJNZ R3,HERE


RET



;-----
CECKUP:
MOV A,31H
; DIVIDE THE AGE BY 10
MOV B,#10
DIV AB
; IF result <2 LEVEL 1 ( 10-19)
; IF results <4 LEVEL 2 ( 20-39)
; IF results =0 LEVEL 3 ( 40 -99)
; 
CJNE A,#2,NEXT1
NEXT1:
JNC LEVEL2 ; IF >=2
;ESLE RESULT<2 SO, LEVEL1
MOV 35H,#1
ACALL SHOW1
SJMP EE

LEVEL2:
CJNE A,#4,NEXT2
NEXT2:
JNC LEVEL3 ; IF >=4
;ESLE RESULT<2 SO, LEVEL1
MOV 35H,#2
ACALL SHOW2
SJMP EE

LEVEL3:
MOV A,32H
CJNE A,#1,FEMALE
MOV 35H,#3
ACALL SHOW3
SJMP EE

FEMALE:
MOV 35H,#4
ACALL SHOW4
SJMP EE

EE:
RET
;--------PRODURE 2------
COVID:
MOV A,31H  ; AGE

CJNE A,#5,NEXT
NEXT:
JNC OKAY ; IF >=5
;ESLE REMIDER<5 SO, NO
MOV 35H,#5
ACALL SHOW6
SJMP EEE

OKAY:
MOV 35H,#6
ACALL SHOW5
EEE:
RET
;-------PROCDURE 3-----
MENU:
ACALL CLEAR
mov a, #80H 
acall cmd
mov dptr, #STR3
acall WSTR
ACALL DELAY

mov a, #0c0H ;  
acall cmd
mov dptr, #STR4
acall WSTR
ACALL DELAY
ACALL DELAY
RET

;------PRODURE 4----
AGE:
ACALL CLEAR
mov a, #80H 
acall cmd
mov dptr, #STR5
acall WSTR
ACALL DELAY
ACALL DELAY

MOV A,31H
MOV B,#10
DIV AB
ADD A,#30H
acall WCHR
MOV A,B
ADD A,#30H
acall WCHR
ACALL DELAY
ACALL DELAY
RET
;---------------------
SHOW1:
ACALL CLEAR
mov a, #80H 
acall cmd
mov dptr, #STR6
acall WSTR
ACALL DELAY
ACALL DELAY
ACALL CLEAR
mov a, #80H ;  
acall cmd
ACALL CLEAR
mov dptr, #STR7
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR8
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
mov dptr, #STR9
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR10
acall WSTR
ACALL DELAY
ACALL DELAY

RET
;--------
SHOW2:
ACALL CLEAR
mov a, #80H 
acall cmd
mov dptr, #STR6
acall WSTR
ACALL DELAY
ACALL DELAY
ACALL CLEAR
mov a, #80H ;  
acall cmd
ACALL CLEAR
mov dptr, #STR7
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR10
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov dptr, #STR11
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
mov dptr, #STR9
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR10
acall WSTR
ACALL DELAY
ACALL DELAY
RET
;--------
SHOW3:
ACALL CLEAR
mov a, #80H 
acall cmd
mov dptr, #STR6
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
ACALL CLEAR
mov dptr, #STR7
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR10
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov dptr, #STR11
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
mov dptr, #STR9
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR10
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
mov dptr, #STR12
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR8
acall WSTR
ACALL DELAY
ACALL DELAY
RET
;--------
SHOW4:
ACALL CLEAR
mov a, #80H 
acall cmd
mov dptr, #STR6
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
ACALL CLEAR
mov dptr, #STR7
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR10
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov dptr, #STR11
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
mov dptr, #STR9
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR10
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
mov dptr, #STR13
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR8
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
mov dptr, #STR12
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR8
acall WSTR
ACALL DELAY
ACALL DELAY
RET
RET
;--------
RETURN:
ACALL CLEAR
mov a, #80H ;  
acall cmd
ACALL CLEAR
mov dptr, #STR14
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR15
acall WSTR
ACALL DELAY
ACALL DELAY
RET


;--------------
SHOW5:
ACALL CLEAR
mov a, #80H ;  
acall cmd
ACALL CLEAR
mov dptr, #STR16
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR18
acall WSTR
ACALL DELAY
ACALL DELAY
RET


;--------------
SHOW6:
ACALL CLEAR
mov a, #80H ;  
acall cmd
ACALL CLEAR
mov dptr, #STR17
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR18
acall WSTR
ACALL DELAY
ACALL DELAY
RET


;--------------
;**********************
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
;*********************************
DELAY:
MOV R0,#20
AGAIN: MOV R1,#90
AGAIN2: DJNZ R1,AGAIN2
DJNZ R0,AGAIN
RET

STR1: db "WELCOME"
Db 0
STR2: db "HEALTH SYSTEM"
Db 0
STR3: db "1-CHECK 2-VACC"
Db 0
STR4: db "3-EXIT "
db 0
STR5: db "YOUR AGE: "
Db 0
STR6: db "Eat Well&Exercise"
Db 0
STR7: db "Do blood test"
Db 0
STR8: db "every year"
Db 0
STR9: db "Check teeth "
Db 0
STR10: db "every 6 months"
Db 0
STR11: db "check vit D"
Db 0
STR12: db "do colon Xray"
Db 0
STR13: db "do mammorgram"
Db 0
STR14: db "1- MAIN MENU"
Db 0
STR15: db "2-EXIT"
Db 0
STR16: db "YOU CAN TAKE"
Db 0
STR17: db "YOU CANNOT TAKE"
Db 0
STR18: db "Covid 19 vaccine"
Db 0

END




