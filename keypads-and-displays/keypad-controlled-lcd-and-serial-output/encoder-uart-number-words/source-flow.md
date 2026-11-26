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
B3["B4: LP - lines 19 to 19"]
B4["B5: instructions - lines 20 to 20"]
B5["B6: THREE - lines 24 to 24"]
B6["B7: instructions - lines 25 to 26"]
B7["B8: instructions - lines 27 to 28"]
B8["B9: instructions - lines 29 to 30"]
B9["B10: instructions - lines 31 to 31"]
B0 -->|call| B146
B0 -->|after return| B1
B1 -->|call| B97
B1 -->|after return| B2
B2 -->|next| B3
B3 -->|condition true| B3
B3 -->|condition false| B4
B4 -->|call| B104
B4 -->|after return| B5
B5 -->|condition true| B19
B5 -->|condition false| B6
B6 -->|call| B156
B6 -->|after return| B7
B7 -->|call| B94
B7 -->|after return| B8
B8 -->|call| B94
B8 -->|after return| B9
B9 -->|call| B99
B9 -->|after return| B10
B146["Continue at B147 in section 15"]
B97["Continue at B98 in section 10"]
B104["Continue at B105 in section 11"]
B19["Continue at B20 in section 2"]
B156["Continue at B157 in section 16"]
B94["Continue at B95 in section 10"]
B99["Continue at B100 in section 10"]
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
B10 -->|call| B94
B10 -->|after return| B11
B11 -->|call| B99
B11 -->|after return| B12
B12 -->|call| B94
B12 -->|after return| B13
B13 -->|call| B99
B13 -->|after return| B14
B14 -->|call| B94
B14 -->|after return| B15
B15 -->|call| B99
B15 -->|after return| B16
B16 -->|call| B94
B16 -->|after return| B17
B17 -->|call| B99
B17 -->|after return| B18
B18 -->|jump| B92
B19 -->|condition true| B31
B19 -->|condition false| B20
B94["Continue at B95 in section 10"]
B99["Continue at B100 in section 10"]
B92["Continue at B93 in section 10"]
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
B20 -->|call| B156
B20 -->|after return| B21
B21 -->|call| B94
B21 -->|after return| B22
B22 -->|call| B94
B22 -->|after return| B23
B23 -->|call| B99
B23 -->|after return| B24
B24 -->|call| B94
B24 -->|after return| B25
B25 -->|call| B99
B25 -->|after return| B26
B26 -->|call| B94
B26 -->|after return| B27
B27 -->|call| B99
B27 -->|after return| B28
B28 -->|call| B94
B28 -->|after return| B29
B29 -->|call| B99
B29 -->|after return| B30
B156["Continue at B157 in section 16"]
B94["Continue at B95 in section 10"]
B99["Continue at B100 in section 10"]
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
B30 -->|jump| B92
B31 -->|condition true| B43
B31 -->|condition false| B32
B32 -->|call| B156
B32 -->|after return| B33
B33 -->|call| B94
B33 -->|after return| B34
B34 -->|call| B94
B34 -->|after return| B35
B35 -->|call| B99
B35 -->|after return| B36
B36 -->|call| B94
B36 -->|after return| B37
B37 -->|call| B99
B37 -->|after return| B38
B38 -->|call| B94
B38 -->|after return| B39
B39 -->|call| B99
B39 -->|after return| B40
B92["Continue at B93 in section 10"]
B43["Continue at B44 in section 5"]
B156["Continue at B157 in section 16"]
B94["Continue at B95 in section 10"]
B99["Continue at B100 in section 10"]
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
B43["B44: SIX - lines 87 to 87"]
B44["B45: instructions - lines 88 to 89"]
B45["B46: instructions - lines 90 to 91"]
B46["B47: instructions - lines 92 to 93"]
B47["B48: instructions - lines 94 to 94"]
B48["B49: instructions - lines 95 to 96"]
B49["B50: instructions - lines 97 to 97"]
B40 -->|call| B94
B40 -->|after return| B41
B41 -->|call| B99
B41 -->|after return| B42
B42 -->|jump| B92
B43 -->|condition true| B53
B43 -->|condition false| B44
B44 -->|call| B156
B44 -->|after return| B45
B45 -->|call| B94
B45 -->|after return| B46
B46 -->|call| B94
B46 -->|after return| B47
B47 -->|call| B99
B47 -->|after return| B48
B48 -->|call| B94
B48 -->|after return| B49
B49 -->|call| B99
B49 -->|after return| B50
B94["Continue at B95 in section 10"]
B99["Continue at B100 in section 10"]
B92["Continue at B93 in section 10"]
B53["Continue at B54 in section 6"]
B156["Continue at B157 in section 16"]
B50["Continue at B51 in section 6"]
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
CJNE A,#'6',SEVEN
```

### B45

```asm
MOV A,#1
ACALL WRCMD
```

### B46

```asm
MOV A,#0DH
ACALL SEND
```

### B47

```asm
MOV A,#'S'
ACALL SEND
```

### B48

```asm
ACALL WRDATA
```

### B49

```asm
MOV A,#'I'
ACALL SEND
```

### B50

```asm
ACALL WRDATA
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 98 to 99"]
B51["B52: instructions - lines 100 to 100"]
B52["B53: instructions - lines 101 to 101"]
B53["B54: SEVEN - lines 104 to 104"]
B54["B55: instructions - lines 105 to 106"]
B55["B56: instructions - lines 107 to 108"]
B56["B57: instructions - lines 109 to 110"]
B57["B58: instructions - lines 111 to 111"]
B58["B59: instructions - lines 112 to 113"]
B59["B60: instructions - lines 114 to 114"]
B50 -->|call| B94
B50 -->|after return| B51
B51 -->|call| B99
B51 -->|after return| B52
B52 -->|jump| B92
B53 -->|condition true| B67
B53 -->|condition false| B54
B54 -->|call| B156
B54 -->|after return| B55
B55 -->|call| B94
B55 -->|after return| B56
B56 -->|call| B94
B56 -->|after return| B57
B57 -->|call| B99
B57 -->|after return| B58
B58 -->|call| B94
B58 -->|after return| B59
B59 -->|call| B99
B59 -->|after return| B60
B94["Continue at B95 in section 10"]
B99["Continue at B100 in section 10"]
B92["Continue at B93 in section 10"]
B67["Continue at B68 in section 7"]
B156["Continue at B157 in section 16"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV A,#'X'
ACALL SEND
```

### B52

```asm
ACALL WRDATA
```

### B53

```asm
AJMP  HERE2
```

### B54

```asm
CJNE A,#'7',EIGHT
```

### B55

```asm
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
MOV A,#'S'
ACALL SEND
```

### B58

```asm
ACALL WRDATA
```

### B59

```asm
MOV A,#'E'
ACALL SEND
```

### B60

```asm
ACALL WRDATA
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 115 to 116"]
B61["B62: instructions - lines 117 to 117"]
B62["B63: instructions - lines 118 to 119"]
B63["B64: instructions - lines 120 to 120"]
B64["B65: instructions - lines 121 to 122"]
B65["B66: instructions - lines 123 to 123"]
B66["B67: instructions - lines 124 to 124"]
B67["B68: EIGHT - lines 127 to 127"]
B68["B69: instructions - lines 128 to 129"]
B69["B70: instructions - lines 130 to 131"]
B60 -->|call| B94
B60 -->|after return| B61
B61 -->|call| B99
B61 -->|after return| B62
B62 -->|call| B94
B62 -->|after return| B63
B63 -->|call| B99
B63 -->|after return| B64
B64 -->|call| B94
B64 -->|after return| B65
B65 -->|call| B99
B65 -->|after return| B66
B66 -->|jump| B92
B67 -->|condition true| B81
B67 -->|condition false| B68
B68 -->|call| B156
B68 -->|after return| B69
B69 -->|call| B94
B69 -->|after return| B70
B94["Continue at B95 in section 10"]
B99["Continue at B100 in section 10"]
B92["Continue at B93 in section 10"]
B81["Continue at B82 in section 9"]
B156["Continue at B157 in section 16"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV A,#'V'
ACALL SEND
```

### B62

```asm
ACALL WRDATA
```

### B63

```asm
MOV A,#'E'
ACALL SEND
```

### B64

```asm
ACALL WRDATA
```

### B65

```asm
MOV A,#'N'
ACALL SEND
```

### B66

```asm
ACALL WRDATA
```

### B67

```asm
AJMP  HERE2
```

### B68

```asm
CJNE A,#'8',NINE
```

### B69

```asm
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
B70["B71: instructions - lines 132 to 133"]
B71["B72: instructions - lines 134 to 134"]
B72["B73: instructions - lines 135 to 136"]
B73["B74: instructions - lines 137 to 137"]
B74["B75: instructions - lines 138 to 139"]
B75["B76: instructions - lines 140 to 140"]
B76["B77: instructions - lines 141 to 142"]
B77["B78: instructions - lines 143 to 143"]
B78["B79: instructions - lines 144 to 145"]
B79["B80: instructions - lines 146 to 146"]
B70 -->|call| B94
B70 -->|after return| B71
B71 -->|call| B99
B71 -->|after return| B72
B72 -->|call| B94
B72 -->|after return| B73
B73 -->|call| B99
B73 -->|after return| B74
B74 -->|call| B94
B74 -->|after return| B75
B75 -->|call| B99
B75 -->|after return| B76
B76 -->|call| B94
B76 -->|after return| B77
B77 -->|call| B99
B77 -->|after return| B78
B78 -->|call| B94
B78 -->|after return| B79
B79 -->|call| B99
B79 -->|after return| B80
B94["Continue at B95 in section 10"]
B99["Continue at B100 in section 10"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
MOV A,#'E'
ACALL SEND
```

### B72

```asm
ACALL WRDATA
```

### B73

```asm
MOV A,#'I'
ACALL SEND
```

### B74

```asm
ACALL WRDATA
```

### B75

```asm
MOV A,#'G'
ACALL SEND
```

### B76

```asm
ACALL WRDATA
```

### B77

```asm
MOV A,#'H'
ACALL SEND
```

### B78

```asm
ACALL WRDATA
```

### B79

```asm
MOV A,#'T'
ACALL SEND
```

### B80

```asm
ACALL WRDATA
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 147 to 147"]
B81["B82: NINE - lines 150 to 150"]
B82["B83: instructions - lines 151 to 152"]
B83["B84: instructions - lines 153 to 154"]
B84["B85: instructions - lines 155 to 156"]
B85["B86: instructions - lines 157 to 157"]
B86["B87: instructions - lines 158 to 159"]
B87["B88: instructions - lines 160 to 160"]
B88["B89: instructions - lines 161 to 162"]
B89["B90: instructions - lines 163 to 163"]
B80 -->|jump| B92
B81 -->|condition true| B92
B81 -->|condition false| B82
B82 -->|call| B156
B82 -->|after return| B83
B83 -->|call| B94
B83 -->|after return| B84
B84 -->|call| B94
B84 -->|after return| B85
B85 -->|call| B99
B85 -->|after return| B86
B86 -->|call| B94
B86 -->|after return| B87
B87 -->|call| B99
B87 -->|after return| B88
B88 -->|call| B94
B88 -->|after return| B89
B89 -->|call| B99
B89 -->|after return| B90
B92["Continue at B93 in section 10"]
B156["Continue at B157 in section 16"]
B94["Continue at B95 in section 10"]
B99["Continue at B100 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
AJMP  HERE2
```

### B82

```asm
CJNE A,#'9',HERE2
```

### B83

```asm
MOV A,#1
ACALL WRCMD
```

### B84

```asm
MOV A,#0DH
ACALL SEND
```

### B85

```asm
MOV A,#'N'
ACALL SEND
```

### B86

```asm
ACALL WRDATA
```

### B87

```asm
MOV A,#'I'
ACALL SEND
```

### B88

```asm
ACALL WRDATA
```

### B89

```asm
MOV A,#'N'
ACALL SEND
```

### B90

```asm
ACALL WRDATA
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 164 to 165"]
B91["B92: instructions - lines 166 to 166"]
B92["B93: HERE2 - lines 169 to 169"]
B93["B94: instructions - lines 170 to 170"]
B94["B95: SEND - lines 174 to 174"]
B95["B96: HERE - lines 175 to 175"]
B96["B97: instructions - lines 176 to 177"]
B97["B98: WRCMD40 - lines 179 to 183"]
B98["B99: instructions - lines 184 to 184"]
B99["B100: WRDATA - lines 187 to 191"]
B90 -->|call| B94
B90 -->|after return| B91
B91 -->|call| B99
B91 -->|after return| B92
B92 -->|condition true| B92
B92 -->|condition false| B93
B93 -->|jump| B3
B94 -->|next| B95
B95 -->|condition true| B95
B95 -->|condition false| B96
B97 -->|call| B101
B97 -->|after return| B98
B99 -->|call| B101
B99 -->|after return| B100
B3["Continue at B4 in section 1"]
B101["Continue at B102 in section 11"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
MOV A,#'E'
ACALL SEND
```

### B92

```asm
ACALL WRDATA
```

### B93

```asm
JB DAV,LP2
```

### B94

```asm
AJMP LP
```

### B95

```asm
MOV SBUF,A
```

### B96

```asm
JNB TI,HERE
```

### B97

Return to the instruction following the active call.

```asm
CLR TI
RET
```

### B98

```asm
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WT40
```

### B99

Return to the instruction following the active call.

```asm
RET
```

### B100

```asm
MOV P2,A
SETB RS
SETB E
CLR E
ACALL WT40
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 192 to 192"]
B101["B102: WT40 - lines 195 to 195"]
B102["B103: WT - lines 196 to 196"]
B103["B104: instructions - lines 197 to 197"]
B104["B105: KEY - lines 200 to 205"]
B105["B106: instructions - lines 206 to 206"]
B106["B107: CONV - lines 208 to 208"]
B107["B108: instructions - lines 209 to 211"]
B108["B109: instructions - lines 212 to 213"]
B109["B110: instructions - lines 214 to 215"]
B101 -->|next| B102
B102 -->|condition true| B102
B102 -->|condition false| B103
B104 -->|call| B106
B104 -->|after return| B105
B106 -->|condition true| B116
B106 -->|condition false| B107
B107 -->|call| B156
B107 -->|after return| B108
B108 -->|call| B94
B108 -->|after return| B109
B109 -->|call| B94
B109 -->|after return| B110
B116["Continue at B117 in section 12"]
B156["Continue at B157 in section 16"]
B94["Continue at B95 in section 10"]
B110["Continue at B111 in section 12"]
```

### B101

Return to the instruction following the active call.

```asm
RET
```

### B102

```asm
MOV R0,#19
```

### B103

```asm
DJNZ R0,WT
```

### B104

Return to the instruction following the active call.

```asm
RET
```

### B105

```asm
CLR OE
NOP
MOV A,P1
SETB OE
ANL A,#0FH
ACALL CONV
```

### B106

Return to the instruction following the active call.

```asm
RET
```

### B107

```asm
cjne A, #0, k1
```

### B108

```asm
mov A, #'1'
MOV A,#1
ACALL WRCMD
```

### B109

```asm
MOV A,#0DH
ACALL SEND
```

### B110

```asm
MOV A,#'O'
ACALL SEND
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 216 to 216"]
B111["B112: instructions - lines 217 to 218"]
B112["B113: instructions - lines 219 to 219"]
B113["B114: instructions - lines 220 to 221"]
B114["B115: instructions - lines 222 to 222"]
B115["B116: instructions - lines 223 to 223"]
B116["B117: K1 - lines 225 to 225"]
B117["B118: instructions - lines 226 to 228"]
B118["B119: instructions - lines 229 to 230"]
B119["B120: instructions - lines 231 to 232"]
B110 -->|call| B99
B110 -->|after return| B111
B111 -->|call| B94
B111 -->|after return| B112
B112 -->|call| B99
B112 -->|after return| B113
B113 -->|call| B94
B113 -->|after return| B114
B114 -->|call| B99
B114 -->|after return| B115
B115 -->|jump| B145
B116 -->|condition true| B126
B116 -->|condition false| B117
B117 -->|call| B156
B117 -->|after return| B118
B118 -->|call| B94
B118 -->|after return| B119
B119 -->|call| B94
B119 -->|after return| B120
B99["Continue at B100 in section 10"]
B94["Continue at B95 in section 10"]
B145["Continue at B146 in section 15"]
B126["Continue at B127 in section 13"]
B156["Continue at B157 in section 16"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
ACALL WRDATA
```

### B112

```asm
MOV A,#'N'
ACALL SEND
```

### B113

```asm
ACALL WRDATA
```

### B114

```asm
MOV A,#'E'
ACALL SEND
```

### B115

```asm
ACALL WRDATA
```

### B116

```asm
jmp got_it
```

### B117

```asm
cjne A, #1, k2
```

### B118

```asm
mov A, #'2'
MOV A,#1
ACALL WRCMD
```

### B119

```asm
MOV A,#0DH
ACALL SEND
```

### B120

```asm
MOV A,#'T'
ACALL SEND
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 233 to 233"]
B121["B122: instructions - lines 234 to 235"]
B122["B123: instructions - lines 236 to 236"]
B123["B124: instructions - lines 237 to 238"]
B124["B125: instructions - lines 239 to 239"]
B125["B126: instructions - lines 241 to 241"]
B126["B127: K2 - lines 243 to 243"]
B127["B128: instructions - lines 244 to 245"]
B128["B129: K4 - lines 247 to 247"]
B129["B130: instructions - lines 248 to 249"]
B120 -->|call| B99
B120 -->|after return| B121
B121 -->|call| B94
B121 -->|after return| B122
B122 -->|call| B99
B122 -->|after return| B123
B123 -->|call| B94
B123 -->|after return| B124
B124 -->|call| B99
B124 -->|after return| B125
B125 -->|jump| B145
B126 -->|condition true| B128
B126 -->|condition false| B127
B127 -->|jump| B145
B128 -->|condition true| B130
B128 -->|condition false| B129
B129 -->|jump| B145
B99["Continue at B100 in section 10"]
B94["Continue at B95 in section 10"]
B145["Continue at B146 in section 15"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
ACALL WRDATA
```

### B122

```asm
MOV A,#'O'
ACALL SEND
```

### B123

```asm
ACALL WRDATA
```

### B124

```asm
MOV A,#'2'
ACALL SEND
```

### B125

```asm
ACALL WRDATA
```

### B126

```asm
jmp got_it
```

### B127

```asm
cjne A, #2, k4
```

### B128

```asm
mov A, #'3'
jmp got_it
```

### B129

```asm
cjne A, #4, k5
```

### B130

```asm
mov A, #'4'
jmp got_it
```

## Section 14

```mermaid
flowchart TD
B130["B131: K5 - lines 251 to 251"]
B131["B132: instructions - lines 252 to 253"]
B132["B133: K6 - lines 255 to 255"]
B133["B134: instructions - lines 256 to 257"]
B134["B135: K8 - lines 259 to 259"]
B135["B136: instructions - lines 260 to 261"]
B136["B137: K9 - lines 263 to 263"]
B137["B138: instructions - lines 264 to 265"]
B138["B139: K10 - lines 267 to 267"]
B139["B140: instructions - lines 268 to 269"]
B130 -->|condition true| B132
B130 -->|condition false| B131
B131 -->|jump| B145
B132 -->|condition true| B134
B132 -->|condition false| B133
B133 -->|jump| B145
B134 -->|condition true| B136
B134 -->|condition false| B135
B135 -->|jump| B145
B136 -->|condition true| B138
B136 -->|condition false| B137
B137 -->|jump| B145
B138 -->|condition true| B140
B138 -->|condition false| B139
B139 -->|jump| B145
B145["Continue at B146 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
cjne A, #5, k6
```

### B132

```asm
mov A, #'5'
jmp got_it
```

### B133

```asm
cjne A, #6, k8
```

### B134

```asm
mov A, #'6'
jmp got_it
```

### B135

```asm
cjne A, #8, k9
```

### B136

```asm
mov A, #'7'
jmp got_it
```

### B137

```asm
cjne A, #9, k10
```

### B138

```asm
mov A, #'8'
jmp got_it
```

### B139

```asm
cjne A, #10, k12
```

### B140

```asm
mov A, #'9'
jmp got_it
```

## Section 15

```mermaid
flowchart TD
B140["B141: K12 - lines 271 to 271"]
B141["B142: instructions - lines 272 to 274"]
B142["B143: K13 - lines 276 to 276"]
B143["B144: instructions - lines 277 to 278"]
B144["B145: K14 - lines 280 to 280"]
B145["B146: GOT_IT - lines 282 to 282"]
B146["B147: LCD_INI - lines 288 to 288"]
B147["B148: instructions - lines 289 to 290"]
B148["B149: instructions - lines 291 to 292"]
B149["B150: instructions - lines 293 to 294"]
B140 -->|condition true| B142
B140 -->|condition false| B141
B141 -->|jump| B145
B142 -->|condition true| B144
B142 -->|condition false| B143
B143 -->|jump| B145
B144 -->|next| B145
B146 -->|call| B158
B146 -->|after return| B147
B147 -->|call| B156
B147 -->|after return| B148
B148 -->|call| B156
B148 -->|after return| B149
B149 -->|call| B156
B149 -->|after return| B150
B158["Continue at B159 in section 16"]
B156["Continue at B157 in section 16"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
cjne A, #12, k13
```

### B142

```asm
mov A, #'*'
jmp got_it
```

### B143

```asm
cjne A, #13, k14
```

### B144

```asm
mov A, #'0'
jmp got_it
```

### B145

```asm
mov A, # '#'
```

### B146

Return to the instruction following the active call.

```asm
ret
```

### B147

```asm
ACALL WAIT
```

### B148

```asm
MOV A,#38H
ACALL WRCMD
```

### B149

```asm
MOV A,#038H
ACALL WRCMD
```

### B150

```asm
MOV A,#038H
ACALL WRCMD
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 295 to 296"]
B151["B152: instructions - lines 297 to 298"]
B152["B153: instructions - lines 299 to 300"]
B153["B154: instructions - lines 301 to 302"]
B154["B155: instructions - lines 303 to 304"]
B155["B156: instructions - lines 305 to 305"]
B156["B157: WRCMD - lines 308 to 312"]
B157["B158: instructions - lines 313 to 313"]
B158["B159: WAIT - lines 316 to 316"]
B159["B160: WT0 - lines 317 to 317"]
B150 -->|call| B156
B150 -->|after return| B151
B151 -->|call| B156
B151 -->|after return| B152
B152 -->|call| B156
B152 -->|after return| B153
B153 -->|call| B156
B153 -->|after return| B154
B154 -->|call| B97
B154 -->|after return| B155
B156 -->|call| B158
B156 -->|after return| B157
B158 -->|next| B159
B159 -->|next| B160
B97["Continue at B98 in section 10"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV A,#038H
ACALL WRCMD
```

### B152

```asm
MOV A,#8
ACALL WRCMD
```

### B153

```asm
MOV A,#1
ACALL WRCMD
```

### B154

```asm
MOV A,#6
ACALL WRCMD
```

### B155

```asm
MOV A,#0FH
ACALL WRCMD40
```

### B156

Return to the instruction following the active call.

```asm
RET
```

### B157

```asm
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WAIT
```

### B158

Return to the instruction following the active call.

```asm
RET
```

### B159

```asm
MOV R5,#1
```

### B160

```asm
MOV R6,#28
```

## Section 17

```mermaid
flowchart TD
B160["B161: WT1 - lines 318 to 318"]
B161["B162: WT2 - lines 319 to 319"]
B162["B163: instructions - lines 320 to 320"]
B163["B164: instructions - lines 321 to 321"]
B164["B165: instructions - lines 322 to 322"]
B160 -->|next| B161
B161 -->|condition true| B161
B161 -->|condition false| B162
B162 -->|condition true| B160
B162 -->|condition false| B163
B163 -->|condition true| B159
B163 -->|condition false| B164
B159["Continue at B160 in section 16"]
```

### B161

```asm
MOV R7,#255
```

### B162

```asm
DJNZ R7,WT2
```

### B163

```asm
DJNZ R6,WT1
```

### B164

```asm
DJNZ R5,WT0
```

### B165

Return to the instruction following the active call.

```asm
RET
```
