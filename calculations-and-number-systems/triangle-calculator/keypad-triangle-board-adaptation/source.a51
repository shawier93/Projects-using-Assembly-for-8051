
G 	BIT	    P1.0		
Y 	BIT 	P1.1
R	BIT	    P1.3
 
EN EQU P0.2 
RS EQU P0.0 
RW EQU P0.1
	
 ORG 0H
START1: 
 ACALL INLCD ; Initialize LCD 

MOV 30H, #1 ;OPERATION 1: are OR 2:per
MOV 40H, #3 ;BASE
MOV 41H, #4 ;HIGHT
MOV 42H, #2 ;SIDE A
MOV 43H, #3 ;SIDE B
MOV 44H, #4 ;SIDE C
MOV 50H, #0 ;RESULT
MOV 51H, #0 ; REMINDER
MOV 60H, #0 ; CONTINUE 1-YES 2-NO
ACALL WELCOME
ACALL DELAY
MENU:
;CHEACK OPERATION
ACALL Menuu
ACALL DELAY

ACALL KEYPAD 
ACALL WCHR
SUBB A,#30H ; TO CONVERT FROM ASCII TO DECIMAL
MOV 30H,A
ACALL DELAY

ACALL SELECTT
ACALL DELAY


MOV A,30H
CJNE A,#1,OPERATION2
;OPERATION 1
ACALL FLASHING

ACALL OPTIONN1
ACALL ENTER_DIM
ACALL AREAA
ACALL PRINT1
ACALL CONTINUE

OPERATION2:
CJNE A,#2,WRONG
;OPERATION 2
ACALL FLASHING

ACALL OPTIONN2
ACALL ENTER_SIDES
ACALL PERIMETER
ACALL PRINT2
ACALL CONTINUE

WRONG:
ACALL WRONGG
SJMP MENU

EXIT:

ACALL CLEAR
ACALL DELAY
mov a, #80H ;  
acall cmd
mov dptr, #THANKS
acall wstr

ACALL FLASHING
ACALL DELAY

EE:SJMP EE


AREAA:
;COPY THE BASE AND HIGHT
MOV A,40H
MOV B,41H
; PEFORM THE MULTIPLAICATION FIRS
MUL AB
;THEN DIVIDE HTE RESULT SAVED IN A BY 2
MOV B,#2
DIV AB
MOV 50H,A
MOV 51H,B
RET

PERIMETER:
;SIDE a
MOV A,42H
;ADD SIDE a AND SIDE b
ADD A,43H
; ADD SIDE c TO THE RESULT
ADD A,44H
;SAVE THE RESULT
MOV 50H,A
RET

CONTINUE:
ACALL CON
ACALL KEYPAD 
ACALL WCHR
SUBB A,#30H
MOV 60H,A ; SAVE THE SELECTION IN 60H
CJNE A,#1,EXIT
SJMP MENU
RET
;----------------
; procdures 
welcome:
ACALL CLEAR
ACALL DELAY
mov a, #80H 
acall cmd
mov dptr, #NAMEE
acall wstr

mov a,#0C0H
acall cmd
mov dptr, #PROJECT
acall wstr
acall delay
ret

Menuu:
ACALL CLEAR
ACALL DELAY
mov a, #80H ;  
acall cmd
mov dptr, #OP1  ; 1-area 2- perm
acall wstr

mov a,#0C0H
acall cmd
mov dptr, #OP2   ;select operation
acall wstr
acall delay
ret

SELECTT:
ACALL CLEAR
ACALL DELAY
mov a, #80H ;  
acall cmd
mov dptr, #MSG ; selection: 
acall wstr

MOV A,30H  ; decimal number 
ADD A,#30H   ; to convert it to asci 
ACALL WCHR  ; to print the character
RET

OPTIONN1:
mov a,#0C0H
acall cmd
mov dptr, #MSG1  ;  you schose area
acall wstr  
acall delay
ret

OPTIONN2:
mov a,#0C0H
acall cmd
mov dptr, #MSG2  ;  you schose per
acall wstr
acall delay
ret

WRONGG:
mov a,#0C0H
acall cmd
mov dptr, #WRONGGG
acall wstr
acall delay
;TURN RELD LED
MOV R4,#10
CLR R
AG1:ACALL DELAY  ; 300 MS *10 
DJNZ R4,AG1
SETB R
ret

FLASHING:
MOV R4,#10
CLR G
AG:ACALL DELAY1
DJNZ R4,AG
SETB G
RET

ENTER_SIDES:
ACALL CLEAR
ACALL DELAY
mov a, #80H ;  
acall cmd
mov dptr, #ENTERSIDES
acall wstr

mov a, #0C0H ;  
acall cmd
mov dptr, #SIDEA
acall wstr
ACALL KEYPAD 
ACALL WCHR
SUBB A,#30H
MOV 42H,A

mov dptr, #SIDEB
acall wstr
ACALL KEYPAD 
ACALL WCHR
SUBB A,#30H
MOV 43H,A

mov dptr, #SIDEC
acall wstr
ACALL KEYPAD 
ACALL WCHR
SUBB A,#30H
MOV 44H,A
ACALL DELAY
RET


ENTER_DIM:
ACALL CLEAR
ACALL DELAY
mov a, #80H ;  
acall cmd
mov dptr, #ENTERSIDES
acall wstr
mov a, #0C0H ;  
acall cmd
mov dptr, #SIDEB
acall wstr

ACALL KEYPAD  ; ENTERED NUMBER IN ASCII
ACALL WCHR   ; PRINT THE ENTERED NUMBER
SUBB A,#30H  ; CONVERT FROM ASCII TO DECIMAL
MOV 40H,A

mov dptr, #HIGHT  ;h=
acall wstr

ACALL KEYPAD 
ACALL WCHR
SUBB A,#30H
MOV 41H,A

ACALL DELAY
RET

CON:
ACALL CLEAR 
ACALL DELAY
mov a, #80H 
acall cmd
mov dptr, #CONT11
acall wstr
mov a, #0C0H 
acall cmd
mov dptr, #CONT22
acall wstr
RET

PRINT1:
ACALL CLEAR 
ACALL DELAY
mov a, #80H 
acall cmd
mov dptr, #AAREA
acall wstr
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
MOV A,B
ADD A,#30H
ACALL WCHR
ACALL LDELAY
mov a, #0C0H 
acall cmd
mov dptr, #REMINDER
acall wstr
MOV A,51H
ADD A,#30H
ACALL WCHR
ACALL DELAY
ACALL DELAY

RET

PRINT2:
ACALL CLEAR 
ACALL DELAY
mov a, #80H 
acall cmd
mov dptr, #PPERIMETER
acall wstr

MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
MOV A,B
ADD A,#30H
ACALL WCHR
ACALL DELAY
RET



 /////////////////////////////////////////////////////////

STOP: SJMP STOP
;-- LCD Initialization Procedure starts here -----
TIME:
	
	MOV R3,#50  ; 50 ms
LOOP66:ACALL LDELAY
DJNZ R3,LOOP66
RET

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
 PUSH ACC
 PUSH B
 CLR RS ; RS = 0 command write
MOV B,A 
 
 SWAP A ; Move higher nibble to lower nibble
 ACALL COMMON ; write operation
MOV A,B
ACALL COMMON
 
 POP B
 POP ACC 
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
 ANL P0,#00001111B
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


; Timer0, 30 msec delay
TMSEC:
MOV TMOD,#00000001B 
MOV TL0,#0CAH 
MOV TH0,#27H 
SETB TR0 
BACK: JNB TF0,BACK 
CLR TR0 
CLR TF0 
RET 

CLEAR:  
MOV A,#1H
ACALL CMD
ACALL LDELAY
MOV R7,#14
WAITT: ACALL LDELAY
DJNZ R7,WAITT
RET 

;; 5MS *60  = 300 ms
DELAY:
MOV R5,#250  
qwe:
ACALL LDELAY
DJNZ R5,qwe
RET
DELAY1:
MOV R5,#60
abc:
DJNZ R5,abc
RET



;This subroutine detects the key pressed on the keypad, gets the ASCII code from the lookup table and stores
;the code in the Accumulator A
;P2.0 - P2.3 connected to row, P2.4 - P2.7 connected to columns
KEYPAD:
MOV P2,#11110000B ;make bits P2.4-P2.7 input (columns)
K1: MOV P2,#11110000B ;ground all rows
MOV A,P2 ;read all col. (ensure all keys open)
ANL A,#11110000B ;masked unused bits
CJNE A,#11110000B,K1 ;check till all keys released
K2: ACALL TMSEC 
MOV A,P2 ;see if any key is pressed
ANL A,#11110000B ;mask unused bits
CJNE A,#11110000B,OVER ;key pressed, await closure
SJMP K2 ;check if key pressed
OVER: 
ACALL TMSEC
MOV A,P2 ;check key closure
ANL A,#11110000B ;mask unused bits
CJNE A,#11110000B,OVER1 ;key pressed, find row
SJMP K2 ;if none keep polling
OVER1: 
MOV P2,#11111110B ;ground row 0
MOV A,P2 ;read all columns
ANL A,#11110000B ;mask unused bits
CJNE A,#11110000B,ROW_0 ;key row 0, find the col.
MOV P2,#11111101B ;ground row 1
MOV A,P2 ;read all columns
ANL A,#11110000B ;mask unused bits 
CJNE A,#11110000B,ROW_1 ;key row 1, find the col.
 MOV P2,#11111011B ;ground row 2
 MOV A,P2 ;read all columns
ANL A,#11110000B ;mask unused bits
 CJNE A,#11110000B,ROW_2 ;key row 2, find the col.
 MOV P2,#11110111B ;ground row 3
 MOV A,P2 ;read all columns
 ANL A,#11110000B ;mask unused bits
 CJNE A,#11110000B,ROW_3 ;key row 3, find the col.
LJMP K2 ;if none, false input, repeat
ROW_0: MOV DPTR,#KCODE0 ;set DPTR=start of row 0 
SJMP FIND ;find col. key belongs to
ROW_1: MOV DPTR,#KCODE1 ;set DPTR=start of row 1
SJMP FIND ;find col. key belongs to
ROW_2: MOV DPTR,#KCODE2 ;set DPTR=start of row 2 
SJMP FIND ;find col. key belongs to
ROW_3: MOV DPTR,#KCODE3 ;set DPTR=start of row 3
FIND: 
SWAP A ;exchange low and high nibble
FIND1:
RRC A ;see if any CY bit low
JNC MATCH ;if zero, get the ASCII code 
INC DPTR ;point to next col. address
SJMP FIND1 ;keep searching
MATCH: 
CLR A ;set A=0 (match is found)
MOVC A,@A+DPTR ;get ASCII code from table
RET


KCODE0: DB '1','2','3','A' ;Row0 ASCII codes
KCODE1: DB '4','5','6','B' ;Row1
KCODE2: DB '7','8','9','C' ;Row2
KCODE3: DB '*','0','#','D' ;Row3

NAMEE: db 'WELCOME TO 8051',0
PROJECT: db ' TRAINGLE CALCULATOR',0
OP1: db '1.Area 2.Perimet',0
	OP2: db 'SLCT OPERATION:',0
MSG: db 'SELECTION: ',0
MSG1: db 'you chose Area',0
MSG2: db 'you chose PERIMETER',0
WRONGGG: db 'WRONG !! ',0
ENTERSIDES: db 'ENTER SIDES: ',0
SIDEA: db 'a=',0
SIDEB: db '  b=',0
SIDEC: db '  c=',0
HIGHT: db '  h=',0
AAREA: db 'AREA =  ',0
PPERIMETER: db 'PERIMETER =  ',0
REMINDER: db 'REMINDER= ',0
CONT11: db 'WANT TO CONTINUE? ',0
CONT22: db '1-YES 2-NO ',0
THANKS: db '---THANK YOU--- ',0
END
