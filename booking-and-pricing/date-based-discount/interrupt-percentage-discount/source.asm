
ORG 000H
SJMP MAIN


ORG 0003H ;EXTERNAL 0 INTERRUPT VECTOR

AGAIN: ACALL KEYPAD
CJNE A,#'#',AGAIN
RETI

ORG 030H
MAIN:
MOV IE,#81H;
SETB IT0
ACALL INLCD 
MOV P1,#00  ; OUTPUT
MOV R3,#21 ; AMOUNT OF MONEY 
MOV R4,#19 ; DAYS  
MOV R5,#0 ; DISCOUNT PERCENTAGE  0,1,2,10 /10
MOV R0,#0
MOV R1,#0
MOV R2,#0
MOV R7,#0

MOV 20H,#0FBH
LCALL FLASH

; amount messgae
acall display0
acall delay
ACALL RUN_INT

MAIN1:
ACALL displayy


main2:
acall delay
acall clear
acall delay
acall display1

; data message
acall clear
acall display2

MAINMENUE:
; FLASH PIN 6 FOR MAIN MENU INDICATOR 
MOV 20H,#07FH  ; 01111111
LCALL FLASH   ; FF

MOV A,R4
SUBB A,#1
mov R4,A
acall clear
acall display3 ; LATE DAYS
;Ss:SJMP Ss

MOV A,R4
CJNE A,#0H,CASE2;
; flash pin 5
MOV 20H,#0BFH
LCALL FLASH
acall clear
acall display4  ; NO LATE
MOV R5,#0H
AJMP CALC

CASE2: 
CJNE A,#10, CASE3
CASE3:
JNC CASE4 ;  A>=10 ELSE CONTINE
; LESS THAN 9
MOV 20H,#0eFH ; flash pin 4
LCALL FLASH
acall clear
acall display5  ; 10% DISCOUNT
MOV R5,#1
AJMP CALC

CASE4:  CJNE A,#20, CASE5
CASE5:
JNC CASE6 ;  A>=20 ELSE CONTINE
; LESS THAN 19
MOV 20H,#0f7H ; flash pin 4
LCALL FLASH

acall clear
acall display6  ; 20% DISCOUNT

MOV R5,#2
AJMP CALC

CASE6:
MOV 20H,#00FH ; flash pin 7,6,5,4
acall clear
acall display8  ; 100% DISCOUNT
MOV R5,#10
AJMP CALC

;\\\ calcuate the amount
CALC:
MOV B,R5;
MOV A,R3
MUL AB
mov 50h,a
MOV B,#10
DIV AB
MOV R5,A ; DISCOUNT AMOUNT
MOV A,R3
SUBB A,R5
MOV R6,A
acall clear
acall display7

ACALL CHECK


leave: 
ACALL CLEAR 
ACALL DELAY
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #BYE
acall wstr

hh:SJMP hh
;;\\\\\\ my functions my functions;
;\\\\\\\\ my functions my functions;
flash:
MOV P1,20H
ACALL DELAY 
MOV P1,#0FFH
ACALL DELAY 
MOV P1,20H
ACALL DELAY 
MOV P1,#0FFH
ACALL DELAY 
MOV P1,20H
ACALL DELAY 
MOV P1,#0FFH
ACALL DELAY 
RET

DELAY:
MOV R0,#250
L2: MOV R1,#10
L: DJNZ R1,L
DJNZ R0,L2
RET



RUN_INT:
ACALL DELAY
ACALL CLEAR 
ACALL DELAY
mov a, #80H 
acall cmd
mov dptr, #PRESS
acall wstr

CLR P3.6 ; clear ADC WR line
SETB P3.6


RET

CHECK:
ACALL DELAY
ACALL CLEAR 
ACALL DELAY
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #OP3
acall wstr
mov a,#0c0h
acall cmd
mov dptr, #OP4
acall wstr
ACALL DELAY
ACALL KEYPAD
CJNE A,#'1',CHEE2
LJMP main1

CHEE2:
CJNE A,#'2',CHEE3
LJMP leave

CHEE3: 
ACALL WRONG
SJMP CHECK

ret


display0:
ACALL DELAY
ACALL CLEAR 
ACALL DELAY
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #WELCOME1
acall wstr
mov a,#0c0h
acall cmd
mov dptr, #WELCOME2
acall wstr
ACALL DELAY
ret

displayy:
ACALL DELAY
ACALL CLEAR 
ACALL DELAY
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #op1
acall wstr
mov a,#0c0h
acall cmd
mov dptr, #op2
acall wstr
ACALL DELAY
ACALL KEYPAD
CJNE A,#'1',CHE2
LJMP MAIN2

CHE2:
CJNE A,#'2',CHE3
LJMP leave
SJMP BACK
CHE3: 
ACALL WRONG
SJMP displayy

BACK:
ret

WRONG:
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #WRONGG
acall wstr
RET

display1:
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #amount
acall wstr
mov a,#0c0h
acall cmd
ACALL KEYPAD
MOV R2,A
acall wchr
MOV B,#10
MOV A,R2
SUBB A,#30H
MUL AB
MOV R2,A
ACALL DELAY

ACALL KEYPAD
MOV R1,A
acall wchr
MOV A,R1
SUBB A,#30H
MOV R1,A
MOV A,R2
ADD A,R1
MOV R3,A
ACALL DELAY

ret

display2:
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #data
acall wstr
mov a,#0c0h
acall cmd

ACALL KEYPAD
MOV R2,A
acall wchr
MOV B,#10
MOV A,R2
SUBB A,#30H
MUL AB
MOV R2,A
ACALL DELAY

ACALL KEYPAD
MOV R1,A
acall wchr
MOV A,R1
SUBB A,#30H
MOV R1,A
MOV A,R2
ADD A,R1
MOV R4,A
ACALL DELAY

ret

display3:
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #days
acall wstr
mov a,#0c0h
acall cmd
mov a,R4
mov b,#10 
div ab
add a,#30h
acall wchr
mov a,b
add a,#30h
acall wchr
ACALL DELAY
ACALL DELAY
ret


display4:
mov a, #80H ;  1st line position 3
acall cmd
mov dptr,#nolate
acall wstr
ret


display5:
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #dis
acall wstr

mov a,#0c0h
acall cmd
mov a,#'1'
acall wchr
mov a,#'0'
acall wchr
mov a,#'%'
acall wchr
ACALL DELAY
ACALL DELAY
ret


display6:
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #dis
acall wstr

mov a,#0c0h
acall cmd
mov a,#'2'
acall wchr
mov a,#'0'
acall wchr
mov a,#'%'
acall wchr
ACALL DELAY
ACALL DELAY
ACALL DELAY
ACALL DELAY
ret


display7:
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #pay
acall wstr

mov a,#0c0h
acall cmd
mov a,R6
mov b,#10 
div ab
add a,#30h
acall wchr
mov a,b
add a,#30h
acall wchr
ACALL DELAY
ACALL DELAY
ret

display8:
mov a, #80H ;  1st line position 3
acall cmd
mov dptr,#free
acall wstr
ACALL DELAY
ACALL DELAY
ACALL DELAY
ACALL DELAY
ret

;LLLLL
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;KEYPAD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
KEYPAD:
MOV P0,#01110000B 
K1: MOV P0,#01110000B
MOV A,P0 
ANL A,#01110000B 
CJNE A,#01110000B,K1 
K2:
MOV A,P0 
ANL A,#01110000B 
CJNE A,#01110000B,OVER1 
SJMP K2 
OVER1:
MOV P0,#01111110B 
MOV A,P0 
ANL A,#01110000B 
CJNE A,#01110000B,ROW_0 
MOV P0,#01111101B 
MOV A,P0 
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
SJMP FIND ;
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

op1: db "1-Run the system"
Db 0
op2: db "2-End..."
Db 0
op3: db "1-again?"
Db 0
op4: db "2-no tahnks"
Db 0
wrongg: db "wrong entery..."
Db 0
amount: db "enter the amount"
Db 0
data: db "enter the data"
Db 0
days: db "we will late by"
Db 0
nolate: db "no discount "
db 0
dis: db "sorry, disco"
Db 0
pay: db "pay only:"
Db 0
free: db "free, thanks "
Db 0
WELCOME1:DB "WELCOME TO THE"
DB 0 
WELCOME2:DB "COMPANY SYSTEM"
DB 0 
PRESS:DB "PREE # TO CONTINUE:"
DB 0 
BYE:DB "BYE BYE.."
DB 0 

KCODE3: DB '1','2','3' 
KCODE2: DB '4','5','6' 
KCODE1: DB '7','8','9' 
KCODE0: DB '*','0','#' 

end
