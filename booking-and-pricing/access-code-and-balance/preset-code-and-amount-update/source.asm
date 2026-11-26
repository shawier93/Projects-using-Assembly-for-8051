org 0h
;PRESAVED VALUES
MOV 30H,#12H ; password
MOV 40H,#100 ; BALANCE
; ENTERD PASSORD 
MOV 50H,#0
;WANT TO DEPOSITE
MOV 51H,#1
; max amount to deposite
mov 52h,#0
;amout to despoited
MOV 53H,#100


MAIN_MENU:
; ckeck passowrd
MOV 50H,#12H
MOV A,50H
CJNE A,30H,EXIT
;CHCEACK IF AMOUNT IS LESS THAN 255
MOV A,40H
CJNE A,#255,CONT
CONT:
; IF EQUAL OR LARGER THAN 255  EXIT
JNC EXIT
; ASK THE USER IF HE WANT TO DEPOSITE MONEY
MOV 51H,#1 ; YES
MOV A,51H
CJNE A,#1,EXIT
; claculte max amount and save it in 52h
mov a,#255;
subb a,40h
mov 52h,a
;copy the amount the user will enter
cheak:
mov a,53h
;cheack if the amount is less than the max amout
cjne a,53h,contt
contt:
; if larger than max amount back 
jc cheak 
;else update the new balance
add a,40h;
mov 40h,a



EXIT:
SJMP $
