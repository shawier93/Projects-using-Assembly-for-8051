
org 0h
;PRESAVED VALUES
MOV 30H,#12H ; password
MOV 40H,#110 ; BALANCE
 
MOV 50H,#12h ; ENTERD PASSwORD
MOV 51H,#1 ;WANT TO DEPOSITE 1 yes 2 no
mov 52h,#0 ; max amount to deposite 255-110
MOV 53H,#50 ;amout to despoited


MAIN_MENU:
MOV A,#1  ; OPTION 1 OR 2
CJNE A,#1,EXIT
; ckeck passowrd
;MOV 50H,#12H
MOV A,50H
CJNE A,30H,MAIN_MENU
;CHCEACK IF balance IS LESS THAN 255
MOV A,40H
CJNE A,#255,CONT
CONT:
; IF EQUAL OR LARGER THAN 255  EXIT
JNC EXIT
; ASK THE USER IF HE WANT TO DEPOSITE MONEY
;MOV 51H,#1 ; YES
MOV A,51H
CJNE A,#1,EXIT
; claculte max amount and save it in 52h
mov a,#255;
subb a,40h
mov 52h,a
;copy the amount the user will enter
cheack:
mov a,53h
;cheack if the amount is less than the max amout
cjne a,52h,contt
contt:
; if larger than max amount back 
jnc cheack 
;else update the new balance
add a,40h;  a=a+(40H)
mov 40h,a



EXIT:
SJMP $

end
