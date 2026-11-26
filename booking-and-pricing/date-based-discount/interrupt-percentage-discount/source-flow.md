# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 000H` begins at B1.
- `ORG 0003H` begins at B2.
- `ORG 030H` begins at B5.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22) · [Section 23](#section-23)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 3"]
B1["B2: AGAIN - lines 8 to 8"]
B2["B3: instructions - lines 9 to 9"]
B3["B4: instructions - lines 10 to 10"]
B4["B5: MAIN - lines 14 to 16"]
B5["B6: instructions - lines 17 to 27"]
B6["B7: instructions - lines 30 to 30"]
B7["B8: instructions - lines 31 to 31"]
B8["B9: instructions - lines 32 to 32"]
B9["B10: MAIN1 - lines 35 to 35"]
B0 -->|jump| B4
B1 -->|call| B205
B1 -->|after return| B2
B2 -->|condition true| B1
B2 -->|condition false| B3
B4 -->|call| B188
B4 -->|after return| B5
B5 -->|call| B47
B5 -->|after return| B6
B6 -->|call| B81
B6 -->|after return| B7
B7 -->|call| B54
B7 -->|after return| B8
B8 -->|call| B59
B8 -->|after return| B9
B9 -->|call| B90
B9 -->|after return| B10
B205["Continue at B206 in section 21"]
B188["Continue at B189 in section 19"]
B47["Continue at B48 in section 5"]
B81["Continue at B82 in section 9"]
B54["Continue at B55 in section 6"]
B59["Continue at B60 in section 6"]
B90["Continue at B91 in section 10"]
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
CJNE A,#'#',AGAIN
```

### B4

Resume the interrupted program.

```asm
RETI
```

### B5

```asm
MOV IE,#81H
SETB IT0
ACALL INLCD
```

### B6

```asm
MOV P1,#00
MOV R3,#21
MOV R4,#19
MOV R5,#0
MOV R0,#0
MOV R1,#0
MOV R2,#0
MOV R7,#0
MOV 20H,#0FBH
LCALL FLASH
```

### B7

```asm
acall display0
```

### B8

```asm
acall delay
```

### B9

```asm
ACALL RUN_INT
```

### B10

```asm
ACALL displayy
```

## Section 2

```mermaid
flowchart TD
B10["B11: MAIN2 - lines 39 to 39"]
B11["B12: instructions - lines 40 to 40"]
B12["B13: instructions - lines 41 to 41"]
B13["B14: instructions - lines 42 to 42"]
B14["B15: instructions - lines 45 to 45"]
B15["B16: instructions - lines 46 to 46"]
B16["B17: MAINMENUE - lines 50 to 51"]
B17["B18: instructions - lines 53 to 56"]
B18["B19: instructions - lines 57 to 57"]
B19["B20: instructions - lines 60 to 61"]
B10 -->|call| B54
B10 -->|after return| B11
B11 -->|call| B195
B11 -->|after return| B12
B12 -->|call| B54
B12 -->|after return| B13
B13 -->|call| B111
B13 -->|after return| B14
B14 -->|call| B195
B14 -->|after return| B15
B15 -->|call| B121
B15 -->|after return| B16
B16 -->|call| B47
B16 -->|after return| B17
B17 -->|call| B195
B17 -->|after return| B18
B18 -->|call| B131
B18 -->|after return| B19
B19 -->|condition true| B24
B19 -->|condition false| B20
B54["Continue at B55 in section 6"]
B195["Continue at B196 in section 20"]
B111["Continue at B112 in section 12"]
B121["Continue at B122 in section 13"]
B47["Continue at B48 in section 5"]
B131["Continue at B132 in section 14"]
B24["Continue at B25 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
acall delay
```

### B12

```asm
acall clear
```

### B13

```asm
acall delay
```

### B14

```asm
acall display1
```

### B15

```asm
acall clear
```

### B16

```asm
acall display2
```

### B17

```asm
MOV 20H,#07FH
LCALL FLASH
```

### B18

```asm
MOV A,R4
SUBB A,#1
mov R4,A
acall clear
```

### B19

```asm
acall display3
```

### B20

```asm
MOV A,R4
CJNE A,#0H,CASE2
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 63 to 64"]
B21["B22: instructions - lines 65 to 65"]
B22["B23: instructions - lines 66 to 66"]
B23["B24: instructions - lines 67 to 68"]
B24["B25: CASE2 - lines 71 to 71"]
B25["B26: CASE3 - lines 73 to 73"]
B26["B27: instructions - lines 75 to 76"]
B27["B28: instructions - lines 77 to 77"]
B28["B29: instructions - lines 78 to 78"]
B29["B30: instructions - lines 79 to 80"]
B20 -->|call| B47
B20 -->|after return| B21
B21 -->|call| B195
B21 -->|after return| B22
B22 -->|call| B139
B22 -->|after return| B23
B23 -->|jump| B39
B24 -->|condition true| B25
B24 -->|condition false| B25
B25 -->|condition true| B30
B25 -->|condition false| B26
B26 -->|call| B47
B26 -->|after return| B27
B27 -->|call| B195
B27 -->|after return| B28
B28 -->|call| B142
B28 -->|after return| B29
B29 -->|jump| B39
B47["Continue at B48 in section 5"]
B195["Continue at B196 in section 20"]
B139["Continue at B140 in section 14"]
B39["Continue at B40 in section 4"]
B30["Continue at B31 in section 4"]
B142["Continue at B143 in section 15"]
```

### B21

```asm
MOV 20H,#0BFH
LCALL FLASH
```

### B22

```asm
acall clear
```

### B23

```asm
acall display4
```

### B24

```asm
MOV R5,#0H
AJMP CALC
```

### B25

```asm
CJNE A,#10, CASE3
```

### B26

```asm
JNC CASE4
```

### B27

```asm
MOV 20H,#0eFH
LCALL FLASH
```

### B28

```asm
acall clear
```

### B29

```asm
acall display5
```

### B30

```asm
MOV R5,#1
AJMP CALC
```

## Section 4

```mermaid
flowchart TD
B30["B31: CASE4 - lines 82 to 82"]
B31["B32: CASE5 - lines 84 to 84"]
B32["B33: instructions - lines 86 to 87"]
B33["B34: instructions - lines 89 to 89"]
B34["B35: instructions - lines 90 to 90"]
B35["B36: instructions - lines 92 to 93"]
B36["B37: CASE6 - lines 96 to 97"]
B37["B38: instructions - lines 98 to 98"]
B38["B39: instructions - lines 99 to 100"]
B39["B40: CALC - lines 104 to 114"]
B30 -->|condition true| B31
B30 -->|condition false| B31
B31 -->|condition true| B36
B31 -->|condition false| B32
B32 -->|call| B47
B32 -->|after return| B33
B33 -->|call| B195
B33 -->|after return| B34
B34 -->|call| B151
B34 -->|after return| B35
B35 -->|jump| B39
B36 -->|call| B195
B36 -->|after return| B37
B37 -->|call| B170
B37 -->|after return| B38
B38 -->|jump| B39
B39 -->|call| B195
B39 -->|after return| B40
B47["Continue at B48 in section 5"]
B195["Continue at B196 in section 20"]
B151["Continue at B152 in section 16"]
B170["Continue at B171 in section 18"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
CJNE A,#20, CASE5
```

### B32

```asm
JNC CASE6
```

### B33

```asm
MOV 20H,#0f7H
LCALL FLASH
```

### B34

```asm
acall clear
```

### B35

```asm
acall display6
```

### B36

```asm
MOV R5,#2
AJMP CALC
```

### B37

```asm
MOV 20H,#00FH
acall clear
```

### B38

```asm
acall display8
```

### B39

```asm
MOV R5,#10
AJMP CALC
```

### B40

```asm
MOV B,R5
MOV A,R3
MUL AB
mov 50h,a
MOV B,#10
DIV AB
MOV R5,A
MOV A,R3
SUBB A,R5
MOV R6,A
acall clear
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 115 to 115"]
B41["B42: instructions - lines 117 to 117"]
B42["B43: LEAVE - lines 121 to 121"]
B43["B44: instructions - lines 122 to 122"]
B44["B45: instructions - lines 123 to 124"]
B45["B46: instructions - lines 125 to 126"]
B46["B47: HH - lines 128 to 128"]
B47["B48: FLASH - lines 132 to 133"]
B48["B49: instructions - lines 134 to 135"]
B49["B50: instructions - lines 136 to 137"]
B40 -->|call| B162
B40 -->|after return| B41
B41 -->|call| B65
B41 -->|after return| B42
B42 -->|call| B195
B42 -->|after return| B43
B43 -->|call| B54
B43 -->|after return| B44
B44 -->|call| B182
B44 -->|after return| B45
B45 -->|call| B200
B45 -->|after return| B46
B46 -->|jump| B46
B47 -->|call| B54
B47 -->|after return| B48
B48 -->|call| B54
B48 -->|after return| B49
B49 -->|call| B54
B49 -->|after return| B50
B162["Continue at B163 in section 17"]
B65["Continue at B66 in section 7"]
B195["Continue at B196 in section 20"]
B54["Continue at B55 in section 6"]
B182["Continue at B183 in section 19"]
B200["Continue at B201 in section 21"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
acall display7
```

### B42

```asm
ACALL CHECK
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
mov a, #80H
acall cmd
```

### B46

```asm
mov dptr, #BYE
acall wstr
```

### B47

```asm
SJMP hh
```

### B48

```asm
MOV P1,20H
ACALL DELAY
```

### B49

```asm
MOV P1,#0FFH
ACALL DELAY
```

### B50

```asm
MOV P1,20H
ACALL DELAY
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 138 to 139"]
B51["B52: instructions - lines 140 to 141"]
B52["B53: instructions - lines 142 to 143"]
B53["B54: instructions - lines 144 to 144"]
B54["B55: DELAY - lines 147 to 147"]
B55["B56: L2 - lines 148 to 148"]
B56["B57: L - lines 149 to 149"]
B57["B58: instructions - lines 150 to 150"]
B58["B59: instructions - lines 151 to 151"]
B59["B60: RUN_INT - lines 156 to 156"]
B50 -->|call| B54
B50 -->|after return| B51
B51 -->|call| B54
B51 -->|after return| B52
B52 -->|call| B54
B52 -->|after return| B53
B54 -->|next| B55
B55 -->|next| B56
B56 -->|condition true| B56
B56 -->|condition false| B57
B57 -->|condition true| B55
B57 -->|condition false| B58
B59 -->|call| B54
B59 -->|after return| B60
B60["Continue at B61 in section 7"]
```

### B51

```asm
MOV P1,#0FFH
ACALL DELAY
```

### B52

```asm
MOV P1,20H
ACALL DELAY
```

### B53

```asm
MOV P1,#0FFH
ACALL DELAY
```

### B54

Return to the instruction following the active call.

```asm
RET
```

### B55

```asm
MOV R0,#250
```

### B56

```asm
MOV R1,#10
```

### B57

```asm
DJNZ R1,L
```

### B58

```asm
DJNZ R0,L2
```

### B59

Return to the instruction following the active call.

```asm
RET
```

### B60

```asm
ACALL DELAY
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 157 to 157"]
B61["B62: instructions - lines 158 to 158"]
B62["B63: instructions - lines 159 to 160"]
B63["B64: instructions - lines 161 to 162"]
B64["B65: instructions - lines 164 to 168"]
B65["B66: CHECK - lines 171 to 171"]
B66["B67: instructions - lines 172 to 172"]
B67["B68: instructions - lines 173 to 173"]
B68["B69: instructions - lines 174 to 175"]
B69["B70: instructions - lines 176 to 177"]
B60 -->|call| B195
B60 -->|after return| B61
B61 -->|call| B54
B61 -->|after return| B62
B62 -->|call| B182
B62 -->|after return| B63
B63 -->|call| B200
B63 -->|after return| B64
B65 -->|call| B54
B65 -->|after return| B66
B66 -->|call| B195
B66 -->|after return| B67
B67 -->|call| B54
B67 -->|after return| B68
B68 -->|call| B182
B68 -->|after return| B69
B69 -->|call| B200
B69 -->|after return| B70
B195["Continue at B196 in section 20"]
B54["Continue at B55 in section 6"]
B182["Continue at B183 in section 19"]
B200["Continue at B201 in section 21"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
ACALL CLEAR
```

### B62

```asm
ACALL DELAY
```

### B63

```asm
mov a, #80H
acall cmd
```

### B64

```asm
mov dptr, #PRESS
acall wstr
```

### B65

Return to the instruction following the active call.

```asm
CLR P3.6
SETB P3.6
RET
```

### B66

```asm
ACALL DELAY
```

### B67

```asm
ACALL CLEAR
```

### B68

```asm
ACALL DELAY
```

### B69

```asm
mov a, #80H
acall cmd
```

### B70

```asm
mov dptr, #OP3
acall wstr
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 178 to 179"]
B71["B72: instructions - lines 180 to 181"]
B72["B73: instructions - lines 182 to 182"]
B73["B74: instructions - lines 183 to 183"]
B74["B75: instructions - lines 184 to 184"]
B75["B76: instructions - lines 185 to 185"]
B76["B77: CHEE2 - lines 188 to 188"]
B77["B78: instructions - lines 189 to 189"]
B78["B79: CHEE3 - lines 192 to 192"]
B79["B80: instructions - lines 193 to 193"]
B70 -->|call| B182
B70 -->|after return| B71
B71 -->|call| B200
B71 -->|after return| B72
B72 -->|call| B54
B72 -->|after return| B73
B73 -->|call| B205
B73 -->|after return| B74
B74 -->|condition true| B76
B74 -->|condition false| B75
B75 -->|jump| B9
B76 -->|condition true| B78
B76 -->|condition false| B77
B77 -->|jump| B42
B78 -->|call| B107
B78 -->|after return| B79
B79 -->|jump| B65
B182["Continue at B183 in section 19"]
B200["Continue at B201 in section 21"]
B54["Continue at B55 in section 6"]
B205["Continue at B206 in section 21"]
B9["Continue at B10 in section 1"]
B42["Continue at B43 in section 5"]
B107["Continue at B108 in section 11"]
B65["Continue at B66 in section 7"]
```

### B71

```asm
mov a,#0c0h
acall cmd
```

### B72

```asm
mov dptr, #OP4
acall wstr
```

### B73

```asm
ACALL DELAY
```

### B74

```asm
ACALL KEYPAD
```

### B75

```asm
CJNE A,#'1',CHEE2
```

### B76

```asm
LJMP main1
```

### B77

```asm
CJNE A,#'2',CHEE3
```

### B78

```asm
LJMP leave
```

### B79

```asm
ACALL WRONG
```

### B80

```asm
SJMP CHECK
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 195 to 195"]
B81["B82: DISPLAY0 - lines 199 to 199"]
B82["B83: instructions - lines 200 to 200"]
B83["B84: instructions - lines 201 to 201"]
B84["B85: instructions - lines 202 to 203"]
B85["B86: instructions - lines 204 to 205"]
B86["B87: instructions - lines 206 to 207"]
B87["B88: instructions - lines 208 to 209"]
B88["B89: instructions - lines 210 to 210"]
B89["B90: instructions - lines 211 to 211"]
B81 -->|call| B54
B81 -->|after return| B82
B82 -->|call| B195
B82 -->|after return| B83
B83 -->|call| B54
B83 -->|after return| B84
B84 -->|call| B182
B84 -->|after return| B85
B85 -->|call| B200
B85 -->|after return| B86
B86 -->|call| B182
B86 -->|after return| B87
B87 -->|call| B200
B87 -->|after return| B88
B88 -->|call| B54
B88 -->|after return| B89
B54["Continue at B55 in section 6"]
B195["Continue at B196 in section 20"]
B182["Continue at B183 in section 19"]
B200["Continue at B201 in section 21"]
```

### B81

Return to the instruction following the active call.

```asm
ret
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
ACALL DELAY
```

### B85

```asm
mov a, #80H
acall cmd
```

### B86

```asm
mov dptr, #WELCOME1
acall wstr
```

### B87

```asm
mov a,#0c0h
acall cmd
```

### B88

```asm
mov dptr, #WELCOME2
acall wstr
```

### B89

```asm
ACALL DELAY
```

### B90

Return to the instruction following the active call.

```asm
ret
```

## Section 10

```mermaid
flowchart TD
B90["B91: DISPLAYY - lines 214 to 214"]
B91["B92: instructions - lines 215 to 215"]
B92["B93: instructions - lines 216 to 216"]
B93["B94: instructions - lines 217 to 218"]
B94["B95: instructions - lines 219 to 220"]
B95["B96: instructions - lines 221 to 222"]
B96["B97: instructions - lines 223 to 224"]
B97["B98: instructions - lines 225 to 225"]
B98["B99: instructions - lines 226 to 226"]
B99["B100: instructions - lines 227 to 227"]
B90 -->|call| B54
B90 -->|after return| B91
B91 -->|call| B195
B91 -->|after return| B92
B92 -->|call| B54
B92 -->|after return| B93
B93 -->|call| B182
B93 -->|after return| B94
B94 -->|call| B200
B94 -->|after return| B95
B95 -->|call| B182
B95 -->|after return| B96
B96 -->|call| B200
B96 -->|after return| B97
B97 -->|call| B54
B97 -->|after return| B98
B98 -->|call| B205
B98 -->|after return| B99
B99 -->|condition true| B101
B99 -->|condition false| B100
B54["Continue at B55 in section 6"]
B195["Continue at B196 in section 20"]
B182["Continue at B183 in section 19"]
B200["Continue at B201 in section 21"]
B205["Continue at B206 in section 21"]
B101["Continue at B102 in section 11"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL DELAY
```

### B92

```asm
ACALL CLEAR
```

### B93

```asm
ACALL DELAY
```

### B94

```asm
mov a, #80H
acall cmd
```

### B95

```asm
mov dptr, #op1
acall wstr
```

### B96

```asm
mov a,#0c0h
acall cmd
```

### B97

```asm
mov dptr, #op2
acall wstr
```

### B98

```asm
ACALL DELAY
```

### B99

```asm
ACALL KEYPAD
```

### B100

```asm
CJNE A,#'1',CHE2
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 228 to 228"]
B101["B102: CHE2 - lines 231 to 231"]
B102["B103: instructions - lines 232 to 232"]
B103["B104: instructions - lines 233 to 233"]
B104["B105: CHE3 - lines 235 to 235"]
B105["B106: instructions - lines 236 to 236"]
B106["B107: BACK - lines 239 to 239"]
B107["B108: WRONG - lines 242 to 242"]
B108["B109: instructions - lines 243 to 244"]
B109["B110: instructions - lines 245 to 246"]
B100 -->|jump| B10
B101 -->|condition true| B104
B101 -->|condition false| B102
B102 -->|jump| B42
B103 -->|jump| B106
B104 -->|call| B107
B104 -->|after return| B105
B105 -->|jump| B90
B107 -->|call| B195
B107 -->|after return| B108
B108 -->|call| B182
B108 -->|after return| B109
B109 -->|call| B200
B109 -->|after return| B110
B10["Continue at B11 in section 2"]
B42["Continue at B43 in section 5"]
B90["Continue at B91 in section 10"]
B195["Continue at B196 in section 20"]
B182["Continue at B183 in section 19"]
B200["Continue at B201 in section 21"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
LJMP MAIN2
```

### B102

```asm
CJNE A,#'2',CHE3
```

### B103

```asm
LJMP leave
```

### B104

```asm
SJMP BACK
```

### B105

```asm
ACALL WRONG
```

### B106

```asm
SJMP displayy
```

### B107

Return to the instruction following the active call.

```asm
ret
```

### B108

```asm
ACALL CLEAR
```

### B109

```asm
mov a, #80H
acall cmd
```

### B110

```asm
mov dptr, #WRONGG
acall wstr
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 247 to 247"]
B111["B112: DISPLAY1 - lines 250 to 251"]
B112["B113: instructions - lines 252 to 253"]
B113["B114: instructions - lines 254 to 255"]
B114["B115: instructions - lines 256 to 256"]
B115["B116: instructions - lines 257 to 258"]
B116["B117: instructions - lines 259 to 264"]
B117["B118: instructions - lines 266 to 266"]
B118["B119: instructions - lines 267 to 268"]
B119["B120: instructions - lines 269 to 275"]
B111 -->|call| B182
B111 -->|after return| B112
B112 -->|call| B200
B112 -->|after return| B113
B113 -->|call| B182
B113 -->|after return| B114
B114 -->|call| B205
B114 -->|after return| B115
B115 -->|call| B177
B115 -->|after return| B116
B116 -->|call| B54
B116 -->|after return| B117
B117 -->|call| B205
B117 -->|after return| B118
B118 -->|call| B177
B118 -->|after return| B119
B119 -->|call| B54
B119 -->|after return| B120
B182["Continue at B183 in section 19"]
B200["Continue at B201 in section 21"]
B205["Continue at B206 in section 21"]
B177["Continue at B178 in section 18"]
B54["Continue at B55 in section 6"]
B120["Continue at B121 in section 13"]
```

### B111

Return to the instruction following the active call.

```asm
RET
```

### B112

```asm
mov a, #80H
acall cmd
```

### B113

```asm
mov dptr, #amount
acall wstr
```

### B114

```asm
mov a,#0c0h
acall cmd
```

### B115

```asm
ACALL KEYPAD
```

### B116

```asm
MOV R2,A
acall wchr
```

### B117

```asm
MOV B,#10
MOV A,R2
SUBB A,#30H
MUL AB
MOV R2,A
ACALL DELAY
```

### B118

```asm
ACALL KEYPAD
```

### B119

```asm
MOV R1,A
acall wchr
```

### B120

```asm
MOV A,R1
SUBB A,#30H
MOV R1,A
MOV A,R2
ADD A,R1
MOV R3,A
ACALL DELAY
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 277 to 277"]
B121["B122: DISPLAY2 - lines 280 to 281"]
B122["B123: instructions - lines 282 to 283"]
B123["B124: instructions - lines 284 to 285"]
B124["B125: instructions - lines 287 to 287"]
B125["B126: instructions - lines 288 to 289"]
B126["B127: instructions - lines 290 to 295"]
B127["B128: instructions - lines 297 to 297"]
B128["B129: instructions - lines 298 to 299"]
B129["B130: instructions - lines 300 to 306"]
B121 -->|call| B182
B121 -->|after return| B122
B122 -->|call| B200
B122 -->|after return| B123
B123 -->|call| B182
B123 -->|after return| B124
B124 -->|call| B205
B124 -->|after return| B125
B125 -->|call| B177
B125 -->|after return| B126
B126 -->|call| B54
B126 -->|after return| B127
B127 -->|call| B205
B127 -->|after return| B128
B128 -->|call| B177
B128 -->|after return| B129
B129 -->|call| B54
B129 -->|after return| B130
B182["Continue at B183 in section 19"]
B200["Continue at B201 in section 21"]
B205["Continue at B206 in section 21"]
B177["Continue at B178 in section 18"]
B54["Continue at B55 in section 6"]
B130["Continue at B131 in section 14"]
```

### B121

Return to the instruction following the active call.

```asm
ret
```

### B122

```asm
mov a, #80H
acall cmd
```

### B123

```asm
mov dptr, #data
acall wstr
```

### B124

```asm
mov a,#0c0h
acall cmd
```

### B125

```asm
ACALL KEYPAD
```

### B126

```asm
MOV R2,A
acall wchr
```

### B127

```asm
MOV B,#10
MOV A,R2
SUBB A,#30H
MUL AB
MOV R2,A
ACALL DELAY
```

### B128

```asm
ACALL KEYPAD
```

### B129

```asm
MOV R1,A
acall wchr
```

### B130

```asm
MOV A,R1
SUBB A,#30H
MOV R1,A
MOV A,R2
ADD A,R1
MOV R4,A
ACALL DELAY
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 308 to 308"]
B131["B132: DISPLAY3 - lines 311 to 312"]
B132["B133: instructions - lines 313 to 314"]
B133["B134: instructions - lines 315 to 316"]
B134["B135: instructions - lines 317 to 321"]
B135["B136: instructions - lines 322 to 324"]
B136["B137: instructions - lines 325 to 325"]
B137["B138: instructions - lines 326 to 326"]
B138["B139: instructions - lines 327 to 327"]
B139["B140: DISPLAY4 - lines 331 to 332"]
B131 -->|call| B182
B131 -->|after return| B132
B132 -->|call| B200
B132 -->|after return| B133
B133 -->|call| B182
B133 -->|after return| B134
B134 -->|call| B177
B134 -->|after return| B135
B135 -->|call| B177
B135 -->|after return| B136
B136 -->|call| B54
B136 -->|after return| B137
B137 -->|call| B54
B137 -->|after return| B138
B139 -->|call| B182
B139 -->|after return| B140
B182["Continue at B183 in section 19"]
B200["Continue at B201 in section 21"]
B177["Continue at B178 in section 18"]
B54["Continue at B55 in section 6"]
B140["Continue at B141 in section 15"]
```

### B131

Return to the instruction following the active call.

```asm
ret
```

### B132

```asm
mov a, #80H
acall cmd
```

### B133

```asm
mov dptr, #days
acall wstr
```

### B134

```asm
mov a,#0c0h
acall cmd
```

### B135

```asm
mov a,R4
mov b,#10
div ab
add a,#30h
acall wchr
```

### B136

```asm
mov a,b
add a,#30h
acall wchr
```

### B137

```asm
ACALL DELAY
```

### B138

```asm
ACALL DELAY
```

### B139

Return to the instruction following the active call.

```asm
ret
```

### B140

```asm
mov a, #80H
acall cmd
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 333 to 334"]
B141["B142: instructions - lines 335 to 335"]
B142["B143: DISPLAY5 - lines 339 to 340"]
B143["B144: instructions - lines 341 to 342"]
B144["B145: instructions - lines 344 to 345"]
B145["B146: instructions - lines 346 to 347"]
B146["B147: instructions - lines 348 to 349"]
B147["B148: instructions - lines 350 to 351"]
B148["B149: instructions - lines 352 to 352"]
B149["B150: instructions - lines 353 to 353"]
B140 -->|call| B200
B140 -->|after return| B141
B142 -->|call| B182
B142 -->|after return| B143
B143 -->|call| B200
B143 -->|after return| B144
B144 -->|call| B182
B144 -->|after return| B145
B145 -->|call| B177
B145 -->|after return| B146
B146 -->|call| B177
B146 -->|after return| B147
B147 -->|call| B177
B147 -->|after return| B148
B148 -->|call| B54
B148 -->|after return| B149
B149 -->|call| B54
B149 -->|after return| B150
B200["Continue at B201 in section 21"]
B182["Continue at B183 in section 19"]
B177["Continue at B178 in section 18"]
B54["Continue at B55 in section 6"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
mov dptr,#nolate
acall wstr
```

### B142

Return to the instruction following the active call.

```asm
ret
```

### B143

```asm
mov a, #80H
acall cmd
```

### B144

```asm
mov dptr, #dis
acall wstr
```

### B145

```asm
mov a,#0c0h
acall cmd
```

### B146

```asm
mov a,#'1'
acall wchr
```

### B147

```asm
mov a,#'0'
acall wchr
```

### B148

```asm
mov a,#'%'
acall wchr
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
B150["B151: instructions - lines 354 to 354"]
B151["B152: DISPLAY6 - lines 358 to 359"]
B152["B153: instructions - lines 360 to 361"]
B153["B154: instructions - lines 363 to 364"]
B154["B155: instructions - lines 365 to 366"]
B155["B156: instructions - lines 367 to 368"]
B156["B157: instructions - lines 369 to 370"]
B157["B158: instructions - lines 371 to 371"]
B158["B159: instructions - lines 372 to 372"]
B159["B160: instructions - lines 373 to 373"]
B151 -->|call| B182
B151 -->|after return| B152
B152 -->|call| B200
B152 -->|after return| B153
B153 -->|call| B182
B153 -->|after return| B154
B154 -->|call| B177
B154 -->|after return| B155
B155 -->|call| B177
B155 -->|after return| B156
B156 -->|call| B177
B156 -->|after return| B157
B157 -->|call| B54
B157 -->|after return| B158
B158 -->|call| B54
B158 -->|after return| B159
B159 -->|call| B54
B159 -->|after return| B160
B182["Continue at B183 in section 19"]
B200["Continue at B201 in section 21"]
B177["Continue at B178 in section 18"]
B54["Continue at B55 in section 6"]
B160["Continue at B161 in section 17"]
```

### B151

Return to the instruction following the active call.

```asm
ret
```

### B152

```asm
mov a, #80H
acall cmd
```

### B153

```asm
mov dptr, #dis
acall wstr
```

### B154

```asm
mov a,#0c0h
acall cmd
```

### B155

```asm
mov a,#'2'
acall wchr
```

### B156

```asm
mov a,#'0'
acall wchr
```

### B157

```asm
mov a,#'%'
acall wchr
```

### B158

```asm
ACALL DELAY
```

### B159

```asm
ACALL DELAY
```

### B160

```asm
ACALL DELAY
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 374 to 374"]
B161["B162: instructions - lines 375 to 375"]
B162["B163: DISPLAY7 - lines 379 to 380"]
B163["B164: instructions - lines 381 to 382"]
B164["B165: instructions - lines 384 to 385"]
B165["B166: instructions - lines 386 to 390"]
B166["B167: instructions - lines 391 to 393"]
B167["B168: instructions - lines 394 to 394"]
B168["B169: instructions - lines 395 to 395"]
B169["B170: instructions - lines 396 to 396"]
B160 -->|call| B54
B160 -->|after return| B161
B162 -->|call| B182
B162 -->|after return| B163
B163 -->|call| B200
B163 -->|after return| B164
B164 -->|call| B182
B164 -->|after return| B165
B165 -->|call| B177
B165 -->|after return| B166
B166 -->|call| B177
B166 -->|after return| B167
B167 -->|call| B54
B167 -->|after return| B168
B168 -->|call| B54
B168 -->|after return| B169
B54["Continue at B55 in section 6"]
B182["Continue at B183 in section 19"]
B200["Continue at B201 in section 21"]
B177["Continue at B178 in section 18"]
```

### B161

```asm
ACALL DELAY
```

### B162

Return to the instruction following the active call.

```asm
ret
```

### B163

```asm
mov a, #80H
acall cmd
```

### B164

```asm
mov dptr, #pay
acall wstr
```

### B165

```asm
mov a,#0c0h
acall cmd
```

### B166

```asm
mov a,R6
mov b,#10
div ab
add a,#30h
acall wchr
```

### B167

```asm
mov a,b
add a,#30h
acall wchr
```

### B168

```asm
ACALL DELAY
```

### B169

```asm
ACALL DELAY
```

### B170

Return to the instruction following the active call.

```asm
ret
```

## Section 18

```mermaid
flowchart TD
B170["B171: DISPLAY8 - lines 399 to 400"]
B171["B172: instructions - lines 401 to 402"]
B172["B173: instructions - lines 403 to 403"]
B173["B174: instructions - lines 404 to 404"]
B174["B175: instructions - lines 405 to 405"]
B175["B176: instructions - lines 406 to 406"]
B176["B177: instructions - lines 407 to 407"]
B177["B178: WCHR - lines 411 to 415"]
B178["B179: instructions - lines 416 to 416"]
B179["B180: instructions - lines 417 to 419"]
B170 -->|call| B182
B170 -->|after return| B171
B171 -->|call| B200
B171 -->|after return| B172
B172 -->|call| B54
B172 -->|after return| B173
B173 -->|call| B54
B173 -->|after return| B174
B174 -->|call| B54
B174 -->|after return| B175
B175 -->|call| B54
B175 -->|after return| B176
B177 -->|call| B187
B177 -->|after return| B178
B178 -->|call| B193
B178 -->|after return| B179
B179 -->|call| B187
B179 -->|after return| B180
B182["Continue at B183 in section 19"]
B200["Continue at B201 in section 21"]
B54["Continue at B55 in section 6"]
B187["Continue at B188 in section 19"]
B193["Continue at B194 in section 20"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
mov a, #80H
acall cmd
```

### B172

```asm
mov dptr,#free
acall wstr
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
ACALL DELAY
```

### B176

```asm
ACALL DELAY
```

### B177

Return to the instruction following the active call.

```asm
ret
```

### B178

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B179

```asm
ACALL LDELAY
```

### B180

```asm
MOV A,B
SWAP A
ACALL COMMON
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 420 to 420"]
B181["B182: instructions - lines 421 to 423"]
B182["B183: CMD - lines 426 to 428"]
B183["B184: instructions - lines 429 to 429"]
B184["B185: instructions - lines 430 to 432"]
B185["B186: instructions - lines 433 to 433"]
B186["B187: instructions - lines 434 to 434"]
B187["B188: COMMON - lines 437 to 442"]
B188["B189: INLCD - lines 445 to 452"]
B189["B190: instructions - lines 453 to 461"]
B180 -->|call| B193
B180 -->|after return| B181
B182 -->|call| B187
B182 -->|after return| B183
B183 -->|call| B193
B183 -->|after return| B184
B184 -->|call| B187
B184 -->|after return| B185
B185 -->|call| B193
B185 -->|after return| B186
B188 -->|call| B193
B188 -->|after return| B189
B189 -->|call| B193
B189 -->|after return| B190
B193["Continue at B194 in section 20"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
ACALL LDELAY
```

### B182

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B183

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B184

```asm
ACALL LDELAY
```

### B185

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B186

```asm
ACALL LDELAY
```

### B187

Return to the instruction following the active call.

```asm
RET
```

### B188

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B189

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

### B190

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

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 462 to 474"]
B191["B192: instructions - lines 475 to 485"]
B192["B193: instructions - lines 486 to 486"]
B193["B194: LDELAY - lines 489 to 490"]
B194["B195: instructions - lines 491 to 491"]
B195["B196: CLEAR - lines 494 to 495"]
B196["B197: instructions - lines 496 to 496"]
B197["B198: WAIT - lines 497 to 497"]
B198["B199: instructions - lines 498 to 498"]
B199["B200: instructions - lines 499 to 499"]
B190 -->|call| B193
B190 -->|after return| B191
B191 -->|call| B193
B191 -->|after return| B192
B193 -->|condition true| B193
B193 -->|condition false| B194
B195 -->|call| B182
B195 -->|after return| B196
B196 -->|next| B197
B197 -->|call| B193
B197 -->|after return| B198
B198 -->|condition true| B197
B198 -->|condition false| B199
B182["Continue at B183 in section 19"]
```

### B191

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

### B192

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

### B193

Return to the instruction following the active call.

```asm
RET
```

### B194

```asm
MOV R0, #50
DJNZ R0, $
```

### B195

Return to the instruction following the active call.

```asm
RET
```

### B196

```asm
MOV A,#01H
ACALL CMD
```

### B197

```asm
MOV R7,#14
```

### B198

```asm
ACALL LDELAY
```

### B199

```asm
DJNZ R7,WAIT
```

### B200

Return to the instruction following the active call.

```asm
ret
```

## Section 21

```mermaid
flowchart TD
B200["B201: WSTR - lines 502 to 502"]
B201["B202: CONT1 - lines 504 to 506"]
B202["B203: PRINT - lines 508 to 508"]
B203["B204: instructions - lines 509 to 510"]
B204["B205: EXIT1 - lines 511 to 512"]
B205["B206: KEYPAD - lines 517 to 517"]
B206["B207: K1 - lines 518 to 521"]
B207["B208: K2 - lines 523 to 525"]
B208["B209: instructions - lines 526 to 526"]
B209["B210: OVER1 - lines 528 to 531"]
B200 -->|next| B201
B201 -->|condition true| B204
B201 -->|condition false| B202
B202 -->|call| B177
B202 -->|after return| B203
B203 -->|jump| B201
B205 -->|next| B206
B206 -->|condition true| B206
B206 -->|condition false| B207
B207 -->|condition true| B209
B207 -->|condition false| B208
B208 -->|jump| B207
B209 -->|condition true| B214
B209 -->|condition false| B210
B177["Continue at B178 in section 18"]
B214["Continue at B215 in section 22"]
B210["Continue at B211 in section 22"]
```

### B201

```asm
PUSH    ACC
```

### B202

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B203

```asm
ACALL    WCHR
```

### B204

```asm
INC DPTR
AJMP    CONT1
```

### B205

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B206

```asm
MOV P0,#01110000B
```

### B207

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B208

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B209

```asm
SJMP K2
```

### B210

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

## Section 22

```mermaid
flowchart TD
B210["B211: instructions - lines 532 to 535"]
B211["B212: instructions - lines 536 to 539"]
B212["B213: instructions - lines 540 to 543"]
B213["B214: instructions - lines 544 to 544"]
B214["B215: ROW_0 - lines 545 to 546"]
B215["B216: ROW_1 - lines 547 to 548"]
B216["B217: ROW_2 - lines 549 to 550"]
B217["B218: ROW_3 - lines 551 to 551"]
B218["B219: FIND - lines 553 to 553"]
B219["B220: FIND1 - lines 555 to 556"]
B210 -->|condition true| B215
B210 -->|condition false| B211
B211 -->|condition true| B216
B211 -->|condition false| B212
B212 -->|condition true| B217
B212 -->|condition false| B213
B213 -->|jump| B207
B214 -->|jump| B218
B215 -->|jump| B218
B216 -->|jump| B218
B217 -->|next| B218
B218 -->|next| B219
B219 -->|condition true| B221
B219 -->|condition false| B220
B207["Continue at B208 in section 21"]
B221["Continue at B222 in section 23"]
B220["Continue at B221 in section 23"]
```

### B211

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B212

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B213

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B214

```asm
LJMP K2
```

### B215

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B216

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B217

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B218

```asm
MOV DPTR,#KCODE3
```

### B219

```asm
RLC A
```

### B220

```asm
RLC A
JNC MATCH
```

## Section 23

```mermaid
flowchart TD
B220["B221: instructions - lines 557 to 558"]
B221["B222: MATCH - lines 559 to 561"]
B220 -->|jump| B219
B219["Continue at B220 in section 22"]
```

### B221

```asm
INC DPTR
SJMP FIND1
```

### B222

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
