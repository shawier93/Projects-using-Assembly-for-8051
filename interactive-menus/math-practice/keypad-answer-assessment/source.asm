org 0h
start:

mov r5,#4h ; loop for 5 times
mov r0,#10h ; load 10h in r0
mov dptr,#list2;copy from rom to ram

loop:
clr a ;clr a
movc a,@a+dptr
mov @r0,a
inc dptr;inc dptr
inc r0 ;inc r0
djnz r5,loop;if r5 not equal zero jump to loop

;copy from rom to ram
mov r5,#5h; load data 5h in r5
mov r1,#14h; load data 14h in r1
mov dptr,#list3

loop2:
clr a;clear a
movc a,@a+dptr
mov @r1,a
inc dptr 
inc r1
djnz r5,loop2;loop for 5 times


;addition operation 5+2
;add data from location 10h to acc
;save result in location 18h
;
mov r0,#10h ; load 10 h in r0
mov a,@r0
mov r6,a;copy register a data to register6
mov r1,#14h;load data 14h in register1
mov a,@r1;indexed registering to acc
add a,r6; add 5+2
mov 18h,a;copy result  to 18h
inc r0 ;inc r0
inc r1;inc r1


;subbtraction operation 5-1
;save result to location 19h
mov a,@r1
mov r6,a
mov a,@r0
subb a,r6; 5-1
mov 19h,a; save result in location 19h
inc r0
inc r1

;multiplication operation
;2*6 and save result in location 20h
mov a,@r0
mov r6,a
mov a,@r1
mov b,a ;b=6
mov a,r6;a=2
mul ab;2*6 and save result in acc
mov 20h,a;save result in location 20h
inc r0
inc r1

;division operation 12/2
;save result in location 21h

mov a,@r0
mov r6,a
mov a,@r1
mov b,a;b=2
mov a,r6
div ab ;12/2 and save result in a
mov 21h,a ;save result in location 21h



; error and score registers initialization
mov 35h,#0h ;error count start from 0
mov 36h,#0h ;scorecount start from 0

	ACALL INLCD   	; initialize LCD 


	
; Displaying welcome message

	mov A,#80H
	acall CMD
	mov   dptr, #welcome_line1
	acall wstr
	mov A,#0C0H
	acall CMD
	mov   dptr, #welcome_line2
	acall wstr		

	acall ShortDelay100m 
	acall ShortDelay100m 

; addition operation by user

Q1:		

; Asking the first question 
acall ClearLCD
mov A,#80H
acall CMD
mov   dptr, #LCDQ1
acall wstr
; move to line 2 to write answer
mov A,#0C0H
acall CMD		


ReadAdditionAnswer:
;Reading answer from keypad

acall keypad 
acall wchr
acall ShortDelay100m
		
;saving answer
subb a,#30h	;convert ASCII to Hex
mov 30h, a ;update value 


;************ correctness determination ***********
mov a,30h ; move the input to acc 
cjne a,18h, NotCorrectAddition ;compare and jump
;correct answer

;Adding question score
mov a,36h		
add a,#1		
mov 36h,a

;display correct msg and current score
acall ClearLCD
mov A,#80H
acall CMD
mov   dptr, #ScoreMSG
acall wstr

mov a,36h
add a,#30h
acall WCHR

;Turn on correct flash
acall GreenLEDFlash

sjmp Q2	

NotCorrectAddition:			;wrong answer

inc 35h ; increament wrong answers counter by 1
acall ClearLCD
mov A,#80H
acall CMD
mov   dptr, #WrongAnswerMSG
acall wstr
; move to line 2 to write new answer
mov A,#0C0H
acall CMD	

;Display wrong answer msg 
acall RedLEDFlash 

jmp ReadAdditionAnswer  	; second trial flag 


;************* Subtraction question *************
Q2:
; Asking the Subtraction question 
acall ClearLCD
mov A,#80H
acall CMD
mov   dptr, #LCDQ2
acall wstr
; move to line 2 to write answer
mov A,#0C0H
acall CMD		

		
ReadSubtractionAnswer:
;Reading answer from keypad

acall keypad 
acall wchr
acall ShortDelay100m
		
;saving answer
subb a,#30h	;convert ASCII to Hex
mov 31h, a ;update value 

;************ correctness determination ***********
mov a,31h
cjne a,19h,NotCorrectSubt; if not equal 4	

						
;Correct Answer
mov a,36h					
add a,#2
mov 36h,a

;display correct msg and current score
acall ClearLCD
mov A,#80H
acall CMD
mov   dptr, #ScoreMSG
acall wstr

mov a,36h
add a,#30h
acall WCHR

acall GreenLEDFlash
sjmp Q3	
NotCorrectSubt:
inc 35h ; increament wrong answers counter by 1
acall ClearLCD
mov A,#80H
acall CMD
mov   dptr, #WrongAnswerMSG
acall wstr
; move to line 2 to write new answer
mov A,#0C0H
acall CMD	

acall RedLEDFlash
sjmp ReadSubtractionAnswer


Q3:;input by user in multiplication
; Asking the multiplication question 
acall ClearLCD
mov A,#80H
acall CMD
mov   dptr, #LCDQ3
acall wstr
; move to line 2 to write answer
mov A,#0C0H
acall CMD		


ReadMultiplicationAnswer:
;Reading answer from keypad
;first digit
acall keypad 
acall wchr

;saving first digit

subb a,#30h	;convert ASCII to Hex
mov r6, a ;tmp register for digit 1

;second digit
acall keypad 
acall wchr
acall ShortDelay100m
	
;saving second digit
subb a,#30h	;convert ASCII to Hex
mov r7, a ;tmp register for digit 2

;combining the two digits 
mov a, r6
mov b, #10
mul AB
add A,r7 

;saving result
mov 32h,a


;checking the value 
mov a, 32h
cjne a,20h,NotCorrectMult	;if not equal result 
;Correct Answer
mov a,36h					
add a,#3
mov 36h,a

;display correct msg and current score
acall ClearLCD
mov A,#80H
acall CMD
mov   dptr, #ScoreMSG
acall wstr

mov a,36h
add a,#30h
acall WCHR

acall GreenLEDFlash
sjmp Q4	
NotCorrectMult:
inc 35h ; increament wrong answers counter by 1
acall ClearLCD
mov A,#80H
acall CMD
mov   dptr, #WrongAnswerMSG
acall wstr
; move to line 2 to write new answer
mov A,#0C0H
acall CMD	
acall RedLEDFlash
sjmp ReadMultiplicationAnswer


Q4:;division operation user inputs

; Asking the division question 
acall ClearLCD
mov A,#80H
acall CMD
mov   dptr, #LCDQ4
acall wstr

; move to line 2 to write answer
mov A,#0C0H
acall CMD		

		
ReadDivisionAnswer:
;Reading answer from keypad

acall keypad 
acall wchr
acall ShortDelay100m
		
;saving answer
subb a,#30h	;convert ASCII to Hex
mov 33h, a ;update value 


;************ correctnes determination *************

mov a,33h 
cjne a,21h,NotCorrectDiv;compare and jump
;Correct Answer
mov a,36h					
add a,#4
mov 36h,a

;display correct msg and current score
acall ClearLCD
mov A,#80H
acall CMD
mov   dptr, #ScoreMSG
acall wstr

;sepearate 2 digit score 
mov a,36h
mov b ,#10
div ab
add a,#30h
acall WCHR
mov a,b 
add a,#30h
acall WCHR

acall GreenLEDFlash
sjmp LastPrint	
NotCorrectDiv: 
inc 35h ; increament wrong answers counter by 1
acall ClearLCD
mov A,#80H
acall CMD
mov   dptr, #WrongAnswerMSG
acall wstr
; move to line 2 to write new answer
mov A,#0C0H
acall CMD	
acall RedLEDFlash
sjmp ReadDivisionAnswer


LastPrint:
acall ClearLCD
mov A,#80H
acall CMD
mov   dptr, #MistakesMSG
acall wstr
;suppose that number of mistakes is <= 255
mov a, 35h
mov b, #100
div ab 
add a, #30H
acall WCHR
mov a, b
mov b, #10
div ab 
add a, #30H
acall WCHR
mov a,b
add a, #30H
acall WCHR

; move to line 2 
mov A,#0C0H
acall CMD
mov   dptr, #GameOverMSG
acall wstr		

Finish: sjmp Finish

; ----------Subrotines------------

RedLEDFlash:; flash Red led for 1  sec
clr p1.0; p1.0 on
acall DelayOf2Sec ;1 sec delay
setb p1.0 ;p1.0 off
acall DelayOf2Sec ;1 sec delay
ret


GreenLEDFlash:; flash Yellow led for 1  sec
clr p1.2; p1.2 on
acall DelayOf2Sec ;1 sec delay
setb p1.2 ;p1.2 off
acall DelayOf2Sec ;1 sec delay
ret

ShortDelay100m:
mov r4,#200
y2:mov r5,#250
y1:djnz r5,y1
djnz r4,y2
ret

DelayOf2Sec:
mov r3,#20
x3:mov r4,#200
x2:mov r5,#250
x1:djnz r5,x1
djnz r4,x2
djnz r3,x3
ret

	

		
;*-*----------------LDC subrotines-----------------*-*

;- Subroutine to write character in A to the LCD-----
	WCHR:
	PUSH ACC
	PUSH B
	SETB P1.3;- Subroutine to write character in A to the LCD-----

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
	;-----clear LCD-----
	ClearLCD:
	MOV A,#01H
	ACALL CMD
	MOV R7,#14
	WAIT11: ACALL LDELAY
	DJNZ R7,WAIT11
	RET
	; ------- procedure delay -------
	LDELAY:
	MOV R0, #50
	DJNZ R0, $
	RET
	
;- Subroutine to write Str on LCD-----
	wstr:
	push acc
	cont1:
	clr a
	movc a,@a+dptr
	JZ exit1
	print:
	acall wchr
	inc dptr
	ajmp cont1
	exit1: pop acc
	ret

;This subroutine detects the key pressed on the keypad, gets the ASCII code from the lookup table and stores
;the code in the Accumulator A
;P0.0 - P0.3 connected to row, P0.4 - P0.7 connected to columns

KEYPAD:
MOV P0,#11110000B  
 
;make bits P0.4-P0.7 input (columns) 
 
K1:     MOV P0,#11110000B    
 
;ground all rows 
MOV A,P0 
 
 
 
;read all col. (ensure all keys open) 
 ANL A,#11110000B    
 
;masked unused bits 
 
CJNE A,#11110000B,K1  
 
;check till all keys released 

K2: ACALL DELAY       
 MOV A,P0 
 
 
 
;see if any key is pressed 
 ANL A,#11110000B  
 
;mask unused bits 
 
CJNE A,#11110000B,OVER    
;key pressed, await closure 
 
SJMP K2 
 
 
 
;check if key pressed 

OVER: 
ACALL DELAY
 MOV A,P0 
 
 
 
;check key closure 
 ANL A,#11110000B  
 
;mask unused bits 
 
CJNE A,#11110000B,OVER1   
;key pressed, find row 
SJMP K2 
 
 
 
;if none keep polling 

OVER1: 
MOV P0,#11111110B 
 
;ground row 0 
 MOV A,P0 
 
 
 
;read all columns 
 ANL A,#11110000B  
 
;mask unused bits 
CJNE A,#11110000B,ROW_0   
;key row 0, find the col. 
 
 MOV P0,#11111101B 
 
;ground row 1 
 MOV A,P0 
 
 
 
;read all columns 
 ANL A,#11110000B  
 
;mask unused bits  
 
CJNE A,#11110000B,ROW_1   
;key row 1, find the col.

MOV P0,#11111011B 
 
;ground row 2 
MOV A,P0 
 
 
 
;read all columns 
 ANL A,#11110000B        
 
;mask unused bits 
CJNE A,#11110000B,ROW_2 
;key row 2, find the col. 

MOV P0,#11110111B          
;ground row 3 
MOV A,P0 
 
 
 
;read all columns 
ANL A,#11110000B  
 
;mask unused bits 
CJNE A,#11110000B,ROW_3   
;key row 3, find the col. 
 
 
LJMP K2 
 
 
;if none, false input, repeat 

ROW_0: MOV DPTR,#KCODE0 
 
;set DPTR=start of row 0         
 
SJMP FIND  
 
 
;find col. key belongs to 

ROW_1: MOV DPTR,#KCODE1 
 
;set DPTR=start of row 1 
 
SJMP FIND  
 
 
;find col. key belongs to 
 
ROW_2: MOV DPTR,#KCODE2 
 
;set DPTR=start of row 2  
 
SJMP FIND  
 
 
;find col. key belongs to 

ROW_3: MOV DPTR,#KCODE3 
 
;set DPTR=start of row 3 

FIND:  
SWAP A 
 
 
 
;exchange low and high nibble 


FIND1:
RRC A  
 
 
 
;see if any CY bit low 
JNC MATCH  
 
 
;if zero, get the ASCII code        
INC DPTR                   
 
;point to next col. address 
SJMP FIND1                
 
;keep searching 

MATCH: 
CLR A                      
 
;set A=0 (match is found) 
 MOVC A,@A+DPTR             
;get ASCII code from table 

RET
 

; 30 msec delay
DELAY: 
 
MOV   TMOD,#00000001B   
MOV   TL0,#0CAH          
 
; Timer0, 30msec delay 
MOV   TH0,#27H     
SETB  TR0       
 
 
BACK: JNB    TF0,BACK     
CLR    TR0          
 
CLR    TF0         
 
RET
 
KCODE3:  DB '3','2','1' 
 
;Row0 ASCII codes 
KCODE2: DB '6','5','4'
 
;Row1 
KCODE1: DB '9','8','7'
 
;Row2 
KCODE0: DB '#','0','*'
 
;Row3



welcome_line1 :  	DB  "Welcome Tester"
					DB 0
welcome_line2 :  	DB  "Are you ready?"
					DB 0
LCDQ1:    			DB  "5 + 2 =?"
					DB 0
LCDQ2:    			DB  "5 - 1 =?"
					DB 0
LCDQ3:    			DB  "2 * 6 =?"
					DB 0
LCDQ4:    			DB  "12/2 =?"
					DB 0
WrongAnswerMSG:  	DB  "Wrong. Try again:"
					DB 0
ScoreMSG: 		 	DB  "Correct!Score="
					DB 0
MistakesMSG:  	 	DB  "Mistakes = "
					DB 0
GameOverMSG:	 	DB  "Game over Thanks"
					DB 0

list2: db 5,5,2,12
list3: db 2,1,6,2
end

