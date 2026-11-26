
  ORG 00H
LJMP MAIN 
ORG 0003
LJMP START

Main:

	MOV IE,#10000001B ; Enable external interrupt INT0
SETB IT0 
  ACALL INLCD
  MOV 30H,#00H ; store the selected seat category (Gold)
  MOV 33H,#09H ; AVAILABE TICKETS FOR GOLD
  MOV 34H,#09H ;AVAILABE TICKETS FOR SILVER
  MOV 40H,#00H ; store number of tickets  
ACALL WELCOME

LOOP1:
ACALL KEYPAD
	CJNE A, #'#',LOOP1
	CLR P3.2
	SETB P3.2
	SJMP LOOP1
	
START:


MAIN_MENUE:
	MOV A, #1H ;Clear the displayed message of LCD
	ACALL CMD
	ACALL CLR_DELAY ;Short delay 
	MOV A,#80H ;LCD cursor goes to first position of first line
	ACALL CMD
	MOV DPTR, #MENUE_MSG
	ACALL WSTR ;Display string
ACALL KEYPAD
SUBB A,#30H
MOV 30H,A
	MOV R2, A
	ADD A, #30H ; convert to ASCII 
	ACALL WCHR ;Display character
	ACALL DELAY_2SEC ;delay approxametly 2 seconds
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;
GOLD_TICKETS:	
	 CJNE R2, #1, SILVER_TICKETS 
	MOV A, #1H ;Clear the displayed message of LCD
	ACALL CMD
	ACALL CLR_DELAY ;Short delay for clrearing the displayed message
	MOV A,#80H ;LCD cursor goes to first position of first line
	ACALL CMD
	MOV DPTR, #TICKETS_MSG 
	ACALL WSTR ;Display string
ACALL KEYPAD
SUBB A,#30H
MOV 40H,A
MOV  R1,A
ADD A,#30H
ACALL WCHR


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
    LJMP MAIN_MENUE 

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

	MOV A, #1H ;Clear the displayed message of LCD
	ACALL CMD
	ACALL CLR_DELAY ;Short delay for clrearing the displayed message
	MOV A,#80H ;LCD cursor goes to first position of first line
	ACALL CMD
	MOV DPTR, #TICKETS_MSG 
	ACALL WSTR ;Display string
ACALL KEYPAD
SUBB A,#30H
MOV 40H,A
	MOV R1,A
ADD A,#30H
ACALL WCHR

;Check if number of selected tickets is greater than 9
	MOV A,34H
MOV B,A
MOV R3,A
MOV A,R1

 	 CJNE A, B,OTHERWISE0
	 SJMP LESS_EQUAL0
OTHERWISE0: 
	 JC LESS_EQUAL0 ; Jump if selected seats less than GOLD_SEATS
	MOV A,#0C0H ;LCD cursor goes to first position of second line
	ACALL CMD
	MOV DPTR, #Sorry_MSG
	ACALL WSTR ;Display string
	ACALL DELAY_2SEC ;delay approxametly 2 seconds
	 LJMP MAIN_MENUE 
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
	LJMP EXIT_INT

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

EXIT_INT:
ACALL WELCOME
RETI

WELCOME:

	MOV A, #1H ;Clear the displayed message of LCD
	ACALL CMD
	ACALL CLR_DELAY ;Short delay for clrearing the displayed message
	MOV A,#80H ;LCD cursor goes to first position of first line
	ACALL CMD
	MOV DPTR, #WELCOME_MSG 
	ACALL WSTR ;Display string
	RET


	
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
;ASCII LOOK-UP TABLE FOR EACH ROW
KCODE3: DB '1','2','3' ;Row0 ASCII codes
KCODE2: DB '4','5','6' ;Row1
KCODE1: DB '7','8','9' ;Row2
KCODE0: DB '*','0','#' ;Row3


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
