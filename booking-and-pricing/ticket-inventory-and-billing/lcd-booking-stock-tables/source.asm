
ORG 00H 
       ACALL INLCD   ; initialize LCD
       MOV A,#80H
       ACALL CMD
       MOV DPTR,#S1   ;;; WELCOME 
       ACALL WCHR
       MOV R7,#250
WAIT0:
       ACALL LDELAY 
       DJNZ R7,WAIT0
;-----clear LCD-----
      MOV A,#01H
      ACALL CMD
      MOV R7,#14
WAIT1:
      ACALL LDELAY
      DJNZ R7,WAIT1

;;;;;SCREEN2
       MOV A,#80H
       ACALL CMD
       MOV DPTR,#S2 ;; 1.G 2.S 
       MOV A,#32H ;;;;mov 30h,#2 seat category = 30h+2 =32h convert to ASCII
       ACALL WCHR
       MOV R7,#250
WAIT2:
       ACALL LDELAY 
       DJNZ R7,WAIT2

;-----clear LCD-----
      MOV A,#01H
      ACALL CMD
      MOV R7,#14
WAIT3:
      ACALL LDELAY
      DJNZ R7,WAIT3

;;;;SCREEN3 ;;;
     MOV A,#80H
      ACALL CMD
      MOV A,#34H ;; NUMBER of tickets mov 40h,#4     =30h+4=34h
      ACALL WCHR
      MOV R7,#250
WAIT4: 
       ACALL LDELAY
       DJNZ R7,WAIT4
;-----clear LCD-----
     MOV A,#01H
     ACALL CMD
     MOV R7,#14
WAIT5:
    ACALL LDELAY
     DJNZ R7,WAIT5
     MOV A,#0C0H
     ACALL CMD
    MOV DPTR,#S3 ;;; ok 5 KD 
    ACALL WCHR
;;;;; SCREEN4 
 MOV A,#80H
       ACALL CMD
       MOV DPTR,#S4 ;; 1.G 2.S E:
       ACALL WCHR
       MOV R7,#250
WAIT8:
       ACALL LDELAY 
       DJNZ R7,WAIT8

;-----clear LCD-----
      MOV A,#01H
      ACALL CMD
      MOV R7,#14
WAIT9:
      ACALL LDELAY
      DJNZ R7,WAIT9


;;;;SCREEN5
 MOV A,#80H
       ACALL CMD
       MOV DPTR,#NUM 
       MOV A,#35H
       ACALL WCHR
       MOV R7,#250
WAIT7:
       ACALL LDELAY 
       DJNZ R7,WAIT7

;-----clear LCD-----
      MOV A,#01H
      ACALL CMD
      MOV R7,#14
WAIT77:
      ACALL LDELAY
      DJNZ R7,WAIT77

 
   MOV A,#0C0H
   ACALL CMD
   MOV A,#S5 ;; NO SORRY 
   ACALL WCHR

;;;;SCREEN 6
 MOV A,#80H
       ACALL CMD
       MOV DPTR,#S6 ;; 1.G 2.S E:
       
       ACALL WCHR
       MOV R7,#250
WAIT88:
       ACALL LDELAY 
       DJNZ R7,WAIT88

;-----clear LCD-----
      MOV A,#01H
      ACALL CMD
      MOV R7,#14
WAIT99:
      ACALL LDELAY
      DJNZ R7,WAIT99


;;;SCREEN 7
     MOV A,#80H
       ACALL CMD
       MOV DPTR,#NUM1 
       MOV A,#38H 
       ACALL WCHR
       MOV R7,#250
WAIT09:
       ACALL LDELAY 
       DJNZ R7,WAIT09
;-----clear LCD-----
      MOV A,#01H
      ACALL CMD
      MOV R7,#14
WAIT19:
      ACALL LDELAY
      DJNZ R7,WAIT19
     MOV A,#0C0H
      ACALL CMD
     MOV A,#S7  
     ACALL WCHR 

FINISH: SJMP FINISH




;;;;PHASE 1 ;;;
   MOV 30H,#2 ;Seat Category (1.Gold,2.Silver)
   MOV 40H,#4 ;Number of Tickets (Max 9 Tickets)
   MOV 50H,#0 ;Amount need to be paid
;31H Available Seats for gold
;32H Price for Gold
;41H Available Seats for silver
;42H ;Price for silver

   MOV DPTR,#GOLD
   CLR A
   MOVC A,@A+DPTR
   MOV 31H,A
   INC DPTR
   CLR A
   MOVC A,@A+DPTR
   MOV 32H,A
   MOV DPTR,#SILVER
    CLR A
   MOVC A,@A+DPTR
   MOV 41H,A
   INC DPTR
   CLR A
   MOVC A,@A+DPTR
   MOV 42H,A
NEXTBOOKING:
      MOV A,30H
     CJNE A,#1,NEXT1 
     MOV A,31H
      CLR C
     SUBB A,40H ; Check for available seats
     JC NOAVAIL 
     MOV 31H,A
     MOV B,32H  
    SJMP CALC

NEXT1:
    CJNE A,#2,ERROR 
     CLR C
     MOV A,41H
     SUBB A,40H ; Check for available seats
    JC NOAVAIL
    MOV 41H,A
    MOV B,42H ; price for silver
    SJMP CALC
ERROR:
SJMP $ 
CALC:
   MOV A,40H ; Number of Seats
   MUL AB    ; Multiply by price per seat
   MOV 50H,A
   SJMP NEXTBOOKING

NOAVAIL:
SJMP $
;;;;;END PHASE1 
;;;;;;;; COPY 

;- Subroutine to write character in A to the LCD-----

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

;--Subroutine to write COMMAND in A to the LCD----

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

;---Common operation for CHAR write and COMMAND write

COMMON:
 ANL a,#11110000B
 ANL P1, #00001111B
 ORL P1,A
 SETB P1.2
 CLR P1.2
 RET

; ------- procedure init_display -------

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

; ------- procedure delay -------
LDELAY:
MOV R0, #50
DJNZ R0, $
RET

GOLD: DB 9,5
DB 0
SILVER: DB 9,3
DB 0
S1: DB "WELCOME"
DB 0
S2: DB "1.G 2.S E: "
DB 0
S3: DB "OK 5 KD "
DB 0
S4:DB "1.G 2.S E: "
DB 0
S5:DB " NO SORRY"
DB 0
NUM:DB " TICKETS :"
DB 0
S6: DB "1.G 2.S E: "
DB 0
S7: DB " OK 24 KD"
DB 0
NUM1: DB "  TICKETS :"
DB 0
