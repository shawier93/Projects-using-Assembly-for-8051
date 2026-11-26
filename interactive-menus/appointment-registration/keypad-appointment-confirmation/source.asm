ORG 00H
ACALL INLCD 
; 1--> FOR YES , 0--> FOR NO
MOV 30H,#0; TESTED FOR CORONA +VE OR NOT
MOV 31H,#4 ;MONTH WHEN YOU CATCH CORONA
MOV 32H,#0 ;TAKE FIRST DOZE
MOV 36H,#11 ; FIRST DOZE DATA IF TAKEN

;RANDOM INITIAL VALUES
MOV 33H,#1 ; APPOINTMENT OF DOZE
MOV 34H,#100  ; DAY OF DOZE
MOV 35H,#0  ; CONFIRM


ACALL WELCOME
START:

ACALL MENU ;;MENU MESSAGE
ACALL KEYPAD
SUBB A,#30H

CJNE A,#0,POSITIVE
ACALL NEG
SJMP BACK

POSITIVE:
CJNE A,#1,ERROR
ACALL POS
SJMP BACK

ERROR:
ACALL ERRORR
SJMP BACK

BACK:
SJMP START


;*************
NEG:

;Did You take first doze?
ACALL SHOWNEG
MOV A,32H
CJNE A,#0,SecondDozee
MOV 34H,#0 ; TOMORROW 
ACALL APPOINTMENT
ACALL PRONEG2
ACALL CONFIRMM
SJMP BACK3

SecondDozee:
; DATA OF FIRST DOZE

CJNE A,#1,ERROR3
ACALL PRONEG1
MOV R7,36H
MOV A,R7
ADD A,#2
ACALL CHEACK
MOV 33H,A ;MONTH OF DOZE
MOV 34H,#4 ; DAY OF DOZE
ACALL APPOINTMENT
ACALL CONFIRMM
SJMP BACK3

ERROR3:
SJMP BACK3
BACK3:
ACALL CONFIRM
RET
;*************
POS:
; WHEN YOU CATCH CRONA?
ACALL SHOWPOS
MOV R7,31H
;Did You take first doze?
MOV A,32H
CJNE A,#0,SecondDoze
;appointment of 1st doze
ACALL APPOINTMENT
MOV A,R7
ADD A,#3
ACALL CHEACK
MOV 33H,A ;MONTH OF DOZE
MOV 34H,#1 ; DAY OF DOZE
ACALL CONFIRMM
SJMP BACK1

SecondDoze:
CJNE A,#1,ERROR1
;APPOINTMENT OF 2ND DOZE AFTER 4 MONTH
ACALL APPOINTMENT
MOV A,R7
ADD A,#4
ACALL CHEACK
MOV 33H,A ;MONTH OF DOZE
MOV 34H,#2 ; DAY OF  DOZE
ACALL CONFIRMM 
SJMP BACK1

ERROR1:

BACK1:
ACALL CONFIRM

RET

;**********
CHEACK:
CJNE A,#12,CONTINUE
SJMP BACK2
CONTINUE:
JC BACK2  ; SKIP IF CARRY FLAG =1, WHICH MEAN THAT A<12
SUBB A,#12

BACK2:
RET

;**********
CONFIRM:
MOV A,35H
CJNE A,#1,CONFIRM
RET
;*********
WELCOME:
MOV A, #80H ;  1st line position 3
ACALL CMD
MOV DPTR, #STR1
ACALL WSTR
ACALL DELAY

RET

MENU:
ACALL CLEAR
MOV A, #80H ;  1st line position 3
ACALL CMD
MOV DPTR, #STR2
ACALL WSTR
ACALL DELAY
MOV A, #0C0H ;  1st line position 3
ACALL CMD
MOV DPTR, #STR3
ACALL WSTR
ACALL DELAY

MOV A, #80H ;  1st line position 3
ACALL CMD
MOV DPTR, #STR4
ACALL WSTR
MOV A, #0C0H ;  1st line position 3
ACALL CMD
MOV DPTR, #OPTION
ACALL WSTR
ACALL DELAY
RET

;******
SHOWPOS:
ACALL CLEAR
MOV A, #80H ;  1st line position 3
ACALL CMD
MOV DPTR, #STR5
ACALL WSTR
ACALL DELAY
MOV A, #0C0H ;  1st line position 3
ACALL CMD
MOV DPTR, #STR6
ACALL WSTR
ACALL DELAY
ACALL CLEAR
MOV A, #80H ;  1st line position 3
ACALL CMD
MOV DPTR, #STR7
ACALL WSTR
MOV A, #0C0H ;  1st line position 3
ACALL CMD
MOV DPTR, #OPTION
ACALL WSTR
ACALL DELAY
RET

;******
APPOINTMENT:
ACALL CLEAR
MOV A, #80H ;  1st line position 3
ACALL CMD
MOV DPTR, #STR8
ACALL WSTR
ACALL DELAY
MOV A, #0C0H ;  1st line position 3
ACALL CMD
MOV DPTR, #STR9
ACALL WSTR
ACALL DELAY
ACALL CLEAR 

MOV A,33H
ACALL WCHR
MOV A,' '
ACALL WCHR
MOV A,34H
ACALL WCHR
ACALL DELAY
RET

;******
SHOWNEG:
ACALL CLEAR
MOV A, #80H ;  1st line position 3
ACALL CMD
MOV DPTR, #STR7
ACALL WSTR
ACALL DELAY
MOV A, #0C0H ;  1st line position 3
ACALL CMD
MOV DPTR, #OPTION
ACALL WSTR
ACALL DELAY
RET

PRONEG1:
ACALL CLEAR
MOV A, #80H ;  1st line position 3
ACALL CMD
MOV DPTR, #STR10
ACALL WSTR
ACALL DELAY
RET

PRONEG2:
MOV A, #0C0H ;  1st line position 3
ACALL CMD
MOV DPTR, #TOMORROW
ACALL WSTR
ACALL DELAY
RET

;******
CONFIRM:
ACALL CLEAR
MOV A, #80H ;  1st line position 3
ACALL CMD
MOV DPTR, #CONF
ACALL WSTR
ACALL DELAY
MOV A, #0C0H ;  1st line position 3
ACALL CMD
MOV DPTR, #OPTION
ACALL WSTR
ACALL DELAY
RET

CONFIRMM:
ACALL CLEAR
MOV A, #80H ;  1st line position 3
ACALL CMD
MOV DPTR, #STR11
ACALL WSTR
ACALL DELAY
RET


;***********

;-- LCD Initialization Procedure starts here ----- 
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
 ;--- End  of  LCD initialization  ----- 

;---- Subroutine to write character in A to the  LCD ------- 
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
;---- Subroutine to write COMMAND in A to the  LCD   
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
       MOVC    A,@A+DPTR      ; move character to A 
       JZ Exit1  
PRINT:
        ACALL    WCHR                ; call procedure to write a CHAR 
        INC DPTR                       ; get next character        
       AJMP    CONT1      ; go to CONT1  
EXIT1: POP     ACC                        ; restore A 
        RET 
  
; -------  procedure delay -------
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
RET

DELAY:
MOV	R5,#2
X3:  MOV	R4,#20
X2:  MOV	R3,#250
X1:  DJNZ	R3,X1
DJNZ	R4,X2
DJNZ	R5,X3 
RET

;.............KEYPAD............
KEYPAD: 
       MOV P0,#01110000B  ;make bits P0.4-P0.6 input
K1:    MOV P0,#01110000B           
       MOV A,P0    ;read all col. (ensure all keys open)
       ANL A,#01110000B          ;masked unused bits
       CJNE A,#01110000B,K1 ;check til all keys released
K2:           
       MOV A,P0                ;see if any key is pressed
       ANL A,#01110000B         ;mask unused bits
       CJNE A,#01110000B,OVER1 ;key pressed, await closure
       SJMP K2                  ;check if key pressed
OVER1: 
       MOV P0,#01111110B        ;ground row 0
       MOV A,P0                 ;read all columns
       ANL A,#01110000B         ;mask unused bits
       CJNE A,#01110000B,ROW_0  ;key row 0, find the col.
       MOV P0,#01111101B        ;ground row 1
       MOV A,P0                 ;read all columns
       ANL A,#01110000B         ;mask unused bits 
       CJNE A,#01110000B,ROW_1  ;keyrow 1, find the col.
       MOV P0,#01111011B        ;ground row 2
       MOV A,P0                 ;read all columns
       ANL A,#01110000B         ;mask unused bits
       CJNE A,#01110000B,ROW_2  ;key row 2, find the col.
       MOV P0,#01110111B        ;ground row 3
       MOV A,P0                 ;read all columns
       ANL A,#01110000B         ;mask unused bits
       CJNE A,#01110000B,ROW_3  ;keyrow 3, find the col.
       LJMP K2               ;if none, false input, repeat
ROW_0: MOV DPTR,#KCODE0  ;set DPTR=start of row 0        
       SJMP FIND                ;find col. key belongs to
ROW_1: MOV DPTR,#KCODE1         ;set DPTR=start of row 1
       SJMP FIND                ;find col. key belongs to
ROW_2: MOV DPTR,#KCODE2         ;set DPTR=start of row 2 
       SJMP FIND                ;find col. key belongs to
ROW_3: MOV DPTR,#KCODE3         ;set DPTR=start of row 3

FIND:  
       RLC A                    ;skip D7 data (unused)
FIND1:
       RLC A                    ;see if any CY bit low
       JNC MATCH     ;if zero, get the key number        
       INC DPTR              ;point to next col. address
       SJMP FIND1               ;keep searching
MATCH: CLR A                    ;set A=0 (match is found)
       MOVC A,@A+DPTR         ;get key number from table
       RET

;ASCII LOOK-UP TABLE FOR EACH ROW
KCODE3: DB '1','2','3' ;Row0 ASCII codes
KCODE2: DB '4','5','6' ;Row1
KCODE1: DB '7','8','9' ;Row2
KCODE0: DB '*','0','#' ;Row3
;***********  
STR1: DB "...WELCOME..."
	  DB 0

STR2: DB "1-VACCINE REG.."
      DB 0
STR3: DB "2-EXIT"
	  DB 0
STR4: DB "GOT CRONA VIRUS?"
	  DB 0
OPTION: DB "1- YES  2- NO"
	  DB 0
STR5: DB "WHEN DID YOU "
	  DB 0
STR6: DB "CATCH THE VIRUS"
	  DB 0
STR7: DB "TOOK 1ST DOZE?"
	  DB 0
STR8: DB "YOUR NEXT DOZE "
	  DB 0
STR9: DB "WILL BE IN "
	  DB 0
TOMORROW: DB "TOMORROW"
	  DB 0
CONF: DB "CONFIRM?"
      DB 0
STR10: DB "WHEN"
DB 0
STR11: DB "WRONG ENTERY"
	DB 0

