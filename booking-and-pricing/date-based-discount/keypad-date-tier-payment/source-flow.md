# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `org 0h` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17)

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
B0 -->|call| B126
B0 -->|after return| B1
B1 -->|next| B2
B2 -->|call| B111
B2 -->|after return| B3
B3 -->|call| B123
B3 -->|after return| B4
B4 -->|condition true| B2
B4 -->|condition false| B5
B5 -->|call| B126
B5 -->|after return| B6
B6 -->|call| B114
B6 -->|after return| B7
B7 -->|call| B123
B7 -->|after return| B8
B8 -->|call| B136
B8 -->|after return| B9
B9 -->|call| B123
B9 -->|after return| B10
B126["Continue at B127 in section 13"]
B111["Continue at B112 in section 12"]
B123["Continue at B124 in section 13"]
B114["Continue at B115 in section 12"]
B136["Continue at B137 in section 14"]
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
B16["B17: instructions - lines 34 to 34"]
B17["B18: instructions - lines 35 to 36"]
B18["B19: instructions - lines 37 to 37"]
B19["B20: instructions - lines 38 to 39"]
B10 -->|call| B123
B10 -->|after return| B11
B11 -->|call| B136
B11 -->|after return| B12
B12 -->|call| B142
B12 -->|after return| B13
B13 -->|call| B136
B13 -->|after return| B14
B14 -->|call| B123
B14 -->|after return| B15
B15 -->|call| B123
B15 -->|after return| B16
B16 -->|call| B147
B16 -->|after return| B17
B17 -->|call| B131
B17 -->|after return| B18
B18 -->|call| B147
B18 -->|after return| B19
B19 -->|call| B131
B19 -->|after return| B20
B123["Continue at B124 in section 13"]
B136["Continue at B137 in section 14"]
B142["Continue at B143 in section 15"]
B147["Continue at B148 in section 15"]
B131["Continue at B132 in section 14"]
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
ACALL KEYPAD
```

### B18

```asm
MOV 50H,A
ACALL WCHR
```

### B19

```asm
ACALL KEYPAD
```

### B20

```asm
MOV 51H,A
ACALL WCHR
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 40 to 40"]
B21["B22: instructions - lines 41 to 47"]
B22["B23: instructions - lines 48 to 48"]
B23["B24: instructions - lines 49 to 49"]
B24["B25: instructions - lines 50 to 51"]
B25["B26: instructions - lines 52 to 53"]
B26["B27: instructions - lines 54 to 55"]
B27["B28: instructions - lines 56 to 56"]
B28["B29: instructions - lines 57 to 57"]
B29["B30: instructions - lines 59 to 59"]
B20 -->|call| B122
B20 -->|after return| B21
B21 -->|call| B136
B21 -->|after return| B22
B22 -->|call| B123
B22 -->|after return| B23
B23 -->|call| B123
B23 -->|after return| B24
B24 -->|call| B136
B24 -->|after return| B25
B25 -->|call| B142
B25 -->|after return| B26
B26 -->|call| B136
B26 -->|after return| B27
B27 -->|call| B123
B27 -->|after return| B28
B28 -->|call| B123
B28 -->|after return| B29
B29 -->|call| B147
B29 -->|after return| B30
B122["Continue at B123 in section 13"]
B136["Continue at B137 in section 14"]
B123["Continue at B124 in section 13"]
B142["Continue at B143 in section 15"]
B147["Continue at B148 in section 15"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL INCONV
```

### B22

```asm
MOV 30H,45H
MOV A,#01H
ACALL CMD
```

### B23

```asm
ACALL DELAY
```

### B24

```asm
ACALL DELAY
```

### B25

```asm
MOV A,#80H
ACALL CMD
```

### B26

```asm
MOV DPTR,#STR3
ACALL WSTR
```

### B27

```asm
MOV A,#0C5H
ACALL CMD
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
ACALL KEYPAD
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 60 to 61"]
B31["B32: instructions - lines 62 to 62"]
B32["B33: instructions - lines 63 to 64"]
B33["B34: instructions - lines 65 to 65"]
B34["B35: instructions - lines 66 to 66"]
B35["B36: instructions - lines 67 to 70"]
B36["B37: CHECK - lines 71 to 71"]
B37["B38: MAIN_MINU - lines 75 to 82"]
B38["B39: instructions - lines 83 to 83"]
B39["B40: instructions - lines 84 to 84"]
B30 -->|call| B131
B30 -->|after return| B31
B31 -->|call| B147
B31 -->|after return| B32
B32 -->|call| B131
B32 -->|after return| B33
B33 -->|call| B123
B33 -->|after return| B34
B34 -->|call| B122
B34 -->|after return| B35
B35 -->|jump| B37
B36 -->|jump| B36
B37 -->|call| B136
B37 -->|after return| B38
B38 -->|call| B123
B38 -->|after return| B39
B39 -->|call| B123
B39 -->|after return| B40
B131["Continue at B132 in section 14"]
B147["Continue at B148 in section 15"]
B123["Continue at B124 in section 13"]
B122["Continue at B123 in section 13"]
B136["Continue at B137 in section 14"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV 50H,A
ACALL WCHR
```

### B32

```asm
ACALL KEYPAD
```

### B33

```asm
MOV 51H,A
ACALL WCHR
```

### B34

```asm
ACALL DELAY
```

### B35

```asm
ACALL INCONV
```

### B36

```asm
MOV 31H,45H
SJMP MAIN_MINU
```

### B37

```asm
SJMP CHECK
```

### B38

```asm
MOV A,31H
MOV B,#1
SUBB A,B
MOV 20H,A
MOV A,#01H
ACALL CMD
```

### B39

```asm
ACALL DELAY
```

### B40

```asm
ACALL DELAY
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 85 to 86"]
B41["B42: instructions - lines 87 to 88"]
B42["B43: instructions - lines 89 to 90"]
B43["B44: instructions - lines 92 to 93"]
B44["B45: instructions - lines 94 to 95"]
B45["B46: instructions - lines 96 to 97"]
B46["B47: instructions - lines 98 to 99"]
B47["B48: instructions - lines 101 to 107"]
B48["B49: instructions - lines 108 to 108"]
B49["B50: instructions - lines 109 to 110"]
B40 -->|call| B136
B40 -->|after return| B41
B41 -->|call| B142
B41 -->|after return| B42
B42 -->|call| B136
B42 -->|after return| B43
B43 -->|call| B121
B43 -->|after return| B44
B44 -->|call| B131
B44 -->|after return| B45
B45 -->|call| B131
B45 -->|after return| B46
B46 -->|call| B131
B46 -->|after return| B47
B47 -->|condition true| B66
B47 -->|condition false| B48
B48 -->|condition true| B67
B48 -->|condition false| B49
B49 -->|call| B136
B49 -->|after return| B50
B136["Continue at B137 in section 14"]
B142["Continue at B143 in section 15"]
B121["Continue at B122 in section 13"]
B131["Continue at B132 in section 14"]
B66["Continue at B67 in section 7"]
B67["Continue at B68 in section 7"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A,#80H
ACALL CMD
```

### B42

```asm
MOV DPTR,#STR5
ACALL WSTR
```

### B43

```asm
MOV A,#0C5H
ACALL CMD
```

### B44

```asm
MOV R4,20H
ACALL CONV
```

### B45

```asm
MOV A,60H
ACALL WCHR
```

### B46

```asm
MOV A,61H
ACALL WCHR
```

### B47

```asm
MOV A,62H
ACALL WCHR
```

### B48

```asm
MOV A,20H
MOV B,#10
DIV AB
MOV R1,B
CJNE A,#0H,DISC2
```

### B49

```asm
CJNE R1,#0H, DISCO1
```

### B50

```asm
MOV A,#01H
ACALL CMD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 111 to 111"]
B51["B52: instructions - lines 112 to 112"]
B52["B53: instructions - lines 113 to 114"]
B53["B54: instructions - lines 115 to 116"]
B54["B55: instructions - lines 118 to 119"]
B55["B56: instructions - lines 120 to 121"]
B56["B57: instructions - lines 122 to 122"]
B57["B58: instructions - lines 123 to 123"]
B58["B59: instructions - lines 124 to 125"]
B59["B60: instructions - lines 126 to 127"]
B50 -->|call| B123
B50 -->|after return| B51
B51 -->|call| B123
B51 -->|after return| B52
B52 -->|call| B136
B52 -->|after return| B53
B53 -->|call| B142
B53 -->|after return| B54
B54 -->|call| B110
B54 -->|after return| B55
B55 -->|call| B136
B55 -->|after return| B56
B56 -->|call| B123
B56 -->|after return| B57
B57 -->|call| B123
B57 -->|after return| B58
B58 -->|call| B136
B58 -->|after return| B59
B59 -->|call| B142
B59 -->|after return| B60
B123["Continue at B124 in section 13"]
B136["Continue at B137 in section 14"]
B142["Continue at B143 in section 15"]
B110["Continue at B111 in section 12"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL DELAY
```

### B52

```asm
ACALL DELAY
```

### B53

```asm
MOV A,#80H
ACALL CMD
```

### B54

```asm
MOV DPTR,#STR4
ACALL WSTR
```

### B55

```asm
MOV 32H,#0
ACALL COST
```

### B56

```asm
MOV A,#01H
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
MOV DPTR,#STR9
ACALL WSTR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 128 to 129"]
B61["B62: instructions - lines 131 to 132"]
B62["B63: instructions - lines 133 to 134"]
B63["B64: instructions - lines 135 to 136"]
B64["B65: instructions - lines 137 to 138"]
B65["B66: instructions - lines 139 to 139"]
B66["B67: DISC2 - lines 141 to 141"]
B67["B68: DISCO1 - lines 143 to 143"]
B68["B69: instructions - lines 144 to 145"]
B69["B70: instructions - lines 146 to 146"]
B60 -->|call| B136
B60 -->|after return| B61
B61 -->|call| B121
B61 -->|after return| B62
B62 -->|call| B131
B62 -->|after return| B63
B63 -->|call| B131
B63 -->|after return| B64
B64 -->|call| B131
B64 -->|after return| B65
B65 -->|jump| B36
B66 -->|jump| B85
B67 -->|condition true| B85
B67 -->|condition false| B68
B68 -->|call| B136
B68 -->|after return| B69
B69 -->|call| B123
B69 -->|after return| B70
B136["Continue at B137 in section 14"]
B121["Continue at B122 in section 13"]
B131["Continue at B132 in section 14"]
B36["Continue at B37 in section 4"]
B85["Continue at B86 in section 9"]
B123["Continue at B124 in section 13"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,#0C5H
ACALL CMD
```

### B62

```asm
MOV R4,33H
ACALL CONV
```

### B63

```asm
MOV A,60H
ACALL WCHR
```

### B64

```asm
MOV A,61H
ACALL WCHR
```

### B65

```asm
MOV A,62H
ACALL WCHR
```

### B66

```asm
AJMP CHECK
```

### B67

```asm
SJMP DISCO2
```

### B68

```asm
CJNE A,#0H, DISCO2
```

### B69

```asm
MOV A,#01H
ACALL CMD
```

### B70

```asm
ACALL DELAY
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 147 to 147"]
B71["B72: instructions - lines 148 to 149"]
B72["B73: instructions - lines 150 to 151"]
B73["B74: instructions - lines 152 to 153"]
B74["B75: instructions - lines 154 to 155"]
B75["B76: instructions - lines 156 to 156"]
B76["B77: instructions - lines 157 to 157"]
B77["B78: instructions - lines 158 to 159"]
B78["B79: instructions - lines 160 to 161"]
B79["B80: instructions - lines 162 to 163"]
B70 -->|call| B123
B70 -->|after return| B71
B71 -->|call| B136
B71 -->|after return| B72
B72 -->|call| B142
B72 -->|after return| B73
B73 -->|call| B110
B73 -->|after return| B74
B74 -->|call| B136
B74 -->|after return| B75
B75 -->|call| B123
B75 -->|after return| B76
B76 -->|call| B123
B76 -->|after return| B77
B77 -->|call| B136
B77 -->|after return| B78
B78 -->|call| B142
B78 -->|after return| B79
B79 -->|call| B136
B79 -->|after return| B80
B123["Continue at B124 in section 13"]
B136["Continue at B137 in section 14"]
B142["Continue at B143 in section 15"]
B110["Continue at B111 in section 12"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL DELAY
```

### B72

```asm
MOV A,#80H
ACALL CMD
```

### B73

```asm
MOV DPTR,#STR7
ACALL WSTR
```

### B74

```asm
MOV 32H,#1
ACALL COST
```

### B75

```asm
MOV A,#01H
ACALL CMD
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
MOV A,#80H
ACALL CMD
```

### B79

```asm
MOV DPTR,#STR9
ACALL WSTR
```

### B80

```asm
MOV A,#0C5H
ACALL CMD
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 165 to 166"]
B81["B82: instructions - lines 167 to 168"]
B82["B83: instructions - lines 169 to 170"]
B83["B84: instructions - lines 171 to 172"]
B84["B85: instructions - lines 173 to 173"]
B85["B86: DISCO2 - lines 176 to 176"]
B86["B87: instructions - lines 177 to 178"]
B87["B88: instructions - lines 179 to 179"]
B88["B89: instructions - lines 180 to 180"]
B89["B90: instructions - lines 181 to 182"]
B80 -->|call| B121
B80 -->|after return| B81
B81 -->|call| B131
B81 -->|after return| B82
B82 -->|call| B131
B82 -->|after return| B83
B83 -->|call| B131
B83 -->|after return| B84
B84 -->|jump| B36
B85 -->|condition true| B103
B85 -->|condition false| B86
B86 -->|call| B136
B86 -->|after return| B87
B87 -->|call| B123
B87 -->|after return| B88
B88 -->|call| B123
B88 -->|after return| B89
B89 -->|call| B136
B89 -->|after return| B90
B121["Continue at B122 in section 13"]
B131["Continue at B132 in section 14"]
B36["Continue at B37 in section 4"]
B103["Continue at B104 in section 11"]
B136["Continue at B137 in section 14"]
B123["Continue at B124 in section 13"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV R4,33H
ACALL CONV
```

### B82

```asm
MOV A,60H
ACALL WCHR
```

### B83

```asm
MOV A,61H
ACALL WCHR
```

### B84

```asm
MOV A,62H
ACALL WCHR
```

### B85

```asm
AJMP CHECK
```

### B86

```asm
CJNE A,#1H, FREE
```

### B87

```asm
MOV A,#01H
ACALL CMD
```

### B88

```asm
ACALL DELAY
```

### B89

```asm
ACALL DELAY
```

### B90

```asm
MOV A,#80H
ACALL CMD
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 183 to 184"]
B91["B92: instructions - lines 185 to 186"]
B92["B93: instructions - lines 187 to 188"]
B93["B94: instructions - lines 189 to 189"]
B94["B95: instructions - lines 190 to 190"]
B95["B96: instructions - lines 191 to 192"]
B96["B97: instructions - lines 193 to 194"]
B97["B98: instructions - lines 195 to 196"]
B98["B99: instructions - lines 198 to 199"]
B99["B100: instructions - lines 200 to 201"]
B90 -->|call| B142
B90 -->|after return| B91
B91 -->|call| B110
B91 -->|after return| B92
B92 -->|call| B136
B92 -->|after return| B93
B93 -->|call| B123
B93 -->|after return| B94
B94 -->|call| B123
B94 -->|after return| B95
B95 -->|call| B136
B95 -->|after return| B96
B96 -->|call| B142
B96 -->|after return| B97
B97 -->|call| B136
B97 -->|after return| B98
B98 -->|call| B121
B98 -->|after return| B99
B99 -->|call| B131
B99 -->|after return| B100
B142["Continue at B143 in section 15"]
B110["Continue at B111 in section 12"]
B136["Continue at B137 in section 14"]
B123["Continue at B124 in section 13"]
B121["Continue at B122 in section 13"]
B131["Continue at B132 in section 14"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV DPTR,#STR8
ACALL WSTR
```

### B92

```asm
MOV 32H,#2
ACALL COST
```

### B93

```asm
MOV A,#01H
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
MOV A,#80H
ACALL CMD
```

### B97

```asm
MOV DPTR,#STR9
ACALL WSTR
```

### B98

```asm
MOV A,#0C5H
ACALL CMD
```

### B99

```asm
MOV R4,33H
ACALL CONV
```

### B100

```asm
MOV A,60H
ACALL WCHR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 202 to 203"]
B101["B102: instructions - lines 204 to 205"]
B102["B103: instructions - lines 206 to 206"]
B103["B104: FREE - lines 209 to 210"]
B104["B105: instructions - lines 211 to 211"]
B105["B106: instructions - lines 212 to 212"]
B106["B107: instructions - lines 213 to 214"]
B107["B108: instructions - lines 215 to 216"]
B108["B109: instructions - lines 217 to 218"]
B109["B110: instructions - lines 221 to 221"]
B100 -->|call| B131
B100 -->|after return| B101
B101 -->|call| B131
B101 -->|after return| B102
B102 -->|jump| B36
B103 -->|call| B136
B103 -->|after return| B104
B104 -->|call| B123
B104 -->|after return| B105
B105 -->|call| B123
B105 -->|after return| B106
B106 -->|call| B136
B106 -->|after return| B107
B107 -->|call| B142
B107 -->|after return| B108
B108 -->|call| B110
B108 -->|after return| B109
B109 -->|jump| B36
B131["Continue at B132 in section 14"]
B36["Continue at B37 in section 4"]
B136["Continue at B137 in section 14"]
B123["Continue at B124 in section 13"]
B142["Continue at B143 in section 15"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV A,61H
ACALL WCHR
```

### B102

```asm
MOV A,62H
ACALL WCHR
```

### B103

```asm
AJMP CHECK
```

### B104

```asm
MOV A,#01H
ACALL CMD
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
MOV A,#80H
ACALL CMD
```

### B108

```asm
MOV DPTR,#STR6
ACALL WSTR
```

### B109

```asm
MOV 32H,#10
ACALL COST
```

### B110

```asm
AJMP CHECK
```

## Section 12

```mermaid
flowchart TD
B110["B111: COST - lines 226 to 241"]
B111["B112: FLASHING - lines 245 to 246"]
B112["B113: instructions - lines 247 to 248"]
B113["B114: instructions - lines 249 to 249"]
B114["B115: WELCOME - lines 252 to 253"]
B115["B116: instructions - lines 254 to 254"]
B116["B117: instructions - lines 255 to 255"]
B117["B118: instructions - lines 256 to 258"]
B118["B119: instructions - lines 259 to 261"]
B119["B120: instructions - lines 262 to 262"]
B111 -->|call| B123
B111 -->|after return| B112
B112 -->|call| B123
B112 -->|after return| B113
B114 -->|call| B136
B114 -->|after return| B115
B115 -->|call| B123
B115 -->|after return| B116
B116 -->|call| B123
B116 -->|after return| B117
B117 -->|call| B136
B117 -->|after return| B118
B118 -->|call| B142
B118 -->|after return| B119
B119 -->|call| B123
B119 -->|after return| B120
B123["Continue at B124 in section 13"]
B136["Continue at B137 in section 14"]
B142["Continue at B143 in section 15"]
B120["Continue at B121 in section 13"]
```

### B111

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

### B112

```asm
CLR P1.1
ACALL DELAY
```

### B113

```asm
SETB P1.1
ACALL DELAY
```

### B114

Return to the instruction following the active call.

```asm
RET
```

### B115

```asm
MOV A,#01H
ACALL CMD
```

### B116

```asm
ACALL DELAY
```

### B117

```asm
ACALL DELAY
```

### B118

```asm
CLR A
MOV A,#80H
ACALL CMD
```

### B119

```asm
CLR A
MOV DPTR,#STR1
ACALL WSTR
```

### B120

```asm
ACALL DELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 263 to 263"]
B121["B122: CONV - lines 266 to 286"]
B122["B123: INCONV - lines 289 to 302"]
B123["B124: DELAY - lines 305 to 305"]
B124["B125: HH - lines 306 to 306"]
B125["B126: instructions - lines 307 to 307"]
B126["B127: INLCD - lines 311 to 319"]
B127["B128: instructions - lines 321 to 330"]
B128["B129: instructions - lines 332 to 347"]
B129["B130: instructions - lines 349 to 361"]
B123 -->|next| B124
B124 -->|condition true| B124
B124 -->|condition false| B125
B126 -->|call| B123
B126 -->|after return| B127
B127 -->|call| B123
B127 -->|after return| B128
B128 -->|call| B123
B128 -->|after return| B129
B129 -->|call| B123
B129 -->|after return| B130
B130["Continue at B131 in section 14"]
```

### B121

Return to the instruction following the active call.

```asm
RET
```

### B122

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

### B123

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

### B124

```asm
MOV R0, #250
```

### B125

```asm
DJNZ R0, HH
```

### B126

Return to the instruction following the active call.

```asm
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
ACALL DELAY
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
ACALL DELAY
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
ACALL DELAY
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
ACALL DELAY
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 362 to 362"]
B131["B132: WCHR - lines 367 to 371"]
B132["B133: instructions - lines 372 to 372"]
B133["B134: instructions - lines 373 to 375"]
B134["B135: instructions - lines 376 to 376"]
B135["B136: instructions - lines 377 to 379"]
B136["B137: CMD - lines 382 to 384"]
B137["B138: instructions - lines 385 to 385"]
B138["B139: instructions - lines 386 to 388"]
B139["B140: instructions - lines 389 to 389"]
B131 -->|call| B141
B131 -->|after return| B132
B132 -->|call| B123
B132 -->|after return| B133
B133 -->|call| B141
B133 -->|after return| B134
B134 -->|call| B123
B134 -->|after return| B135
B136 -->|call| B141
B136 -->|after return| B137
B137 -->|call| B123
B137 -->|after return| B138
B138 -->|call| B141
B138 -->|after return| B139
B139 -->|call| B123
B139 -->|after return| B140
B141["Continue at B142 in section 15"]
B123["Continue at B124 in section 13"]
B140["Continue at B141 in section 15"]
```

### B131

Return to the instruction following the active call.

```asm
RET
```

### B132

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B133

```asm
ACALL DELAY
```

### B134

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B135

```asm
ACALL DELAY
```

### B136

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B137

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B138

```asm
ACALL DELAY
```

### B139

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B140

```asm
ACALL DELAY
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 390 to 390"]
B141["B142: COMMON - lines 394 to 399"]
B142["B143: WSTR - lines 403 to 403"]
B143["B144: CONT1 - lines 405 to 407"]
B144["B145: PRINT - lines 409 to 409"]
B145["B146: instructions - lines 410 to 411"]
B146["B147: EXIT1 - lines 412 to 413"]
B147["B148: KEYPAD - lines 417 to 417"]
B148["B149: K1 - lines 418 to 421"]
B149["B150: K2 - lines 423 to 425"]
B142 -->|next| B143
B143 -->|condition true| B146
B143 -->|condition false| B144
B144 -->|call| B131
B144 -->|after return| B145
B145 -->|jump| B143
B147 -->|next| B148
B148 -->|condition true| B148
B148 -->|condition false| B149
B149 -->|condition true| B151
B149 -->|condition false| B150
B131["Continue at B132 in section 14"]
B151["Continue at B152 in section 16"]
B150["Continue at B151 in section 16"]
```

### B141

Return to the instruction following the active call.

```asm
RET
```

### B142

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B143

```asm
PUSH    ACC
```

### B144

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B145

```asm
ACALL    WCHR
```

### B146

```asm
INC DPTR
AJMP    CONT1
```

### B147

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B148

```asm
MOV P0,#01110000B
```

### B149

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B150

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 426 to 426"]
B151["B152: OVER1 - lines 428 to 431"]
B152["B153: instructions - lines 432 to 435"]
B153["B154: instructions - lines 436 to 439"]
B154["B155: instructions - lines 440 to 443"]
B155["B156: instructions - lines 444 to 444"]
B156["B157: ROW_0 - lines 445 to 446"]
B157["B158: ROW_1 - lines 447 to 448"]
B158["B159: ROW_2 - lines 449 to 450"]
B159["B160: ROW_3 - lines 451 to 451"]
B150 -->|jump| B149
B151 -->|condition true| B156
B151 -->|condition false| B152
B152 -->|condition true| B157
B152 -->|condition false| B153
B153 -->|condition true| B158
B153 -->|condition false| B154
B154 -->|condition true| B159
B154 -->|condition false| B155
B155 -->|jump| B149
B156 -->|jump| B160
B157 -->|jump| B160
B158 -->|jump| B160
B159 -->|next| B160
B149["Continue at B150 in section 15"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
SJMP K2
```

### B152

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B153

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B154

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B155

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B156

```asm
LJMP K2
```

### B157

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B158

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B159

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B160

```asm
MOV DPTR,#KCODE3
```

## Section 17

```mermaid
flowchart TD
B160["B161: FIND - lines 453 to 453"]
B161["B162: FIND1 - lines 455 to 456"]
B162["B163: instructions - lines 457 to 458"]
B163["B164: MATCH - lines 459 to 461"]
B164["B165: instructions - lines 490 to 490"]
B160 -->|next| B161
B161 -->|condition true| B163
B161 -->|condition false| B162
B162 -->|jump| B161
```

### B161

```asm
RLC A
```

### B162

```asm
RLC A
JNC MATCH
```

### B163

```asm
INC DPTR
SJMP FIND1
```

### B164

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B165

Return to the instruction following the active call.

```asm
RET
```
