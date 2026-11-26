; Personal details removed.
; Personal details removed.
; PHASE 2

 ORG 0H
ACALL INLCD
MOV A,#80H
ACALL CMD 
MOV DPTR,#NAME
ACALL WSTR

MOV A,#0C0H
ACALL CMD 
MOV DPTR,#NAME1
ACALL WSTR
ACALL DELAY

 START:
MOV R2,#3
MOV P1,#0FFH
X7:
MOV P1,#00000000B
ACALL LDELAY
DJNZ R2,X7
ACALL INLCD


;; flashing



MOV R1,#3
MOV 40H,R1
MOV R1,#0
MOV 41H,R1
MOV R1,#2
MOV 42H,R1


ACALL DELAY
ACALL CLEAR

MOV A,#80H
ACALL CMD
MOV DPTR,#N
ACALL WSTR
ACALL KEYPAD
ACALL WCHR
SUBB A,#30H
MOV 30H,A


MOV R7,30H
DEC R7
DEC R7
MOV R0,#43H
MOV R1,#43H
XX:
DEC R1
DEC R1
MOV A,@R1
MOV R2,A
DEC R1
MOV A,@R1
ADD A,R2
MOV @R0,A
INC R0
MOV B,R0
MOV R1,B
DJNZ R7,XX


MOV R2,30H
INC R2


MOV A,#0C0H
ACALL CMD
MOV R1,#40H
LOOOP:
MOV A,@R1
ADD A,#30H
ACALL WCHR
MOV A,#','
ACALL WCHR
INC R1
ACALL LDELAY
DJNZ R2,LOOOP

ACALL DELAY
ACALL DELAY
;;;;;;--------------------

;;;;;;;
MOV 31H,#0
ACALL CLEAR
MOV A,#80H
ACALL CMD
MOV DPTR,#CONT
ACALL WSTR


MOV A,#0C0H
ACALL CMD
MOV DPTR,#YES
ACALL WSTR
ACALL DELAY
MOV A,#0CDH
ACALL CMD
ACALL KEYPAD
ACALL WCHR
ACALL DELAY

CJNE A,#'1',NOTEQUAL
AJMP START

NOTEQUAL:
ACALL CLEAR
MOV A,#80H
ACALL CMD
MOV DPTR,#THANK
ACALL WSTR
MOV A,#0C0H
ACALL CMD
MOV DPTR,#BYE
ACALL WSTR
SJMP $





DELAY:
MOV R7,#250
WAIT:
ACALL LDELAY
DJNZ R7,WAIT
RET

CLEAR:
	MOV A, #01H
	ACALL CMD; 
	MOV R7, #14
WaitT:	
	ACALL LDELAY
	DJNZ R7, WaitT
RET
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

; -------  procedure init_display -------
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
   
; -------  procedure delay -------
LDELAY:	
	MOV R0, #50	
	DJNZ R0, $	
	RET


;.............keypad............
keypad:
mov p0,#01110000b ;make bits p0.4-p0.6 input
k1: mov p0,#01110000b
mov a,p0 ;read all col. (ensure all keys open)
anl a,#01110000b ;masked unused bits
cjne a,#01110000b,k1 ;check til all keys released
k2:
mov a,p0 ;see if any key is pressed
anl a,#01110000b ;mask unused bits
cjne a,#01110000b,over1 ;key pressed, await closure
sjmp k2 ;check if key pressed
over1:
mov p0,#01111110b ;ground row 0
mov a,p0 ;read all columns
anl a,#01110000b ;mask unused bits
cjne a,#01110000b,row_0 ;key row 0, find the col.
mov p0,#01111101b ;ground row 1
mov a,p0 ;read all columns
anl a,#01110000b ;mask unused bits
cjne a,#01110000b,row_1 ;keyrow 1, find the col.
mov p0,#01111011b ;ground row 2
mov a,p0 ;read all columns
anl a,#01110000b ;mask unused bits
cjne a,#01110000b,row_2 ;key row 2, find the col.
mov p0,#01110111b ;ground row 3
mov a,p0 ;read all columns
anl a,#01110000b ;mask unused bits
cjne a,#01110000b,row_3 ;keyrow 3, find the col.
ljmp k2 ;if none, false input, repeat
row_0: mov dptr,#kcode0 ;set dptr=start of row 0
sjmp find ;find col. key belongs to
row_1: mov dptr,#kcode1 ;set dptr=start of row 1
sjmp find ;find col. key belongs to
row_2: mov dptr,#kcode2 ;set dptr=start of row 2
sjmp find ;find col. key belongs to
row_3: mov dptr,#kcode3 ;set dptr=start of row 3
find:
rlc a ;skip d7 data (unused)
find1:
rlc a ;see if any cy bit low
jnc match ;if zero, get the key number
inc dptr ;point to next col. address
sjmp find1 ;keep searching
match: clr a ;set a=0 (match is found)
movc a,@a+dptr ;get key number from table
ret

;keypad ascii
kcode3: db '1','2','3' ;row0 
kcode2: db '4','5','6' ;row1
kcode1: db '7','8','9' ;row2
kcode0: db '*','0','#' ;row3
	

NAME: DB "WELCOME TO"
 DB 0
NAME1: DB "Perrin Sequence"
DB 0

N: DB " N= "
    DB 0

CONT: DB "CONT.?"
DB 0

YES: DB "1.YES 2.NO :"
DB 0
THANK: DB " THANK YOU "
DB 0
BYE: DB  " BYE ..."
DB 0
END
