; Personal details removed.
; Personal details removed.




ORG	0


START:
ACALL INLCD   
ACALL WELCOME
	;ACALL PROGRAM_ROM
	ACALL CASH
	ACALL PRICE
ACALL COMPLETE
	SJMP $

PRICE:
ACALL CLEAR
ACALL ENTERTYPE
ACALL KEYPAD
SUBB A,#30H
	CJNE A,#1H,LC2
;IF A=00000000B  > AMERICANO
	MOV	33H,#2			;2TIMES = 2*250 = 500 FILS (0.5 KWD)
	SJMP LCR
LC2:
	CJNE A,#2H,LC3
;IF A=00000001B > CAPPUCCINO
	MOV	33H,#3			;3TIMES = 3*250 = 750 FILS (0.75 KWD)
	SJMP LCR
LC3:
	CJNE A,#3H,LC4
;IF A=00000010B > LATTE
	MOV	33H,#3			;3TIMES = 3*250 = 750 FILS (0.75 KWD)
	SJMP LCR
LC4:
;LAST CHOICE > MOCHA
	CJNE A,#4H,PRICE
	MOV	33H,#4			;4TIMES = 4*250 = 1000 FILS (1.0 KWD)

;;;;;;;;
LCR:
ACALL CLEAR
ACALL CUPSIZE
ACALL KEYPAD
SUBB A,#30H
	CJNE A,#1,LCR2
;IF A=1--> SMALL CUP
	SJMP LMT
LCR2:
	CJNE A,#2,LCR3
;IF A=2 -- > MEDIUM CUP
	MOV	A,33H
	ADD	A,#1			;ADD 1TIMES TO PRICE FOR 250 FILS (0.25 KWD)
	MOV	33H,A
	SJMP LMT
LCR3:
CJNE A,#3,LCR
;IF A=00000010B > LARGE CUP
	MOV	A,33H
	ADD	A,#2			;ADD 2TIMES TO PRICE FOR 500 FILS (0.5 KWD)
	MOV	33H,A
	

;;;;;;;;;;;;MILK TYPE
LMT:
ACALL CLEAR
ACALL MILKTYPE
ACALL KEYPAD
SUBB A,#30H
MOV 70H,A
   ;IF A=1 -- > SKIMMED MILK
	CJNE A,#1H,LMT2
ACALL MILKTYPE2
  Sjmp LSL

LMT2:;IF A=00010000B > half milk
	
	CJNE A,#2,LMT3
ACALL MILKTYPE2
  Sjmp LSL

LMT3: ;IF A= 0010000B > full milk
	CJNE A,#3,LMT
ACALL MILKTYPE2
  Sjmp LSL


;;;;;;;;;
LSL: 
ACALL CLEAR
ACALL SUGARLEVEL
ACALL KEYPAD
SUBB A,#30H
MOV 71H,A
 ;if A = 1 > none 
	CJNE A,#1,LSL2
   ACALL SUGARLEVEL2
   SJMP PRE 
LSL2: ; if A =01000000B > low
CJNE A,#2,LSL3
ACALL SUGARLEVEL2
   SJMP PRE 
LSL3: ; if A = 10000000B > medium
CJNE A,#3,LSL4
ACALL SUGARLEVEL2
   SJMP PRE 
LSL4: ; if A= 11000000B > high 
CJNE A,#4,LSL
ACALL SUGARLEVEL2

;;;

PRE: 
ACALL CLEAR
MOV R6,#10
PR:
MOV A,#80H
ACALL CMD

MOV A,#10
SUBB A,R6
JZ HERE
MOV R5,A
ADD A,#30H
ACALL WCHR
MOV A,#'0'
ACALL WCHR
MOV A,#'%'
ACALL WCHR
MOV A,#0C0H
ACALL CMD
ACALL DELAY
ACALL DELAY
BAR:
MOV A,#'.'
ACALL WCHR

ACALL DELAY
DJNZ R5,BAR
HERE:
DJNZ R6,PR




RET


mov p2,#0FFH 
FLASH: ;flashing all ports
CLR P2.0
SETB P2.1
SETB P2.2
SETB P2.3
SETB P2.4
SETB P2.5
SETB P2.6
SETB P2.7
Acall DELAY
REPT0:
MOV A,P2
CJNE A,#00000001B,BACK0
SJMP REPT0
BACK0 :
RET



clR p2.0
CLR P2.1
SETB P2.2
SETB P2.3
SETB P2.4
SETB P2.5
SETB P2.6
SETB P2.7
Acall DELAY
REPT1:
MOV A,P2
CJNE A,#00000011B,BACK1
SJMP REPT1
BACK1 :
RET


CLR P2.0
clr p2.1
clr p2.2
SETB P2.3
SETB P2.4
SETB P2.5
SETB P2.6
SETB P2.7
Acall DELAY


REPT2:
MOV A,P2
CJNE A,#00000111B,BACK2
SJMP REPT2
BACK2 :
RET


CLR P2.0
clr p2.1
clr p2.2
clr p2.3
SETB P2.4
SETB P2.5
SETB P2.6
SETB P2.7
Acall DELAY
REPT3:
MOV A,P2
CJNE A,#00001111B,BACK3
SJMP REPT3
BACK3 :
RET


CLR P2.0
clr p2.1
clr p2.2
clr p2.3
clr p2.4
SETB P2.5
SETB P2.6
SETB P2.7
Acall DELAY

REPT4:
MOV A,P2
CJNE A,#00011111B,BACK4
SJMP REPT4
BACK4 :
RET


CLR P2.0
clr p2.1
clr p2.2
clr p2.3
clr p2.4
clr p2.5
SETB P2.6
SETB P2.7
Acall DELAY

REPT5:
MOV A,P2
CJNE A,#00111111B,BACK5
SJMP REPT5
BACK5 :
RET

CLR P2.0
clr p2.1
clr p2.2
clr p2.3
clr p2.4
clr p2.5
clr p2.6
SETB P2.7
Acall DELAY

REPT6:
MOV A,P2
CJNE A,#01111111B,BACK6
SJMP REPT6
BACK6 :
RET

CLR P2.0
clr p2.1
clr p2.2
clr p2.3
clr p2.4
clr p2.5
clr p2.6
clr p2.7
Acall DELAY

REPT7:
MOV A,P2
CJNE A,#11111111B,BACK7
SJMP REPT7
BACK7 :
RET
























CASH:
ACALL CLEAR
ACALL ENTERCASH
ACALL KEYPAD
ACALL  WCHR
SUBB A,#30H
MOV B,#10
MUL AB
MOV 60H,A

ACALL KEYPAD
ACALL WCHR
SUBB A,#30H
ADD A,60H
MOV 60H,A

MOV A,#'.'
ACALL WCHR
ACALL KEYPAD
ACALL  WCHR
SUBB A,#30H
MOV B,#10
MUL AB
MOV 61H,A

ACALL KEYPAD
ACALL  WCHR
SUBB A,#30H
ADD A,61H
MOV 61H,A
RET


PROGRAM_ROM: ;save locations in rom
	MOV	DPTR,#INX
	CLR	A
	MOVC A,@A+DPTR
	MOV	30H,A
	MOV	DPTR,#INY
	CLR	A
	MOVC A,@A+DPTR
	MOV	31H,A
	MOV	DPTR,#TIME_DELAY
	CLR	A
	MOVC A,@A+DPTR
	MOV	32H,A
	RET










;;;;;;;;;;;;;;;;;;;;;
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

welcome:
mov a, #80H 
acall cmd
mov dptr, #WEL1
acall wstr

mov a,#0c0h
acall cmd
mov dptr, #WEL2
acall wstr
acall delay
ret

complete:
mov a, #80H 
acall cmd
mov dptr, #comp1
acall wstr

mov a,#0c0h
acall cmd
mov dptr, #comp2
acall wstr
acall delay
ret

ENTERCASH:
mov a, #80H 
acall cmd
mov dptr, #ENT1
acall wstr
mov a,#0c0h
acall cmd
ret

ENTERTYPE:
mov a, #80H 
acall cmd
mov dptr, #T1
acall wstr
ACALL DELAY
ACALL CLEAR

mov a,#80h
acall cmd
mov dptr, #T2
acall wstr
acall delay
mov a,#0C0h
acall cmd
mov dptr, #T3
acall wstr
acall delay
ret

CUPSIZE:
mov a,#80h
acall cmd
mov dptr, #C1
acall wstr
acall delay
mov a,#0C0h
acall cmd
mov dptr, #C2
acall wstr
acall delay
ret

MILKTYPE:
mov a,#80h
acall cmd
mov dptr, #M1
acall wstr
acall delay
mov a,#0C0h
acall cmd
mov dptr, #M2
acall wstr
acall delay
ret

MILKTYPE2:
ACALL DELAY
ACALL CLEAR
mov a,#80h
acall cmd
mov dptr, #M3
acall wstr
acall delay
mov a,#0C0h
acall cmd
MOV A,70H
CJNE A,#1,N1
mov dptr, #M4
SJMP N3
N1:CJNE A,#2,N2
mov dptr, #M5
SJMP N3
N2:
mov dptr, #M6
N3:
acall wstr
acall delay
ret

SUGARLEVEL:
mov a, #80H 
acall cmd
mov dptr, #S1
acall wstr
ACALL DELAY
ACALL CLEAR

mov a,#80h
acall cmd
mov dptr, #S2
acall wstr
acall delay
mov a,#0C0h
acall cmd
mov dptr, #S3
acall wstr
acall delay
ret

SUGARLEVEL2:
ACALL DELAY
ACALL CLEAR
mov a,#80h
acall cmd

MOV A,71H
CJNE A,#1,NN1
mov dptr, #S4
SJMP NN4
NN1:CJNE A,#2,NN2
mov dptr, #S5
SJMP NN4
NN2:CJNE A,#3,NN3
mov dptr, #S6
NN3:mov dptr, #S7
NN4:
acall wstr
acall delay
ret
;;;;;;;;

DELAY:
	PUSH 0
	PUSH 1
	PUSH 2
	MOV	R0,#4
L1:	MOV	R1,#0
L3:	DJNZ R2,L3
	DJNZ R0,L1
	POP 2
	POP 1
	POP 0
	RET


INX:	DB	3
INY:	DB	75
TIME_DELAY:	DB	100

WEL1: db "welome TO THE"
db 0
WEL2 : db "CAFFE MACHINE"
db 0
ENT1: db "ENTER MONEY.. "
db 0
T1: db "WHICH TYPE?"
db 0
T2: db "1-AMERE 2-CAPPU"
db 0
T3: db "3-LATTE 4-MOCHA"
db 0
C1: db "CUP SIZE?"
db 0
C2: db "1-S  2-M  3-L"
db 0
M1: db "MILK? 1-SKIMMED"
db 0
M2: db "2-HALF 3-FULL"
db 0
M3: db "YOU CHOOSE:"
db 0
M4: db "SKIMMED MILK"
db 0
M5: db "HALF MILK"
db 0
M6: db "FULL MILK"
db 0
S1: db "SUGAR LEVEL ?"
db 0
S2: db "1-NONE   2-LOW"
db 0
S3: db "3-MEDIUM 4-HIGH"
db 0
S4: db "SUGAR LEVEL:NONE"
db 0
S5: db "SUGAR LEVEL: LOW"
db 0
S6: db "SUGAR LEVEL:MED"
db 0
S7: db "SUGAR LEVEL:HIGH"
db 0

comp1: db "process complete :"
db 0
comp2: db "........ "
db 0
SPACE: db "               	"
db 0


KCODE3: DB '1','2','3' 
KCODE2: DB '4','5','6' 
KCODE1: DB '7','8','9' 
KCODE0: DB '*','0','#' 















	END
