; Personal details removed.
; Personal details removed.

ORG 00H
; yes = 1 , no=0
; op1 = pos , op2 = neg
;memory value  that help us in project
mov 68,#0 ;error else 1 if 1 go to second doz 
mov 67,#0 ;for  yes or no for first doza 
mov 66,#1 ;  if =1 go acall yes (yes get cornoa) if 0 go label error  
MOV 50H,#1 ;  if =1 have corona- 0 not corona

MOV 51H,#4 ;user chosse what month he have corona 

;MOV 52H,#1 ; user  chosse 0 or 1 if he take first doza he put 1 else chosse 0 (dont take first doza )
 
;MOV 53H,#11 ; date of firs doza if it take

MOV 54H,#1 ; 2 go  exir , 1 go vaccreg  other go wrong

;RANDOM INITIAL VALUES then the valu chginge in code 
;MOV 60H,#1 ; month  of second  DOZE
;MOV 61H,#100  ; DAY OF second DOZE
;MOV 62H,#1  ; user put 1 or 0 to confar the date


START: ; mian code

; messege 
acall INLCD
ACALL WELCOMEMSG
 
; flash for pot 1 
acall flash


; show design the menu 
menu: 
acall MENUMSG ; to show main menu if he press one go to vaccine regstre if 2 go exit else wrong mess 

;go to loop or exit or wrong the controll is ,emem(54)
 
mov a,54h ; for main menu  
CH1:;CHECK IF ENTER = 1 go vaccine regester 
CJNE A,#1,CH2 
;acall vaccreg  
ACALL loop 
sjmp menu

CH2:;CHECK IF ENTER = 2 display exit else wrong 
CJNE A,#2,ERRORx;IF THE ENTER NOT 1 OR 2 JAMP TO MENU
ACALL EXITMSG; disply exit 
aJMP stop

ERRORx:;IF THE ENTER NOT 1 OR 2 wrong value 
ACALL ERROR1MSG ;ERROR message
SJMP MENU

  
loop:
acall mes1 ; he or she got postive corona ? 
mov a,50h ; do you hvae corona yes or no 
CH3:;CHECK IF ENTER = 1 or -0
CJNE A,#1,CH4 ; a=mem(50)
sjmp op1
 
ch4:
cjne a,#0h,error 
m:acall no 
sjmp op2

;acall mes1
;MOV A,10H ; a= mem(10h)= 0 or 1

;CJNE A,#0,op1 ; if a=0 go next line else go op1 
;ACALL op2 ; go to op2 becuse a=mem(10)=0
;SJMP loop ; go to label loop  

op1:
POSITIVE: ; he have corona
mov a,66 ; yes or no for get cornoa 
CJNE A,#1,ERROR ; a=mem(50)= 1 go next line if a=1
acall yes  
ACALL POS ; go to label pos and do the operation 
SJMP loop

ERROR:
SJMP loop

op2:
NEG:
;Did You take first doze?
acall fdoze
MOV A,52H ; a=mem(52)= 0 or 1 user chosse  
CJNE A,#0,SecondDozee ; a=mem(12)= 0 or 1 user choosen 
;acall  
MOV 60H,#0 ; TOMORROW 
SJMP BACK3

SecondDozee:
; DATA OF FIRST DOZE

CJNE A,#1,ERROR3 ; a=mem(12)=1
MOV R7,53H ;r7=,mem(53)
MOV A,R7 ;a=mem(53)
ADD A,#2
ACALL CHEACK ; check the month 
MOV 60H,A ;MONTH OF second DOZE
MOV 61H,#4 ; DAY OF second DOZE

SJMP BACK3 ; confirm the date 

ERROR3:
SJMP BACK3

BACK3:
ACALL CONFIRM
RET
;*************
POS:
; What month you have corna
acall  mes4
;wrirw the month in keypad

MOV R7,51H ; number from 1 to 12 
;Did You take first doze?
MOV A,67h ; a=mem(52)= 0 or 1 (if 1 it take)
acall fdoze
CJNE A,#0,SecondDoze ; a = 0 or 1 from mom(12)
;acall yes1
;appointment of 1st doze
MOV A,R7 ; a=mem(51) what month you have corna
ADD A,#3
ACALL CHEACK ; confirm the data 
MOV 60H,A ; MONTH OF DOZE
MOV 61H,#1 ; DAY OF DOZE

SJMP BACK1

SecondDoze: ; user take first doza
acall fdoze 
acall yes1 
mov a,68h
;acall sedoze 
CJNE A,#1,ERROR1 ;if user put a=,mem(52)=1 go next line
;APPOINTMENT OF 2ND DOZE AFTER 4 MONTH\
acall sedoze
MOV A,R7 ;a=mem(52) first doza  
ADD A,#4
ACALL CHEACK ; to check month in range 1 to 12
MOV 60H,A ;MONTH OF second DOZE
MOV 61H,#2 ; DAY OF second  DOZE 
SJMP BACK1 ; confirm if the month and date is correct

ERROR1:

BACK1:
ACALL CONFIRM

RET

;**********
CHEACK:; to know the month 
CJNE A,#12,CONTINUE ;a=mem(52)+4
SJMP BACK2
CONTINUE:
JC BACK2  ; IF CARRY FLAG =1, go label back2
SUBB A,#12

BACK2: ; that men we have month in range 1 to 12
RET

;**********
CONFIRM: ;  
MOV A,62H ; a=mem(62)= user chosse 0 or 1
CJNE A,#1,CONFIRM

RET

;.........


; Subroutine for lcd 
;.....................................

clear:
MOV A,#01H
ACALL CMD
MOV R5,#14
WAIT: ACALL LDELAY
DJNZ R5,WAIT
RET

wchr:; display one  charcter (alpha or digir )
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

;----------

cmd:; fix cursor change value of a b
 CLR P1.3
 MOV B,A
 ACALL COMMON
ACALL LDELAY
 MOV A,B
 SWAP A
 ACALL COMMON
 ACALL LDELAY
 RET

;---------------

COMMON:; use in cmd wchr 
 ANL a,#11110000B
 ANL P1, #00001111B
 ORL P1,A
 SETB P1.2
 CLR P1.2
 RET
;-------------

INLCD: ; make lcd ready 
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
; ------- procedure delay -------

LDELAY:; delay lcd 
MOV R0, #50
DJNZ R0, $
RET

WSTR:; to write sentince in lcd
 PUSH ACC
CONT1:
 CLR A
 MOVC A,@A+DPTR ; move character to A
 JZ Exit1
PRINT:
 ACALL WCHR ; call procedure to write a CHAR
 INC DPTR ; get next character
 AJMP CONT1 ; go to CONT1
EXIT1: POP ACC ; restore A
 RET

;................................

flash:
MOV R6,#3;FLASHING PORT 1 FOR 3 TIMES
T3:MOV P1,#0H ;P1 ON
ACALL DELAY ;DELAY FOR 3SEC
MOV P1,#0fFH ;P1 OFF
ACALL DELAY ;DELAY FOR 3SEC
DJNZ R6,T3
RET
;----------------------

DELAY: 
 MOV R5,#2 ; outer loop2 count
X3: MOV R4,#20 ; outer loop1 count 
X2: MOV R3,#200 ; inner loop count
X1: DJNZ R3,X1 ; 2-machine cycles 
 DJNZ R4,X2 
 DJNZ R5,X3 
 RET ; Return to MAIN routine
;--------------------------------
ndelay:
MOV R5,#250
d1: ACALL LDELAY 
DJNZ R5,d1
ret
;----------------------
WELCOMEMSG:
MOV A,#80H ; fiirst row first colum 
ACALL CMD ;fix cursor 
MOV DPTR,#ro1; take your string 
ACALL WSTR ;display ibn lcds 
ACALL DELAY ; delay 
MOV A,#0c0H ; first row first colum 
ACALL CMD ; fix curser 
MOV DPTR,#ro2 ; take your string from rom 
ACALL WSTR ; disply in lcd
ACALL DELAY ; delay 
RET
;...............

;................
MENUMSG:
ACALL INLCD
MOV A,#80H
ACALL CMD
MOV DPTR,#ro3
ACALL WSTR
MOV A,#0C0H
ACALL CMD
MOV DPTR,#ro4
ACALL WSTR
ACALL DELAY
ACALL clear
RET
;...........
EXITMSG:
ACALL INLCD
MOV A,#80H
ACALL CMD
MOV DPTR,#ro6
acall wstr
ACALL DELAY
ACALL clear
RET
;............

ERROR1MSG:
ACALL INLCD
MOV A,#80H
ACALL CMD
MOV DPTR,#ro5
ACALL WSTR
ACALL DELAY
ACALL clear
RET
;........
vaccreg:
ACALL INLCD
MOV A,#80H
ACALL CMD
MOV DPTR,#ro7
acall wstr
ACALL DELAY
ACALL clear
RET
;....................
mes1:
ACALL INLCD
MOV A,#80H
ACALL CMD
MOV DPTR,#ro8
ACALL WSTR
ACALL DELAY
acall clear
RET
;,................
mes4:
ACALL INLCD
MOV A,#80H
ACALL CMD
MOV DPTR,#ro14
ACALL WSTR
MOV A,#0C0H
ACALL CMD
MOV DPTR,#ro15
ACALL WSTR
ACALL DELAY
ACALL clear
RET
;..................
yes:
ACALL INLCD
MOV A,#80H
ACALL CMD
mov a,66
cjne a,#01,next
MOV DPTR,#ro9
ACALL WSTR
ACALL DELAY
acall clear
sjmp block0
nextc:
Ljmp loop
 
block0:
RET
;...........
no:
ACALL INLCD
MOV A,#80H
ACALL CMD
MOV DPTR,#ro10
ACALL WSTR
ACALL DELAY
ACALL clear
RET
;..............
yes1:
ACALL INLCD
MOV A,#80H
ACALL CMD
MOV DPTR,#ro17
ACALL WSTR
ACALL DELAY
ACALL clear
RET
;.........................
month:
ACALL INLCD
MOV A,#80H
ACALL CMD
MOV DPTR,#ro10
ACALL WSTR
ACALL DELAY
ACALL clear
RET
;.................
fdoze:
ACALL INLCD
MOV A,#80H
ACALL CMD
MOV DPTR,#ro16
ACALL WSTR
MOV A,#0C0H
ACALL CMD
mov a,67
cjne a,#01,next
MOV DPTR,#ro17
ACALL WSTR
ACALL DELAY
acall clear 

next:
MOV A,#0C0H
ACALL CMD
MOV DPTR,#ro10
ACALL WSTR
ACALL DELAY
acall clear 
RET
;................................
sedoze: 
ACALL INLCD
MOV A,#80H
ACALL CMD
MOV DPTR,#ro18
ACALL WSTR
ACALL DELAY
acall clear 
RET
;.......................
rom:

ro1:DB "welcome"
DB 0

ro2:DB "vaccine system"
DB 0

ro3:DB "main menu"
DB 0

ro4:DB "1:vaccreg 2:Exit"
DB 0

ro5:DB "wrong entert"
DB 0

ro6:DB "exit"
DB 0

ro7:DB "vaccine reg"
DB 0

ro8:DB "he or she test +"
DB 0

ro9:DB "yes he got corona"
DB 0

ro10:DB "no"
DB 0

ro11:DB "1"
DB 0

ro12:DB "press interrupt"
DB 0

ro13:DB "key to continu"
DB 0

ro14:DB "what month catch" ;what manth you have corna 
DB 0

ro15:DB "the month is " ; put the month  
DB 0

ro16:DB "do yot t f doze"
DB 0

ro17:DB "yes"
DB 0

ro18:DB "second doze 4th"
DB 0
;...............................

;ASCII LOOK-UP TABLE FOR EACH ROW
    
KCODE3: DB '1','2','3' ;Row0 ASCII codes
KCODE2: DB '4','5','6' ;Row1
KCODE1: DB '7','8','9' ;Row2
KCODE0: DB '*','0','#' ;Row3
STOP: sjmp stop 
END
