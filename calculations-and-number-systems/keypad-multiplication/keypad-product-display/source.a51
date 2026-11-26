;LCD - 24 CHARACTER - 2 LINE DISPLAY 
; Displaying a line of characters

EN EQU P0.2 
RS EQU P0.0 
RW EQU P0.1
 ORG 0H
START: 
 ACALL INLCD ; Initialize LCD 
 MOV A,#80H ; Move cursor to 1st line
 ACALL CMD 
 
 ACALL KEYPAD
 MOV 40H,A ; FIRST NUMBER IN ASCII
 ACALL WCHR
 
  ACALL KEYPAD ; THE * MARK
 ACALL WCHR
 
  ACALL KEYPAD
 MOV 41H,A ; SECOND NUMBER IN ASCII
 ACALL WCHR

 MOV A,#0c0H ; Move cursor to 2nd line
 ACALL CMD 
 ACALL LDELAY 
 MOV DPTR,#RESULT
ACALL WSTR ; Display String at STR1 array
 ; CONVERT TO NUMBERS 
 MOV A,40H
SUBB A,#30H 
MOV 40H,A
MOV B,A
MOV A,41H
SUBB A,#30H 
MOV 41H,A
MUL AB
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
MOV A,B
ADD A,#30H
ACALL WCHR
STOP: AJMP $
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

KCODE0: DB '1','2','3','A' ;Row0 ASCII codes
KCODE1: DB '4','5','6','B' ;Row1
KCODE2: DB '7','8','9','C' ;Row2
KCODE3: DB '*','0','#','D' ;Row3

RESULT: DB 'Result is ', 0 ; message to be displayed.
END
