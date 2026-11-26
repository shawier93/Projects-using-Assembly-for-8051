DAV BIT P3.2
OE BIT P3.7
RS BIT P3.6
E BIT P3.5

ORG 0H
LJMP MAIN


ORG 0013H 	; EX1 ISR
ACALL KEY
CJNE A,#31H,N1
   MOV A,#1
   ACALL WRCMD
   MOV A,#0DH
    ACALL COUT
    MOV A,#"O"
     ACALL COUT
    ACALL WRDATA
    MOV A,#"N"
     ACALL COUT
    ACALL WRDATA    
    MOV A,#"E"
     ACALL COUT
    ACALL WRDATA
     LJMP  N9

N1: 
CJNE A,#32H,N2
   MOV A,#1
   ACALL WRCMD
   MOV A,#0DH
    ACALL COUT
    MOV A,#"T"
     ACALL COUT
    ACALL WRDATA
    MOV A,#"W"
     ACALL COUT
    ACALL WRDATA    
    MOV A,#"O"
     ACALL COUT
    ACALL WRDATA
     AJMP  N9
     
N2:
CJNE A,#33H,N3
   MOV A,#1
   ACALL WRCMD
   MOV A,#0DH
    ACALL COUT
    MOV A,#"T"
     ACALL COUT
    ACALL WRDATA
    MOV A,#"H"
     ACALL COUT
    ACALL WRDATA    
    MOV A,#"R"
     ACALL COUT
    ACALL WRDATA
        MOV A,#"E"
     ACALL COUT
    ACALL WRDATA
        MOV A,#"E"
     ACALL COUT
    ACALL WRDATA
     AJMP  N9
     
N3:
CJNE A,#34H,N4
   MOV A,#1
   ACALL WRCMD
   MOV A,#0DH
    ACALL COUT
    MOV A,#"F"
     ACALL COUT
    ACALL WRDATA
    MOV A,#"O"
     ACALL COUT
    ACALL WRDATA    
    MOV A,#"U"
     ACALL COUT
    ACALL WRDATA
        MOV A,#"R"
     ACALL COUT
    ACALL WRDATA
     AJMP  N9

N4:
CJNE A,#35H,N5
   MOV A,#1
   ACALL WRCMD
   MOV A,#0DH
    ACALL COUT
    MOV A,#"F"
     ACALL COUT
    ACALL WRDATA
    MOV A,#"I"
     ACALL COUT
    ACALL WRDATA    
    MOV A,#"V"
     ACALL COUT
    ACALL WRDATA
        MOV A,#"E"
     ACALL COUT
    ACALL WRDATA
     AJMP  N9
     
N5:
     CJNE A,#36H,N6
   MOV A,#1
   ACALL WRCMD
   MOV A,#0DH
    ACALL COUT
    MOV A,#"S"
     ACALL COUT
    ACALL WRDATA
    MOV A,#"I"
     ACALL COUT
    ACALL WRDATA    
    MOV A,#"X"
     ACALL COUT
    ACALL WRDATA
     AJMP  N9

 N6:
     CJNE A,#37H,N7
   MOV A,#1
   ACALL WRCMD
   MOV A,#0DH
    ACALL COUT
    MOV A,#"S"
     ACALL COUT
    ACALL WRDATA
    MOV A,#"E"
     ACALL COUT
    ACALL WRDATA    
    MOV A,#"V"
     ACALL COUT
    ACALL WRDATA
        MOV A,#"E"
     ACALL COUT
    ACALL WRDATA
            MOV A,#"N"
     ACALL COUT
    ACALL WRDATA
     AJMP  N9
     
N7:
          CJNE A,#38H,N8
   MOV A,#1
   ACALL WRCMD
   MOV A,#0DH
    ACALL COUT
    MOV A,#"E"
     ACALL COUT
    ACALL WRDATA
    MOV A,#"I"
     ACALL COUT
    ACALL WRDATA    
    MOV A,#"G"
     ACALL COUT
    ACALL WRDATA
        MOV A,#"H"
     ACALL COUT
    ACALL WRDATA
            MOV A,#"T"
     ACALL COUT
    ACALL WRDATA
     AJMP  N9
     
N8:
    CJNE A,#39H,N9
   MOV A,#1
   ACALL WRCMD
   MOV A,#0DH
    ACALL COUT
    MOV A,#"N"
     ACALL COUT
    ACALL WRDATA
    MOV A,#"I"
     ACALL COUT
    ACALL WRDATA    
    MOV A,#"N"
     ACALL COUT
    ACALL WRDATA
        MOV A,#"E"
     ACALL COUT
    ACALL WRDATA
     N9:
			RETI




MAIN:
SETB TCON.2	;  make EX1 edge-triggered interrupt
MOV IE, #84H 	; IE = 1000 0100B enable External EX1 interrupt 
ACALL LCD_INI
MOV P1,#0FFH
SETB DAV
ACALL SERIAL
MOV A,#80H
ACALL WRCMD40

LOOP:
SJMP LOOP

;//////////////////////
SERIAL:
MOV A,PCON
SETB ACC.7
MOV PCON,A
MOV TH1,#-3
MOV TMOD,#20H
MOV SCON,#50H
SETB TR1
RET
;//////////////////////////
COUT:
MOV SBUF,A
waait: JNB TI,waait
CLR TI
RET
;/////////////////////////
CIN:
JNB  RI,CIN
CLR TI
MOV SBUF,A
RET
;///////////////////
WRCMD40:
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WT40
RET
;///////////////////////
WRDATA:
MOV P2,A
SETB RS
SETB E
CLR E
ACALL WT40
RET
;///////////////////////

WT40:
MOV R0,#19
WT:DJNZ R0,WT
RET
;///////////////////////
KEY:
CLR OE
NOP
MOV A,P1
SETB OE
ANL A,#0FH
ACALL CONV
RET
;///////////////////////
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
mov A, #'6'
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
mov A, #'*'

jmp got_it

k13: cjne A, #13, k14
mov A, #'0'
jmp got_it

k14: mov A, # '#'
got_it: 
ret

;///////////////////////
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
;///////////////////////
WRCMD:
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WAIT
RET
;///////////////////////
WAIT:
MOV R5,#1
WT0: MOV R6,#28
WT1: MOV R7,#255
WT2:DJNZ R7,WT2
DJNZ R6,WT1
DJNZ R5,WT0
RET

END



