# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 4 to 5"]
B2["B3: instructions - lines 7 to 8"]
B3["B4: instructions - lines 9 to 9"]
B4["B5: instructions - lines 10 to 10"]
B5["B6: instructions - lines 12 to 13"]
B6["B7: instructions - lines 14 to 14"]
B7["B8: instructions - lines 16 to 17"]
B8["B9: instructions - lines 18 to 19"]
B9["B10: instructions - lines 20 to 20"]
B0 -->|call| B164
B0 -->|after return| B1
B1 -->|call| B174
B1 -->|after return| B2
B2 -->|call| B180
B2 -->|after return| B3
B3 -->|call| B188
B3 -->|after return| B4
B4 -->|call| B188
B4 -->|after return| B5
B5 -->|call| B174
B5 -->|after return| B6
B6 -->|call| B188
B6 -->|after return| B7
B7 -->|call| B174
B7 -->|after return| B8
B8 -->|call| B180
B8 -->|after return| B9
B9 -->|call| B188
B9 -->|after return| B10
B164["Continue at B165 in section 17"]
B174["Continue at B175 in section 18"]
B180["Continue at B181 in section 19"]
B188["Continue at B189 in section 19"]
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
MOV DPTR,#STR1
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
MOV A,#01H
ACALL CMD
```

### B7

```asm
ACALL DELAY
```

### B8

```asm
MOV A,#80H
ACALL CMD
```

### B9

```asm
MOV DPTR,#STR2
ACALL WSTR
```

### B10

```asm
ACALL DELAY
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 21 to 22"]
B11["B12: instructions - lines 23 to 24"]
B12["B13: instructions - lines 25 to 25"]
B13["B14: instructions - lines 27 to 28"]
B14["B15: instructions - lines 29 to 29"]
B15["B16: instructions - lines 30 to 30"]
B16["B17: instructions - lines 31 to 33"]
B17["B18: instructions - lines 34 to 34"]
B18["B19: instructions - lines 36 to 37"]
B19["B20: instructions - lines 38 to 38"]
B10 -->|call| B174
B10 -->|after return| B11
B11 -->|call| B180
B11 -->|after return| B12
B12 -->|call| B188
B12 -->|after return| B13
B13 -->|call| B174
B13 -->|after return| B14
B14 -->|call| B147
B14 -->|after return| B15
B15 -->|call| B169
B15 -->|after return| B16
B16 -->|call| B188
B16 -->|after return| B17
B17 -->|call| B188
B17 -->|after return| B18
B18 -->|call| B174
B18 -->|after return| B19
B19 -->|call| B188
B19 -->|after return| B20
B174["Continue at B175 in section 18"]
B180["Continue at B181 in section 19"]
B188["Continue at B189 in section 19"]
B147["Continue at B148 in section 15"]
B169["Continue at B170 in section 17"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,#0C0H
ACALL CMD
```

### B12

```asm
MOV DPTR,#STR22
ACALL WSTR
```

### B13

```asm
ACALL DELAY
```

### B14

```asm
MOV A,#0CEH
ACALL CMD
```

### B15

```asm
ACALL KEYPAD
```

### B16

```asm
ACALL WCHR
```

### B17

```asm
ANL A,#0FH
MOV 30H,A
ACALL DELAY
```

### B18

```asm
ACALL DELAY
```

### B19

```asm
MOV A,#01H
ACALL CMD
```

### B20

```asm
ACALL DELAY
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 40 to 41"]
B21["B22: instructions - lines 42 to 43"]
B22["B23: instructions - lines 44 to 44"]
B23["B24: instructions - lines 45 to 46"]
B24["B25: instructions - lines 47 to 48"]
B25["B26: instructions - lines 49 to 49"]
B26["B27: instructions - lines 51 to 52"]
B27["B28: instructions - lines 53 to 53"]
B28["B29: instructions - lines 54 to 54"]
B29["B30: instructions - lines 55 to 57"]
B20 -->|call| B174
B20 -->|after return| B21
B21 -->|call| B180
B21 -->|after return| B22
B22 -->|call| B188
B22 -->|after return| B23
B23 -->|call| B174
B23 -->|after return| B24
B24 -->|call| B180
B24 -->|after return| B25
B25 -->|call| B188
B25 -->|after return| B26
B26 -->|call| B174
B26 -->|after return| B27
B27 -->|call| B147
B27 -->|after return| B28
B28 -->|call| B169
B28 -->|after return| B29
B29 -->|call| B188
B29 -->|after return| B30
B174["Continue at B175 in section 18"]
B180["Continue at B181 in section 19"]
B188["Continue at B189 in section 19"]
B147["Continue at B148 in section 15"]
B169["Continue at B170 in section 17"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A,#80H
ACALL CMD
```

### B22

```asm
MOV DPTR,#STR3
ACALL WSTR
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
MOV DPTR,#STR9
ACALL WSTR
```

### B26

```asm
ACALL DELAY
```

### B27

```asm
MOV A,#0CEH
ACALL CMD
```

### B28

```asm
ACALL KEYPAD
```

### B29

```asm
ACALL WCHR
```

### B30

```asm
ANL A,#0FH
MOV 31H,A
ACALL DELAY
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 58 to 58"]
B31["B32: instructions - lines 62 to 63"]
B32["B33: instructions - lines 64 to 64"]
B33["B34: instructions - lines 66 to 67"]
B34["B35: instructions - lines 68 to 69"]
B35["B36: instructions - lines 70 to 70"]
B36["B37: instructions - lines 71 to 72"]
B37["B38: instructions - lines 73 to 74"]
B38["B39: instructions - lines 75 to 75"]
B39["B40: instructions - lines 77 to 78"]
B30 -->|call| B188
B30 -->|after return| B31
B31 -->|call| B174
B31 -->|after return| B32
B32 -->|call| B188
B32 -->|after return| B33
B33 -->|call| B174
B33 -->|after return| B34
B34 -->|call| B180
B34 -->|after return| B35
B35 -->|call| B188
B35 -->|after return| B36
B36 -->|call| B174
B36 -->|after return| B37
B37 -->|call| B180
B37 -->|after return| B38
B38 -->|call| B188
B38 -->|after return| B39
B39 -->|call| B174
B39 -->|after return| B40
B188["Continue at B189 in section 19"]
B174["Continue at B175 in section 18"]
B180["Continue at B181 in section 19"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL DELAY
```

### B32

```asm
MOV A,#01H
ACALL CMD
```

### B33

```asm
ACALL DELAY
```

### B34

```asm
MOV A,#80H
ACALL CMD
```

### B35

```asm
MOV DPTR,#STR4
ACALL WSTR
```

### B36

```asm
ACALL DELAY
```

### B37

```asm
MOV A,#0C0H
ACALL CMD
```

### B38

```asm
MOV DPTR,#STR9
ACALL WSTR
```

### B39

```asm
ACALL DELAY
```

### B40

```asm
MOV A,#0CEH
ACALL CMD
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 79 to 79"]
B41["B42: instructions - lines 80 to 80"]
B42["B43: instructions - lines 81 to 83"]
B43["B44: instructions - lines 84 to 84"]
B44["B45: instructions - lines 88 to 89"]
B45["B46: instructions - lines 90 to 90"]
B46["B47: instructions - lines 92 to 93"]
B47["B48: instructions - lines 94 to 95"]
B48["B49: instructions - lines 96 to 96"]
B49["B50: instructions - lines 97 to 98"]
B40 -->|call| B147
B40 -->|after return| B41
B41 -->|call| B169
B41 -->|after return| B42
B42 -->|call| B188
B42 -->|after return| B43
B43 -->|call| B188
B43 -->|after return| B44
B44 -->|call| B174
B44 -->|after return| B45
B45 -->|call| B188
B45 -->|after return| B46
B46 -->|call| B174
B46 -->|after return| B47
B47 -->|call| B180
B47 -->|after return| B48
B48 -->|call| B188
B48 -->|after return| B49
B49 -->|call| B174
B49 -->|after return| B50
B147["Continue at B148 in section 15"]
B169["Continue at B170 in section 17"]
B188["Continue at B189 in section 19"]
B174["Continue at B175 in section 18"]
B180["Continue at B181 in section 19"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL KEYPAD
```

### B42

```asm
ACALL WCHR
```

### B43

```asm
ANL A,#0FH
MOV 32H,A
ACALL DELAY
```

### B44

```asm
ACALL DELAY
```

### B45

```asm
MOV A,#01H
ACALL CMD
```

### B46

```asm
ACALL DELAY
```

### B47

```asm
MOV A,#80H
ACALL CMD
```

### B48

```asm
MOV DPTR,#STR5
ACALL WSTR
```

### B49

```asm
ACALL DELAY
```

### B50

```asm
MOV A,#0C0H
ACALL CMD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 99 to 99"]
B51["B52: instructions - lines 101 to 102"]
B52["B53: instructions - lines 103 to 103"]
B53["B54: instructions - lines 104 to 104"]
B54["B55: instructions - lines 105 to 107"]
B55["B56: instructions - lines 108 to 108"]
B56["B57: instructions - lines 113 to 114"]
B57["B58: instructions - lines 115 to 115"]
B58["B59: instructions - lines 117 to 118"]
B59["B60: instructions - lines 119 to 120"]
B50 -->|call| B188
B50 -->|after return| B51
B51 -->|call| B174
B51 -->|after return| B52
B52 -->|call| B147
B52 -->|after return| B53
B53 -->|call| B169
B53 -->|after return| B54
B54 -->|call| B188
B54 -->|after return| B55
B55 -->|call| B188
B55 -->|after return| B56
B56 -->|call| B174
B56 -->|after return| B57
B57 -->|call| B188
B57 -->|after return| B58
B58 -->|call| B174
B58 -->|after return| B59
B59 -->|call| B180
B59 -->|after return| B60
B188["Continue at B189 in section 19"]
B174["Continue at B175 in section 18"]
B147["Continue at B148 in section 15"]
B169["Continue at B170 in section 17"]
B180["Continue at B181 in section 19"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL DELAY
```

### B52

```asm
MOV A,#0C7H
ACALL CMD
```

### B53

```asm
ACALL KEYPAD
```

### B54

```asm
ACALL WCHR
```

### B55

```asm
ANL A,#0FH
MOV 33H,A
ACALL DELAY
```

### B56

```asm
ACALL DELAY
```

### B57

```asm
MOV A,#01H
ACALL CMD
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
MOV DPTR,#STR6
ACALL WSTR
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 121 to 121"]
B61["B62: instructions - lines 122 to 125"]
B62["B63: instructions - lines 126 to 127"]
B63["B64: instructions - lines 128 to 128"]
B64["B65: instructions - lines 130 to 131"]
B65["B66: instructions - lines 132 to 132"]
B66["B67: instructions - lines 133 to 133"]
B67["B68: instructions - lines 134 to 136"]
B68["B69: instructions - lines 137 to 137"]
B69["B70: instructions - lines 139 to 140"]
B60 -->|call| B188
B60 -->|after return| B61
B61 -->|call| B174
B61 -->|after return| B62
B62 -->|call| B180
B62 -->|after return| B63
B63 -->|call| B188
B63 -->|after return| B64
B64 -->|call| B174
B64 -->|after return| B65
B65 -->|call| B147
B65 -->|after return| B66
B66 -->|call| B169
B66 -->|after return| B67
B67 -->|call| B188
B67 -->|after return| B68
B68 -->|call| B188
B68 -->|after return| B69
B69 -->|call| B174
B69 -->|after return| B70
B188["Continue at B189 in section 19"]
B174["Continue at B175 in section 18"]
B180["Continue at B181 in section 19"]
B147["Continue at B148 in section 15"]
B169["Continue at B170 in section 17"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL DELAY
```

### B62

```asm
MOV A,#0C0H
ACALL CMD
```

### B63

```asm
MOV DPTR,#STR9
ACALL WSTR
```

### B64

```asm
ACALL DELAY
```

### B65

```asm
MOV A,#0CEH
ACALL CMD
```

### B66

```asm
ACALL KEYPAD
```

### B67

```asm
ACALL WCHR
```

### B68

```asm
ANL A,#0FH
MOV 34H,A
ACALL DELAY
```

### B69

```asm
ACALL DELAY
```

### B70

```asm
MOV A,#01H
ACALL CMD
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 141 to 141"]
B71["B72: instructions - lines 143 to 144"]
B72["B73: instructions - lines 145 to 145"]
B73["B74: instructions - lines 146 to 146"]
B74["B75: NEXT1 - lines 148 to 148"]
B75["B76: instructions - lines 149 to 149"]
B76["B77: instructions - lines 150 to 150"]
B77["B78: NEXT2 - lines 152 to 152"]
B78["B79: instructions - lines 153 to 153"]
B79["B80: HERE11 - lines 159 to 159"]
B70 -->|call| B188
B70 -->|after return| B71
B71 -->|condition true| B74
B71 -->|condition false| B72
B72 -->|call| B102
B72 -->|after return| B73
B73 -->|jump| B79
B74 -->|condition true| B77
B74 -->|condition false| B75
B75 -->|call| B117
B75 -->|after return| B76
B76 -->|jump| B79
B77 -->|call| B132
B77 -->|after return| B78
B78 -->|jump| B79
B79 -->|call| B188
B79 -->|after return| B80
B188["Continue at B189 in section 19"]
B102["Continue at B103 in section 11"]
B117["Continue at B118 in section 12"]
B132["Continue at B133 in section 14"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL DELAY
```

### B72

```asm
MOV A,30H
CJNE A,#1,NEXT1
```

### B73

```asm
ACALL CAT1
```

### B74

```asm
AJMP HERE11
```

### B75

```asm
CJNE A,#2,NEXT2
```

### B76

```asm
ACALL CAT2
```

### B77

```asm
AJMP HERE11
```

### B78

```asm
ACALL CAT3
```

### B79

```asm
AJMP HERE11
```

### B80

```asm
ACALL DELAY
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 160 to 160"]
B81["B82: instructions - lines 161 to 162"]
B82["B83: instructions - lines 163 to 163"]
B83["B84: instructions - lines 165 to 166"]
B84["B85: instructions - lines 167 to 167"]
B85["B86: instructions - lines 168 to 169"]
B86["B87: instructions - lines 171 to 171"]
B87["B88: instructions - lines 172 to 173"]
B88["B89: instructions - lines 174 to 180"]
B89["B90: instructions - lines 182 to 188"]
B80 -->|call| B188
B80 -->|after return| B81
B81 -->|call| B174
B81 -->|after return| B82
B82 -->|call| B188
B82 -->|after return| B83
B83 -->|call| B174
B83 -->|after return| B84
B84 -->|call| B188
B84 -->|after return| B85
B85 -->|call| B180
B85 -->|after return| B86
B86 -->|call| B188
B86 -->|after return| B87
B87 -->|call| B174
B87 -->|after return| B88
B88 -->|call| B169
B88 -->|after return| B89
B89 -->|call| B169
B89 -->|after return| B90
B188["Continue at B189 in section 19"]
B174["Continue at B175 in section 18"]
B180["Continue at B181 in section 19"]
B169["Continue at B170 in section 17"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL DELAY
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
MOV A,#80H
ACALL CMD
```

### B85

```asm
ACALL DELAY
```

### B86

```asm
MOV DPTR,#STR7
ACALL WSTR
```

### B87

```asm
ACALL DELAY
```

### B88

```asm
MOV A,#0C4H
ACALL CMD
```

### B89

```asm
MOV A,35H
MOV B,#10
DIV AB
MOV R3,A
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B90

```asm
MOV B,#10
MOV A,R3
DIV AB
MOV R3,A
MOV A,B
ADD A,#30H
ACALL WCHR
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 189 to 191"]
B91["B92: instructions - lines 192 to 192"]
B92["B93: instructions - lines 193 to 193"]
B93["B94: instructions - lines 194 to 194"]
B94["B95: instructions - lines 195 to 195"]
B95["B96: instructions - lines 196 to 196"]
B96["B97: instructions - lines 198 to 199"]
B97["B98: instructions - lines 200 to 200"]
B98["B99: instructions - lines 202 to 203"]
B99["B100: instructions - lines 204 to 205"]
B90 -->|call| B169
B90 -->|after return| B91
B91 -->|call| B188
B91 -->|after return| B92
B92 -->|call| B188
B92 -->|after return| B93
B93 -->|call| B188
B93 -->|after return| B94
B94 -->|call| B188
B94 -->|after return| B95
B95 -->|call| B188
B95 -->|after return| B96
B96 -->|call| B174
B96 -->|after return| B97
B97 -->|call| B188
B97 -->|after return| B98
B98 -->|call| B174
B98 -->|after return| B99
B99 -->|call| B180
B99 -->|after return| B100
B169["Continue at B170 in section 17"]
B188["Continue at B189 in section 19"]
B174["Continue at B175 in section 18"]
B180["Continue at B181 in section 19"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV A,R3
ADD A,#30H
ACALL WCHR
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
ACALL DELAY
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
MOV A,#01H
ACALL CMD
```

### B98

```asm
ACALL DELAY
```

### B99

```asm
MOV A,#80H
ACALL CMD
```

### B100

```asm
MOV DPTR,#STR8
ACALL WSTR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 206 to 206"]
B101["B102: H123 - lines 207 to 207"]
B102["B103: CAT1 - lines 212 to 213"]
B103["B104: instructions - lines 214 to 215"]
B104["B105: instructions - lines 216 to 218"]
B105["B106: instructions - lines 219 to 219"]
B106["B107: CONT - lines 221 to 222"]
B107["B108: instructions - lines 223 to 224"]
B108["B109: instructions - lines 225 to 226"]
B109["B110: instructions - lines 227 to 227"]
B100 -->|call| B188
B100 -->|after return| B101
B101 -->|jump| B101
B102 -->|call| B188
B102 -->|after return| B103
B103 -->|call| B188
B103 -->|after return| B104
B104 -->|condition true| B106
B104 -->|condition false| B105
B105 -->|next| B106
B106 -->|call| B188
B106 -->|after return| B107
B107 -->|call| B188
B107 -->|after return| B108
B108 -->|condition true| B110
B108 -->|condition false| B109
B109 -->|next| B110
B188["Continue at B189 in section 19"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL DELAY
```

### B102

```asm
SJMP H123
```

### B103

```asm
CLR P1.0
ACALL DELAY
```

### B104

```asm
SETB P1.0
ACALL DELAY
```

### B105

```asm
MOV A,#38
MOV R0,31H
CJNE R0,#1,CONT
```

### B106

```asm
ADD A,#8
```

### B107

```asm
CLR P1.0
ACALL DELAY
```

### B108

```asm
SETB P1.0
ACALL DELAY
```

### B109

```asm
MOV R0,32H
CJNE R0,#1,CONT2
```

### B110

```asm
ADD A,#10
```

## Section 12

```mermaid
flowchart TD
B110["B111: CONT2 - lines 229 to 230"]
B111["B112: instructions - lines 231 to 232"]
B112["B113: instructions - lines 234 to 237"]
B113["B114: instructions - lines 238 to 238"]
B114["B115: CONT3 - lines 240 to 242"]
B115["B116: instructions - lines 243 to 244"]
B116["B117: instructions - lines 246 to 246"]
B117["B118: CAT2 - lines 248 to 249"]
B118["B119: instructions - lines 250 to 251"]
B119["B120: instructions - lines 252 to 254"]
B110 -->|call| B188
B110 -->|after return| B111
B111 -->|call| B188
B111 -->|after return| B112
B112 -->|condition true| B114
B112 -->|condition false| B113
B113 -->|next| B114
B114 -->|call| B188
B114 -->|after return| B115
B115 -->|call| B188
B115 -->|after return| B116
B117 -->|call| B188
B117 -->|after return| B118
B118 -->|call| B188
B118 -->|after return| B119
B119 -->|condition true| B121
B119 -->|condition false| B120
B188["Continue at B189 in section 19"]
B121["Continue at B122 in section 13"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
CLR P1.0
ACALL DELAY
```

### B112

```asm
SETB P1.0
ACALL DELAY
```

### B113

```asm
MOV B,33H
MUL AB
MOV R0,34H
CJNE R0,#1,CONT3
```

### B114

```asm
SUBB A, #5
```

### B115

```asm
MOV 35H,A
CLR P1.0
ACALL DELAY
```

### B116

```asm
SETB P1.0
ACALL DELAY
```

### B117

Return to the instruction following the active call.

```asm
RET
```

### B118

```asm
CLR P1.1
ACALL DELAY
```

### B119

```asm
SETB P1.1
ACALL DELAY
```

### B120

```asm
MOV A,#45
MOV R0,31H
CJNE R0,#1,CONTT
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 255 to 255"]
B121["B122: CONTT - lines 257 to 258"]
B122["B123: instructions - lines 259 to 260"]
B123["B124: instructions - lines 261 to 262"]
B124["B125: instructions - lines 263 to 263"]
B125["B126: CONTT2 - lines 265 to 266"]
B126["B127: instructions - lines 267 to 268"]
B127["B128: instructions - lines 270 to 273"]
B128["B129: instructions - lines 274 to 274"]
B129["B130: CONTT3 - lines 276 to 278"]
B120 -->|next| B121
B121 -->|call| B188
B121 -->|after return| B122
B122 -->|call| B188
B122 -->|after return| B123
B123 -->|condition true| B125
B123 -->|condition false| B124
B124 -->|next| B125
B125 -->|call| B188
B125 -->|after return| B126
B126 -->|call| B188
B126 -->|after return| B127
B127 -->|condition true| B129
B127 -->|condition false| B128
B128 -->|next| B129
B129 -->|call| B188
B129 -->|after return| B130
B188["Continue at B189 in section 19"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
ADD A,#10
```

### B122

```asm
CLR P1.1
ACALL DELAY
```

### B123

```asm
SETB P1.1
ACALL DELAY
```

### B124

```asm
MOV R0,32H
CJNE R0,#1,CONTT2
```

### B125

```asm
ADD A,#15
```

### B126

```asm
CLR P1.1
ACALL DELAY
```

### B127

```asm
SETB P1.1
ACALL DELAY
```

### B128

```asm
MOV B,33H
MUL AB
MOV R0,34H
CJNE R0,#1,CONTT3
```

### B129

```asm
SUBB A, #8
```

### B130

```asm
MOV 35H,A
CLR P1.1
ACALL DELAY
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 279 to 280"]
B131["B132: instructions - lines 282 to 282"]
B132["B133: CAT3 - lines 284 to 285"]
B133["B134: instructions - lines 286 to 287"]
B134["B135: instructions - lines 288 to 290"]
B135["B136: instructions - lines 291 to 291"]
B136["B137: CONTTT - lines 293 to 294"]
B137["B138: instructions - lines 295 to 296"]
B138["B139: instructions - lines 297 to 298"]
B139["B140: instructions - lines 299 to 299"]
B130 -->|call| B188
B130 -->|after return| B131
B132 -->|call| B188
B132 -->|after return| B133
B133 -->|call| B188
B133 -->|after return| B134
B134 -->|condition true| B136
B134 -->|condition false| B135
B135 -->|next| B136
B136 -->|call| B188
B136 -->|after return| B137
B137 -->|call| B188
B137 -->|after return| B138
B138 -->|condition true| B140
B138 -->|condition false| B139
B139 -->|next| B140
B188["Continue at B189 in section 19"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
SETB P1.1
ACALL DELAY
```

### B132

Return to the instruction following the active call.

```asm
RET
```

### B133

```asm
CLR P1.2
ACALL DELAY
```

### B134

```asm
SETB P1.2
ACALL DELAY
```

### B135

```asm
MOV A,#66
MOV R0,31H
CJNE R0,#1,CONTTT
```

### B136

```asm
ADD A,#12
```

### B137

```asm
CLR P1.2
ACALL DELAY
```

### B138

```asm
SETB P1.2
ACALL DELAY
```

### B139

```asm
MOV R0,32H
CJNE R0,#1,CONTTT2
```

### B140

```asm
ADD A,#18
```

## Section 15

```mermaid
flowchart TD
B140["B141: CONTTT2 - lines 301 to 302"]
B141["B142: instructions - lines 303 to 304"]
B142["B143: instructions - lines 306 to 309"]
B143["B144: instructions - lines 310 to 310"]
B144["B145: CONTTT3 - lines 312 to 314"]
B145["B146: instructions - lines 315 to 316"]
B146["B147: instructions - lines 317 to 317"]
B147["B148: KEYPAD - lines 323 to 323"]
B148["B149: K1 - lines 324 to 327"]
B149["B150: K2 - lines 329 to 331"]
B140 -->|call| B188
B140 -->|after return| B141
B141 -->|call| B188
B141 -->|after return| B142
B142 -->|condition true| B144
B142 -->|condition false| B143
B143 -->|next| B144
B144 -->|call| B188
B144 -->|after return| B145
B145 -->|call| B188
B145 -->|after return| B146
B147 -->|next| B148
B148 -->|condition true| B148
B148 -->|condition false| B149
B149 -->|condition true| B151
B149 -->|condition false| B150
B188["Continue at B189 in section 19"]
B151["Continue at B152 in section 16"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
CLR P1.2
ACALL DELAY
```

### B142

```asm
SETB P1.2
ACALL DELAY
```

### B143

```asm
MOV B,33H
MUL AB
MOV R0,34H
CJNE R0,#1,CONTTT3
```

### B144

```asm
SUBB A, #15
```

### B145

```asm
MOV 35H,A
CLR P1.2
ACALL DELAY
```

### B146

```asm
SETB P1.2
ACALL DELAY
```

### B147

Return to the instruction following the active call.

```asm
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
B150["B151: instructions - lines 332 to 332"]
B151["B152: OVER1 - lines 335 to 338"]
B152["B153: instructions - lines 339 to 342"]
B153["B154: instructions - lines 343 to 346"]
B154["B155: instructions - lines 347 to 350"]
B155["B156: instructions - lines 351 to 351"]
B156["B157: ROW_0 - lines 352 to 353"]
B157["B158: ROW_1 - lines 354 to 355"]
B158["B159: ROW_2 - lines 356 to 357"]
B159["B160: ROW_3 - lines 358 to 358"]
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
B160["B161: FIND - lines 361 to 361"]
B161["B162: FIND1 - lines 363 to 364"]
B162["B163: instructions - lines 365 to 366"]
B163["B164: MATCH - lines 367 to 369"]
B164["B165: INLCD - lines 373 to 381"]
B165["B166: instructions - lines 383 to 392"]
B166["B167: instructions - lines 394 to 409"]
B167["B168: instructions - lines 411 to 423"]
B168["B169: instructions - lines 424 to 424"]
B169["B170: WCHR - lines 429 to 433"]
B160 -->|next| B161
B161 -->|condition true| B163
B161 -->|condition false| B162
B162 -->|jump| B161
B164 -->|call| B185
B164 -->|after return| B165
B165 -->|call| B185
B165 -->|after return| B166
B166 -->|call| B185
B166 -->|after return| B167
B167 -->|call| B185
B167 -->|after return| B168
B169 -->|call| B179
B169 -->|after return| B170
B185["Continue at B186 in section 19"]
B179["Continue at B180 in section 18"]
B170["Continue at B171 in section 18"]
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

### B166

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

### B167

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

### B168

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

### B169

Return to the instruction following the active call.

```asm
RET
```

### B170

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 434 to 434"]
B171["B172: instructions - lines 435 to 437"]
B172["B173: instructions - lines 438 to 438"]
B173["B174: instructions - lines 439 to 441"]
B174["B175: CMD - lines 444 to 446"]
B175["B176: instructions - lines 447 to 447"]
B176["B177: instructions - lines 448 to 450"]
B177["B178: instructions - lines 451 to 451"]
B178["B179: instructions - lines 452 to 452"]
B179["B180: COMMON - lines 456 to 461"]
B170 -->|call| B185
B170 -->|after return| B171
B171 -->|call| B179
B171 -->|after return| B172
B172 -->|call| B185
B172 -->|after return| B173
B174 -->|call| B179
B174 -->|after return| B175
B175 -->|call| B185
B175 -->|after return| B176
B176 -->|call| B179
B176 -->|after return| B177
B177 -->|call| B185
B177 -->|after return| B178
B185["Continue at B186 in section 19"]
```

### B171

```asm
ACALL LDELAY
```

### B172

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B173

```asm
ACALL LDELAY
```

### B174

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B175

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B176

```asm
ACALL LDELAY
```

### B177

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B178

```asm
ACALL LDELAY
```

### B179

Return to the instruction following the active call.

```asm
RET
```

### B180

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

## Section 19

```mermaid
flowchart TD
B180["B181: WSTR - lines 465 to 465"]
B181["B182: CONT1 - lines 467 to 469"]
B182["B183: PRINT - lines 471 to 471"]
B183["B184: instructions - lines 472 to 473"]
B184["B185: EXIT1 - lines 474 to 475"]
B185["B186: LDELAY - lines 479 to 479"]
B186["B187: HH - lines 480 to 480"]
B187["B188: instructions - lines 481 to 481"]
B188["B189: DELAY - lines 483 to 483"]
B189["B190: HE - lines 484 to 484"]
B180 -->|next| B181
B181 -->|condition true| B184
B181 -->|condition false| B182
B182 -->|call| B169
B182 -->|after return| B183
B183 -->|jump| B181
B185 -->|next| B186
B186 -->|condition true| B186
B186 -->|condition false| B187
B188 -->|next| B189
B189 -->|next| B190
B169["Continue at B170 in section 17"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
PUSH    ACC
```

### B182

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B183

```asm
ACALL    WCHR
```

### B184

```asm
INC DPTR
AJMP    CONT1
```

### B185

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B186

```asm
MOV R6, #50
```

### B187

```asm
DJNZ R0,HH
```

### B188

Return to the instruction following the active call.

```asm
RET
```

### B189

```asm
MOV R6, #50
```

### B190

```asm
MOV R7,#10
```

## Section 20

```mermaid
flowchart TD
B190["B191: HE1 - lines 485 to 485"]
B191["B192: instructions - lines 486 to 486"]
B192["B193: instructions - lines 487 to 487"]
B190 -->|condition true| B190
B190 -->|condition false| B191
B191 -->|condition true| B189
B191 -->|condition false| B192
B189["Continue at B190 in section 19"]
```

### B191

```asm
DJNZ R7, HE1
```

### B192

```asm
DJNZ R0,HE
```

### B193

Return to the instruction following the active call.

```asm
RET
```
