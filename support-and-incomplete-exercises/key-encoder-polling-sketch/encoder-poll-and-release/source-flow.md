# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 7 to 7"]
B1["B2: instructions - lines 8 to 11"]
B2["B3: instructions - lines 12 to 15"]
B3["B4: LP - lines 17 to 17"]
B4["B5: instructions - lines 18 to 18"]
B5["B6: LP2 - lines 20 to 20"]
B6["B7: instructions - lines 21 to 21"]
B7["B8: SEND - lines 25 to 25"]
B8["B9: HERE - lines 26 to 26"]
B9["B10: instructions - lines 27 to 28"]
B0 -->|call| B143
B0 -->|after return| B1
B1 -->|call| B10
B1 -->|after return| B2
B2 -->|next| B3
B3 -->|condition true| B3
B3 -->|condition false| B4
B4 -->|call| B17
B4 -->|after return| B5
B5 -->|condition true| B5
B5 -->|condition false| B6
B6 -->|jump| B3
B7 -->|next| B8
B8 -->|condition true| B8
B8 -->|condition false| B9
B143["Continue at B144 in section 15"]
B10["Continue at B11 in section 2"]
B17["Continue at B18 in section 2"]
```

### B1

```asm
ACALL LCD_INI
```

### B2

```asm
MOV P1,#0FFH
SETB DAV
MOV A,#80H
ACALL WRCMD40
```

### B3

```asm
MOV TMOD ,#20H
MOV TH1,#-3
MOV SCON,#50H
SETB TR1
```

### B4

```asm
JNB DAV,LP
```

### B5

```asm
ACALL KEY
```

### B6

```asm
JB DAV,LP2
```

### B7

```asm
AJMP LP
```

### B8

```asm
MOV SBUF,A
```

### B9

```asm
JNB TI,HERE
```

### B10

Return to the instruction following the active call.

```asm
CLR TI
RET
```

## Section 2

```mermaid
flowchart TD
B10["B11: WRCMD40 - lines 31 to 35"]
B11["B12: instructions - lines 36 to 36"]
B12["B13: WT40 - lines 39 to 39"]
B13["B14: WT - lines 40 to 40"]
B14["B15: instructions - lines 41 to 41"]
B15["B16: WRDATA - lines 44 to 48"]
B16["B17: instructions - lines 49 to 49"]
B17["B18: KEY - lines 52 to 57"]
B18["B19: instructions - lines 58 to 58"]
B19["B20: CONV - lines 60 to 60"]
B10 -->|call| B12
B10 -->|after return| B11
B12 -->|next| B13
B13 -->|condition true| B13
B13 -->|condition false| B14
B15 -->|call| B12
B15 -->|after return| B16
B17 -->|call| B19
B17 -->|after return| B18
B19 -->|condition true| B29
B19 -->|condition false| B20
B29["Continue at B30 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WT40
```

### B12

Return to the instruction following the active call.

```asm
RET
```

### B13

```asm
MOV R0,#19
```

### B14

```asm
DJNZ R0,WT
```

### B15

Return to the instruction following the active call.

```asm
RET
```

### B16

```asm
MOV P2,A
SETB RS
SETB E
CLR E
ACALL WT40
```

### B17

Return to the instruction following the active call.

```asm
RET
```

### B18

```asm
CLR OE
NOP
MOV A,P1
SETB OE
ANL A,#0FH
ACALL CONV
```

### B19

Return to the instruction following the active call.

```asm
RET
```

### B20

```asm
cjne A, #0, k1
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 61 to 63"]
B21["B22: instructions - lines 64 to 65"]
B22["B23: instructions - lines 66 to 67"]
B23["B24: instructions - lines 68 to 68"]
B24["B25: instructions - lines 69 to 70"]
B25["B26: instructions - lines 71 to 71"]
B26["B27: instructions - lines 72 to 73"]
B27["B28: instructions - lines 74 to 74"]
B28["B29: instructions - lines 75 to 75"]
B29["B30: K1 - lines 77 to 77"]
B20 -->|call| B153
B20 -->|after return| B21
B21 -->|call| B7
B21 -->|after return| B22
B22 -->|call| B7
B22 -->|after return| B23
B23 -->|call| B15
B23 -->|after return| B24
B24 -->|call| B7
B24 -->|after return| B25
B25 -->|call| B15
B25 -->|after return| B26
B26 -->|call| B7
B26 -->|after return| B27
B27 -->|call| B15
B27 -->|after return| B28
B28 -->|jump| B142
B29 -->|condition true| B39
B29 -->|condition false| B30
B153["Continue at B154 in section 16"]
B7["Continue at B8 in section 1"]
B15["Continue at B16 in section 2"]
B142["Continue at B143 in section 15"]
B39["Continue at B40 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
mov A, #'1'
MOV A,#1
ACALL WRCMD
```

### B22

```asm
MOV A,#0DH
ACALL SEND
```

### B23

```asm
MOV A,#'o'
ACALL SEND
```

### B24

```asm
ACALL WRDATA
```

### B25

```asm
MOV A,#'n'
ACALL SEND
```

### B26

```asm
ACALL WRDATA
```

### B27

```asm
MOV A,#'e'
ACALL SEND
```

### B28

```asm
ACALL WRDATA
```

### B29

```asm
jmp got_it
```

### B30

```asm
cjne A, #1, k2
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 78 to 80"]
B31["B32: instructions - lines 81 to 82"]
B32["B33: instructions - lines 83 to 84"]
B33["B34: instructions - lines 85 to 85"]
B34["B35: instructions - lines 86 to 87"]
B35["B36: instructions - lines 88 to 88"]
B36["B37: instructions - lines 89 to 90"]
B37["B38: instructions - lines 91 to 91"]
B38["B39: instructions - lines 93 to 93"]
B39["B40: K2 - lines 95 to 95"]
B30 -->|call| B153
B30 -->|after return| B31
B31 -->|call| B7
B31 -->|after return| B32
B32 -->|call| B7
B32 -->|after return| B33
B33 -->|call| B15
B33 -->|after return| B34
B34 -->|call| B7
B34 -->|after return| B35
B35 -->|call| B15
B35 -->|after return| B36
B36 -->|call| B7
B36 -->|after return| B37
B37 -->|call| B15
B37 -->|after return| B38
B38 -->|jump| B142
B39 -->|condition true| B53
B39 -->|condition false| B40
B153["Continue at B154 in section 16"]
B7["Continue at B8 in section 1"]
B15["Continue at B16 in section 2"]
B142["Continue at B143 in section 15"]
B53["Continue at B54 in section 6"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
mov A, #'2'
MOV A,#1
ACALL WRCMD
```

### B32

```asm
MOV A,#0DH
ACALL SEND
```

### B33

```asm
MOV A,#'t'
ACALL SEND
```

### B34

```asm
ACALL WRDATA
```

### B35

```asm
MOV A,#'o'
ACALL SEND
```

### B36

```asm
ACALL WRDATA
```

### B37

```asm
MOV A,#'w'
ACALL SEND
```

### B38

```asm
ACALL WRDATA
```

### B39

```asm
jmp got_it
```

### B40

```asm
cjne A, #2, k4
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 96 to 98"]
B41["B42: instructions - lines 99 to 100"]
B42["B43: instructions - lines 101 to 102"]
B43["B44: instructions - lines 103 to 103"]
B44["B45: instructions - lines 104 to 105"]
B45["B46: instructions - lines 106 to 106"]
B46["B47: instructions - lines 107 to 108"]
B47["B48: instructions - lines 109 to 109"]
B48["B49: instructions - lines 110 to 111"]
B49["B50: instructions - lines 112 to 112"]
B40 -->|call| B153
B40 -->|after return| B41
B41 -->|call| B7
B41 -->|after return| B42
B42 -->|call| B7
B42 -->|after return| B43
B43 -->|call| B15
B43 -->|after return| B44
B44 -->|call| B7
B44 -->|after return| B45
B45 -->|call| B15
B45 -->|after return| B46
B46 -->|call| B7
B46 -->|after return| B47
B47 -->|call| B15
B47 -->|after return| B48
B48 -->|call| B7
B48 -->|after return| B49
B49 -->|call| B15
B49 -->|after return| B50
B153["Continue at B154 in section 16"]
B7["Continue at B8 in section 1"]
B15["Continue at B16 in section 2"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
mov A, #'3'
MOV A,#1
ACALL WRCMD
```

### B42

```asm
MOV A,#0DH
ACALL SEND
```

### B43

```asm
MOV A,#'t'
ACALL SEND
```

### B44

```asm
ACALL WRDATA
```

### B45

```asm
MOV A,#'h'
ACALL SEND
```

### B46

```asm
ACALL WRDATA
```

### B47

```asm
MOV A,#'r'
ACALL SEND
```

### B48

```asm
ACALL WRDATA
```

### B49

```asm
MOV A,#'e'
ACALL SEND
```

### B50

```asm
ACALL WRDATA
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 113 to 114"]
B51["B52: instructions - lines 115 to 115"]
B52["B53: instructions - lines 116 to 116"]
B53["B54: K4 - lines 118 to 118"]
B54["B55: instructions - lines 119 to 121"]
B55["B56: instructions - lines 122 to 123"]
B56["B57: instructions - lines 124 to 125"]
B57["B58: instructions - lines 126 to 126"]
B58["B59: instructions - lines 127 to 128"]
B59["B60: instructions - lines 129 to 129"]
B50 -->|call| B7
B50 -->|after return| B51
B51 -->|call| B15
B51 -->|after return| B52
B52 -->|jump| B142
B53 -->|condition true| B65
B53 -->|condition false| B54
B54 -->|call| B153
B54 -->|after return| B55
B55 -->|call| B7
B55 -->|after return| B56
B56 -->|call| B7
B56 -->|after return| B57
B57 -->|call| B15
B57 -->|after return| B58
B58 -->|call| B7
B58 -->|after return| B59
B59 -->|call| B15
B59 -->|after return| B60
B7["Continue at B8 in section 1"]
B15["Continue at B16 in section 2"]
B142["Continue at B143 in section 15"]
B65["Continue at B66 in section 7"]
B153["Continue at B154 in section 16"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV A,#'e'
ACALL SEND
```

### B52

```asm
ACALL WRDATA
```

### B53

```asm
jmp got_it
```

### B54

```asm
cjne A, #4, k5
```

### B55

```asm
mov A, #'4'
MOV A,#1
ACALL WRCMD
```

### B56

```asm
MOV A,#0DH
ACALL SEND
```

### B57

```asm
MOV A,#'f'
ACALL SEND
```

### B58

```asm
ACALL WRDATA
```

### B59

```asm
MOV A,#'o'
ACALL SEND
```

### B60

```asm
ACALL WRDATA
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 130 to 131"]
B61["B62: instructions - lines 132 to 132"]
B62["B63: instructions - lines 133 to 134"]
B63["B64: instructions - lines 135 to 135"]
B64["B65: instructions - lines 136 to 136"]
B65["B66: K5 - lines 138 to 138"]
B66["B67: instructions - lines 139 to 141"]
B67["B68: instructions - lines 142 to 143"]
B68["B69: instructions - lines 144 to 145"]
B69["B70: instructions - lines 146 to 146"]
B60 -->|call| B7
B60 -->|after return| B61
B61 -->|call| B15
B61 -->|after return| B62
B62 -->|call| B7
B62 -->|after return| B63
B63 -->|call| B15
B63 -->|after return| B64
B64 -->|jump| B142
B65 -->|condition true| B77
B65 -->|condition false| B66
B66 -->|call| B153
B66 -->|after return| B67
B67 -->|call| B7
B67 -->|after return| B68
B68 -->|call| B7
B68 -->|after return| B69
B69 -->|call| B15
B69 -->|after return| B70
B7["Continue at B8 in section 1"]
B15["Continue at B16 in section 2"]
B142["Continue at B143 in section 15"]
B77["Continue at B78 in section 8"]
B153["Continue at B154 in section 16"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,#'u'
ACALL SEND
```

### B62

```asm
ACALL WRDATA
```

### B63

```asm
MOV A,#'r'
ACALL SEND
```

### B64

```asm
ACALL WRDATA
```

### B65

```asm
jmp got_it
```

### B66

```asm
cjne A, #5, k6
```

### B67

```asm
mov A, #'5'
MOV A,#1
ACALL WRCMD
```

### B68

```asm
MOV A,#0DH
ACALL SEND
```

### B69

```asm
MOV A,#'f'
ACALL SEND
```

### B70

```asm
ACALL WRDATA
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 147 to 148"]
B71["B72: instructions - lines 149 to 149"]
B72["B73: instructions - lines 150 to 151"]
B73["B74: instructions - lines 152 to 152"]
B74["B75: instructions - lines 153 to 154"]
B75["B76: instructions - lines 155 to 155"]
B76["B77: instructions - lines 156 to 156"]
B77["B78: K6 - lines 158 to 158"]
B78["B79: instructions - lines 159 to 161"]
B79["B80: instructions - lines 162 to 163"]
B70 -->|call| B7
B70 -->|after return| B71
B71 -->|call| B15
B71 -->|after return| B72
B72 -->|call| B7
B72 -->|after return| B73
B73 -->|call| B15
B73 -->|after return| B74
B74 -->|call| B7
B74 -->|after return| B75
B75 -->|call| B15
B75 -->|after return| B76
B76 -->|jump| B142
B77 -->|condition true| B87
B77 -->|condition false| B78
B78 -->|call| B153
B78 -->|after return| B79
B79 -->|call| B7
B79 -->|after return| B80
B7["Continue at B8 in section 1"]
B15["Continue at B16 in section 2"]
B142["Continue at B143 in section 15"]
B87["Continue at B88 in section 9"]
B153["Continue at B154 in section 16"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV A,#'i'
ACALL SEND
```

### B72

```asm
ACALL WRDATA
```

### B73

```asm
MOV A,#'v'
ACALL SEND
```

### B74

```asm
ACALL WRDATA
```

### B75

```asm
MOV A,#'e'
ACALL SEND
```

### B76

```asm
ACALL WRDATA
```

### B77

```asm
jmp got_it
```

### B78

```asm
cjne A, #6, k8
```

### B79

```asm
mov A, #'6'
MOV A,#1
ACALL WRCMD
```

### B80

```asm
MOV A,#0DH
ACALL SEND
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 164 to 165"]
B81["B82: instructions - lines 166 to 166"]
B82["B83: instructions - lines 167 to 168"]
B83["B84: instructions - lines 169 to 169"]
B84["B85: instructions - lines 170 to 171"]
B85["B86: instructions - lines 172 to 172"]
B86["B87: instructions - lines 173 to 173"]
B87["B88: K8 - lines 175 to 175"]
B88["B89: instructions - lines 176 to 178"]
B89["B90: instructions - lines 179 to 180"]
B80 -->|call| B7
B80 -->|after return| B81
B81 -->|call| B15
B81 -->|after return| B82
B82 -->|call| B7
B82 -->|after return| B83
B83 -->|call| B15
B83 -->|after return| B84
B84 -->|call| B7
B84 -->|after return| B85
B85 -->|call| B15
B85 -->|after return| B86
B86 -->|jump| B142
B87 -->|condition true| B101
B87 -->|condition false| B88
B88 -->|call| B153
B88 -->|after return| B89
B89 -->|call| B7
B89 -->|after return| B90
B7["Continue at B8 in section 1"]
B15["Continue at B16 in section 2"]
B142["Continue at B143 in section 15"]
B101["Continue at B102 in section 11"]
B153["Continue at B154 in section 16"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV A,#'s'
ACALL SEND
```

### B82

```asm
ACALL WRDATA
```

### B83

```asm
MOV A,#'i'
ACALL SEND
```

### B84

```asm
ACALL WRDATA
```

### B85

```asm
MOV A,#'x'
ACALL SEND
```

### B86

```asm
ACALL WRDATA
```

### B87

```asm
jmp got_it
```

### B88

```asm
cjne A, #8, k9
```

### B89

```asm
mov A, #'7'
MOV A,#1
ACALL WRCMD
```

### B90

```asm
MOV A,#0DH
ACALL SEND
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 181 to 182"]
B91["B92: instructions - lines 183 to 183"]
B92["B93: instructions - lines 184 to 185"]
B93["B94: instructions - lines 186 to 186"]
B94["B95: instructions - lines 187 to 188"]
B95["B96: instructions - lines 189 to 189"]
B96["B97: instructions - lines 190 to 191"]
B97["B98: instructions - lines 192 to 192"]
B98["B99: instructions - lines 193 to 194"]
B99["B100: instructions - lines 195 to 195"]
B90 -->|call| B7
B90 -->|after return| B91
B91 -->|call| B15
B91 -->|after return| B92
B92 -->|call| B7
B92 -->|after return| B93
B93 -->|call| B15
B93 -->|after return| B94
B94 -->|call| B7
B94 -->|after return| B95
B95 -->|call| B15
B95 -->|after return| B96
B96 -->|call| B7
B96 -->|after return| B97
B97 -->|call| B15
B97 -->|after return| B98
B98 -->|call| B7
B98 -->|after return| B99
B99 -->|call| B15
B99 -->|after return| B100
B7["Continue at B8 in section 1"]
B15["Continue at B16 in section 2"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV A,#'s'
ACALL SEND
```

### B92

```asm
ACALL WRDATA
```

### B93

```asm
MOV A,#'e'
ACALL SEND
```

### B94

```asm
ACALL WRDATA
```

### B95

```asm
MOV A,#'v'
ACALL SEND
```

### B96

```asm
ACALL WRDATA
```

### B97

```asm
MOV A,#'e'
ACALL SEND
```

### B98

```asm
ACALL WRDATA
```

### B99

```asm
MOV A,#'n'
ACALL SEND
```

### B100

```asm
ACALL WRDATA
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 196 to 196"]
B101["B102: K9 - lines 198 to 198"]
B102["B103: instructions - lines 199 to 201"]
B103["B104: instructions - lines 202 to 203"]
B104["B105: instructions - lines 204 to 205"]
B105["B106: instructions - lines 206 to 206"]
B106["B107: instructions - lines 207 to 208"]
B107["B108: instructions - lines 209 to 209"]
B108["B109: instructions - lines 210 to 211"]
B109["B110: instructions - lines 212 to 212"]
B100 -->|jump| B142
B101 -->|condition true| B115
B101 -->|condition false| B102
B102 -->|call| B153
B102 -->|after return| B103
B103 -->|call| B7
B103 -->|after return| B104
B104 -->|call| B7
B104 -->|after return| B105
B105 -->|call| B15
B105 -->|after return| B106
B106 -->|call| B7
B106 -->|after return| B107
B107 -->|call| B15
B107 -->|after return| B108
B108 -->|call| B7
B108 -->|after return| B109
B109 -->|call| B15
B109 -->|after return| B110
B142["Continue at B143 in section 15"]
B115["Continue at B116 in section 12"]
B153["Continue at B154 in section 16"]
B7["Continue at B8 in section 1"]
B15["Continue at B16 in section 2"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
jmp got_it
```

### B102

```asm
cjne A, #9, k10
```

### B103

```asm
mov A, #'8'
MOV A,#1
ACALL WRCMD
```

### B104

```asm
MOV A,#0DH
ACALL SEND
```

### B105

```asm
MOV A,#'e'
ACALL SEND
```

### B106

```asm
ACALL WRDATA
```

### B107

```asm
MOV A,#'i'
ACALL SEND
```

### B108

```asm
ACALL WRDATA
```

### B109

```asm
MOV A,#'g'
ACALL SEND
```

### B110

```asm
ACALL WRDATA
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 213 to 214"]
B111["B112: instructions - lines 215 to 215"]
B112["B113: instructions - lines 216 to 217"]
B113["B114: instructions - lines 218 to 218"]
B114["B115: instructions - lines 219 to 219"]
B115["B116: K10 - lines 221 to 221"]
B116["B117: instructions - lines 222 to 224"]
B117["B118: instructions - lines 225 to 226"]
B118["B119: instructions - lines 227 to 228"]
B119["B120: instructions - lines 229 to 229"]
B110 -->|call| B7
B110 -->|after return| B111
B111 -->|call| B15
B111 -->|after return| B112
B112 -->|call| B7
B112 -->|after return| B113
B113 -->|call| B15
B113 -->|after return| B114
B114 -->|jump| B142
B115 -->|condition true| B127
B115 -->|condition false| B116
B116 -->|call| B153
B116 -->|after return| B117
B117 -->|call| B7
B117 -->|after return| B118
B118 -->|call| B7
B118 -->|after return| B119
B119 -->|call| B15
B119 -->|after return| B120
B7["Continue at B8 in section 1"]
B15["Continue at B16 in section 2"]
B142["Continue at B143 in section 15"]
B127["Continue at B128 in section 13"]
B153["Continue at B154 in section 16"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV A,#'h'
ACALL SEND
```

### B112

```asm
ACALL WRDATA
```

### B113

```asm
MOV A,#'t'
ACALL SEND
```

### B114

```asm
ACALL WRDATA
```

### B115

```asm
jmp got_it
```

### B116

```asm
cjne A, #10, k12
```

### B117

```asm
mov A, #'9'
MOV A,#1
ACALL WRCMD
```

### B118

```asm
MOV A,#0DH
ACALL SEND
```

### B119

```asm
MOV A,#'n'
ACALL SEND
```

### B120

```asm
ACALL WRDATA
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 230 to 231"]
B121["B122: instructions - lines 232 to 232"]
B122["B123: instructions - lines 233 to 234"]
B123["B124: instructions - lines 235 to 235"]
B124["B125: instructions - lines 236 to 237"]
B125["B126: instructions - lines 238 to 238"]
B126["B127: instructions - lines 239 to 239"]
B127["B128: K12 - lines 241 to 241"]
B128["B129: instructions - lines 242 to 244"]
B129["B130: K13 - lines 246 to 246"]
B120 -->|call| B7
B120 -->|after return| B121
B121 -->|call| B15
B121 -->|after return| B122
B122 -->|call| B7
B122 -->|after return| B123
B123 -->|call| B15
B123 -->|after return| B124
B124 -->|call| B7
B124 -->|after return| B125
B125 -->|call| B15
B125 -->|after return| B126
B126 -->|jump| B142
B127 -->|condition true| B129
B127 -->|condition false| B128
B128 -->|jump| B142
B129 -->|condition true| B141
B129 -->|condition false| B130
B7["Continue at B8 in section 1"]
B15["Continue at B16 in section 2"]
B142["Continue at B143 in section 15"]
B141["Continue at B142 in section 15"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV A,#'i'
ACALL SEND
```

### B122

```asm
ACALL WRDATA
```

### B123

```asm
MOV A,#'n'
ACALL SEND
```

### B124

```asm
ACALL WRDATA
```

### B125

```asm
MOV A,#'e'
ACALL SEND
```

### B126

```asm
ACALL WRDATA
```

### B127

```asm
jmp got_it
```

### B128

```asm
cjne A, #12, k13
```

### B129

```asm
mov A, #'*'
jmp got_it
```

### B130

```asm
cjne A, #13, k14
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 247 to 249"]
B131["B132: instructions - lines 250 to 251"]
B132["B133: instructions - lines 252 to 253"]
B133["B134: instructions - lines 254 to 254"]
B134["B135: instructions - lines 255 to 256"]
B135["B136: instructions - lines 257 to 257"]
B136["B137: instructions - lines 258 to 259"]
B137["B138: instructions - lines 260 to 260"]
B138["B139: instructions - lines 261 to 262"]
B139["B140: instructions - lines 263 to 263"]
B130 -->|call| B153
B130 -->|after return| B131
B131 -->|call| B7
B131 -->|after return| B132
B132 -->|call| B7
B132 -->|after return| B133
B133 -->|call| B15
B133 -->|after return| B134
B134 -->|call| B7
B134 -->|after return| B135
B135 -->|call| B15
B135 -->|after return| B136
B136 -->|call| B7
B136 -->|after return| B137
B137 -->|call| B15
B137 -->|after return| B138
B138 -->|call| B7
B138 -->|after return| B139
B139 -->|call| B15
B139 -->|after return| B140
B153["Continue at B154 in section 16"]
B7["Continue at B8 in section 1"]
B15["Continue at B16 in section 2"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
mov A, #'0'
MOV A,#1
ACALL WRCMD
```

### B132

```asm
MOV A,#0DH
ACALL SEND
```

### B133

```asm
MOV A,#'z'
ACALL SEND
```

### B134

```asm
ACALL WRDATA
```

### B135

```asm
MOV A,#'e'
ACALL SEND
```

### B136

```asm
ACALL WRDATA
```

### B137

```asm
MOV A,#'r'
ACALL SEND
```

### B138

```asm
ACALL WRDATA
```

### B139

```asm
MOV A,#'o'
ACALL SEND
```

### B140

```asm
ACALL WRDATA
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 265 to 265"]
B141["B142: K14 - lines 267 to 267"]
B142["B143: GOT_IT - lines 269 to 269"]
B143["B144: LCD_INI - lines 272 to 272"]
B144["B145: instructions - lines 273 to 274"]
B145["B146: instructions - lines 275 to 276"]
B146["B147: instructions - lines 277 to 278"]
B147["B148: instructions - lines 279 to 280"]
B148["B149: instructions - lines 281 to 282"]
B149["B150: instructions - lines 283 to 284"]
B140 -->|jump| B142
B141 -->|next| B142
B143 -->|call| B155
B143 -->|after return| B144
B144 -->|call| B153
B144 -->|after return| B145
B145 -->|call| B153
B145 -->|after return| B146
B146 -->|call| B153
B146 -->|after return| B147
B147 -->|call| B153
B147 -->|after return| B148
B148 -->|call| B153
B148 -->|after return| B149
B149 -->|call| B153
B149 -->|after return| B150
B155["Continue at B156 in section 16"]
B153["Continue at B154 in section 16"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
jmp got_it
```

### B142

```asm
mov A, # '#'
```

### B143

Return to the instruction following the active call.

```asm
ret
```

### B144

```asm
ACALL WAIT
```

### B145

```asm
MOV A,#38H
ACALL WRCMD
```

### B146

```asm
MOV A,#038H
ACALL WRCMD
```

### B147

```asm
MOV A,#038H
ACALL WRCMD
```

### B148

```asm
MOV A,#038H
ACALL WRCMD
```

### B149

```asm
MOV A,#8
ACALL WRCMD
```

### B150

```asm
MOV A,#1
ACALL WRCMD
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 285 to 286"]
B151["B152: instructions - lines 287 to 288"]
B152["B153: instructions - lines 289 to 289"]
B153["B154: WRCMD - lines 292 to 296"]
B154["B155: instructions - lines 297 to 297"]
B155["B156: WAIT - lines 300 to 300"]
B156["B157: WT0 - lines 301 to 301"]
B157["B158: WT1 - lines 302 to 302"]
B158["B159: WT2 - lines 303 to 303"]
B159["B160: instructions - lines 304 to 304"]
B150 -->|call| B153
B150 -->|after return| B151
B151 -->|call| B10
B151 -->|after return| B152
B153 -->|call| B155
B153 -->|after return| B154
B155 -->|next| B156
B156 -->|next| B157
B157 -->|next| B158
B158 -->|condition true| B158
B158 -->|condition false| B159
B159 -->|condition true| B157
B159 -->|condition false| B160
B10["Continue at B11 in section 2"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV A,#6
ACALL WRCMD
```

### B152

```asm
MOV A,#0FH
ACALL WRCMD40
```

### B153

Return to the instruction following the active call.

```asm
RET
```

### B154

```asm
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WAIT
```

### B155

Return to the instruction following the active call.

```asm
RET
```

### B156

```asm
MOV R5,#1
```

### B157

```asm
MOV R6,#28
```

### B158

```asm
MOV R7,#255
```

### B159

```asm
DJNZ R7,WT2
```

### B160

```asm
DJNZ R6,WT1
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 305 to 305"]
B161["B162: instructions - lines 306 to 306"]
B160 -->|condition true| B156
B160 -->|condition false| B161
B156["Continue at B157 in section 16"]
```

### B161

```asm
DJNZ R5,WT0
```

### B162

Return to the instruction following the active call.

```asm
RET
```
