# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `org 0h` begins at B1.
- `ORG 0003H` begins at B2.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 5 to 5"]
B1["B2: H - lines 9 to 10"]
B2["B3: instructions - lines 11 to 11"]
B3["B4: MAIN - lines 14 to 14"]
B4["B5: instructions - lines 15 to 22"]
B5["B6: FF - lines 24 to 24"]
B6["B7: instructions - lines 25 to 25"]
B7["B8: instructions - lines 26 to 26"]
B8["B9: instructions - lines 28 to 28"]
B9["B10: instructions - lines 29 to 29"]
B0 -->|jump| B3
B1 -->|condition true| B1
B1 -->|condition false| B2
B3 -->|call| B178
B3 -->|after return| B4
B4 -->|next| B5
B5 -->|call| B149
B5 -->|after return| B6
B6 -->|call| B175
B6 -->|after return| B7
B7 -->|condition true| B5
B7 -->|condition false| B8
B8 -->|call| B178
B8 -->|after return| B9
B9 -->|call| B152
B9 -->|after return| B10
B178["Continue at B179 in section 18"]
B149["Continue at B150 in section 15"]
B175["Continue at B176 in section 18"]
B152["Continue at B153 in section 16"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
LJMP MAIN
```

### B2

```asm
MOV A,P2
JB ACC.3,H
```

### B3

Resume the interrupted program.

```asm
RETI
```

### B4

```asm
ACALL INLCD
```

### B5

```asm
MOV 30H,#99
MOV 31H,#19
MOV 32H,#0
MOV P1,#00H
CLR A
MOV P1,#0FFH
MOV R3,#5
```

### B6

```asm
ACALL FLASHING
```

### B7

```asm
ACALL DELAY
```

### B8

```asm
DJNZ R3,FF
```

### B9

```asm
ACALL INLCD
```

### B10

```asm
ACALL WELCOME
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 30 to 30"]
B11["B12: instructions - lines 33 to 36"]
B12["B13: START - lines 40 to 41"]
B13["B14: instructions - lines 42 to 42"]
B14["B15: instructions - lines 43 to 43"]
B15["B16: instructions - lines 44 to 45"]
B16["B17: instructions - lines 46 to 47"]
B17["B18: instructions - lines 48 to 49"]
B18["B19: instructions - lines 50 to 51"]
B19["B20: instructions - lines 52 to 52"]
B10 -->|call| B175
B10 -->|after return| B11
B11 -->|next| B12
B12 -->|call| B188
B12 -->|after return| B13
B13 -->|call| B175
B13 -->|after return| B14
B14 -->|call| B175
B14 -->|after return| B15
B15 -->|call| B188
B15 -->|after return| B16
B16 -->|call| B194
B16 -->|after return| B17
B17 -->|call| B188
B17 -->|after return| B18
B18 -->|call| B194
B18 -->|after return| B19
B19 -->|call| B175
B19 -->|after return| B20
B175["Continue at B176 in section 18"]
B188["Continue at B189 in section 19"]
B194["Continue at B195 in section 20"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL DELAY
```

### B12

```asm
MOV IE,#10000001B
SETB IT0
CLR P3.6
SETB P3.6
```

### B13

```asm
MOV A,#01H
ACALL CMD
```

### B14

```asm
ACALL DELAY
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
MOV DPTR,#CH0
ACALL WSTR
```

### B18

```asm
MOV A,#0C5H
ACALL CMD
```

### B19

```asm
MOV DPTR,#CH1
ACALL WSTR
```

### B20

```asm
ACALL DELAY
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 53 to 53"]
B21["B22: instructions - lines 54 to 54"]
B22["B23: instructions - lines 55 to 55"]
B23["B24: EXX - lines 57 to 57"]
B24["B25: instructions - lines 58 to 58"]
B25["B26: ER - lines 59 to 59"]
B26["B27: instructions - lines 60 to 60"]
B27["B28: ST - lines 63 to 64"]
B28["B29: instructions - lines 65 to 65"]
B29["B30: instructions - lines 66 to 66"]
B20 -->|call| B199
B20 -->|after return| B21
B21 -->|condition true| B23
B21 -->|condition false| B22
B22 -->|jump| B27
B23 -->|condition true| B25
B23 -->|condition false| B24
B24 -->|call| B142
B24 -->|after return| B25
B25 -->|call| B165
B25 -->|after return| B26
B26 -->|jump| B12
B27 -->|call| B188
B27 -->|after return| B28
B28 -->|call| B175
B28 -->|after return| B29
B29 -->|call| B175
B29 -->|after return| B30
B199["Continue at B200 in section 20"]
B142["Continue at B143 in section 15"]
B165["Continue at B166 in section 17"]
B12["Continue at B13 in section 2"]
B188["Continue at B189 in section 19"]
B175["Continue at B176 in section 18"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL KEYPAD
```

### B22

```asm
CJNE A,#'1',EXX
```

### B23

```asm
SJMP ST
```

### B24

```asm
CJNE A,#'2',ER
```

### B25

```asm
LCALL EXIT
```

### B26

```asm
ACALL ERROR
```

### B27

```asm
SJMP START
```

### B28

```asm
MOV A,#01H
ACALL CMD
```

### B29

```asm
ACALL DELAY
```

### B30

```asm
ACALL DELAY
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 67 to 68"]
B31["B32: instructions - lines 69 to 70"]
B32["B33: instructions - lines 71 to 72"]
B33["B34: instructions - lines 73 to 73"]
B34["B35: instructions - lines 74 to 74"]
B35["B36: instructions - lines 75 to 75"]
B36["B37: instructions - lines 76 to 77"]
B37["B38: instructions - lines 78 to 78"]
B38["B39: instructions - lines 79 to 80"]
B39["B40: instructions - lines 81 to 81"]
B30 -->|call| B188
B30 -->|after return| B31
B31 -->|call| B194
B31 -->|after return| B32
B32 -->|call| B188
B32 -->|after return| B33
B33 -->|call| B175
B33 -->|after return| B34
B34 -->|call| B175
B34 -->|after return| B35
B35 -->|call| B199
B35 -->|after return| B36
B36 -->|call| B183
B36 -->|after return| B37
B37 -->|call| B199
B37 -->|after return| B38
B38 -->|call| B183
B38 -->|after return| B39
B39 -->|call| B174
B39 -->|after return| B40
B188["Continue at B189 in section 19"]
B194["Continue at B195 in section 20"]
B175["Continue at B176 in section 18"]
B199["Continue at B200 in section 20"]
B183["Continue at B184 in section 19"]
B174["Continue at B175 in section 18"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A,#80H
ACALL CMD
```

### B32

```asm
MOV DPTR,#STR2
ACALL WSTR
```

### B33

```asm
MOV A,#0C5H
ACALL CMD
```

### B34

```asm
ACALL DELAY
```

### B35

```asm
ACALL DELAY
```

### B36

```asm
ACALL KEYPAD
```

### B37

```asm
MOV 50H,A
ACALL WCHR
```

### B38

```asm
ACALL KEYPAD
```

### B39

```asm
MOV 51H,A
ACALL WCHR
```

### B40

```asm
ACALL INCONV
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 82 to 88"]
B41["B42: instructions - lines 89 to 89"]
B42["B43: instructions - lines 90 to 90"]
B43["B44: instructions - lines 91 to 92"]
B44["B45: instructions - lines 93 to 94"]
B45["B46: instructions - lines 95 to 96"]
B46["B47: instructions - lines 97 to 97"]
B47["B48: instructions - lines 98 to 98"]
B48["B49: instructions - lines 100 to 100"]
B49["B50: instructions - lines 101 to 102"]
B40 -->|call| B188
B40 -->|after return| B41
B41 -->|call| B175
B41 -->|after return| B42
B42 -->|call| B175
B42 -->|after return| B43
B43 -->|call| B188
B43 -->|after return| B44
B44 -->|call| B194
B44 -->|after return| B45
B45 -->|call| B188
B45 -->|after return| B46
B46 -->|call| B175
B46 -->|after return| B47
B47 -->|call| B175
B47 -->|after return| B48
B48 -->|call| B199
B48 -->|after return| B49
B49 -->|call| B183
B49 -->|after return| B50
B188["Continue at B189 in section 19"]
B175["Continue at B176 in section 18"]
B194["Continue at B195 in section 20"]
B199["Continue at B200 in section 20"]
B183["Continue at B184 in section 19"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV 30H,45H
MOV A,#01H
ACALL CMD
```

### B42

```asm
ACALL DELAY
```

### B43

```asm
ACALL DELAY
```

### B44

```asm
MOV A,#80H
ACALL CMD
```

### B45

```asm
MOV DPTR,#STR3
ACALL WSTR
```

### B46

```asm
MOV A,#0C5H
ACALL CMD
```

### B47

```asm
ACALL DELAY
```

### B48

```asm
ACALL DELAY
```

### B49

```asm
ACALL KEYPAD
```

### B50

```asm
MOV 50H,A
ACALL WCHR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 103 to 103"]
B51["B52: instructions - lines 104 to 105"]
B52["B53: instructions - lines 106 to 106"]
B53["B54: instructions - lines 107 to 107"]
B54["B55: instructions - lines 108 to 111"]
B55["B56: CHECK - lines 113 to 114"]
B56["B57: instructions - lines 115 to 115"]
B57["B58: instructions - lines 116 to 116"]
B58["B59: instructions - lines 117 to 118"]
B59["B60: instructions - lines 119 to 120"]
B50 -->|call| B199
B50 -->|after return| B51
B51 -->|call| B183
B51 -->|after return| B52
B52 -->|call| B175
B52 -->|after return| B53
B53 -->|call| B174
B53 -->|after return| B54
B54 -->|jump| B69
B55 -->|call| B188
B55 -->|after return| B56
B56 -->|call| B175
B56 -->|after return| B57
B57 -->|call| B175
B57 -->|after return| B58
B58 -->|call| B188
B58 -->|after return| B59
B59 -->|call| B194
B59 -->|after return| B60
B199["Continue at B200 in section 20"]
B183["Continue at B184 in section 19"]
B175["Continue at B176 in section 18"]
B174["Continue at B175 in section 18"]
B69["Continue at B70 in section 7"]
B188["Continue at B189 in section 19"]
B194["Continue at B195 in section 20"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL KEYPAD
```

### B52

```asm
MOV 51H,A
ACALL WCHR
```

### B53

```asm
ACALL DELAY
```

### B54

```asm
ACALL INCONV
```

### B55

```asm
MOV 31H,45H
SJMP MAIN_MINU
```

### B56

```asm
MOV A,#1
ACALL CMD
```

### B57

```asm
ACALL DELAY
```

### B58

```asm
ACALL DELAY
```

### B59

```asm
MOV A,#80H
ACALL CMD
```

### B60

```asm
MOV DPTR,#AG
ACALL WSTR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 121 to 122"]
B61["B62: instructions - lines 123 to 124"]
B62["B63: instructions - lines 125 to 125"]
B63["B64: instructions - lines 126 to 126"]
B64["B65: instructions - lines 127 to 127"]
B65["B66: EX - lines 128 to 128"]
B66["B67: instructions - lines 129 to 129"]
B67["B68: ERR - lines 130 to 130"]
B68["B69: instructions - lines 131 to 131"]
B69["B70: MAIN_MINU - lines 134 to 141"]
B60 -->|call| B188
B60 -->|after return| B61
B61 -->|call| B194
B61 -->|after return| B62
B62 -->|call| B199
B62 -->|after return| B63
B63 -->|condition true| B65
B63 -->|condition false| B64
B64 -->|jump| B27
B65 -->|condition true| B67
B65 -->|condition false| B66
B66 -->|jump| B142
B67 -->|call| B165
B67 -->|after return| B68
B68 -->|jump| B55
B69 -->|call| B188
B69 -->|after return| B70
B188["Continue at B189 in section 19"]
B194["Continue at B195 in section 20"]
B199["Continue at B200 in section 20"]
B27["Continue at B28 in section 3"]
B142["Continue at B143 in section 15"]
B165["Continue at B166 in section 17"]
B55["Continue at B56 in section 6"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,#0C0H
ACALL CMD
```

### B62

```asm
MOV DPTR,#CH1
ACALL WSTR
```

### B63

```asm
ACALL KEYPAD
```

### B64

```asm
CJNE A,#'1',EX
```

### B65

```asm
SJMP ST
```

### B66

```asm
CJNE A,#'2',ERR
```

### B67

```asm
LJMP EXIT
```

### B68

```asm
ACALL ERROR
```

### B69

```asm
SJMP CHECK
```

### B70

```asm
MOV A,31H
MOV B,#1
SUBB A,B
MOV 20H,A
MOV A,#01H
ACALL CMD
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 142 to 142"]
B71["B72: instructions - lines 143 to 143"]
B72["B73: instructions - lines 144 to 145"]
B73["B74: instructions - lines 146 to 147"]
B74["B75: instructions - lines 148 to 149"]
B75["B76: instructions - lines 151 to 152"]
B76["B77: instructions - lines 153 to 154"]
B77["B78: instructions - lines 155 to 156"]
B78["B79: instructions - lines 157 to 158"]
B79["B80: instructions - lines 160 to 166"]
B70 -->|call| B175
B70 -->|after return| B71
B71 -->|call| B175
B71 -->|after return| B72
B72 -->|call| B188
B72 -->|after return| B73
B73 -->|call| B194
B73 -->|after return| B74
B74 -->|call| B188
B74 -->|after return| B75
B75 -->|call| B173
B75 -->|after return| B76
B76 -->|call| B183
B76 -->|after return| B77
B77 -->|call| B183
B77 -->|after return| B78
B78 -->|call| B183
B78 -->|after return| B79
B79 -->|condition true| B98
B79 -->|condition false| B80
B175["Continue at B176 in section 18"]
B188["Continue at B189 in section 19"]
B194["Continue at B195 in section 20"]
B173["Continue at B174 in section 18"]
B183["Continue at B184 in section 19"]
B98["Continue at B99 in section 10"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL DELAY
```

### B72

```asm
ACALL DELAY
```

### B73

```asm
MOV A,#80H
ACALL CMD
```

### B74

```asm
MOV DPTR,#STR5
ACALL WSTR
```

### B75

```asm
MOV A,#0C5H
ACALL CMD
```

### B76

```asm
MOV R4,20H
ACALL CONV
```

### B77

```asm
MOV A,60H
ACALL WCHR
```

### B78

```asm
MOV A,61H
ACALL WCHR
```

### B79

```asm
MOV A,62H
ACALL WCHR
```

### B80

```asm
MOV A,20H
MOV B,#10
DIV AB
MOV R1,B
CJNE A,#0H,DISC2
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 167 to 167"]
B81["B82: instructions - lines 168 to 169"]
B82["B83: instructions - lines 170 to 170"]
B83["B84: instructions - lines 171 to 171"]
B84["B85: instructions - lines 172 to 173"]
B85["B86: instructions - lines 174 to 175"]
B86["B87: instructions - lines 177 to 178"]
B87["B88: instructions - lines 179 to 180"]
B88["B89: instructions - lines 181 to 181"]
B89["B90: instructions - lines 182 to 182"]
B80 -->|condition true| B99
B80 -->|condition false| B81
B81 -->|call| B188
B81 -->|after return| B82
B82 -->|call| B175
B82 -->|after return| B83
B83 -->|call| B175
B83 -->|after return| B84
B84 -->|call| B188
B84 -->|after return| B85
B85 -->|call| B194
B85 -->|after return| B86
B86 -->|call| B148
B86 -->|after return| B87
B87 -->|call| B188
B87 -->|after return| B88
B88 -->|call| B175
B88 -->|after return| B89
B89 -->|call| B175
B89 -->|after return| B90
B99["Continue at B100 in section 10"]
B188["Continue at B189 in section 19"]
B175["Continue at B176 in section 18"]
B194["Continue at B195 in section 20"]
B148["Continue at B149 in section 15"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
CJNE R1,#0H, DISCO1
```

### B82

```asm
MOV A,#01H
ACALL CMD
```

### B83

```asm
ACALL DELAY
```

### B84

```asm
ACALL DELAY
```

### B85

```asm
MOV A,#80H
ACALL CMD
```

### B86

```asm
MOV DPTR,#STR4
ACALL WSTR
```

### B87

```asm
MOV 32H,#0
ACALL COST
```

### B88

```asm
MOV A,#01H
ACALL CMD
```

### B89

```asm
ACALL DELAY
```

### B90

```asm
ACALL DELAY
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 183 to 184"]
B91["B92: instructions - lines 185 to 186"]
B92["B93: instructions - lines 187 to 188"]
B93["B94: instructions - lines 190 to 191"]
B94["B95: instructions - lines 192 to 193"]
B95["B96: instructions - lines 194 to 195"]
B96["B97: instructions - lines 196 to 197"]
B97["B98: instructions - lines 198 to 198"]
B98["B99: DISC2 - lines 200 to 200"]
B99["B100: DISCO1 - lines 202 to 202"]
B90 -->|call| B188
B90 -->|after return| B91
B91 -->|call| B194
B91 -->|after return| B92
B92 -->|call| B188
B92 -->|after return| B93
B93 -->|call| B173
B93 -->|after return| B94
B94 -->|call| B183
B94 -->|after return| B95
B95 -->|call| B183
B95 -->|after return| B96
B96 -->|call| B183
B96 -->|after return| B97
B97 -->|jump| B55
B98 -->|jump| B117
B99 -->|condition true| B117
B99 -->|condition false| B100
B188["Continue at B189 in section 19"]
B194["Continue at B195 in section 20"]
B173["Continue at B174 in section 18"]
B183["Continue at B184 in section 19"]
B55["Continue at B56 in section 6"]
B117["Continue at B118 in section 12"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV A,#80H
ACALL CMD
```

### B92

```asm
MOV DPTR,#STR9
ACALL WSTR
```

### B93

```asm
MOV A,#0C5H
ACALL CMD
```

### B94

```asm
MOV R4,33H
ACALL CONV
```

### B95

```asm
MOV A,60H
ACALL WCHR
```

### B96

```asm
MOV A,61H
ACALL WCHR
```

### B97

```asm
MOV A,62H
ACALL WCHR
```

### B98

```asm
AJMP CHECK
```

### B99

```asm
SJMP DISCO2
```

### B100

```asm
CJNE A,#0H, DISCO2
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 203 to 204"]
B101["B102: instructions - lines 205 to 205"]
B102["B103: instructions - lines 206 to 206"]
B103["B104: instructions - lines 207 to 208"]
B104["B105: instructions - lines 209 to 210"]
B105["B106: instructions - lines 211 to 212"]
B106["B107: instructions - lines 213 to 214"]
B107["B108: instructions - lines 215 to 215"]
B108["B109: instructions - lines 216 to 216"]
B109["B110: instructions - lines 217 to 218"]
B100 -->|call| B188
B100 -->|after return| B101
B101 -->|call| B175
B101 -->|after return| B102
B102 -->|call| B175
B102 -->|after return| B103
B103 -->|call| B188
B103 -->|after return| B104
B104 -->|call| B194
B104 -->|after return| B105
B105 -->|call| B148
B105 -->|after return| B106
B106 -->|call| B188
B106 -->|after return| B107
B107 -->|call| B175
B107 -->|after return| B108
B108 -->|call| B175
B108 -->|after return| B109
B109 -->|call| B188
B109 -->|after return| B110
B188["Continue at B189 in section 19"]
B175["Continue at B176 in section 18"]
B194["Continue at B195 in section 20"]
B148["Continue at B149 in section 15"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV A,#01H
ACALL CMD
```

### B102

```asm
ACALL DELAY
```

### B103

```asm
ACALL DELAY
```

### B104

```asm
MOV A,#80H
ACALL CMD
```

### B105

```asm
MOV DPTR,#STR7
ACALL WSTR
```

### B106

```asm
MOV 32H,#1
ACALL COST
```

### B107

```asm
MOV A,#01H
ACALL CMD
```

### B108

```asm
ACALL DELAY
```

### B109

```asm
ACALL DELAY
```

### B110

```asm
MOV A,#80H
ACALL CMD
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 219 to 220"]
B111["B112: instructions - lines 221 to 222"]
B112["B113: instructions - lines 224 to 225"]
B113["B114: instructions - lines 226 to 227"]
B114["B115: instructions - lines 228 to 229"]
B115["B116: instructions - lines 230 to 231"]
B116["B117: instructions - lines 232 to 232"]
B117["B118: DISCO2 - lines 235 to 235"]
B118["B119: instructions - lines 236 to 237"]
B119["B120: instructions - lines 238 to 238"]
B110 -->|call| B194
B110 -->|after return| B111
B111 -->|call| B188
B111 -->|after return| B112
B112 -->|call| B173
B112 -->|after return| B113
B113 -->|call| B183
B113 -->|after return| B114
B114 -->|call| B183
B114 -->|after return| B115
B115 -->|call| B183
B115 -->|after return| B116
B116 -->|jump| B55
B117 -->|condition true| B135
B117 -->|condition false| B118
B118 -->|call| B188
B118 -->|after return| B119
B119 -->|call| B175
B119 -->|after return| B120
B194["Continue at B195 in section 20"]
B188["Continue at B189 in section 19"]
B173["Continue at B174 in section 18"]
B183["Continue at B184 in section 19"]
B55["Continue at B56 in section 6"]
B135["Continue at B136 in section 14"]
B175["Continue at B176 in section 18"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV DPTR,#STR9
ACALL WSTR
```

### B112

```asm
MOV A,#0C5H
ACALL CMD
```

### B113

```asm
MOV R4,33H
ACALL CONV
```

### B114

```asm
MOV A,60H
ACALL WCHR
```

### B115

```asm
MOV A,61H
ACALL WCHR
```

### B116

```asm
MOV A,62H
ACALL WCHR
```

### B117

```asm
AJMP CHECK
```

### B118

```asm
CJNE A,#1H, FREE
```

### B119

```asm
MOV A,#01H
ACALL CMD
```

### B120

```asm
ACALL DELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 239 to 239"]
B121["B122: instructions - lines 240 to 241"]
B122["B123: instructions - lines 242 to 243"]
B123["B124: instructions - lines 244 to 245"]
B124["B125: instructions - lines 246 to 247"]
B125["B126: instructions - lines 248 to 248"]
B126["B127: instructions - lines 249 to 249"]
B127["B128: instructions - lines 250 to 251"]
B128["B129: instructions - lines 252 to 253"]
B129["B130: instructions - lines 254 to 255"]
B120 -->|call| B175
B120 -->|after return| B121
B121 -->|call| B188
B121 -->|after return| B122
B122 -->|call| B194
B122 -->|after return| B123
B123 -->|call| B148
B123 -->|after return| B124
B124 -->|call| B188
B124 -->|after return| B125
B125 -->|call| B175
B125 -->|after return| B126
B126 -->|call| B175
B126 -->|after return| B127
B127 -->|call| B188
B127 -->|after return| B128
B128 -->|call| B194
B128 -->|after return| B129
B129 -->|call| B188
B129 -->|after return| B130
B175["Continue at B176 in section 18"]
B188["Continue at B189 in section 19"]
B194["Continue at B195 in section 20"]
B148["Continue at B149 in section 15"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
ACALL DELAY
```

### B122

```asm
MOV A,#80H
ACALL CMD
```

### B123

```asm
MOV DPTR,#STR8
ACALL WSTR
```

### B124

```asm
MOV 32H,#2
ACALL COST
```

### B125

```asm
MOV A,#01H
ACALL CMD
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
MOV A,#80H
ACALL CMD
```

### B129

```asm
MOV DPTR,#STR9
ACALL WSTR
```

### B130

```asm
MOV A,#0C5H
ACALL CMD
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 257 to 258"]
B131["B132: instructions - lines 259 to 260"]
B132["B133: instructions - lines 261 to 262"]
B133["B134: instructions - lines 263 to 264"]
B134["B135: instructions - lines 265 to 265"]
B135["B136: FREE - lines 268 to 269"]
B136["B137: instructions - lines 270 to 270"]
B137["B138: instructions - lines 271 to 271"]
B138["B139: instructions - lines 272 to 273"]
B139["B140: instructions - lines 274 to 275"]
B130 -->|call| B173
B130 -->|after return| B131
B131 -->|call| B183
B131 -->|after return| B132
B132 -->|call| B183
B132 -->|after return| B133
B133 -->|call| B183
B133 -->|after return| B134
B134 -->|jump| B55
B135 -->|call| B188
B135 -->|after return| B136
B136 -->|call| B175
B136 -->|after return| B137
B137 -->|call| B175
B137 -->|after return| B138
B138 -->|call| B188
B138 -->|after return| B139
B139 -->|call| B194
B139 -->|after return| B140
B173["Continue at B174 in section 18"]
B183["Continue at B184 in section 19"]
B55["Continue at B56 in section 6"]
B188["Continue at B189 in section 19"]
B175["Continue at B176 in section 18"]
B194["Continue at B195 in section 20"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV R4,33H
ACALL CONV
```

### B132

```asm
MOV A,60H
ACALL WCHR
```

### B133

```asm
MOV A,61H
ACALL WCHR
```

### B134

```asm
MOV A,62H
ACALL WCHR
```

### B135

```asm
AJMP CHECK
```

### B136

```asm
MOV A,#01H
ACALL CMD
```

### B137

```asm
ACALL DELAY
```

### B138

```asm
ACALL DELAY
```

### B139

```asm
MOV A,#80H
ACALL CMD
```

### B140

```asm
MOV DPTR,#STR6
ACALL WSTR
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 276 to 277"]
B141["B142: instructions - lines 280 to 280"]
B142["B143: EXIT - lines 283 to 284"]
B143["B144: instructions - lines 285 to 285"]
B144["B145: instructions - lines 286 to 286"]
B145["B146: instructions - lines 287 to 288"]
B146["B147: instructions - lines 289 to 290"]
B147["B148: EXITT - lines 291 to 291"]
B148["B149: COST - lines 296 to 311"]
B149["B150: FLASHING - lines 315 to 316"]
B140 -->|call| B148
B140 -->|after return| B141
B141 -->|jump| B55
B142 -->|call| B188
B142 -->|after return| B143
B143 -->|call| B175
B143 -->|after return| B144
B144 -->|call| B175
B144 -->|after return| B145
B145 -->|call| B188
B145 -->|after return| B146
B146 -->|call| B194
B146 -->|after return| B147
B147 -->|jump| B147
B149 -->|call| B175
B149 -->|after return| B150
B55["Continue at B56 in section 6"]
B188["Continue at B189 in section 19"]
B175["Continue at B176 in section 18"]
B194["Continue at B195 in section 20"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
MOV 32H,#10
ACALL COST
```

### B142

```asm
AJMP CHECK
```

### B143

```asm
MOV A ,#1
ACALL CMD
```

### B144

```asm
ACALL DELAY
```

### B145

```asm
ACALL DELAY
```

### B146

```asm
MOV A ,#80H
ACALL CMD
```

### B147

```asm
MOV DPTR, #EXI
ACALL WSTR
```

### B148

```asm
SJMP EXITT
```

### B149

Return to the instruction following the active call.

```asm
MOV A,30H
MOV B,#10
DIV AB
MOV R3,A
MOV R2,B
MOV A,#10
SUBB A,32H
MOV B,A
MOV A,R3
MUL AB
ADD A,R2
MOV 33H,A
RET
```

### B150

```asm
CLR P1.1
ACALL DELAY
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 317 to 318"]
B151["B152: instructions - lines 319 to 319"]
B152["B153: WELCOME - lines 322 to 323"]
B153["B154: instructions - lines 324 to 324"]
B154["B155: instructions - lines 325 to 325"]
B155["B156: instructions - lines 326 to 328"]
B156["B157: instructions - lines 329 to 331"]
B157["B158: instructions - lines 332 to 332"]
B158["B159: instructions - lines 333 to 333"]
B159["B160: instructions - lines 335 to 336"]
B150 -->|call| B175
B150 -->|after return| B151
B152 -->|call| B188
B152 -->|after return| B153
B153 -->|call| B175
B153 -->|after return| B154
B154 -->|call| B175
B154 -->|after return| B155
B155 -->|call| B188
B155 -->|after return| B156
B156 -->|call| B194
B156 -->|after return| B157
B157 -->|call| B175
B157 -->|after return| B158
B158 -->|call| B175
B158 -->|after return| B159
B159 -->|call| B188
B159 -->|after return| B160
B175["Continue at B176 in section 18"]
B188["Continue at B189 in section 19"]
B194["Continue at B195 in section 20"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
SETB P1.1
ACALL DELAY
```

### B152

Return to the instruction following the active call.

```asm
RET
```

### B153

```asm
MOV A,#01H
ACALL CMD
```

### B154

```asm
ACALL DELAY
```

### B155

```asm
ACALL DELAY
```

### B156

```asm
CLR A
MOV A,#80H
ACALL CMD
```

### B157

```asm
CLR A
MOV DPTR,#STR1
ACALL WSTR
```

### B158

```asm
ACALL DELAY
```

### B159

```asm
ACALL DELAY
```

### B160

```asm
MOV A,#01H
ACALL CMD
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 337 to 337"]
B161["B162: instructions - lines 338 to 338"]
B162["B163: instructions - lines 339 to 341"]
B163["B164: instructions - lines 342 to 344"]
B164["B165: instructions - lines 346 to 346"]
B165["B166: ERROR - lines 349 to 350"]
B166["B167: instructions - lines 351 to 351"]
B167["B168: instructions - lines 352 to 352"]
B168["B169: instructions - lines 353 to 355"]
B169["B170: instructions - lines 356 to 358"]
B160 -->|call| B175
B160 -->|after return| B161
B161 -->|call| B175
B161 -->|after return| B162
B162 -->|call| B188
B162 -->|after return| B163
B163 -->|call| B194
B163 -->|after return| B164
B165 -->|call| B188
B165 -->|after return| B166
B166 -->|call| B175
B166 -->|after return| B167
B167 -->|call| B175
B167 -->|after return| B168
B168 -->|call| B188
B168 -->|after return| B169
B169 -->|call| B194
B169 -->|after return| B170
B175["Continue at B176 in section 18"]
B188["Continue at B189 in section 19"]
B194["Continue at B195 in section 20"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
ACALL DELAY
```

### B162

```asm
ACALL DELAY
```

### B163

```asm
CLR A
MOV A,#80H
ACALL CMD
```

### B164

```asm
CLR A
MOV DPTR,#INTT
ACALL WSTR
```

### B165

Return to the instruction following the active call.

```asm
RET
```

### B166

```asm
MOV A,#01H
ACALL CMD
```

### B167

```asm
ACALL DELAY
```

### B168

```asm
ACALL DELAY
```

### B169

```asm
CLR A
MOV A,#80H
ACALL CMD
```

### B170

```asm
CLR A
MOV DPTR,#ERRORR
ACALL WSTR
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 359 to 359"]
B171["B172: instructions - lines 360 to 360"]
B172["B173: instructions - lines 362 to 362"]
B173["B174: CONV - lines 365 to 385"]
B174["B175: INCONV - lines 388 to 401"]
B175["B176: DELAY - lines 404 to 404"]
B176["B177: HH - lines 405 to 405"]
B177["B178: instructions - lines 406 to 406"]
B178["B179: INLCD - lines 410 to 418"]
B179["B180: instructions - lines 420 to 429"]
B170 -->|call| B175
B170 -->|after return| B171
B171 -->|call| B175
B171 -->|after return| B172
B175 -->|next| B176
B176 -->|condition true| B176
B176 -->|condition false| B177
B178 -->|call| B175
B178 -->|after return| B179
B179 -->|call| B175
B179 -->|after return| B180
B180["Continue at B181 in section 19"]
```

### B171

```asm
ACALL DELAY
```

### B172

```asm
ACALL DELAY
```

### B173

Return to the instruction following the active call.

```asm
RET
```

### B174

Return to the instruction following the active call.

```asm
MOV B,#100
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

### B175

Return to the instruction following the active call.

```asm
MOV A,50H
SUBB A,#30H
MOV 40H,A
MOV A,51H
SUBB A,#30H
MOV 41H,A
MOV B,#10
MOV A,40H
MUL AB
ADD A,41H
MOV 45H,A
RET
```

### B176

```asm
MOV R0, #250
```

### B177

```asm
DJNZ R0, HH
```

### B178

Return to the instruction following the active call.

```asm
RET
```

### B179

```asm
CLR P1.3
CLR P1.7
CLR P1.6
SETB P1.5
CLR P1.4
SETB P1.2
CLR P1.2
ACALL DELAY
```

### B180

```asm
SETB P1.2
CLR P1.2
SETB P1.7
CLR P1.6
CLR P1.5
CLR P1.4
SETB P1.2
CLR P1.2
ACALL DELAY
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 431 to 446"]
B181["B182: instructions - lines 448 to 460"]
B182["B183: instructions - lines 461 to 461"]
B183["B184: WCHR - lines 466 to 470"]
B184["B185: instructions - lines 471 to 471"]
B185["B186: instructions - lines 472 to 474"]
B186["B187: instructions - lines 475 to 475"]
B187["B188: instructions - lines 476 to 478"]
B188["B189: CMD - lines 481 to 483"]
B189["B190: instructions - lines 484 to 484"]
B180 -->|call| B175
B180 -->|after return| B181
B181 -->|call| B175
B181 -->|after return| B182
B183 -->|call| B193
B183 -->|after return| B184
B184 -->|call| B175
B184 -->|after return| B185
B185 -->|call| B193
B185 -->|after return| B186
B186 -->|call| B175
B186 -->|after return| B187
B188 -->|call| B193
B188 -->|after return| B189
B189 -->|call| B175
B189 -->|after return| B190
B175["Continue at B176 in section 18"]
B193["Continue at B194 in section 20"]
B190["Continue at B191 in section 20"]
```

### B181

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
ACALL DELAY
```

### B182

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
ACALL DELAY
```

### B183

Return to the instruction following the active call.

```asm
RET
```

### B184

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B185

```asm
ACALL DELAY
```

### B186

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B187

```asm
ACALL DELAY
```

### B188

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B189

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B190

```asm
ACALL DELAY
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 485 to 487"]
B191["B192: instructions - lines 488 to 488"]
B192["B193: instructions - lines 489 to 489"]
B193["B194: COMMON - lines 493 to 498"]
B194["B195: WSTR - lines 502 to 502"]
B195["B196: CONT1 - lines 504 to 506"]
B196["B197: PRINT - lines 508 to 508"]
B197["B198: instructions - lines 509 to 510"]
B198["B199: EXIT1 - lines 511 to 512"]
B199["B200: KEYPAD - lines 516 to 516"]
B190 -->|call| B193
B190 -->|after return| B191
B191 -->|call| B175
B191 -->|after return| B192
B194 -->|next| B195
B195 -->|condition true| B198
B195 -->|condition false| B196
B196 -->|call| B183
B196 -->|after return| B197
B197 -->|jump| B195
B199 -->|next| B200
B175["Continue at B176 in section 18"]
B183["Continue at B184 in section 19"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B192

```asm
ACALL DELAY
```

### B193

Return to the instruction following the active call.

```asm
RET
```

### B194

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B195

```asm
PUSH    ACC
```

### B196

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B197

```asm
ACALL    WCHR
```

### B198

```asm
INC DPTR
AJMP    CONT1
```

### B199

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B200

```asm
MOV P0,#01110000B
```

## Section 21

```mermaid
flowchart TD
B200["B201: K1 - lines 517 to 520"]
B201["B202: K2 - lines 522 to 524"]
B202["B203: instructions - lines 525 to 525"]
B203["B204: OVER1 - lines 527 to 530"]
B204["B205: instructions - lines 531 to 534"]
B205["B206: instructions - lines 535 to 538"]
B206["B207: instructions - lines 539 to 542"]
B207["B208: instructions - lines 543 to 543"]
B208["B209: ROW_0 - lines 544 to 545"]
B209["B210: ROW_1 - lines 546 to 547"]
B200 -->|condition true| B200
B200 -->|condition false| B201
B201 -->|condition true| B203
B201 -->|condition false| B202
B202 -->|jump| B201
B203 -->|condition true| B208
B203 -->|condition false| B204
B204 -->|condition true| B209
B204 -->|condition false| B205
B205 -->|condition true| B210
B205 -->|condition false| B206
B206 -->|condition true| B211
B206 -->|condition false| B207
B207 -->|jump| B201
B208 -->|jump| B212
B209 -->|jump| B212
B210["Continue at B211 in section 22"]
B211["Continue at B212 in section 22"]
B212["Continue at B213 in section 22"]
```

### B201

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B202

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B203

```asm
SJMP K2
```

### B204

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B205

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B206

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B207

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B208

```asm
LJMP K2
```

### B209

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B210

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

## Section 22

```mermaid
flowchart TD
B210["B211: ROW_2 - lines 548 to 549"]
B211["B212: ROW_3 - lines 550 to 550"]
B212["B213: FIND - lines 552 to 552"]
B213["B214: FIND1 - lines 554 to 555"]
B214["B215: instructions - lines 556 to 557"]
B215["B216: MATCH - lines 558 to 560"]
B210 -->|jump| B212
B211 -->|next| B212
B212 -->|next| B213
B213 -->|condition true| B215
B213 -->|condition false| B214
B214 -->|jump| B213
```

### B211

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B212

```asm
MOV DPTR,#KCODE3
```

### B213

```asm
RLC A
```

### B214

```asm
RLC A
JNC MATCH
```

### B215

```asm
INC DPTR
SJMP FIND1
```

### B216

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
