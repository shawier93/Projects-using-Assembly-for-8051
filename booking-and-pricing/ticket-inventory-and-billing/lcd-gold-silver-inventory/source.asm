;Gold category is the Selected seat category 
;Number of tickets is 4

  ORG 00H
Main:
  ACALL INLCD
  MOV 30H,#01H ; store the selected seat category (Gold)
  MOV 33H,#09H ; AVAILABE TICKETS FOR GOLD
  MOV 34H,#09H ;AVAILABE TICKETS FOR SILVER
  MOV 40H,#04H ; store number of tickets 06H 

WELCOME:
	 MOV A, #1H ;Clear the displayed message of LCD
	 ACALL CMD
	 ACALL CLR_DELAY 
 	 MOV A,#80H ;LCD cursor goes to first position of first line
	 ACALL CMD
	 MOV DPTR, #WELCOME_MSG 
 	 ACALL WSTR 
  	 ACALL DELAY_2SEC ;delay approxametly 2 seconds

MAIN_MENUE:
	MOV A, #1H ;Clear the displayed message of LCD
	ACALL CMD
	ACALL CLR_DELAY ;Short delay 
	MOV A,#80H ;LCD cursor goes to first position of first line
	ACALL CMD
	MOV DPTR, #MENUE_MSG
	ACALL WSTR ;Display string
	MOV A, 30H 
	MOV R2, A
	ADD A, #30H ; convert to ASCII 
	ACALL WCHR ;Display character
	ACALL DELAY_2SEC ;delay approxametly 2 seconds
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;
GOLD_TICKETS:	
	 CJNE R2, #1, SILVER_TICKETS 
   	 MOV A, 40H ;Load number of tickets to A
 	 MOV R1, A
	MOV A, #1H ;Clear the displayed message of LCD
	ACALL CMD
	ACALL CLR_DELAY ;Short delay for clrearing the displayed message
	MOV A,#80H ;LCD cursor goes to first position of first line
	ACALL CMD
	MOV DPTR, #TICKETS_MSG 
	ACALL WSTR ;Display string
MOV  A,R1
ACALL DISP_VALUE

	;;;;;;;;;;

;Check if number of selected tickets is greater than 9

MOV A,33H ;load the available tickets for gold
MOV B,A
MOV R3,A
MOV A,R1 
CJNE A, B, OTHERWISE 
	 SJMP LESS_EQUAL
OTHERWISE: 
	 JC LESS_EQUAL ; Jump if selected seats less than GOLD SEATS

	MOV A,#0C0H ;LCD cursor goes to first position of second line
	ACALL CMD
	MOV DPTR, #Sorry_MSG
	ACALL WSTR ;Display string
	ACALL DELAY_2SEC ;delay approxametly 2 seconds
     SJMP GOLD_TICKETS ;if selected seats greater than GOLD_SEATS


LESS_EQUAL:
 MOV A, R3
CLR C
SUBB A,R1
MOV 33H,A 
MOV A,R1
   	 MOV B, A ;Store number of tickets to B
	 CLR A
  	 MOV DPTR, #GOLD_Price
	 MOVC A, @A+DPTR
  	 MUL AB ;Calculatethe the amount needed to pay
	 MOV 50H,A ;store the amount needed to RAM location 50H
;;;;;;;;;;;;;;;;;;;
	MOV R4, A
	MOV A,#0C0H ;LCD cursor goes to first position of second line
	ACALL CMD
	MOV DPTR, #TICKETS_MSG2
	ACALL WSTR ;Display string
	MOV A, R4
	ACALL DISP_VALUE
	MOV DPTR, #TICKETS_MSG3
	ACALL WSTR ;Display string
	ACALL DELAY_2SEC ;delay approxametly 2 seconds
	LJMP MAIN_MENUE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SILVER_TICKETS: 
     CJNE R2, #2, EXIT ; Silver category 
	 MOV A, 40H ;Load number of tickets to A
	 MOV R1, A
	MOV A, #1H ;Clear the displayed message of LCD
	ACALL CMD
	ACALL CLR_DELAY ;Short delay for clrearing the displayed message
	MOV A,#80H ;LCD cursor goes to first position of first line
	ACALL CMD
	MOV DPTR, #TICKETS_MSG 
	ACALL WSTR ;Display string
	MOV A, R1
	ACALL DISP_VALUE
   
;;;;
	MOV A,34H
MOV B,A
MOV R3,A
MOV A,R1
;Check if number of selected tickets is greater than 9
 	 CJNE A, B,OTHERWISE0
	 SJMP LESS_EQUAL0
OTHERWISE0: 
	 JC LESS_EQUAL0 ; Jump if selected seats less than GOLD_SEATS
	MOV A,#0C0H ;LCD cursor goes to first position of second line
	ACALL CMD
	MOV DPTR, #Sorry_MSG
	ACALL WSTR ;Display string
	ACALL DELAY_2SEC ;delay approxametly 2 seconds
	 SJMP SILVER_TICKETS ;if selected seats greater than GOLD_SEATS

LESS_EQUAL0:
	 MOV A, R3
CLR C
SUBB A,R1
MOV 34H,A
MOV A,R1
 	 MOV B, A ;Store number of tickets to B
	 CLR A
  	 MOV DPTR, #SILVER_Price
	 MOVC A, @A+DPTR
	 MUL AB; Calculatethe the amount needed to pay
	 MOV 50H,A; store the amount needed to RAM location 50H
MOV R4, A
	MOV A,#0C0H ;LCD cursor goes to first position of second line
	ACALL CMD
	MOV DPTR, #TICKETS_MSG2
	ACALL WSTR ;Display string
	MOV A, R4
	ACALL DISP_VALUE
	MOV DPTR, #TICKETS_MSG3
	ACALL WSTR ;Display string
	ACALL DELAY_2SEC ;delay approxametly 2 seconds
	LJMP MAIN_MENUE

EXIT:
	MOV A, #1H ;Clear the displayed message of LCD
	ACALL CMD
	ACALL CLR_DELAY ;Short delay for clrearing the displayed message
	MOV A,#80H ;LCD cursor goes to first position of first line
	ACALL CMD
	MOV DPTR, #Thanks_MSG 
	ACALL WSTR ;Display string
	ACALL DELAY_2SEC
	LJMP END_PROGRAM
	
	
DISP_VALUE:
			mov b, #10
			Div ab
			Add a , #30H ;Convert to Ascii 
			Acall WCHR
			Mov a, b
			Add a , #30H ;Convert to Ascii 
			Acall WCHR
			RET

;;;;;;;;;;;;;;;;

;---- Subroutine to write A STRING character by character ------- 
WSTR:
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
CLR_DELAY:
	MOV R7, #14
LP2:ACALL LDELAY
	DJNZ R7, LP2
	RET

; DELAY TIME USING TIMER (20 msec)
TMSEC:
	MOV TMOD,#01H ; set timer 0 as (timer) in mode 1
	MOV TL0,#0DCH ; Timer0, low byte
	MOV TH0,#6FH ; Timer0, high byte
	SETB TR0 ; Start timer0
BACK:
	JNB TF0,BACK ; Check timer overflow flag
	CLR TR0 ; Stop timer0
	CLR TF0 ; Clear timer-0 overflow flag TF0
RET

;Subroutine for delay approxametly 2 seconds
DELAY_2SEC:
	MOV R0, #4 ;For delay approxametly 2 seconds
LP1:
	ACALL TMSEC
	DJNZ R0, LP1
	RET
;;;;;;;;;;;;;;;;;;;

;Data
GOLD_Price: DB 5
SILVER_Price: DB 3
;Displayed messages
;;; Messages ;;;
WELCOME_MSG: DB "Welcome"
NULL1: DB 0
MENUE_MSG: DB "1.G 2.S 3.E: "
NULL2: DB 0
TICKETS_MSG: DB "Tickets: "
NULL3: DB 0
TICKETS_MSG2: DB "OK "
NULL4: DB 0
TICKETS_MSG3: DB " KD"
NULL5: DB 0
Sorry_MSG: DB "NO Sorry"
NULL6: DB 0
Thanks_MSG: DB "Thanks"
NULL7: DB 0


END_PROGRAM: SJMP END_PROGRAM

END
