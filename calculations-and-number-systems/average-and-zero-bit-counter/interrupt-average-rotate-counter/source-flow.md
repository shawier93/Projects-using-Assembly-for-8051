# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.
- `ORG 0003H` begins at B2.
- `ORG 0030H` begins at B5.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 3"]
B1["B2: REP - lines 5 to 5"]
B2["B3: instructions - lines 6 to 6"]
B3["B4: instructions - lines 7 to 7"]
B4["B5: MAIN - lines 11 to 11"]
B5["B6: instructions - lines 12 to 15"]
B6["B7: instructions - lines 16 to 17"]
B7["B8: instructions - lines 18 to 18"]
B8["B9: instructions - lines 19 to 19"]
B9["B10: instructions - lines 21 to 22"]
B0 -->|jump| B4
B1 -->|call| B161
B1 -->|after return| B2
B2 -->|condition true| B1
B2 -->|condition false| B3
B4 -->|call| B149
B4 -->|after return| B5
B5 -->|call| B143
B5 -->|after return| B6
B6 -->|call| B178
B6 -->|after return| B7
B7 -->|call| B57
B7 -->|after return| B8
B8 -->|call| B57
B8 -->|after return| B9
B9 -->|call| B143
B9 -->|after return| B10
B161["Continue at B162 in section 17"]
B149["Continue at B150 in section 15"]
B143["Continue at B144 in section 15"]
B178["Continue at B179 in section 18"]
B57["Continue at B58 in section 6"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
SJMP MAIN
```

### B2

```asm
ACALL KEYPAD
```

### B3

```asm
CJNE A,#'0',REP
```

### B4

Resume the interrupted program.

```asm
RETI
```

### B5

```asm
ACALL INLCD
```

### B6

```asm
MOV IE,#81H
SETB IT0
MOV A, #80H
ACALL CMD
```

### B7

```asm
MOV DPTR, #STR
ACALL WSTR
```

### B8

```asm
ACALL DELAY
```

### B9

```asm
ACALL DELAY
```

### B10

```asm
MOV A, #80H
ACALL CMD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 23 to 24"]
B11["B12: instructions - lines 25 to 25"]
B12["B13: instructions - lines 26 to 26"]
B13["B14: instructions - lines 28 to 29"]
B14["B15: instructions - lines 30 to 31"]
B15["B16: instructions - lines 32 to 32"]
B16["B17: instructions - lines 33 to 33"]
B17["B18: instructions - lines 35 to 35"]
B18["B19: instructions - lines 36 to 36"]
B19["B20: instructions - lines 37 to 38"]
B10 -->|call| B178
B10 -->|after return| B11
B11 -->|call| B57
B11 -->|after return| B12
B12 -->|call| B57
B12 -->|after return| B13
B13 -->|call| B143
B13 -->|after return| B14
B14 -->|call| B178
B14 -->|after return| B15
B15 -->|call| B57
B15 -->|after return| B16
B16 -->|call| B57
B16 -->|after return| B17
B17 -->|call| B156
B17 -->|after return| B18
B18 -->|call| B57
B18 -->|after return| B19
B19 -->|call| B143
B19 -->|after return| B20
B178["Continue at B179 in section 18"]
B57["Continue at B58 in section 6"]
B143["Continue at B144 in section 15"]
B156["Continue at B157 in section 16"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV DPTR, #NAME
ACALL WSTR
```

### B12

```asm
ACALL DELAY
```

### B13

```asm
ACALL DELAY
```

### B14

```asm
MOV A,#0C0H
ACALL CMD
```

### B15

```asm
MOV DPTR, #ID
ACALL WSTR
```

### B16

```asm
ACALL DELAY
```

### B17

```asm
ACALL DELAY
```

### B18

```asm
ACALL CLEAR
```

### B19

```asm
ACALL DELAY
```

### B20

```asm
MOV A, #80H
ACALL CMD
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 39 to 40"]
B21["B22: instructions - lines 41 to 41"]
B22["B23: instructions - lines 43 to 44"]
B23["B24: MENU - lines 48 to 48"]
B24["B25: instructions - lines 49 to 49"]
B25["B26: instructions - lines 50 to 51"]
B26["B27: instructions - lines 52 to 53"]
B27["B28: instructions - lines 54 to 54"]
B28["B29: instructions - lines 55 to 55"]
B29["B30: instructions - lines 57 to 58"]
B20 -->|call| B178
B20 -->|after return| B21
B21 -->|call| B57
B21 -->|after return| B22
B22 -->|next| B23
B23 -->|call| B156
B23 -->|after return| B24
B24 -->|call| B57
B24 -->|after return| B25
B25 -->|call| B143
B25 -->|after return| B26
B26 -->|call| B178
B26 -->|after return| B27
B27 -->|call| B57
B27 -->|after return| B28
B28 -->|call| B57
B28 -->|after return| B29
B29 -->|call| B143
B29 -->|after return| B30
B178["Continue at B179 in section 18"]
B57["Continue at B58 in section 6"]
B156["Continue at B157 in section 16"]
B143["Continue at B144 in section 15"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV DPTR, #PUSHH
ACALL WSTR
```

### B22

```asm
ACALL DELAY
```

### B23

```asm
CLR P3.6
SETB P3.6
```

### B24

```asm
ACALL CLEAR
```

### B25

```asm
ACALL DELAY
```

### B26

```asm
MOV A, #80H
ACALL CMD
```

### B27

```asm
MOV DPTR, #CHOSE
ACALL WSTR
```

### B28

```asm
ACALL DELAY
```

### B29

```asm
ACALL DELAY
```

### B30

```asm
MOV A, #80H
ACALL CMD
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 59 to 60"]
B31["B32: instructions - lines 61 to 61"]
B32["B33: instructions - lines 62 to 62"]
B33["B34: instructions - lines 64 to 65"]
B34["B35: instructions - lines 66 to 67"]
B35["B36: instructions - lines 68 to 68"]
B36["B37: instructions - lines 69 to 69"]
B37["B38: instructions - lines 74 to 74"]
B38["B39: instructions - lines 75 to 76"]
B39["B40: instructions - lines 77 to 78"]
B30 -->|call| B178
B30 -->|after return| B31
B31 -->|call| B57
B31 -->|after return| B32
B32 -->|call| B57
B32 -->|after return| B33
B33 -->|call| B143
B33 -->|after return| B34
B34 -->|call| B178
B34 -->|after return| B35
B35 -->|call| B57
B35 -->|after return| B36
B36 -->|call| B57
B36 -->|after return| B37
B37 -->|call| B156
B37 -->|after return| B38
B38 -->|call| B143
B38 -->|after return| B39
B39 -->|call| B178
B39 -->|after return| B40
B178["Continue at B179 in section 18"]
B57["Continue at B58 in section 6"]
B143["Continue at B144 in section 15"]
B156["Continue at B157 in section 16"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV DPTR, #MODE1
ACALL WSTR
```

### B32

```asm
ACALL DELAY
```

### B33

```asm
ACALL DELAY
```

### B34

```asm
MOV A,#0C0H
ACALL CMD
```

### B35

```asm
MOV DPTR, #MODE2
ACALL WSTR
```

### B36

```asm
ACALL DELAY
```

### B37

```asm
ACALL DELAY
```

### B38

```asm
ACALL CLEAR
```

### B39

```asm
MOV A, #80H
ACALL CMD
```

### B40

```asm
MOV DPTR, #ENTER
ACALL WSTR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 79 to 79"]
B41["B42: instructions - lines 81 to 82"]
B42["B43: instructions - lines 83 to 83"]
B43["B44: instructions - lines 84 to 84"]
B44["B45: instructions - lines 85 to 89"]
B45["B46: LOOP1 - lines 91 to 91"]
B46["B47: LOOP2 - lines 94 to 94"]
B47["B48: instructions - lines 95 to 95"]
B48["B49: LOOP3 - lines 98 to 98"]
B49["B50: instructions - lines 99 to 99"]
B40 -->|call| B57
B40 -->|after return| B41
B41 -->|call| B143
B41 -->|after return| B42
B42 -->|call| B161
B42 -->|after return| B43
B43 -->|call| B138
B43 -->|after return| B44
B44 -->|condition true| B46
B44 -->|condition false| B45
B45 -->|call| B62
B45 -->|after return| B46
B46 -->|condition true| B48
B46 -->|condition false| B47
B47 -->|call| B100
B47 -->|after return| B48
B48 -->|condition true| B50
B48 -->|condition false| B49
B49 -->|jump| B56
B57["Continue at B58 in section 6"]
B143["Continue at B144 in section 15"]
B161["Continue at B162 in section 17"]
B138["Continue at B139 in section 14"]
B62["Continue at B63 in section 7"]
B100["Continue at B101 in section 11"]
B50["Continue at B51 in section 6"]
B56["Continue at B57 in section 6"]
```

### B41

```asm
ACALL DELAY
```

### B42

```asm
MOV A, #0C0H
ACALL CMD
```

### B43

```asm
ACALL KEYPAD
```

### B44

```asm
ACALL WCHR
```

### B45

```asm
SUBB A,#30H
MOV R7,A
CJNE R7,#1, LOOP2
```

### B46

```asm
ACALL LOOOP1
```

### B47

```asm
CJNE R7,#2,LOOP3
```

### B48

```asm
ACALL LOOOP2
```

### B49

```asm
CJNE A,#3,ERROR
```

### B50

```asm
AJMP FINISH
```

## Section 6

```mermaid
flowchart TD
B50["B51: ERROR - lines 102 to 103"]
B51["B52: instructions - lines 104 to 105"]
B52["B53: instructions - lines 106 to 107"]
B53["B54: instructions - lines 108 to 109"]
B54["B55: instructions - lines 110 to 111"]
B55["B56: instructions - lines 112 to 113"]
B56["B57: FINISH - lines 116 to 116"]
B57["B58: DELAY - lines 122 to 122"]
B58["B59: HE2 - lines 123 to 123"]
B59["B60: HE - lines 124 to 124"]
B50 -->|call| B57
B50 -->|after return| B51
B51 -->|call| B57
B51 -->|after return| B52
B52 -->|call| B57
B52 -->|after return| B53
B53 -->|call| B57
B53 -->|after return| B54
B54 -->|call| B57
B54 -->|after return| B55
B55 -->|call| B57
B55 -->|after return| B56
B56 -->|jump| B56
B57 -->|next| B58
B58 -->|next| B59
B59 -->|condition true| B59
B59 -->|condition false| B60
B60["Continue at B61 in section 7"]
```

### B51

```asm
SETB P1.6
ACALL DELAY
```

### B52

```asm
CLR P1.6
ACALL DELAY
```

### B53

```asm
SETB P1.6
ACALL DELAY
```

### B54

```asm
CLR P1.6
ACALL DELAY
```

### B55

```asm
SETB P1.6
ACALL DELAY
```

### B56

```asm
CLR P1.6
ACALL DELAY
```

### B57

```asm
SJMP FINISH
```

### B58

```asm
MOV R1,#100
```

### B59

```asm
MOV R0,#100
```

### B60

```asm
DJNZ R0,HE
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 125 to 125"]
B61["B62: instructions - lines 126 to 126"]
B62["B63: LOOOP1 - lines 129 to 129"]
B63["B64: instructions - lines 130 to 130"]
B64["B65: instructions - lines 131 to 132"]
B65["B66: instructions - lines 133 to 134"]
B66["B67: instructions - lines 135 to 135"]
B67["B68: instructions - lines 136 to 136"]
B68["B69: instructions - lines 137 to 138"]
B69["B70: instructions - lines 139 to 140"]
B60 -->|condition true| B58
B60 -->|condition false| B61
B62 -->|call| B156
B62 -->|after return| B63
B63 -->|call| B57
B63 -->|after return| B64
B64 -->|call| B143
B64 -->|after return| B65
B65 -->|call| B178
B65 -->|after return| B66
B66 -->|call| B57
B66 -->|after return| B67
B67 -->|call| B57
B67 -->|after return| B68
B68 -->|call| B143
B68 -->|after return| B69
B69 -->|call| B178
B69 -->|after return| B70
B58["Continue at B59 in section 6"]
B156["Continue at B157 in section 16"]
B57["Continue at B58 in section 6"]
B143["Continue at B144 in section 15"]
B178["Continue at B179 in section 18"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
DJNZ R1,HE2
```

### B62

Return to the instruction following the active call.

```asm
RET
```

### B63

```asm
ACALL CLEAR
```

### B64

```asm
ACALL DELAY
```

### B65

```asm
MOV A, #80H
ACALL CMD
```

### B66

```asm
MOV DPTR, #YOUCHOSE
ACALL WSTR
```

### B67

```asm
ACALL DELAY
```

### B68

```asm
ACALL DELAY
```

### B69

```asm
MOV A,#0C0H
ACALL CMD
```

### B70

```asm
MOV DPTR, #AVG
ACALL WSTR
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 141 to 141"]
B71["B72: instructions - lines 142 to 142"]
B72["B73: instructions - lines 144 to 144"]
B73["B74: instructions - lines 145 to 146"]
B74["B75: instructions - lines 147 to 148"]
B75["B76: instructions - lines 149 to 149"]
B76["B77: instructions - lines 150 to 150"]
B77["B78: instructions - lines 151 to 152"]
B78["B79: instructions - lines 153 to 153"]
B79["B80: instructions - lines 154 to 154"]
B70 -->|call| B57
B70 -->|after return| B71
B71 -->|call| B57
B71 -->|after return| B72
B72 -->|call| B156
B72 -->|after return| B73
B73 -->|call| B143
B73 -->|after return| B74
B74 -->|call| B178
B74 -->|after return| B75
B75 -->|call| B57
B75 -->|after return| B76
B76 -->|call| B57
B76 -->|after return| B77
B77 -->|call| B143
B77 -->|after return| B78
B78 -->|call| B161
B78 -->|after return| B79
B79 -->|call| B138
B79 -->|after return| B80
B57["Continue at B58 in section 6"]
B156["Continue at B157 in section 16"]
B143["Continue at B144 in section 15"]
B178["Continue at B179 in section 18"]
B161["Continue at B162 in section 17"]
B138["Continue at B139 in section 14"]
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
ACALL CLEAR
```

### B74

```asm
MOV A,#80H
ACALL CMD
```

### B75

```asm
MOV DPTR, #ENTER
ACALL WSTR
```

### B76

```asm
ACALL DELAY
```

### B77

```asm
ACALL DELAY
```

### B78

```asm
MOV A,#0C0H
ACALL CMD
```

### B79

```asm
ACALL KEYPAD
```

### B80

```asm
ACALL WCHR
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 155 to 160"]
B81["B82: instructions - lines 161 to 161"]
B82["B83: instructions - lines 162 to 167"]
B83["B84: instructions - lines 168 to 169"]
B84["B85: instructions - lines 170 to 172"]
B85["B86: instructions - lines 173 to 180"]
B86["B87: instructions - lines 181 to 181"]
B87["B88: instructions - lines 183 to 183"]
B88["B89: instructions - lines 184 to 184"]
B89["B90: instructions - lines 185 to 186"]
B80 -->|call| B161
B80 -->|after return| B81
B81 -->|call| B138
B81 -->|after return| B82
B82 -->|call| B143
B82 -->|after return| B83
B83 -->|call| B138
B83 -->|after return| B84
B84 -->|call| B138
B84 -->|after return| B85
B85 -->|call| B57
B85 -->|after return| B86
B86 -->|call| B57
B86 -->|after return| B87
B87 -->|call| B156
B87 -->|after return| B88
B88 -->|call| B57
B88 -->|after return| B89
B89 -->|call| B143
B89 -->|after return| B90
B161["Continue at B162 in section 17"]
B138["Continue at B139 in section 14"]
B143["Continue at B144 in section 15"]
B57["Continue at B58 in section 6"]
B156["Continue at B157 in section 16"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV 60H,A
SUBB A,#30H
MOV B,#10
MUL AB
MOV R1,A
ACALL KEYPAD
```

### B82

```asm
ACALL WCHR
```

### B83

```asm
MOV 61H,A
SUBB A,#30H
ADD A,R1
MOV R1,A
MOV A,#0C3H
ACALL CMD
```

### B84

```asm
MOV A,60H
ACALL WCHR
```

### B85

```asm
MOV A,61H
ADD A,#1
ACALL WCHR
```

### B86

```asm
MOV A,R1
ADD A,#1
ADD A,R1
MOV B,#2
DIV AB
MOV 70H,A
ACALL DELAY
```

### B87

```asm
ACALL DELAY
```

### B88

```asm
ACALL CLEAR
```

### B89

```asm
ACALL DELAY
```

### B90

```asm
MOV A, #80H
ACALL CMD
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 187 to 188"]
B91["B92: instructions - lines 189 to 189"]
B92["B93: instructions - lines 190 to 191"]
B93["B94: instructions - lines 192 to 192"]
B94["B95: instructions - lines 193 to 193"]
B95["B96: instructions - lines 196 to 200"]
B96["B97: instructions - lines 201 to 203"]
B97["B98: instructions - lines 204 to 204"]
B98["B99: instructions - lines 206 to 206"]
B99["B100: instructions - lines 207 to 207"]
B90 -->|call| B178
B90 -->|after return| B91
B91 -->|call| B57
B91 -->|after return| B92
B92 -->|call| B143
B92 -->|after return| B93
B93 -->|call| B57
B93 -->|after return| B94
B94 -->|call| B57
B94 -->|after return| B95
B95 -->|call| B138
B95 -->|after return| B96
B96 -->|call| B138
B96 -->|after return| B97
B97 -->|call| B57
B97 -->|after return| B98
B98 -->|jump| B56
B178["Continue at B179 in section 18"]
B57["Continue at B58 in section 6"]
B143["Continue at B144 in section 15"]
B138["Continue at B139 in section 14"]
B56["Continue at B57 in section 6"]
```

### B91

```asm
MOV DPTR, #AVGMSG
ACALL WSTR
```

### B92

```asm
ACALL DELAY
```

### B93

```asm
MOV A,#0C0H
ACALL CMD
```

### B94

```asm
ACALL DELAY
```

### B95

```asm
ACALL DELAY
```

### B96

```asm
MOV A,70H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B97

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B98

```asm
ACALL DELAY
```

### B99

```asm
AJMP FINISH
```

### B100

Return to the instruction following the active call.

```asm
RET
```

## Section 11

```mermaid
flowchart TD
B100["B101: LOOOP2 - lines 210 to 210"]
B101["B102: instructions - lines 211 to 211"]
B102["B103: instructions - lines 212 to 213"]
B103["B104: instructions - lines 214 to 215"]
B104["B105: instructions - lines 216 to 216"]
B105["B106: instructions - lines 217 to 217"]
B106["B107: instructions - lines 218 to 219"]
B107["B108: instructions - lines 220 to 221"]
B108["B109: instructions - lines 222 to 222"]
B109["B110: instructions - lines 223 to 223"]
B100 -->|call| B156
B100 -->|after return| B101
B101 -->|call| B57
B101 -->|after return| B102
B102 -->|call| B143
B102 -->|after return| B103
B103 -->|call| B178
B103 -->|after return| B104
B104 -->|call| B57
B104 -->|after return| B105
B105 -->|call| B57
B105 -->|after return| B106
B106 -->|call| B143
B106 -->|after return| B107
B107 -->|call| B178
B107 -->|after return| B108
B108 -->|call| B57
B108 -->|after return| B109
B109 -->|call| B57
B109 -->|after return| B110
B156["Continue at B157 in section 16"]
B57["Continue at B58 in section 6"]
B143["Continue at B144 in section 15"]
B178["Continue at B179 in section 18"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL CLEAR
```

### B102

```asm
ACALL DELAY
```

### B103

```asm
MOV A, #80H
ACALL CMD
```

### B104

```asm
MOV DPTR, #YOUCHOSE
ACALL WSTR
```

### B105

```asm
ACALL DELAY
```

### B106

```asm
ACALL DELAY
```

### B107

```asm
MOV A,#0C0H
ACALL CMD
```

### B108

```asm
MOV DPTR, #ZZ
ACALL WSTR
```

### B109

```asm
ACALL DELAY
```

### B110

```asm
ACALL DELAY
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 225 to 225"]
B111["B112: instructions - lines 226 to 227"]
B112["B113: instructions - lines 228 to 229"]
B113["B114: instructions - lines 230 to 230"]
B114["B115: instructions - lines 231 to 231"]
B115["B116: instructions - lines 232 to 233"]
B116["B117: instructions - lines 234 to 234"]
B117["B118: instructions - lines 235 to 235"]
B118["B119: instructions - lines 236 to 240"]
B119["B120: instructions - lines 241 to 241"]
B110 -->|call| B156
B110 -->|after return| B111
B111 -->|call| B143
B111 -->|after return| B112
B112 -->|call| B178
B112 -->|after return| B113
B113 -->|call| B57
B113 -->|after return| B114
B114 -->|call| B57
B114 -->|after return| B115
B115 -->|call| B143
B115 -->|after return| B116
B116 -->|call| B161
B116 -->|after return| B117
B117 -->|call| B138
B117 -->|after return| B118
B118 -->|call| B161
B118 -->|after return| B119
B119 -->|call| B138
B119 -->|after return| B120
B156["Continue at B157 in section 16"]
B143["Continue at B144 in section 15"]
B178["Continue at B179 in section 18"]
B57["Continue at B58 in section 6"]
B161["Continue at B162 in section 17"]
B138["Continue at B139 in section 14"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL CLEAR
```

### B112

```asm
MOV A,#80H
ACALL CMD
```

### B113

```asm
MOV DPTR, #ENTER
ACALL WSTR
```

### B114

```asm
ACALL DELAY
```

### B115

```asm
ACALL DELAY
```

### B116

```asm
MOV A,#0C0H
ACALL CMD
```

### B117

```asm
ACALL KEYPAD
```

### B118

```asm
ACALL WCHR
```

### B119

```asm
SUBB A,#30H
MOV B,#16
MUL AB
MOV R1,A
ACALL KEYPAD
```

### B120

```asm
ACALL WCHR
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 242 to 250"]
B121["B122: X8 - lines 252 to 253"]
B122["B123: instructions - lines 254 to 254"]
B123["B124: instructions - lines 255 to 255"]
B124["B125: ZEROS - lines 257 to 258"]
B125["B126: DISP - lines 263 to 263"]
B126["B127: instructions - lines 264 to 264"]
B127["B128: instructions - lines 265 to 266"]
B128["B129: instructions - lines 267 to 268"]
B129["B130: instructions - lines 269 to 269"]
B120 -->|next| B121
B121 -->|condition true| B124
B121 -->|condition false| B122
B122 -->|condition true| B121
B122 -->|condition false| B123
B123 -->|jump| B125
B124 -->|condition true| B121
B124 -->|condition false| B125
B125 -->|call| B156
B125 -->|after return| B126
B126 -->|call| B57
B126 -->|after return| B127
B127 -->|call| B143
B127 -->|after return| B128
B128 -->|call| B178
B128 -->|after return| B129
B129 -->|call| B57
B129 -->|after return| B130
B156["Continue at B157 in section 16"]
B57["Continue at B58 in section 6"]
B143["Continue at B144 in section 15"]
B178["Continue at B179 in section 18"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
SUBB A,#30H
ADD A,R1
MOV R1,A
MOV 72H,A
MOV R4,#8
MOV 20H,#0
CLR A
MOV A,72H
```

### B122

```asm
RLC A
JNC ZEROS
```

### B123

```asm
DJNZ R4,X8
```

### B124

```asm
SJMP DISP
```

### B125

```asm
INC 20H
DJNZ R4,X8
```

### B126

```asm
ACALL CLEAR
```

### B127

```asm
ACALL DELAY
```

### B128

```asm
MOV A, #80H
ACALL CMD
```

### B129

```asm
MOV DPTR, #ZZMSG
ACALL WSTR
```

### B130

```asm
ACALL DELAY
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 270 to 270"]
B131["B132: instructions - lines 271 to 272"]
B132["B133: instructions - lines 274 to 274"]
B133["B134: instructions - lines 275 to 275"]
B134["B135: instructions - lines 277 to 279"]
B135["B136: instructions - lines 280 to 280"]
B136["B137: instructions - lines 281 to 281"]
B137["B138: instructions - lines 282 to 282"]
B138["B139: WCHR - lines 285 to 289"]
B139["B140: instructions - lines 290 to 290"]
B130 -->|call| B57
B130 -->|after return| B131
B131 -->|call| B143
B131 -->|after return| B132
B132 -->|call| B57
B132 -->|after return| B133
B133 -->|call| B57
B133 -->|after return| B134
B134 -->|call| B138
B134 -->|after return| B135
B135 -->|call| B57
B135 -->|after return| B136
B136 -->|jump| B56
B138 -->|call| B148
B138 -->|after return| B139
B139 -->|call| B154
B139 -->|after return| B140
B57["Continue at B58 in section 6"]
B143["Continue at B144 in section 15"]
B56["Continue at B57 in section 6"]
B148["Continue at B149 in section 15"]
B154["Continue at B155 in section 16"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
ACALL DELAY
```

### B132

```asm
MOV A,#0C0H
ACALL CMD
```

### B133

```asm
ACALL DELAY
```

### B134

```asm
ACALL DELAY
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
AJMP FINISH
```

### B138

Return to the instruction following the active call.

```asm
RET
```

### B139

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B140

```asm
ACALL LDELAY
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 291 to 293"]
B141["B142: instructions - lines 294 to 294"]
B142["B143: instructions - lines 295 to 297"]
B143["B144: CMD - lines 300 to 302"]
B144["B145: instructions - lines 303 to 303"]
B145["B146: instructions - lines 304 to 306"]
B146["B147: instructions - lines 307 to 307"]
B147["B148: instructions - lines 308 to 308"]
B148["B149: COMMON - lines 311 to 316"]
B149["B150: INLCD - lines 319 to 326"]
B140 -->|call| B148
B140 -->|after return| B141
B141 -->|call| B154
B141 -->|after return| B142
B143 -->|call| B148
B143 -->|after return| B144
B144 -->|call| B154
B144 -->|after return| B145
B145 -->|call| B148
B145 -->|after return| B146
B146 -->|call| B154
B146 -->|after return| B147
B149 -->|call| B154
B149 -->|after return| B150
B154["Continue at B155 in section 16"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B142

```asm
ACALL LDELAY
```

### B143

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B144

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B145

```asm
ACALL LDELAY
```

### B146

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B147

```asm
ACALL LDELAY
```

### B148

Return to the instruction following the active call.

```asm
RET
```

### B149

Return to the instruction following the active call.

```asm
ANL A,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B150

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

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 327 to 335"]
B151["B152: instructions - lines 336 to 348"]
B152["B153: instructions - lines 349 to 359"]
B153["B154: instructions - lines 360 to 360"]
B154["B155: LDELAY - lines 363 to 364"]
B155["B156: instructions - lines 365 to 365"]
B156["B157: CLEAR - lines 368 to 369"]
B157["B158: instructions - lines 370 to 370"]
B158["B159: WAIT - lines 371 to 371"]
B159["B160: instructions - lines 372 to 372"]
B150 -->|call| B154
B150 -->|after return| B151
B151 -->|call| B154
B151 -->|after return| B152
B152 -->|call| B154
B152 -->|after return| B153
B154 -->|condition true| B154
B154 -->|condition false| B155
B156 -->|call| B143
B156 -->|after return| B157
B157 -->|next| B158
B158 -->|call| B154
B158 -->|after return| B159
B159 -->|condition true| B158
B159 -->|condition false| B160
B143["Continue at B144 in section 15"]
B160["Continue at B161 in section 17"]
```

### B151

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

### B152

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

### B153

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

### B154

Return to the instruction following the active call.

```asm
RET
```

### B155

```asm
MOV R0, #50
DJNZ R0, $
```

### B156

Return to the instruction following the active call.

```asm
RET
```

### B157

```asm
MOV A,#01H
ACALL CMD
```

### B158

```asm
MOV R7,#14
```

### B159

```asm
ACALL LDELAY
```

### B160

```asm
DJNZ R7,WAIT
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 373 to 373"]
B161["B162: KEYPAD - lines 376 to 376"]
B162["B163: K1 - lines 377 to 380"]
B163["B164: K2 - lines 382 to 384"]
B164["B165: instructions - lines 385 to 385"]
B165["B166: OVER1 - lines 387 to 390"]
B166["B167: instructions - lines 391 to 394"]
B167["B168: instructions - lines 395 to 398"]
B168["B169: instructions - lines 399 to 402"]
B169["B170: instructions - lines 403 to 403"]
B161 -->|next| B162
B162 -->|condition true| B162
B162 -->|condition false| B163
B163 -->|condition true| B165
B163 -->|condition false| B164
B164 -->|jump| B163
B165 -->|condition true| B170
B165 -->|condition false| B166
B166 -->|condition true| B171
B166 -->|condition false| B167
B167 -->|condition true| B172
B167 -->|condition false| B168
B168 -->|condition true| B173
B168 -->|condition false| B169
B169 -->|jump| B163
B170["Continue at B171 in section 18"]
B171["Continue at B172 in section 18"]
B172["Continue at B173 in section 18"]
B173["Continue at B174 in section 18"]
```

### B161

Return to the instruction following the active call.

```asm
RET
```

### B162

```asm
MOV P0,#01110000B
```

### B163

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B164

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B165

```asm
SJMP K2
```

### B166

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B167

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B168

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B169

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B170

```asm
LJMP K2
```

## Section 18

```mermaid
flowchart TD
B170["B171: ROW_0 - lines 404 to 405"]
B171["B172: ROW_1 - lines 406 to 407"]
B172["B173: ROW_2 - lines 408 to 409"]
B173["B174: ROW_3 - lines 410 to 410"]
B174["B175: FIND - lines 412 to 412"]
B175["B176: FIND1 - lines 414 to 415"]
B176["B177: instructions - lines 416 to 417"]
B177["B178: MATCH - lines 418 to 420"]
B178["B179: WSTR - lines 430 to 430"]
B179["B180: CONT1 - lines 432 to 434"]
B170 -->|jump| B174
B171 -->|jump| B174
B172 -->|jump| B174
B173 -->|next| B174
B174 -->|next| B175
B175 -->|condition true| B177
B175 -->|condition false| B176
B176 -->|jump| B175
B178 -->|next| B179
B179 -->|condition true| B182
B179 -->|condition false| B180
B182["Continue at B183 in section 19"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B172

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B173

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B174

```asm
MOV DPTR,#KCODE3
```

### B175

```asm
RLC A
```

### B176

```asm
RLC A
JNC MATCH
```

### B177

```asm
INC DPTR
SJMP FIND1
```

### B178

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B179

```asm
PUSH    ACC
```

### B180

```asm
CLR     A
MOVC    A,@A+DPTR
JZ EXIT1
```

## Section 19

```mermaid
flowchart TD
B180["B181: PRINT - lines 436 to 436"]
B181["B182: instructions - lines 437 to 438"]
B182["B183: EXIT1 - lines 439 to 440"]
B180 -->|call| B138
B180 -->|after return| B181
B181 -->|jump| B179
B138["Continue at B139 in section 14"]
B179["Continue at B180 in section 18"]
```

### B181

```asm
ACALL    WCHR
```

### B182

```asm
INC DPTR
AJMP    CONT1
```

### B183

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
