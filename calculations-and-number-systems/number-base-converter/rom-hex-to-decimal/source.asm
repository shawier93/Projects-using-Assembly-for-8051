; Personal details removed.
; Personal details removed.

ORG 0H
MAIN:
     MOV 50H,#'2' ;type of conversion
Y1:
   MOV A,50H      ;Get the type of conversion from RAM location 50H
   CJNE A,#'1',Y2 ; check and jump if it not equal go to y2
   ACALL BinToDec ;call BinToDec
   ACALL CONVERT  ;call CONVERT
SJMP Y1

Y2:
  CJNE A,#'2',Y1  ; check and jump if it not equal go to y1
  ACALL HexToDec  ;call HexToDec
  ACALL CONVERT   ;call CONVERT
SJMP Y1

STOP:SJMP $
;.................BinToDec............
BinToDec:
   MOV R6,#0      ;initialize sum to zero
       MOV DPTR,#BINARY
       MOV R0,#8  ;INICIAIZE LOOP CONT.
       MOV R7,#128 ; INICIAIZE POWER 
       
LOOP:
      CLR A
      MOVC A,@A+DPTR ; READ ONE BYTE FROM ROM
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
      INC DPTR 
      DJNZ R0,LOOP
      MOV 40H ,R6
     RET
;...............HexToDec...............
HexToDec:

MOV R6,#16
MOV DPTR ,#HEX
CLR A
MOVC A,@A+DPTR  ; READ ONE BYTE FROM ROM
CLR C
SUBB A,#30H    ; CONVERT ASCII CODE 
MOV B,R6
MUL AB         ;Multiply AB
MOV R7,A
INC DPTR       ;increment DPTR
CLR A
MOVC A,@A+DPTR
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

BINARY: DB "11111111"
HEX: DB "99" 

end

