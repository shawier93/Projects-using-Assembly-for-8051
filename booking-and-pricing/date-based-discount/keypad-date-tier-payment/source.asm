      org 0h
       
 ACALL INLCD   
 MOV 30H,#99	; AMOUNT OF SHIP
 MOV 31H,#19	;DATE OF TODAY
 MOV 32H,#0; DISCOUNT
 MOV P1,#00H
       
 CLR A;
 MOV P1,#0FFH
 MOV R3,#5
      FF:
 ACALL FLASHING
 ACALL DELAY
 DJNZ R3,FF
       
 ACALL INLCD
 ACALL WELCOME
 ACALL DELAY
       
 ; DISPLAY AMOUNT MESSGGE
 MOV A,#01H   ; clear lcd 
     ACALL CMD
     ACALL DELAY
 ACALL DELAY
 MOV A,#80H  ;;1st line 
 ACALL CMD
 MOV DPTR,#STR2
 ACALL WSTR
 MOV A,#0C5H  ; 2ND LINE
 ACALL CMD
 ACALL DELAY
 ACALL DELAY
ACALL KEYPAD  
MOV 50H,A
ACALL WCHR
ACALL KEYPAD 
 MOV 51H,A 
ACALL WCHR
ACALL INCONV
MOV 30H,45H

   
       
      ;DISPLAY TODAY DATA
 MOV A,#01H   ; clear lcd 
 ACALL CMD
 ACALL DELAY
 ACALL DELAY
 MOV A,#80H  ;;1st line 
 ACALL CMD
 MOV DPTR,#STR3
 ACALL WSTR
 MOV A,#0C5H  ; 2ND LINE
 ACALL CMD
 ACALL DELAY
 ACALL DELAY
  
ACALL KEYPAD  
MOV 50H,A
ACALL WCHR
ACALL KEYPAD 
 MOV 51H,A 
ACALL WCHR
ACALL DELAY 
ACALL INCONV
MOV 31H,45H
     

SJMP MAIN_MINU
CHECK: SJMP CHECK
 
  MAIN_MINU: 
     
 MOV A,31H
 MOV B,#1
      ;DAYS LATE 
 SUBB A,B;
 MOV 20H,A
; DISPLAY DATA LATE
 MOV A,#01H   ; clear lcd 
 ACALL CMD
 ACALL DELAY
 ACALL DELAY
 MOV A,#80H  ;;1st line 
 ACALL CMD
 MOV DPTR,#STR5
 ACALL WSTR
 MOV A,#0C5H  ; 2ND LINE
 ACALL CMD

 MOV R4,20H
 ACALL CONV
 MOV A,60H
 ACALL WCHR
 MOV A,61H
 ACALL WCHR
 MOV A,62H
 ACALL WCHR	
  
MOV A,20H
      ; DEVIDE THE DAYS BY 10 
 MOV B,#10   ; 0,7, 17, 27
 DIV AB  ; A = 0 OR 1 OR 2,3,4..
 MOV R1,B
 ;-----------------
 CJNE A,#0H,DISC2 
 CJNE R1,#0H, DISCO1
 	MOV A,#01H   ; clear lcd 
	 ACALL CMD
	 ACALL DELAY
     ACALL DELAY
  	MOV A,#80H  ;;1st line 
	 ACALL CMD
	 MOV DPTR,#STR4
 	ACALL WSTR 
; ---CALCUATE COST----  
	 MOV 32H,#0;
 	ACALL COST
 MOV A,#01H   ; clear lcd 
 ACALL CMD
 ACALL DELAY
 ACALL DELAY
 MOV A,#80H  ;;1st line 
 ACALL CMD
 MOV DPTR,#STR9
 ACALL WSTR
 MOV A,#0C5H  ; 2ND LINE
 ACALL CMD

 MOV R4,33H
 ACALL CONV
 MOV A,60H
 ACALL WCHR
 MOV A,61H
 ACALL WCHR
 MOV A,62H
 ACALL WCHR	
 	AJMP CHECK
 
DISC2: SJMP DISCO2      
 DISCO1:  ; 10% DISCOUNT
 CJNE A,#0H, DISCO2
	MOV A,#01H   ; clear lcd 
	 ACALL CMD
	 ACALL DELAY
	 ACALL DELAY
  	MOV A,#80H  ;;1st line 
	 ACALL CMD
	 MOV DPTR,#STR7
 	ACALL WSTR 
 	MOV 32H,#1;   10%   1/10
 	ACALL COST
 MOV A,#01H   ; clear lcd 
 ACALL CMD
 ACALL DELAY
 ACALL DELAY
 MOV A,#80H  ;;1st line 
 ACALL CMD
 MOV DPTR,#STR9
 ACALL WSTR
 MOV A,#0C5H  ; 2ND LINE
 ACALL CMD

 MOV R4,33H
 ACALL CONV
 MOV A,60H
 ACALL WCHR
 MOV A,61H
 ACALL WCHR
 MOV A,62H
 ACALL WCHR	
	 AJMP CHECK
       
DISCO2: 	;20% DISCOUNT
 CJNE A,#1H, FREE
 	 MOV A,#01H   ; clear lcd 
	 ACALL CMD
	 ACALL DELAY
 	ACALL DELAY
    MOV A,#80H  ;;1st line 
	 ACALL CMD
	 MOV DPTR,#STR8
 	ACALL WSTR 
	MOV 32H,#2;    20%   2/10
 	ACALL COST
 MOV A,#01H   ; clear lcd 
 ACALL CMD
 ACALL DELAY
 ACALL DELAY
 MOV A,#80H  ;;1st line 
 ACALL CMD
 MOV DPTR,#STR9
 ACALL WSTR
 MOV A,#0C5H  ; 2ND LINE
 ACALL CMD

 MOV R4,33H
 ACALL CONV
 MOV A,60H
 ACALL WCHR
 MOV A,61H
 ACALL WCHR
 MOV A,62H
 ACALL WCHR	
 	AJMP CHECK
       
FREE:
	MOV A,#01H   ; clear lcd 
	 ACALL CMD
	 ACALL DELAY
	 ACALL DELAY
  	MOV A,#80H  ;;1st line 
	 ACALL CMD
	 MOV DPTR,#STR6
 	ACALL WSTR 
 MOV 32H,#10;
 ACALL COST


 AJMP CHECK
       
       
       
      COST:
 MOV A,30H  ; MOVE ANOUNT TO A
 MOV B,#10
 DIV AB    ; DIV A/10
 MOV R3,A; HOLD A VALUE
MOV R2,B;
 MOV A,#10
 SUBB A,32H  ; 10 - DISOUNT ( 0,1,2,10)
 MOV B,A
 MOV A,R3
 MUL AB   ; REBECK THE VALUE {(A/10)(10- DIS ) } 
ADD A,R2 
MOV 33H,A
       
      ;  20 - 0.1*20  = 2(10-1)
       
 RET
       
      ;--------
      FLASHING:
 CLR P1.1
 ACALL DELAY
 SETB P1.1
 ACALL DELAY
 RET
       
      WELCOME:
     MOV A,#01H   ; clear lcd 
 	 ACALL CMD
     ACALL DELAY
    ACALL DELAY
     CLR A
     MOV A,#80H  ;;1st line 1ST position
     ACALL CMD
     CLR A
     MOV DPTR,#STR1
     ACALL WSTR
     ACALL DELAY
 RET
       
      CONV:
 MOV B,#100 ;
 MOV A,R4;
 DIV AB
 MOV 50H,A
      ; 2ND DIGIT
 MOV A,B;
 MOV B,#10
 DIV AB
 MOV 51H,A
 MOV 52H,B
       
 MOV A,50H
 ADD A,#30H
 MOV 60H,A
 MOV A,51H
 ADD A,#30H
 MOV 61H,A
 MOV A,52H
 ADD A,#30H
 MOV 62H,A
 RET

INCONV:
 MOV A,50H
 SUBB A,#30H
 MOV 40H,A
      ; 2ND DIGIT
 MOV A,51H
 SUBB A,#30H
 MOV 41H,A
 MOV B,#10
MOV A,40H
MUL AB
ADD A,41H
MOV 45H,A
       
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


STR1: DB "WELCOME TO...."
	  DB 0
STR2: DB "THE AMOUNT IS"
      DB 0
STR3: DB "TODAY DATA"
	  DB 0
STR4: DB "NO DISCOUNT"
	  DB 0
STR5: DB "LATE DAYS ARE "
	  DB 0
STR6: DB "IT IS FREE"
	  DB 0
STR7: DB "YOU WILL GET 10%"
	  DB 0
STR8: DB "YOU WILL GET 20%"
	  DB 0
STR9: DB "YOU WILL PAY"
	  DB 0


RET
