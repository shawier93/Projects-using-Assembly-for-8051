# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.
- `ORG 0003` begins at B2.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 3"]
B1["B2: instructions - lines 5 to 5"]
B2["B3: MAIN - lines 9 to 11"]
B3["B4: instructions - lines 12 to 16"]
B4["B5: LOOP1 - lines 19 to 19"]
B5["B6: instructions - lines 20 to 20"]
B6["B7: instructions - lines 21 to 23"]
B7["B8: START - lines 29 to 30"]
B8["B9: instructions - lines 31 to 31"]
B9["B10: instructions - lines 32 to 33"]
B0 -->|jump| B2
B1 -->|jump| B7
B2 -->|call| B86
B2 -->|after return| B3
B3 -->|call| B62
B3 -->|after return| B4
B4 -->|call| B97
B4 -->|after return| B5
B5 -->|condition true| B4
B5 -->|condition false| B6
B6 -->|jump| B4
B7 -->|call| B80
B7 -->|after return| B8
B8 -->|call| B93
B8 -->|after return| B9
B9 -->|call| B80
B9 -->|after return| B10
B86["Continue at B87 in section 9"]
B62["Continue at B63 in section 7"]
B97["Continue at B98 in section 10"]
B80["Continue at B81 in section 9"]
B93["Continue at B94 in section 10"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
LJMP MAIN
```

### B2

```asm
LJMP START
```

### B3

```asm
MOV IE,#10000001B
SETB IT0
ACALL INLCD
```

### B4

```asm
MOV 30H,#00H
MOV 33H,#09H
MOV 34H,#09H
MOV 40H,#00H
ACALL WELCOME
```

### B5

```asm
ACALL KEYPAD
```

### B6

```asm
CJNE A, #'#',LOOP1
```

### B7

```asm
CLR P3.2
SETB P3.2
SJMP LOOP1
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
B10["B11: instructions - lines 34 to 35"]
B11["B12: instructions - lines 36 to 36"]
B12["B13: instructions - lines 37 to 41"]
B13["B14: instructions - lines 42 to 42"]
B14["B15: GOLD_TICKETS - lines 46 to 46"]
B15["B16: instructions - lines 47 to 48"]
B16["B17: instructions - lines 49 to 49"]
B17["B18: instructions - lines 50 to 51"]
B18["B19: instructions - lines 52 to 53"]
B19["B20: instructions - lines 54 to 54"]
B10 -->|call| B70
B10 -->|after return| B11
B11 -->|call| B97
B11 -->|after return| B12
B12 -->|call| B75
B12 -->|after return| B13
B13 -->|call| B117
B13 -->|after return| B14
B14 -->|condition true| B34
B14 -->|condition false| B15
B15 -->|call| B80
B15 -->|after return| B16
B16 -->|call| B93
B16 -->|after return| B17
B17 -->|call| B80
B17 -->|after return| B18
B18 -->|call| B70
B18 -->|after return| B19
B19 -->|call| B97
B19 -->|after return| B20
B70["Continue at B71 in section 8"]
B97["Continue at B98 in section 10"]
B75["Continue at B76 in section 8"]
B117["Continue at B118 in section 12"]
B34["Continue at B35 in section 4"]
B80["Continue at B81 in section 9"]
B93["Continue at B94 in section 10"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV DPTR, #MENUE_MSG
ACALL WSTR
```

### B12

```asm
ACALL KEYPAD
```

### B13

```asm
SUBB A,#30H
MOV 30H,A
MOV R2, A
ADD A, #30H
ACALL WCHR
```

### B14

```asm
ACALL DELAY_2SEC
```

### B15

```asm
CJNE R2, #1, SILVER_TICKETS
```

### B16

```asm
MOV A, #1H
ACALL CMD
```

### B17

```asm
ACALL CLR_DELAY
```

### B18

```asm
MOV A,#80H
ACALL CMD
```

### B19

```asm
MOV DPTR, #TICKETS_MSG
ACALL WSTR
```

### B20

```asm
ACALL KEYPAD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 55 to 59"]
B21["B22: instructions - lines 66 to 70"]
B22["B23: instructions - lines 71 to 71"]
B23["B24: OTHERWISE - lines 73 to 73"]
B24["B25: instructions - lines 75 to 76"]
B25["B26: instructions - lines 77 to 78"]
B26["B27: instructions - lines 79 to 79"]
B27["B28: instructions - lines 80 to 80"]
B28["B29: LESS_EQUAL - lines 83 to 97"]
B29["B30: instructions - lines 98 to 99"]
B20 -->|call| B75
B20 -->|after return| B21
B21 -->|condition true| B23
B21 -->|condition false| B22
B22 -->|jump| B28
B23 -->|condition true| B28
B23 -->|condition false| B24
B24 -->|call| B80
B24 -->|after return| B25
B25 -->|call| B70
B25 -->|after return| B26
B26 -->|call| B117
B26 -->|after return| B27
B27 -->|jump| B7
B28 -->|call| B80
B28 -->|after return| B29
B29 -->|call| B70
B29 -->|after return| B30
B75["Continue at B76 in section 8"]
B80["Continue at B81 in section 9"]
B70["Continue at B71 in section 8"]
B117["Continue at B118 in section 12"]
B7["Continue at B8 in section 1"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
SUBB A,#30H
MOV 40H,A
MOV  R1,A
ADD A,#30H
ACALL WCHR
```

### B22

```asm
MOV A,33H
MOV B,A
MOV R3,A
MOV A,R1
CJNE A, B, OTHERWISE
```

### B23

```asm
SJMP LESS_EQUAL
```

### B24

```asm
JC LESS_EQUAL
```

### B25

```asm
MOV A,#0C0H
ACALL CMD
```

### B26

```asm
MOV DPTR, #Sorry_MSG
ACALL WSTR
```

### B27

```asm
ACALL DELAY_2SEC
```

### B28

```asm
LJMP MAIN_MENUE
```

### B29

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

### B30

```asm
MOV DPTR, #TICKETS_MSG2
ACALL WSTR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 100 to 101"]
B31["B32: instructions - lines 102 to 103"]
B32["B33: instructions - lines 104 to 104"]
B33["B34: instructions - lines 105 to 105"]
B34["B35: SILVER_TICKETS - lines 109 to 109"]
B35["B36: instructions - lines 111 to 112"]
B36["B37: instructions - lines 113 to 113"]
B37["B38: instructions - lines 114 to 115"]
B38["B39: instructions - lines 116 to 117"]
B39["B40: instructions - lines 118 to 118"]
B30 -->|call| B67
B30 -->|after return| B31
B31 -->|call| B70
B31 -->|after return| B32
B32 -->|call| B117
B32 -->|after return| B33
B33 -->|jump| B7
B34 -->|condition true| B54
B34 -->|condition false| B35
B35 -->|call| B80
B35 -->|after return| B36
B36 -->|call| B93
B36 -->|after return| B37
B37 -->|call| B80
B37 -->|after return| B38
B38 -->|call| B70
B38 -->|after return| B39
B39 -->|call| B97
B39 -->|after return| B40
B67["Continue at B68 in section 7"]
B70["Continue at B71 in section 8"]
B117["Continue at B118 in section 12"]
B7["Continue at B8 in section 1"]
B54["Continue at B55 in section 6"]
B80["Continue at B81 in section 9"]
B93["Continue at B94 in section 10"]
B97["Continue at B98 in section 10"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A, R4
ACALL DISP_VALUE
```

### B32

```asm
MOV DPTR, #TICKETS_MSG3
ACALL WSTR
```

### B33

```asm
ACALL DELAY_2SEC
```

### B34

```asm
LJMP MAIN_MENUE
```

### B35

```asm
CJNE R2, #2, EXIT
```

### B36

```asm
MOV A, #1H
ACALL CMD
```

### B37

```asm
ACALL CLR_DELAY
```

### B38

```asm
MOV A,#80H
ACALL CMD
```

### B39

```asm
MOV DPTR, #TICKETS_MSG
ACALL WSTR
```

### B40

```asm
ACALL KEYPAD
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 119 to 123"]
B41["B42: instructions - lines 126 to 131"]
B42["B43: instructions - lines 132 to 132"]
B43["B44: OTHERWISE0 - lines 134 to 134"]
B44["B45: instructions - lines 135 to 136"]
B45["B46: instructions - lines 137 to 138"]
B46["B47: instructions - lines 139 to 139"]
B47["B48: instructions - lines 140 to 140"]
B48["B49: LESS_EQUAL0 - lines 142 to 156"]
B49["B50: instructions - lines 157 to 158"]
B40 -->|call| B75
B40 -->|after return| B41
B41 -->|condition true| B43
B41 -->|condition false| B42
B42 -->|jump| B48
B43 -->|condition true| B48
B43 -->|condition false| B44
B44 -->|call| B80
B44 -->|after return| B45
B45 -->|call| B70
B45 -->|after return| B46
B46 -->|call| B117
B46 -->|after return| B47
B47 -->|jump| B7
B48 -->|call| B80
B48 -->|after return| B49
B49 -->|call| B70
B49 -->|after return| B50
B75["Continue at B76 in section 8"]
B80["Continue at B81 in section 9"]
B70["Continue at B71 in section 8"]
B117["Continue at B118 in section 12"]
B7["Continue at B8 in section 1"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
SUBB A,#30H
MOV 40H,A
MOV R1,A
ADD A,#30H
ACALL WCHR
```

### B42

```asm
MOV A,34H
MOV B,A
MOV R3,A
MOV A,R1
CJNE A, B,OTHERWISE0
```

### B43

```asm
SJMP LESS_EQUAL0
```

### B44

```asm
JC LESS_EQUAL0
```

### B45

```asm
MOV A,#0C0H
ACALL CMD
```

### B46

```asm
MOV DPTR, #Sorry_MSG
ACALL WSTR
```

### B47

```asm
ACALL DELAY_2SEC
```

### B48

```asm
LJMP MAIN_MENUE
```

### B49

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

### B50

```asm
MOV DPTR, #TICKETS_MSG2
ACALL WSTR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 159 to 160"]
B51["B52: instructions - lines 161 to 162"]
B52["B53: instructions - lines 163 to 163"]
B53["B54: instructions - lines 164 to 164"]
B54["B55: EXIT - lines 168 to 169"]
B55["B56: instructions - lines 170 to 170"]
B56["B57: instructions - lines 171 to 172"]
B57["B58: instructions - lines 173 to 174"]
B58["B59: instructions - lines 175 to 175"]
B59["B60: instructions - lines 176 to 176"]
B50 -->|call| B67
B50 -->|after return| B51
B51 -->|call| B70
B51 -->|after return| B52
B52 -->|call| B117
B52 -->|after return| B53
B53 -->|jump| B60
B54 -->|call| B80
B54 -->|after return| B55
B55 -->|call| B93
B55 -->|after return| B56
B56 -->|call| B80
B56 -->|after return| B57
B57 -->|call| B70
B57 -->|after return| B58
B58 -->|call| B117
B58 -->|after return| B59
B59 -->|jump| B121
B67["Continue at B68 in section 7"]
B70["Continue at B71 in section 8"]
B117["Continue at B118 in section 12"]
B60["Continue at B61 in section 7"]
B80["Continue at B81 in section 9"]
B93["Continue at B94 in section 10"]
B121["Continue at B122 in section 13"]
```

### B51

```asm
MOV A, R4
ACALL DISP_VALUE
```

### B52

```asm
MOV DPTR, #TICKETS_MSG3
ACALL WSTR
```

### B53

```asm
ACALL DELAY_2SEC
```

### B54

```asm
LJMP EXIT_INT
```

### B55

```asm
MOV A, #1H
ACALL CMD
```

### B56

```asm
ACALL CLR_DELAY
```

### B57

```asm
MOV A,#80H
ACALL CMD
```

### B58

```asm
MOV DPTR, #Thanks_MSG
ACALL WSTR
```

### B59

```asm
ACALL DELAY_2SEC
```

### B60

```asm
LJMP END_PROGRAM
```

## Section 7

```mermaid
flowchart TD
B60["B61: EXIT_INT - lines 179 to 179"]
B61["B62: instructions - lines 180 to 180"]
B62["B63: WELCOME - lines 184 to 185"]
B63["B64: instructions - lines 186 to 186"]
B64["B65: instructions - lines 187 to 188"]
B65["B66: instructions - lines 189 to 190"]
B66["B67: instructions - lines 191 to 191"]
B67["B68: DISP_VALUE - lines 196 to 199"]
B68["B69: instructions - lines 200 to 202"]
B69["B70: instructions - lines 203 to 203"]
B60 -->|call| B62
B60 -->|after return| B61
B62 -->|call| B80
B62 -->|after return| B63
B63 -->|call| B93
B63 -->|after return| B64
B64 -->|call| B80
B64 -->|after return| B65
B65 -->|call| B70
B65 -->|after return| B66
B67 -->|call| B75
B67 -->|after return| B68
B68 -->|call| B75
B68 -->|after return| B69
B80["Continue at B81 in section 9"]
B93["Continue at B94 in section 10"]
B70["Continue at B71 in section 8"]
B75["Continue at B76 in section 8"]
```

### B61

```asm
ACALL WELCOME
```

### B62

Resume the interrupted program.

```asm
RETI
```

### B63

```asm
MOV A, #1H
ACALL CMD
```

### B64

```asm
ACALL CLR_DELAY
```

### B65

```asm
MOV A,#80H
ACALL CMD
```

### B66

```asm
MOV DPTR, #WELCOME_MSG
ACALL WSTR
```

### B67

Return to the instruction following the active call.

```asm
RET
```

### B68

```asm
mov b, #10
Div ab
Add a , #30H
Acall WCHR
```

### B69

```asm
Mov a, b
Add a , #30H
Acall WCHR
```

### B70

Return to the instruction following the active call.

```asm
RET
```

## Section 8

```mermaid
flowchart TD
B70["B71: WSTR - lines 209 to 209"]
B71["B72: CONT1 - lines 211 to 213"]
B72["B73: PRINT - lines 215 to 215"]
B73["B74: instructions - lines 216 to 217"]
B74["B75: EXIT1 - lines 218 to 219"]
B75["B76: WCHR - lines 223 to 227"]
B76["B77: instructions - lines 228 to 228"]
B77["B78: instructions - lines 229 to 231"]
B78["B79: instructions - lines 232 to 232"]
B79["B80: instructions - lines 233 to 235"]
B70 -->|next| B71
B71 -->|condition true| B74
B71 -->|condition false| B72
B72 -->|call| B75
B72 -->|after return| B73
B73 -->|jump| B71
B75 -->|call| B85
B75 -->|after return| B76
B76 -->|call| B91
B76 -->|after return| B77
B77 -->|call| B85
B77 -->|after return| B78
B78 -->|call| B91
B78 -->|after return| B79
B85["Continue at B86 in section 9"]
B91["Continue at B92 in section 10"]
```

### B71

```asm
PUSH ACC
```

### B72

```asm
CLR A
MOVC A,@A+DPTR
JZ Exit1
```

### B73

```asm
ACALL WCHR
```

### B74

```asm
INC DPTR
AJMP CONT1
```

### B75

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B76

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B77

```asm
ACALL LDELAY
```

### B78

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B79

```asm
ACALL LDELAY
```

### B80

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 9

```mermaid
flowchart TD
B80["B81: CMD - lines 238 to 240"]
B81["B82: instructions - lines 241 to 241"]
B82["B83: instructions - lines 242 to 244"]
B83["B84: instructions - lines 245 to 245"]
B84["B85: instructions - lines 246 to 246"]
B85["B86: COMMON - lines 249 to 254"]
B86["B87: INLCD - lines 257 to 264"]
B87["B88: instructions - lines 265 to 273"]
B88["B89: instructions - lines 274 to 286"]
B89["B90: instructions - lines 287 to 297"]
B80 -->|call| B85
B80 -->|after return| B81
B81 -->|call| B91
B81 -->|after return| B82
B82 -->|call| B85
B82 -->|after return| B83
B83 -->|call| B91
B83 -->|after return| B84
B86 -->|call| B91
B86 -->|after return| B87
B87 -->|call| B91
B87 -->|after return| B88
B88 -->|call| B91
B88 -->|after return| B89
B89 -->|call| B91
B89 -->|after return| B90
B91["Continue at B92 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B82

```asm
ACALL LDELAY
```

### B83

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B84

```asm
ACALL LDELAY
```

### B85

Return to the instruction following the active call.

```asm
RET
```

### B86

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B87

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

### B88

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

### B89

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

### B90

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

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 298 to 298"]
B91["B92: LDELAY - lines 301 to 302"]
B92["B93: instructions - lines 303 to 303"]
B93["B94: CLR_DELAY - lines 305 to 305"]
B94["B95: LP2 - lines 306 to 306"]
B95["B96: instructions - lines 307 to 307"]
B96["B97: instructions - lines 308 to 308"]
B97["B98: KEYPAD - lines 312 to 312"]
B98["B99: K1 - lines 313 to 316"]
B99["B100: K2 - lines 318 to 320"]
B91 -->|condition true| B91
B91 -->|condition false| B92
B93 -->|next| B94
B94 -->|call| B91
B94 -->|after return| B95
B95 -->|condition true| B94
B95 -->|condition false| B96
B97 -->|next| B98
B98 -->|condition true| B98
B98 -->|condition false| B99
B99 -->|condition true| B101
B99 -->|condition false| B100
B101["Continue at B102 in section 11"]
B100["Continue at B101 in section 11"]
```

### B91

Return to the instruction following the active call.

```asm
RET
```

### B92

```asm
MOV R0, #50
DJNZ R0, $
```

### B93

Return to the instruction following the active call.

```asm
RET
```

### B94

```asm
MOV R7, #14
```

### B95

```asm
ACALL LDELAY
```

### B96

```asm
DJNZ R7, LP2
```

### B97

Return to the instruction following the active call.

```asm
RET
```

### B98

```asm
MOV P0,#01110000B
```

### B99

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B100

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 321 to 321"]
B101["B102: OVER1 - lines 323 to 326"]
B102["B103: instructions - lines 327 to 330"]
B103["B104: instructions - lines 331 to 334"]
B104["B105: instructions - lines 335 to 338"]
B105["B106: instructions - lines 339 to 339"]
B106["B107: ROW_0 - lines 340 to 341"]
B107["B108: ROW_1 - lines 342 to 343"]
B108["B109: ROW_2 - lines 344 to 345"]
B109["B110: ROW_3 - lines 346 to 346"]
B100 -->|jump| B99
B101 -->|condition true| B106
B101 -->|condition false| B102
B102 -->|condition true| B107
B102 -->|condition false| B103
B103 -->|condition true| B108
B103 -->|condition false| B104
B104 -->|condition true| B109
B104 -->|condition false| B105
B105 -->|jump| B99
B106 -->|jump| B110
B107 -->|jump| B110
B108 -->|jump| B110
B109 -->|next| B110
B99["Continue at B100 in section 10"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
SJMP K2
```

### B102

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B103

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B104

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B105

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B106

```asm
LJMP K2
```

### B107

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B108

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B109

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B110

```asm
MOV DPTR,#KCODE3
```

## Section 12

```mermaid
flowchart TD
B110["B111: FIND - lines 348 to 348"]
B111["B112: FIND1 - lines 350 to 351"]
B112["B113: instructions - lines 352 to 353"]
B113["B114: MATCH - lines 354 to 356"]
B114["B115: TMSEC - lines 366 to 369"]
B115["B116: BACK - lines 371 to 371"]
B116["B117: instructions - lines 372 to 374"]
B117["B118: DELAY_2SEC - lines 378 to 378"]
B118["B119: LP1 - lines 380 to 380"]
B119["B120: instructions - lines 381 to 381"]
B110 -->|next| B111
B111 -->|condition true| B113
B111 -->|condition false| B112
B112 -->|jump| B111
B114 -->|next| B115
B115 -->|condition true| B115
B115 -->|condition false| B116
B117 -->|next| B118
B118 -->|call| B114
B118 -->|after return| B119
B119 -->|condition true| B118
B119 -->|condition false| B120
B120["Continue at B121 in section 13"]
```

### B111

```asm
RLC A
```

### B112

```asm
RLC A
JNC MATCH
```

### B113

```asm
INC DPTR
SJMP FIND1
```

### B114

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B115

```asm
MOV TMOD,#01H
MOV TL0,#0DCH
MOV TH0,#6FH
SETB TR0
```

### B116

```asm
JNB TF0,BACK
```

### B117

Return to the instruction following the active call.

```asm
CLR TR0
CLR TF0
RET
```

### B118

```asm
MOV R0, #4
```

### B119

```asm
ACALL TMSEC
```

### B120

```asm
DJNZ R0, LP1
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 382 to 382"]
B121["B122: END_PROGRAM - lines 406 to 406"]
B121 -->|jump| B121
```

### B121

Return to the instruction following the active call.

```asm
RET
```

### B122

```asm
SJMP END_PROGRAM
```
