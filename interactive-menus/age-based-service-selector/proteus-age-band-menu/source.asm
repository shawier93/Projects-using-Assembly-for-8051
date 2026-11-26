
LDATA EQU P0
EN EQU P0.2
RS EQU P0.0
RW EQU P0.1

ORG 00H

MOV 30H,#2 ; OPTION SELECTION
MOV 31H,#2 ;AGE 
MOV 32H,#2; MALE OR FEMALE >40
MOV 33H,#1; RETURN OR EXIT
MOV 35H,#00 ; INDICATE WHICH OPTION

ACALL FLASHING

ACALL INLCD
; WELCOME MESSAGE
ACALL CLEAR
mov a, #80H 
acall cmd
mov dptr, #STR1
acall WSTR
ACALL DELAY
ACALL DELAY
mov a, #0C0H 
acall cmd
mov dptr, #STR2
acall WSTR
ACALL DELAY
ACALL DELAY

START:	
ACALL MENU
MOV A,30H

CJNE A,#1,COVIDCHEACK
ACALL AGE
ACALL CECKUP
SJMP ASK

COVIDCHEACK:
CJNE A,#2,EXIT
ACALL AGE
ACALL COVID
SJMP ASK

ASK:
ACALL RETURN
MOV A,33H
CJNE A,#1,EXIT
AJMP START
EXIT:
SJMP EXIT

;--------produres-------
FLASHING:
MOV R3,#6
HERE:
CPL P1.0
ACALL DELAY
DJNZ R3,HERE


RET



;-----
CECKUP:
MOV A,31H
; DIVIDE THE AGE BY 10
MOV B,#10
DIV AB
; IF result <2 LEVEL 1 ( 10-19)
; IF results <4 LEVEL 2 ( 20-39)
; IF results =0 LEVEL 3 ( 40 -99)
; 
CJNE A,#2,NEXT1
NEXT1:
JNC LEVEL2 ; IF >=2
;ESLE RESULT<2 SO, LEVEL1
MOV 35H,#1
ACALL SHOW1
SJMP EE

LEVEL2:
CJNE A,#4,NEXT2
NEXT2:
JNC LEVEL3 ; IF >=4
;ESLE RESULT<2 SO, LEVEL1
MOV 35H,#2
ACALL SHOW2
SJMP EE

LEVEL3:
MOV A,32H
CJNE A,#1,FEMALE
MOV 35H,#3
ACALL SHOW3
SJMP EE

FEMALE:
MOV 35H,#4
ACALL SHOW4
SJMP EE

EE:
RET
;--------PRODURE 2------
COVID:
MOV A,31H  ; AGE

CJNE A,#5,NEXT
NEXT:
JNC OKAY ; IF >=5
;ESLE REMIDER<5 SO, NO
MOV 35H,#5
ACALL SHOW6
SJMP EEE

OKAY:
MOV 35H,#6
ACALL SHOW5
EEE:
RET
;-------PROCDURE 3-----
MENU:
ACALL CLEAR
mov a, #80H 
acall cmd
mov dptr, #STR3
acall WSTR
ACALL DELAY

mov a, #0c0H ;  
acall cmd
mov dptr, #STR4
acall WSTR
ACALL DELAY
ACALL DELAY
RET

;------PRODURE 4----
AGE:
ACALL CLEAR
mov a, #80H 
acall cmd
mov dptr, #STR5
acall WSTR
ACALL DELAY
ACALL DELAY

MOV A,31H
MOV B,#10
DIV AB
ADD A,#30H
acall WCHR
MOV A,B
ADD A,#30H
acall WCHR
ACALL DELAY
ACALL DELAY
RET
;---------------------
SHOW1:
ACALL CLEAR
mov a, #80H 
acall cmd
mov dptr, #STR6
acall WSTR
ACALL DELAY
ACALL DELAY
ACALL CLEAR
mov a, #80H ;  
acall cmd
ACALL CLEAR
mov dptr, #STR7
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR8
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
mov dptr, #STR9
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR10
acall WSTR
ACALL DELAY
ACALL DELAY

RET
;--------
SHOW2:
ACALL CLEAR
mov a, #80H 
acall cmd
mov dptr, #STR6
acall WSTR
ACALL DELAY
ACALL DELAY
ACALL CLEAR
mov a, #80H ;  
acall cmd
ACALL CLEAR
mov dptr, #STR7
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR10
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov dptr, #STR11
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
mov dptr, #STR9
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR10
acall WSTR
ACALL DELAY
ACALL DELAY
RET
;--------
SHOW3:
ACALL CLEAR
mov a, #80H 
acall cmd
mov dptr, #STR6
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
ACALL CLEAR
mov dptr, #STR7
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR10
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov dptr, #STR11
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
mov dptr, #STR9
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR10
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
mov dptr, #STR12
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR8
acall WSTR
ACALL DELAY
ACALL DELAY
RET
;--------
SHOW4:
ACALL CLEAR
mov a, #80H 
acall cmd
mov dptr, #STR6
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
ACALL CLEAR
mov dptr, #STR7
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR10
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov dptr, #STR11
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
mov dptr, #STR9
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR10
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
mov dptr, #STR13
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR8
acall WSTR
ACALL DELAY
ACALL DELAY

ACALL CLEAR
mov a, #80H ;  
acall cmd
mov dptr, #STR12
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR8
acall WSTR
ACALL DELAY
ACALL DELAY
RET
RET
;--------
RETURN:
ACALL CLEAR
mov a, #80H ;  
acall cmd
ACALL CLEAR
mov dptr, #STR14
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR15
acall WSTR
ACALL DELAY
ACALL DELAY
RET


;--------------
SHOW5:
ACALL CLEAR
mov a, #80H ;  
acall cmd
ACALL CLEAR
mov dptr, #STR16
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR18
acall WSTR
ACALL DELAY
ACALL DELAY
RET


;--------------
SHOW6:
ACALL CLEAR
mov a, #80H ;  
acall cmd
ACALL CLEAR
mov dptr, #STR17
acall WSTR
ACALL DELAY
mov a, #0C0H ;  
acall cmd
mov dptr, #STR18
acall WSTR
ACALL DELAY
ACALL DELAY
RET
;====================================================================
;-- LCD Initialization Procedure starts here -----
INLCD:
PUSH 7
MOV R7,#20
WAIT:
ACALL LDELAY ; Step 1
DJNZ R7,WAIT
MOV P0,#00000111B ; Initialise 3 control signals=1
MOV A,#0011B ; Step 2
ACALL CMD
ACALL LDELAY ; Step 3
MOV A,#0011B ; Step 4
ACALL CMD
MOV A,#0011B ; Step 5
ACALL CMD
MOV A,#0010B ; Step 6
ACALL CMD
MOV A,#0010B ; Step 7 – send high nibble
ACALL CMD
MOV A,#1000B ; send low nibble
ACALL CMD
MOV A,#0000B ; Step 8 – Turn off display – send high nibble
ACALL CMD
MOV A,#1000B ; send low nibble
ACALL CMD
MOV A,#0 ; Step 9 - Clear Display – send high nibble
ACALL CMD
MOV A,#0001B ; send low nibble
ACALL CMD
ACALL LDELAY ; 4.1 msec required for this command
MOV A,#0000B ; Step 10 - Set cursor Move RIGHT- send high nibble
ACALL CMD
MOV A,#0110B ; send low nibble
ACALL CMD
MOV A,#0000B ; Step 11 –send high nibble
ACALL CMD ; Turn ON Display, Cursor ON, Blink Cursor
MOV A,#1111B ; send low nibble
ACALL CMD
POP 7
RET
;--- End of LCD initialization -----
;---- Subroutine to write COMMAND in A to the LCD -------
CMD:
CLR RS ; RS = 0command write
ACALL COMMON
RET
;---- Subroutine to write character in A to the LCD -------
WCHR:
PUSH ACC
PUSH B
SETB RS ; RS = 1 data write
MOV B,A
SWAP A ; Move higher nibble to lower nibble
ACALL COMMON ; write operation
MOV A,B
ACALL COMMON
POP B
POP ACC
RET
;----- Common operation for CHAR write and COMMAND write
COMMON:
CLR RW
SWAP A ; Move Lower nibble to higher nibble
ANL A,#11110000B
ANL P0,#00000111B
ORL P0,A
SETB EN
CLR EN
ACALL LDELAY
RET
;---- Subroutine to write A STRING character by character -------
WSTR:
PUSH ACC
CONT1:
CLR A
MOVC A,@A+DPTR ; move character to A
JZ EXIT1
ACALL WCHR ; call procedure to write a CHAR
INC DPTR ; get next character
AJMP CONT1 ; go to CONT1
EXIT1:
POP ACC ; restore A
RET
;------------ ˜ 5.4msec DELAY -------------------------------------------
LDELAY:
PUSH 0
PUSH 1 ; save register1.
MOV R1,#20 ; move 12 to register R1
CON4:
MOV R0,#250
DJNZ R0,$
DJNZ R1,CON4 ; decrease R1, if R1 !=0, go to CON4
POP 1
POP 0
RET

;----------- ˜ 1SEC DELAY -------------------------------------------
DELAY:
MOV R5,#20
HH:
ACALL LDELAY
DJNZ R5,HH
RET

CLEAR:
MOV A,#01H
ACALL CMD
MOV R7,#14
WAITT: ACALL LDELAY
DJNZ R7,WAITT
ret 

STR1: db "WELCOME",0
STR2: db 'HEALTH SYSTEM',0
STR3: db '1-CHECK 2-VAC',0
STR4: db '3-EXIT ',0
STR5: db 'YOUR AGE: ',0
STR6: db 'Eat Well&Exercise',0
STR7: db 'Do blood test',0
STR8: db 'every year',0
STR9: db 'Check teeth ',0
STR10: db 'every 6 months',0
STR11: db 'check vit D',0
STR12: db 'do colon Xray',0
STR13: db 'do mammorgram',0
STR14: db '1- MAIN MENU',0
STR15: db '2-EXIT',0
STR16: db 'YOU CAN TAKE',0
STR17: db 'YOU CANNOT TAKE',0
STR18: db 'Covid 19 vaccine',0



      END
