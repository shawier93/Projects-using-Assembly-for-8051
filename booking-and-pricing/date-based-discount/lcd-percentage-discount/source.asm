
ORG 000H
ACALL INLCD 
MOV P1,#00  ; OUTPUT
MOV R3,#20 ; AMOUNT OF MONEY 
MOV R4,#19 ; DAYS  
MOV R5,#0 ; DISCOUNT PERCENTAGE  0,1,2,10 /10

MOV 20H,#0FBH
LCALL FLASH

; amount messgae
acall clear
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

LOOP: SJMP LOOP
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

display1:
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #amount
acall wstr
mov a,#0c0h
acall cmd
mov a,R3
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

display2:
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #data
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

Db 0
end
