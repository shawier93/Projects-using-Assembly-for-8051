ORG 00H 

;LCALL FLASH
ACALL INLCD 

acall clear
acall WRITE1
acall WRITE2



MOV R1,#2 ; 1- DECIMAL 2- HEXA 
; DECIMAL NUMBERS

MOV 40H,#23
MOV 41H,#24  
MOV 42H,#0 ; TO HOLD AVERGE
;
; TWO HEXA DECIMAL NUMNER

MOV 50H,#0FH  ; 11110000
MOV 51H,#0 ; NUMBER OF ZEROS

MIAN:
CJNE R1,#1,ZEROOS
; AVERAGE

MOV A,40H    ; a==23
ADD A,41H    ; a+ 24  = a =47
MOV B,#2
DIV AB    
MOV 42H,A ; SAVE AVERAGE VALUE IN R4
ACALL WRITE3
SJMP BACK

ZEROOS:
CJNE R1,#2, WRONG
MOV A,50H
ACALL COUNT
MOV 30H,51H
ACALL WRITE4

SJMP BACK

WRONG:
;ACALL FLASHER
ACALL WRONG 


BACK: SJMP BACK

COUNT:
MOV A,50H
MOV R4,#8
HERE:
MOV B,#2
DIV AB
MOV R0,B
CJNE R0,#0,NO
INC 51H 
NO:
DJNZ R4,HERE

RET
;********************
DELAY:
MOV R0,#20
AGAIN: MOV R1,#90
AGAIN2: DJNZ R1,AGAIN2
DJNZ R0,AGAIN
RET

WRITE1:
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #STR1
acall WSTR
ACALL DELAY
RET


WRITE2:
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #STR2
acall WSTR
ACALL DELAY

mov a, #0C0H ;  1st line position 3
acall cmd
mov dptr, #STR3
acall WSTR
ACALL DELAY
RET




WRITE3:
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #STR4
acall WSTR
ACALL DELAY

mov a, #0C0H ;  
acall cmd
mov a,40H
mov b,#10 
div ab
add a,#30h
acall wchr
mov a,b
add a,#30h
acall wchr
ACALL DELAY

mov a, #0C8H ;  
acall cmd
mov a,41H
mov b,#10 
div ab
add a,#30h
acall wchr
mov a,b
add a,#30h
acall wchr
ACALL DELAY

;***** RESULT 
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #STR6
acall WSTR
ACALL DELAY

mov a, #0C0H ;  
acall cmd
mov a,42H
mov b,#10 
div ab
add a,#30h
acall wchr
mov a,b
add a,#30h
acall wchr
ACALL DELAY
RET

WRITE4:
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #STR5
acall WSTR
ACALL DELAY

mov a, #0C0H ;  
acall cmd
mov a,50H
mov b,#10 
div ab
add a,#30h
acall wchr
mov a,b
add a,#30h
acall wchr
ACALL DELAY

;***** RESULT 
ACALL CLEAR
mov a, #80H ;  1st line position 3
acall cmd
mov dptr, #STR6
acall WSTR
ACALL DELAY

mov a, #0C0H ;  
acall cmd
mov a,51H
add a,#30h
acall wchr
ACALL DELAY
RET
;**********************
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

COMMON:
 ANL a,#11110000B
 ANL P1, #00001111B
 ORL P1,A
 SETB P1.2
 CLR P1.2
 RET

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

LDELAY:
MOV R0, #50
DJNZ R0, $
RET

clear:
MOV A,#01H
ACALL CMD
MOV R7,#14
WAIT: ACALL LDELAY
DJNZ R7,WAIT
ret 

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
;*********************************


STR1: db "WELCIME"
Db 0
STR2: db "CHOSE OPERATION:"
Db 0
STR3: db "1-AVER 2-HEXA ZER"
Db 0
STR4: db "AVERGAE OPER "
db 0
STR5: db "HEXA DECIMAL OPER"
Db 0
STR6: db "RESULT IS "
Db 0

end


END


