ORG 0H
MAIN:
    ACALL INLCD ;Initialize LCD
 ;....display on the 1st line ....
	MOV A, #80H ;1ST line command
	ACALL CMD
	MOV DPTR, #X1 ;shows the x1 message on lCD
	ACALL WSTR 
  
 ;.......display on the 2nd line .........
    MOV A,#0C0H ;2nd line command
	ACALL CMD
	MOV DPTR, #X2 ;shows the x2 message on lCD
	ACALL WSTR 
  ACALL DELAY_1SEC ;call the delay 1 sec
   ;......CLEAR THE LCD...
    MOV A, #01H 
	ACALL CMD
    ACALL TMSEC ;delay after sending clear LCD command
;.................................................
   ;....display on the 1st line 1st position......
 	MOV A, #80H ;1ST line command
	ACALL CMD
    MOV DPTR, #X3 ;shows the x3 message on lCD
	ACALL WSTR 
;.....display on the 2nd line 1st position....
	MOV A,#0C0H ;2nd line command
	ACALL CMD
	MOV DPTR, #X4 ;shows the x4 message on lCD
	ACALL WSTR 
	ACALL DELAY_1SEC  
 ;......CLEAR THE LCD...
	MOV A, #01H 
	ACALL CMD
    ACALL TMSEC

    MOV A, #80H ;1ST line command
	ACALL CMD
	MOV DPTR, #ENTER ;TO shows the ENTER message on lCD
	ACALL WSTR
 	MOV A,#0C0H ;2nd line command
	ACALL CMD
    MOV DPTR, #CHOICE ;TO shows the CHOICE message on lCD
	ACALL WSTR 
    ACALL KEYPAD      ;CALL KEYPAD
    MOV 50H,A
	;MOV A, 50H ;Get the type of conversion from RAM location 50H
	MOV R5, A
	ACALL WCHR 
	ACALL DELAY_1SEC
 ;......CLEAR THE LCD... 
    MOV A, #01H 
	ACALL CMD
    ACALL TMSEC

   
;.........................................................
    
Y1:
   MOV A,50H      ;Get the type of conversion from RAM location 50H
   CJNE A,#'1',Y2 ; check and jump if it not equal go to y2
   MOV DPTR ,#ENTER_BIN ;TO shows the ENTER_BIN message on lCD
   	ACALL WSTR 
   	MOV A,#0C0H  ;2nd line command
	ACALL CMD
    ACALL BinToDec ;call BinToDec
    ACALL CONVERT  ;call CONVERT
     ACALL DISPLAY
 	ACALL DELAY_1SEC 
    ;MOV A, #01H 
	;ACALL CMD
    ;ACALL TMSEC
 
SJMP STOP

Y2:
  CJNE A,#'2',Y1  ; check and jump if it not equal go to y1
   MOV DPTR ,#ENTER_HEX  ;TO shows the ENTER_HEX message on lCD
   	ACALL WSTR 
   	MOV A,#0C0H    ;2nd line command
	ACALL CMD
    ACALL HexToDec  ;call HexToDec
     ACALL CONVERT   ;call CONVERT
     ACALL DELAY_1SEC 
     ACALL DISPLAY   ;CALL DISPLAY
	ACALL DELAY_1SEC 
    ;MOV A, #01H 
	;ACALL CMD
    ;ACALL TMSEC
 


STOP:SJMP $
;.................BinToDec............
BinToDec:
       MOV R6,#0      ;initialize sum to zero
      ; MOV DPTR,#BINARY
       MOV R0,#8  ;INICIAIZE LOOP CONT.
       MOV R7,#128 ; INICIAIZE POWER 
       
LOOP:
     ; CLR A
     ; MOVC A,@A+DPTR ; READ ONE BYTE FROM ROM
      ACALL KEYPAD
	  ACALL WCHR
      CLR C
      SUBB A,#30H ; CONVERT ASCII CODE TO BINARY DIGIT
      MOV B ,R7 
      MUL AB   ; MULTPLY THE BINARY DIGIT BY POWER
      ADD A ,R6      ; ADD R6 TO A
      MOV R6 ,A
      MOV A,R7
      MOV B,#2
      DIV AB        ; DIVIDE AB
      MOV R7,A
     ; INC DPTR 
      DJNZ R0,LOOP
      MOV 40H ,R6
     RET
;...............HexToDec...............
HexToDec:

MOV R6,#16
MOV DPTR ,#HEX
;CLR A
;MOVC A,@A+DPTR  ; READ ONE BYTE FROM ROM
ACALL KEYPAD     ;CALL KEYPAD
ACALL WCHR
CLR C
SUBB A,#30H    ; CONVERT ASCII CODE 
MOV B,R6
MUL AB         ;Multiply AB
MOV R7,A
INC DPTR       ;increment DPTR
;CLR A
;MOVC A,@A+DPTR
ACALL KEYPAD    ;CALL KEYPAD
ACALL WCHR
CLR C
SUBB A,#30H  ; CONVERT ASCII CODE 
ADD A,R7
MOV 40H,A  ;Store the digit to RAM location 40H

RET
;...............CONVERT...........
CONVERT:
MOV A,40H
MOV R1,A
MOV B,#100
DIV AB         ;divide AB
ADD A,#30H    ;Convert from normal value to ASCII
MOV 40H,A    ;Store the digit to RAM location 40H

MOV A,B
MOV B,#10
DIV AB        ;divide AB
ADD A,#30H   ;Convert from normal value to ASCII 
MOV 41H,A    ;Store the digit to RAM location 41H
MOV A,B
ADD A,#30H  ;Convert from normal value to ASCII
MOV 42H,A   ;Store the digit to RAM location 42H

RET

;.................DISPLAY.....................
DISPLAY:
 ;......CLEAR THE LCD...
    MOV A, #01H 
	ACALL CMD
    ACALL TMSEC ;delay after sending clear LCD command
 ;......Display result on LCD...
MOV DPTR,#RESULT  
ACALL WSTR

MOV A,40H ; READ 1ST DIGIT FROM RAM
CJNE A,#'0',FIRST ; COMPARE AND JUMP TO FIRST IF IT NOT EQUAL ZERO

MOV A,41H ;READ 2nd DIGIT FROM RAM
CJNE A,#'0',SECOND ; COMPARE AND JUMP TO SECOND IF IT NOT EQUAL ZERO

SJMP ThirdDigit

FIRST:
ACALL WCHR ;Display first digit

SECOND:
MOV A,41H ;READ 2nd DIGIT FROM RAM
ACALL WCHR ;Display 2nd digit
SJMP ThirdDigit

 
ThirdDigit:
MOV A,42H ;READ 3rd DIGIT FROM RAM
ACALL WCHR ;Display 3rd digit
RET
;...........................................................
;- Subroutine to write character in A to the LCD-----
WCHR:
 PUSH ACC
 PUSH B
 SETB P1.3 ;RS =1 select data register
 MOV B,A
ACALL COMMON ;send high nibble of data
ACALL LDELAY
MOV A,B
SWAP A
 ACALL COMMON ;send low nibble of data
ACALL LDELAY
POP B
POP ACC
 RET
;--Subroutine to write COMMAND in A to the LCD----
CMD:
PUSH ACC
PUSH B
 CLR P1.3 ;RS = 0 select command register
 MOV B,A
 ACALL COMMON ;send high nibble of the command
ACALL LDELAY
 MOV A,B
 SWAP A
 ACALL COMMON ;send low nibble of the command
 ACALL LDELAY
POP B
POP ACC
 RET
;---Common operation for CHAR write and COMMAND write
COMMON:
PUSH ACC
 ANL A,#11110000B ;keep high nibble and mask the low nibble
 ANL P1, #00001111B ;mask the high nibble of P1 and keep the lower nibble
 ORL P1,A ;use OR to copy high nibble of A into P1
 SETB P1.2 ;apply H-L pulse on EN
 CLR P1.2
POP ACC
 RET
; ------- procedure init_display -------
INLCD:
CLR P1.3 ; clear RS - (command to be sent)
CLR P1.7 ; (set function - high nibble)
CLR P1.6 ; 0 0 1 DL --> 0 0 1 0
SETB P1.5 ;
CLR P1.4 ;
SETB P1.2 ;
CLR P1.2 ; send high nibble
ACALL LDELAY ; wait
SETB P1.2 ; (set function)
CLR P1.2 ; send high nibble (2nd time)
SETB P1.7 ; (set function - low nibble)
CLR P1.6 ; N F - - --> 1 0 0 0
CLR P1.5 ;
CLR P1.4 ;
SETB P1.2 ;
CLR P1.2 ; send low nibble
ACALL LDELAY ; wait
CLR P1.7 ; (Turn ON LCD - high nibble)
CLR P1.6 ; 0 0 0 0 --> 0 0 0 0
CLR P1.5 ;
CLR P1.4 ;
SETB P1.2 ;
CLR P1.2 ; send high nibble
SETB P1.7 ; (Turn ON LCD - low nibble)
SETB P1.6 ; 1 D C B --> 1 1 1 1
SETB P1.5 ; display ON, Cursor ON, Blink ON
SETB P1.4 ;
SETB P1.2 ;
CLR P1.2 ; send low nibble
ACALL LDELAY ; wait
CLR P1.7 ; (set entry mode - high nibble)
CLR P1.6 ; 0 0 0 0 --> 0 0 0 0
CLR P1.5 ;
CLR P1.4 ;
SETB P1.2 ;
CLR P1.2 ; send high nibble
SETB P1.6 ; (set entry mode - low nibble)
SETB P1.5 ; 0 1 I/D S --> 0 1 1 0
SETB P1.2 ; cursor direction right, No display shift
CLR P1.2 ; sent low nibble
ACALL LDELAY ; wait
RET
;---- Subroutine to write A STRING character by character -------
WSTR:
 PUSH ACC
CONT1: CLR A
 MOVC A,@A+DPTR ; move character to A
 JZ EXIT1
 ACALL WCHR ; call procedure to write a CHAR
 INC DPTR ; get next character
 AJMP CONT1 ; go to CONT1
EXIT1:
 POP ACC ; restore A
 RET
; ------- procedure delay -------
LDELAY:
	PUSH 0H
        MOV R0, #50
        DJNZ R0, $
	POP 0H
RET
; ------- 50 msec delay procedure -------
TMSEC:
MOV TMOD,#01H ; set timer 0 as timer MOD 1
MOV TL0,#0B0H ; Timer0, low byte
MOV TH0,#3CH ; Timer0, high byte
SETB TR0 ; Start timer0
BACK:
JNB TF0,BACK ; Check timer overflow flag
CLR TR0 ; Stop timer0
CLR TF0 ; Clear timer-0 overflow flag TF0
 RET

;..........DELAY_1SEC...............
DELAY_1SEC:
    PUSH 4H
	MOV R4, #20 ;For delay approxametly one second
LOOP1:
	ACALL TMSEC
	DJNZ R4, LOOP1
    POP 4H
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
;...................................................................
;ASCII LOOK-UP TABLE FOR EACH ROW
KCODE3: DB '1','2','3' ;Row0 ASCII codes
KCODE2: DB '4','5','6' ;Row1
KCODE1: DB '7','8','9' ;Row2
KCODE0: DB '*','0','#' ;Row3

RESULT:DB "RESULT IS "
       DB 0
BINARY: DB "00001000"
HEX: DB "51" 
X1: DB "WELCOM TO"
    DB 0
X2: DB "EDSIM"
    DB 0

X3: DB "1_BIN to Dec" 
DB 0
X4: DB "2_HEX to Dec" 
DB 0

ENTER: DB "Enter Your " 
DB 0
CHOICE: DB "choice:" 
DB 0

ENTER_BIN:DB "Enter BIN Number" 
DB 0
ENTER_HEX:DB "Enter HEX Number" 
DB 0

end

