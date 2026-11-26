# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 3"]
B1["B2: instructions - lines 5 to 6"]
B2["B3: instructions - lines 7 to 8"]
B3["B4: instructions - lines 9 to 9"]
B4["B5: instructions - lines 10 to 10"]
B5["B6: instructions - lines 12 to 13"]
B6["B7: instructions - lines 14 to 15"]
B7["B8: instructions - lines 16 to 16"]
B8["B9: instructions - lines 17 to 17"]
B9["B10: instructions - lines 19 to 20"]
B0 -->|call| B139
B0 -->|after return| B1
B1 -->|call| B133
B1 -->|after return| B2
B2 -->|call| B168
B2 -->|after return| B3
B3 -->|call| B47
B3 -->|after return| B4
B4 -->|call| B47
B4 -->|after return| B5
B5 -->|call| B133
B5 -->|after return| B6
B6 -->|call| B168
B6 -->|after return| B7
B7 -->|call| B47
B7 -->|after return| B8
B8 -->|call| B47
B8 -->|after return| B9
B9 -->|call| B133
B9 -->|after return| B10
B139["Continue at B140 in section 14"]
B133["Continue at B134 in section 14"]
B168["Continue at B169 in section 17"]
B47["Continue at B48 in section 5"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV A, #80H
ACALL CMD
```

### B3

```asm
MOV DPTR, #STR
ACALL WSTR
```

### B4

```asm
ACALL DELAY
```

### B5

```asm
ACALL DELAY
```

### B6

```asm
MOV A, #80H
ACALL CMD
```

### B7

```asm
MOV DPTR, #NAME
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
MOV A,#0C0H
ACALL CMD
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 21 to 22"]
B11["B12: instructions - lines 23 to 23"]
B12["B13: instructions - lines 24 to 24"]
B13["B14: MENU - lines 29 to 29"]
B14["B15: instructions - lines 30 to 30"]
B15["B16: instructions - lines 31 to 32"]
B16["B17: instructions - lines 33 to 34"]
B17["B18: instructions - lines 35 to 35"]
B18["B19: instructions - lines 36 to 36"]
B19["B20: instructions - lines 38 to 39"]
B10 -->|call| B168
B10 -->|after return| B11
B11 -->|call| B47
B11 -->|after return| B12
B12 -->|call| B47
B12 -->|after return| B13
B13 -->|call| B146
B13 -->|after return| B14
B14 -->|call| B47
B14 -->|after return| B15
B15 -->|call| B133
B15 -->|after return| B16
B16 -->|call| B168
B16 -->|after return| B17
B17 -->|call| B47
B17 -->|after return| B18
B18 -->|call| B47
B18 -->|after return| B19
B19 -->|call| B133
B19 -->|after return| B20
B168["Continue at B169 in section 17"]
B47["Continue at B48 in section 5"]
B146["Continue at B147 in section 15"]
B133["Continue at B134 in section 14"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV DPTR, #ID
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
ACALL CLEAR
```

### B15

```asm
ACALL DELAY
```

### B16

```asm
MOV A, #80H
ACALL CMD
```

### B17

```asm
MOV DPTR, #CHOSE
ACALL WSTR
```

### B18

```asm
ACALL DELAY
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
B20["B21: instructions - lines 40 to 41"]
B21["B22: instructions - lines 42 to 42"]
B22["B23: instructions - lines 43 to 43"]
B23["B24: instructions - lines 45 to 46"]
B24["B25: instructions - lines 47 to 48"]
B25["B26: instructions - lines 49 to 49"]
B26["B27: instructions - lines 50 to 50"]
B27["B28: instructions - lines 55 to 55"]
B28["B29: instructions - lines 56 to 57"]
B29["B30: instructions - lines 58 to 59"]
B20 -->|call| B168
B20 -->|after return| B21
B21 -->|call| B47
B21 -->|after return| B22
B22 -->|call| B47
B22 -->|after return| B23
B23 -->|call| B133
B23 -->|after return| B24
B24 -->|call| B168
B24 -->|after return| B25
B25 -->|call| B47
B25 -->|after return| B26
B26 -->|call| B47
B26 -->|after return| B27
B27 -->|call| B146
B27 -->|after return| B28
B28 -->|call| B133
B28 -->|after return| B29
B29 -->|call| B168
B29 -->|after return| B30
B168["Continue at B169 in section 17"]
B47["Continue at B48 in section 5"]
B133["Continue at B134 in section 14"]
B146["Continue at B147 in section 15"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV DPTR, #MODE1
ACALL WSTR
```

### B22

```asm
ACALL DELAY
```

### B23

```asm
ACALL DELAY
```

### B24

```asm
MOV A,#0C0H
ACALL CMD
```

### B25

```asm
MOV DPTR, #MODE2
ACALL WSTR
```

### B26

```asm
ACALL DELAY
```

### B27

```asm
ACALL DELAY
```

### B28

```asm
ACALL CLEAR
```

### B29

```asm
MOV A, #80H
ACALL CMD
```

### B30

```asm
MOV DPTR, #ENTER
ACALL WSTR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 60 to 60"]
B31["B32: instructions - lines 62 to 63"]
B32["B33: instructions - lines 64 to 64"]
B33["B34: instructions - lines 65 to 65"]
B34["B35: instructions - lines 66 to 70"]
B35["B36: LOOP1 - lines 72 to 72"]
B36["B37: LOOP2 - lines 75 to 75"]
B37["B38: instructions - lines 76 to 76"]
B38["B39: LOOP3 - lines 79 to 79"]
B39["B40: instructions - lines 80 to 80"]
B30 -->|call| B47
B30 -->|after return| B31
B31 -->|call| B133
B31 -->|after return| B32
B32 -->|call| B151
B32 -->|after return| B33
B33 -->|call| B128
B33 -->|after return| B34
B34 -->|condition true| B36
B34 -->|condition false| B35
B35 -->|call| B52
B35 -->|after return| B36
B36 -->|condition true| B38
B36 -->|condition false| B37
B37 -->|call| B90
B37 -->|after return| B38
B38 -->|condition true| B40
B38 -->|condition false| B39
B39 -->|jump| B46
B47["Continue at B48 in section 5"]
B133["Continue at B134 in section 14"]
B151["Continue at B152 in section 16"]
B128["Continue at B129 in section 13"]
B52["Continue at B53 in section 6"]
B90["Continue at B91 in section 10"]
B40["Continue at B41 in section 5"]
B46["Continue at B47 in section 5"]
```

### B31

```asm
ACALL DELAY
```

### B32

```asm
MOV A, #0C0H
ACALL CMD
```

### B33

```asm
ACALL KEYPAD
```

### B34

```asm
ACALL WCHR
```

### B35

```asm
SUBB A,#30H
MOV R7,A
CJNE R7,#1, LOOP2
```

### B36

```asm
ACALL LOOOP1
```

### B37

```asm
CJNE R7,#2,LOOP3
```

### B38

```asm
ACALL LOOOP2
```

### B39

```asm
CJNE A,#3,ERROR
```

### B40

```asm
AJMP FINISH
```

## Section 5

```mermaid
flowchart TD
B40["B41: ERROR - lines 83 to 84"]
B41["B42: instructions - lines 85 to 86"]
B42["B43: instructions - lines 87 to 88"]
B43["B44: instructions - lines 89 to 90"]
B44["B45: instructions - lines 91 to 92"]
B45["B46: instructions - lines 93 to 94"]
B46["B47: FINISH - lines 97 to 97"]
B47["B48: DELAY - lines 103 to 103"]
B48["B49: HE2 - lines 104 to 104"]
B49["B50: HE - lines 105 to 105"]
B40 -->|call| B47
B40 -->|after return| B41
B41 -->|call| B47
B41 -->|after return| B42
B42 -->|call| B47
B42 -->|after return| B43
B43 -->|call| B47
B43 -->|after return| B44
B44 -->|call| B47
B44 -->|after return| B45
B45 -->|call| B47
B45 -->|after return| B46
B46 -->|jump| B46
B47 -->|next| B48
B48 -->|next| B49
B49 -->|condition true| B49
B49 -->|condition false| B50
B50["Continue at B51 in section 6"]
```

### B41

```asm
SETB P1.6
ACALL DELAY
```

### B42

```asm
CLR P1.6
ACALL DELAY
```

### B43

```asm
SETB P1.6
ACALL DELAY
```

### B44

```asm
CLR P1.6
ACALL DELAY
```

### B45

```asm
SETB P1.6
ACALL DELAY
```

### B46

```asm
CLR P1.6
ACALL DELAY
```

### B47

```asm
SJMP FINISH
```

### B48

```asm
MOV R1,#100
```

### B49

```asm
MOV R0,#100
```

### B50

```asm
DJNZ R0,HE
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 106 to 106"]
B51["B52: instructions - lines 107 to 107"]
B52["B53: LOOOP1 - lines 110 to 110"]
B53["B54: instructions - lines 111 to 111"]
B54["B55: instructions - lines 112 to 113"]
B55["B56: instructions - lines 114 to 115"]
B56["B57: instructions - lines 116 to 116"]
B57["B58: instructions - lines 117 to 117"]
B58["B59: instructions - lines 118 to 119"]
B59["B60: instructions - lines 120 to 121"]
B50 -->|condition true| B48
B50 -->|condition false| B51
B52 -->|call| B146
B52 -->|after return| B53
B53 -->|call| B47
B53 -->|after return| B54
B54 -->|call| B133
B54 -->|after return| B55
B55 -->|call| B168
B55 -->|after return| B56
B56 -->|call| B47
B56 -->|after return| B57
B57 -->|call| B47
B57 -->|after return| B58
B58 -->|call| B133
B58 -->|after return| B59
B59 -->|call| B168
B59 -->|after return| B60
B48["Continue at B49 in section 5"]
B146["Continue at B147 in section 15"]
B47["Continue at B48 in section 5"]
B133["Continue at B134 in section 14"]
B168["Continue at B169 in section 17"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
DJNZ R1,HE2
```

### B52

Return to the instruction following the active call.

```asm
RET
```

### B53

```asm
ACALL CLEAR
```

### B54

```asm
ACALL DELAY
```

### B55

```asm
MOV A, #80H
ACALL CMD
```

### B56

```asm
MOV DPTR, #YOUCHOSE
ACALL WSTR
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
MOV A,#0C0H
ACALL CMD
```

### B60

```asm
MOV DPTR, #AVG
ACALL WSTR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 122 to 122"]
B61["B62: instructions - lines 123 to 123"]
B62["B63: instructions - lines 125 to 125"]
B63["B64: instructions - lines 126 to 127"]
B64["B65: instructions - lines 128 to 129"]
B65["B66: instructions - lines 130 to 130"]
B66["B67: instructions - lines 131 to 131"]
B67["B68: instructions - lines 132 to 133"]
B68["B69: instructions - lines 134 to 134"]
B69["B70: instructions - lines 135 to 135"]
B60 -->|call| B47
B60 -->|after return| B61
B61 -->|call| B47
B61 -->|after return| B62
B62 -->|call| B146
B62 -->|after return| B63
B63 -->|call| B133
B63 -->|after return| B64
B64 -->|call| B168
B64 -->|after return| B65
B65 -->|call| B47
B65 -->|after return| B66
B66 -->|call| B47
B66 -->|after return| B67
B67 -->|call| B133
B67 -->|after return| B68
B68 -->|call| B151
B68 -->|after return| B69
B69 -->|call| B128
B69 -->|after return| B70
B47["Continue at B48 in section 5"]
B146["Continue at B147 in section 15"]
B133["Continue at B134 in section 14"]
B168["Continue at B169 in section 17"]
B151["Continue at B152 in section 16"]
B128["Continue at B129 in section 13"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL DELAY
```

### B62

```asm
ACALL DELAY
```

### B63

```asm
ACALL CLEAR
```

### B64

```asm
MOV A,#80H
ACALL CMD
```

### B65

```asm
MOV DPTR, #ENTER
ACALL WSTR
```

### B66

```asm
ACALL DELAY
```

### B67

```asm
ACALL DELAY
```

### B68

```asm
MOV A,#0C0H
ACALL CMD
```

### B69

```asm
ACALL KEYPAD
```

### B70

```asm
ACALL WCHR
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 136 to 141"]
B71["B72: instructions - lines 142 to 142"]
B72["B73: instructions - lines 143 to 148"]
B73["B74: instructions - lines 149 to 150"]
B74["B75: instructions - lines 151 to 153"]
B75["B76: instructions - lines 154 to 161"]
B76["B77: instructions - lines 162 to 162"]
B77["B78: instructions - lines 164 to 164"]
B78["B79: instructions - lines 165 to 165"]
B79["B80: instructions - lines 166 to 167"]
B70 -->|call| B151
B70 -->|after return| B71
B71 -->|call| B128
B71 -->|after return| B72
B72 -->|call| B133
B72 -->|after return| B73
B73 -->|call| B128
B73 -->|after return| B74
B74 -->|call| B128
B74 -->|after return| B75
B75 -->|call| B47
B75 -->|after return| B76
B76 -->|call| B47
B76 -->|after return| B77
B77 -->|call| B146
B77 -->|after return| B78
B78 -->|call| B47
B78 -->|after return| B79
B79 -->|call| B133
B79 -->|after return| B80
B151["Continue at B152 in section 16"]
B128["Continue at B129 in section 13"]
B133["Continue at B134 in section 14"]
B47["Continue at B48 in section 5"]
B146["Continue at B147 in section 15"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV 60H,A
SUBB A,#30H
MOV B,#10
MUL AB
MOV R1,A
ACALL KEYPAD
```

### B72

```asm
ACALL WCHR
```

### B73

```asm
MOV 61H,A
SUBB A,#30H
ADD A,R1
MOV R1,A
MOV A,#0C3H
ACALL CMD
```

### B74

```asm
MOV A,60H
ACALL WCHR
```

### B75

```asm
MOV A,61H
ADD A,#1
ACALL WCHR
```

### B76

```asm
MOV A,R1
ADD A,#1
ADD A,R1
MOV B,#2
DIV AB
MOV 70H,A
ACALL DELAY
```

### B77

```asm
ACALL DELAY
```

### B78

```asm
ACALL CLEAR
```

### B79

```asm
ACALL DELAY
```

### B80

```asm
MOV A, #80H
ACALL CMD
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 168 to 169"]
B81["B82: instructions - lines 170 to 170"]
B82["B83: instructions - lines 171 to 172"]
B83["B84: instructions - lines 173 to 173"]
B84["B85: instructions - lines 174 to 174"]
B85["B86: instructions - lines 177 to 181"]
B86["B87: instructions - lines 182 to 184"]
B87["B88: instructions - lines 185 to 185"]
B88["B89: instructions - lines 187 to 187"]
B89["B90: instructions - lines 188 to 188"]
B80 -->|call| B168
B80 -->|after return| B81
B81 -->|call| B47
B81 -->|after return| B82
B82 -->|call| B133
B82 -->|after return| B83
B83 -->|call| B47
B83 -->|after return| B84
B84 -->|call| B47
B84 -->|after return| B85
B85 -->|call| B128
B85 -->|after return| B86
B86 -->|call| B128
B86 -->|after return| B87
B87 -->|call| B47
B87 -->|after return| B88
B88 -->|jump| B46
B168["Continue at B169 in section 17"]
B47["Continue at B48 in section 5"]
B133["Continue at B134 in section 14"]
B128["Continue at B129 in section 13"]
B46["Continue at B47 in section 5"]
```

### B81

```asm
MOV DPTR, #AVGMSG
ACALL WSTR
```

### B82

```asm
ACALL DELAY
```

### B83

```asm
MOV A,#0C0H
ACALL CMD
```

### B84

```asm
ACALL DELAY
```

### B85

```asm
ACALL DELAY
```

### B86

```asm
MOV A,70H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B87

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B88

```asm
ACALL DELAY
```

### B89

```asm
AJMP FINISH
```

### B90

Return to the instruction following the active call.

```asm
RET
```

## Section 10

```mermaid
flowchart TD
B90["B91: LOOOP2 - lines 191 to 191"]
B91["B92: instructions - lines 192 to 192"]
B92["B93: instructions - lines 193 to 194"]
B93["B94: instructions - lines 195 to 196"]
B94["B95: instructions - lines 197 to 197"]
B95["B96: instructions - lines 198 to 198"]
B96["B97: instructions - lines 199 to 200"]
B97["B98: instructions - lines 201 to 202"]
B98["B99: instructions - lines 203 to 203"]
B99["B100: instructions - lines 204 to 204"]
B90 -->|call| B146
B90 -->|after return| B91
B91 -->|call| B47
B91 -->|after return| B92
B92 -->|call| B133
B92 -->|after return| B93
B93 -->|call| B168
B93 -->|after return| B94
B94 -->|call| B47
B94 -->|after return| B95
B95 -->|call| B47
B95 -->|after return| B96
B96 -->|call| B133
B96 -->|after return| B97
B97 -->|call| B168
B97 -->|after return| B98
B98 -->|call| B47
B98 -->|after return| B99
B99 -->|call| B47
B99 -->|after return| B100
B146["Continue at B147 in section 15"]
B47["Continue at B48 in section 5"]
B133["Continue at B134 in section 14"]
B168["Continue at B169 in section 17"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL CLEAR
```

### B92

```asm
ACALL DELAY
```

### B93

```asm
MOV A, #80H
ACALL CMD
```

### B94

```asm
MOV DPTR, #YOUCHOSE
ACALL WSTR
```

### B95

```asm
ACALL DELAY
```

### B96

```asm
ACALL DELAY
```

### B97

```asm
MOV A,#0C0H
ACALL CMD
```

### B98

```asm
MOV DPTR, #ZZ
ACALL WSTR
```

### B99

```asm
ACALL DELAY
```

### B100

```asm
ACALL DELAY
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 206 to 206"]
B101["B102: instructions - lines 207 to 208"]
B102["B103: instructions - lines 209 to 210"]
B103["B104: instructions - lines 211 to 211"]
B104["B105: instructions - lines 212 to 212"]
B105["B106: instructions - lines 213 to 214"]
B106["B107: instructions - lines 215 to 215"]
B107["B108: instructions - lines 216 to 216"]
B108["B109: instructions - lines 217 to 221"]
B109["B110: instructions - lines 222 to 222"]
B100 -->|call| B146
B100 -->|after return| B101
B101 -->|call| B133
B101 -->|after return| B102
B102 -->|call| B168
B102 -->|after return| B103
B103 -->|call| B47
B103 -->|after return| B104
B104 -->|call| B47
B104 -->|after return| B105
B105 -->|call| B133
B105 -->|after return| B106
B106 -->|call| B151
B106 -->|after return| B107
B107 -->|call| B128
B107 -->|after return| B108
B108 -->|call| B151
B108 -->|after return| B109
B109 -->|call| B128
B109 -->|after return| B110
B146["Continue at B147 in section 15"]
B133["Continue at B134 in section 14"]
B168["Continue at B169 in section 17"]
B47["Continue at B48 in section 5"]
B151["Continue at B152 in section 16"]
B128["Continue at B129 in section 13"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL CLEAR
```

### B102

```asm
MOV A,#80H
ACALL CMD
```

### B103

```asm
MOV DPTR, #ENTER
ACALL WSTR
```

### B104

```asm
ACALL DELAY
```

### B105

```asm
ACALL DELAY
```

### B106

```asm
MOV A,#0C0H
ACALL CMD
```

### B107

```asm
ACALL KEYPAD
```

### B108

```asm
ACALL WCHR
```

### B109

```asm
SUBB A,#30H
MOV B,#10
MUL AB
MOV R1,A
ACALL KEYPAD
```

### B110

```asm
ACALL WCHR
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 223 to 231"]
B111["B112: X8 - lines 233 to 234"]
B112["B113: instructions - lines 235 to 235"]
B113["B114: instructions - lines 236 to 236"]
B114["B115: ZEROS - lines 238 to 239"]
B115["B116: DISP - lines 244 to 244"]
B116["B117: instructions - lines 245 to 245"]
B117["B118: instructions - lines 246 to 247"]
B118["B119: instructions - lines 248 to 249"]
B119["B120: instructions - lines 250 to 250"]
B110 -->|next| B111
B111 -->|condition true| B114
B111 -->|condition false| B112
B112 -->|condition true| B111
B112 -->|condition false| B113
B113 -->|jump| B115
B114 -->|condition true| B111
B114 -->|condition false| B115
B115 -->|call| B146
B115 -->|after return| B116
B116 -->|call| B47
B116 -->|after return| B117
B117 -->|call| B133
B117 -->|after return| B118
B118 -->|call| B168
B118 -->|after return| B119
B119 -->|call| B47
B119 -->|after return| B120
B146["Continue at B147 in section 15"]
B47["Continue at B48 in section 5"]
B133["Continue at B134 in section 14"]
B168["Continue at B169 in section 17"]
B120["Continue at B121 in section 13"]
```

### B111

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

### B112

```asm
RLC A
JNC ZEROS
```

### B113

```asm
DJNZ R4,X8
```

### B114

```asm
SJMP DISP
```

### B115

```asm
INC 20H
DJNZ R4,X8
```

### B116

```asm
ACALL CLEAR
```

### B117

```asm
ACALL DELAY
```

### B118

```asm
MOV A, #80H
ACALL CMD
```

### B119

```asm
MOV DPTR, #ZZMSG
ACALL WSTR
```

### B120

```asm
ACALL DELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 251 to 251"]
B121["B122: instructions - lines 252 to 253"]
B122["B123: instructions - lines 255 to 255"]
B123["B124: instructions - lines 256 to 256"]
B124["B125: instructions - lines 258 to 260"]
B125["B126: instructions - lines 261 to 261"]
B126["B127: instructions - lines 262 to 262"]
B127["B128: instructions - lines 263 to 263"]
B128["B129: WCHR - lines 266 to 270"]
B129["B130: instructions - lines 271 to 271"]
B120 -->|call| B47
B120 -->|after return| B121
B121 -->|call| B133
B121 -->|after return| B122
B122 -->|call| B47
B122 -->|after return| B123
B123 -->|call| B47
B123 -->|after return| B124
B124 -->|call| B128
B124 -->|after return| B125
B125 -->|call| B47
B125 -->|after return| B126
B126 -->|jump| B46
B128 -->|call| B138
B128 -->|after return| B129
B129 -->|call| B144
B129 -->|after return| B130
B47["Continue at B48 in section 5"]
B133["Continue at B134 in section 14"]
B46["Continue at B47 in section 5"]
B138["Continue at B139 in section 14"]
B144["Continue at B145 in section 15"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
ACALL DELAY
```

### B122

```asm
MOV A,#0C0H
ACALL CMD
```

### B123

```asm
ACALL DELAY
```

### B124

```asm
ACALL DELAY
```

### B125

```asm
MOV A,20H
ADD A,#30H
ACALL WCHR
```

### B126

```asm
ACALL DELAY
```

### B127

```asm
AJMP FINISH
```

### B128

Return to the instruction following the active call.

```asm
RET
```

### B129

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B130

```asm
ACALL LDELAY
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 272 to 274"]
B131["B132: instructions - lines 275 to 275"]
B132["B133: instructions - lines 276 to 278"]
B133["B134: CMD - lines 281 to 283"]
B134["B135: instructions - lines 284 to 284"]
B135["B136: instructions - lines 285 to 287"]
B136["B137: instructions - lines 288 to 288"]
B137["B138: instructions - lines 289 to 289"]
B138["B139: COMMON - lines 292 to 297"]
B139["B140: INLCD - lines 300 to 307"]
B130 -->|call| B138
B130 -->|after return| B131
B131 -->|call| B144
B131 -->|after return| B132
B133 -->|call| B138
B133 -->|after return| B134
B134 -->|call| B144
B134 -->|after return| B135
B135 -->|call| B138
B135 -->|after return| B136
B136 -->|call| B144
B136 -->|after return| B137
B139 -->|call| B144
B139 -->|after return| B140
B144["Continue at B145 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B132

```asm
ACALL LDELAY
```

### B133

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B134

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B135

```asm
ACALL LDELAY
```

### B136

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B137

```asm
ACALL LDELAY
```

### B138

Return to the instruction following the active call.

```asm
RET
```

### B139

Return to the instruction following the active call.

```asm
ANL A,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B140

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

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 308 to 316"]
B141["B142: instructions - lines 317 to 329"]
B142["B143: instructions - lines 330 to 340"]
B143["B144: instructions - lines 341 to 341"]
B144["B145: LDELAY - lines 344 to 345"]
B145["B146: instructions - lines 346 to 346"]
B146["B147: CLEAR - lines 349 to 350"]
B147["B148: instructions - lines 351 to 351"]
B148["B149: WAIT - lines 352 to 352"]
B149["B150: instructions - lines 353 to 353"]
B140 -->|call| B144
B140 -->|after return| B141
B141 -->|call| B144
B141 -->|after return| B142
B142 -->|call| B144
B142 -->|after return| B143
B144 -->|condition true| B144
B144 -->|condition false| B145
B146 -->|call| B133
B146 -->|after return| B147
B147 -->|next| B148
B148 -->|call| B144
B148 -->|after return| B149
B149 -->|condition true| B148
B149 -->|condition false| B150
B133["Continue at B134 in section 14"]
B150["Continue at B151 in section 16"]
```

### B141

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

### B142

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

### B143

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

### B144

Return to the instruction following the active call.

```asm
RET
```

### B145

```asm
MOV R0, #50
DJNZ R0, $
```

### B146

Return to the instruction following the active call.

```asm
RET
```

### B147

```asm
MOV A,#01H
ACALL CMD
```

### B148

```asm
MOV R7,#14
```

### B149

```asm
ACALL LDELAY
```

### B150

```asm
DJNZ R7,WAIT
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 354 to 354"]
B151["B152: KEYPAD - lines 357 to 357"]
B152["B153: K1 - lines 358 to 361"]
B153["B154: K2 - lines 363 to 365"]
B154["B155: instructions - lines 366 to 366"]
B155["B156: OVER1 - lines 368 to 371"]
B156["B157: instructions - lines 372 to 375"]
B157["B158: instructions - lines 376 to 379"]
B158["B159: instructions - lines 380 to 383"]
B159["B160: instructions - lines 384 to 384"]
B151 -->|next| B152
B152 -->|condition true| B152
B152 -->|condition false| B153
B153 -->|condition true| B155
B153 -->|condition false| B154
B154 -->|jump| B153
B155 -->|condition true| B160
B155 -->|condition false| B156
B156 -->|condition true| B161
B156 -->|condition false| B157
B157 -->|condition true| B162
B157 -->|condition false| B158
B158 -->|condition true| B163
B158 -->|condition false| B159
B159 -->|jump| B153
B160["Continue at B161 in section 17"]
B161["Continue at B162 in section 17"]
B162["Continue at B163 in section 17"]
B163["Continue at B164 in section 17"]
```

### B151

Return to the instruction following the active call.

```asm
RET
```

### B152

```asm
MOV P0,#01110000B
```

### B153

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B154

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B155

```asm
SJMP K2
```

### B156

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B157

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B158

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B159

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B160

```asm
LJMP K2
```

## Section 17

```mermaid
flowchart TD
B160["B161: ROW_0 - lines 385 to 386"]
B161["B162: ROW_1 - lines 387 to 388"]
B162["B163: ROW_2 - lines 389 to 390"]
B163["B164: ROW_3 - lines 391 to 391"]
B164["B165: FIND - lines 393 to 393"]
B165["B166: FIND1 - lines 395 to 396"]
B166["B167: instructions - lines 397 to 398"]
B167["B168: MATCH - lines 399 to 401"]
B168["B169: WSTR - lines 411 to 411"]
B169["B170: CONT1 - lines 413 to 415"]
B160 -->|jump| B164
B161 -->|jump| B164
B162 -->|jump| B164
B163 -->|next| B164
B164 -->|next| B165
B165 -->|condition true| B167
B165 -->|condition false| B166
B166 -->|jump| B165
B168 -->|next| B169
B169 -->|condition true| B172
B169 -->|condition false| B170
B172["Continue at B173 in section 18"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B162

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B163

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B164

```asm
MOV DPTR,#KCODE3
```

### B165

```asm
RLC A
```

### B166

```asm
RLC A
JNC MATCH
```

### B167

```asm
INC DPTR
SJMP FIND1
```

### B168

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B169

```asm
PUSH    ACC
```

### B170

```asm
CLR     A
MOVC    A,@A+DPTR
JZ EXIT1
```

## Section 18

```mermaid
flowchart TD
B170["B171: PRINT - lines 417 to 417"]
B171["B172: instructions - lines 418 to 419"]
B172["B173: EXIT1 - lines 420 to 421"]
B170 -->|call| B128
B170 -->|after return| B171
B171 -->|jump| B169
B128["Continue at B129 in section 13"]
B169["Continue at B170 in section 17"]
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
