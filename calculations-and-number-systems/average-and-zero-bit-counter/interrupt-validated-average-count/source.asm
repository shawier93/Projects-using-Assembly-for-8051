org 0h

; initialise
acall inlcd

; display welcome message
acall welcome

; display name and id
acall name_id

; display interrupt # message
acall intkey

main:
; display main menu options
acall main_menu

; check menu choice
check:
mov a, 30h; a is choce
cjne a, #1, not1; check option 1
op1:

; display "enter number"
acall enter_num

;check for 0...90 range
mov a, 40h
cjne a, #91h, down1
down1:
jc inrange_1
; if out of range diplay error
acall error
sjmp op1; go back and ask for number

inrange_1:
mov a, 40h; a is given number
mov r0, a
inc r0; r0 is next number
add a, r0; a is sum
mov b, #2
div ab; a is average
mov 41h, a; store result at 41h
acall result_1
ljmp main

not1:
mov a, 30h; a is choice
cjne a, #2, not2; check option 2
op2:

; display "enter number"
acall enter_num

;check for 0...90 range
mov a, 50h
cjne a, #91h, down2
down2:
jc inrange_2
; if out of range diplay error
acall error
sjmp op2; go back and ask for number

inrange_2:
mov r0, #0; no of 0s
mov r1, #8; count of 8
mov a, 50h; a is given number
back:
rrc a; rotate right
jc skip; if carry then skip
inc r0; increment 0 count 
skip:
djnz r1, back; loop 8 times
mov a, r0; a is result
mov 51h, a; store result
acall result_2
ljmp main

not2:
mov a, 30h; a is choice
cjne a, #3, not3; check option 3
op3:
acall exit_routine
sjmp done

not3:
acall invalid_choice 
ljmp main


done:
sjmp $

; subroutine welcome
welcome:
acall inlcd; initialse
mov a,#80h; command for line 1
acall cmd
mov dptr, #M11
acall wstr; display line 1
mov a,#0c0h; command for line 2 
acall cmd
mov dptr, #M12
acall wstr; display line 2 
acall delay; wait to see diplay
acall clear; clear display
ret

; subroutine name_id
name_id:
acall inlcd; initialse
mov a,#80h; command for line 1
acall cmd
mov dptr, #M21
acall wstr; display line 1
mov a,#0c0h; command for line 2 
acall cmd
mov dptr, #M22
acall wstr; display line 2 
acall delay; wait to see diplay
acall clear; clear display
ret

; subroutine interrupt key message
intkey:
acall inlcd; initialse
mov a,#80h; command for line 1
acall cmd
mov dptr, #M23
acall wstr; display line 1
mov a,#0c0h; command for line 2 
acall cmd
mov dptr, #M24
acall wstr; display line 2 
waitint:
acall keypad
cjne a, #'#', waitint
acall wchr
acall ldelay
acall clear; clear display
ret

; subroutine main_menu
main_menu:
acall inlcd; initialse
mov a,#80h; command for line 1
acall cmd
mov dptr, #M31
acall wstr; display line 1
mov a,#0c0h; command for line 2 
acall cmd
mov dptr, #M32
acall wstr; display line 2 

acall keypad; ask user to enter
acall wchr; display key on LCD
subb a, #30h; ascii 
mov 30h, a; store choice at 30h

acall delay; wait to see diplay
acall clear; clear display
ret

; subroutine enter_num
enter_num:
acall inlcd; initialse
mov a,#80h; command for line 1
acall cmd
mov dptr, #M41
acall wstr; display line 1
mov a,#0c0h; command for line 2 
acall cmd
mov dptr, #M42
acall wstr; display line 2 

acall keypad; ask user to enter
acall wchr; display key on LCD
cjne a,#'*',no_star
acall error
sjmp enter_num
no_star:
cjne a,#'#',no_hash
acall clear
acall error
sjmp enter_num
no_hash:  
subb a, #30h; ascii 
mov 41h, a; store 1st key at 41h

acall keypad; ask user to enter
acall wchr; display key on LCD
cjne a,#'*',no_star2
acall clear
acall error
sjmp enter_num
no_star2:
cjne a,#'#',no_hash2
acall error
sjmp enter_num
no_hash2:  
subb a, #30h; ascii 
mov 42h, a; store 2nd key at 42h

mov a, 41h; take digit 1
swap a; move to tens position
add a, 42h; make 2 digit number
mov 40h, a; store num at 40h for op1
mov 50h, a; store num at 50h for op2
acall delay; wait to see diplay
acall clear; clear display
ret

; subroutine error_1
error:
acall inlcd; initialse
mov a,#80h; command for line 1
acall cmd
mov dptr, #M61
acall wstr; display line 1
mov a,#0c0h; command for line 2 
acall cmd
mov dptr, #M62
acall wstr; display line 2 

; flash red led
mov p1, #0ffh; all led off
clr p1.0
clr p1.3
clr p1.6; all red on
mov r6, #2
fr:
acall delay
djnz r6, fr
mov p1, #0ffh; all led off
acall clear; clear display
ret

; subroutine result_1
result_1:
acall inlcd; initialse
mov a,#80h; command for line 1
acall cmd
mov dptr, #M5
acall wstr; display line 1

mov a, 41h; a = result
mov b, #10h
div ab; seperate digits
add a, #30h; ascii + 30h
acall wchr; display msb

mov a, b
add a, #30h; ascii + 30h
acall wchr; display msb

acall delay; wait to see diplay
acall clear; clear display
ret

; subroutine result_2
result_2:
acall inlcd; initialse
mov a,#80h; command for line 1
acall cmd
mov dptr, #M7
acall wstr; display line 1

mov a, 51h; a = result
add a, #30h; ascii + 30h
acall wchr; display result

acall delay; wait to see diplay
acall clear; clear display
ret

; subroutine exit_routine
exit_routine:
acall inlcd; initialse
mov a,#80h; command for line 1
acall cmd
mov dptr, #M9
acall wstr; display line 1
acall delay; wait to see diplay
acall clear; clear display
ret



; subroutine invalid_choice
invalid_choice:
acall inlcd; initialse
mov a,#80h; command for line 1
acall cmd
mov dptr, #M10
acall wstr; display line 1

; flash red led
mov p1, #0ffh; all led off
clr p1.0
clr p1.3
clr p1.6; all red on
mov r6, #2
fr2:
acall delay
djnz r6, fr2
mov p1, #0ffh; all led off
acall clear; clear display
ret


;-- Subroutine for delay
delay:
	mov r5, #2
x3:	mov r4, #200
x2:	mov r3, #150
x1:	djnz r3,x1
	djnz r4,x2
	djnz r5,x3
	ret


;- Subroutine to write char 
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

;--Subroutine to write COMMAND 
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

;---Common operation 
COMMON: 
   	ANL a,#11110000B
   	ANL P1, #00001111B
   	ORL P1,A
   	SETB P1.2
   	CLR P1.2
   	RET

; -------  procedure init_display 
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

; -------  procedure delay -------
LDELAY:	
	MOV R0, #50
	DJNZ R0, $	
	RET

;---- Subroutine to write A STRING 
WSTR: 
	PUSH ACC            
CONT1:   
	CLR A               
	MOVC A,@A+DPTR 
	JZ Exit1  
PRINT:
	ACALL WCHR 
	INC DPTR      
	AJMP CONT1 
EXIT1: 
	POP ACC     
    RET 

;---- Subroutine to clear screen
CLEAR:
	MOV A, #01H
	ACALL CMD; 
	MOV R7, #14
Wait:	
	ACALL LDELAY
	DJNZ R7, Wait
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
	

; messages to be displayed

M11:db "Welcome !!"
	db 0
M12:db "Average & Zeros"
	db 0


M21:db "8051 DEMO       "
	db 0
M22:db "8051 DEMO    "
	db 0


M23:db "Press "#" Key"
	db 0
M24:db "To Proceed Ahead"
	db 0


M31:db "1:Avg. 2:Zeros."
	db 0
M32:db "3:Exit. Select:"
	db 0


M41:db "Enter 2 digit no"
	db 0
M42:db "(0...90):"
	db 0


M5:	db "Average = "
	db 0


M61:db "Invalid Entry"
	db 0
M62:db "Out of range !!"
	db 0


M7:	db "No of Zeros = "
	db 0


M81:db "Invalid Entry"
	db 0
M82:db "Out of range !!"
	db 0


M9:	db "Thank You !!"
	db 0


M10:db "Invalid Choice"
	db 0


end
