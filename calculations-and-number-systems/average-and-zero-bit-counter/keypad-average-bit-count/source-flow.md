# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14)

## Section 1

```mermaid
flowchart TD
B0["B1: START - lines 3 to 3"]
B1["B2: instructions - lines 5 to 6"]
B2["B3: instructions - lines 7 to 8"]
B3["B4: instructions - lines 10 to 11"]
B4["B5: instructions - lines 12 to 13"]
B5["B6: instructions - lines 14 to 14"]
B6["B7: instructions - lines 15 to 15"]
B7["B8: instructions - lines 19 to 20"]
B8["B9: instructions - lines 21 to 22"]
B9["B10: instructions - lines 24 to 25"]
B0 -->|call| B99
B0 -->|after return| B1
B1 -->|call| B109
B1 -->|after return| B2
B2 -->|call| B115
B2 -->|after return| B3
B3 -->|call| B109
B3 -->|after return| B4
B4 -->|call| B115
B4 -->|after return| B5
B5 -->|call| B120
B5 -->|after return| B6
B6 -->|call| B129
B6 -->|after return| B7
B7 -->|call| B109
B7 -->|after return| B8
B8 -->|call| B115
B8 -->|after return| B9
B9 -->|call| B109
B9 -->|after return| B10
B99["Continue at B100 in section 10"]
B109["Continue at B110 in section 11"]
B115["Continue at B116 in section 12"]
B120["Continue at B121 in section 13"]
B129["Continue at B130 in section 13"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV A,#80H
ACALL CMD
```

### B3

```asm
MOV DPTR,#MENU1
ACALL WSTR
```

### B4

```asm
MOV A,#0C0H
ACALL CMD
```

### B5

```asm
MOV DPTR,#MENU2
ACALL WSTR
```

### B6

```asm
ACALL LDELAY
```

### B7

```asm
ACALL CLEAR
```

### B8

```asm
MOV A,#80H
ACALL CMD
```

### B9

```asm
MOV DPTR,#CHOICE1
ACALL WSTR
```

### B10

```asm
MOV A,#0C0H
ACALL CMD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 26 to 27"]
B11["B12: instructions - lines 28 to 28"]
B12["B13: instructions - lines 29 to 29"]
B13["B14: instructions - lines 32 to 33"]
B14["B15: instructions - lines 34 to 35"]
B15["B16: instructions - lines 37 to 38"]
B16["B17: instructions - lines 39 to 40"]
B17["B18: instructions - lines 41 to 41"]
B18["B19: instructions - lines 42 to 42"]
B19["B20: instructions - lines 45 to 46"]
B10 -->|call| B115
B10 -->|after return| B11
B11 -->|call| B120
B11 -->|after return| B12
B12 -->|call| B129
B12 -->|after return| B13
B13 -->|call| B109
B13 -->|after return| B14
B14 -->|call| B115
B14 -->|after return| B15
B15 -->|call| B109
B15 -->|after return| B16
B16 -->|call| B115
B16 -->|after return| B17
B17 -->|call| B120
B17 -->|after return| B18
B18 -->|call| B129
B18 -->|after return| B19
B19 -->|call| B109
B19 -->|after return| B20
B115["Continue at B116 in section 12"]
B120["Continue at B121 in section 13"]
B129["Continue at B130 in section 13"]
B109["Continue at B110 in section 11"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV DPTR,#CH1
ACALL WSTR
```

### B12

```asm
ACALL LDELAY
```

### B13

```asm
ACALL CLEAR
```

### B14

```asm
MOV A,#80H
ACALL CMD
```

### B15

```asm
MOV DPTR,#CHOICE2
ACALL WSTR
```

### B16

```asm
MOV A,#0C0H
ACALL CMD
```

### B17

```asm
MOV DPTR,#CH2
ACALL WSTR
```

### B18

```asm
ACALL LDELAY
```

### B19

```asm
ACALL CLEAR
```

### B20

```asm
MOV A,#80H
ACALL CMD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 47 to 48"]
B21["B22: instructions - lines 49 to 49"]
B22["B23: instructions - lines 50 to 50"]
B23["B24: instructions - lines 54 to 54"]
B24["B25: instructions - lines 55 to 55"]
B25["B26: SELECTION1 - lines 58 to 59"]
B26["B27: instructions - lines 60 to 61"]
B27["B28: instructions - lines 63 to 64"]
B28["B29: instructions - lines 65 to 66"]
B29["B30: instructions - lines 67 to 67"]
B20 -->|call| B115
B20 -->|after return| B21
B21 -->|call| B120
B21 -->|after return| B22
B22 -->|call| B129
B22 -->|after return| B23
B23 -->|call| B82
B23 -->|after return| B24
B24 -->|condition true| B42
B24 -->|condition false| B25
B25 -->|call| B109
B25 -->|after return| B26
B26 -->|call| B115
B26 -->|after return| B27
B27 -->|call| B109
B27 -->|after return| B28
B28 -->|call| B115
B28 -->|after return| B29
B29 -->|call| B120
B29 -->|after return| B30
B115["Continue at B116 in section 12"]
B120["Continue at B121 in section 13"]
B129["Continue at B130 in section 13"]
B82["Continue at B83 in section 9"]
B42["Continue at B43 in section 5"]
B109["Continue at B110 in section 11"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV DPTR,#CHOICE3
ACALL WSTR
```

### B22

```asm
ACALL LDELAY
```

### B23

```asm
ACALL CLEAR
```

### B24

```asm
ACALL KEYPAD
```

### B25

```asm
CJNE A,#'1',SELECTION2
```

### B26

```asm
MOV A,#80H
ACALL CMD
```

### B27

```asm
MOV DPTR,#CHO1
ACALL WSTR
```

### B28

```asm
MOV A,#0C0H
ACALL CMD
```

### B29

```asm
MOV DPTR,#CHO11
ACALL WSTR
```

### B30

```asm
ACALL LDELAY
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 68 to 68"]
B31["B32: instructions - lines 70 to 70"]
B32["B33: instructions - lines 71 to 71"]
B33["B34: instructions - lines 72 to 77"]
B34["B35: instructions - lines 78 to 78"]
B35["B36: instructions - lines 79 to 89"]
B36["B37: instructions - lines 91 to 94"]
B37["B38: instructions - lines 95 to 95"]
B38["B39: instructions - lines 96 to 98"]
B39["B40: instructions - lines 99 to 99"]
B30 -->|call| B129
B30 -->|after return| B31
B31 -->|call| B82
B31 -->|after return| B32
B32 -->|call| B104
B32 -->|after return| B33
B33 -->|call| B82
B33 -->|after return| B34
B34 -->|call| B104
B34 -->|after return| B35
B35 -->|call| B109
B35 -->|after return| B36
B36 -->|call| B104
B36 -->|after return| B37
B37 -->|call| B120
B37 -->|after return| B38
B38 -->|call| B104
B38 -->|after return| B39
B39 -->|call| B120
B39 -->|after return| B40
B129["Continue at B130 in section 13"]
B82["Continue at B83 in section 9"]
B104["Continue at B105 in section 11"]
B109["Continue at B110 in section 11"]
B120["Continue at B121 in section 13"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL CLEAR
```

### B32

```asm
ACALL KEYPAD
```

### B33

```asm
ACALL WCHR
```

### B34

```asm
SUBB A,#30H
MOV B,#10
MUL AB
MOV R1,A
ACALL KEYPAD
```

### B35

```asm
ACALL WCHR
```

### B36

```asm
SUBB A,#30H
ADD A,R1
INC A
ADD A,R1
MOV B,#2
DIV AB
MOV R2,A
MOV A,#80H
ACALL CMD
```

### B37

```asm
mov b,#10
div ab
add a,#30h
ACALL WCHR
```

### B38

```asm
acall LDELAY
```

### B39

```asm
mov a,b
add a,#30h
ACALL WCHR
```

### B40

```asm
ACALL LDELAY
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 100 to 100"]
B41["B42: instructions - lines 101 to 101"]
B42["B43: SELECTION2 - lines 104 to 104"]
B43["B44: instructions - lines 106 to 107"]
B44["B45: instructions - lines 108 to 109"]
B45["B46: instructions - lines 111 to 112"]
B46["B47: instructions - lines 113 to 114"]
B47["B48: instructions - lines 115 to 115"]
B48["B49: instructions - lines 116 to 116"]
B49["B50: instructions - lines 119 to 119"]
B40 -->|call| B129
B40 -->|after return| B41
B41 -->|jump| B41
B42 -->|condition true| B66
B42 -->|condition false| B43
B43 -->|call| B109
B43 -->|after return| B44
B44 -->|call| B115
B44 -->|after return| B45
B45 -->|call| B109
B45 -->|after return| B46
B46 -->|call| B115
B46 -->|after return| B47
B47 -->|call| B120
B47 -->|after return| B48
B48 -->|call| B129
B48 -->|after return| B49
B49 -->|call| B82
B49 -->|after return| B50
B129["Continue at B130 in section 13"]
B66["Continue at B67 in section 7"]
B109["Continue at B110 in section 11"]
B115["Continue at B116 in section 12"]
B120["Continue at B121 in section 13"]
B82["Continue at B83 in section 9"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL CLEAR
```

### B42

```asm
SJMP $
```

### B43

```asm
CJNE A,#'2',SELECTION3
```

### B44

```asm
MOV A,#80H
ACALL CMD
```

### B45

```asm
MOV DPTR,#CHO1
ACALL WSTR
```

### B46

```asm
MOV A,#0C0H
ACALL CMD
```

### B47

```asm
MOV DPTR,#CHO12
ACALL WSTR
```

### B48

```asm
ACALL LDELAY
```

### B49

```asm
ACALL CLEAR
```

### B50

```asm
ACALL KEYPAD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 120 to 120"]
B51["B52: instructions - lines 121 to 126"]
B52["B53: instructions - lines 127 to 127"]
B53["B54: instructions - lines 128 to 132"]
B54["B55: LOOP - lines 135 to 136"]
B55["B56: instructions - lines 137 to 137"]
B56["B57: instructions - lines 138 to 138"]
B57["B58: COUNTZEROS - lines 141 to 142"]
B58["B59: instructions - lines 145 to 146"]
B59["B60: instructions - lines 148 to 151"]
B50 -->|call| B104
B50 -->|after return| B51
B51 -->|call| B82
B51 -->|after return| B52
B52 -->|call| B104
B52 -->|after return| B53
B53 -->|next| B54
B54 -->|condition true| B57
B54 -->|condition false| B55
B55 -->|condition true| B54
B55 -->|condition false| B56
B56 -->|jump| B56
B57 -->|condition true| B54
B57 -->|condition false| B58
B58 -->|call| B109
B58 -->|after return| B59
B59 -->|call| B104
B59 -->|after return| B60
B104["Continue at B105 in section 11"]
B82["Continue at B83 in section 9"]
B109["Continue at B110 in section 11"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL WCHR
```

### B52

```asm
SUBB A,#30H
MOV B,#10
MUL AB
MOV R3,A
ACALL KEYPAD
```

### B53

```asm
ACALL WCHR
```

### B54

```asm
SUBB A,#30H
ADD A,R3
MOV R4,#8
MOV R7,#0
```

### B55

```asm
RRC A
JNC COUNTZEROS
```

### B56

```asm
DJNZ R4,LOOP
```

### B57

```asm
SJMP $
```

### B58

```asm
INC R7
DJNZ R4,LOOP
```

### B59

```asm
MOV A,#80H
ACALL CMD
```

### B60

```asm
mov b,#10
div ab
add a,#30h
ACALL WCHR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 152 to 152"]
B61["B62: instructions - lines 153 to 153"]
B62["B63: instructions - lines 155 to 157"]
B63["B64: instructions - lines 158 to 158"]
B64["B65: instructions - lines 159 to 159"]
B65["B66: instructions - lines 160 to 160"]
B66["B67: SELECTION3 - lines 163 to 163"]
B67["B68: instructions - lines 165 to 166"]
B68["B69: instructions - lines 167 to 168"]
B69["B70: instructions - lines 169 to 169"]
B60 -->|call| B120
B60 -->|after return| B61
B61 -->|call| B129
B61 -->|after return| B62
B62 -->|call| B104
B62 -->|after return| B63
B63 -->|call| B120
B63 -->|after return| B64
B64 -->|call| B129
B64 -->|after return| B65
B65 -->|jump| B65
B66 -->|condition true| B72
B66 -->|condition false| B67
B67 -->|call| B109
B67 -->|after return| B68
B68 -->|call| B115
B68 -->|after return| B69
B69 -->|call| B120
B69 -->|after return| B70
B120["Continue at B121 in section 13"]
B129["Continue at B130 in section 13"]
B104["Continue at B105 in section 11"]
B72["Continue at B73 in section 8"]
B109["Continue at B110 in section 11"]
B115["Continue at B116 in section 12"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
acall LDELAY
```

### B62

```asm
ACALL CLEAR
```

### B63

```asm
mov a,b
add a,#30h
ACALL WCHR
```

### B64

```asm
ACALL LDELAY
```

### B65

```asm
ACALL CLEAR
```

### B66

```asm
SJMP $
```

### B67

```asm
CJNE A,#'3',ERROR
```

### B68

```asm
MOV A,#80H
ACALL CMD
```

### B69

```asm
MOV DPTR,#EXIT
ACALL WSTR
```

### B70

```asm
ACALL LDELAY
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 170 to 170"]
B71["B72: instructions - lines 171 to 171"]
B72["B73: ERROR - lines 176 to 177"]
B73["B74: LOOP1 - lines 178 to 178"]
B74["B75: instructions - lines 179 to 180"]
B75["B76: instructions - lines 182 to 182"]
B76["B77: instructions - lines 183 to 183"]
B77["B78: instructions - lines 184 to 184"]
B78["B79: instructions - lines 187 to 188"]
B79["B80: instructions - lines 189 to 190"]
B70 -->|call| B129
B70 -->|after return| B71
B71 -->|jump| B71
B72 -->|next| B73
B73 -->|call| B120
B73 -->|after return| B74
B74 -->|condition true| B73
B74 -->|condition false| B75
B75 -->|call| B120
B75 -->|after return| B76
B76 -->|call| B129
B76 -->|after return| B77
B77 -->|jump| B77
B78 -->|call| B109
B78 -->|after return| B79
B79 -->|call| B115
B79 -->|after return| B80
B129["Continue at B130 in section 13"]
B120["Continue at B121 in section 13"]
B109["Continue at B110 in section 11"]
B115["Continue at B116 in section 12"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL CLEAR
```

### B72

```asm
SJMP $
```

### B73

```asm
CLR P1.0
MOV R7,#3
```

### B74

```asm
ACALL LDELAY
```

### B75

```asm
SETB P1.0
DJNZ R7,LOOP1
```

### B76

```asm
ACALL LDELAY
```

### B77

```asm
ACALL CLEAR
```

### B78

```asm
SJMP $
```

### B79

```asm
MOV A,#80H
ACALL CMD
```

### B80

```asm
MOV DPTR,#ERRORMESSAGE
ACALL WSTR
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 191 to 191"]
B81["B82: instructions - lines 192 to 192"]
B82["B83: KEYPAD - lines 198 to 198"]
B83["B84: K1 - lines 199 to 202"]
B84["B85: K2 - lines 204 to 206"]
B85["B86: instructions - lines 207 to 207"]
B86["B87: OVER1 - lines 210 to 213"]
B87["B88: instructions - lines 214 to 217"]
B88["B89: instructions - lines 218 to 221"]
B89["B90: instructions - lines 222 to 225"]
B80 -->|call| B120
B80 -->|after return| B81
B81 -->|call| B129
B81 -->|after return| B82
B82 -->|next| B83
B83 -->|condition true| B83
B83 -->|condition false| B84
B84 -->|condition true| B86
B84 -->|condition false| B85
B85 -->|jump| B84
B86 -->|condition true| B91
B86 -->|condition false| B87
B87 -->|condition true| B92
B87 -->|condition false| B88
B88 -->|condition true| B93
B88 -->|condition false| B89
B89 -->|condition true| B94
B89 -->|condition false| B90
B120["Continue at B121 in section 13"]
B129["Continue at B130 in section 13"]
B91["Continue at B92 in section 10"]
B92["Continue at B93 in section 10"]
B93["Continue at B94 in section 10"]
B94["Continue at B95 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL LDELAY
```

### B82

```asm
ACALL CLEAR
```

### B83

```asm
MOV P0,#01110000B
```

### B84

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B85

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B86

```asm
SJMP K2
```

### B87

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B88

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B89

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B90

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 226 to 226"]
B91["B92: ROW_0 - lines 227 to 228"]
B92["B93: ROW_1 - lines 229 to 230"]
B93["B94: ROW_2 - lines 231 to 232"]
B94["B95: ROW_3 - lines 233 to 233"]
B95["B96: FIND - lines 236 to 236"]
B96["B97: FIND1 - lines 238 to 239"]
B97["B98: instructions - lines 240 to 241"]
B98["B99: MATCH - lines 242 to 244"]
B99["B100: INLCD - lines 248 to 256"]
B90 -->|jump| B84
B91 -->|jump| B95
B92 -->|jump| B95
B93 -->|jump| B95
B94 -->|next| B95
B95 -->|next| B96
B96 -->|condition true| B98
B96 -->|condition false| B97
B97 -->|jump| B96
B99 -->|call| B120
B99 -->|after return| B100
B84["Continue at B85 in section 9"]
B120["Continue at B121 in section 13"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
LJMP K2
```

### B92

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B93

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B94

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B95

```asm
MOV DPTR,#KCODE3
```

### B96

```asm
RLC A
```

### B97

```asm
RLC A
JNC MATCH
```

### B98

```asm
INC DPTR
SJMP FIND1
```

### B99

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B100

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

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 258 to 267"]
B101["B102: instructions - lines 269 to 284"]
B102["B103: instructions - lines 286 to 298"]
B103["B104: instructions - lines 299 to 299"]
B104["B105: WCHR - lines 304 to 308"]
B105["B106: instructions - lines 309 to 309"]
B106["B107: instructions - lines 310 to 312"]
B107["B108: instructions - lines 313 to 313"]
B108["B109: instructions - lines 314 to 316"]
B109["B110: CMD - lines 319 to 321"]
B100 -->|call| B120
B100 -->|after return| B101
B101 -->|call| B120
B101 -->|after return| B102
B102 -->|call| B120
B102 -->|after return| B103
B104 -->|call| B114
B104 -->|after return| B105
B105 -->|call| B120
B105 -->|after return| B106
B106 -->|call| B114
B106 -->|after return| B107
B107 -->|call| B120
B107 -->|after return| B108
B109 -->|call| B114
B109 -->|after return| B110
B120["Continue at B121 in section 13"]
B114["Continue at B115 in section 12"]
B110["Continue at B111 in section 12"]
```

### B101

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

### B102

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

### B103

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

### B104

Return to the instruction following the active call.

```asm
RET
```

### B105

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B106

```asm
ACALL LDELAY
```

### B107

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B108

```asm
ACALL LDELAY
```

### B109

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B110

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 322 to 322"]
B111["B112: instructions - lines 323 to 325"]
B112["B113: instructions - lines 326 to 326"]
B113["B114: instructions - lines 327 to 327"]
B114["B115: COMMON - lines 331 to 336"]
B115["B116: WSTR - lines 340 to 340"]
B116["B117: CONT1 - lines 342 to 344"]
B117["B118: PRINT - lines 346 to 346"]
B118["B119: instructions - lines 347 to 348"]
B119["B120: EXIT1 - lines 349 to 350"]
B110 -->|call| B120
B110 -->|after return| B111
B111 -->|call| B114
B111 -->|after return| B112
B112 -->|call| B120
B112 -->|after return| B113
B115 -->|next| B116
B116 -->|condition true| B119
B116 -->|condition false| B117
B117 -->|call| B104
B117 -->|after return| B118
B118 -->|jump| B116
B120["Continue at B121 in section 13"]
B104["Continue at B105 in section 11"]
```

### B111

```asm
ACALL LDELAY
```

### B112

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B113

```asm
ACALL LDELAY
```

### B114

Return to the instruction following the active call.

```asm
RET
```

### B115

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B116

```asm
PUSH    ACC
```

### B117

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B118

```asm
ACALL    WCHR
```

### B119

```asm
INC DPTR
AJMP    CONT1
```

### B120

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

## Section 13

```mermaid
flowchart TD
B120["B121: LDELAY - lines 354 to 355"]
B121["B122: instructions - lines 356 to 356"]
B122["B123: DELAY - lines 358 to 358"]
B123["B124: X3 - lines 359 to 359"]
B124["B125: X2 - lines 360 to 360"]
B125["B126: X1 - lines 361 to 361"]
B126["B127: instructions - lines 362 to 362"]
B127["B128: instructions - lines 363 to 363"]
B128["B129: instructions - lines 364 to 364"]
B129["B130: CLEAR - lines 367 to 368"]
B120 -->|condition true| B120
B120 -->|condition false| B121
B122 -->|next| B123
B123 -->|next| B124
B124 -->|next| B125
B125 -->|condition true| B125
B125 -->|condition false| B126
B126 -->|condition true| B124
B126 -->|condition false| B127
B127 -->|condition true| B123
B127 -->|condition false| B128
B129 -->|call| B109
B129 -->|after return| B130
B109["Continue at B110 in section 11"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV R0, #50
DJNZ R0, $
```

### B122

Return to the instruction following the active call.

```asm
RET
```

### B123

```asm
MOV R5,#2
```

### B124

```asm
MOV R4,#20
```

### B125

```asm
MOV R3,#250
```

### B126

```asm
DJNZ R3,X1
```

### B127

```asm
DJNZ R4,X2
```

### B128

```asm
DJNZ R5,X3
```

### B129

Return to the instruction following the active call.

```asm
RET
```

### B130

```asm
MOV A,#01H
ACALL CMD
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 369 to 369"]
B131["B132: WAIT1 - lines 370 to 370"]
B132["B133: instructions - lines 371 to 371"]
B133["B134: instructions - lines 372 to 372"]
B134["B135: STOP - lines 409 to 409"]
B130 -->|next| B131
B131 -->|call| B120
B131 -->|after return| B132
B132 -->|condition true| B131
B132 -->|condition false| B133
B134 -->|jump| B134
B120["Continue at B121 in section 13"]
```

### B131

```asm
MOV R7,#14
```

### B132

```asm
ACALL LDELAY
```

### B133

```asm
DJNZ R7,WAIT1
```

### B134

Return to the instruction following the active call.

```asm
RET
```

### B135

```asm
SJMP $
```
