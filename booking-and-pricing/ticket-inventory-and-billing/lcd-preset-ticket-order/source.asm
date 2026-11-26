	ORG 0H	
START:
		MOV 33H,#9 ;GOLD QUANTITY
		MOV 43H,#5 ;GOLD PRICE
		MOV 34H,#9  ;SILVER QUANTITY
		MOV 44H,#3 ;SILVER PRICE

		MOV 30H,#2 ;TICKET TYPE
		MOV 40H,#4	;TICKET QUANTITY


    	ACALL INLCD	
		MOV A,#80H  
		ACALL CMD
		MOV DPTR,#STR1
		ACALL WSTR
		ACALL TMSEC
		ACALL ClearLCD
MAIN:
		ACALL INLCD	
		MOV A,#80H  
		ACALL CMD
		MOV DPTR,#STR2
		ACALL WSTR
		MOV A,30H
		ADD A,#30H ; CONVERT TO ASCII
		ACALL WCHR
		ACALL TMSEC
		ACALL ClearLCD

;;;;;;
        MOV R5,30H
        CJNE R5,#3,NEXT
	    MOV A,#80H 
    	ACALL CMD
    	MOV DPTR, #STR7 
    	ACALL WSTR 
    	ACALL TMSEC
    	ACALL ClearLCD
        LJMP STOP
NEXT:
		ACALL INLCD	
		MOV A,#80H  
		ACALL CMD
		MOV DPTR,#STR3
		ACALL WSTR
		MOV A,40H
		ADD A,#30H ; CONVERT TO ASCII
		ACALL WCHR
		ACALL TMSEC

		
		MOV R7,30H	
		MOV R6,40H	
		CJNE R7,#1,SILVER	;IF NOT 1 JUMP TO SILVER

		MOV A,33H
		SUBB A,R6 ;CHECK QUANTITY
		JB  ACC.7,MAXAMOUNT
		MOV 33H,A ;UPDATE QUANTITY
		MOV A,R6
		MOV B,43H
		MUL AB
		MOV 50H,A ;CALCULATE AND STORE TOTAL PRICE
		
		SJMP PRICE

SILVER:
		MOV A,34H 
		SUBB A,R6 ;CHECK QUANTITY
		JB  ACC.7,MAXAMOUNT
		MOV 34H,A ;UPDATE QUANTITY
		MOV A,R6
		MOV B,44H
		MUL AB
		MOV 50H,A  ;CALCULATE AND STORE TOTAL PRICE
		SJMP PRICE

MAXAMOUNT:
		ACALL INLCD	
		MOV A,#80H  
		ACALL CMD
		MOV DPTR,#STR6
		ACALL WSTR
		ACALL TMSEC
		ACALL ClearLCD
		AJMP MAIN

PRICE:	MOV A,#0c0H
		ACALL CMD 
		MOV DPTR,#STR4
		ACALL WSTR

		MOV A,50H
		MOV B,#10
		DIV AB
		JZ SKIP1
		ADD A,#30H; CONVERT TO ASCII
		ACALL WCHR
		


SKIP1:	MOV A,B
		ADD A,#30H 
		ACALL WCHR


		MOV DPTR,#STR5
		ACALL WSTR
		ACALL TMSEC

		ACALL ClearLCD
		AJMP MAIN
	
		

	

	STOP: SJMP STOP







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

;- Subroutine to write character in A to the  LCD----- 
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

;--Subroutine to write COMMAND in A to the  LCD---- 
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

;--Subroutine to write A STRING character by character-
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

ClearLCD:
MOV A,#01H
ACALL CMD
MOV R7,#14
WAIT11: ACALL LDELAY
DJNZ R7,WAIT11
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
;ASCII LOOK-UP TABLE FOR EACH ROW
KCODE3: DB '1','2','3' ;Row0 ASCII codes
KCODE2: DB '4','5','6' ;Row1
KCODE1: DB '7','8','9' ;Row2
KCODE0: DB '*','0','#' ;Row

STR1: DB "Welcome"
	DB 0
STR2: DB "1.G 2.S 3.E "
   	DB 0
STR3: DB "Tickets: "
	DB 0
STR4: DB "OK "
	DB 0
STR5: DB " KD"
	DB 0
STR6: DB "NO Sorry"
	DB 0

STR7: DB "THANKS"
     DB 0
