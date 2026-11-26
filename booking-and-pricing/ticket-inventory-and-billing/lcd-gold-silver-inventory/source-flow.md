# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10)

## Section 1

```mermaid
flowchart TD
B0["B1: MAIN - lines 6 to 6"]
B1["B2: instructions - lines 7 to 10"]
B2["B3: WELCOME - lines 13 to 14"]
B3["B4: instructions - lines 15 to 15"]
B4["B5: instructions - lines 16 to 17"]
B5["B6: instructions - lines 18 to 19"]
B6["B7: instructions - lines 20 to 20"]
B7["B8: MAIN_MENUE - lines 23 to 24"]
B8["B9: instructions - lines 25 to 25"]
B9["B10: instructions - lines 26 to 27"]
B0 -->|call| B76
B0 -->|after return| B1
B1 -->|next| B2
B2 -->|call| B70
B2 -->|after return| B3
B3 -->|call| B83
B3 -->|after return| B4
B4 -->|call| B70
B4 -->|after return| B5
B5 -->|call| B60
B5 -->|after return| B6
B6 -->|call| B90
B6 -->|after return| B7
B7 -->|call| B70
B7 -->|after return| B8
B8 -->|call| B83
B8 -->|after return| B9
B9 -->|call| B70
B9 -->|after return| B10
B76["Continue at B77 in section 8"]
B70["Continue at B71 in section 8"]
B83["Continue at B84 in section 9"]
B60["Continue at B61 in section 7"]
B90["Continue at B91 in section 10"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV 30H,#01H
MOV 33H,#09H
MOV 34H,#09H
MOV 40H,#04H
```

### B3

```asm
MOV A, #1H
ACALL CMD
```

### B4

```asm
ACALL CLR_DELAY
```

### B5

```asm
MOV A,#80H
ACALL CMD
```

### B6

```asm
MOV DPTR, #WELCOME_MSG
ACALL WSTR
```

### B7

```asm
ACALL DELAY_2SEC
```

### B8

```asm
MOV A, #1H
ACALL CMD
```

### B9

```asm
ACALL CLR_DELAY
```

### B10

```asm
MOV A,#80H
ACALL CMD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 28 to 29"]
B11["B12: instructions - lines 30 to 33"]
B12["B13: instructions - lines 34 to 34"]
B13["B14: GOLD_TICKETS - lines 38 to 38"]
B14["B15: instructions - lines 39 to 42"]
B15["B16: instructions - lines 43 to 43"]
B16["B17: instructions - lines 44 to 45"]
B17["B18: instructions - lines 46 to 47"]
B18["B19: instructions - lines 48 to 49"]
B19["B20: instructions - lines 55 to 59"]
B10 -->|call| B60
B10 -->|after return| B11
B11 -->|call| B65
B11 -->|after return| B12
B12 -->|call| B90
B12 -->|after return| B13
B13 -->|condition true| B32
B13 -->|condition false| B14
B14 -->|call| B70
B14 -->|after return| B15
B15 -->|call| B83
B15 -->|after return| B16
B16 -->|call| B70
B16 -->|after return| B17
B17 -->|call| B60
B17 -->|after return| B18
B18 -->|call| B57
B18 -->|after return| B19
B19 -->|condition true| B21
B19 -->|condition false| B20
B60["Continue at B61 in section 7"]
B65["Continue at B66 in section 7"]
B90["Continue at B91 in section 10"]
B32["Continue at B33 in section 4"]
B70["Continue at B71 in section 8"]
B83["Continue at B84 in section 9"]
B57["Continue at B58 in section 6"]
B21["Continue at B22 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV DPTR, #MENUE_MSG
ACALL WSTR
```

### B12

```asm
MOV A, 30H
MOV R2, A
ADD A, #30H
ACALL WCHR
```

### B13

```asm
ACALL DELAY_2SEC
```

### B14

```asm
CJNE R2, #1, SILVER_TICKETS
```

### B15

```asm
MOV A, 40H
MOV R1, A
MOV A, #1H
ACALL CMD
```

### B16

```asm
ACALL CLR_DELAY
```

### B17

```asm
MOV A,#80H
ACALL CMD
```

### B18

```asm
MOV DPTR, #TICKETS_MSG
ACALL WSTR
```

### B19

```asm
MOV  A,R1
ACALL DISP_VALUE
```

### B20

```asm
MOV A,33H
MOV B,A
MOV R3,A
MOV A,R1
CJNE A, B, OTHERWISE
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 60 to 60"]
B21["B22: OTHERWISE - lines 62 to 62"]
B22["B23: instructions - lines 64 to 65"]
B23["B24: instructions - lines 66 to 67"]
B24["B25: instructions - lines 68 to 68"]
B25["B26: instructions - lines 69 to 69"]
B26["B27: LESS_EQUAL - lines 73 to 87"]
B27["B28: instructions - lines 88 to 89"]
B28["B29: instructions - lines 90 to 91"]
B29["B30: instructions - lines 92 to 93"]
B20 -->|jump| B26
B21 -->|condition true| B26
B21 -->|condition false| B22
B22 -->|call| B70
B22 -->|after return| B23
B23 -->|call| B60
B23 -->|after return| B24
B24 -->|call| B90
B24 -->|after return| B25
B25 -->|jump| B13
B26 -->|call| B70
B26 -->|after return| B27
B27 -->|call| B60
B27 -->|after return| B28
B28 -->|call| B57
B28 -->|after return| B29
B29 -->|call| B60
B29 -->|after return| B30
B70["Continue at B71 in section 8"]
B60["Continue at B61 in section 7"]
B90["Continue at B91 in section 10"]
B13["Continue at B14 in section 2"]
B57["Continue at B58 in section 6"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
SJMP LESS_EQUAL
```

### B22

```asm
JC LESS_EQUAL
```

### B23

```asm
MOV A,#0C0H
ACALL CMD
```

### B24

```asm
MOV DPTR, #Sorry_MSG
ACALL WSTR
```

### B25

```asm
ACALL DELAY_2SEC
```

### B26

```asm
SJMP GOLD_TICKETS
```

### B27

```asm
MOV A, R3
CLR C
SUBB A,R1
MOV 33H,A
MOV A,R1
MOV B, A
CLR A
MOV DPTR, #GOLD_Price
MOVC A, @A+DPTR
MUL AB
MOV 50H,A
MOV R4, A
MOV A,#0C0H
ACALL CMD
```

### B28

```asm
MOV DPTR, #TICKETS_MSG2
ACALL WSTR
```

### B29

```asm
MOV A, R4
ACALL DISP_VALUE
```

### B30

```asm
MOV DPTR, #TICKETS_MSG3
ACALL WSTR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 94 to 94"]
B31["B32: instructions - lines 95 to 95"]
B32["B33: SILVER_TICKETS - lines 99 to 99"]
B33["B34: instructions - lines 100 to 103"]
B34["B35: instructions - lines 104 to 104"]
B35["B36: instructions - lines 105 to 106"]
B36["B37: instructions - lines 107 to 108"]
B37["B38: instructions - lines 109 to 110"]
B38["B39: instructions - lines 113 to 118"]
B39["B40: instructions - lines 119 to 119"]
B30 -->|call| B90
B30 -->|after return| B31
B31 -->|jump| B7
B32 -->|condition true| B51
B32 -->|condition false| B33
B33 -->|call| B70
B33 -->|after return| B34
B34 -->|call| B83
B34 -->|after return| B35
B35 -->|call| B70
B35 -->|after return| B36
B36 -->|call| B60
B36 -->|after return| B37
B37 -->|call| B57
B37 -->|after return| B38
B38 -->|condition true| B40
B38 -->|condition false| B39
B39 -->|jump| B45
B90["Continue at B91 in section 10"]
B7["Continue at B8 in section 1"]
B51["Continue at B52 in section 6"]
B70["Continue at B71 in section 8"]
B83["Continue at B84 in section 9"]
B60["Continue at B61 in section 7"]
B57["Continue at B58 in section 6"]
B40["Continue at B41 in section 5"]
B45["Continue at B46 in section 5"]
```

### B31

```asm
ACALL DELAY_2SEC
```

### B32

```asm
LJMP MAIN_MENUE
```

### B33

```asm
CJNE R2, #2, EXIT
```

### B34

```asm
MOV A, 40H
MOV R1, A
MOV A, #1H
ACALL CMD
```

### B35

```asm
ACALL CLR_DELAY
```

### B36

```asm
MOV A,#80H
ACALL CMD
```

### B37

```asm
MOV DPTR, #TICKETS_MSG
ACALL WSTR
```

### B38

```asm
MOV A, R1
ACALL DISP_VALUE
```

### B39

```asm
MOV A,34H
MOV B,A
MOV R3,A
MOV A,R1
CJNE A, B,OTHERWISE0
```

### B40

```asm
SJMP LESS_EQUAL0
```

## Section 5

```mermaid
flowchart TD
B40["B41: OTHERWISE0 - lines 121 to 121"]
B41["B42: instructions - lines 122 to 123"]
B42["B43: instructions - lines 124 to 125"]
B43["B44: instructions - lines 126 to 126"]
B44["B45: instructions - lines 127 to 127"]
B45["B46: LESS_EQUAL0 - lines 130 to 143"]
B46["B47: instructions - lines 144 to 145"]
B47["B48: instructions - lines 146 to 147"]
B48["B49: instructions - lines 148 to 149"]
B49["B50: instructions - lines 150 to 150"]
B40 -->|condition true| B45
B40 -->|condition false| B41
B41 -->|call| B70
B41 -->|after return| B42
B42 -->|call| B60
B42 -->|after return| B43
B43 -->|call| B90
B43 -->|after return| B44
B44 -->|jump| B32
B45 -->|call| B70
B45 -->|after return| B46
B46 -->|call| B60
B46 -->|after return| B47
B47 -->|call| B57
B47 -->|after return| B48
B48 -->|call| B60
B48 -->|after return| B49
B49 -->|call| B90
B49 -->|after return| B50
B70["Continue at B71 in section 8"]
B60["Continue at B61 in section 7"]
B90["Continue at B91 in section 10"]
B32["Continue at B33 in section 4"]
B57["Continue at B58 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
JC LESS_EQUAL0
```

### B42

```asm
MOV A,#0C0H
ACALL CMD
```

### B43

```asm
MOV DPTR, #Sorry_MSG
ACALL WSTR
```

### B44

```asm
ACALL DELAY_2SEC
```

### B45

```asm
SJMP SILVER_TICKETS
```

### B46

```asm
MOV A, R3
CLR C
SUBB A,R1
MOV 34H,A
MOV A,R1
MOV B, A
CLR A
MOV DPTR, #SILVER_Price
MOVC A, @A+DPTR
MUL AB
MOV 50H,A
MOV R4, A
MOV A,#0C0H
ACALL CMD
```

### B47

```asm
MOV DPTR, #TICKETS_MSG2
ACALL WSTR
```

### B48

```asm
MOV A, R4
ACALL DISP_VALUE
```

### B49

```asm
MOV DPTR, #TICKETS_MSG3
ACALL WSTR
```

### B50

```asm
ACALL DELAY_2SEC
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 151 to 151"]
B51["B52: EXIT - lines 154 to 155"]
B52["B53: instructions - lines 156 to 156"]
B53["B54: instructions - lines 157 to 158"]
B54["B55: instructions - lines 159 to 160"]
B55["B56: instructions - lines 161 to 161"]
B56["B57: instructions - lines 162 to 162"]
B57["B58: DISP_VALUE - lines 166 to 169"]
B58["B59: instructions - lines 170 to 172"]
B59["B60: instructions - lines 173 to 173"]
B50 -->|jump| B7
B51 -->|call| B70
B51 -->|after return| B52
B52 -->|call| B83
B52 -->|after return| B53
B53 -->|call| B70
B53 -->|after return| B54
B54 -->|call| B60
B54 -->|after return| B55
B55 -->|call| B90
B55 -->|after return| B56
B56 -->|jump| B94
B57 -->|call| B65
B57 -->|after return| B58
B58 -->|call| B65
B58 -->|after return| B59
B7["Continue at B8 in section 1"]
B70["Continue at B71 in section 8"]
B83["Continue at B84 in section 9"]
B60["Continue at B61 in section 7"]
B90["Continue at B91 in section 10"]
B94["Continue at B95 in section 10"]
B65["Continue at B66 in section 7"]
```

### B51

```asm
LJMP MAIN_MENUE
```

### B52

```asm
MOV A, #1H
ACALL CMD
```

### B53

```asm
ACALL CLR_DELAY
```

### B54

```asm
MOV A,#80H
ACALL CMD
```

### B55

```asm
MOV DPTR, #Thanks_MSG
ACALL WSTR
```

### B56

```asm
ACALL DELAY_2SEC
```

### B57

```asm
LJMP END_PROGRAM
```

### B58

```asm
mov b, #10
Div ab
Add a , #30H
Acall WCHR
```

### B59

```asm
Mov a, b
Add a , #30H
Acall WCHR
```

### B60

Return to the instruction following the active call.

```asm
RET
```

## Section 7

```mermaid
flowchart TD
B60["B61: WSTR - lines 179 to 179"]
B61["B62: CONT1 - lines 181 to 183"]
B62["B63: PRINT - lines 185 to 185"]
B63["B64: instructions - lines 186 to 187"]
B64["B65: EXIT1 - lines 188 to 189"]
B65["B66: WCHR - lines 193 to 197"]
B66["B67: instructions - lines 198 to 198"]
B67["B68: instructions - lines 199 to 201"]
B68["B69: instructions - lines 202 to 202"]
B69["B70: instructions - lines 203 to 205"]
B60 -->|next| B61
B61 -->|condition true| B64
B61 -->|condition false| B62
B62 -->|call| B65
B62 -->|after return| B63
B63 -->|jump| B61
B65 -->|call| B75
B65 -->|after return| B66
B66 -->|call| B81
B66 -->|after return| B67
B67 -->|call| B75
B67 -->|after return| B68
B68 -->|call| B81
B68 -->|after return| B69
B75["Continue at B76 in section 8"]
B81["Continue at B82 in section 9"]
```

### B61

```asm
PUSH ACC
```

### B62

```asm
CLR A
MOVC A,@A+DPTR
JZ Exit1
```

### B63

```asm
ACALL WCHR
```

### B64

```asm
INC DPTR
AJMP CONT1
```

### B65

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B66

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B67

```asm
ACALL LDELAY
```

### B68

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B69

```asm
ACALL LDELAY
```

### B70

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 8

```mermaid
flowchart TD
B70["B71: CMD - lines 208 to 210"]
B71["B72: instructions - lines 211 to 211"]
B72["B73: instructions - lines 212 to 214"]
B73["B74: instructions - lines 215 to 215"]
B74["B75: instructions - lines 216 to 216"]
B75["B76: COMMON - lines 219 to 224"]
B76["B77: INLCD - lines 227 to 234"]
B77["B78: instructions - lines 235 to 243"]
B78["B79: instructions - lines 244 to 256"]
B79["B80: instructions - lines 257 to 267"]
B70 -->|call| B75
B70 -->|after return| B71
B71 -->|call| B81
B71 -->|after return| B72
B72 -->|call| B75
B72 -->|after return| B73
B73 -->|call| B81
B73 -->|after return| B74
B76 -->|call| B81
B76 -->|after return| B77
B77 -->|call| B81
B77 -->|after return| B78
B78 -->|call| B81
B78 -->|after return| B79
B79 -->|call| B81
B79 -->|after return| B80
B81["Continue at B82 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B72

```asm
ACALL LDELAY
```

### B73

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B74

```asm
ACALL LDELAY
```

### B75

Return to the instruction following the active call.

```asm
RET
```

### B76

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B77

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

### B78

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

### B79

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

### B80

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

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 268 to 268"]
B81["B82: LDELAY - lines 271 to 272"]
B82["B83: instructions - lines 273 to 273"]
B83["B84: CLR_DELAY - lines 275 to 275"]
B84["B85: LP2 - lines 276 to 276"]
B85["B86: instructions - lines 277 to 277"]
B86["B87: instructions - lines 278 to 278"]
B87["B88: TMSEC - lines 282 to 285"]
B88["B89: BACK - lines 287 to 287"]
B89["B90: instructions - lines 288 to 290"]
B81 -->|condition true| B81
B81 -->|condition false| B82
B83 -->|next| B84
B84 -->|call| B81
B84 -->|after return| B85
B85 -->|condition true| B84
B85 -->|condition false| B86
B87 -->|next| B88
B88 -->|condition true| B88
B88 -->|condition false| B89
```

### B81

Return to the instruction following the active call.

```asm
RET
```

### B82

```asm
MOV R0, #50
DJNZ R0, $
```

### B83

Return to the instruction following the active call.

```asm
RET
```

### B84

```asm
MOV R7, #14
```

### B85

```asm
ACALL LDELAY
```

### B86

```asm
DJNZ R7, LP2
```

### B87

Return to the instruction following the active call.

```asm
RET
```

### B88

```asm
MOV TMOD,#01H
MOV TL0,#0DCH
MOV TH0,#6FH
SETB TR0
```

### B89

```asm
JNB TF0,BACK
```

### B90

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

## Section 10

```mermaid
flowchart TD
B90["B91: DELAY_2SEC - lines 294 to 294"]
B91["B92: LP1 - lines 296 to 296"]
B92["B93: instructions - lines 297 to 297"]
B93["B94: instructions - lines 298 to 298"]
B94["B95: END_PROGRAM - lines 322 to 322"]
B90 -->|next| B91
B91 -->|call| B87
B91 -->|after return| B92
B92 -->|condition true| B91
B92 -->|condition false| B93
B94 -->|jump| B94
B87["Continue at B88 in section 9"]
```

### B91

```asm
MOV R0, #4
```

### B92

```asm
ACALL TMSEC
```

### B93

```asm
DJNZ R0, LP1
```

### B94

Return to the instruction following the active call.

```asm
RET
```

### B95

```asm
SJMP END_PROGRAM
```
