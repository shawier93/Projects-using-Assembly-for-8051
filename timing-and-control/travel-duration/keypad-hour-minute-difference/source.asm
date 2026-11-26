ORG 00H
;HH1 -->20H ARRIAVLE < DEPARTURE
;MM1 -->21H 
;HH2 -->30H DEPARTRE
;MM1 -->31H
;DURATION-HH-->40H
;DURATION-MM-->41H

ACALL INLCD 
ACALL FIRSTNUMBER
ACALL SECNUMBER

MOV A,30H
SUBB A,20H
MOV 40H,A ; DURATION-HH

MOV A,31H
CJNE A,21H,NEXT
NEXT:
; IF 31H> 21H CONTINUE SUB MINUTES
JC SMALLER
MOV A,31H
SUBB A,21H
MOV 41H,A
SJMP DURAT

SJMP EEND

SMALLER:
DEC 40H
MOV A,31H
ADD A,#60
SUBB A,21H
MOV 41H,A

DURAT:
MOV A,#01H   ; clear lcd 
ACALL CMD
ACALL DELAY
ACALL DELAY
MOV A,#80H  ;;1st line 
ACALL CMD
MOV DPTR,#STR3
ACALL WSTR
MOV A,#0C0H  
ACALL CMD

MOV R4,40H
ACALL CONV
MOV A,12H
ACALL WCHR
MOV A,13H
ACALL WCHR
MOV A,#'/'
ACALL WCHR

MOV R4,41H
ACALL CONV
MOV A,12H
ACALL WCHR
MOV A,13H
ACALL WCHR




EEND: SJMP EEND

FIRSTNUMBER:
MOV A,#01H   ; clear lcd 
ACALL CMD
ACALL DELAY
ACALL DELAY
MOV A,#80H  ;;1st line 
ACALL CMD
MOV DPTR,#STR2
ACALL WSTR
MOV A,#0C0H  
ACALL CMD
ACALL KEYPAD
ACALL WCHR
SUBB A,#30H
MOV 50H,A
ACALL KEYPAD
ACALL WCHR
SUBB A,#30H
MOV 51H,A
ACALL KEYPAD
ACALL WCHR
SUBB A,#30H
MOV 52H,A
ACALL KEYPAD
ACALL WCHR
SUBB A,#30H
MOV 53H,A

ACALL INCONV
MOV 30H,65H  ; HH1
MOV 31H,66H  ;MM1
RET

SECNUMBER:
MOV A,#01H   ; clear lcd 
ACALL CMD
ACALL DELAY
ACALL DELAY
MOV A,#80H  ;;1st line 
ACALL CMD
MOV DPTR,#STR1
ACALL WSTR
MOV A,#0C0H  
ACALL CMD
ACALL KEYPAD
ACALL WCHR
SUBB A,#30H
MOV 50H,A
ACALL KEYPAD
ACALL WCHR
SUBB A,#30H
MOV 51H,A
ACALL KEYPAD
ACALL WCHR
SUBB A,#30H
MOV 52H,A
ACALL KEYPAD
ACALL WCHR
SUBB A,#30H
MOV 53H,A

ACALL INCONV
MOV 20H,65H  ; HH2
MOV 21H,66H  ;MM2
RET

INCONV:
MOV A,50H
MOV 60H,A
; 2ND DIGIT
MOV A,51H
MOV 61H,A
MOV B,#10
MOV A,60H
MUL AB
ADD A,61H
MOV 65H,A

;minutes
MOV A,52H
MOV 60H,A
; 2ND DIGIT
MOV A,53H
MOV 61H,A
MOV B,#10
MOV A,60H
MUL AB
ADD A,61H
MOV 66H,A    
RET

CONV:
MOV B,#10 ;
MOV A,R4;
DIV AB
ADD A,#30H
MOV 12H,A
MOV A,B
ADD A,#30H
MOV 13H,A
RET

     DELAY:	
 	MOV R0, #250	
 HH:	DJNZ R0, HH	
 	RET
       
      ;------------
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
;---------
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
;-----------------------
;ASCII LOOK-UP TABLE FOR EACH ROW
KCODE3: DB '1','2','3' ;Row0 ASCII codes
KCODE2: DB '4','5','6' ;Row1
KCODE1: DB '7','8','9' ;Row2
KCODE0: DB '*','0','#' ;Row3


STR1: DB "Enter DEPARTURE"
	  DB 0
STR2: DB "ENTER ARRIAVLA "
      DB 0
STR3: DB "FLIGHT DURATION"
	  DB 0


RET
