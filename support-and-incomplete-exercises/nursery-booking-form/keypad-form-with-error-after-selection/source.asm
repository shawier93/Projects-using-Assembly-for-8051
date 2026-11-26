ORG 00H
ACALL INLCD	; initialize LCD
;; preparing 1st row to display
    MOV A,#80H  ;;1st line 1st position
    ACALL CMD
;;WECLOME MESSAG 
    MOV DPTR,#STR1
    ACALL WSTR
    ACALL DELAY
	ACALL DELAY
;CLEAR LCD
	MOV A,#01H  
	ACALL CMD
	ACALL DELAY
;; DISPLAY CAT MESSGAE 
    MOV A,#80H  ;;1st line 1st position
    ACALL CMD
	MOV DPTR,#STR2
    ACALL WSTR
    ACALL DELAY
    MOV A,#0C0H  ;;1st line 1st position
    ACALL CMD
	MOV DPTR,#STR22
    ACALL WSTR
	ACALL DELAY
;; TAKE CATEGORY NUMBER AND SAVE IT 
    MOV A,#0CEH  ;;1st line 1st position
    ACALL CMD
    ACALL KEYPAD  ;; to get first character
	ACALL WCHR	
    ANL A,#0FH;
    MOV 30H,A;
	ACALL DELAY
	ACALL DELAY
;CLEAR LCD
fIRSTCLASS:	MOV A,#01H  
	ACALL CMD
	ACALL DELAY
;; DISPLAY FIRST CLASS MESSSGAES
    MOV A,#80H  ;;1st line 1st position
    ACALL CMD
	MOV DPTR,#STR3
    ACALL WSTR
    ACALL DELAY
    MOV A,#0C0H  ;;1st line 1st position
    ACALL CMD
	MOV DPTR,#STR9
    ACALL WSTR
	ACALL DELAY
;; TAKE CATEGORY NUMBER AND SAVE IT 
    MOV A,#0CEH  ;;1st line 1st position
    ACALL CMD
    ACALL KEYPAD  ;; to get first character
	ACALL WCHR	
    ANL A,#0FH;
   ;CHECK
    CJNE A,#2, NOO
	SJMP OKK
	NOO:CJNE A,#1,NOO1 
    SJMP OKK
    NOO1:ACALL ERR
	OKK:
    MOV 31H,A;
	ACALL DELAY
	ACALL DELAY

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;ERROR ENTERING 
ERR:
;CLEAR LCD
	MOV A,#01H  
	ACALL CMD
	ACALL DELAY

    MOV A,#80H  ;;1st line 1st position
    ACALL CMD
	MOV DPTR,#ERROR
    ACALL WSTR
    ACALL DELAY
    ACALL DELAY

RET
;.............KEYPAD............
KEYPAD: 
       MOV P0,#01110000B  	;make bits P0.4-P0.6input (columns) 
K1:    MOV P0,#01110000B           
       MOV A,P0          	;read all col. (ensure all keys open)
       ANL A,#01110000B   	;masked unused bits
       CJNE A,#01110000B,K1     ;check til all keys released
K2:           
       MOV A,P0                 ;see if any key is pressed
       ANL A,#01110000B         ;mask unused bits
       CJNE A,#01110000B,OVER1  ;key pressed, await closure
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
       LJMP K2                  ;if none, false input, repeat
ROW_0: MOV DPTR,#KCODE0         ;set DPTR=start of row 0        
       SJMP FIND                ;find col. key belongs to
ROW_1: MOV DPTR,#KCODE1         ;set DPTR=start of row 1
       SJMP FIND                ;find col. key belongs to
ROW_2: MOV DPTR,#KCODE2         ;set DPTR=start of row 2 
       SJMP FIND                ;find col. key belongs to
ROW_3: MOV DPTR,#KCODE3         ;set DPTR=start of row 3

FIND:  
       RLC A			;skip D7 data (unused)
FIND1:
       RLC A                    ;see if any CY bit low
       JNC MATCH                ;if zero, get the key number        
       INC DPTR                 ;point to next col. address
       SJMP FIND1               ;keep searching
MATCH: CLR A                    ;set A=0 (match is found)
       MOVC A,@A+DPTR           ;get key number from table
       RET

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
;---- Subroutine to write COMMAND in A to the  LCD   ------- 
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
       MOVC    A,@A+DPTR   ; move character to A 
       JZ Exit1  
PRINT:
        ACALL    WCHR     ; call procedure to write a CHAR 
        INC DPTR          ; get next character        
       AJMP    CONT1      ; go to CONT1  
EXIT1: POP     ACC        ; restore A 
        RET 
  
; -------  procedure delay -------
LDELAY:	
	MOV R0, #50	
  HH:	DJNZ R0,HH
	RET
DELAY:
	MOV R0, #50
 HE: MOV R7,#100	
 HE1:DJNZ R7, HE1	
	DJNZ R0,HE
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rom ;;

STR1: DB "WEL.TO KUW NURS."
      DB 0
STR2: DB "Enter cat. numb."
      DB 0
STR22: DB "D<2 2<D<4 D>4"
      DB 0
STR3: DB "FIRST CLASS:"
      DB 0
STR4: DB "ADD BUS SERVICES?"
      DB 0
STR5: DB "NUMBER OF TICKESTS?"
      DB 0
STR6: DB "ACT. MEMBERSHIP?"
      DB 0
STR7: DB "TOTAL COST"
      DB 0
STR8: DB "** THANK YOU ***"
      DB 0
STR9:  DB "1- YES  2-NO"
       DB 0
ERROR:DB "TRY AGAIN.."
       DB 0 
		 
;ASCII LOOK-UP TABLE FOR EACH ROW
    
KCODE3: DB '1','2','3' ;Row0 ASCII codes
KCODE2: DB '4','5','6' ;Row1
KCODE1: DB '7','8','9' ;Row2
KCODE0: DB '*','0','#' ;Row3
 
END


