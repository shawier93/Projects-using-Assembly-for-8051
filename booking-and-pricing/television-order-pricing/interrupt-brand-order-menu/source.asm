ORG 00H
SJMP MAIN0
ORG 0003H ;EXTERNAL 0 INTERRUPT VECTOR
AGAIN: 
MOV A,P2
JB ACC.0,AGAIN
RETI

MAIN0:
ACALL INLCD
MOV 30H,#3 ; BRAND
MOV 31H,#2	; WARRENTLY
MOV 32H,#1	;MAINTAINACE
MOV 33H,#2	;DELIVERY
MOV 34H,#2	;NUMBERS
MOV 35H,#1	;MEMEBESHIP
MOV 36H,#0	;COST
MOV IE,#81H;
SETB IT0


HERE:
ACALL WELCOME
ACALL INT

REPEAT:
ACALL MENU1

MAIN:
MOV A,30H
CJNE A,#1,BEAND2
ACALL FLASH1 ; SONEY
MOV 36H,#63
AJMP WARR

BEAND2:
CJNE A,#2,BEAND3
ACALL FLASH2 ; WANSA
MOV 36H,#55
AJMP WARR

BEAND3:
CJNE A,#3,ERROR
ACALL FLASH3 ;SHARP
MOV 36H,#70
AJMP WARR

ERROR:
ACALL ERRORR
SJMP REPEAT

WARR: 
ACALL WARRENTLY 
ACALL MAINTANACE
ACALL DELIVERY

;READ NUMBERS OF TVs
ACALL TVNUMB
MOV B,34H
MOV A,36H
MUL AB
MOV 36H,A


ACALL MEMBERSHIP

ACALL PAYMENT


EEND:
ACALL REPEAT_AGAIN
ACALL CLEAR
MOV A, #80H ;  1st line position 3
ACALL CMD
MOV dptr, #MESG19
ACALL wstr

EEEND:SJMP EEEND


;--------------------
;---------------------------
WARRENTLY:
ACALL WARMSG
MOV A,31H
CJNE A,#1,TWOYEAR
;ONE YEAR
; DETERMINE WHICH BRAND 
MOV A,30H
CJNE A,#1,BRAND2
MOV A,36H
ADD A,#4
MOV 36H,A
SJMP BACK

BRAND2:
CJNE A,#2,BRAND3
MOV A,36H
ADD A,#2
MOV 36H,A
SJMP BACK

BRAND3:
MOV A,36H
ADD A,#8
MOV 36H,A
SJMP BACK

;///////////////////////////
TWOYEAR:
CJNE A,#2,ERR
MOV A,30H
CJNE A,#1,BRRAND2
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK

BRRAND2:
CJNE A,#2,BRRAND3
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK

BRRAND3:
MOV 36H,#77
MOV A,36H
ADD A,#11
MOV 36H,A
SJMP BACK

ERR:
ACALL ERRORR
SJMP WARRENTLY
BACK:
RET

;---------------------------
MAINTANACE:
ACALL MAIMSG
MOV A,32H
CJNE A,#1,NO
;YES
; DETERMINE WHICH BRAND 
MOV A,30H
CJNE A,#1,BRRANDD2
MOV A,36H
ADD A,#4
MOV 36H,A
SJMP BACK1

BRRANDD2:
CJNE A,#2,BRRANDD3
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK1

BRRANDD3:
MOV A,36H
ADD A,#7
MOV 36H,A
SJMP BACK1

NO:CJNE A,#2,ERR1;
SJMP BACK1

ERR1:
ACALL ERRORR
SJMP MAINTANACE

BACK1:
RET

;--------------------------------
DELIVERY:
ACALL DELMSG
MOV A,33H
CJNE A,#1,NO1
;YES
; DETERMINE WHICH BRAND 
MOV A,30H
CJNE A,#1,BRRANDDD2
MOV A,36H
ADD A,#2
MOV 36H,A
SJMP BACK2

BRRANDDD2:
CJNE A,#2,BRRANDDD3
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK2

BRRANDDD3:
MOV A,36H
ADD A,#3
MOV 36H,A
SJMP BACK2
;++++++++++++++
NO1:
CJNE A,#2,ERR2;
SJMP BACK2

ERR2:
ACALL ERRORR
SJMP DELIVERY

 BACK2:
RET

;-------------------------------
MEMBERSHIP:
ACALL MEMMSG
MOV A,35H
CJNE A,#1,NO2
;YES
; DETERMINE WHICH BRAND 
MOV A,30H
CJNE A,#1,BRRANDD22
MOV A,36H
SUBB A,#15
MOV 36H,A
SJMP BACK3

BRRANDD22:
CJNE A,#2,BRRANDD33
MOV A,36H
SUBB A,#17
MOV 36H,A
SJMP BACK3

BRRANDD33:
MOV A,36H
SUBB A,#22
MOV 36H,A
SJMP BACK3
;++++++++++++++
NO2:
CJNE A,#2,ERR3;
SJMP BACK3

ERR3:
ACALL ERRORR
SJMP MEMBERSHIP

BACK3:

RET

FLASH1:
MOV R7,#5
AG:
MOV P1,#11101111B
ACALL DELAY
MOV P1,#11111111B
ACALL DELAY
DJNZ R7,AG
RET

FLASH2:
MOV R7,#5
AG1:
MOV P1,#11110111B
ACALL DELAY
MOV P1,#11111111B
ACALL DELAY
DJNZ R7,AG1
RET

FLASH3:
MOV R7,#5
AG2:
MOV P1,#11111011B
ACALL DELAY
MOV P1,#11111111B
ACALL DELAY
DJNZ R7,AG2
RET

;-----------------
;----MESSAGES------
;-------------------


WELCOME:
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #MESG1
acall wstr
mov a,#0c0h
acall cmd
mov dptr, #MESG2
acall wstr
ACALL DELAY
ret

MENU1:
ACALL DELAY
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #MESG3
acall wstr
mov a,#0c0h
acall cmd
mov dptr, #MESG4
acall wstr
ACALL DELAY
ACALL DELAY
ACALL CLEAR

mov a, #80H ; 
acall cmd
mov dptr, #MESG5
acall wstr

mov a, #0C3H ; 
acall cmd
ACALL KEYPAD
MOV 30H,A
acall wchr
MOV A,30H
SUBB A,#30H
MOV 30H,A
ACALL DELAY
RET

WARMSG:
ACALL DELAY
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #MESG6
acall wstr
mov a,#0c0h
acall cmd
mov dptr, #MESG7
acall wstr
ACALL DELAY
ACALL DELAY
ACALL CLEAR

mov a, #80H ; 
acall cmd
mov dptr, #MESG8
acall wstr

mov a, #0C3H ; 
acall cmd
ACALL KEYPAD
MOV 31H,A
acall wchr
MOV A,31H
SUBB A,#30H
MOV 31H,A
ACALL DELAY
RET

MAIMSG:
ACALL DELAY
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #MESG9
acall wstr
mov a,#0c0h
acall cmd
mov dptr, #MESG10
acall wstr
ACALL DELAY
ACALL DELAY
ACALL CLEAR

mov a, #80H ; 
acall cmd
mov dptr, #MESG8
acall wstr

mov a, #0C3H ; 
acall cmd
ACALL KEYPAD
MOV 32H,A
acall wchr
MOV A,32H
SUBB A,#30H
MOV 32H,A
ACALL DELAY

RET

DELMSG:
ACALL DELAY
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #MESG11
acall wstr
mov a,#0c0h
acall cmd
mov dptr, #MESG10
acall wstr
ACALL DELAY
ACALL DELAY
ACALL CLEAR

mov a, #80H ; 
acall cmd
mov dptr, #MESG8
acall wstr
mov a, #0C3H ; 
acall cmd
ACALL KEYPAD
MOV 33H,A
acall wchr
MOV A,33H
SUBB A,#30H
MOV 33H,A
ACALL DELAY
RET

MEMMSG:
ACALL DELAY
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #MESG12
acall wstr
mov a,#0c0h
acall cmd
mov dptr, #MESG10
acall wstr
ACALL DELAY
ACALL DELAY
ACALL CLEAR

mov a, #80H ; 
acall cmd
mov dptr, #MESG8
acall wstr
mov a, #0C3H ; 
acall cmd
ACALL KEYPAD
MOV 35H,A
acall wchr
MOV A,35H
SUBB A,#30H
MOV 35H,A
ACALL DELAY
RET

TVNUMB:
ACALL DELAY
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #MESG13
acall wstr

mov a, #0C3H ; 
acall cmd
ACALL KEYPAD
MOV 34H,A
acall wchr
MOV A,34H
SUBB A,#30H
MOV 34H,A
ACALL DELAY
RET

PAYMENT:
ACALL DELAY
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #MESG14
acall wstr
mov a, #0C3H ; 
acall cmd
MOV A,36H
MOV B,#10
DIV AB
MOV R3,B
MOV B,#10
DIV AB
ADD A,#30H
acall wchr
MOV A,B
ADD A,#30H
acall wchr
MOV A,R3
ADD A,#30H
acall wchr

RET

ERRORR:
ACALL DELAY
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #MESG15
acall wstr
RET

DELAY:

MOV R0, #200
DJNZ R0, $
RET

      ;------------
REPEAT_AGAIN:
ACALL DELAY
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #MESG17
acall wstr
mov a, #0C0H ;  1st line position 3
acall cmd
mov dptr, #MESG18
acall wstr
ACALL KEYPAD 
CJNE A,#'1',EXI
LJMP REPEAT
EXI:
RET

INT:
ACALL DELAY
ACALL CLEAR 
ACALL DELAY
mov a, #80H 
acall cmd
mov dptr, #MESG16
acall wstr

CLR P3.6 
SETB P3.6

RET


      INLCD:
 	CLR P1.3	
       
 	CLR P1.7	
 	CLR P1.6	
 	SETB P1.5		
 	CLR P1.4		 	
 	SETB P1.2		 
 	CLR P1.2			
 	ACALL DELAY
       
 	SETB P1.2	
 	CLR P1.2	
      
 	SETB P1.7		
 	CLR P1.6	
 	CLR P1.5		 
 	CLR P1.4			
 	SETB P1.2		 
 	CLR P1.2	
 	ACALL DELAY
       
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
 	ACALL DELAY
       
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
 	ACALL DELAY
 	RET
       ;--- End  of  LCD initialization  ----- 
       
      ;---- Subroutine to writ
WCHR: 
   PUSH ACC
   PUSH B
   SETB P1.3
   MOV B,A
   ACALL COMMON
   ACALL DELAY
   MOV A,B
   SWAP A
   ACALL COMMON
   ACALL DELAY
   POP B
   POP ACC
   RET
;---- Subroutine to write COMMAND in A to the  LCD   ------- 
CMD:
   CLR P1.3
   MOV B,A
   ACALL COMMON
   ACALL DELAY
   MOV A,B
   SWAP A
   ACALL COMMON
   ACALL DELAY
   RET
;----- Common operation for CHAR write and COMMAND write  
COMMON: 
  
   ANL a,#11110000B
   ANL P1, #00001111B
   ORL P1,A
   SETB P1.2
   CLR P1.2
   RET

;---- Subroutine to write A STRING character by character  ------- 
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

clear:
MOV A,#01H
ACALL CMD
MOV R7,#14
WAIT: ACALL DELAY
DJNZ R7,WAIT
ret 



MESG1: DB "WELCEOM TO..."
DB 0
MESG2: DB "TV KW SHOP"
DB 0
MESG3: DB "SELECT:"
DB 0
MESG4: DB "1.SON 2.WAN 3.SHARP"
DB 0
MESG5: DB "YOUR TYPE:"
DB 0
MESG6: DB "WARENTLY "
DB 0
MESG7: DB "1-ONE 2-TWO YEAR"
DB 0
MESG8: DB "YOU SELECT:"
DB 0
MESG9: DB "MAINTAINANCE:"
DB 0
MESG10: DB "1- YES 2-NO"
DB 0
MESG11: DB "DELIVERY:"
DB 0
MESG12: DB "ACTIVATE MEMBERSHIP:"
DB 0
MESG13: DB "NUMVER OF TV'S"
DB 0
MESG14: DB "YOU NEED TO PAY"
DB 0
MESG15: DB " WRONG ENTERY"
DB 0
MESG16: DB "PRESS SW0 TO CONT"
DB 0
MESG17: DB "1- REPEAT AGAIN"
DB 0
MESG18: DB "2- EXIT"
DB 0
MESG19: DB "THANK YOU "
DB 0


KCODE3: DB '1','2','3' 
KCODE2: DB '4','5','6' 
KCODE1: DB '7','8','9' 
KCODE0: DB '*','0','#' 

END



