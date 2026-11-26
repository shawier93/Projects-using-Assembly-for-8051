DAV BIT P3.0
OE BIT P3.1
RS BIT P3.2 
E BIT P3.3

ORG 0H
ACALL LCD_INI
MOV P1,#0FFH
SETB DAV
MOV A,#80H
ACALL WRCMD40
LP: JNB DAV,LP
ACALL KEY
ACALL WRDATA
LP2: JB DAV,LP2
SJMP LP
;;

WRCMD40:
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WT40
RET

WRDATA:
MOV P2,A
SETB RS
SETB E
CLR E
ACALL WT40
RET

WT40:
MOV R0,#19
WT:DJNZ R0,WT
RET

KEY:
CLR OE
NOP
MOV A,P1
SETB OE
ANL A,#0FH
ACALL CONV
RET
;;;
CONV:  cjne A, #0, k1
mov A, #'1'
jmp got_it

k1: cjne A, #1, k2
mov A, #'2'
jmp got_it

k2: cjne A, #2, k4
mov A, #'3'
jmp got_it

k4: cjne A, #4, k5
mov A, #'4'
jmp got_it

k5: cjne A, #5, k6
mov A, #'5'
jmp got_it

k6: cjne A, #6, k8
mov A, #6'
jmp got_it

k8: cjne A, #8, k9
mov A, #'7'
jmp got_it

k9: cjne A, #9, k10
mov A, #'8'
jmp got_it

k10: cjne A, #10, k12
mov A, #'9'
jmp got_it

k12: cjne A, #12, k13
mov A, #™"

jmp got_it

k13: cjne A, #13, k14
mov A, #0'
jmp got_it

k14: movA, ##'
got_it: 
ret

;;


LCD_INI:
ACALL WAIT
MOV A,#38H
ACALL WRCMD
MOV A,#038H
ACALL WRCMD
MOV A,#038H
ACALL WRCMD
MOV A,#038H
ACALL WRCMD
MOV A,#8
ACALL WRCMD
MOV A,#1
ACALL WRCMD
MOV A,#6
ACALL WRCMD
MOV A,#0FH
ACALL WRCMD40
RET

WRCMD:
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WAIT
RET

WAIT:
MOV R5,#1
WT0: MOV R6,#28
WT1: MOV R7,#255
WT2:DJNZ R7,WT2
DJNZ R6,WT1
DJNZ R5,WT0
RET

END



