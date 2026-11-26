;Gold category is the Selected seat category 
;Number of tickets is 6

  ORG 00H
Main:
  MOV 30H,#01H ; store the selected seat category (Gold) (01H) to RAM location 30H
  MOV 33H,#09H ; AVAILABE TICKETS FOR GOLD
  MOV 34H,#09H ;AVAILABE TICKETS FOR SILVER
  MOV 40H,#06H ; store number of tickets (06H) to RAM location 40H

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Calculate the amount needed to pay
 	 MOV A, 30H ;Load the selected seat category to A
	 MOV R2, A

;;;;;;;;;;;;;;;;;;;;;;;;;;;
GOLD_TICKETS:	
	 CJNE R2, #1, SILVER_TICKETS;Gold category 
   	 MOV A, 40H ;Load number of tickets to A
 	 MOV R1, A

;Check if number of selected tickets is greater than 9
MOV A,33H ;load the available tickets for gold
MOV B,A
MOV R3,A
MOV A,R3	 
CJNE A, B, OTHERWISE 
	 SJMP LESS_EQUAL
OTHERWISE: 
	 JC LESS_EQUAL ; Jump if selected seats less than GOLD_SEATS
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
	 SJMP EXIT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SILVER_TICKETS: 
     CJNE R2, #2, EXIT ; Silver category 
	 MOV A, 40H ;Load number of tickets to A
	 MOV R1, A
	MOV A,34H
MOV B,A
MOV R3,A
MOV A,R1
;Check if number of selected tickets is greater than 9
 	 CJNE A, B,OTHERWISE0
	 SJMP LESS_EQUAL0
OTHERWISE0: 
	 JC LESS_EQUAL0 ; Jump if selected seats less than GOLD_SEATS
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
	 SJMP EXIT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GOLD_Price: DB 5

SILVER_Price: DB 3


EXIT:
END
