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
;; acall inlcd






MOV R1,#3
MOV 40H,R1
MOV R1,#0
MOV 41H,R1
MOV R1,#2
MOV 42H,R1


MOV R0,#6
MOV 30H,R0


MOV A,#80H
ACALL CMD 
MOV DPTR,#N
ACALL WSTR

MOV A,30H
ADD A,#30H 
ACALL WCHR




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
DJNZ R2,LOOOP
;;;;;;--------------------

;;;;;;;

ACALL CLEAR
MOV A,#80H
ACALL CMD
MOV DPTR,#CONT
ACALL WSTR
MOV 31H,#1
MOV A,31H
ADD A,#30H
ACALL WCHR

MOV A,#0C0H
ACALL CMD
MOV DPTR,#YES
ACALL WSTR
ACALL DELAY
MOV A,31H
CJNE A,#1,NOTEQUAL
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
CLEAR:
MOV A,#01H
ACALL CMD
MOV R7,#14
WAIT2:
ACALL LDELAY
DJNZ R7,WAIT2

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

NAME: DB "WELCOME TO"
 DB 0
NAME1: DB "Perrin Sequence"
DB 0

N: DB " N= "
DB 0

CONT: DB "CONT.?"
DB 0

YES: DB " 1. YES  2. NO"
DB 0
THANK: DB " THANK YOU "
DB 0
BYE: DB  " BYE ..."
DB 0
END
