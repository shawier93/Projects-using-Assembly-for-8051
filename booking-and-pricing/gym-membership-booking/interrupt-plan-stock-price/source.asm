
ORG 0H
SJMP MAIN

ORG 0003H ;EXTERNAL 0 INTERRUPT VECTOR
AGAINn: ACALL KEYPAD
CJNE A,#'#',AGAINn
RETI

ORG 030H
MAIN:
ACALL INLCD
MOV IE,#81H; 10000001
SETB IT0
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
ACALL INITIATE_INT

MENUU:
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
AJMP NOTAVAILABLE

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
AJMP NOTAVAILABLE

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
AJMP NOTAVAILABLE

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
SJMP NOTAVAILABLE

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
SJMP NOTAVAILABLE

NEXT6:
CLR A
DEC 45H
MOV DPTR,#REGY
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT

WRONG:
ACALL WRRONG
AJMP MENUU

NOTAVAILABLE:
ACALL NOTAV
AJMP MENUU
SJMP $


OUT:
acall payment

ACALL REPEAT

leave:
ACALL DELAY
ACALL CLEAR 
ACALL DELAY
mov a, #80H 
acall cmd
mov dptr, #BYE
acall wstr
again: sjmp again

 
;;;;procures 
INITIATE_INT:
CALL DELAY
ACALL CLEAR 
ACALL DELAY
mov a, #80H 
acall cmd
mov dptr, #PRESS
acall wstr

CLR P3.6 ; clear ADC WR line
SETB P3.6
RET

REPEAT:
ACALL DELAY
ACALL CLEAR 
ACALL DELAY
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #op3
acall wstr
mov a,#0c0h
acall cmd
mov dptr, #op4
acall wstr
ACALL DELAY
ACALL KEYPAD
CJNE A,#'1,CHE2
LJMP MENUU

CHE2:
CJNE A,#'2',CHE3
LJMP LEAVE
SJMP BACK
CHE3: 
ACALL WRRONG
SJMP REPEAT

BACK:
RET


WRRONG:
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #WRONGG
acall wstr
ACALL DELAY
ACALL DELAY
RET

NOTAV:
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #NOTA
acall wstr
mov a, #0C0H ;  1st line position 3
acall cmd
mov dptr, #NOTA1
acall wstr
ACALL DELAY
ACALL DELAY
RET

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

mov a, #80H ;  
acall cmd
mov dptr, #SPACE
acall wstr

mov a, #80H ;  
acall cmd
ACALL KEYPAD
MOV 35H,A
ACALL WCHR
ACALL DELAY
ACALL DELAY
MOV A,35H
SUBB A,#30H
MOV 30H,A
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
mov dptr, #onl
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
mov dptr, #reg
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

mov a, #80H ;  
acall cmd
mov dptr, #SPACE
acall wstr

mov a, #80H ;  
acall cmd
ACALL KEYPAD
MOV 35H,A
ACALL WCHR
ACALL DELAY
ACALL DELAY
MOV A,35H
SUBB A,#30H
MOV 31H,A


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

;KEYPAD KEYPAD KEYPAD

;.............KEYPAD............
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
;-----------------------
;ASCII LOOK-UP TABLE FOR EACH ROW
KCODE3: DB '1','2','3' ;Row0 ASCII codes
KCODE2: DB '4','5','6' ;Row1
KCODE1: DB '7','8','9' ;Row2
KCODE0: DB '*','0','#' ;Row3


VIPM: DB 35
VIPY: DB 99
ONM: DB 5
ONY: DB 30
REGM: DB 10
REGY: DB 70


wel: db "..welcome to my.."
db 0
gym : db "Gym System .."
db 0
sel: db "select option"
db 0
op: db "1:vip 2:onl 3:reg"
db 0
vipP: db " you chose vip"
db 0
onl: db " you chose online"
db 0
reg: db " you chose reg"
db 0
op2: db " 1.month 2.year"
db 0
dur: db "Selected Duration :"
db 0
pay: db " you need 2 pay  "
db 0
SPACE: db "               	"
db 0
wrongg: db "wrong entery..."
Db 0
PRESS:DB "PREE # TO CONTINUE:"
DB 0 
NOTA:DB "NOT AVAILABLE"
DB 0 
NOTA1:DB "TRY ANOTHER CAT"
DB 0 
Op3: db "1-again?"
Db 0
op4: db "2-no tahnks"
Db 0
BYE:DB "THANKS :) :) :)"
DB 0 


END
