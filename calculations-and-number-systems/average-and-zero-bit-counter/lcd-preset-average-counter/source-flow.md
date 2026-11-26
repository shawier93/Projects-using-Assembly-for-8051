# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 4 to 4"]
B1["B2: instructions - lines 6 to 6"]
B2["B3: instructions - lines 7 to 7"]
B3["B4: instructions - lines 8 to 8"]
B4["B5: instructions - lines 12 to 22"]
B5["B6: MIAN - lines 25 to 25"]
B6["B7: instructions - lines 28 to 33"]
B7["B8: instructions - lines 34 to 34"]
B8["B9: ZEROOS - lines 37 to 37"]
B9["B10: instructions - lines 38 to 39"]
B0 -->|call| B84
B0 -->|after return| B1
B1 -->|call| B91
B1 -->|after return| B2
B2 -->|call| B24
B2 -->|after return| B3
B3 -->|call| B28
B3 -->|after return| B4
B4 -->|next| B5
B5 -->|condition true| B8
B5 -->|condition false| B6
B6 -->|call| B36
B6 -->|after return| B7
B7 -->|jump| B13
B8 -->|condition true| B12
B8 -->|condition false| B9
B9 -->|call| B14
B9 -->|after return| B10
B84["Continue at B85 in section 9"]
B91["Continue at B92 in section 10"]
B24["Continue at B25 in section 3"]
B28["Continue at B29 in section 3"]
B36["Continue at B37 in section 4"]
B13["Continue at B14 in section 2"]
B12["Continue at B13 in section 2"]
B14["Continue at B15 in section 2"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
acall clear
```

### B3

```asm
acall WRITE1
```

### B4

```asm
acall WRITE2
```

### B5

```asm
MOV R1,#2
MOV 40H,#23
MOV 41H,#24
MOV 42H,#0
MOV 50H,#0FH
MOV 51H,#0
```

### B6

```asm
CJNE R1,#1,ZEROOS
```

### B7

```asm
MOV A,40H
ADD A,41H
MOV B,#2
DIV AB
MOV 42H,A
ACALL WRITE3
```

### B8

```asm
SJMP BACK
```

### B9

```asm
CJNE R1,#2, WRONG
```

### B10

```asm
MOV A,50H
ACALL COUNT
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 40 to 41"]
B11["B12: instructions - lines 43 to 43"]
B12["B13: WRONG - lines 47 to 47"]
B13["B14: BACK - lines 50 to 50"]
B14["B15: COUNT - lines 53 to 54"]
B15["B16: HERE - lines 56 to 59"]
B16["B17: instructions - lines 60 to 60"]
B17["B18: NO - lines 62 to 62"]
B18["B19: instructions - lines 64 to 64"]
B19["B20: DELAY - lines 67 to 67"]
B10 -->|call| B57
B10 -->|after return| B11
B11 -->|jump| B13
B12 -->|call| B12
B12 -->|after return| B13
B13 -->|jump| B13
B14 -->|next| B15
B15 -->|condition true| B17
B15 -->|condition false| B16
B16 -->|next| B17
B17 -->|condition true| B15
B17 -->|condition false| B18
B19 -->|next| B20
B57["Continue at B58 in section 6"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV 30H,51H
ACALL WRITE4
```

### B12

```asm
SJMP BACK
```

### B13

```asm
ACALL WRONG
```

### B14

```asm
SJMP BACK
```

### B15

```asm
MOV A,50H
MOV R4,#8
```

### B16

```asm
MOV B,#2
DIV AB
MOV R0,B
CJNE R0,#0,NO
```

### B17

```asm
INC 51H
```

### B18

```asm
DJNZ R4,HERE
```

### B19

Return to the instruction following the active call.

```asm
RET
```

### B20

```asm
MOV R0,#20
```

## Section 3

```mermaid
flowchart TD
B20["B21: AGAIN - lines 68 to 68"]
B21["B22: AGAIN2 - lines 69 to 69"]
B22["B23: instructions - lines 70 to 70"]
B23["B24: instructions - lines 71 to 71"]
B24["B25: WRITE1 - lines 74 to 75"]
B25["B26: instructions - lines 76 to 77"]
B26["B27: instructions - lines 78 to 78"]
B27["B28: instructions - lines 79 to 79"]
B28["B29: WRITE2 - lines 83 to 83"]
B29["B30: instructions - lines 84 to 85"]
B20 -->|next| B21
B21 -->|condition true| B21
B21 -->|condition false| B22
B22 -->|condition true| B20
B22 -->|condition false| B23
B24 -->|call| B78
B24 -->|after return| B25
B25 -->|call| B96
B25 -->|after return| B26
B26 -->|call| B19
B26 -->|after return| B27
B28 -->|call| B91
B28 -->|after return| B29
B29 -->|call| B78
B29 -->|after return| B30
B78["Continue at B79 in section 8"]
B96["Continue at B97 in section 10"]
B19["Continue at B20 in section 2"]
B91["Continue at B92 in section 10"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV R1,#90
```

### B22

```asm
DJNZ R1,AGAIN2
```

### B23

```asm
DJNZ R0,AGAIN
```

### B24

Return to the instruction following the active call.

```asm
RET
```

### B25

```asm
mov a, #80H
acall cmd
```

### B26

```asm
mov dptr, #STR1
acall WSTR
```

### B27

```asm
ACALL DELAY
```

### B28

Return to the instruction following the active call.

```asm
RET
```

### B29

```asm
ACALL CLEAR
```

### B30

```asm
mov a, #80H
acall cmd
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 86 to 87"]
B31["B32: instructions - lines 88 to 88"]
B32["B33: instructions - lines 90 to 91"]
B33["B34: instructions - lines 92 to 93"]
B34["B35: instructions - lines 94 to 94"]
B35["B36: instructions - lines 95 to 95"]
B36["B37: WRITE3 - lines 101 to 101"]
B37["B38: instructions - lines 102 to 103"]
B38["B39: instructions - lines 104 to 105"]
B39["B40: instructions - lines 106 to 106"]
B30 -->|call| B96
B30 -->|after return| B31
B31 -->|call| B19
B31 -->|after return| B32
B32 -->|call| B78
B32 -->|after return| B33
B33 -->|call| B96
B33 -->|after return| B34
B34 -->|call| B19
B34 -->|after return| B35
B36 -->|call| B91
B36 -->|after return| B37
B37 -->|call| B78
B37 -->|after return| B38
B38 -->|call| B96
B38 -->|after return| B39
B39 -->|call| B19
B39 -->|after return| B40
B96["Continue at B97 in section 10"]
B19["Continue at B20 in section 2"]
B78["Continue at B79 in section 8"]
B91["Continue at B92 in section 10"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
mov dptr, #STR2
acall WSTR
```

### B32

```asm
ACALL DELAY
```

### B33

```asm
mov a, #0C0H
acall cmd
```

### B34

```asm
mov dptr, #STR3
acall WSTR
```

### B35

```asm
ACALL DELAY
```

### B36

Return to the instruction following the active call.

```asm
RET
```

### B37

```asm
ACALL CLEAR
```

### B38

```asm
mov a, #80H
acall cmd
```

### B39

```asm
mov dptr, #STR4
acall WSTR
```

### B40

```asm
ACALL DELAY
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 108 to 109"]
B41["B42: instructions - lines 110 to 114"]
B42["B43: instructions - lines 115 to 117"]
B43["B44: instructions - lines 118 to 118"]
B44["B45: instructions - lines 120 to 121"]
B45["B46: instructions - lines 122 to 126"]
B46["B47: instructions - lines 127 to 129"]
B47["B48: instructions - lines 130 to 130"]
B48["B49: instructions - lines 133 to 133"]
B49["B50: instructions - lines 134 to 135"]
B40 -->|call| B78
B40 -->|after return| B41
B41 -->|call| B73
B41 -->|after return| B42
B42 -->|call| B73
B42 -->|after return| B43
B43 -->|call| B19
B43 -->|after return| B44
B44 -->|call| B78
B44 -->|after return| B45
B45 -->|call| B73
B45 -->|after return| B46
B46 -->|call| B73
B46 -->|after return| B47
B47 -->|call| B19
B47 -->|after return| B48
B48 -->|call| B91
B48 -->|after return| B49
B49 -->|call| B78
B49 -->|after return| B50
B78["Continue at B79 in section 8"]
B73["Continue at B74 in section 8"]
B19["Continue at B20 in section 2"]
B91["Continue at B92 in section 10"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
mov a, #0C0H
acall cmd
```

### B42

```asm
mov a,40H
mov b,#10
div ab
add a,#30h
acall wchr
```

### B43

```asm
mov a,b
add a,#30h
acall wchr
```

### B44

```asm
ACALL DELAY
```

### B45

```asm
mov a, #0C8H
acall cmd
```

### B46

```asm
mov a,41H
mov b,#10
div ab
add a,#30h
acall wchr
```

### B47

```asm
mov a,b
add a,#30h
acall wchr
```

### B48

```asm
ACALL DELAY
```

### B49

```asm
ACALL CLEAR
```

### B50

```asm
mov a, #80H
acall cmd
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 136 to 137"]
B51["B52: instructions - lines 138 to 138"]
B52["B53: instructions - lines 140 to 141"]
B53["B54: instructions - lines 142 to 146"]
B54["B55: instructions - lines 147 to 149"]
B55["B56: instructions - lines 150 to 150"]
B56["B57: instructions - lines 151 to 151"]
B57["B58: WRITE4 - lines 154 to 154"]
B58["B59: instructions - lines 155 to 156"]
B59["B60: instructions - lines 157 to 158"]
B50 -->|call| B96
B50 -->|after return| B51
B51 -->|call| B19
B51 -->|after return| B52
B52 -->|call| B78
B52 -->|after return| B53
B53 -->|call| B73
B53 -->|after return| B54
B54 -->|call| B73
B54 -->|after return| B55
B55 -->|call| B19
B55 -->|after return| B56
B57 -->|call| B91
B57 -->|after return| B58
B58 -->|call| B78
B58 -->|after return| B59
B59 -->|call| B96
B59 -->|after return| B60
B96["Continue at B97 in section 10"]
B19["Continue at B20 in section 2"]
B78["Continue at B79 in section 8"]
B73["Continue at B74 in section 8"]
B91["Continue at B92 in section 10"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
mov dptr, #STR6
acall WSTR
```

### B52

```asm
ACALL DELAY
```

### B53

```asm
mov a, #0C0H
acall cmd
```

### B54

```asm
mov a,42H
mov b,#10
div ab
add a,#30h
acall wchr
```

### B55

```asm
mov a,b
add a,#30h
acall wchr
```

### B56

```asm
ACALL DELAY
```

### B57

Return to the instruction following the active call.

```asm
RET
```

### B58

```asm
ACALL CLEAR
```

### B59

```asm
mov a, #80H
acall cmd
```

### B60

```asm
mov dptr, #STR5
acall WSTR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 159 to 159"]
B61["B62: instructions - lines 161 to 162"]
B62["B63: instructions - lines 163 to 167"]
B63["B64: instructions - lines 168 to 170"]
B64["B65: instructions - lines 171 to 171"]
B65["B66: instructions - lines 174 to 174"]
B66["B67: instructions - lines 175 to 176"]
B67["B68: instructions - lines 177 to 178"]
B68["B69: instructions - lines 179 to 179"]
B69["B70: instructions - lines 181 to 182"]
B60 -->|call| B19
B60 -->|after return| B61
B61 -->|call| B78
B61 -->|after return| B62
B62 -->|call| B73
B62 -->|after return| B63
B63 -->|call| B73
B63 -->|after return| B64
B64 -->|call| B19
B64 -->|after return| B65
B65 -->|call| B91
B65 -->|after return| B66
B66 -->|call| B78
B66 -->|after return| B67
B67 -->|call| B96
B67 -->|after return| B68
B68 -->|call| B19
B68 -->|after return| B69
B69 -->|call| B78
B69 -->|after return| B70
B19["Continue at B20 in section 2"]
B78["Continue at B79 in section 8"]
B73["Continue at B74 in section 8"]
B91["Continue at B92 in section 10"]
B96["Continue at B97 in section 10"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL DELAY
```

### B62

```asm
mov a, #0C0H
acall cmd
```

### B63

```asm
mov a,50H
mov b,#10
div ab
add a,#30h
acall wchr
```

### B64

```asm
mov a,b
add a,#30h
acall wchr
```

### B65

```asm
ACALL DELAY
```

### B66

```asm
ACALL CLEAR
```

### B67

```asm
mov a, #80H
acall cmd
```

### B68

```asm
mov dptr, #STR6
acall WSTR
```

### B69

```asm
ACALL DELAY
```

### B70

```asm
mov a, #0C0H
acall cmd
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 183 to 185"]
B71["B72: instructions - lines 186 to 186"]
B72["B73: instructions - lines 187 to 187"]
B73["B74: WCHR - lines 190 to 194"]
B74["B75: instructions - lines 195 to 195"]
B75["B76: instructions - lines 196 to 198"]
B76["B77: instructions - lines 199 to 199"]
B77["B78: instructions - lines 200 to 202"]
B78["B79: CMD - lines 205 to 207"]
B79["B80: instructions - lines 208 to 208"]
B70 -->|call| B73
B70 -->|after return| B71
B71 -->|call| B19
B71 -->|after return| B72
B73 -->|call| B83
B73 -->|after return| B74
B74 -->|call| B89
B74 -->|after return| B75
B75 -->|call| B83
B75 -->|after return| B76
B76 -->|call| B89
B76 -->|after return| B77
B78 -->|call| B83
B78 -->|after return| B79
B79 -->|call| B89
B79 -->|after return| B80
B19["Continue at B20 in section 2"]
B83["Continue at B84 in section 9"]
B89["Continue at B90 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
mov a,51H
add a,#30h
acall wchr
```

### B72

```asm
ACALL DELAY
```

### B73

Return to the instruction following the active call.

```asm
RET
```

### B74

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B75

```asm
ACALL LDELAY
```

### B76

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B77

```asm
ACALL LDELAY
```

### B78

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B79

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B80

```asm
ACALL LDELAY
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 209 to 211"]
B81["B82: instructions - lines 212 to 212"]
B82["B83: instructions - lines 213 to 213"]
B83["B84: COMMON - lines 216 to 221"]
B84["B85: INLCD - lines 224 to 231"]
B85["B86: instructions - lines 232 to 240"]
B86["B87: instructions - lines 241 to 253"]
B87["B88: instructions - lines 254 to 264"]
B88["B89: instructions - lines 265 to 265"]
B89["B90: LDELAY - lines 268 to 269"]
B80 -->|call| B83
B80 -->|after return| B81
B81 -->|call| B89
B81 -->|after return| B82
B84 -->|call| B89
B84 -->|after return| B85
B85 -->|call| B89
B85 -->|after return| B86
B86 -->|call| B89
B86 -->|after return| B87
B87 -->|call| B89
B87 -->|after return| B88
B89 -->|condition true| B89
B89 -->|condition false| B90
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B82

```asm
ACALL LDELAY
```

### B83

Return to the instruction following the active call.

```asm
RET
```

### B84

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B85

```asm
CLR P1.3
CLR P1.7
CLR P1.6
SETB P1.5
CLR P1.4
SETB P1.2
CLR P1.2
ACALL LDELAY
```

### B86

```asm
SETB P1.2
CLR P1.2
SETB P1.7
CLR P1.6
CLR P1.5
CLR P1.4
SETB P1.2
CLR P1.2
ACALL LDELAY
```

### B87

```asm
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
```

### B88

```asm
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
```

### B89

Return to the instruction following the active call.

```asm
RET
```

### B90

```asm
MOV R0, #50
DJNZ R0, $
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 270 to 270"]
B91["B92: CLEAR - lines 273 to 274"]
B92["B93: instructions - lines 275 to 275"]
B93["B94: WAIT - lines 276 to 276"]
B94["B95: instructions - lines 277 to 277"]
B95["B96: instructions - lines 278 to 278"]
B96["B97: WSTR - lines 281 to 281"]
B97["B98: CONT1 - lines 283 to 285"]
B98["B99: PRINT - lines 287 to 287"]
B99["B100: instructions - lines 288 to 289"]
B91 -->|call| B78
B91 -->|after return| B92
B92 -->|next| B93
B93 -->|call| B89
B93 -->|after return| B94
B94 -->|condition true| B93
B94 -->|condition false| B95
B96 -->|next| B97
B97 -->|condition true| B100
B97 -->|condition false| B98
B98 -->|call| B73
B98 -->|after return| B99
B99 -->|jump| B97
B78["Continue at B79 in section 8"]
B89["Continue at B90 in section 9"]
B100["Continue at B101 in section 11"]
B73["Continue at B74 in section 8"]
```

### B91

Return to the instruction following the active call.

```asm
RET
```

### B92

```asm
MOV A,#01H
ACALL CMD
```

### B93

```asm
MOV R7,#14
```

### B94

```asm
ACALL LDELAY
```

### B95

```asm
DJNZ R7,WAIT
```

### B96

Return to the instruction following the active call.

```asm
ret
```

### B97

```asm
PUSH    ACC
```

### B98

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B99

```asm
ACALL    WCHR
```

### B100

```asm
INC DPTR
AJMP    CONT1
```

## Section 11

```mermaid
flowchart TD
B100["B101: EXIT1 - lines 290 to 291"]
```

### B101

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
