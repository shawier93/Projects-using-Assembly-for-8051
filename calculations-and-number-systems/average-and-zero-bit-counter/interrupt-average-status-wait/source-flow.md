# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.
- `ORG 0003H` begins at B2.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: HEREE - lines 6 to 7"]
B2["B3: instructions - lines 8 to 8"]
B3["B4: START1 - lines 12 to 12"]
B4["B5: instructions - lines 13 to 15"]
B5["B6: FF - lines 17 to 17"]
B6["B7: instructions - lines 18 to 18"]
B7["B8: instructions - lines 19 to 19"]
B8["B9: instructions - lines 20 to 20"]
B9["B10: START - lines 23 to 23"]
B0 -->|jump| B3
B1 -->|condition true| B1
B1 -->|condition false| B2
B3 -->|call| B156
B3 -->|after return| B4
B4 -->|next| B5
B5 -->|call| B138
B5 -->|after return| B6
B6 -->|call| B142
B6 -->|after return| B7
B7 -->|condition true| B5
B7 -->|condition false| B8
B8 -->|call| B156
B8 -->|after return| B9
B9 -->|call| B163
B9 -->|after return| B10
B156["Continue at B157 in section 16"]
B138["Continue at B139 in section 14"]
B142["Continue at B143 in section 15"]
B163["Continue at B164 in section 17"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
SJMP START1
```

### B2

```asm
MOV A,P2
JB ACC.4,HEREE
```

### B3

Return to the instruction following the active call.

```asm
RET
```

### B4

```asm
ACALL INLCD
```

### B5

```asm
CLR A
MOV P1,#0FFH
MOV R7,#5
```

### B6

```asm
ACALL FLASH
```

### B7

```asm
ACALL DELAY
```

### B8

```asm
DJNZ R7,FF
```

### B9

```asm
ACALL INLCD
```

### B10

```asm
ACALL CLEAR
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 24 to 24"]
B11["B12: instructions - lines 25 to 26"]
B12["B13: instructions - lines 27 to 29"]
B13["B14: instructions - lines 30 to 31"]
B14["B15: instructions - lines 32 to 33"]
B15["B16: instructions - lines 34 to 34"]
B16["B17: instructions - lines 36 to 36"]
B17["B18: instructions - lines 37 to 37"]
B18["B19: instructions - lines 38 to 39"]
B19["B20: instructions - lines 40 to 42"]
B10 -->|call| B142
B10 -->|after return| B11
B11 -->|call| B150
B11 -->|after return| B12
B12 -->|call| B168
B12 -->|after return| B13
B13 -->|call| B150
B13 -->|after return| B14
B14 -->|call| B168
B14 -->|after return| B15
B15 -->|call| B142
B15 -->|after return| B16
B16 -->|call| B163
B16 -->|after return| B17
B17 -->|call| B142
B17 -->|after return| B18
B18 -->|call| B150
B18 -->|after return| B19
B19 -->|call| B168
B19 -->|after return| B20
B142["Continue at B143 in section 15"]
B150["Continue at B151 in section 16"]
B168["Continue at B169 in section 17"]
B163["Continue at B164 in section 17"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL DELAY
```

### B12

```asm
MOV A,#80H
ACALL CMD
```

### B13

```asm
CLR A
MOV DPTR,#STR1
ACALL WSTR
```

### B14

```asm
MOV A,#0C0H
ACALL CMD
```

### B15

```asm
MOV DPTR,#STR2
ACALL WSTR
```

### B16

```asm
ACALL DELAY
```

### B17

```asm
ACALL CLEAR
```

### B18

```asm
ACALL DELAY
```

### B19

```asm
MOV A,#80H
ACALL CMD
```

### B20

```asm
CLR A
MOV DPTR,#STR11
ACALL WSTR
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 44 to 47"]
B21["B22: MENUOP - lines 50 to 50"]
B22["B23: instructions - lines 51 to 51"]
B23["B24: instructions - lines 52 to 53"]
B24["B25: instructions - lines 54 to 56"]
B25["B26: instructions - lines 57 to 58"]
B26["B27: instructions - lines 59 to 60"]
B27["B28: instructions - lines 61 to 61"]
B28["B29: instructions - lines 63 to 63"]
B29["B30: instructions - lines 64 to 64"]
B20 -->|next| B21
B21 -->|call| B163
B21 -->|after return| B22
B22 -->|call| B142
B22 -->|after return| B23
B23 -->|call| B150
B23 -->|after return| B24
B24 -->|call| B168
B24 -->|after return| B25
B25 -->|call| B150
B25 -->|after return| B26
B26 -->|call| B168
B26 -->|after return| B27
B27 -->|call| B142
B27 -->|after return| B28
B28 -->|call| B163
B28 -->|after return| B29
B29 -->|call| B142
B29 -->|after return| B30
B163["Continue at B164 in section 17"]
B142["Continue at B143 in section 15"]
B150["Continue at B151 in section 16"]
B168["Continue at B169 in section 17"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV IE,#10000001B
SETB IT0
CLR P3.6
SETB P3.6
```

### B22

```asm
ACALL CLEAR
```

### B23

```asm
ACALL DELAY
```

### B24

```asm
MOV A,#80H
ACALL CMD
```

### B25

```asm
CLR A
MOV DPTR,#STR3
ACALL WSTR
```

### B26

```asm
MOV A,#0C0H
ACALL CMD
```

### B27

```asm
MOV DPTR,#STR4
ACALL WSTR
```

### B28

```asm
ACALL DELAY
```

### B29

```asm
ACALL CLEAR
```

### B30

```asm
ACALL DELAY
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 65 to 66"]
B31["B32: instructions - lines 67 to 69"]
B32["B33: instructions - lines 70 to 71"]
B33["B34: instructions - lines 72 to 72"]
B34["B35: instructions - lines 73 to 74"]
B35["B36: instructions - lines 75 to 78"]
B36["B37: X0 - lines 82 to 82"]
B37["B38: X1 - lines 85 to 85"]
B38["B39: instructions - lines 86 to 86"]
B39["B40: instructions - lines 87 to 88"]
B30 -->|call| B150
B30 -->|after return| B31
B31 -->|call| B168
B31 -->|after return| B32
B32 -->|call| B150
B32 -->|after return| B33
B33 -->|call| B173
B33 -->|after return| B34
B34 -->|call| B145
B34 -->|after return| B35
B35 -->|call| B142
B35 -->|after return| B36
B36 -->|condition true| B53
B36 -->|condition false| B37
B37 -->|call| B163
B37 -->|after return| B38
B38 -->|call| B142
B38 -->|after return| B39
B39 -->|call| B150
B39 -->|after return| B40
B150["Continue at B151 in section 16"]
B168["Continue at B169 in section 17"]
B173["Continue at B174 in section 18"]
B145["Continue at B146 in section 15"]
B142["Continue at B143 in section 15"]
B53["Continue at B54 in section 6"]
B163["Continue at B164 in section 17"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,#80H
ACALL CMD
```

### B32

```asm
CLR A
MOV DPTR,#STR5
ACALL WSTR
```

### B33

```asm
MOV A,#0C0H
ACALL CMD
```

### B34

```asm
ACALL KEYPAD
```

### B35

```asm
MOV R3,A
ACALL WCHR
```

### B36

```asm
MOV A,R3
SUBB A,#30H
MOV R3,A
ACALL DELAY
```

### B37

```asm
CJNE R3,#1,X2
```

### B38

```asm
ACALL CLEAR
```

### B39

```asm
ACALL DELAY
```

### B40

```asm
MOV A,#80H
ACALL CMD
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 89 to 91"]
B41["B42: instructions - lines 92 to 93"]
B42["B43: instructions - lines 94 to 94"]
B43["B44: instructions - lines 95 to 96"]
B44["B45: instructions - lines 97 to 102"]
B45["B46: instructions - lines 103 to 104"]
B46["B47: instructions - lines 105 to 115"]
B47["B48: instructions - lines 116 to 120"]
B48["B49: instructions - lines 121 to 123"]
B49["B50: instructions - lines 125 to 130"]
B40 -->|call| B168
B40 -->|after return| B41
B41 -->|call| B150
B41 -->|after return| B42
B42 -->|call| B173
B42 -->|after return| B43
B43 -->|call| B145
B43 -->|after return| B44
B44 -->|call| B173
B44 -->|after return| B45
B45 -->|call| B145
B45 -->|after return| B46
B46 -->|call| B150
B46 -->|after return| B47
B47 -->|call| B145
B47 -->|after return| B48
B48 -->|call| B145
B48 -->|after return| B49
B49 -->|call| B142
B49 -->|after return| B50
B168["Continue at B169 in section 17"]
B150["Continue at B151 in section 16"]
B173["Continue at B174 in section 18"]
B145["Continue at B146 in section 15"]
B142["Continue at B143 in section 15"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
CLR A
MOV DPTR,#STR6
ACALL WSTR
```

### B42

```asm
MOV A,#0C0H
ACALL CMD
```

### B43

```asm
ACALL KEYPAD
```

### B44

```asm
MOV R1,A
ACALL WCHR
```

### B45

```asm
MOV A,R1
SUBB A,#30H
MOV B,#10
MUL AB
MOV R1,A
ACALL KEYPAD
```

### B46

```asm
MOV R7,A
ACALL WCHR
```

### B47

```asm
MOV A,R7
SUBB A,#30H
MOV R7,A
ADD A ,R1
MOV 21H,A
SUBB A,#1
MOV 22H,A
MOV A,#0C5H
ACALL CMD
```

### B48

```asm
MOV A,22H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B49

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B50

```asm
MOV A,22H
MOV B,#2
ADD A,21H
DIV AB
MOV R6,A
ACALL DELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 131 to 131"]
B51["B52: instructions - lines 133 to 133"]
B52["B53: instructions - lines 135 to 135"]
B53["B54: X2 - lines 138 to 138"]
B54["B55: instructions - lines 139 to 139"]
B55["B56: instructions - lines 140 to 140"]
B56["B57: instructions - lines 141 to 142"]
B57["B58: instructions - lines 143 to 145"]
B58["B59: instructions - lines 146 to 147"]
B59["B60: instructions - lines 148 to 148"]
B50 -->|call| B142
B50 -->|after return| B51
B51 -->|call| B109
B51 -->|after return| B52
B52 -->|call| B84
B52 -->|after return| B53
B53 -->|condition true| B70
B53 -->|condition false| B54
B54 -->|call| B163
B54 -->|after return| B55
B55 -->|call| B142
B55 -->|after return| B56
B56 -->|call| B150
B56 -->|after return| B57
B57 -->|call| B168
B57 -->|after return| B58
B58 -->|call| B150
B58 -->|after return| B59
B59 -->|call| B173
B59 -->|after return| B60
B142["Continue at B143 in section 15"]
B109["Continue at B110 in section 11"]
B84["Continue at B85 in section 9"]
B70["Continue at B71 in section 8"]
B163["Continue at B164 in section 17"]
B150["Continue at B151 in section 16"]
B168["Continue at B169 in section 17"]
B173["Continue at B174 in section 18"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL DELAY
```

### B52

```asm
ACALL PRINT1
```

### B53

```asm
ACALL AGAINN
```

### B54

```asm
CJNE R3,#2,X3
```

### B55

```asm
ACALL CLEAR
```

### B56

```asm
ACALL DELAY
```

### B57

```asm
MOV A,#80H
ACALL CMD
```

### B58

```asm
CLR A
MOV DPTR,#STR6
ACALL WSTR
```

### B59

```asm
MOV A,#0C0H
ACALL CMD
```

### B60

```asm
ACALL KEYPAD
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 149 to 149"]
B61["B62: instructions - lines 150 to 154"]
B62["B63: instructions - lines 155 to 155"]
B63["B64: instructions - lines 156 to 166"]
B64["B65: X - lines 168 to 169"]
B65["B66: instructions - lines 170 to 170"]
B66["B67: instructions - lines 171 to 171"]
B67["B68: ZEROS - lines 174 to 175"]
B68["B69: XX - lines 178 to 178"]
B69["B70: instructions - lines 179 to 179"]
B60 -->|call| B145
B60 -->|after return| B61
B61 -->|call| B173
B61 -->|after return| B62
B62 -->|call| B145
B62 -->|after return| B63
B63 -->|next| B64
B64 -->|condition true| B67
B64 -->|condition false| B65
B65 -->|condition true| B64
B65 -->|condition false| B66
B66 -->|jump| B68
B67 -->|condition true| B64
B67 -->|condition false| B68
B68 -->|call| B118
B68 -->|after return| B69
B69 -->|call| B84
B69 -->|after return| B70
B145["Continue at B146 in section 15"]
B173["Continue at B174 in section 18"]
B118["Continue at B119 in section 12"]
B84["Continue at B85 in section 9"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL WCHR
```

### B62

```asm
SUBB A,#30H
MOV B,#16
MUL AB
MOV R1,A
ACALL KEYPAD
```

### B63

```asm
ACALL WCHR
```

### B64

```asm
SUBB A,#30H
MOV R7,A
ADD A ,R1
MOV R5,A
MOV R4,#8
MOV 20H,#0
CLR A
MOV A,R5
MOV 40H,A
```

### B65

```asm
RRC A
JNC ZEROS
```

### B66

```asm
DJNZ R4,X
```

### B67

```asm
SJMP XX
```

### B68

```asm
INC 20H
DJNZ R4,X
```

### B69

```asm
ACALL PRINT2
```

### B70

```asm
ACALL AGAINN
```

## Section 8

```mermaid
flowchart TD
B70["B71: X3 - lines 182 to 182"]
B71["B72: THANKS - lines 184 to 184"]
B72["B73: instructions - lines 185 to 185"]
B73["B74: instructions - lines 186 to 187"]
B74["B75: instructions - lines 188 to 190"]
B75["B76: instructions - lines 191 to 191"]
B76["B77: X00 - lines 193 to 193"]
B77["B78: instructions - lines 194 to 194"]
B78["B79: instructions - lines 195 to 195"]
B79["B80: instructions - lines 196 to 196"]
B70 -->|condition true| B76
B70 -->|condition false| B71
B71 -->|call| B163
B71 -->|after return| B72
B72 -->|call| B142
B72 -->|after return| B73
B73 -->|call| B150
B73 -->|after return| B74
B74 -->|call| B168
B74 -->|after return| B75
B75 -->|jump| B75
B76 -->|call| B138
B76 -->|after return| B77
B77 -->|call| B138
B77 -->|after return| B78
B78 -->|call| B138
B78 -->|after return| B79
B79 -->|call| B163
B79 -->|after return| B80
B163["Continue at B164 in section 17"]
B142["Continue at B143 in section 15"]
B150["Continue at B151 in section 16"]
B168["Continue at B169 in section 17"]
B138["Continue at B139 in section 14"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
CJNE A,#3, X00
```

### B72

```asm
ACALL CLEAR
```

### B73

```asm
ACALL DELAY
```

### B74

```asm
MOV A,#80H
ACALL CMD
```

### B75

```asm
CLR A
MOV DPTR,#STR10
ACALL WSTR
```

### B76

```asm
SJMP $
```

### B77

```asm
ACALL FLASH
```

### B78

```asm
ACALL FLASH
```

### B79

```asm
ACALL FLASH
```

### B80

```asm
ACALL CLEAR
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 197 to 197"]
B81["B82: instructions - lines 198 to 199"]
B82["B83: instructions - lines 200 to 202"]
B83["B84: instructions - lines 203 to 203"]
B84["B85: AGAINN - lines 211 to 211"]
B85["B86: instructions - lines 212 to 212"]
B86["B87: instructions - lines 213 to 213"]
B87["B88: instructions - lines 214 to 215"]
B88["B89: instructions - lines 216 to 217"]
B89["B90: instructions - lines 218 to 219"]
B80 -->|call| B142
B80 -->|after return| B81
B81 -->|call| B150
B81 -->|after return| B82
B82 -->|call| B168
B82 -->|after return| B83
B83 -->|jump| B21
B84 -->|call| B142
B84 -->|after return| B85
B85 -->|call| B163
B85 -->|after return| B86
B86 -->|call| B142
B86 -->|after return| B87
B87 -->|call| B150
B87 -->|after return| B88
B88 -->|call| B168
B88 -->|after return| B89
B89 -->|call| B150
B89 -->|after return| B90
B142["Continue at B143 in section 15"]
B150["Continue at B151 in section 16"]
B168["Continue at B169 in section 17"]
B21["Continue at B22 in section 3"]
B163["Continue at B164 in section 17"]
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
MOV DPTR,#STR12
ACALL WSTR
```

### B84

```asm
LJMP MENUOP
```

### B85

```asm
ACALL DELAY
```

### B86

```asm
ACALL CLEAR
```

### B87

```asm
ACALL DELAY
```

### B88

```asm
MOV A,#80H
ACALL CMD
```

### B89

```asm
MOV DPTR,#STR9
ACALL WSTR
```

### B90

```asm
MOV A,#0C0H
ACALL CMD
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 220 to 221"]
B91["B92: instructions - lines 222 to 222"]
B92["B93: instructions - lines 223 to 223"]
B93["B94: instructions - lines 224 to 224"]
B94["B95: instructions - lines 225 to 225"]
B95["B96: instructions - lines 226 to 226"]
B96["B97: SEC - lines 227 to 227"]
B97["B98: instructions - lines 228 to 228"]
B98["B99: THI - lines 230 to 230"]
B99["B100: instructions - lines 231 to 231"]
B90 -->|call| B168
B90 -->|after return| B91
B91 -->|call| B142
B91 -->|after return| B92
B92 -->|call| B142
B92 -->|after return| B93
B93 -->|call| B173
B93 -->|after return| B94
B94 -->|condition true| B96
B94 -->|condition false| B95
B95 -->|jump| B71
B96 -->|condition true| B98
B96 -->|condition false| B97
B97 -->|jump| B9
B98 -->|call| B101
B98 -->|after return| B99
B99 -->|jump| B84
B168["Continue at B169 in section 17"]
B142["Continue at B143 in section 15"]
B173["Continue at B174 in section 18"]
B71["Continue at B72 in section 8"]
B9["Continue at B10 in section 1"]
B101["Continue at B102 in section 11"]
B84["Continue at B85 in section 9"]
```

### B91

```asm
MOV DPTR,#STR13
ACALL WSTR
```

### B92

```asm
ACALL DELAY
```

### B93

```asm
ACALL DELAY
```

### B94

```asm
ACALL KEYPAD
```

### B95

```asm
CJNE A,#'1',SEC
```

### B96

```asm
LJMP THANKS
```

### B97

```asm
CJNE A,#'2',THI
```

### B98

```asm
LJMP START
```

### B99

```asm
ACALL ERROR
```

### B100

```asm
SJMP AGA
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 232 to 232"]
B101["B102: ERROR - lines 235 to 235"]
B102["B103: instructions - lines 236 to 236"]
B103["B104: instructions - lines 237 to 237"]
B104["B105: instructions - lines 238 to 240"]
B105["B106: instructions - lines 241 to 243"]
B106["B107: instructions - lines 244 to 244"]
B107["B108: instructions - lines 245 to 245"]
B108["B109: instructions - lines 247 to 247"]
B109["B110: PRINT1 - lines 252 to 252"]
B101 -->|call| B142
B101 -->|after return| B102
B102 -->|call| B163
B102 -->|after return| B103
B103 -->|call| B142
B103 -->|after return| B104
B104 -->|call| B150
B104 -->|after return| B105
B105 -->|call| B168
B105 -->|after return| B106
B106 -->|call| B142
B106 -->|after return| B107
B107 -->|call| B142
B107 -->|after return| B108
B109 -->|call| B163
B109 -->|after return| B110
B142["Continue at B143 in section 15"]
B163["Continue at B164 in section 17"]
B150["Continue at B151 in section 16"]
B168["Continue at B169 in section 17"]
B110["Continue at B111 in section 12"]
```

### B101

Return to the instruction following the active call.

```asm
RET
```

### B102

```asm
ACALL DELAY
```

### B103

```asm
ACALL CLEAR
```

### B104

```asm
ACALL DELAY
```

### B105

```asm
CLR A
MOV A,#80H
ACALL CMD
```

### B106

```asm
CLR A
MOV DPTR,#STR12
ACALL WSTR
```

### B107

```asm
ACALL DELAY
```

### B108

```asm
ACALL DELAY
```

### B109

Return to the instruction following the active call.

```asm
RET
```

### B110

```asm
ACALL CLEAR
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 253 to 253"]
B111["B112: instructions - lines 254 to 255"]
B112["B113: instructions - lines 256 to 258"]
B113["B114: instructions - lines 259 to 260"]
B114["B115: instructions - lines 261 to 265"]
B115["B116: instructions - lines 266 to 268"]
B116["B117: instructions - lines 269 to 269"]
B117["B118: instructions - lines 270 to 270"]
B118["B119: PRINT2 - lines 273 to 273"]
B119["B120: instructions - lines 274 to 274"]
B110 -->|call| B142
B110 -->|after return| B111
B111 -->|call| B150
B111 -->|after return| B112
B112 -->|call| B168
B112 -->|after return| B113
B113 -->|call| B150
B113 -->|after return| B114
B114 -->|call| B145
B114 -->|after return| B115
B115 -->|call| B145
B115 -->|after return| B116
B116 -->|call| B142
B116 -->|after return| B117
B118 -->|call| B163
B118 -->|after return| B119
B119 -->|call| B142
B119 -->|after return| B120
B142["Continue at B143 in section 15"]
B150["Continue at B151 in section 16"]
B168["Continue at B169 in section 17"]
B145["Continue at B146 in section 15"]
B163["Continue at B164 in section 17"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL DELAY
```

### B112

```asm
MOV A,#80H
ACALL CMD
```

### B113

```asm
CLR A
MOV DPTR,#STR7
ACALL WSTR
```

### B114

```asm
MOV A,#0C0H
ACALL CMD
```

### B115

```asm
MOV A,R6
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B116

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B117

```asm
ACALL DELAY
```

### B118

Return to the instruction following the active call.

```asm
RET
```

### B119

```asm
ACALL CLEAR
```

### B120

```asm
ACALL DELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 275 to 276"]
B121["B122: instructions - lines 277 to 279"]
B122["B123: instructions - lines 280 to 281"]
B123["B124: instructions - lines 282 to 286"]
B124["B125: instructions - lines 287 to 289"]
B125["B126: instructions - lines 290 to 290"]
B126["B127: instructions - lines 291 to 291"]
B127["B128: instructions - lines 292 to 292"]
B128["B129: instructions - lines 293 to 293"]
B129["B130: instructions - lines 296 to 296"]
B120 -->|call| B150
B120 -->|after return| B121
B121 -->|call| B168
B121 -->|after return| B122
B122 -->|call| B150
B122 -->|after return| B123
B123 -->|call| B145
B123 -->|after return| B124
B124 -->|call| B145
B124 -->|after return| B125
B125 -->|call| B142
B125 -->|after return| B126
B126 -->|call| B142
B126 -->|after return| B127
B127 -->|call| B142
B127 -->|after return| B128
B128 -->|call| B142
B128 -->|after return| B129
B129 -->|call| B163
B129 -->|after return| B130
B150["Continue at B151 in section 16"]
B168["Continue at B169 in section 17"]
B145["Continue at B146 in section 15"]
B142["Continue at B143 in section 15"]
B163["Continue at B164 in section 17"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV A,#80H
ACALL CMD
```

### B122

```asm
CLR A
MOV DPTR,#STR6
ACALL WSTR
```

### B123

```asm
MOV A,#0C0H
ACALL CMD
```

### B124

```asm
MOV A,40H
MOV B,#16
DIV AB
ADD A,#30H
ACALL WCHR
```

### B125

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B126

```asm
ACALL DELAY
```

### B127

```asm
ACALL DELAY
```

### B128

```asm
ACALL DELAY
```

### B129

```asm
ACALL DELAY
```

### B130

```asm
ACALL CLEAR
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 297 to 297"]
B131["B132: instructions - lines 298 to 299"]
B132["B133: instructions - lines 300 to 302"]
B133["B134: instructions - lines 303 to 304"]
B134["B135: instructions - lines 305 to 307"]
B135["B136: instructions - lines 308 to 308"]
B136["B137: instructions - lines 309 to 309"]
B137["B138: instructions - lines 310 to 310"]
B138["B139: FLASH - lines 313 to 314"]
B139["B140: instructions - lines 315 to 316"]
B130 -->|call| B142
B130 -->|after return| B131
B131 -->|call| B150
B131 -->|after return| B132
B132 -->|call| B168
B132 -->|after return| B133
B133 -->|call| B150
B133 -->|after return| B134
B134 -->|call| B145
B134 -->|after return| B135
B135 -->|call| B142
B135 -->|after return| B136
B136 -->|call| B142
B136 -->|after return| B137
B138 -->|call| B142
B138 -->|after return| B139
B139 -->|call| B142
B139 -->|after return| B140
B142["Continue at B143 in section 15"]
B150["Continue at B151 in section 16"]
B168["Continue at B169 in section 17"]
B145["Continue at B146 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
ACALL DELAY
```

### B132

```asm
MOV A,#80H
ACALL CMD
```

### B133

```asm
CLR A
MOV DPTR,#STR8
ACALL WSTR
```

### B134

```asm
MOV A,#0C0H
ACALL CMD
```

### B135

```asm
MOV A,20H
ADD A,#30H
ACALL WCHR
```

### B136

```asm
ACALL DELAY
```

### B137

```asm
ACALL DELAY
```

### B138

Return to the instruction following the active call.

```asm
RET
```

### B139

```asm
CLR P1.6
ACALL DELAY
```

### B140

```asm
SETB P1.6
ACALL DELAY
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 317 to 317"]
B141["B142: CONV - lines 320 to 340"]
B142["B143: DELAY - lines 343 to 343"]
B143["B144: HH - lines 344 to 344"]
B144["B145: instructions - lines 345 to 345"]
B145["B146: WCHR - lines 349 to 353"]
B146["B147: instructions - lines 354 to 354"]
B147["B148: instructions - lines 355 to 357"]
B148["B149: instructions - lines 358 to 358"]
B149["B150: instructions - lines 359 to 361"]
B142 -->|next| B143
B143 -->|condition true| B143
B143 -->|condition false| B144
B145 -->|call| B155
B145 -->|after return| B146
B146 -->|call| B161
B146 -->|after return| B147
B147 -->|call| B155
B147 -->|after return| B148
B148 -->|call| B161
B148 -->|after return| B149
B155["Continue at B156 in section 16"]
B161["Continue at B162 in section 17"]
```

### B141

Return to the instruction following the active call.

```asm
RET
```

### B142

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

### B143

```asm
MOV R0, #250
```

### B144

```asm
DJNZ R0, HH
```

### B145

Return to the instruction following the active call.

```asm
RET
```

### B146

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B147

```asm
ACALL LDELAY
```

### B148

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B149

```asm
ACALL LDELAY
```

### B150

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

## Section 16

```mermaid
flowchart TD
B150["B151: CMD - lines 364 to 366"]
B151["B152: instructions - lines 367 to 367"]
B152["B153: instructions - lines 368 to 370"]
B153["B154: instructions - lines 371 to 371"]
B154["B155: instructions - lines 372 to 372"]
B155["B156: COMMON - lines 375 to 380"]
B156["B157: INLCD - lines 383 to 390"]
B157["B158: instructions - lines 391 to 399"]
B158["B159: instructions - lines 400 to 412"]
B159["B160: instructions - lines 413 to 423"]
B150 -->|call| B155
B150 -->|after return| B151
B151 -->|call| B161
B151 -->|after return| B152
B152 -->|call| B155
B152 -->|after return| B153
B153 -->|call| B161
B153 -->|after return| B154
B156 -->|call| B161
B156 -->|after return| B157
B157 -->|call| B161
B157 -->|after return| B158
B158 -->|call| B161
B158 -->|after return| B159
B159 -->|call| B161
B159 -->|after return| B160
B161["Continue at B162 in section 17"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B152

```asm
ACALL LDELAY
```

### B153

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B154

```asm
ACALL LDELAY
```

### B155

Return to the instruction following the active call.

```asm
RET
```

### B156

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B157

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

### B158

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

### B159

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

### B160

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

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 424 to 424"]
B161["B162: LDELAY - lines 427 to 428"]
B162["B163: instructions - lines 429 to 429"]
B163["B164: CLEAR - lines 432 to 433"]
B164["B165: instructions - lines 434 to 434"]
B165["B166: WAIT - lines 435 to 435"]
B166["B167: instructions - lines 436 to 436"]
B167["B168: instructions - lines 437 to 437"]
B168["B169: WSTR - lines 440 to 440"]
B169["B170: CONT1 - lines 442 to 444"]
B161 -->|condition true| B161
B161 -->|condition false| B162
B163 -->|call| B150
B163 -->|after return| B164
B164 -->|next| B165
B165 -->|call| B161
B165 -->|after return| B166
B166 -->|condition true| B165
B166 -->|condition false| B167
B168 -->|next| B169
B169 -->|condition true| B172
B169 -->|condition false| B170
B150["Continue at B151 in section 16"]
B172["Continue at B173 in section 18"]
B170["Continue at B171 in section 18"]
```

### B161

Return to the instruction following the active call.

```asm
RET
```

### B162

```asm
MOV R0, #50
DJNZ R0, $
```

### B163

Return to the instruction following the active call.

```asm
RET
```

### B164

```asm
MOV A,#01H
ACALL CMD
```

### B165

```asm
MOV R7,#14
```

### B166

```asm
ACALL LDELAY
```

### B167

```asm
DJNZ R7,WAIT
```

### B168

Return to the instruction following the active call.

```asm
ret
```

### B169

```asm
PUSH    ACC
```

### B170

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

## Section 18

```mermaid
flowchart TD
B170["B171: PRINT - lines 446 to 446"]
B171["B172: instructions - lines 447 to 448"]
B172["B173: EXIT1 - lines 449 to 450"]
B173["B174: KEYPAD - lines 454 to 454"]
B174["B175: K1 - lines 455 to 458"]
B175["B176: K2 - lines 460 to 462"]
B176["B177: instructions - lines 463 to 463"]
B177["B178: OVER1 - lines 465 to 468"]
B178["B179: instructions - lines 469 to 472"]
B179["B180: instructions - lines 473 to 476"]
B170 -->|call| B145
B170 -->|after return| B171
B171 -->|jump| B169
B173 -->|next| B174
B174 -->|condition true| B174
B174 -->|condition false| B175
B175 -->|condition true| B177
B175 -->|condition false| B176
B176 -->|jump| B175
B177 -->|condition true| B182
B177 -->|condition false| B178
B178 -->|condition true| B183
B178 -->|condition false| B179
B179 -->|condition true| B184
B179 -->|condition false| B180
B145["Continue at B146 in section 15"]
B169["Continue at B170 in section 17"]
B182["Continue at B183 in section 19"]
B183["Continue at B184 in section 19"]
B184["Continue at B185 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
ACALL    WCHR
```

### B172

```asm
INC DPTR
AJMP    CONT1
```

### B173

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B174

```asm
MOV P0,#01110000B
```

### B175

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B176

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B177

```asm
SJMP K2
```

### B178

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B179

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B180

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 477 to 480"]
B181["B182: instructions - lines 481 to 481"]
B182["B183: ROW_0 - lines 482 to 483"]
B183["B184: ROW_1 - lines 484 to 485"]
B184["B185: ROW_2 - lines 486 to 487"]
B185["B186: ROW_3 - lines 488 to 488"]
B186["B187: FIND - lines 490 to 490"]
B187["B188: FIND1 - lines 492 to 493"]
B188["B189: instructions - lines 494 to 495"]
B189["B190: MATCH - lines 496 to 498"]
B180 -->|condition true| B185
B180 -->|condition false| B181
B181 -->|jump| B175
B182 -->|jump| B186
B183 -->|jump| B186
B184 -->|jump| B186
B185 -->|next| B186
B186 -->|next| B187
B187 -->|condition true| B189
B187 -->|condition false| B188
B188 -->|jump| B187
B175["Continue at B176 in section 18"]
```

### B181

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B182

```asm
LJMP K2
```

### B183

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B184

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B185

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B186

```asm
MOV DPTR,#KCODE3
```

### B187

```asm
RLC A
```

### B188

```asm
RLC A
JNC MATCH
```

### B189

```asm
INC DPTR
SJMP FIND1
```

### B190

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
