
ORG 0H
ACALL INLCD
MOV 30H,#2 ; MEMPERSHIP TYPE 
MOV 31H,#1 ;MEMPERSHIP DURATION
MOV 32H,#0
MOV 40H,#5 ;LIMIT # OF VIP MONTHLY
MOV 41H,#5 ;LIMIT # OF VIP YEARLY
MOV 42H,#30 ;LIMIT # OF ONLINE MONTHLY
MOV 43H,#30 ;LIMIT # OF ONLINE YEARLY
MOV 44H,#20 ;LIMIT # OF REGULAR MONTHLY
MOV 45H,#20 ;LIMIT # OF REGULAR YEARLY

ACALL CLEAR
ACALL WELCOME
ACALL CLEAR
acall mmenu
ACALL CLEAR


MOV A,30H
CJNE A,#1,ONLINE

VIP:
mov r5,#3
mov p1,#0ffh
fl:
setb p1.2
acall delay
clr p1.2
acall delay
djnz r5,fl
acall clear

ACALL vipmesg
MOV A,31H
CJNE A,#1,YEARLY

MONTHLY:
MOV R1,40H
DJNZ R1,NEXT
AJMP WRONG

NEXT:
CLR A
DEC 40H
MOV DPTR,#VIPM
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT

YEARLY:
CJNE A,#2,VIP
MOV R2,41H
DJNZ R2,NEXT2
AJMP WRONG 

NEXT2:
CLR A
DEC 41H
MOV DPTR,#VIPY
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT




ONLINE:
mov r5,#3
mov p1,#0ffh
fl1:
setb p1.3
acall delay
clr p1.3
acall delay
djnz r5,fl1
acall clear
MOV A,30H
CJNE A,#2,REGULAR
ACALL onlmesg
MOV A,31H
CJNE A,#1,YEARLY2

MONTHLY2:
MOV R1,42H
DJNZ R1,NEXT3
AJMP WRONG

NEXT3:
CLR A
DEC 42H
MOV DPTR,#ONM
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT

YEARLY2:
CJNE A,#2,ONLINE
MOV R2,43H
DJNZ R2,NEXT4
AJMP WRONG 

NEXT4:
CLR A
DEC 43H
MOV DPTR,#ONY
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT



REGULAR:
MOV A,30H
CJNE A,#3,WRONG
mov r5,#3
mov p1,#0ffh
fl2:
setb p1.4
acall delay
clr p1.4
acall delay
djnz r5,fl2
acall clear
ACALL regmesg
MOV A,31H
CJNE A,#1,YEARLY3

MONTHLY3:
MOV R1,44H
DJNZ R1,NEXT5
SJMP WRONG

NEXT5:
CLR A
DEC 44H
MOV DPTR,#REGM
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT

YEARLY3:
CJNE A,#2,REGULAR
MOV R2,45H
DJNZ R2,NEXT6
SJMP WRONG 

NEXT6:
CLR A
DEC 45H
MOV DPTR,#REGY
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT

WRONG:
SJMP $


OUT:
acall payment
again: sjmp again

 
;;;;procures 
welcome:
mov a, #80H 
acall cmd
mov dptr, #wel
acall wstr

mov a,#0c0h
acall cmd
mov dptr, #gym
acall wstr
acall delay
ret

mmenu:
mov a, #80H ;  
acall cmd
mov dptr, #sel
acall wstr

mov a,#0c0h
acall cmd
mov dptr, #op
acall wstr
acall delay
ret


vipmesg:
mov a, #80H 
acall cmd
mov dptr, #VIPP
acall wstr
acall delay

acall clear 
acall menu2

acall clear 
acall dura

ret

onlmesg:
mov a, #80H
acall cmd
mov dptr, #VIPP
acall wstr
acall delay
acall clear 
acall menu2

acall clear 
acall dura
ret

regmesg:
mov a, #80H 
acall cmd
mov dptr, #VIPP
acall wstr
acall delay
acall clear 
acall menu2

acall clear 
acall dura
ret

menu2:
mov a, #80H 
acall cmd
mov dptr, #sel
acall wstr

mov a,#0c0h
acall cmd
mov dptr, #op2
acall wstr
acall delay
RET

dura:
mov a, #80H 
acall cmd
mov dptr, #dur
acall wstr

mov a,#0c0h
acall cmd
mov a,31h
add a,#30h
acall wchr
acall delay

ret

payment:
mov a, #80H 
acall cmd
mov dptr, #pay
acall wstr

mov a,#0c0h
acall cmd
mov a,32h
mov b,#0Ah
div ab
add a,#30h
acall wchr
mov a,b
add a,#30h
acall wchr
acall delay

ret


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



VIPM: DB 35
VIPY: DB 99
ONM: DB 5
ONY: DB 30
REGM: DB 10
REGY: DB 70


wel: db "welome...."
db 0
gym : db "gym system.."
db 0
sel: db "select option"
db 0
op: db "vip  onl  reg"
db 0
vipP: db " you chose vip"
db 0
onl: db " you chose online"
db 0
reg: db " you chose reg"
db 0
op2: db " 1.month 2.year"
db 0
dur: db " enter duration"
db 0
pay: db " you need 2 pay"
db 0

END
