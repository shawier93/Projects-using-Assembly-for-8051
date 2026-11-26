# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `org 0h` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 3"]
B1["B2: instructions - lines 4 to 11"]
B2["B3: FF - lines 13 to 13"]
B3["B4: instructions - lines 14 to 14"]
B4["B5: instructions - lines 15 to 15"]
B5["B6: instructions - lines 17 to 17"]
B6["B7: instructions - lines 18 to 18"]
B7["B8: instructions - lines 19 to 19"]
B8["B9: instructions - lines 22 to 23"]
B9["B10: instructions - lines 24 to 24"]
B0 -->|call| B124
B0 -->|after return| B1
B1 -->|next| B2
B2 -->|call| B110
B2 -->|after return| B3
B3 -->|call| B121
B3 -->|after return| B4
B4 -->|condition true| B2
B4 -->|condition false| B5
B5 -->|call| B124
B5 -->|after return| B6
B6 -->|call| B113
B6 -->|after return| B7
B7 -->|call| B121
B7 -->|after return| B8
B8 -->|call| B134
B8 -->|after return| B9
B9 -->|call| B121
B9 -->|after return| B10
B124["Continue at B125 in section 13"]
B110["Continue at B111 in section 12"]
B121["Continue at B122 in section 13"]
B113["Continue at B114 in section 12"]
B134["Continue at B135 in section 14"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV 30H,#99
MOV 31H,#19
MOV 32H,#0
MOV P1,#00H
CLR A
MOV P1,#0FFH
MOV R3,#5
```

### B3

```asm
ACALL FLASHING
```

### B4

```asm
ACALL DELAY
```

### B5

```asm
DJNZ R3,FF
```

### B6

```asm
ACALL INLCD
```

### B7

```asm
ACALL WELCOME
```

### B8

```asm
ACALL DELAY
```

### B9

```asm
MOV A,#01H
ACALL CMD
```

### B10

```asm
ACALL DELAY
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 25 to 25"]
B11["B12: instructions - lines 26 to 27"]
B12["B13: instructions - lines 28 to 29"]
B13["B14: instructions - lines 30 to 31"]
B14["B15: instructions - lines 32 to 32"]
B15["B16: instructions - lines 33 to 33"]
B16["B17: instructions - lines 35 to 36"]
B17["B18: instructions - lines 37 to 38"]
B18["B19: instructions - lines 39 to 40"]
B19["B20: instructions - lines 41 to 42"]
B10 -->|call| B121
B10 -->|after return| B11
B11 -->|call| B134
B11 -->|after return| B12
B12 -->|call| B140
B12 -->|after return| B13
B13 -->|call| B134
B13 -->|after return| B14
B14 -->|call| B121
B14 -->|after return| B15
B15 -->|call| B121
B15 -->|after return| B16
B16 -->|call| B120
B16 -->|after return| B17
B17 -->|call| B129
B17 -->|after return| B18
B18 -->|call| B129
B18 -->|after return| B19
B19 -->|call| B129
B19 -->|after return| B20
B121["Continue at B122 in section 13"]
B134["Continue at B135 in section 14"]
B140["Continue at B141 in section 15"]
B120["Continue at B121 in section 13"]
B129["Continue at B130 in section 13"]
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
MOV DPTR,#STR2
ACALL WSTR
```

### B14

```asm
MOV A,#0C5H
ACALL CMD
```

### B15

```asm
ACALL DELAY
```

### B16

```asm
ACALL DELAY
```

### B17

```asm
MOV R4,30H
ACALL CONV
```

### B18

```asm
MOV A,60H
ACALL WCHR
```

### B19

```asm
MOV A,61H
ACALL WCHR
```

### B20

```asm
MOV A,62H
ACALL WCHR
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 43 to 43"]
B21["B22: instructions - lines 44 to 44"]
B22["B23: instructions - lines 47 to 48"]
B23["B24: instructions - lines 49 to 49"]
B24["B25: instructions - lines 50 to 50"]
B25["B26: instructions - lines 51 to 52"]
B26["B27: instructions - lines 53 to 54"]
B27["B28: instructions - lines 55 to 56"]
B28["B29: instructions - lines 57 to 57"]
B29["B30: instructions - lines 58 to 58"]
B20 -->|call| B121
B20 -->|after return| B21
B21 -->|call| B121
B21 -->|after return| B22
B22 -->|call| B134
B22 -->|after return| B23
B23 -->|call| B121
B23 -->|after return| B24
B24 -->|call| B121
B24 -->|after return| B25
B25 -->|call| B134
B25 -->|after return| B26
B26 -->|call| B140
B26 -->|after return| B27
B27 -->|call| B134
B27 -->|after return| B28
B28 -->|call| B121
B28 -->|after return| B29
B29 -->|call| B121
B29 -->|after return| B30
B121["Continue at B122 in section 13"]
B134["Continue at B135 in section 14"]
B140["Continue at B141 in section 15"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL DELAY
```

### B22

```asm
ACALL DELAY
```

### B23

```asm
MOV A,#01H
ACALL CMD
```

### B24

```asm
ACALL DELAY
```

### B25

```asm
ACALL DELAY
```

### B26

```asm
MOV A,#80H
ACALL CMD
```

### B27

```asm
MOV DPTR,#STR3
ACALL WSTR
```

### B28

```asm
MOV A,#0C5H
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
B30["B31: instructions - lines 60 to 61"]
B31["B32: instructions - lines 62 to 63"]
B32["B33: instructions - lines 64 to 65"]
B33["B34: instructions - lines 66 to 67"]
B34["B35: instructions - lines 69 to 69"]
B35["B36: CHECK - lines 70 to 70"]
B36["B37: MAIN_MINU - lines 74 to 81"]
B37["B38: instructions - lines 82 to 82"]
B38["B39: instructions - lines 83 to 83"]
B39["B40: instructions - lines 84 to 85"]
B30 -->|call| B120
B30 -->|after return| B31
B31 -->|call| B129
B31 -->|after return| B32
B32 -->|call| B129
B32 -->|after return| B33
B33 -->|call| B129
B33 -->|after return| B34
B34 -->|jump| B36
B35 -->|jump| B35
B36 -->|call| B134
B36 -->|after return| B37
B37 -->|call| B121
B37 -->|after return| B38
B38 -->|call| B121
B38 -->|after return| B39
B39 -->|call| B134
B39 -->|after return| B40
B120["Continue at B121 in section 13"]
B129["Continue at B130 in section 13"]
B134["Continue at B135 in section 14"]
B121["Continue at B122 in section 13"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV R4,31H
ACALL CONV
```

### B32

```asm
MOV A,60H
ACALL WCHR
```

### B33

```asm
MOV A,61H
ACALL WCHR
```

### B34

```asm
MOV A,62H
ACALL WCHR
```

### B35

```asm
SJMP MAIN_MINU
```

### B36

```asm
SJMP CHECK
```

### B37

```asm
MOV A,31H
MOV B,#1
SUBB A,B
MOV 20H,A
MOV A,#01H
ACALL CMD
```

### B38

```asm
ACALL DELAY
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
B40["B41: instructions - lines 86 to 87"]
B41["B42: instructions - lines 88 to 89"]
B42["B43: instructions - lines 91 to 92"]
B43["B44: instructions - lines 93 to 94"]
B44["B45: instructions - lines 95 to 96"]
B45["B46: instructions - lines 97 to 98"]
B46["B47: instructions - lines 100 to 106"]
B47["B48: instructions - lines 107 to 107"]
B48["B49: instructions - lines 108 to 109"]
B49["B50: instructions - lines 110 to 110"]
B40 -->|call| B140
B40 -->|after return| B41
B41 -->|call| B134
B41 -->|after return| B42
B42 -->|call| B120
B42 -->|after return| B43
B43 -->|call| B129
B43 -->|after return| B44
B44 -->|call| B129
B44 -->|after return| B45
B45 -->|call| B129
B45 -->|after return| B46
B46 -->|condition true| B65
B46 -->|condition false| B47
B47 -->|condition true| B66
B47 -->|condition false| B48
B48 -->|call| B134
B48 -->|after return| B49
B49 -->|call| B121
B49 -->|after return| B50
B140["Continue at B141 in section 15"]
B134["Continue at B135 in section 14"]
B120["Continue at B121 in section 13"]
B129["Continue at B130 in section 13"]
B65["Continue at B66 in section 7"]
B66["Continue at B67 in section 7"]
B121["Continue at B122 in section 13"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV DPTR,#STR5
ACALL WSTR
```

### B42

```asm
MOV A,#0C5H
ACALL CMD
```

### B43

```asm
MOV R4,20H
ACALL CONV
```

### B44

```asm
MOV A,60H
ACALL WCHR
```

### B45

```asm
MOV A,61H
ACALL WCHR
```

### B46

```asm
MOV A,62H
ACALL WCHR
```

### B47

```asm
MOV A,20H
MOV B,#10
DIV AB
MOV R1,B
CJNE A,#0H,DISC2
```

### B48

```asm
CJNE R1,#0H, DISCO1
```

### B49

```asm
MOV A,#01H
ACALL CMD
```

### B50

```asm
ACALL DELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 111 to 111"]
B51["B52: instructions - lines 112 to 113"]
B52["B53: instructions - lines 114 to 115"]
B53["B54: instructions - lines 117 to 118"]
B54["B55: instructions - lines 119 to 120"]
B55["B56: instructions - lines 121 to 121"]
B56["B57: instructions - lines 122 to 122"]
B57["B58: instructions - lines 123 to 124"]
B58["B59: instructions - lines 125 to 126"]
B59["B60: instructions - lines 127 to 128"]
B50 -->|call| B121
B50 -->|after return| B51
B51 -->|call| B134
B51 -->|after return| B52
B52 -->|call| B140
B52 -->|after return| B53
B53 -->|call| B109
B53 -->|after return| B54
B54 -->|call| B134
B54 -->|after return| B55
B55 -->|call| B121
B55 -->|after return| B56
B56 -->|call| B121
B56 -->|after return| B57
B57 -->|call| B134
B57 -->|after return| B58
B58 -->|call| B140
B58 -->|after return| B59
B59 -->|call| B134
B59 -->|after return| B60
B121["Continue at B122 in section 13"]
B134["Continue at B135 in section 14"]
B140["Continue at B141 in section 15"]
B109["Continue at B110 in section 11"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL DELAY
```

### B52

```asm
MOV A,#80H
ACALL CMD
```

### B53

```asm
MOV DPTR,#STR4
ACALL WSTR
```

### B54

```asm
MOV 32H,#0
ACALL COST
```

### B55

```asm
MOV A,#01H
ACALL CMD
```

### B56

```asm
ACALL DELAY
```

### B57

```asm
ACALL DELAY
```

### B58

```asm
MOV A,#80H
ACALL CMD
```

### B59

```asm
MOV DPTR,#STR9
ACALL WSTR
```

### B60

```asm
MOV A,#0C5H
ACALL CMD
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 130 to 131"]
B61["B62: instructions - lines 132 to 133"]
B62["B63: instructions - lines 134 to 135"]
B63["B64: instructions - lines 136 to 137"]
B64["B65: instructions - lines 138 to 138"]
B65["B66: DISC2 - lines 140 to 140"]
B66["B67: DISCO1 - lines 142 to 142"]
B67["B68: instructions - lines 143 to 144"]
B68["B69: instructions - lines 145 to 145"]
B69["B70: instructions - lines 146 to 146"]
B60 -->|call| B120
B60 -->|after return| B61
B61 -->|call| B129
B61 -->|after return| B62
B62 -->|call| B129
B62 -->|after return| B63
B63 -->|call| B129
B63 -->|after return| B64
B64 -->|jump| B35
B65 -->|jump| B84
B66 -->|condition true| B84
B66 -->|condition false| B67
B67 -->|call| B134
B67 -->|after return| B68
B68 -->|call| B121
B68 -->|after return| B69
B69 -->|call| B121
B69 -->|after return| B70
B120["Continue at B121 in section 13"]
B129["Continue at B130 in section 13"]
B35["Continue at B36 in section 4"]
B84["Continue at B85 in section 9"]
B134["Continue at B135 in section 14"]
B121["Continue at B122 in section 13"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV R4,33H
ACALL CONV
```

### B62

```asm
MOV A,60H
ACALL WCHR
```

### B63

```asm
MOV A,61H
ACALL WCHR
```

### B64

```asm
MOV A,62H
ACALL WCHR
```

### B65

```asm
AJMP CHECK
```

### B66

```asm
SJMP DISCO2
```

### B67

```asm
CJNE A,#0H, DISCO2
```

### B68

```asm
MOV A,#01H
ACALL CMD
```

### B69

```asm
ACALL DELAY
```

### B70

```asm
ACALL DELAY
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 147 to 148"]
B71["B72: instructions - lines 149 to 150"]
B72["B73: instructions - lines 151 to 152"]
B73["B74: instructions - lines 153 to 154"]
B74["B75: instructions - lines 155 to 155"]
B75["B76: instructions - lines 156 to 156"]
B76["B77: instructions - lines 157 to 158"]
B77["B78: instructions - lines 159 to 160"]
B78["B79: instructions - lines 161 to 162"]
B79["B80: instructions - lines 164 to 165"]
B70 -->|call| B134
B70 -->|after return| B71
B71 -->|call| B140
B71 -->|after return| B72
B72 -->|call| B109
B72 -->|after return| B73
B73 -->|call| B134
B73 -->|after return| B74
B74 -->|call| B121
B74 -->|after return| B75
B75 -->|call| B121
B75 -->|after return| B76
B76 -->|call| B134
B76 -->|after return| B77
B77 -->|call| B140
B77 -->|after return| B78
B78 -->|call| B134
B78 -->|after return| B79
B79 -->|call| B120
B79 -->|after return| B80
B134["Continue at B135 in section 14"]
B140["Continue at B141 in section 15"]
B109["Continue at B110 in section 11"]
B121["Continue at B122 in section 13"]
B120["Continue at B121 in section 13"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV A,#80H
ACALL CMD
```

### B72

```asm
MOV DPTR,#STR7
ACALL WSTR
```

### B73

```asm
MOV 32H,#1
ACALL COST
```

### B74

```asm
MOV A,#01H
ACALL CMD
```

### B75

```asm
ACALL DELAY
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
MOV DPTR,#STR9
ACALL WSTR
```

### B79

```asm
MOV A,#0C5H
ACALL CMD
```

### B80

```asm
MOV R4,33H
ACALL CONV
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 166 to 167"]
B81["B82: instructions - lines 168 to 169"]
B82["B83: instructions - lines 170 to 171"]
B83["B84: instructions - lines 172 to 172"]
B84["B85: DISCO2 - lines 175 to 175"]
B85["B86: instructions - lines 176 to 177"]
B86["B87: instructions - lines 178 to 178"]
B87["B88: instructions - lines 179 to 179"]
B88["B89: instructions - lines 180 to 181"]
B89["B90: instructions - lines 182 to 183"]
B80 -->|call| B129
B80 -->|after return| B81
B81 -->|call| B129
B81 -->|after return| B82
B82 -->|call| B129
B82 -->|after return| B83
B83 -->|jump| B35
B84 -->|condition true| B102
B84 -->|condition false| B85
B85 -->|call| B134
B85 -->|after return| B86
B86 -->|call| B121
B86 -->|after return| B87
B87 -->|call| B121
B87 -->|after return| B88
B88 -->|call| B134
B88 -->|after return| B89
B89 -->|call| B140
B89 -->|after return| B90
B129["Continue at B130 in section 13"]
B35["Continue at B36 in section 4"]
B102["Continue at B103 in section 11"]
B134["Continue at B135 in section 14"]
B121["Continue at B122 in section 13"]
B140["Continue at B141 in section 15"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV A,60H
ACALL WCHR
```

### B82

```asm
MOV A,61H
ACALL WCHR
```

### B83

```asm
MOV A,62H
ACALL WCHR
```

### B84

```asm
AJMP CHECK
```

### B85

```asm
CJNE A,#1H, FREE
```

### B86

```asm
MOV A,#01H
ACALL CMD
```

### B87

```asm
ACALL DELAY
```

### B88

```asm
ACALL DELAY
```

### B89

```asm
MOV A,#80H
ACALL CMD
```

### B90

```asm
MOV DPTR,#STR8
ACALL WSTR
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 184 to 185"]
B91["B92: instructions - lines 186 to 187"]
B92["B93: instructions - lines 188 to 188"]
B93["B94: instructions - lines 189 to 189"]
B94["B95: instructions - lines 190 to 191"]
B95["B96: instructions - lines 192 to 193"]
B96["B97: instructions - lines 194 to 195"]
B97["B98: instructions - lines 197 to 198"]
B98["B99: instructions - lines 199 to 200"]
B99["B100: instructions - lines 201 to 202"]
B90 -->|call| B109
B90 -->|after return| B91
B91 -->|call| B134
B91 -->|after return| B92
B92 -->|call| B121
B92 -->|after return| B93
B93 -->|call| B121
B93 -->|after return| B94
B94 -->|call| B134
B94 -->|after return| B95
B95 -->|call| B140
B95 -->|after return| B96
B96 -->|call| B134
B96 -->|after return| B97
B97 -->|call| B120
B97 -->|after return| B98
B98 -->|call| B129
B98 -->|after return| B99
B99 -->|call| B129
B99 -->|after return| B100
B109["Continue at B110 in section 11"]
B134["Continue at B135 in section 14"]
B121["Continue at B122 in section 13"]
B140["Continue at B141 in section 15"]
B120["Continue at B121 in section 13"]
B129["Continue at B130 in section 13"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV 32H,#2
ACALL COST
```

### B92

```asm
MOV A,#01H
ACALL CMD
```

### B93

```asm
ACALL DELAY
```

### B94

```asm
ACALL DELAY
```

### B95

```asm
MOV A,#80H
ACALL CMD
```

### B96

```asm
MOV DPTR,#STR9
ACALL WSTR
```

### B97

```asm
MOV A,#0C5H
ACALL CMD
```

### B98

```asm
MOV R4,33H
ACALL CONV
```

### B99

```asm
MOV A,60H
ACALL WCHR
```

### B100

```asm
MOV A,61H
ACALL WCHR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 203 to 204"]
B101["B102: instructions - lines 205 to 205"]
B102["B103: FREE - lines 208 to 209"]
B103["B104: instructions - lines 210 to 210"]
B104["B105: instructions - lines 211 to 211"]
B105["B106: instructions - lines 212 to 213"]
B106["B107: instructions - lines 214 to 215"]
B107["B108: instructions - lines 216 to 217"]
B108["B109: instructions - lines 220 to 220"]
B109["B110: COST - lines 225 to 240"]
B100 -->|call| B129
B100 -->|after return| B101
B101 -->|jump| B35
B102 -->|call| B134
B102 -->|after return| B103
B103 -->|call| B121
B103 -->|after return| B104
B104 -->|call| B121
B104 -->|after return| B105
B105 -->|call| B134
B105 -->|after return| B106
B106 -->|call| B140
B106 -->|after return| B107
B107 -->|call| B109
B107 -->|after return| B108
B108 -->|jump| B35
B129["Continue at B130 in section 13"]
B35["Continue at B36 in section 4"]
B134["Continue at B135 in section 14"]
B121["Continue at B122 in section 13"]
B140["Continue at B141 in section 15"]
```

### B101

```asm
MOV A,62H
ACALL WCHR
```

### B102

```asm
AJMP CHECK
```

### B103

```asm
MOV A,#01H
ACALL CMD
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
MOV A,#80H
ACALL CMD
```

### B107

```asm
MOV DPTR,#STR6
ACALL WSTR
```

### B108

```asm
MOV 32H,#10
ACALL COST
```

### B109

```asm
AJMP CHECK
```

### B110

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

## Section 12

```mermaid
flowchart TD
B110["B111: FLASHING - lines 244 to 245"]
B111["B112: instructions - lines 246 to 247"]
B112["B113: instructions - lines 248 to 248"]
B113["B114: WELCOME - lines 251 to 252"]
B114["B115: instructions - lines 253 to 253"]
B115["B116: instructions - lines 254 to 254"]
B116["B117: instructions - lines 255 to 257"]
B117["B118: instructions - lines 258 to 260"]
B118["B119: instructions - lines 261 to 261"]
B119["B120: instructions - lines 262 to 262"]
B110 -->|call| B121
B110 -->|after return| B111
B111 -->|call| B121
B111 -->|after return| B112
B113 -->|call| B134
B113 -->|after return| B114
B114 -->|call| B121
B114 -->|after return| B115
B115 -->|call| B121
B115 -->|after return| B116
B116 -->|call| B134
B116 -->|after return| B117
B117 -->|call| B140
B117 -->|after return| B118
B118 -->|call| B121
B118 -->|after return| B119
B121["Continue at B122 in section 13"]
B134["Continue at B135 in section 14"]
B140["Continue at B141 in section 15"]
```

### B111

```asm
CLR P1.1
ACALL DELAY
```

### B112

```asm
SETB P1.1
ACALL DELAY
```

### B113

Return to the instruction following the active call.

```asm
RET
```

### B114

```asm
MOV A,#01H
ACALL CMD
```

### B115

```asm
ACALL DELAY
```

### B116

```asm
ACALL DELAY
```

### B117

```asm
CLR A
MOV A,#80H
ACALL CMD
```

### B118

```asm
CLR A
MOV DPTR,#STR1
ACALL WSTR
```

### B119

```asm
ACALL DELAY
```

### B120

Return to the instruction following the active call.

```asm
RET
```

## Section 13

```mermaid
flowchart TD
B120["B121: CONV - lines 265 to 285"]
B121["B122: DELAY - lines 288 to 288"]
B122["B123: HH - lines 289 to 289"]
B123["B124: instructions - lines 290 to 290"]
B124["B125: INLCD - lines 294 to 302"]
B125["B126: instructions - lines 304 to 313"]
B126["B127: instructions - lines 315 to 330"]
B127["B128: instructions - lines 332 to 344"]
B128["B129: instructions - lines 345 to 345"]
B129["B130: WCHR - lines 350 to 354"]
B121 -->|next| B122
B122 -->|condition true| B122
B122 -->|condition false| B123
B124 -->|call| B121
B124 -->|after return| B125
B125 -->|call| B121
B125 -->|after return| B126
B126 -->|call| B121
B126 -->|after return| B127
B127 -->|call| B121
B127 -->|after return| B128
B129 -->|call| B139
B129 -->|after return| B130
B139["Continue at B140 in section 14"]
B130["Continue at B131 in section 14"]
```

### B121

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

### B122

```asm
MOV R0, #250
```

### B123

```asm
DJNZ R0, HH
```

### B124

Return to the instruction following the active call.

```asm
RET
```

### B125

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

### B126

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

### B127

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

### B128

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

### B129

Return to the instruction following the active call.

```asm
RET
```

### B130

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 355 to 355"]
B131["B132: instructions - lines 356 to 358"]
B132["B133: instructions - lines 359 to 359"]
B133["B134: instructions - lines 360 to 362"]
B134["B135: CMD - lines 365 to 367"]
B135["B136: instructions - lines 368 to 368"]
B136["B137: instructions - lines 369 to 371"]
B137["B138: instructions - lines 372 to 372"]
B138["B139: instructions - lines 373 to 373"]
B139["B140: COMMON - lines 377 to 382"]
B130 -->|call| B121
B130 -->|after return| B131
B131 -->|call| B139
B131 -->|after return| B132
B132 -->|call| B121
B132 -->|after return| B133
B134 -->|call| B139
B134 -->|after return| B135
B135 -->|call| B121
B135 -->|after return| B136
B136 -->|call| B139
B136 -->|after return| B137
B137 -->|call| B121
B137 -->|after return| B138
B121["Continue at B122 in section 13"]
```

### B131

```asm
ACALL DELAY
```

### B132

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B133

```asm
ACALL DELAY
```

### B134

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B135

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B136

```asm
ACALL DELAY
```

### B137

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B138

```asm
ACALL DELAY
```

### B139

Return to the instruction following the active call.

```asm
RET
```

### B140

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

## Section 15

```mermaid
flowchart TD
B140["B141: WSTR - lines 386 to 386"]
B141["B142: CONT1 - lines 388 to 390"]
B142["B143: PRINT - lines 392 to 392"]
B143["B144: instructions - lines 393 to 394"]
B144["B145: EXIT1 - lines 395 to 396"]
B145["B146: instructions - lines 418 to 418"]
B140 -->|next| B141
B141 -->|condition true| B144
B141 -->|condition false| B142
B142 -->|call| B129
B142 -->|after return| B143
B143 -->|jump| B141
B129["Continue at B130 in section 13"]
```

### B141

```asm
PUSH    ACC
```

### B142

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B143

```asm
ACALL    WCHR
```

### B144

```asm
INC DPTR
AJMP    CONT1
```

### B145

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B146

Return to the instruction following the active call.

```asm
RET
```
