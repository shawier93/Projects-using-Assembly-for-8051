# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 3 to 5"]
B2["B3: FF - lines 7 to 7"]
B3["B4: instructions - lines 8 to 8"]
B4["B5: instructions - lines 9 to 9"]
B5["B6: instructions - lines 10 to 10"]
B6["B7: START - lines 13 to 13"]
B7["B8: instructions - lines 14 to 14"]
B8["B9: instructions - lines 15 to 16"]
B9["B10: instructions - lines 17 to 19"]
B0 -->|call| B126
B0 -->|after return| B1
B1 -->|next| B2
B2 -->|call| B108
B2 -->|after return| B3
B3 -->|call| B112
B3 -->|after return| B4
B4 -->|condition true| B2
B4 -->|condition false| B5
B5 -->|call| B126
B5 -->|after return| B6
B6 -->|call| B133
B6 -->|after return| B7
B7 -->|call| B112
B7 -->|after return| B8
B8 -->|call| B120
B8 -->|after return| B9
B9 -->|call| B138
B9 -->|after return| B10
B126["Continue at B127 in section 13"]
B108["Continue at B109 in section 11"]
B112["Continue at B113 in section 12"]
B133["Continue at B134 in section 14"]
B120["Continue at B121 in section 13"]
B138["Continue at B139 in section 14"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
CLR A
MOV P1,#0FFH
MOV R7,#5
```

### B3

```asm
ACALL FLASH
```

### B4

```asm
ACALL DELAY
```

### B5

```asm
DJNZ R7,FF
```

### B6

```asm
ACALL INLCD
```

### B7

```asm
ACALL CLEAR
```

### B8

```asm
ACALL DELAY
```

### B9

```asm
MOV A,#80H
ACALL CMD
```

### B10

```asm
CLR A
MOV DPTR,#STR1
ACALL WSTR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 20 to 21"]
B11["B12: instructions - lines 22 to 23"]
B12["B13: instructions - lines 24 to 24"]
B13["B14: instructions - lines 26 to 26"]
B14["B15: instructions - lines 27 to 27"]
B15["B16: instructions - lines 28 to 29"]
B16["B17: instructions - lines 30 to 32"]
B17["B18: instructions - lines 33 to 34"]
B18["B19: instructions - lines 35 to 36"]
B19["B20: instructions - lines 37 to 37"]
B10 -->|call| B120
B10 -->|after return| B11
B11 -->|call| B138
B11 -->|after return| B12
B12 -->|call| B112
B12 -->|after return| B13
B13 -->|call| B133
B13 -->|after return| B14
B14 -->|call| B112
B14 -->|after return| B15
B15 -->|call| B120
B15 -->|after return| B16
B16 -->|call| B138
B16 -->|after return| B17
B17 -->|call| B120
B17 -->|after return| B18
B18 -->|call| B138
B18 -->|after return| B19
B19 -->|call| B112
B19 -->|after return| B20
B120["Continue at B121 in section 13"]
B138["Continue at B139 in section 14"]
B112["Continue at B113 in section 12"]
B133["Continue at B134 in section 14"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,#0C0H
ACALL CMD
```

### B12

```asm
MOV DPTR,#STR2
ACALL WSTR
```

### B13

```asm
ACALL DELAY
```

### B14

```asm
ACALL CLEAR
```

### B15

```asm
ACALL DELAY
```

### B16

```asm
MOV A,#80H
ACALL CMD
```

### B17

```asm
CLR A
MOV DPTR,#STR3
ACALL WSTR
```

### B18

```asm
MOV A,#0C0H
ACALL CMD
```

### B19

```asm
MOV DPTR,#STR4
ACALL WSTR
```

### B20

```asm
ACALL DELAY
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 39 to 39"]
B21["B22: instructions - lines 40 to 40"]
B22["B23: instructions - lines 41 to 42"]
B23["B24: instructions - lines 43 to 45"]
B24["B25: instructions - lines 46 to 47"]
B25["B26: instructions - lines 48 to 48"]
B26["B27: instructions - lines 49 to 50"]
B27["B28: instructions - lines 51 to 54"]
B28["B29: X0 - lines 58 to 58"]
B29["B30: X1 - lines 61 to 61"]
B20 -->|call| B133
B20 -->|after return| B21
B21 -->|call| B112
B21 -->|after return| B22
B22 -->|call| B120
B22 -->|after return| B23
B23 -->|call| B138
B23 -->|after return| B24
B24 -->|call| B120
B24 -->|after return| B25
B25 -->|call| B143
B25 -->|after return| B26
B26 -->|call| B115
B26 -->|after return| B27
B27 -->|call| B112
B27 -->|after return| B28
B28 -->|condition true| B47
B28 -->|condition false| B29
B29 -->|call| B133
B29 -->|after return| B30
B133["Continue at B134 in section 14"]
B112["Continue at B113 in section 12"]
B120["Continue at B121 in section 13"]
B138["Continue at B139 in section 14"]
B143["Continue at B144 in section 15"]
B115["Continue at B116 in section 12"]
B47["Continue at B48 in section 5"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL CLEAR
```

### B22

```asm
ACALL DELAY
```

### B23

```asm
MOV A,#80H
ACALL CMD
```

### B24

```asm
CLR A
MOV DPTR,#STR5
ACALL WSTR
```

### B25

```asm
MOV A,#0C0H
ACALL CMD
```

### B26

```asm
ACALL KEYPAD
```

### B27

```asm
MOV R3,A
ACALL WCHR
```

### B28

```asm
MOV A,R3
SUBB A,#30H
MOV R3,A
ACALL DELAY
```

### B29

```asm
CJNE R3,#1,X2
```

### B30

```asm
ACALL CLEAR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 62 to 62"]
B31["B32: instructions - lines 63 to 64"]
B32["B33: instructions - lines 65 to 67"]
B33["B34: instructions - lines 68 to 69"]
B34["B35: instructions - lines 70 to 70"]
B35["B36: instructions - lines 71 to 72"]
B36["B37: instructions - lines 73 to 78"]
B37["B38: instructions - lines 79 to 80"]
B38["B39: instructions - lines 81 to 88"]
B39["B40: instructions - lines 89 to 89"]
B30 -->|call| B112
B30 -->|after return| B31
B31 -->|call| B120
B31 -->|after return| B32
B32 -->|call| B138
B32 -->|after return| B33
B33 -->|call| B120
B33 -->|after return| B34
B34 -->|call| B143
B34 -->|after return| B35
B35 -->|call| B115
B35 -->|after return| B36
B36 -->|call| B143
B36 -->|after return| B37
B37 -->|call| B115
B37 -->|after return| B38
B38 -->|call| B120
B38 -->|after return| B39
B39 -->|call| B143
B39 -->|after return| B40
B112["Continue at B113 in section 12"]
B120["Continue at B121 in section 13"]
B138["Continue at B139 in section 14"]
B143["Continue at B144 in section 15"]
B115["Continue at B116 in section 12"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL DELAY
```

### B32

```asm
MOV A,#80H
ACALL CMD
```

### B33

```asm
CLR A
MOV DPTR,#STR6
ACALL WSTR
```

### B34

```asm
MOV A,#0C0H
ACALL CMD
```

### B35

```asm
ACALL KEYPAD
```

### B36

```asm
MOV R1,A
ACALL WCHR
```

### B37

```asm
MOV A,R1
SUBB A,#30H
MOV B,#10
MUL AB
MOV R1,A
ACALL KEYPAD
```

### B38

```asm
MOV R7,A
ACALL WCHR
```

### B39

```asm
MOV A,R7
SUBB A,#30H
MOV R7,A
ADD A ,R1
MOV 21H,A
MOV A,#0C5H
ACALL CMD
```

### B40

```asm
ACALL KEYPAD
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 90 to 91"]
B41["B42: instructions - lines 92 to 97"]
B42["B43: instructions - lines 98 to 99"]
B43["B44: instructions - lines 100 to 110"]
B44["B45: instructions - lines 111 to 111"]
B45["B46: instructions - lines 113 to 113"]
B46["B47: instructions - lines 115 to 115"]
B47["B48: X2 - lines 118 to 118"]
B48["B49: instructions - lines 119 to 119"]
B49["B50: instructions - lines 120 to 120"]
B40 -->|call| B115
B40 -->|after return| B41
B41 -->|call| B143
B41 -->|after return| B42
B42 -->|call| B115
B42 -->|after return| B43
B43 -->|call| B112
B43 -->|after return| B44
B44 -->|call| B112
B44 -->|after return| B45
B45 -->|call| B79
B45 -->|after return| B46
B46 -->|jump| B46
B47 -->|condition true| B65
B47 -->|condition false| B48
B48 -->|call| B133
B48 -->|after return| B49
B49 -->|call| B112
B49 -->|after return| B50
B115["Continue at B116 in section 12"]
B143["Continue at B144 in section 15"]
B112["Continue at B113 in section 12"]
B79["Continue at B80 in section 8"]
B65["Continue at B66 in section 7"]
B133["Continue at B134 in section 14"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV R1,A
ACALL WCHR
```

### B42

```asm
MOV A,R1
SUBB A,#30H
MOV B,#10
MUL AB
MOV R1,A
ACALL KEYPAD
```

### B43

```asm
MOV R7,A
ACALL WCHR
```

### B44

```asm
MOV A,R7
SUBB A,#30H
MOV R7,A
ADD A ,R1
MOV 22H,A
MOV B,#2
ADD A,21H
DIV AB
MOV R6,A
ACALL DELAY
```

### B45

```asm
ACALL DELAY
```

### B46

```asm
ACALL PRINT1
```

### B47

```asm
SJMP $
```

### B48

```asm
CJNE R3,#2,X3
```

### B49

```asm
ACALL CLEAR
```

### B50

```asm
ACALL DELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 121 to 122"]
B51["B52: instructions - lines 123 to 125"]
B52["B53: instructions - lines 126 to 127"]
B53["B54: instructions - lines 128 to 128"]
B54["B55: instructions - lines 129 to 130"]
B55["B56: instructions - lines 131 to 136"]
B56["B57: instructions - lines 137 to 138"]
B57["B58: instructions - lines 139 to 148"]
B58["B59: X - lines 151 to 152"]
B59["B60: instructions - lines 153 to 153"]
B50 -->|call| B120
B50 -->|after return| B51
B51 -->|call| B138
B51 -->|after return| B52
B52 -->|call| B120
B52 -->|after return| B53
B53 -->|call| B143
B53 -->|after return| B54
B54 -->|call| B115
B54 -->|after return| B55
B55 -->|call| B143
B55 -->|after return| B56
B56 -->|call| B115
B56 -->|after return| B57
B57 -->|next| B58
B58 -->|condition true| B61
B58 -->|condition false| B59
B59 -->|condition true| B58
B59 -->|condition false| B60
B120["Continue at B121 in section 13"]
B138["Continue at B139 in section 14"]
B143["Continue at B144 in section 15"]
B115["Continue at B116 in section 12"]
B61["Continue at B62 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV A,#80H
ACALL CMD
```

### B52

```asm
CLR A
MOV DPTR,#STR6
ACALL WSTR
```

### B53

```asm
MOV A,#0C0H
ACALL CMD
```

### B54

```asm
ACALL KEYPAD
```

### B55

```asm
MOV R1,A
ACALL WCHR
```

### B56

```asm
MOV A,R1
SUBB A,#30H
MOV B,#10
MUL AB
MOV R1,A
ACALL KEYPAD
```

### B57

```asm
MOV R7,A
ACALL WCHR
```

### B58

```asm
MOV A,R7
SUBB A,#30H
MOV R7,A
ADD A ,R1
MOV R5,A
MOV R4,#8
MOV 20H,#0
MOV A,R5
MOV 40H,A
```

### B59

```asm
RRC A
JNC ZEROS
```

### B60

```asm
DJNZ R4,X
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 154 to 154"]
B61["B62: ZEROS - lines 157 to 158"]
B62["B63: instructions - lines 160 to 160"]
B63["B64: XX - lines 161 to 161"]
B64["B65: instructions - lines 162 to 162"]
B65["B66: X3 - lines 165 to 165"]
B66["B67: instructions - lines 166 to 166"]
B67["B68: instructions - lines 167 to 167"]
B68["B69: instructions - lines 168 to 169"]
B69["B70: instructions - lines 170 to 172"]
B60 -->|jump| B63
B61 -->|condition true| B58
B61 -->|condition false| B62
B62 -->|jump| B63
B63 -->|call| B88
B63 -->|after return| B64
B64 -->|jump| B64
B65 -->|condition true| B71
B65 -->|condition false| B66
B66 -->|call| B133
B66 -->|after return| B67
B67 -->|call| B112
B67 -->|after return| B68
B68 -->|call| B120
B68 -->|after return| B69
B69 -->|call| B138
B69 -->|after return| B70
B58["Continue at B59 in section 6"]
B88["Continue at B89 in section 9"]
B71["Continue at B72 in section 8"]
B133["Continue at B134 in section 14"]
B112["Continue at B113 in section 12"]
B120["Continue at B121 in section 13"]
B138["Continue at B139 in section 14"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
SJMP XX
```

### B62

```asm
INC 20H
DJNZ R4,X
```

### B63

```asm
SJMP XX
```

### B64

```asm
ACALL PRINT2
```

### B65

```asm
SJMP $
```

### B66

```asm
CJNE A,#3, X00
```

### B67

```asm
ACALL CLEAR
```

### B68

```asm
ACALL DELAY
```

### B69

```asm
MOV A,#80H
ACALL CMD
```

### B70

```asm
CLR A
MOV DPTR,#STR9
ACALL WSTR
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 173 to 173"]
B71["B72: X00 - lines 175 to 175"]
B72["B73: instructions - lines 176 to 176"]
B73["B74: instructions - lines 177 to 177"]
B74["B75: instructions - lines 178 to 178"]
B75["B76: instructions - lines 179 to 179"]
B76["B77: instructions - lines 180 to 181"]
B77["B78: instructions - lines 182 to 184"]
B78["B79: instructions - lines 185 to 185"]
B79["B80: PRINT1 - lines 192 to 192"]
B70 -->|jump| B70
B71 -->|call| B108
B71 -->|after return| B72
B72 -->|call| B108
B72 -->|after return| B73
B73 -->|call| B108
B73 -->|after return| B74
B74 -->|call| B133
B74 -->|after return| B75
B75 -->|call| B112
B75 -->|after return| B76
B76 -->|call| B120
B76 -->|after return| B77
B77 -->|call| B138
B77 -->|after return| B78
B78 -->|jump| B6
B79 -->|call| B133
B79 -->|after return| B80
B108["Continue at B109 in section 11"]
B133["Continue at B134 in section 14"]
B112["Continue at B113 in section 12"]
B120["Continue at B121 in section 13"]
B138["Continue at B139 in section 14"]
B6["Continue at B7 in section 1"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
SJMP $
```

### B72

```asm
ACALL FLASH
```

### B73

```asm
ACALL FLASH
```

### B74

```asm
ACALL FLASH
```

### B75

```asm
ACALL CLEAR
```

### B76

```asm
ACALL DELAY
```

### B77

```asm
MOV A,#80H
ACALL CMD
```

### B78

```asm
CLR A
MOV DPTR,#STR10
ACALL WSTR
```

### B79

```asm
LJMP START
```

### B80

```asm
ACALL CLEAR
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 193 to 193"]
B81["B82: instructions - lines 194 to 195"]
B82["B83: instructions - lines 196 to 198"]
B83["B84: instructions - lines 199 to 200"]
B84["B85: instructions - lines 201 to 205"]
B85["B86: instructions - lines 206 to 208"]
B86["B87: instructions - lines 209 to 209"]
B87["B88: instructions - lines 210 to 210"]
B88["B89: PRINT2 - lines 213 to 213"]
B89["B90: instructions - lines 214 to 214"]
B80 -->|call| B112
B80 -->|after return| B81
B81 -->|call| B120
B81 -->|after return| B82
B82 -->|call| B138
B82 -->|after return| B83
B83 -->|call| B120
B83 -->|after return| B84
B84 -->|call| B115
B84 -->|after return| B85
B85 -->|call| B115
B85 -->|after return| B86
B86 -->|call| B112
B86 -->|after return| B87
B88 -->|call| B133
B88 -->|after return| B89
B89 -->|call| B112
B89 -->|after return| B90
B112["Continue at B113 in section 12"]
B120["Continue at B121 in section 13"]
B138["Continue at B139 in section 14"]
B115["Continue at B116 in section 12"]
B133["Continue at B134 in section 14"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL DELAY
```

### B82

```asm
MOV A,#80H
ACALL CMD
```

### B83

```asm
CLR A
MOV DPTR,#STR7
ACALL WSTR
```

### B84

```asm
MOV A,#0C0H
ACALL CMD
```

### B85

```asm
MOV A,R6
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B86

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B87

```asm
ACALL DELAY
```

### B88

Return to the instruction following the active call.

```asm
RET
```

### B89

```asm
ACALL CLEAR
```

### B90

```asm
ACALL DELAY
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 215 to 216"]
B91["B92: instructions - lines 217 to 219"]
B92["B93: instructions - lines 220 to 221"]
B93["B94: instructions - lines 222 to 226"]
B94["B95: instructions - lines 227 to 229"]
B95["B96: instructions - lines 230 to 230"]
B96["B97: instructions - lines 231 to 231"]
B97["B98: instructions - lines 232 to 232"]
B98["B99: instructions - lines 233 to 233"]
B99["B100: instructions - lines 236 to 236"]
B90 -->|call| B120
B90 -->|after return| B91
B91 -->|call| B138
B91 -->|after return| B92
B92 -->|call| B120
B92 -->|after return| B93
B93 -->|call| B115
B93 -->|after return| B94
B94 -->|call| B115
B94 -->|after return| B95
B95 -->|call| B112
B95 -->|after return| B96
B96 -->|call| B112
B96 -->|after return| B97
B97 -->|call| B112
B97 -->|after return| B98
B98 -->|call| B112
B98 -->|after return| B99
B99 -->|call| B133
B99 -->|after return| B100
B120["Continue at B121 in section 13"]
B138["Continue at B139 in section 14"]
B115["Continue at B116 in section 12"]
B112["Continue at B113 in section 12"]
B133["Continue at B134 in section 14"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV A,#80H
ACALL CMD
```

### B92

```asm
CLR A
MOV DPTR,#STR6
ACALL WSTR
```

### B93

```asm
MOV A,#0C0H
ACALL CMD
```

### B94

```asm
MOV A,40H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B95

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B96

```asm
ACALL DELAY
```

### B97

```asm
ACALL DELAY
```

### B98

```asm
ACALL DELAY
```

### B99

```asm
ACALL DELAY
```

### B100

```asm
ACALL CLEAR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 237 to 237"]
B101["B102: instructions - lines 238 to 239"]
B102["B103: instructions - lines 240 to 242"]
B103["B104: instructions - lines 243 to 244"]
B104["B105: instructions - lines 245 to 247"]
B105["B106: instructions - lines 248 to 248"]
B106["B107: instructions - lines 249 to 249"]
B107["B108: instructions - lines 250 to 250"]
B108["B109: FLASH - lines 253 to 254"]
B109["B110: instructions - lines 255 to 256"]
B100 -->|call| B112
B100 -->|after return| B101
B101 -->|call| B120
B101 -->|after return| B102
B102 -->|call| B138
B102 -->|after return| B103
B103 -->|call| B120
B103 -->|after return| B104
B104 -->|call| B115
B104 -->|after return| B105
B105 -->|call| B112
B105 -->|after return| B106
B106 -->|call| B112
B106 -->|after return| B107
B108 -->|call| B112
B108 -->|after return| B109
B109 -->|call| B112
B109 -->|after return| B110
B112["Continue at B113 in section 12"]
B120["Continue at B121 in section 13"]
B138["Continue at B139 in section 14"]
B115["Continue at B116 in section 12"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL DELAY
```

### B102

```asm
MOV A,#80H
ACALL CMD
```

### B103

```asm
CLR A
MOV DPTR,#STR8
ACALL WSTR
```

### B104

```asm
MOV A,#0C0H
ACALL CMD
```

### B105

```asm
MOV A,20H
ADD A,#30H
ACALL WCHR
```

### B106

```asm
ACALL DELAY
```

### B107

```asm
ACALL DELAY
```

### B108

Return to the instruction following the active call.

```asm
RET
```

### B109

```asm
CLR P1.6
ACALL DELAY
```

### B110

```asm
SETB P1.6
ACALL DELAY
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 257 to 257"]
B111["B112: CONV - lines 260 to 280"]
B112["B113: DELAY - lines 283 to 283"]
B113["B114: HH - lines 284 to 284"]
B114["B115: instructions - lines 285 to 285"]
B115["B116: WCHR - lines 289 to 293"]
B116["B117: instructions - lines 294 to 294"]
B117["B118: instructions - lines 295 to 297"]
B118["B119: instructions - lines 298 to 298"]
B119["B120: instructions - lines 299 to 301"]
B112 -->|next| B113
B113 -->|condition true| B113
B113 -->|condition false| B114
B115 -->|call| B125
B115 -->|after return| B116
B116 -->|call| B131
B116 -->|after return| B117
B117 -->|call| B125
B117 -->|after return| B118
B118 -->|call| B131
B118 -->|after return| B119
B125["Continue at B126 in section 13"]
B131["Continue at B132 in section 14"]
```

### B111

Return to the instruction following the active call.

```asm
RET
```

### B112

Return to the instruction following the active call.

```asm
MOV B,#10
MOV A,R4
DIV AB
MOV 50H,A
MOV A,B
MOV B,#10
DIV AB
MOV 51H,A
MOV 52H,B
MOV A,50H
ADD A,#30H
MOV 60H,A
MOV A,51H
ADD A,#30H
MOV 61H,A
MOV A,52H
ADD A,#30H
MOV 62H,A
RET
```

### B113

```asm
MOV R0, #250
```

### B114

```asm
DJNZ R0, HH
```

### B115

Return to the instruction following the active call.

```asm
RET
```

### B116

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B117

```asm
ACALL LDELAY
```

### B118

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B119

```asm
ACALL LDELAY
```

### B120

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 13

```mermaid
flowchart TD
B120["B121: CMD - lines 304 to 306"]
B121["B122: instructions - lines 307 to 307"]
B122["B123: instructions - lines 308 to 310"]
B123["B124: instructions - lines 311 to 311"]
B124["B125: instructions - lines 312 to 312"]
B125["B126: COMMON - lines 315 to 320"]
B126["B127: INLCD - lines 323 to 330"]
B127["B128: instructions - lines 331 to 339"]
B128["B129: instructions - lines 340 to 352"]
B129["B130: instructions - lines 353 to 363"]
B120 -->|call| B125
B120 -->|after return| B121
B121 -->|call| B131
B121 -->|after return| B122
B122 -->|call| B125
B122 -->|after return| B123
B123 -->|call| B131
B123 -->|after return| B124
B126 -->|call| B131
B126 -->|after return| B127
B127 -->|call| B131
B127 -->|after return| B128
B128 -->|call| B131
B128 -->|after return| B129
B129 -->|call| B131
B129 -->|after return| B130
B131["Continue at B132 in section 14"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B122

```asm
ACALL LDELAY
```

### B123

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B124

```asm
ACALL LDELAY
```

### B125

Return to the instruction following the active call.

```asm
RET
```

### B126

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B127

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

### B128

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

### B129

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

### B130

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

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 364 to 364"]
B131["B132: LDELAY - lines 367 to 368"]
B132["B133: instructions - lines 369 to 369"]
B133["B134: CLEAR - lines 372 to 373"]
B134["B135: instructions - lines 374 to 374"]
B135["B136: WAIT - lines 375 to 375"]
B136["B137: instructions - lines 376 to 376"]
B137["B138: instructions - lines 377 to 377"]
B138["B139: WSTR - lines 380 to 380"]
B139["B140: CONT1 - lines 382 to 384"]
B131 -->|condition true| B131
B131 -->|condition false| B132
B133 -->|call| B120
B133 -->|after return| B134
B134 -->|next| B135
B135 -->|call| B131
B135 -->|after return| B136
B136 -->|condition true| B135
B136 -->|condition false| B137
B138 -->|next| B139
B139 -->|condition true| B142
B139 -->|condition false| B140
B120["Continue at B121 in section 13"]
B142["Continue at B143 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

Return to the instruction following the active call.

```asm
RET
```

### B132

```asm
MOV R0, #50
DJNZ R0, $
```

### B133

Return to the instruction following the active call.

```asm
RET
```

### B134

```asm
MOV A,#01H
ACALL CMD
```

### B135

```asm
MOV R7,#14
```

### B136

```asm
ACALL LDELAY
```

### B137

```asm
DJNZ R7,WAIT
```

### B138

Return to the instruction following the active call.

```asm
ret
```

### B139

```asm
PUSH    ACC
```

### B140

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

## Section 15

```mermaid
flowchart TD
B140["B141: PRINT - lines 386 to 386"]
B141["B142: instructions - lines 387 to 388"]
B142["B143: EXIT1 - lines 389 to 390"]
B143["B144: KEYPAD - lines 394 to 394"]
B144["B145: K1 - lines 395 to 398"]
B145["B146: K2 - lines 400 to 402"]
B146["B147: instructions - lines 403 to 403"]
B147["B148: OVER1 - lines 405 to 408"]
B148["B149: instructions - lines 409 to 412"]
B149["B150: instructions - lines 413 to 416"]
B140 -->|call| B115
B140 -->|after return| B141
B141 -->|jump| B139
B143 -->|next| B144
B144 -->|condition true| B144
B144 -->|condition false| B145
B145 -->|condition true| B147
B145 -->|condition false| B146
B146 -->|jump| B145
B147 -->|condition true| B152
B147 -->|condition false| B148
B148 -->|condition true| B153
B148 -->|condition false| B149
B149 -->|condition true| B154
B149 -->|condition false| B150
B115["Continue at B116 in section 12"]
B139["Continue at B140 in section 14"]
B152["Continue at B153 in section 16"]
B153["Continue at B154 in section 16"]
B154["Continue at B155 in section 16"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
ACALL    WCHR
```

### B142

```asm
INC DPTR
AJMP    CONT1
```

### B143

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B144

```asm
MOV P0,#01110000B
```

### B145

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B146

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B147

```asm
SJMP K2
```

### B148

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B149

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B150

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 417 to 420"]
B151["B152: instructions - lines 421 to 421"]
B152["B153: ROW_0 - lines 422 to 423"]
B153["B154: ROW_1 - lines 424 to 425"]
B154["B155: ROW_2 - lines 426 to 427"]
B155["B156: ROW_3 - lines 428 to 428"]
B156["B157: FIND - lines 430 to 430"]
B157["B158: FIND1 - lines 432 to 433"]
B158["B159: instructions - lines 434 to 435"]
B159["B160: MATCH - lines 436 to 438"]
B150 -->|condition true| B155
B150 -->|condition false| B151
B151 -->|jump| B145
B152 -->|jump| B156
B153 -->|jump| B156
B154 -->|jump| B156
B155 -->|next| B156
B156 -->|next| B157
B157 -->|condition true| B159
B157 -->|condition false| B158
B158 -->|jump| B157
B145["Continue at B146 in section 15"]
```

### B151

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B152

```asm
LJMP K2
```

### B153

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B154

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B155

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B156

```asm
MOV DPTR,#KCODE3
```

### B157

```asm
RLC A
```

### B158

```asm
RLC A
JNC MATCH
```

### B159

```asm
INC DPTR
SJMP FIND1
```

### B160

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
