# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12)

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
B0 -->|call| B95
B0 -->|after return| B1
B1 -->|call| B89
B1 -->|after return| B2
B2 -->|call| B107
B2 -->|after return| B3
B3 -->|call| B79
B3 -->|after return| B4
B4 -->|call| B79
B4 -->|after return| B5
B5 -->|call| B89
B5 -->|after return| B6
B6 -->|call| B107
B6 -->|after return| B7
B7 -->|call| B79
B7 -->|after return| B8
B8 -->|call| B79
B8 -->|after return| B9
B9 -->|call| B89
B9 -->|after return| B10
B95["Continue at B96 in section 10"]
B89["Continue at B90 in section 9"]
B107["Continue at B108 in section 11"]
B79["Continue at B80 in section 8"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV a, #80H
ACALL cmd
```

### B3

```asm
mov dptr, #STR
acall wstr
```

### B4

```asm
acall delay
```

### B5

```asm
acall delay
```

### B6

```asm
MOV a, #80H
ACALL cmd
```

### B7

```asm
mov dptr, #NAME
acall wstr
```

### B8

```asm
acall delay
```

### B9

```asm
acall delay
```

### B10

```asm
mov a,#0c0h
acall cmd
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
B10 -->|call| B107
B10 -->|after return| B11
B11 -->|call| B79
B11 -->|after return| B12
B12 -->|call| B79
B12 -->|after return| B13
B13 -->|call| B102
B13 -->|after return| B14
B14 -->|call| B79
B14 -->|after return| B15
B15 -->|call| B89
B15 -->|after return| B16
B16 -->|call| B107
B16 -->|after return| B17
B17 -->|call| B79
B17 -->|after return| B18
B18 -->|call| B79
B18 -->|after return| B19
B19 -->|call| B89
B19 -->|after return| B20
B107["Continue at B108 in section 11"]
B79["Continue at B80 in section 8"]
B102["Continue at B103 in section 11"]
B89["Continue at B90 in section 9"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
mov dptr, #ID
acall wstr
```

### B12

```asm
acall delay
```

### B13

```asm
acall delay
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
ACALL cmd
```

### B17

```asm
mov dptr, #CHOSE
acall wstr
```

### B18

```asm
acall delay
```

### B19

```asm
acall delay
```

### B20

```asm
MOV A, #80H
ACALL cmd
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
B27["B28: instructions - lines 55 to 56"]
B28["B29: LOOP1 - lines 59 to 69"]
B29["B30: instructions - lines 70 to 70"]
B20 -->|call| B107
B20 -->|after return| B21
B21 -->|call| B79
B21 -->|after return| B22
B22 -->|call| B79
B22 -->|after return| B23
B23 -->|call| B89
B23 -->|after return| B24
B24 -->|call| B107
B24 -->|after return| B25
B25 -->|call| B79
B25 -->|after return| B26
B26 -->|call| B79
B26 -->|after return| B27
B27 -->|condition true| B41
B27 -->|condition false| B28
B28 -->|call| B102
B28 -->|after return| B29
B29 -->|call| B79
B29 -->|after return| B30
B107["Continue at B108 in section 11"]
B79["Continue at B80 in section 8"]
B89["Continue at B90 in section 9"]
B41["Continue at B42 in section 5"]
B102["Continue at B103 in section 11"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
mov dptr, #MODE1
acall wstr
```

### B22

```asm
acall delay
```

### B23

```asm
acall delay
```

### B24

```asm
mov A,#0c0h
acall cmd
```

### B25

```asm
mov dptr, #MODE2
acall wstr
```

### B26

```asm
acall delay
```

### B27

```asm
acall delay
```

### B28

```asm
MOV R7,#4
CJNE R7,#1, LOOP2
```

### B29

```asm
MOV R1,#90
MOV A,R1
ADD A,#1
ADD A,R1
MOV B,#2
DIV AB
MOV 70H,A
ACALL CLEAR
```

### B30

```asm
ACALL DELAY
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 71 to 72"]
B31["B32: instructions - lines 73 to 74"]
B32["B33: instructions - lines 75 to 75"]
B33["B34: instructions - lines 76 to 76"]
B34["B35: instructions - lines 77 to 78"]
B35["B36: instructions - lines 80 to 80"]
B36["B37: instructions - lines 81 to 81"]
B37["B38: instructions - lines 83 to 87"]
B38["B39: instructions - lines 88 to 90"]
B39["B40: instructions - lines 91 to 91"]
B30 -->|call| B89
B30 -->|after return| B31
B31 -->|call| B107
B31 -->|after return| B32
B32 -->|call| B79
B32 -->|after return| B33
B33 -->|call| B79
B33 -->|after return| B34
B34 -->|call| B89
B34 -->|after return| B35
B35 -->|call| B79
B35 -->|after return| B36
B36 -->|call| B79
B36 -->|after return| B37
B37 -->|call| B84
B37 -->|after return| B38
B38 -->|call| B84
B38 -->|after return| B39
B39 -->|call| B79
B39 -->|after return| B40
B89["Continue at B90 in section 9"]
B107["Continue at B108 in section 11"]
B79["Continue at B80 in section 8"]
B84["Continue at B85 in section 9"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV A, #80H
ACALL cmd
```

### B32

```asm
mov dptr, #AVGMSG
acall wstr
```

### B33

```asm
acall delay
```

### B34

```asm
acall delay
```

### B35

```asm
mov A,#0c0h
acall cmd
```

### B36

```asm
acall delay
```

### B37

```asm
acall delay
```

### B38

```asm
MOV A,70H
MOV B,#10
DIV AB
ADD A,#30H
acall WCHR
```

### B39

```asm
MOV A,B
ADD A,#30H
acall WCHR
```

### B40

```asm
ACALL DELAY
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 93 to 93"]
B41["B42: LOOP2 - lines 96 to 96"]
B42["B43: instructions - lines 97 to 97"]
B43["B44: instructions - lines 98 to 98"]
B44["B45: instructions - lines 99 to 100"]
B45["B46: instructions - lines 101 to 102"]
B46["B47: instructions - lines 103 to 103"]
B47["B48: instructions - lines 104 to 104"]
B48["B49: instructions - lines 105 to 106"]
B49["B50: instructions - lines 107 to 108"]
B40 -->|jump| B78
B41 -->|condition true| B70
B41 -->|condition false| B42
B42 -->|call| B102
B42 -->|after return| B43
B43 -->|call| B79
B43 -->|after return| B44
B44 -->|call| B89
B44 -->|after return| B45
B45 -->|call| B107
B45 -->|after return| B46
B46 -->|call| B79
B46 -->|after return| B47
B47 -->|call| B79
B47 -->|after return| B48
B48 -->|call| B89
B48 -->|after return| B49
B49 -->|call| B107
B49 -->|after return| B50
B78["Continue at B79 in section 8"]
B70["Continue at B71 in section 8"]
B102["Continue at B103 in section 11"]
B79["Continue at B80 in section 8"]
B89["Continue at B90 in section 9"]
B107["Continue at B108 in section 11"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
AJMP FINISH
```

### B42

```asm
CJNE R7,#2,LOOP3
```

### B43

```asm
ACALL CLEAR
```

### B44

```asm
ACALL DELAY
```

### B45

```asm
MOV A, #80H
ACALL cmd
```

### B46

```asm
mov dptr, #YOUCHOSE
acall wstr
```

### B47

```asm
acall delay
```

### B48

```asm
acall delay
```

### B49

```asm
mov A,#0c0h
acall cmd
```

### B50

```asm
mov dptr, #ZZ
acall wstr
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 109 to 109"]
B51["B52: instructions - lines 110 to 110"]
B52["B53: instructions - lines 112 to 116"]
B53["B54: X8 - lines 118 to 119"]
B54["B55: instructions - lines 120 to 120"]
B55["B56: instructions - lines 121 to 121"]
B56["B57: ZEROS - lines 126 to 127"]
B57["B58: instructions - lines 131 to 131"]
B58["B59: instructions - lines 132 to 132"]
B59["B60: instructions - lines 133 to 134"]
B50 -->|call| B79
B50 -->|after return| B51
B51 -->|call| B79
B51 -->|after return| B52
B52 -->|next| B53
B53 -->|condition true| B56
B53 -->|condition false| B54
B54 -->|condition true| B53
B54 -->|condition false| B55
B55 -->|jump| B13
B56 -->|condition true| B53
B56 -->|condition false| B57
B57 -->|call| B102
B57 -->|after return| B58
B58 -->|call| B79
B58 -->|after return| B59
B59 -->|call| B89
B59 -->|after return| B60
B79["Continue at B80 in section 8"]
B13["Continue at B14 in section 2"]
B102["Continue at B103 in section 11"]
B89["Continue at B90 in section 9"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
acall delay
```

### B52

```asm
acall delay
```

### B53

```asm
MOV R1,#31H
MOV R5,#8
MOV 20H,#0
CLR A
MOV A,R1
```

### B54

```asm
RRC A
JNC ZEROS
```

### B55

```asm
DJNZ R5,X8
```

### B56

```asm
AJMP MENU
```

### B57

```asm
INC 20H
DJNZ R5,X8
```

### B58

```asm
ACALL CLEAR
```

### B59

```asm
ACALL DELAY
```

### B60

```asm
MOV A, #80H
ACALL cmd
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 135 to 136"]
B61["B62: instructions - lines 137 to 137"]
B62["B63: instructions - lines 138 to 138"]
B63["B64: instructions - lines 139 to 140"]
B64["B65: instructions - lines 142 to 142"]
B65["B66: instructions - lines 143 to 143"]
B66["B67: instructions - lines 145 to 147"]
B67["B68: instructions - lines 148 to 148"]
B68["B69: AA - lines 149 to 149"]
B69["B70: instructions - lines 150 to 150"]
B60 -->|call| B107
B60 -->|after return| B61
B61 -->|call| B79
B61 -->|after return| B62
B62 -->|call| B79
B62 -->|after return| B63
B63 -->|call| B89
B63 -->|after return| B64
B64 -->|call| B79
B64 -->|after return| B65
B65 -->|call| B79
B65 -->|after return| B66
B66 -->|call| B84
B66 -->|after return| B67
B67 -->|call| B79
B67 -->|after return| B68
B68 -->|jump| B68
B69 -->|jump| B78
B107["Continue at B108 in section 11"]
B79["Continue at B80 in section 8"]
B89["Continue at B90 in section 9"]
B84["Continue at B85 in section 9"]
B78["Continue at B79 in section 8"]
```

### B61

```asm
mov dptr, #ZZMSG
acall wstr
```

### B62

```asm
acall delay
```

### B63

```asm
acall delay
```

### B64

```asm
mov A,#0c0h
acall cmd
```

### B65

```asm
acall delay
```

### B66

```asm
acall delay
```

### B67

```asm
MOV A,20H
ADD A,#30H
acall WCHR
```

### B68

```asm
ACALL DELAY
```

### B69

```asm
SJMP AA
```

### B70

```asm
SJMP FINISH
```

## Section 8

```mermaid
flowchart TD
B70["B71: LOOP3 - lines 153 to 153"]
B71["B72: instructions - lines 154 to 154"]
B72["B73: ERROR - lines 157 to 158"]
B73["B74: instructions - lines 159 to 160"]
B74["B75: instructions - lines 161 to 162"]
B75["B76: instructions - lines 163 to 164"]
B76["B77: instructions - lines 165 to 166"]
B77["B78: instructions - lines 167 to 168"]
B78["B79: FINISH - lines 171 to 171"]
B79["B80: DELAY - lines 177 to 177"]
B70 -->|condition true| B72
B70 -->|condition false| B71
B71 -->|jump| B78
B72 -->|call| B79
B72 -->|after return| B73
B73 -->|call| B79
B73 -->|after return| B74
B74 -->|call| B79
B74 -->|after return| B75
B75 -->|call| B79
B75 -->|after return| B76
B76 -->|call| B79
B76 -->|after return| B77
B77 -->|call| B79
B77 -->|after return| B78
B78 -->|jump| B78
B79 -->|next| B80
B80["Continue at B81 in section 9"]
```

### B71

```asm
CJNE A,#3,ERROR
```

### B72

```asm
SJMP FINISH
```

### B73

```asm
SETB P1.6
ACALL DELAY
```

### B74

```asm
CLR P1.6
ACALL DELAY
```

### B75

```asm
SETB P1.6
ACALL DELAY
```

### B76

```asm
CLR P1.6
ACALL DELAY
```

### B77

```asm
SETB P1.6
ACALL DELAY
```

### B78

```asm
CLR P1.6
ACALL DELAY
```

### B79

```asm
SJMP FINISH
```

### B80

```asm
MOV R1,#100
```

## Section 9

```mermaid
flowchart TD
B80["B81: HE2 - lines 178 to 178"]
B81["B82: HE - lines 179 to 179"]
B82["B83: instructions - lines 180 to 180"]
B83["B84: instructions - lines 181 to 181"]
B84["B85: WCHR - lines 185 to 189"]
B85["B86: instructions - lines 190 to 190"]
B86["B87: instructions - lines 191 to 193"]
B87["B88: instructions - lines 194 to 194"]
B88["B89: instructions - lines 195 to 197"]
B89["B90: CMD - lines 200 to 202"]
B80 -->|next| B81
B81 -->|condition true| B81
B81 -->|condition false| B82
B82 -->|condition true| B80
B82 -->|condition false| B83
B84 -->|call| B94
B84 -->|after return| B85
B85 -->|call| B100
B85 -->|after return| B86
B86 -->|call| B94
B86 -->|after return| B87
B87 -->|call| B100
B87 -->|after return| B88
B89 -->|call| B94
B89 -->|after return| B90
B94["Continue at B95 in section 10"]
B100["Continue at B101 in section 11"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV R0,#100
```

### B82

```asm
DJNZ R0,he
```

### B83

```asm
djnz r1,he2
```

### B84

Return to the instruction following the active call.

```asm
RET
```

### B85

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B86

```asm
ACALL LDELAY
```

### B87

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B88

```asm
ACALL LDELAY
```

### B89

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B90

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 203 to 203"]
B91["B92: instructions - lines 204 to 206"]
B92["B93: instructions - lines 207 to 207"]
B93["B94: instructions - lines 208 to 208"]
B94["B95: COMMON - lines 211 to 216"]
B95["B96: INLCD - lines 219 to 226"]
B96["B97: instructions - lines 227 to 235"]
B97["B98: instructions - lines 236 to 248"]
B98["B99: instructions - lines 249 to 259"]
B99["B100: instructions - lines 260 to 260"]
B90 -->|call| B100
B90 -->|after return| B91
B91 -->|call| B94
B91 -->|after return| B92
B92 -->|call| B100
B92 -->|after return| B93
B95 -->|call| B100
B95 -->|after return| B96
B96 -->|call| B100
B96 -->|after return| B97
B97 -->|call| B100
B97 -->|after return| B98
B98 -->|call| B100
B98 -->|after return| B99
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL LDELAY
```

### B92

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B93

```asm
ACALL LDELAY
```

### B94

Return to the instruction following the active call.

```asm
RET
```

### B95

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B96

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

### B97

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

### B98

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

### B99

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

### B100

Return to the instruction following the active call.

```asm
RET
```

## Section 11

```mermaid
flowchart TD
B100["B101: LDELAY - lines 263 to 264"]
B101["B102: instructions - lines 265 to 265"]
B102["B103: CLEAR - lines 268 to 269"]
B103["B104: instructions - lines 270 to 270"]
B104["B105: WAIT - lines 271 to 271"]
B105["B106: instructions - lines 272 to 272"]
B106["B107: instructions - lines 273 to 273"]
B107["B108: WSTR - lines 276 to 276"]
B108["B109: CONT1 - lines 278 to 280"]
B109["B110: PRINT - lines 282 to 282"]
B100 -->|condition true| B100
B100 -->|condition false| B101
B102 -->|call| B89
B102 -->|after return| B103
B103 -->|next| B104
B104 -->|call| B100
B104 -->|after return| B105
B105 -->|condition true| B104
B105 -->|condition false| B106
B107 -->|next| B108
B108 -->|condition true| B111
B108 -->|condition false| B109
B109 -->|call| B84
B109 -->|after return| B110
B89["Continue at B90 in section 9"]
B111["Continue at B112 in section 12"]
B84["Continue at B85 in section 9"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
MOV R0, #50
DJNZ R0, $
```

### B102

Return to the instruction following the active call.

```asm
RET
```

### B103

```asm
MOV A,#01H
ACALL CMD
```

### B104

```asm
MOV R7,#14
```

### B105

```asm
ACALL LDELAY
```

### B106

```asm
DJNZ R7,WAIT
```

### B107

Return to the instruction following the active call.

```asm
ret
```

### B108

```asm
PUSH    ACC
```

### B109

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B110

```asm
ACALL    WCHR
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 283 to 284"]
B111["B112: EXIT1 - lines 285 to 286"]
B110 -->|jump| B108
B108["Continue at B109 in section 11"]
```

### B111

```asm
INC DPTR
AJMP    CONT1
```

### B112

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
