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
B1["B2: instructions - lines 4 to 14"]
B2["B3: instructions - lines 15 to 15"]
B3["B4: instructions - lines 16 to 16"]
B4["B5: instructions - lines 17 to 17"]
B5["B6: instructions - lines 18 to 18"]
B6["B7: instructions - lines 21 to 22"]
B7["B8: VIP - lines 25 to 26"]
B8["B9: FL - lines 28 to 29"]
B9["B10: instructions - lines 30 to 31"]
B0 -->|call| B139
B0 -->|after return| B1
B1 -->|call| B146
B1 -->|after return| B2
B2 -->|call| B54
B2 -->|after return| B3
B3 -->|call| B146
B3 -->|after return| B4
B4 -->|call| B60
B4 -->|after return| B5
B5 -->|call| B146
B5 -->|after return| B6
B6 -->|condition true| B21
B6 -->|condition false| B7
B7 -->|next| B8
B8 -->|call| B123
B8 -->|after return| B9
B9 -->|call| B123
B9 -->|after return| B10
B139["Continue at B140 in section 14"]
B146["Continue at B147 in section 15"]
B54["Continue at B55 in section 6"]
B60["Continue at B61 in section 7"]
B21["Continue at B22 in section 3"]
B123["Continue at B124 in section 13"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV 30H,#2
MOV 31H,#1
MOV 32H,#0
MOV 40H,#5
MOV 41H,#5
MOV 42H,#30
MOV 43H,#30
MOV 44H,#20
MOV 45H,#20
ACALL CLEAR
```

### B3

```asm
ACALL WELCOME
```

### B4

```asm
ACALL CLEAR
```

### B5

```asm
acall mmenu
```

### B6

```asm
ACALL CLEAR
```

### B7

```asm
MOV A,30H
CJNE A,#1,ONLINE
```

### B8

```asm
mov r5,#3
mov p1,#0ffh
```

### B9

```asm
setb p1.2
acall delay
```

### B10

```asm
clr p1.2
acall delay
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 32 to 32"]
B11["B12: instructions - lines 33 to 33"]
B12["B13: instructions - lines 35 to 35"]
B13["B14: instructions - lines 36 to 37"]
B14["B15: MONTHLY - lines 40 to 41"]
B15["B16: instructions - lines 42 to 42"]
B16["B17: NEXT - lines 45 to 50"]
B17["B18: YEARLY - lines 53 to 53"]
B18["B19: instructions - lines 54 to 55"]
B19["B20: instructions - lines 56 to 56"]
B10 -->|condition true| B8
B10 -->|condition false| B11
B11 -->|call| B146
B11 -->|after return| B12
B12 -->|call| B73
B12 -->|after return| B13
B13 -->|condition true| B17
B13 -->|condition false| B14
B14 -->|condition true| B16
B14 -->|condition false| B15
B15 -->|jump| B51
B16 -->|jump| B52
B17 -->|condition true| B7
B17 -->|condition false| B18
B18 -->|condition true| B20
B18 -->|condition false| B19
B19 -->|jump| B51
B8["Continue at B9 in section 1"]
B146["Continue at B147 in section 15"]
B73["Continue at B74 in section 8"]
B51["Continue at B52 in section 6"]
B52["Continue at B53 in section 6"]
B7["Continue at B8 in section 1"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
djnz r5,fl
```

### B12

```asm
acall clear
```

### B13

```asm
ACALL vipmesg
```

### B14

```asm
MOV A,31H
CJNE A,#1,YEARLY
```

### B15

```asm
MOV R1,40H
DJNZ R1,NEXT
```

### B16

```asm
AJMP WRONG
```

### B17

```asm
CLR A
DEC 40H
MOV DPTR,#VIPM
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT
```

### B18

```asm
CJNE A,#2,VIP
```

### B19

```asm
MOV R2,41H
DJNZ R2,NEXT2
```

### B20

```asm
AJMP WRONG
```

## Section 3

```mermaid
flowchart TD
B20["B21: NEXT2 - lines 59 to 64"]
B21["B22: ONLINE - lines 70 to 71"]
B22["B23: FL1 - lines 73 to 74"]
B23["B24: instructions - lines 75 to 76"]
B24["B25: instructions - lines 77 to 77"]
B25["B26: instructions - lines 78 to 78"]
B26["B27: instructions - lines 79 to 80"]
B27["B28: instructions - lines 81 to 81"]
B28["B29: instructions - lines 82 to 83"]
B29["B30: MONTHLY2 - lines 86 to 87"]
B20 -->|jump| B52
B21 -->|next| B22
B22 -->|call| B123
B22 -->|after return| B23
B23 -->|call| B123
B23 -->|after return| B24
B24 -->|condition true| B22
B24 -->|condition false| B25
B25 -->|call| B146
B25 -->|after return| B26
B26 -->|condition true| B36
B26 -->|condition false| B27
B27 -->|call| B81
B27 -->|after return| B28
B28 -->|condition true| B32
B28 -->|condition false| B29
B29 -->|condition true| B31
B29 -->|condition false| B30
B52["Continue at B53 in section 6"]
B123["Continue at B124 in section 13"]
B146["Continue at B147 in section 15"]
B36["Continue at B37 in section 4"]
B81["Continue at B82 in section 9"]
B32["Continue at B33 in section 4"]
B31["Continue at B32 in section 4"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
CLR A
DEC 41H
MOV DPTR,#VIPY
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT
```

### B22

```asm
mov r5,#3
mov p1,#0ffh
```

### B23

```asm
setb p1.3
acall delay
```

### B24

```asm
clr p1.3
acall delay
```

### B25

```asm
djnz r5,fl1
```

### B26

```asm
acall clear
```

### B27

```asm
MOV A,30H
CJNE A,#2,REGULAR
```

### B28

```asm
ACALL onlmesg
```

### B29

```asm
MOV A,31H
CJNE A,#1,YEARLY2
```

### B30

```asm
MOV R1,42H
DJNZ R1,NEXT3
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 88 to 88"]
B31["B32: NEXT3 - lines 91 to 96"]
B32["B33: YEARLY2 - lines 99 to 99"]
B33["B34: instructions - lines 100 to 101"]
B34["B35: instructions - lines 102 to 102"]
B35["B36: NEXT4 - lines 105 to 110"]
B36["B37: REGULAR - lines 115 to 116"]
B37["B38: instructions - lines 117 to 118"]
B38["B39: FL2 - lines 120 to 121"]
B39["B40: instructions - lines 122 to 123"]
B30 -->|jump| B51
B31 -->|jump| B52
B32 -->|condition true| B21
B32 -->|condition false| B33
B33 -->|condition true| B35
B33 -->|condition false| B34
B34 -->|jump| B51
B35 -->|jump| B52
B36 -->|condition true| B51
B36 -->|condition false| B37
B37 -->|next| B38
B38 -->|call| B123
B38 -->|after return| B39
B39 -->|call| B123
B39 -->|after return| B40
B51["Continue at B52 in section 6"]
B52["Continue at B53 in section 6"]
B21["Continue at B22 in section 3"]
B123["Continue at B124 in section 13"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
AJMP WRONG
```

### B32

```asm
CLR A
DEC 42H
MOV DPTR,#ONM
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT
```

### B33

```asm
CJNE A,#2,ONLINE
```

### B34

```asm
MOV R2,43H
DJNZ R2,NEXT4
```

### B35

```asm
AJMP WRONG
```

### B36

```asm
CLR A
DEC 43H
MOV DPTR,#ONY
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT
```

### B37

```asm
MOV A,30H
CJNE A,#3,WRONG
```

### B38

```asm
mov r5,#3
mov p1,#0ffh
```

### B39

```asm
setb p1.4
acall delay
```

### B40

```asm
clr p1.4
acall delay
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 124 to 124"]
B41["B42: instructions - lines 125 to 125"]
B42["B43: instructions - lines 126 to 126"]
B43["B44: instructions - lines 127 to 128"]
B44["B45: MONTHLY3 - lines 131 to 132"]
B45["B46: instructions - lines 133 to 133"]
B46["B47: NEXT5 - lines 136 to 141"]
B47["B48: YEARLY3 - lines 144 to 144"]
B48["B49: instructions - lines 145 to 146"]
B49["B50: instructions - lines 147 to 147"]
B40 -->|condition true| B38
B40 -->|condition false| B41
B41 -->|call| B146
B41 -->|after return| B42
B42 -->|call| B89
B42 -->|after return| B43
B43 -->|condition true| B47
B43 -->|condition false| B44
B44 -->|condition true| B46
B44 -->|condition false| B45
B45 -->|jump| B51
B46 -->|jump| B52
B47 -->|condition true| B36
B47 -->|condition false| B48
B48 -->|condition true| B50
B48 -->|condition false| B49
B49 -->|jump| B51
B38["Continue at B39 in section 4"]
B146["Continue at B147 in section 15"]
B89["Continue at B90 in section 9"]
B51["Continue at B52 in section 6"]
B52["Continue at B53 in section 6"]
B36["Continue at B37 in section 4"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
djnz r5,fl2
```

### B42

```asm
acall clear
```

### B43

```asm
ACALL regmesg
```

### B44

```asm
MOV A,31H
CJNE A,#1,YEARLY3
```

### B45

```asm
MOV R1,44H
DJNZ R1,NEXT5
```

### B46

```asm
SJMP WRONG
```

### B47

```asm
CLR A
DEC 44H
MOV DPTR,#REGM
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT
```

### B48

```asm
CJNE A,#2,REGULAR
```

### B49

```asm
MOV R2,45H
DJNZ R2,NEXT6
```

### B50

```asm
SJMP WRONG
```

## Section 6

```mermaid
flowchart TD
B50["B51: NEXT6 - lines 150 to 155"]
B51["B52: WRONG - lines 158 to 158"]
B52["B53: OUT - lines 162 to 162"]
B53["B54: AGAIN - lines 163 to 163"]
B54["B55: WELCOME - lines 168 to 169"]
B55["B56: instructions - lines 170 to 171"]
B56["B57: instructions - lines 173 to 174"]
B57["B58: instructions - lines 175 to 176"]
B58["B59: instructions - lines 177 to 177"]
B59["B60: instructions - lines 178 to 178"]
B50 -->|jump| B52
B51 -->|jump| B51
B52 -->|call| B116
B52 -->|after return| B53
B53 -->|jump| B53
B54 -->|call| B133
B54 -->|after return| B55
B55 -->|call| B151
B55 -->|after return| B56
B56 -->|call| B133
B56 -->|after return| B57
B57 -->|call| B151
B57 -->|after return| B58
B58 -->|call| B123
B58 -->|after return| B59
B116["Continue at B117 in section 12"]
B133["Continue at B134 in section 14"]
B151["Continue at B152 in section 16"]
B123["Continue at B124 in section 13"]
```

### B51

```asm
CLR A
DEC 45H
MOV DPTR,#REGY
MOVC A,@A+DPTR
MOV 32H,A
AJMP OUT
```

### B52

```asm
SJMP $
```

### B53

```asm
acall payment
```

### B54

```asm
sjmp again
```

### B55

```asm
mov a, #80H
acall cmd
```

### B56

```asm
mov dptr, #wel
acall wstr
```

### B57

```asm
mov a,#0c0h
acall cmd
```

### B58

```asm
mov dptr, #gym
acall wstr
```

### B59

```asm
acall delay
```

### B60

Return to the instruction following the active call.

```asm
ret
```

## Section 7

```mermaid
flowchart TD
B60["B61: MMENU - lines 181 to 182"]
B61["B62: instructions - lines 183 to 184"]
B62["B63: instructions - lines 186 to 187"]
B63["B64: instructions - lines 188 to 189"]
B64["B65: instructions - lines 190 to 190"]
B65["B66: instructions - lines 192 to 193"]
B66["B67: instructions - lines 194 to 195"]
B67["B68: instructions - lines 197 to 198"]
B68["B69: instructions - lines 199 to 199"]
B69["B70: instructions - lines 200 to 201"]
B60 -->|call| B133
B60 -->|after return| B61
B61 -->|call| B151
B61 -->|after return| B62
B62 -->|call| B133
B62 -->|after return| B63
B63 -->|call| B151
B63 -->|after return| B64
B64 -->|call| B123
B64 -->|after return| B65
B65 -->|call| B133
B65 -->|after return| B66
B66 -->|call| B151
B66 -->|after return| B67
B67 -->|call| B133
B67 -->|after return| B68
B68 -->|call| B156
B68 -->|after return| B69
B69 -->|call| B128
B69 -->|after return| B70
B133["Continue at B134 in section 14"]
B151["Continue at B152 in section 16"]
B123["Continue at B124 in section 13"]
B156["Continue at B157 in section 16"]
B128["Continue at B129 in section 13"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
mov a, #80H
acall cmd
```

### B62

```asm
mov dptr, #sel
acall wstr
```

### B63

```asm
mov a,#0c0h
acall cmd
```

### B64

```asm
mov dptr, #op
acall wstr
```

### B65

```asm
acall delay
```

### B66

```asm
mov a, #80H
acall cmd
```

### B67

```asm
mov dptr, #SPACE
acall wstr
```

### B68

```asm
mov a, #80H
acall cmd
```

### B69

```asm
ACALL KEYPAD
```

### B70

```asm
MOV 35H,A
ACALL WCHR
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 202 to 202"]
B71["B72: instructions - lines 203 to 203"]
B72["B73: instructions - lines 204 to 207"]
B73["B74: VIPMESG - lines 211 to 212"]
B74["B75: instructions - lines 213 to 214"]
B75["B76: instructions - lines 215 to 215"]
B76["B77: instructions - lines 217 to 217"]
B77["B78: instructions - lines 218 to 218"]
B78["B79: instructions - lines 220 to 220"]
B79["B80: instructions - lines 221 to 221"]
B70 -->|call| B123
B70 -->|after return| B71
B71 -->|call| B123
B71 -->|after return| B72
B73 -->|call| B133
B73 -->|after return| B74
B74 -->|call| B151
B74 -->|after return| B75
B75 -->|call| B123
B75 -->|after return| B76
B76 -->|call| B146
B76 -->|after return| B77
B77 -->|call| B97
B77 -->|after return| B78
B78 -->|call| B146
B78 -->|after return| B79
B79 -->|call| B110
B79 -->|after return| B80
B123["Continue at B124 in section 13"]
B133["Continue at B134 in section 14"]
B151["Continue at B152 in section 16"]
B146["Continue at B147 in section 15"]
B97["Continue at B98 in section 10"]
B110["Continue at B111 in section 12"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
ACALL DELAY
```

### B72

```asm
ACALL DELAY
```

### B73

Return to the instruction following the active call.

```asm
MOV A,35H
SUBB A,#30H
MOV 30H,A
ret
```

### B74

```asm
mov a, #80H
acall cmd
```

### B75

```asm
mov dptr, #VIPP
acall wstr
```

### B76

```asm
acall delay
```

### B77

```asm
acall clear
```

### B78

```asm
acall menu2
```

### B79

```asm
acall clear
```

### B80

```asm
acall dura
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 223 to 223"]
B81["B82: ONLMESG - lines 226 to 227"]
B82["B83: instructions - lines 228 to 229"]
B83["B84: instructions - lines 230 to 230"]
B84["B85: instructions - lines 231 to 231"]
B85["B86: instructions - lines 232 to 232"]
B86["B87: instructions - lines 234 to 234"]
B87["B88: instructions - lines 235 to 235"]
B88["B89: instructions - lines 236 to 236"]
B89["B90: REGMESG - lines 239 to 240"]
B81 -->|call| B133
B81 -->|after return| B82
B82 -->|call| B151
B82 -->|after return| B83
B83 -->|call| B123
B83 -->|after return| B84
B84 -->|call| B146
B84 -->|after return| B85
B85 -->|call| B97
B85 -->|after return| B86
B86 -->|call| B146
B86 -->|after return| B87
B87 -->|call| B110
B87 -->|after return| B88
B89 -->|call| B133
B89 -->|after return| B90
B133["Continue at B134 in section 14"]
B151["Continue at B152 in section 16"]
B123["Continue at B124 in section 13"]
B146["Continue at B147 in section 15"]
B97["Continue at B98 in section 10"]
B110["Continue at B111 in section 12"]
B90["Continue at B91 in section 10"]
```

### B81

Return to the instruction following the active call.

```asm
ret
```

### B82

```asm
mov a, #80H
acall cmd
```

### B83

```asm
mov dptr, #onl
acall wstr
```

### B84

```asm
acall delay
```

### B85

```asm
acall clear
```

### B86

```asm
acall menu2
```

### B87

```asm
acall clear
```

### B88

```asm
acall dura
```

### B89

Return to the instruction following the active call.

```asm
ret
```

### B90

```asm
mov a, #80H
acall cmd
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 241 to 242"]
B91["B92: instructions - lines 243 to 243"]
B92["B93: instructions - lines 244 to 244"]
B93["B94: instructions - lines 245 to 245"]
B94["B95: instructions - lines 247 to 247"]
B95["B96: instructions - lines 248 to 248"]
B96["B97: instructions - lines 249 to 249"]
B97["B98: MENU2 - lines 252 to 253"]
B98["B99: instructions - lines 254 to 255"]
B99["B100: instructions - lines 257 to 258"]
B90 -->|call| B151
B90 -->|after return| B91
B91 -->|call| B123
B91 -->|after return| B92
B92 -->|call| B146
B92 -->|after return| B93
B93 -->|call| B97
B93 -->|after return| B94
B94 -->|call| B146
B94 -->|after return| B95
B95 -->|call| B110
B95 -->|after return| B96
B97 -->|call| B133
B97 -->|after return| B98
B98 -->|call| B151
B98 -->|after return| B99
B99 -->|call| B133
B99 -->|after return| B100
B151["Continue at B152 in section 16"]
B123["Continue at B124 in section 13"]
B146["Continue at B147 in section 15"]
B110["Continue at B111 in section 12"]
B133["Continue at B134 in section 14"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
mov dptr, #reg
acall wstr
```

### B92

```asm
acall delay
```

### B93

```asm
acall clear
```

### B94

```asm
acall menu2
```

### B95

```asm
acall clear
```

### B96

```asm
acall dura
```

### B97

Return to the instruction following the active call.

```asm
ret
```

### B98

```asm
mov a, #80H
acall cmd
```

### B99

```asm
mov dptr, #sel
acall wstr
```

### B100

```asm
mov a,#0c0h
acall cmd
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 259 to 260"]
B101["B102: instructions - lines 261 to 261"]
B102["B103: instructions - lines 263 to 264"]
B103["B104: instructions - lines 265 to 266"]
B104["B105: instructions - lines 268 to 269"]
B105["B106: instructions - lines 270 to 270"]
B106["B107: instructions - lines 271 to 272"]
B107["B108: instructions - lines 273 to 273"]
B108["B109: instructions - lines 274 to 274"]
B109["B110: instructions - lines 275 to 280"]
B100 -->|call| B151
B100 -->|after return| B101
B101 -->|call| B123
B101 -->|after return| B102
B102 -->|call| B133
B102 -->|after return| B103
B103 -->|call| B151
B103 -->|after return| B104
B104 -->|call| B133
B104 -->|after return| B105
B105 -->|call| B156
B105 -->|after return| B106
B106 -->|call| B128
B106 -->|after return| B107
B107 -->|call| B123
B107 -->|after return| B108
B108 -->|call| B123
B108 -->|after return| B109
B151["Continue at B152 in section 16"]
B123["Continue at B124 in section 13"]
B133["Continue at B134 in section 14"]
B156["Continue at B157 in section 16"]
B128["Continue at B129 in section 13"]
```

### B101

```asm
mov dptr, #op2
acall wstr
```

### B102

```asm
acall delay
```

### B103

```asm
mov a, #80H
acall cmd
```

### B104

```asm
mov dptr, #SPACE
acall wstr
```

### B105

```asm
mov a, #80H
acall cmd
```

### B106

```asm
ACALL KEYPAD
```

### B107

```asm
MOV 35H,A
ACALL WCHR
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

Return to the instruction following the active call.

```asm
MOV A,35H
SUBB A,#30H
MOV 31H,A
RET
```

## Section 12

```mermaid
flowchart TD
B110["B111: DURA - lines 283 to 284"]
B111["B112: instructions - lines 285 to 286"]
B112["B113: instructions - lines 288 to 289"]
B113["B114: instructions - lines 290 to 292"]
B114["B115: instructions - lines 293 to 293"]
B115["B116: instructions - lines 295 to 295"]
B116["B117: PAYMENT - lines 298 to 299"]
B117["B118: instructions - lines 300 to 301"]
B118["B119: instructions - lines 303 to 304"]
B119["B120: instructions - lines 305 to 309"]
B110 -->|call| B133
B110 -->|after return| B111
B111 -->|call| B151
B111 -->|after return| B112
B112 -->|call| B133
B112 -->|after return| B113
B113 -->|call| B128
B113 -->|after return| B114
B114 -->|call| B123
B114 -->|after return| B115
B116 -->|call| B133
B116 -->|after return| B117
B117 -->|call| B151
B117 -->|after return| B118
B118 -->|call| B133
B118 -->|after return| B119
B119 -->|call| B128
B119 -->|after return| B120
B133["Continue at B134 in section 14"]
B151["Continue at B152 in section 16"]
B128["Continue at B129 in section 13"]
B123["Continue at B124 in section 13"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
mov a, #80H
acall cmd
```

### B112

```asm
mov dptr, #dur
acall wstr
```

### B113

```asm
mov a,#0c0h
acall cmd
```

### B114

```asm
mov a,31h
add a,#30h
acall wchr
```

### B115

```asm
acall delay
```

### B116

Return to the instruction following the active call.

```asm
ret
```

### B117

```asm
mov a, #80H
acall cmd
```

### B118

```asm
mov dptr, #pay
acall wstr
```

### B119

```asm
mov a,#0c0h
acall cmd
```

### B120

```asm
mov a,32h
mov b,#0Ah
div ab
add a,#30h
acall wchr
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 310 to 312"]
B121["B122: instructions - lines 313 to 313"]
B122["B123: instructions - lines 315 to 315"]
B123["B124: DELAY - lines 319 to 319"]
B124["B125: HE2 - lines 320 to 320"]
B125["B126: HE - lines 321 to 321"]
B126["B127: instructions - lines 322 to 322"]
B127["B128: instructions - lines 323 to 323"]
B128["B129: WCHR - lines 327 to 331"]
B129["B130: instructions - lines 332 to 332"]
B120 -->|call| B128
B120 -->|after return| B121
B121 -->|call| B123
B121 -->|after return| B122
B123 -->|next| B124
B124 -->|next| B125
B125 -->|condition true| B125
B125 -->|condition false| B126
B126 -->|condition true| B124
B126 -->|condition false| B127
B128 -->|call| B138
B128 -->|after return| B129
B129 -->|call| B144
B129 -->|after return| B130
B138["Continue at B139 in section 14"]
B144["Continue at B145 in section 15"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
mov a,b
add a,#30h
acall wchr
```

### B122

```asm
acall delay
```

### B123

Return to the instruction following the active call.

```asm
ret
```

### B124

```asm
MOV R1,#100
```

### B125

```asm
MOV R0,#100
```

### B126

```asm
DJNZ R0,he
```

### B127

```asm
djnz r1,he2
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
B130["B131: instructions - lines 333 to 335"]
B131["B132: instructions - lines 336 to 336"]
B132["B133: instructions - lines 337 to 339"]
B133["B134: CMD - lines 342 to 344"]
B134["B135: instructions - lines 345 to 345"]
B135["B136: instructions - lines 346 to 348"]
B136["B137: instructions - lines 349 to 349"]
B137["B138: instructions - lines 350 to 350"]
B138["B139: COMMON - lines 353 to 358"]
B139["B140: INLCD - lines 361 to 368"]
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
ANL a,#11110000B
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
B140["B141: instructions - lines 369 to 377"]
B141["B142: instructions - lines 378 to 390"]
B142["B143: instructions - lines 391 to 401"]
B143["B144: instructions - lines 402 to 402"]
B144["B145: LDELAY - lines 405 to 406"]
B145["B146: instructions - lines 407 to 407"]
B146["B147: CLEAR - lines 410 to 411"]
B147["B148: instructions - lines 412 to 412"]
B148["B149: WAIT - lines 413 to 413"]
B149["B150: instructions - lines 414 to 414"]
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
B150["B151: instructions - lines 415 to 415"]
B151["B152: WSTR - lines 418 to 418"]
B152["B153: CONT1 - lines 420 to 422"]
B153["B154: PRINT - lines 424 to 424"]
B154["B155: instructions - lines 425 to 426"]
B155["B156: EXIT1 - lines 427 to 428"]
B156["B157: KEYPAD - lines 434 to 434"]
B157["B158: K1 - lines 435 to 438"]
B158["B159: K2 - lines 440 to 442"]
B159["B160: instructions - lines 443 to 443"]
B151 -->|next| B152
B152 -->|condition true| B155
B152 -->|condition false| B153
B153 -->|call| B128
B153 -->|after return| B154
B154 -->|jump| B152
B156 -->|next| B157
B157 -->|condition true| B157
B157 -->|condition false| B158
B158 -->|condition true| B160
B158 -->|condition false| B159
B159 -->|jump| B158
B128["Continue at B129 in section 13"]
B160["Continue at B161 in section 17"]
```

### B151

Return to the instruction following the active call.

```asm
ret
```

### B152

```asm
PUSH    ACC
```

### B153

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B154

```asm
ACALL    WCHR
```

### B155

```asm
INC DPTR
AJMP    CONT1
```

### B156

Return to the instruction following the active call.

```asm
POP     ACC
RET
```

### B157

```asm
MOV P0,#01110000B
```

### B158

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B159

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B160

```asm
SJMP K2
```

## Section 17

```mermaid
flowchart TD
B160["B161: OVER1 - lines 445 to 448"]
B161["B162: instructions - lines 449 to 452"]
B162["B163: instructions - lines 453 to 456"]
B163["B164: instructions - lines 457 to 460"]
B164["B165: instructions - lines 461 to 461"]
B165["B166: ROW_0 - lines 462 to 463"]
B166["B167: ROW_1 - lines 464 to 465"]
B167["B168: ROW_2 - lines 466 to 467"]
B168["B169: ROW_3 - lines 468 to 468"]
B169["B170: FIND - lines 470 to 470"]
B160 -->|condition true| B165
B160 -->|condition false| B161
B161 -->|condition true| B166
B161 -->|condition false| B162
B162 -->|condition true| B167
B162 -->|condition false| B163
B163 -->|condition true| B168
B163 -->|condition false| B164
B164 -->|jump| B158
B165 -->|jump| B169
B166 -->|jump| B169
B167 -->|jump| B169
B168 -->|next| B169
B169 -->|next| B170
B158["Continue at B159 in section 16"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B162

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B163

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B164

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B165

```asm
LJMP K2
```

### B166

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B167

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B168

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B169

```asm
MOV DPTR,#KCODE3
```

### B170

```asm
RLC A
```

## Section 18

```mermaid
flowchart TD
B170["B171: FIND1 - lines 472 to 473"]
B171["B172: instructions - lines 474 to 475"]
B172["B173: MATCH - lines 476 to 478"]
B170 -->|condition true| B172
B170 -->|condition false| B171
B171 -->|jump| B170
```

### B171

```asm
RLC A
JNC MATCH
```

### B172

```asm
INC DPTR
SJMP FIND1
```

### B173

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```
