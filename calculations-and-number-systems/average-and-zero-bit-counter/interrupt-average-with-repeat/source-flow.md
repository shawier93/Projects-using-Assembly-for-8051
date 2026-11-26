# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.
- `ORG 0003H` begins at B2.
- `ORG 0030H` begins at B5.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23) · [Section 24](#section-24) · [Section 25](#section-25)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 3"]
B1["B2: REP - lines 5 to 5"]
B2["B3: instructions - lines 6 to 6"]
B3["B4: instructions - lines 7 to 7"]
B4["B5: MAIN - lines 11 to 11"]
B5["B6: instructions - lines 12 to 14"]
B6["B7: instructions - lines 15 to 16"]
B7["B8: instructions - lines 17 to 18"]
B8["B9: instructions - lines 19 to 19"]
B9["B10: instructions - lines 20 to 20"]
B0 -->|jump| B4
B1 -->|call| B223
B1 -->|after return| B2
B2 -->|condition true| B1
B2 -->|condition false| B3
B4 -->|call| B211
B4 -->|after return| B5
B5 -->|call| B218
B5 -->|after return| B6
B6 -->|call| B205
B6 -->|after return| B7
B7 -->|call| B240
B7 -->|after return| B8
B8 -->|call| B98
B8 -->|after return| B9
B9 -->|call| B98
B9 -->|after return| B10
B223["Continue at B224 in section 23"]
B211["Continue at B212 in section 22"]
B218["Continue at B219 in section 22"]
B205["Continue at B206 in section 21"]
B240["Continue at B241 in section 25"]
B98["Continue at B99 in section 10"]
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
ACALL CLEAR
```

### B7

```asm
MOV A, #80H
ACALL CMD
```

### B8

```asm
MOV DPTR, #STR
ACALL WSTR
```

### B9

```asm
ACALL DELAY
```

### B10

```asm
ACALL DELAY
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 22 to 23"]
B11["B12: instructions - lines 24 to 25"]
B12["B13: instructions - lines 26 to 26"]
B13["B14: instructions - lines 27 to 27"]
B14["B15: instructions - lines 29 to 30"]
B15["B16: instructions - lines 31 to 32"]
B16["B17: instructions - lines 33 to 33"]
B17["B18: instructions - lines 34 to 34"]
B18["B19: instructions - lines 36 to 36"]
B19["B20: instructions - lines 37 to 37"]
B10 -->|call| B205
B10 -->|after return| B11
B11 -->|call| B240
B11 -->|after return| B12
B12 -->|call| B98
B12 -->|after return| B13
B13 -->|call| B98
B13 -->|after return| B14
B14 -->|call| B205
B14 -->|after return| B15
B15 -->|call| B240
B15 -->|after return| B16
B16 -->|call| B98
B16 -->|after return| B17
B17 -->|call| B98
B17 -->|after return| B18
B18 -->|call| B218
B18 -->|after return| B19
B19 -->|call| B98
B19 -->|after return| B20
B205["Continue at B206 in section 21"]
B240["Continue at B241 in section 25"]
B98["Continue at B99 in section 10"]
B218["Continue at B219 in section 22"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
MOV A, #80H
ACALL CMD
```

### B12

```asm
MOV DPTR, #NAME
ACALL WSTR
```

### B13

```asm
ACALL DELAY
```

### B14

```asm
ACALL DELAY
```

### B15

```asm
MOV A,#0C0H
ACALL CMD
```

### B16

```asm
MOV DPTR, #ID
ACALL WSTR
```

### B17

```asm
ACALL DELAY
```

### B18

```asm
ACALL DELAY
```

### B19

```asm
ACALL CLEAR
```

### B20

```asm
ACALL DELAY
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 38 to 39"]
B21["B22: instructions - lines 40 to 41"]
B22["B23: instructions - lines 42 to 42"]
B23["B24: instructions - lines 44 to 45"]
B24["B25: MENU - lines 49 to 49"]
B25["B26: instructions - lines 50 to 50"]
B26["B27: instructions - lines 51 to 52"]
B27["B28: instructions - lines 53 to 54"]
B28["B29: instructions - lines 55 to 55"]
B29["B30: instructions - lines 56 to 56"]
B20 -->|call| B205
B20 -->|after return| B21
B21 -->|call| B240
B21 -->|after return| B22
B22 -->|call| B98
B22 -->|after return| B23
B23 -->|next| B24
B24 -->|call| B218
B24 -->|after return| B25
B25 -->|call| B98
B25 -->|after return| B26
B26 -->|call| B205
B26 -->|after return| B27
B27 -->|call| B240
B27 -->|after return| B28
B28 -->|call| B98
B28 -->|after return| B29
B29 -->|call| B98
B29 -->|after return| B30
B205["Continue at B206 in section 21"]
B240["Continue at B241 in section 25"]
B98["Continue at B99 in section 10"]
B218["Continue at B219 in section 22"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
MOV A, #80H
ACALL CMD
```

### B22

```asm
MOV DPTR, #PUSHH
ACALL WSTR
```

### B23

```asm
ACALL DELAY
```

### B24

```asm
CLR P3.6
SETB P3.6
```

### B25

```asm
ACALL CLEAR
```

### B26

```asm
ACALL DELAY
```

### B27

```asm
MOV A, #80H
ACALL CMD
```

### B28

```asm
MOV DPTR, #CHOSE
ACALL WSTR
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
B30["B31: instructions - lines 58 to 59"]
B31["B32: instructions - lines 60 to 61"]
B32["B33: instructions - lines 62 to 62"]
B33["B34: instructions - lines 63 to 63"]
B34["B35: instructions - lines 65 to 66"]
B35["B36: instructions - lines 67 to 68"]
B36["B37: instructions - lines 69 to 69"]
B37["B38: instructions - lines 70 to 70"]
B38["B39: instructions - lines 71 to 71"]
B39["B40: instructions - lines 72 to 72"]
B30 -->|call| B205
B30 -->|after return| B31
B31 -->|call| B240
B31 -->|after return| B32
B32 -->|call| B98
B32 -->|after return| B33
B33 -->|call| B98
B33 -->|after return| B34
B34 -->|call| B205
B34 -->|after return| B35
B35 -->|call| B240
B35 -->|after return| B36
B36 -->|call| B98
B36 -->|after return| B37
B37 -->|call| B98
B37 -->|after return| B38
B38 -->|call| B98
B38 -->|after return| B39
B39 -->|call| B218
B39 -->|after return| B40
B205["Continue at B206 in section 21"]
B240["Continue at B241 in section 25"]
B98["Continue at B99 in section 10"]
B218["Continue at B219 in section 22"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A, #80H
ACALL CMD
```

### B32

```asm
MOV DPTR, #MODE1
ACALL WSTR
```

### B33

```asm
ACALL DELAY
```

### B34

```asm
ACALL DELAY
```

### B35

```asm
MOV A,#0C0H
ACALL CMD
```

### B36

```asm
MOV DPTR, #MODE2
ACALL WSTR
```

### B37

```asm
ACALL DELAY
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
ACALL CLEAR
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 73 to 74"]
B41["B42: instructions - lines 75 to 76"]
B42["B43: instructions - lines 77 to 77"]
B43["B44: instructions - lines 78 to 78"]
B44["B45: instructions - lines 80 to 81"]
B45["B46: instructions - lines 82 to 83"]
B46["B47: instructions - lines 84 to 85"]
B47["B48: instructions - lines 86 to 86"]
B48["B49: instructions - lines 87 to 87"]
B49["B50: instructions - lines 88 to 88"]
B40 -->|call| B205
B40 -->|after return| B41
B41 -->|call| B240
B41 -->|after return| B42
B42 -->|call| B98
B42 -->|after return| B43
B43 -->|call| B98
B43 -->|after return| B44
B44 -->|call| B205
B44 -->|after return| B45
B45 -->|call| B200
B45 -->|after return| B46
B46 -->|call| B240
B46 -->|after return| B47
B47 -->|call| B98
B47 -->|after return| B48
B48 -->|call| B98
B48 -->|after return| B49
B49 -->|call| B98
B49 -->|after return| B50
B205["Continue at B206 in section 21"]
B240["Continue at B241 in section 25"]
B98["Continue at B99 in section 10"]
B200["Continue at B201 in section 21"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV A, #80H
ACALL CMD
```

### B42

```asm
MOV DPTR, #MODE2
ACALL WSTR
```

### B43

```asm
ACALL DELAY
```

### B44

```asm
ACALL DELAY
```

### B45

```asm
MOV A,#0C0H
ACALL CMD
```

### B46

```asm
MOV A,#'3'
ACALL WCHR
```

### B47

```asm
MOV DPTR, #EXIT
ACALL WSTR
```

### B48

```asm
ACALL DELAY
```

### B49

```asm
ACALL DELAY
```

### B50

```asm
ACALL DELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 92 to 92"]
B51["B52: instructions - lines 93 to 94"]
B52["B53: instructions - lines 95 to 96"]
B53["B54: instructions - lines 97 to 97"]
B54["B55: instructions - lines 99 to 100"]
B55["B56: instructions - lines 101 to 101"]
B56["B57: instructions - lines 102 to 102"]
B57["B58: instructions - lines 103 to 107"]
B58["B59: LOOP1 - lines 109 to 109"]
B59["B60: instructions - lines 110 to 110"]
B50 -->|call| B218
B50 -->|after return| B51
B51 -->|call| B205
B51 -->|after return| B52
B52 -->|call| B240
B52 -->|after return| B53
B53 -->|call| B98
B53 -->|after return| B54
B54 -->|call| B205
B54 -->|after return| B55
B55 -->|call| B223
B55 -->|after return| B56
B56 -->|call| B200
B56 -->|after return| B57
B57 -->|condition true| B60
B57 -->|condition false| B58
B58 -->|call| B103
B58 -->|after return| B59
B59 -->|call| B177
B59 -->|after return| B60
B218["Continue at B219 in section 22"]
B205["Continue at B206 in section 21"]
B240["Continue at B241 in section 25"]
B98["Continue at B99 in section 10"]
B223["Continue at B224 in section 23"]
B200["Continue at B201 in section 21"]
B60["Continue at B61 in section 7"]
B103["Continue at B104 in section 11"]
B177["Continue at B178 in section 18"]
```

### B51

```asm
ACALL CLEAR
```

### B52

```asm
MOV A, #80H
ACALL CMD
```

### B53

```asm
MOV DPTR, #ENTER
ACALL WSTR
```

### B54

```asm
ACALL DELAY
```

### B55

```asm
MOV A, #0C0H
ACALL CMD
```

### B56

```asm
ACALL KEYPAD
```

### B57

```asm
ACALL WCHR
```

### B58

```asm
SUBB A,#30H
MOV R7,A
CJNE R7,#1, LOOP2
```

### B59

```asm
ACALL LOOOP1
```

### B60

```asm
ACALL TRIAL
```

## Section 7

```mermaid
flowchart TD
B60["B61: LOOP2 - lines 113 to 113"]
B61["B62: instructions - lines 114 to 114"]
B62["B63: instructions - lines 115 to 115"]
B63["B64: LOOP3 - lines 118 to 118"]
B64["B65: instructions - lines 119 to 119"]
B65["B66: ERROR - lines 122 to 123"]
B66["B67: instructions - lines 124 to 125"]
B67["B68: instructions - lines 126 to 127"]
B68["B69: instructions - lines 128 to 129"]
B69["B70: instructions - lines 130 to 131"]
B60 -->|condition true| B63
B60 -->|condition false| B61
B61 -->|call| B140
B61 -->|after return| B62
B62 -->|call| B177
B62 -->|after return| B63
B63 -->|condition true| B65
B63 -->|condition false| B64
B64 -->|jump| B81
B65 -->|call| B98
B65 -->|after return| B66
B66 -->|call| B98
B66 -->|after return| B67
B67 -->|call| B98
B67 -->|after return| B68
B68 -->|call| B98
B68 -->|after return| B69
B69 -->|call| B98
B69 -->|after return| B70
B140["Continue at B141 in section 15"]
B177["Continue at B178 in section 18"]
B81["Continue at B82 in section 9"]
B98["Continue at B99 in section 10"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
CJNE R7,#2,LOOP3
```

### B62

```asm
ACALL LOOOP2
```

### B63

```asm
ACALL TRIAL
```

### B64

```asm
CJNE A,#3,ERROR
```

### B65

```asm
AJMP FINISH
```

### B66

```asm
SETB P1.6
ACALL DELAY
```

### B67

```asm
CLR P1.6
ACALL DELAY
```

### B68

```asm
SETB P1.6
ACALL DELAY
```

### B69

```asm
CLR P1.6
ACALL DELAY
```

### B70

```asm
SETB P1.6
ACALL DELAY
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 132 to 133"]
B71["B72: instructions - lines 134 to 134"]
B72["B73: instructions - lines 135 to 136"]
B73["B74: instructions - lines 137 to 138"]
B74["B75: instructions - lines 139 to 139"]
B75["B76: instructions - lines 140 to 140"]
B76["B77: instructions - lines 141 to 142"]
B77["B78: instructions - lines 143 to 144"]
B78["B79: instructions - lines 145 to 145"]
B79["B80: instructions - lines 146 to 146"]
B70 -->|call| B98
B70 -->|after return| B71
B71 -->|call| B218
B71 -->|after return| B72
B72 -->|call| B205
B72 -->|after return| B73
B73 -->|call| B240
B73 -->|after return| B74
B74 -->|call| B98
B74 -->|after return| B75
B75 -->|call| B98
B75 -->|after return| B76
B76 -->|call| B205
B76 -->|after return| B77
B77 -->|call| B240
B77 -->|after return| B78
B78 -->|call| B98
B78 -->|after return| B79
B79 -->|call| B98
B79 -->|after return| B80
B98["Continue at B99 in section 10"]
B218["Continue at B219 in section 22"]
B205["Continue at B206 in section 21"]
B240["Continue at B241 in section 25"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
CLR P1.6
ACALL DELAY
```

### B72

```asm
ACALL CLEAR
```

### B73

```asm
MOV A, #80H
ACALL CMD
```

### B74

```asm
MOV DPTR, #ERR
ACALL WSTR
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
MOV A, #0C0H
ACALL CMD
```

### B78

```asm
MOV DPTR, #TRY
ACALL WSTR
```

### B79

```asm
ACALL DELAY
```

### B80

```asm
ACALL DELAY
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 147 to 147"]
B81["B82: FINISH - lines 151 to 151"]
B82["B83: instructions - lines 152 to 152"]
B83["B84: instructions - lines 153 to 154"]
B84["B85: instructions - lines 155 to 156"]
B85["B86: instructions - lines 157 to 157"]
B86["B87: instructions - lines 158 to 158"]
B87["B88: instructions - lines 159 to 160"]
B88["B89: instructions - lines 161 to 162"]
B89["B90: instructions - lines 163 to 163"]
B80 -->|jump| B24
B81 -->|call| B98
B81 -->|after return| B82
B82 -->|call| B218
B82 -->|after return| B83
B83 -->|call| B205
B83 -->|after return| B84
B84 -->|call| B240
B84 -->|after return| B85
B85 -->|call| B98
B85 -->|after return| B86
B86 -->|call| B98
B86 -->|after return| B87
B87 -->|call| B205
B87 -->|after return| B88
B88 -->|call| B240
B88 -->|after return| B89
B89 -->|call| B98
B89 -->|after return| B90
B24["Continue at B25 in section 3"]
B98["Continue at B99 in section 10"]
B218["Continue at B219 in section 22"]
B205["Continue at B206 in section 21"]
B240["Continue at B241 in section 25"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
AJMP MENU
```

### B82

```asm
ACALL DELAY
```

### B83

```asm
ACALL CLEAR
```

### B84

```asm
MOV A, #80H
ACALL CMD
```

### B85

```asm
MOV DPTR, #THANKU
ACALL WSTR
```

### B86

```asm
ACALL DELAY
```

### B87

```asm
ACALL DELAY
```

### B88

```asm
MOV A, #0C0H
ACALL CMD
```

### B89

```asm
MOV DPTR, #THANKU2
ACALL WSTR
```

### B90

```asm
ACALL DELAY
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 164 to 164"]
B91["B92: instructions - lines 165 to 165"]
B92["B93: instructions - lines 166 to 166"]
B93["B94: instructions - lines 167 to 167"]
B94["B95: instructions - lines 168 to 168"]
B95["B96: instructions - lines 169 to 169"]
B96["B97: instructions - lines 170 to 170"]
B97["B98: instructions - lines 171 to 171"]
B98["B99: DELAY - lines 177 to 177"]
B99["B100: HE2 - lines 178 to 178"]
B90 -->|call| B98
B90 -->|after return| B91
B91 -->|call| B98
B91 -->|after return| B92
B92 -->|call| B98
B92 -->|after return| B93
B93 -->|call| B98
B93 -->|after return| B94
B94 -->|call| B98
B94 -->|after return| B95
B95 -->|call| B98
B95 -->|after return| B96
B96 -->|call| B98
B96 -->|after return| B97
B97 -->|jump| B81
B98 -->|next| B99
B99 -->|next| B100
B81["Continue at B82 in section 9"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL DELAY
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
ACALL DELAY
```

### B98

```asm
SJMP FINISH
```

### B99

```asm
MOV R1,#100
```

### B100

```asm
MOV R0,#100
```

## Section 11

```mermaid
flowchart TD
B100["B101: HE - lines 179 to 179"]
B101["B102: instructions - lines 180 to 180"]
B102["B103: instructions - lines 181 to 181"]
B103["B104: LOOOP1 - lines 184 to 184"]
B104["B105: instructions - lines 185 to 185"]
B105["B106: instructions - lines 186 to 187"]
B106["B107: instructions - lines 188 to 189"]
B107["B108: instructions - lines 190 to 190"]
B108["B109: instructions - lines 191 to 191"]
B109["B110: instructions - lines 192 to 193"]
B100 -->|condition true| B100
B100 -->|condition false| B101
B101 -->|condition true| B99
B101 -->|condition false| B102
B103 -->|call| B218
B103 -->|after return| B104
B104 -->|call| B98
B104 -->|after return| B105
B105 -->|call| B205
B105 -->|after return| B106
B106 -->|call| B240
B106 -->|after return| B107
B107 -->|call| B98
B107 -->|after return| B108
B108 -->|call| B98
B108 -->|after return| B109
B109 -->|call| B205
B109 -->|after return| B110
B99["Continue at B100 in section 10"]
B218["Continue at B219 in section 22"]
B98["Continue at B99 in section 10"]
B205["Continue at B206 in section 21"]
B240["Continue at B241 in section 25"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
DJNZ R0,HE
```

### B102

```asm
DJNZ R1,HE2
```

### B103

Return to the instruction following the active call.

```asm
RET
```

### B104

```asm
ACALL CLEAR
```

### B105

```asm
ACALL DELAY
```

### B106

```asm
MOV A, #80H
ACALL CMD
```

### B107

```asm
MOV DPTR, #YOUCHOSE
ACALL WSTR
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
MOV A,#0C0H
ACALL CMD
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 194 to 195"]
B111["B112: instructions - lines 196 to 196"]
B112["B113: instructions - lines 197 to 197"]
B113["B114: instructions - lines 199 to 199"]
B114["B115: instructions - lines 200 to 201"]
B115["B116: instructions - lines 202 to 203"]
B116["B117: instructions - lines 204 to 204"]
B117["B118: instructions - lines 205 to 205"]
B118["B119: instructions - lines 206 to 207"]
B119["B120: instructions - lines 208 to 208"]
B110 -->|call| B240
B110 -->|after return| B111
B111 -->|call| B98
B111 -->|after return| B112
B112 -->|call| B98
B112 -->|after return| B113
B113 -->|call| B218
B113 -->|after return| B114
B114 -->|call| B205
B114 -->|after return| B115
B115 -->|call| B240
B115 -->|after return| B116
B116 -->|call| B98
B116 -->|after return| B117
B117 -->|call| B98
B117 -->|after return| B118
B118 -->|call| B205
B118 -->|after return| B119
B119 -->|call| B223
B119 -->|after return| B120
B240["Continue at B241 in section 25"]
B98["Continue at B99 in section 10"]
B218["Continue at B219 in section 22"]
B205["Continue at B206 in section 21"]
B223["Continue at B224 in section 23"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV DPTR, #AVG
ACALL WSTR
```

### B112

```asm
ACALL DELAY
```

### B113

```asm
ACALL DELAY
```

### B114

```asm
ACALL CLEAR
```

### B115

```asm
MOV A,#80H
ACALL CMD
```

### B116

```asm
MOV DPTR, #ENTER
ACALL WSTR
```

### B117

```asm
ACALL DELAY
```

### B118

```asm
ACALL DELAY
```

### B119

```asm
MOV A,#0C0H
ACALL CMD
```

### B120

```asm
ACALL KEYPAD
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 209 to 209"]
B121["B122: instructions - lines 210 to 215"]
B122["B123: instructions - lines 216 to 216"]
B123["B124: instructions - lines 217 to 222"]
B124["B125: instructions - lines 223 to 224"]
B125["B126: instructions - lines 225 to 227"]
B126["B127: instructions - lines 228 to 235"]
B127["B128: instructions - lines 236 to 236"]
B128["B129: instructions - lines 238 to 238"]
B129["B130: instructions - lines 239 to 239"]
B120 -->|call| B200
B120 -->|after return| B121
B121 -->|call| B223
B121 -->|after return| B122
B122 -->|call| B200
B122 -->|after return| B123
B123 -->|call| B205
B123 -->|after return| B124
B124 -->|call| B200
B124 -->|after return| B125
B125 -->|call| B200
B125 -->|after return| B126
B126 -->|call| B98
B126 -->|after return| B127
B127 -->|call| B98
B127 -->|after return| B128
B128 -->|call| B218
B128 -->|after return| B129
B129 -->|call| B98
B129 -->|after return| B130
B200["Continue at B201 in section 21"]
B223["Continue at B224 in section 23"]
B205["Continue at B206 in section 21"]
B98["Continue at B99 in section 10"]
B218["Continue at B219 in section 22"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
ACALL WCHR
```

### B122

```asm
MOV 60H,A
SUBB A,#30H
MOV B,#10
MUL AB
MOV R1,A
ACALL KEYPAD
```

### B123

```asm
ACALL WCHR
```

### B124

```asm
MOV 61H,A
SUBB A,#30H
ADD A,R1
MOV R1,A
MOV A,#0C3H
ACALL CMD
```

### B125

```asm
MOV A,60H
ACALL WCHR
```

### B126

```asm
MOV A,61H
ADD A,#1
ACALL WCHR
```

### B127

```asm
MOV A,R1
ADD A,#1
ADD A,R1
MOV B,#2
DIV AB
MOV 70H,A
ACALL DELAY
```

### B128

```asm
ACALL DELAY
```

### B129

```asm
ACALL CLEAR
```

### B130

```asm
ACALL DELAY
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 240 to 241"]
B131["B132: instructions - lines 242 to 243"]
B132["B133: instructions - lines 244 to 244"]
B133["B134: instructions - lines 245 to 246"]
B134["B135: instructions - lines 247 to 247"]
B135["B136: instructions - lines 248 to 248"]
B136["B137: instructions - lines 251 to 255"]
B137["B138: instructions - lines 256 to 258"]
B138["B139: instructions - lines 259 to 259"]
B139["B140: instructions - lines 262 to 262"]
B130 -->|call| B205
B130 -->|after return| B131
B131 -->|call| B240
B131 -->|after return| B132
B132 -->|call| B98
B132 -->|after return| B133
B133 -->|call| B205
B133 -->|after return| B134
B134 -->|call| B98
B134 -->|after return| B135
B135 -->|call| B98
B135 -->|after return| B136
B136 -->|call| B200
B136 -->|after return| B137
B137 -->|call| B200
B137 -->|after return| B138
B138 -->|call| B98
B138 -->|after return| B139
B205["Continue at B206 in section 21"]
B240["Continue at B241 in section 25"]
B98["Continue at B99 in section 10"]
B200["Continue at B201 in section 21"]
```

### B131

```asm
MOV A, #80H
ACALL CMD
```

### B132

```asm
MOV DPTR, #AVGMSG
ACALL WSTR
```

### B133

```asm
ACALL DELAY
```

### B134

```asm
MOV A,#0C0H
ACALL CMD
```

### B135

```asm
ACALL DELAY
```

### B136

```asm
ACALL DELAY
```

### B137

```asm
MOV A,70H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B138

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B139

```asm
ACALL DELAY
```

### B140

Return to the instruction following the active call.

```asm
RET
```

## Section 15

```mermaid
flowchart TD
B140["B141: LOOOP2 - lines 265 to 265"]
B141["B142: instructions - lines 266 to 266"]
B142["B143: instructions - lines 267 to 268"]
B143["B144: instructions - lines 269 to 270"]
B144["B145: instructions - lines 271 to 271"]
B145["B146: instructions - lines 272 to 272"]
B146["B147: instructions - lines 273 to 274"]
B147["B148: instructions - lines 275 to 276"]
B148["B149: instructions - lines 277 to 277"]
B149["B150: instructions - lines 278 to 278"]
B140 -->|call| B218
B140 -->|after return| B141
B141 -->|call| B98
B141 -->|after return| B142
B142 -->|call| B205
B142 -->|after return| B143
B143 -->|call| B240
B143 -->|after return| B144
B144 -->|call| B98
B144 -->|after return| B145
B145 -->|call| B98
B145 -->|after return| B146
B146 -->|call| B205
B146 -->|after return| B147
B147 -->|call| B240
B147 -->|after return| B148
B148 -->|call| B98
B148 -->|after return| B149
B149 -->|call| B98
B149 -->|after return| B150
B218["Continue at B219 in section 22"]
B98["Continue at B99 in section 10"]
B205["Continue at B206 in section 21"]
B240["Continue at B241 in section 25"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
ACALL CLEAR
```

### B142

```asm
ACALL DELAY
```

### B143

```asm
MOV A, #80H
ACALL CMD
```

### B144

```asm
MOV DPTR, #YOUCHOSE
ACALL WSTR
```

### B145

```asm
ACALL DELAY
```

### B146

```asm
ACALL DELAY
```

### B147

```asm
MOV A,#0C0H
ACALL CMD
```

### B148

```asm
MOV DPTR, #ZZ
ACALL WSTR
```

### B149

```asm
ACALL DELAY
```

### B150

```asm
ACALL DELAY
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 280 to 280"]
B151["B152: instructions - lines 281 to 282"]
B152["B153: instructions - lines 283 to 284"]
B153["B154: instructions - lines 285 to 285"]
B154["B155: instructions - lines 286 to 286"]
B155["B156: instructions - lines 287 to 288"]
B156["B157: instructions - lines 289 to 289"]
B157["B158: instructions - lines 290 to 290"]
B158["B159: instructions - lines 291 to 295"]
B159["B160: instructions - lines 296 to 296"]
B150 -->|call| B218
B150 -->|after return| B151
B151 -->|call| B205
B151 -->|after return| B152
B152 -->|call| B240
B152 -->|after return| B153
B153 -->|call| B98
B153 -->|after return| B154
B154 -->|call| B98
B154 -->|after return| B155
B155 -->|call| B205
B155 -->|after return| B156
B156 -->|call| B223
B156 -->|after return| B157
B157 -->|call| B200
B157 -->|after return| B158
B158 -->|call| B223
B158 -->|after return| B159
B159 -->|call| B200
B159 -->|after return| B160
B218["Continue at B219 in section 22"]
B205["Continue at B206 in section 21"]
B240["Continue at B241 in section 25"]
B98["Continue at B99 in section 10"]
B223["Continue at B224 in section 23"]
B200["Continue at B201 in section 21"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
ACALL CLEAR
```

### B152

```asm
MOV A,#80H
ACALL CMD
```

### B153

```asm
MOV DPTR, #ENTER
ACALL WSTR
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
MOV A,#0C0H
ACALL CMD
```

### B157

```asm
ACALL KEYPAD
```

### B158

```asm
ACALL WCHR
```

### B159

```asm
SUBB A,#30H
MOV B,#16
MUL AB
MOV R1,A
ACALL KEYPAD
```

### B160

```asm
ACALL WCHR
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 297 to 305"]
B161["B162: X8 - lines 307 to 308"]
B162["B163: instructions - lines 309 to 309"]
B163["B164: instructions - lines 310 to 310"]
B164["B165: ZEROS - lines 312 to 313"]
B165["B166: DISP - lines 318 to 318"]
B166["B167: instructions - lines 319 to 319"]
B167["B168: instructions - lines 320 to 321"]
B168["B169: instructions - lines 322 to 323"]
B169["B170: instructions - lines 324 to 324"]
B160 -->|next| B161
B161 -->|condition true| B164
B161 -->|condition false| B162
B162 -->|condition true| B161
B162 -->|condition false| B163
B163 -->|jump| B165
B164 -->|condition true| B161
B164 -->|condition false| B165
B165 -->|call| B218
B165 -->|after return| B166
B166 -->|call| B98
B166 -->|after return| B167
B167 -->|call| B205
B167 -->|after return| B168
B168 -->|call| B240
B168 -->|after return| B169
B169 -->|call| B98
B169 -->|after return| B170
B218["Continue at B219 in section 22"]
B98["Continue at B99 in section 10"]
B205["Continue at B206 in section 21"]
B240["Continue at B241 in section 25"]
B170["Continue at B171 in section 18"]
```

### B161

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

### B162

```asm
RLC A
JNC ZEROS
```

### B163

```asm
DJNZ R4,X8
```

### B164

```asm
SJMP DISP
```

### B165

```asm
INC 20H
DJNZ R4,X8
```

### B166

```asm
ACALL CLEAR
```

### B167

```asm
ACALL DELAY
```

### B168

```asm
MOV A, #80H
ACALL CMD
```

### B169

```asm
MOV DPTR, #ZZMSG
ACALL WSTR
```

### B170

```asm
ACALL DELAY
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 325 to 325"]
B171["B172: instructions - lines 326 to 327"]
B172["B173: instructions - lines 329 to 329"]
B173["B174: instructions - lines 330 to 330"]
B174["B175: instructions - lines 332 to 334"]
B175["B176: instructions - lines 335 to 335"]
B176["B177: instructions - lines 337 to 337"]
B177["B178: TRIAL - lines 341 to 341"]
B178["B179: instructions - lines 342 to 343"]
B179["B180: instructions - lines 344 to 345"]
B170 -->|call| B98
B170 -->|after return| B171
B171 -->|call| B205
B171 -->|after return| B172
B172 -->|call| B98
B172 -->|after return| B173
B173 -->|call| B98
B173 -->|after return| B174
B174 -->|call| B200
B174 -->|after return| B175
B175 -->|call| B98
B175 -->|after return| B176
B177 -->|call| B218
B177 -->|after return| B178
B178 -->|call| B205
B178 -->|after return| B179
B179 -->|call| B240
B179 -->|after return| B180
B98["Continue at B99 in section 10"]
B205["Continue at B206 in section 21"]
B200["Continue at B201 in section 21"]
B218["Continue at B219 in section 22"]
B240["Continue at B241 in section 25"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
ACALL DELAY
```

### B172

```asm
MOV A,#0C0H
ACALL CMD
```

### B173

```asm
ACALL DELAY
```

### B174

```asm
ACALL DELAY
```

### B175

```asm
MOV A,20H
ADD A,#30H
ACALL WCHR
```

### B176

```asm
ACALL DELAY
```

### B177

Return to the instruction following the active call.

```asm
RET
```

### B178

```asm
ACALL CLEAR
```

### B179

```asm
mov a, #80H
acall cmd
```

### B180

```asm
mov dptr, #AG
acall wstr
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 346 to 347"]
B181["B182: instructions - lines 348 to 349"]
B182["B183: instructions - lines 350 to 351"]
B183["B184: instructions - lines 352 to 352"]
B184["B185: instructions - lines 353 to 353"]
B185["B186: instructions - lines 354 to 354"]
B186["B187: instructions - lines 355 to 355"]
B187["B188: NE - lines 358 to 358"]
B188["B189: instructions - lines 359 to 359"]
B189["B190: WRO - lines 362 to 362"]
B180 -->|call| B205
B180 -->|after return| B181
B181 -->|call| B200
B181 -->|after return| B182
B182 -->|call| B240
B182 -->|after return| B183
B183 -->|call| B98
B183 -->|after return| B184
B184 -->|call| B223
B184 -->|after return| B185
B185 -->|condition true| B187
B185 -->|condition false| B186
B186 -->|jump| B24
B187 -->|condition true| B189
B187 -->|condition false| B188
B188 -->|jump| B81
B189 -->|call| B218
B189 -->|after return| B190
B205["Continue at B206 in section 21"]
B200["Continue at B201 in section 21"]
B240["Continue at B241 in section 25"]
B98["Continue at B99 in section 10"]
B223["Continue at B224 in section 23"]
B24["Continue at B25 in section 3"]
B81["Continue at B82 in section 9"]
B218["Continue at B219 in section 22"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
mov a,#0c0h
acall cmd
```

### B182

```asm
MOV A,#'2'
ACALL WCHR
```

### B183

```asm
mov dptr, #EXIT
acall wstr
```

### B184

```asm
ACALL DELAY
```

### B185

```asm
ACALL KEYPAD
```

### B186

```asm
CJNE A,#31H,NE
```

### B187

```asm
LJMP MENU
```

### B188

```asm
CJNE A,#'2',WRO
```

### B189

```asm
LJMP FINISH
```

### B190

```asm
ACALL CLEAR
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 363 to 364"]
B191["B192: instructions - lines 365 to 366"]
B192["B193: instructions - lines 367 to 367"]
B193["B194: instructions - lines 368 to 368"]
B194["B195: instructions - lines 369 to 370"]
B195["B196: instructions - lines 371 to 372"]
B196["B197: instructions - lines 373 to 373"]
B197["B198: instructions - lines 374 to 374"]
B198["B199: instructions - lines 375 to 375"]
B199["B200: instructions - lines 377 to 377"]
B190 -->|call| B205
B190 -->|after return| B191
B191 -->|call| B240
B191 -->|after return| B192
B192 -->|call| B98
B192 -->|after return| B193
B193 -->|call| B98
B193 -->|after return| B194
B194 -->|call| B205
B194 -->|after return| B195
B195 -->|call| B240
B195 -->|after return| B196
B196 -->|call| B98
B196 -->|after return| B197
B197 -->|call| B98
B197 -->|after return| B198
B198 -->|jump| B177
B205["Continue at B206 in section 21"]
B240["Continue at B241 in section 25"]
B98["Continue at B99 in section 10"]
B177["Continue at B178 in section 18"]
```

### B191

```asm
MOV A, #80H
ACALL CMD
```

### B192

```asm
MOV DPTR, #ERR
ACALL WSTR
```

### B193

```asm
ACALL DELAY
```

### B194

```asm
ACALL DELAY
```

### B195

```asm
MOV A, #0C0H
ACALL CMD
```

### B196

```asm
MOV DPTR, #TRY
ACALL WSTR
```

### B197

```asm
ACALL DELAY
```

### B198

```asm
ACALL DELAY
```

### B199

```asm
SJMP HERE1
```

### B200

Return to the instruction following the active call.

```asm
RET
```

## Section 21

```mermaid
flowchart TD
B200["B201: WCHR - lines 380 to 384"]
B201["B202: instructions - lines 385 to 385"]
B202["B203: instructions - lines 386 to 388"]
B203["B204: instructions - lines 389 to 389"]
B204["B205: instructions - lines 390 to 392"]
B205["B206: CMD - lines 395 to 397"]
B206["B207: instructions - lines 398 to 398"]
B207["B208: instructions - lines 399 to 401"]
B208["B209: instructions - lines 402 to 402"]
B209["B210: instructions - lines 403 to 403"]
B200 -->|call| B210
B200 -->|after return| B201
B201 -->|call| B216
B201 -->|after return| B202
B202 -->|call| B210
B202 -->|after return| B203
B203 -->|call| B216
B203 -->|after return| B204
B205 -->|call| B210
B205 -->|after return| B206
B206 -->|call| B216
B206 -->|after return| B207
B207 -->|call| B210
B207 -->|after return| B208
B208 -->|call| B216
B208 -->|after return| B209
B210["Continue at B211 in section 22"]
B216["Continue at B217 in section 22"]
```

### B201

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B202

```asm
ACALL LDELAY
```

### B203

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B204

```asm
ACALL LDELAY
```

### B205

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B206

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B207

```asm
ACALL LDELAY
```

### B208

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B209

```asm
ACALL LDELAY
```

### B210

Return to the instruction following the active call.

```asm
RET
```

## Section 22

```mermaid
flowchart TD
B210["B211: COMMON - lines 406 to 411"]
B211["B212: INLCD - lines 414 to 421"]
B212["B213: instructions - lines 422 to 430"]
B213["B214: instructions - lines 431 to 443"]
B214["B215: instructions - lines 444 to 454"]
B215["B216: instructions - lines 455 to 455"]
B216["B217: LDELAY - lines 458 to 459"]
B217["B218: instructions - lines 460 to 460"]
B218["B219: CLEAR - lines 463 to 464"]
B219["B220: instructions - lines 465 to 465"]
B211 -->|call| B216
B211 -->|after return| B212
B212 -->|call| B216
B212 -->|after return| B213
B213 -->|call| B216
B213 -->|after return| B214
B214 -->|call| B216
B214 -->|after return| B215
B216 -->|condition true| B216
B216 -->|condition false| B217
B218 -->|call| B205
B218 -->|after return| B219
B219 -->|next| B220
B205["Continue at B206 in section 21"]
B220["Continue at B221 in section 23"]
```

### B211

Return to the instruction following the active call.

```asm
ANL A,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B212

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

### B213

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

### B214

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

### B215

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

### B216

Return to the instruction following the active call.

```asm
RET
```

### B217

```asm
MOV R0, #50
DJNZ R0, $
```

### B218

Return to the instruction following the active call.

```asm
RET
```

### B219

```asm
MOV A,#01H
ACALL CMD
```

### B220

```asm
MOV R7,#14
```

## Section 23

```mermaid
flowchart TD
B220["B221: WAIT - lines 466 to 466"]
B221["B222: instructions - lines 467 to 467"]
B222["B223: instructions - lines 468 to 468"]
B223["B224: KEYPAD - lines 471 to 471"]
B224["B225: K1 - lines 472 to 475"]
B225["B226: K2 - lines 477 to 479"]
B226["B227: instructions - lines 480 to 480"]
B227["B228: OVER1 - lines 482 to 485"]
B228["B229: instructions - lines 486 to 489"]
B229["B230: instructions - lines 490 to 493"]
B220 -->|call| B216
B220 -->|after return| B221
B221 -->|condition true| B220
B221 -->|condition false| B222
B223 -->|next| B224
B224 -->|condition true| B224
B224 -->|condition false| B225
B225 -->|condition true| B227
B225 -->|condition false| B226
B226 -->|jump| B225
B227 -->|condition true| B232
B227 -->|condition false| B228
B228 -->|condition true| B233
B228 -->|condition false| B229
B229 -->|condition true| B234
B229 -->|condition false| B230
B216["Continue at B217 in section 22"]
B232["Continue at B233 in section 24"]
B233["Continue at B234 in section 24"]
B234["Continue at B235 in section 24"]
B230["Continue at B231 in section 24"]
```

### B221

```asm
ACALL LDELAY
```

### B222

```asm
DJNZ R7,WAIT
```

### B223

Return to the instruction following the active call.

```asm
RET
```

### B224

```asm
MOV P0,#01110000B
```

### B225

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B226

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B227

```asm
SJMP K2
```

### B228

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B229

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B230

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

## Section 24

```mermaid
flowchart TD
B230["B231: instructions - lines 494 to 497"]
B231["B232: instructions - lines 498 to 498"]
B232["B233: ROW_0 - lines 499 to 500"]
B233["B234: ROW_1 - lines 501 to 502"]
B234["B235: ROW_2 - lines 503 to 504"]
B235["B236: ROW_3 - lines 505 to 505"]
B236["B237: FIND - lines 507 to 507"]
B237["B238: FIND1 - lines 509 to 510"]
B238["B239: instructions - lines 511 to 512"]
B239["B240: MATCH - lines 513 to 515"]
B230 -->|condition true| B235
B230 -->|condition false| B231
B231 -->|jump| B225
B232 -->|jump| B236
B233 -->|jump| B236
B234 -->|jump| B236
B235 -->|next| B236
B236 -->|next| B237
B237 -->|condition true| B239
B237 -->|condition false| B238
B238 -->|jump| B237
B225["Continue at B226 in section 23"]
```

### B231

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B232

```asm
LJMP K2
```

### B233

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B234

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B235

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B236

```asm
MOV DPTR,#KCODE3
```

### B237

```asm
RLC A
```

### B238

```asm
RLC A
JNC MATCH
```

### B239

```asm
INC DPTR
SJMP FIND1
```

### B240

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

## Section 25

```mermaid
flowchart TD
B240["B241: WSTR - lines 525 to 525"]
B241["B242: CONT1 - lines 527 to 529"]
B242["B243: PRINT - lines 531 to 531"]
B243["B244: instructions - lines 532 to 533"]
B244["B245: EXIT1 - lines 534 to 535"]
B240 -->|next| B241
B241 -->|condition true| B244
B241 -->|condition false| B242
B242 -->|call| B200
B242 -->|after return| B243
B243 -->|jump| B241
B200["Continue at B201 in section 21"]
```

### B241

```asm
PUSH    ACC
```

### B242

```asm
CLR     A
MOVC    A,@A+DPTR
JZ EXIT1
```

### B243

```asm
ACALL    WCHR
```

### B244

```asm
INC DPTR
AJMP    CONT1
```

### B245

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
