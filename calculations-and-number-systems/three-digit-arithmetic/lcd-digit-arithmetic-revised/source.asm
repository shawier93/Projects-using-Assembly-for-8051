
    ORG 0H
	ACALL INLCD	; initialize LCD
    MOV R7,#2
	MOV R6,#3
	MOV R5,#6

ACALL WELCOME
ACALL lDELAY
ACALL LDELAY

ACALL ADDITION 
;DISPLAY THE SUM
    MOV A,#01H   ; clear lcd 
    ACALL CMD
    ACALL LDELAY
   ACALL LDELAY
    CLR A
    MOV A,#85H  ;;1st line 1ST position
    ACALL CMD
    CLR A
    MOV DPTR,#STR3
    ACALL WSTR
    ACALL LDELAY
    MOV A,#0C0H   ;;2nd roe 1st position
    ACALL CMD
    MOV A,R3  
    MOV B,#10;
    DIV AB; 
    ADD A,#30H
   	ACALL WCHR	   ;; display character on LCD
    MOV A,B
    ADD A,#30H
    ACALL WCHR	    ;; display / on LCD
    ACALL LDELAY
    ACALL LDELAY


 


;;;;
ACALL CONV
MOV A,R7  ; NEW SUM
MOV B,#10
DIV AB
MOV 30H,B
MOV B,#10
DIV AB
MOV 31H, B
MOV 32H,A
ACALL LDELAY
ACALL LDELAY
ACALL LDELAY


MOV A,#1H   ; clear lcd 
 ACALL CMD
 Acall TMSEC   ;; WAIT 50 MS
  MOV A,#0C0H   ;;2nd roe 1st position
  ACALL CMD

 MOV A,30H
 ADD A,#30H
 ACALL WCHR	
  MOV A,#0C3H   ;;2nd roe 1st position
  ACALL CMD
 MOV A,31H
 ADD A,#30H
 ACALL WCHR	

  MOV A,#0C5H   ;;2nd roe 1st position
  ACALL CMD
 MOV A,32H
 ADD A,#30H
 ACALL WCHR	



FINISH:	
	SJMP FINISH
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
WELCOME:
 MOV A,#80H  ;;1st line 3rd position
    ACALL CMD
    MOV DPTR,#STR1
    ACALL WSTR
    mov A,#0C0H   ;;2nd roe 1st position
    ACALL CMD
    MOV DPTR,#STR2
    ACALL WSTR
RET

ADDITION:
MOV A,R7
;ADD THE THREE DIGITS
ADD A,R6;
ADD A,R5;
MOV R3,A; SAVE THE SUM
RET

CONV:
; CONVERSION
MOV B,#100
MOV A,R7;
MUL AB
MOV R4,A,
; 2ND DIGIT
MOV B,#10
MOV A,R6;
MUL AB
MOV R2,A,
; 3RD AND NEW TOTAL SUM 
MOV A,R5;
ADD A,R2
ADD A,R4
;SUBTRACTION 
SUBB A,R3
MOV R7,A;
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
	DJNZ R0, $	
	RET


;;;;; DELAY TIME USING TIMER;;;;
TMSEC:  
	MOV   TMOD,#21H ; set timer 0 as timer MOD 1
	MOV   TL0,#0CAH  ; Timer0, low byte       
	MOV   TH0,#27H ; Timer0, high byte                          
	SETB  TR0                  ; Start timer0 
BACK:   
	JNB   TF0,BACK            ; Check timer overflow flag             
	CLR   TR0                  ; Stop timer0             
	CLR   TF0                 ; Clear timer-0 overflow flag TF0             
	RET              


STR1: DB "WELCOME TO...."
	  DB 0
STR2: DB "8051 DEMO       "
      DB 0
STR3: DB "....THE SUM IS..."
	  DB 0

 
END


MOV A,#1H   ; clear lcd 
    ACALL CMD
    Acall TMSEC   ;; WAIT 50 MS


