; Personal details removed.
; Personal details removed.
; interput use is 0 
ORG 00H
; yes = 1 , no=0
; op1 = pos , op2 = neg
;memory value  that help us in project 
MOV 51H,#4 ;user chosse what month he have corona 
MOV 52H,#1 ; user  chosse 0 or 1 if he take first doza he put 1 else chosse 0 (dont take first doza )
MOV 53H,#3 ; date of firs doza if it take

;RANDOM INITIAL VALUES then the valu chginge in code 
MOV 54H,#1 ; month  of second  DOZE
MOV 55H,#100  ; DAY OF second DOZE
MOV 56H,#1  ; user put 1 or 0 to confar the date
MOV 57H,#1 ; MAIN MENU



ACALL INLCD ; rady the lcd 
u:ACALL WELCOMEMSG ; show messege in lcd 
ACALL FLASH ; flash 3 times 
ACALL INLCD ; ready lcd 
acall press
acall name
START: ; mian code
ACALL MENUMSG ; main menu and showw 1-vaccine regester 2-exit other wrong 
aCALL KEYPAD ; 1 2 other wrong 
ACALL WCHR ; display it in lcd 
ACALL DELAY ; delay 
ACALL DELAY

;MOV A,57H
CJNE A,#'1', EXIT ; if a=1 go our op 2 exit other wrong  

loop:
ACALL MES1 ; he or she test + yes or no 
ACALL KEYPAD ; 1- yes -0 no
ACALL WCHR ;display it in lcd 
SUBB A,#30H; convert it to value 
ACALL DELAY

CJNE A,#0,op1 ; if a=0 go next line else go op1 
ACALL op2 ; go to op2 
SJMP AGAINN  

op1:
 ; he have corona 
CJNE A,#1,ERROR ; 1 go to pos other go 
ACALL POS ; go to label pos and do the operation 
SJMP AGAINN

ERROR:
ACALL ERROR1MSG ; wrong enter 
	SJMP loop


EXIT:
CJNE A,#'2',ERRORx;IF THE ENTER NOT 1 OR 2 JAMP TO MENU
ACALL EXITMSG; disply exit 
HEREE: SJMP HEREE 

ERRORX:
ACALL ERROR1MSG
SJMP START

AGAINN:
ACALL MES5;yse no  agin 
ACALL KEYPAD
ACALL WCHR 
SUBB A,#30H
ACALL DELAY
CJNE A,#1,STO
SJMP LOOP
STO:
CJNE A,#0,AGAINN
ACALL EXITMSG
SS:SJMP SS
;---------
;SUBROUTINES

op2:
; NEGATIVE RESULT

;Did You take first doze?
ACALL MES22
ACALL KEYPAD
ACALL WCHR 
SUBB A,#30H

cjne a,#0h,next
ACALL DELAY
sjmp z

next:
cjne a,#01,wrong
acall delay 
sjmp z

wrong:
acall ERROR1MSG
sjmp op2

z:CJNE A,#0,SecondDozee ; a=mem(12)= 0 or 1 user choosen  
ACALL MES33
MOV 54H,#0 ; TOMORROW 
ACALL DELAY
ACALL DELAY
SJMP BACK3

SecondDozee:
; DATA OF FIRST DOZE
CJNE A,#1,ERROR3 
ACALL MES44 ; when it taken
ACALL KEYPAD
ACALL WCHR 
; to make two dig in keybad
subb a,#30h;valu 
mov b,10
mul ab
mov 30h,a  

acall keypad
add a,30h
acall delay 

SUBB A,#30H
MOV 53H,A
ACALL DELAY

ACALL MES3; your appoint in 
MOV R7,53H ;
MOV A,R7 ;
ADD A,#2
ACALL CHEACK ; check the month 
MOV 54H,A ;MONTH OF second DOZE
acall convert
MOV A,#'/'
ACALL WCHR
MOV 55H,#4 ; DAY OF second DOZE
MOV A,55H
ADD A,#30H
ACALL WCHR
ACALL DELAY
SJMP BACK3 ; confirm the date 

ERROR3:
ACALL ERROR1MSG
SJMP OP2

BACK3:
ACALL CONFIRM
RET
;*****
POS:
; What month you have corna 
c:ACALL MES2; what manth catch the month is 
ACALL KEYPAD 
ACALL WCHR
acall delay 
;wring month we have 0 ,# , * 
acall wrongm
MOV R7,A
;MOV R7,51H ; number from 1 to 12
 
;Did You take first doze?
n:ACALL MES22 ; 
ACALL KEYPAD
ACALL WCHR 
SUBB A,#30H

cjne a,#0h,next5
ACALL DELAY
sjmp m

next5:
cjne a,#01,wrong5
acall delay 
sjmp m

wrong5:
acall ERROR1MSG
sjmp n

m:ACALL DELAY
;MOV A,52H ; a=mem(12)= 0 or 1 (if 1 it take) 
CJNE A,#0,SecondDoze ; a = 0 or 1 from mom(12)
;appointment of 1st doze
ACALL MES3
ACALL DELAY
MOV A,R7 ; a=mem(11) what month you have corna
ADD A,#3
ACALL CHEACK ; confirm the data 
MOV 54H,A ; MONTH OF DOZE
acall convert
MOV A,#'/'
ACALL WCHR
MOV 55H,#1 ; DAY OF DOZE
MOV A,55H
ADD A,#30H
ACALL WCHR
ACALL DELAY
ACALL DELAY
SJMP BACK1

SecondDoze: ; user take first doza 
CJNE A,#1,ERROR1 ;if user put a=,mem(12)=1 go next line
;APPOINTMENT OF 2ND DOZE AFTER 4 MONTH
ACALL MES3
MOV A,R7 ;a=mem(12) first doza  
ADD A,#4
ACALL CHEACK ; to check month in range 1 to 12
MOV 54H,A ;MONTH OF second DOZE
acall convert
MOV A,#'/'
ACALL WCHR
MOV 55H,#2 ; DAY OF second  DOZE 
MOV A,55H
ADD A,#30H
ACALL WCHR
ACALL DELAY
SJMP BACK1 ; confirm if the month and date is correct

ERROR1:

BACK1:
ACALL CONFIRM

RET

;****
CHEACK:; to know the month 
CJNE A,#12,CONTINUE ;a=mem(12)+4
SJMP BACK2

CONTINUE:
JC BACK2  ; IF CARRY FLAG =1, go label back2
SUBB A,#12

sjmp back2
BACK2: ; that men we have month in range 1 to 12
RET

;****
CONFIRM: ;  
ACALL MES4
ACALL KEYPAD
ACALL WCHR 
SUBB A,#30H
;MOV A,56H ; a=mem(16)= user chosse 0 or 1
CJNE A,#1,CONFIRM

RET
;,,,,,
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

;-----
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
;------------------------------
;------------------------------
WELCOMEMSG:
MOV A,#80H ; fiirst row first colum 
ACALL CMD ;fix cursor 
MOV DPTR,#ro1; take your string 
ACALL WSTR ;display ibn lcds 
ACALL DELAY ; delay 
acall clear 
ret 
;....
name:
MOV A,#80H ; first row first colum 
ACALL CMD ; fix curser 
MOV DPTR,#ro2 ; take your string from rom 
ACALL WSTR ; disply in lcd
ACALL DELAY ; delay 
acall clear
RET
;.......

MENUMSG:
ACALL CLEAR
MOV A,#80H
ACALL CMD
MOV DPTR,#ro3
ACALL WSTR
MOV A,#0C0H
ACALL CMD
MOV DPTR,#ro4
ACALL WSTR
ACALL DELAY

RET

EXITMSG:
ACALL CLEAR
MOV A,#80H
ACALL CMD
MOV DPTR,#ro6
acall wstr
ACALL DELAY
ljmp u
RET


ERROR1MSG:
ACALL CLEAR
MOV A,#80H
ACALL CMD
MOV DPTR,#ro5
ACALL WSTR
ACALL DELAY
RET

mes1:
ACALL CLEAR
MOV A,#80H
ACALL CMD
MOV DPTR,#ro7
ACALL WSTR
ACALL DELAY
MOV A,#0C0H
ACALL CMD
MOV DPTR,#ro11
ACALL WSTR
ACALL DELAY
RET

mes2:
ACALL CLEAR
MOV A,#80H
ACALL CMD
MOV DPTR,#ro8
ACALL WSTR
MOV A,#0C0H
ACALL CMD
MOV DPTR,#ro9
ACALL WSTR
ACALL DELAY
RET

mes22:
ACALL CLEAR
MOV A,#80H
ACALL CMD
MOV DPTR,#ro10
ACALL WSTR
MOV A,#0C0H
ACALL CMD
MOV DPTR,#ro11
ACALL WSTR
ACALL DELAY
RET



mes3:
ACALL CLEAR
MOV A,#80H
ACALL CMD
MOV DPTR,#ro12
ACALL WSTR
MOV A,#0C0H
ACALL CMD

RET

mes33:
ACALL CLEAR
MOV A,#80H
ACALL CMD
MOV DPTR,#ro12
ACALL WSTR
MOV A,#0C0H
ACALL CMD
MOV DPTR,#ro14
ACALL WSTR
RET

mes4:
ACALL CLEAR
MOV A,#80H
ACALL CMD
MOV DPTR,#ro13
ACALL WSTR
MOV A,#0C0H
ACALL CMD
MOV DPTR,#ro11
ACALL WSTR
ACALL DELAY
RET

mes44:
ACALL CLEAR
MOV A,#80H
ACALL CMD
MOV DPTR,#ro111
ACALL WSTR
MOV A,#0C0H
ACALL CMD
RET

mes5:
ACALL CLEAR
MOV A,#80H
ACALL CMD
MOV DPTR,#ro15
ACALL WSTR
MOV A,#0C0H
ACALL CMD
MOV DPTR,#ro11
ACALL WSTR
ACALL DELAY
RET
;.....................................
;Before results?
convert: 
Mov b,#10
Div ab 
Add A,#30H
Acall wchr 
Mov a,b
Add a,#30h
Acall wchr
ret
;..................................
PRESS:
mov a,#80h
acall cmd 
mov dptr ,#t1
acall wstr
mov a,#0c0h
acall cmd 
mov dptr ,#t2
acall wstr 
c1:
acall keypad
cjne a,#30h,c1
mov dptr ,#t1
acall wstr
acall clear 
ret
;......................
wrongm:
false:
cjne a,#'#',false1
acall ERROR1MSG
ACALL DELAY
ljmp c

false1:
cjne a,#'*',false2
acall ERROR1MSG
ACALL DELAY
ljmp c

;write month from 1 to 9
false2:
subb a,#30h;valu 
mov b,10
mul ab
mov a,#30h

acall keypad
subb a,#30h
add a,30h
acall delay 
ret 
;........
ro1:DB "...welcome to.."
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
ro7:DB "he or she test +"
DB 0
ro8:DB "what month catch" ;what manth you have corna 
DB 0
ro9:DB "the month is  " ; put the month  
DB 0
ro10:DB "do yot t f doze"
DB 0
ro11:DB "1:yes 0:NO  "
DB 0
ro111:DB "WHEN TAKE IT ? "
DB 0
ro12:DB "YOUR APOINT IN:"
DB 0
ro13:DB "CONFIRM"
DB 0
ro14:DB "TOMORROW"
DB 0
ro15:DB "AGAIN?"
DB 0

ro16:DB "Press interrup"
DB 0

ro17:DB "key to continue"
DB 0

t1:DB "key to continue"
DB 0

t2:DB " is  0 "
DB 0


;...............................

;ASCII LOOK-UP TABLE FOR EACH ROW
    
KCODE3: DB '1','2','3' ;Row0 ASCII codes
KCODE2: DB '4','5','6' ;Row1
KCODE1: DB '7','8','9' ;Row2
KCODE0: DB '*','0','#' ;Row3

stop: sjmp stop
END
