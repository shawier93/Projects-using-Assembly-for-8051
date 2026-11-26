	ORG 00H	
    JMP MAIN 
    ORG 0003H
    JMP EX0ISR

    ORG 0030H
MAIN:

		MOV 33H,#9 ;GOLD QUANTITY
		MOV 43H,#5 ;GOLD PRICE
		MOV 34H,#9  ;SILVER QUANTITY
		MOV 44H,#3 ;SILVER PRICE



    	ACALL INLCD	
		MOV A,#80H  
		ACALL CMD
		MOV DPTR,#STR1
		ACALL WSTR
		ACALL TMSEC
		ACALL ClearLCD

MAIN1:
		ACALL INLCD	
		MOV A,#80H  
		ACALL CMD
		MOV DPTR,#STR2
		ACALL WSTR


		ACALL KEYPAD 
		SUBB A,#30H
		MOV 30H,A
;;;;
       MOV R5,30H
       CJNE R5,#3,NEXT1
	    MOV A,#80H 
     	ACALL CMD
    	MOV DPTR, #STR7 
    	ACALL WSTR 
    	ACALL TMSEC
    	ACALL ClearLCD
        LJMP STOP
       
NEXT1:
	
		ACALL INLCD	
		MOV A,#80H  
		ACALL CMD
		MOV DPTR,#STR3
		ACALL WSTR
	
		ACALL KEYPAD 
    	SUBB A,#30H
		MOV 40H,A
        
		MOV R7,30H	
		MOV R6,40H	
       

	CJNE R7,#1,SILVER	;IF NOT 2 JUMP TO SILVER

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
		AJMP MAIN1


PRICE:	MOV A,#0c0H
		ACALL CMD 
		MOV DPTR,#STR4
		ACALL WSTR

		MOV A,50H
		MOV B,#10
		DIV AB
		JZ SKIP1
		ADD A,#30H
		ACALL WCHR
		

SKIP1:	MOV A,B
		ADD A,#30H 
		ACALL WCHR


		MOV DPTR,#STR5
		ACALL WSTR
		ACALL TMSEC

		ACALL ClearLCD
		AJMP MAIN1
	
		

	

	STOP: SJMP STOP
; WAIT UNTIL # IS PRESSED 

EX0ISR:
X1:
ACALL KEYPAD  
CJNE A,#'#',X1
RETI



;.............KEYPAD............
KEYPAD: 
       MOV P0,#01110000B  ;make bits P0.4-P0.6 input
K1:    MOV P0,#01110000B           
       MOV A,P0    ;read all col. (ensure all keys open)
       ANL A,#01110000B   	;masked unused bits
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
       RLC A			;skip D7 data (unused)
FIND1:
       RLC A                    ;see if any CY bit low
       JNC MATCH     ;if zero, get the key number        
       INC DPTR              ;point to next col. address
       SJMP FIND1               ;keep searching
MATCH: CLR A                    ;set A=0 (match is found)
       MOVC A,@A+DPTR         ;get key number from table
      

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
STR2: DB "1.G 2.S 3.E"
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
