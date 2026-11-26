# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16)

## Destinations requiring review

`HERE2`, `SIX`. A repeated label is also unresolved because it has more than one candidate target.

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 7 to 7"]
B1["B2: instructions - lines 8 to 11"]
B2["B3: instructions - lines 12 to 15"]
B3["B4: LP - lines 19 to 19"]
B4["B5: instructions - lines 20 to 20"]
B5["B6: THREE - lines 24 to 24"]
B6["B7: instructions - lines 25 to 26"]
B7["B8: instructions - lines 27 to 28"]
B8["B9: instructions - lines 29 to 30"]
B9["B10: instructions - lines 31 to 31"]
B0 -->|call| B139
B0 -->|after return| B1
B1 -->|call| B48
B1 -->|after return| B2
B2 -->|next| B3
B3 -->|condition true| B3
B3 -->|condition false| B4
B4 -->|call| B55
B4 -->|after return| B5
B5 -->|condition true| B19
B5 -->|condition false| B6
B6 -->|call| B149
B6 -->|after return| B7
B7 -->|call| B45
B7 -->|after return| B8
B8 -->|call| B45
B8 -->|after return| B9
B9 -->|call| B50
B9 -->|after return| B10
B139["Continue at B140 in section 14"]
B48["Continue at B49 in section 5"]
B55["Continue at B56 in section 6"]
B19["Continue at B20 in section 2"]
B149["Continue at B150 in section 15"]
B45["Continue at B46 in section 5"]
B50["Continue at B51 in section 6"]
B10["Continue at B11 in section 2"]
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
CJNE A,#'3',FOUR
```

### B7

```asm
MOV A,#1
ACALL WRCMD
```

### B8

```asm
MOV A,#0DH
ACALL SEND
```

### B9

```asm
MOV A,#'T'
ACALL SEND
```

### B10

```asm
ACALL WRDATA
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 32 to 33"]
B11["B12: instructions - lines 34 to 34"]
B12["B13: instructions - lines 35 to 36"]
B13["B14: instructions - lines 37 to 37"]
B14["B15: instructions - lines 38 to 39"]
B15["B16: instructions - lines 40 to 40"]
B16["B17: instructions - lines 41 to 42"]
B17["B18: instructions - lines 43 to 43"]
B18["B19: instructions - lines 44 to 44"]
B19["B20: FOUR - lines 47 to 47"]
B10 -->|call| B45
B10 -->|after return| B11
B11 -->|call| B50
B11 -->|after return| B12
B12 -->|call| B45
B12 -->|after return| B13
B13 -->|call| B50
B13 -->|after return| B14
B14 -->|call| B45
B14 -->|after return| B15
B15 -->|call| B50
B15 -->|after return| B16
B16 -->|call| B45
B16 -->|after return| B17
B17 -->|call| B50
B17 -->|after return| B18
B18 -->|jump| BX1
B19 -->|condition true| B31
B19 -->|condition false| B20
B45["Continue at B46 in section 5"]
B50["Continue at B51 in section 6"]
BX1["Unresolved destination: HERE2"]
B31["Continue at B32 in section 4"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A,#'H'
ACALL SEND
```

### B12

```asm
ACALL WRDATA
```

### B13

```asm
MOV A,#'R'
ACALL SEND
```

### B14

```asm
ACALL WRDATA
```

### B15

```asm
MOV A,#'E'
ACALL SEND
```

### B16

```asm
ACALL WRDATA
```

### B17

```asm
MOV A,#'E'
ACALL SEND
```

### B18

```asm
ACALL WRDATA
```

### B19

```asm
AJMP  HERE2
```

### B20

```asm
CJNE A,#'4',FIVE
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 48 to 49"]
B21["B22: instructions - lines 50 to 51"]
B22["B23: instructions - lines 52 to 53"]
B23["B24: instructions - lines 54 to 54"]
B24["B25: instructions - lines 55 to 56"]
B25["B26: instructions - lines 57 to 57"]
B26["B27: instructions - lines 58 to 59"]
B27["B28: instructions - lines 60 to 60"]
B28["B29: instructions - lines 61 to 62"]
B29["B30: instructions - lines 63 to 63"]
B20 -->|call| B149
B20 -->|after return| B21
B21 -->|call| B45
B21 -->|after return| B22
B22 -->|call| B45
B22 -->|after return| B23
B23 -->|call| B50
B23 -->|after return| B24
B24 -->|call| B45
B24 -->|after return| B25
B25 -->|call| B50
B25 -->|after return| B26
B26 -->|call| B45
B26 -->|after return| B27
B27 -->|call| B50
B27 -->|after return| B28
B28 -->|call| B45
B28 -->|after return| B29
B29 -->|call| B50
B29 -->|after return| B30
B149["Continue at B150 in section 15"]
B45["Continue at B46 in section 5"]
B50["Continue at B51 in section 6"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
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
MOV A,#'F'
ACALL SEND
```

### B24

```asm
ACALL WRDATA
```

### B25

```asm
MOV A,#'O'
ACALL SEND
```

### B26

```asm
ACALL WRDATA
```

### B27

```asm
MOV A,#'U'
ACALL SEND
```

### B28

```asm
ACALL WRDATA
```

### B29

```asm
MOV A,#'R'
ACALL SEND
```

### B30

```asm
ACALL WRDATA
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 64 to 64"]
B31["B32: FIVE - lines 67 to 67"]
B32["B33: instructions - lines 68 to 69"]
B33["B34: instructions - lines 70 to 71"]
B34["B35: instructions - lines 72 to 73"]
B35["B36: instructions - lines 74 to 74"]
B36["B37: instructions - lines 75 to 76"]
B37["B38: instructions - lines 77 to 77"]
B38["B39: instructions - lines 78 to 79"]
B39["B40: instructions - lines 80 to 80"]
B30 -->|jump| BX2
B31 -->|condition true| BX3
B31 -->|condition false| B32
B32 -->|call| B149
B32 -->|after return| B33
B33 -->|call| B45
B33 -->|after return| B34
B34 -->|call| B45
B34 -->|after return| B35
B35 -->|call| B50
B35 -->|after return| B36
B36 -->|call| B45
B36 -->|after return| B37
B37 -->|call| B50
B37 -->|after return| B38
B38 -->|call| B45
B38 -->|after return| B39
B39 -->|call| B50
B39 -->|after return| B40
BX2["Unresolved destination: HERE2"]
BX3["Unresolved destination: SIX"]
B149["Continue at B150 in section 15"]
B45["Continue at B46 in section 5"]
B50["Continue at B51 in section 6"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
AJMP  HERE2
```

### B32

```asm
CJNE A,#'5',SIX
```

### B33

```asm
MOV A,#1
ACALL WRCMD
```

### B34

```asm
MOV A,#0DH
ACALL SEND
```

### B35

```asm
MOV A,#'F'
ACALL SEND
```

### B36

```asm
ACALL WRDATA
```

### B37

```asm
MOV A,#'I'
ACALL SEND
```

### B38

```asm
ACALL WRDATA
```

### B39

```asm
MOV A,#'V'
ACALL SEND
```

### B40

```asm
ACALL WRDATA
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 81 to 82"]
B41["B42: instructions - lines 83 to 83"]
B42["B43: instructions - lines 84 to 84"]
B43["B44: LP2 - lines 90 to 90"]
B44["B45: instructions - lines 91 to 91"]
B45["B46: SEND - lines 95 to 95"]
B46["B47: HERE - lines 96 to 96"]
B47["B48: instructions - lines 97 to 98"]
B48["B49: WRCMD40 - lines 100 to 104"]
B49["B50: instructions - lines 105 to 105"]
B40 -->|call| B45
B40 -->|after return| B41
B41 -->|call| B50
B41 -->|after return| B42
B42 -->|jump| BX4
B43 -->|condition true| B43
B43 -->|condition false| B44
B44 -->|jump| B3
B45 -->|next| B46
B46 -->|condition true| B46
B46 -->|condition false| B47
B48 -->|call| B52
B48 -->|after return| B49
B50["Continue at B51 in section 6"]
BX4["Unresolved destination: HERE2"]
B3["Continue at B4 in section 1"]
B52["Continue at B53 in section 6"]
```

### B41

```asm
MOV A,#'E'
ACALL SEND
```

### B42

```asm
ACALL WRDATA
```

### B43

```asm
AJMP  HERE2
```

### B44

```asm
JB DAV,LP2
```

### B45

```asm
AJMP LP
```

### B46

```asm
MOV SBUF,A
```

### B47

```asm
JNB TI,HERE
```

### B48

Return to the instruction following the active call.

```asm
CLR TI
RET
```

### B49

```asm
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WT40
```

### B50

Return to the instruction following the active call.

```asm
RET
```

## Section 6

```mermaid
flowchart TD
B50["B51: WRDATA - lines 108 to 112"]
B51["B52: instructions - lines 113 to 113"]
B52["B53: WT40 - lines 116 to 116"]
B53["B54: WT - lines 117 to 117"]
B54["B55: instructions - lines 118 to 118"]
B55["B56: KEY - lines 121 to 126"]
B56["B57: instructions - lines 127 to 127"]
B57["B58: CONV - lines 129 to 129"]
B58["B59: instructions - lines 130 to 132"]
B59["B60: instructions - lines 133 to 134"]
B50 -->|call| B52
B50 -->|after return| B51
B52 -->|next| B53
B53 -->|condition true| B53
B53 -->|condition false| B54
B55 -->|call| B57
B55 -->|after return| B56
B57 -->|condition true| B67
B57 -->|condition false| B58
B58 -->|call| B149
B58 -->|after return| B59
B59 -->|call| B45
B59 -->|after return| B60
B67["Continue at B68 in section 7"]
B149["Continue at B150 in section 15"]
B45["Continue at B46 in section 5"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV P2,A
SETB RS
SETB E
CLR E
ACALL WT40
```

### B52

Return to the instruction following the active call.

```asm
RET
```

### B53

```asm
MOV R0,#19
```

### B54

```asm
DJNZ R0,WT
```

### B55

Return to the instruction following the active call.

```asm
RET
```

### B56

```asm
CLR OE
NOP
MOV A,P1
SETB OE
ANL A,#0FH
ACALL CONV
```

### B57

Return to the instruction following the active call.

```asm
RET
```

### B58

```asm
cjne A, #0, k1
```

### B59

```asm
mov A, #'1'
MOV A,#1
ACALL WRCMD
```

### B60

```asm
MOV A,#0DH
ACALL SEND
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 135 to 136"]
B61["B62: instructions - lines 137 to 137"]
B62["B63: instructions - lines 138 to 139"]
B63["B64: instructions - lines 140 to 140"]
B64["B65: instructions - lines 141 to 142"]
B65["B66: instructions - lines 143 to 143"]
B66["B67: instructions - lines 144 to 144"]
B67["B68: K1 - lines 146 to 146"]
B68["B69: instructions - lines 147 to 149"]
B69["B70: instructions - lines 150 to 151"]
B60 -->|call| B45
B60 -->|after return| B61
B61 -->|call| B50
B61 -->|after return| B62
B62 -->|call| B45
B62 -->|after return| B63
B63 -->|call| B50
B63 -->|after return| B64
B64 -->|call| B45
B64 -->|after return| B65
B65 -->|call| B50
B65 -->|after return| B66
B66 -->|jump| B138
B67 -->|condition true| B77
B67 -->|condition false| B68
B68 -->|call| B149
B68 -->|after return| B69
B69 -->|call| B45
B69 -->|after return| B70
B45["Continue at B46 in section 5"]
B50["Continue at B51 in section 6"]
B138["Continue at B139 in section 14"]
B77["Continue at B78 in section 8"]
B149["Continue at B150 in section 15"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,#'O'
ACALL SEND
```

### B62

```asm
ACALL WRDATA
```

### B63

```asm
MOV A,#'N'
ACALL SEND
```

### B64

```asm
ACALL WRDATA
```

### B65

```asm
MOV A,#'E'
ACALL SEND
```

### B66

```asm
ACALL WRDATA
```

### B67

```asm
jmp got_it
```

### B68

```asm
cjne A, #1, k2
```

### B69

```asm
mov A, #'2'
MOV A,#1
ACALL WRCMD
```

### B70

```asm
MOV A,#0DH
ACALL SEND
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 152 to 153"]
B71["B72: instructions - lines 154 to 154"]
B72["B73: instructions - lines 155 to 156"]
B73["B74: instructions - lines 157 to 157"]
B74["B75: instructions - lines 158 to 159"]
B75["B76: instructions - lines 160 to 160"]
B76["B77: instructions - lines 162 to 162"]
B77["B78: K2 - lines 164 to 164"]
B78["B79: instructions - lines 165 to 166"]
B79["B80: K4 - lines 168 to 168"]
B70 -->|call| B45
B70 -->|after return| B71
B71 -->|call| B50
B71 -->|after return| B72
B72 -->|call| B45
B72 -->|after return| B73
B73 -->|call| B50
B73 -->|after return| B74
B74 -->|call| B45
B74 -->|after return| B75
B75 -->|call| B50
B75 -->|after return| B76
B76 -->|jump| B138
B77 -->|condition true| B79
B77 -->|condition false| B78
B78 -->|jump| B138
B79 -->|condition true| B81
B79 -->|condition false| B80
B45["Continue at B46 in section 5"]
B50["Continue at B51 in section 6"]
B138["Continue at B139 in section 14"]
B81["Continue at B82 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV A,#'T'
ACALL SEND
```

### B72

```asm
ACALL WRDATA
```

### B73

```asm
MOV A,#'O'
ACALL SEND
```

### B74

```asm
ACALL WRDATA
```

### B75

```asm
MOV A,#'W'
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
cjne A, #2, k4
```

### B79

```asm
mov A, #'3'
jmp got_it
```

### B80

```asm
cjne A, #4, k5
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 169 to 170"]
B81["B82: K5 - lines 172 to 172"]
B82["B83: instructions - lines 173 to 174"]
B83["B84: K6 - lines 176 to 176"]
B84["B85: instructions - lines 177 to 179"]
B85["B86: instructions - lines 180 to 181"]
B86["B87: instructions - lines 182 to 183"]
B87["B88: instructions - lines 184 to 184"]
B88["B89: instructions - lines 185 to 186"]
B89["B90: instructions - lines 187 to 187"]
B80 -->|jump| B138
B81 -->|condition true| B83
B81 -->|condition false| B82
B82 -->|jump| B138
B83 -->|condition true| B93
B83 -->|condition false| B84
B84 -->|call| B149
B84 -->|after return| B85
B85 -->|call| B45
B85 -->|after return| B86
B86 -->|call| B45
B86 -->|after return| B87
B87 -->|call| B50
B87 -->|after return| B88
B88 -->|call| B45
B88 -->|after return| B89
B89 -->|call| B50
B89 -->|after return| B90
B138["Continue at B139 in section 14"]
B93["Continue at B94 in section 10"]
B149["Continue at B150 in section 15"]
B45["Continue at B46 in section 5"]
B50["Continue at B51 in section 6"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
mov A, #'4'
jmp got_it
```

### B82

```asm
cjne A, #5, k6
```

### B83

```asm
mov A, #'5'
jmp got_it
```

### B84

```asm
cjne A, #6, k8
```

### B85

```asm
mov A, #'6'
MOV A,#1
ACALL WRCMD
```

### B86

```asm
MOV A,#0DH
ACALL SEND
```

### B87

```asm
MOV A,#'s'
ACALL SEND
```

### B88

```asm
ACALL WRDATA
```

### B89

```asm
MOV A,#'i'
ACALL SEND
```

### B90

```asm
ACALL WRDATA
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 188 to 189"]
B91["B92: instructions - lines 190 to 190"]
B92["B93: instructions - lines 191 to 191"]
B93["B94: K8 - lines 193 to 193"]
B94["B95: instructions - lines 194 to 196"]
B95["B96: instructions - lines 197 to 198"]
B96["B97: instructions - lines 199 to 200"]
B97["B98: instructions - lines 201 to 201"]
B98["B99: instructions - lines 202 to 203"]
B99["B100: instructions - lines 204 to 204"]
B90 -->|call| B45
B90 -->|after return| B91
B91 -->|call| B50
B91 -->|after return| B92
B92 -->|jump| B138
B93 -->|condition true| B107
B93 -->|condition false| B94
B94 -->|call| B149
B94 -->|after return| B95
B95 -->|call| B45
B95 -->|after return| B96
B96 -->|call| B45
B96 -->|after return| B97
B97 -->|call| B50
B97 -->|after return| B98
B98 -->|call| B45
B98 -->|after return| B99
B99 -->|call| B50
B99 -->|after return| B100
B45["Continue at B46 in section 5"]
B50["Continue at B51 in section 6"]
B138["Continue at B139 in section 14"]
B107["Continue at B108 in section 11"]
B149["Continue at B150 in section 15"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV A,#'x'
ACALL SEND
```

### B92

```asm
ACALL WRDATA
```

### B93

```asm
jmp got_it
```

### B94

```asm
cjne A, #8, k9
```

### B95

```asm
mov A, #'7'
MOV A,#1
ACALL WRCMD
```

### B96

```asm
MOV A,#0DH
ACALL SEND
```

### B97

```asm
MOV A,#'s'
ACALL SEND
```

### B98

```asm
ACALL WRDATA
```

### B99

```asm
MOV A,#'e'
ACALL SEND
```

### B100

```asm
ACALL WRDATA
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 205 to 206"]
B101["B102: instructions - lines 207 to 207"]
B102["B103: instructions - lines 208 to 209"]
B103["B104: instructions - lines 210 to 210"]
B104["B105: instructions - lines 211 to 212"]
B105["B106: instructions - lines 213 to 213"]
B106["B107: instructions - lines 214 to 214"]
B107["B108: K9 - lines 216 to 216"]
B108["B109: instructions - lines 217 to 219"]
B109["B110: instructions - lines 220 to 221"]
B100 -->|call| B45
B100 -->|after return| B101
B101 -->|call| B50
B101 -->|after return| B102
B102 -->|call| B45
B102 -->|after return| B103
B103 -->|call| B50
B103 -->|after return| B104
B104 -->|call| B45
B104 -->|after return| B105
B105 -->|call| B50
B105 -->|after return| B106
B106 -->|jump| B138
B107 -->|condition true| B121
B107 -->|condition false| B108
B108 -->|call| B149
B108 -->|after return| B109
B109 -->|call| B45
B109 -->|after return| B110
B45["Continue at B46 in section 5"]
B50["Continue at B51 in section 6"]
B138["Continue at B139 in section 14"]
B121["Continue at B122 in section 13"]
B149["Continue at B150 in section 15"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV A,#'v'
ACALL SEND
```

### B102

```asm
ACALL WRDATA
```

### B103

```asm
MOV A,#'e'
ACALL SEND
```

### B104

```asm
ACALL WRDATA
```

### B105

```asm
MOV A,#'n'
ACALL SEND
```

### B106

```asm
ACALL WRDATA
```

### B107

```asm
jmp got_it
```

### B108

```asm
cjne A, #9, k10
```

### B109

```asm
mov A, #'8'
MOV A,#1
ACALL WRCMD
```

### B110

```asm
MOV A,#0DH
ACALL SEND
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 222 to 223"]
B111["B112: instructions - lines 224 to 224"]
B112["B113: instructions - lines 225 to 226"]
B113["B114: instructions - lines 227 to 227"]
B114["B115: instructions - lines 228 to 229"]
B115["B116: instructions - lines 230 to 230"]
B116["B117: instructions - lines 231 to 232"]
B117["B118: instructions - lines 233 to 233"]
B118["B119: instructions - lines 234 to 235"]
B119["B120: instructions - lines 236 to 236"]
B110 -->|call| B45
B110 -->|after return| B111
B111 -->|call| B50
B111 -->|after return| B112
B112 -->|call| B45
B112 -->|after return| B113
B113 -->|call| B50
B113 -->|after return| B114
B114 -->|call| B45
B114 -->|after return| B115
B115 -->|call| B50
B115 -->|after return| B116
B116 -->|call| B45
B116 -->|after return| B117
B117 -->|call| B50
B117 -->|after return| B118
B118 -->|call| B45
B118 -->|after return| B119
B119 -->|call| B50
B119 -->|after return| B120
B45["Continue at B46 in section 5"]
B50["Continue at B51 in section 6"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV A,#'e'
ACALL SEND
```

### B112

```asm
ACALL WRDATA
```

### B113

```asm
MOV A,#'i'
ACALL SEND
```

### B114

```asm
ACALL WRDATA
```

### B115

```asm
MOV A,#'g'
ACALL SEND
```

### B116

```asm
ACALL WRDATA
```

### B117

```asm
MOV A,#'h'
ACALL SEND
```

### B118

```asm
ACALL WRDATA
```

### B119

```asm
MOV A,#'t'
ACALL SEND
```

### B120

```asm
ACALL WRDATA
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 237 to 237"]
B121["B122: K10 - lines 239 to 239"]
B122["B123: instructions - lines 240 to 242"]
B123["B124: instructions - lines 243 to 244"]
B124["B125: instructions - lines 245 to 246"]
B125["B126: instructions - lines 247 to 247"]
B126["B127: instructions - lines 248 to 249"]
B127["B128: instructions - lines 250 to 250"]
B128["B129: instructions - lines 251 to 252"]
B129["B130: instructions - lines 253 to 253"]
B120 -->|jump| B138
B121 -->|condition true| B133
B121 -->|condition false| B122
B122 -->|call| B149
B122 -->|after return| B123
B123 -->|call| B45
B123 -->|after return| B124
B124 -->|call| B45
B124 -->|after return| B125
B125 -->|call| B50
B125 -->|after return| B126
B126 -->|call| B45
B126 -->|after return| B127
B127 -->|call| B50
B127 -->|after return| B128
B128 -->|call| B45
B128 -->|after return| B129
B129 -->|call| B50
B129 -->|after return| B130
B138["Continue at B139 in section 14"]
B133["Continue at B134 in section 14"]
B149["Continue at B150 in section 15"]
B45["Continue at B46 in section 5"]
B50["Continue at B51 in section 6"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
jmp got_it
```

### B122

```asm
cjne A, #10, k12
```

### B123

```asm
mov A, #'9'
MOV A,#1
ACALL WRCMD
```

### B124

```asm
MOV A,#0DH
ACALL SEND
```

### B125

```asm
MOV A,#'n'
ACALL SEND
```

### B126

```asm
ACALL WRDATA
```

### B127

```asm
MOV A,#'i'
ACALL SEND
```

### B128

```asm
ACALL WRDATA
```

### B129

```asm
MOV A,#'n'
ACALL SEND
```

### B130

```asm
ACALL WRDATA
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 254 to 255"]
B131["B132: instructions - lines 256 to 256"]
B132["B133: instructions - lines 257 to 257"]
B133["B134: K12 - lines 259 to 259"]
B134["B135: instructions - lines 260 to 262"]
B135["B136: K13 - lines 264 to 264"]
B136["B137: instructions - lines 265 to 266"]
B137["B138: K14 - lines 268 to 268"]
B138["B139: GOT_IT - lines 270 to 270"]
B139["B140: LCD_INI - lines 276 to 276"]
B130 -->|call| B45
B130 -->|after return| B131
B131 -->|call| B50
B131 -->|after return| B132
B132 -->|jump| B138
B133 -->|condition true| B135
B133 -->|condition false| B134
B134 -->|jump| B138
B135 -->|condition true| B137
B135 -->|condition false| B136
B136 -->|jump| B138
B137 -->|next| B138
B139 -->|call| B151
B139 -->|after return| B140
B45["Continue at B46 in section 5"]
B50["Continue at B51 in section 6"]
B151["Continue at B152 in section 16"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV A,#'e'
ACALL SEND
```

### B132

```asm
ACALL WRDATA
```

### B133

```asm
jmp got_it
```

### B134

```asm
cjne A, #12, k13
```

### B135

```asm
mov A, #'*'
jmp got_it
```

### B136

```asm
cjne A, #13, k14
```

### B137

```asm
mov A, #'0'
jmp got_it
```

### B138

```asm
mov A, # '#'
```

### B139

Return to the instruction following the active call.

```asm
ret
```

### B140

```asm
ACALL WAIT
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 277 to 278"]
B141["B142: instructions - lines 279 to 280"]
B142["B143: instructions - lines 281 to 282"]
B143["B144: instructions - lines 283 to 284"]
B144["B145: instructions - lines 285 to 286"]
B145["B146: instructions - lines 287 to 288"]
B146["B147: instructions - lines 289 to 290"]
B147["B148: instructions - lines 291 to 292"]
B148["B149: instructions - lines 293 to 293"]
B149["B150: WRCMD - lines 296 to 300"]
B140 -->|call| B149
B140 -->|after return| B141
B141 -->|call| B149
B141 -->|after return| B142
B142 -->|call| B149
B142 -->|after return| B143
B143 -->|call| B149
B143 -->|after return| B144
B144 -->|call| B149
B144 -->|after return| B145
B145 -->|call| B149
B145 -->|after return| B146
B146 -->|call| B149
B146 -->|after return| B147
B147 -->|call| B48
B147 -->|after return| B148
B149 -->|call| B151
B149 -->|after return| B150
B48["Continue at B49 in section 5"]
B151["Continue at B152 in section 16"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
MOV A,#38H
ACALL WRCMD
```

### B142

```asm
MOV A,#038H
ACALL WRCMD
```

### B143

```asm
MOV A,#038H
ACALL WRCMD
```

### B144

```asm
MOV A,#038H
ACALL WRCMD
```

### B145

```asm
MOV A,#8
ACALL WRCMD
```

### B146

```asm
MOV A,#1
ACALL WRCMD
```

### B147

```asm
MOV A,#6
ACALL WRCMD
```

### B148

```asm
MOV A,#0FH
ACALL WRCMD40
```

### B149

Return to the instruction following the active call.

```asm
RET
```

### B150

```asm
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WAIT
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 301 to 301"]
B151["B152: WAIT - lines 304 to 304"]
B152["B153: WT0 - lines 305 to 305"]
B153["B154: WT1 - lines 306 to 306"]
B154["B155: WT2 - lines 307 to 307"]
B155["B156: instructions - lines 308 to 308"]
B156["B157: instructions - lines 309 to 309"]
B157["B158: instructions - lines 310 to 310"]
B151 -->|next| B152
B152 -->|next| B153
B153 -->|next| B154
B154 -->|condition true| B154
B154 -->|condition false| B155
B155 -->|condition true| B153
B155 -->|condition false| B156
B156 -->|condition true| B152
B156 -->|condition false| B157
```

### B151

Return to the instruction following the active call.

```asm
RET
```

### B152

```asm
MOV R5,#1
```

### B153

```asm
MOV R6,#28
```

### B154

```asm
MOV R7,#255
```

### B155

```asm
DJNZ R7,WT2
```

### B156

```asm
DJNZ R6,WT1
```

### B157

```asm
DJNZ R5,WT0
```

### B158

Return to the instruction following the active call.

```asm
RET
```
