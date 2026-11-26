# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15)

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
B0 -->|call| B125
B0 -->|after return| B1
B1 -->|call| B132
B1 -->|after return| B2
B2 -->|call| B54
B2 -->|after return| B3
B3 -->|call| B132
B3 -->|after return| B4
B4 -->|call| B60
B4 -->|after return| B5
B5 -->|call| B132
B5 -->|after return| B6
B6 -->|condition true| B21
B6 -->|condition false| B7
B7 -->|next| B8
B8 -->|call| B109
B8 -->|after return| B9
B9 -->|call| B109
B9 -->|after return| B10
B125["Continue at B126 in section 13"]
B132["Continue at B133 in section 14"]
B54["Continue at B55 in section 6"]
B60["Continue at B61 in section 7"]
B21["Continue at B22 in section 3"]
B109["Continue at B110 in section 11"]
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
B11 -->|call| B132
B11 -->|after return| B12
B12 -->|call| B66
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
B132["Continue at B133 in section 14"]
B66["Continue at B67 in section 7"]
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
B22 -->|call| B109
B22 -->|after return| B23
B23 -->|call| B109
B23 -->|after return| B24
B24 -->|condition true| B22
B24 -->|condition false| B25
B25 -->|call| B132
B25 -->|after return| B26
B26 -->|condition true| B36
B26 -->|condition false| B27
B27 -->|call| B74
B27 -->|after return| B28
B28 -->|condition true| B32
B28 -->|condition false| B29
B29 -->|condition true| B31
B29 -->|condition false| B30
B52["Continue at B53 in section 6"]
B109["Continue at B110 in section 11"]
B132["Continue at B133 in section 14"]
B36["Continue at B37 in section 4"]
B74["Continue at B75 in section 8"]
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
B38 -->|call| B109
B38 -->|after return| B39
B39 -->|call| B109
B39 -->|after return| B40
B51["Continue at B52 in section 6"]
B52["Continue at B53 in section 6"]
B21["Continue at B22 in section 3"]
B109["Continue at B110 in section 11"]
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
B41 -->|call| B132
B41 -->|after return| B42
B42 -->|call| B82
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
B132["Continue at B133 in section 14"]
B82["Continue at B83 in section 9"]
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
B52 -->|call| B102
B52 -->|after return| B53
B53 -->|jump| B53
B54 -->|call| B119
B54 -->|after return| B55
B55 -->|call| B137
B55 -->|after return| B56
B56 -->|call| B119
B56 -->|after return| B57
B57 -->|call| B137
B57 -->|after return| B58
B58 -->|call| B109
B58 -->|after return| B59
B102["Continue at B103 in section 11"]
B119["Continue at B120 in section 12"]
B137["Continue at B138 in section 14"]
B109["Continue at B110 in section 11"]
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
B65["B66: instructions - lines 191 to 191"]
B66["B67: VIPMESG - lines 195 to 196"]
B67["B68: instructions - lines 197 to 198"]
B68["B69: instructions - lines 199 to 199"]
B69["B70: instructions - lines 201 to 201"]
B60 -->|call| B119
B60 -->|after return| B61
B61 -->|call| B137
B61 -->|after return| B62
B62 -->|call| B119
B62 -->|after return| B63
B63 -->|call| B137
B63 -->|after return| B64
B64 -->|call| B109
B64 -->|after return| B65
B66 -->|call| B119
B66 -->|after return| B67
B67 -->|call| B137
B67 -->|after return| B68
B68 -->|call| B109
B68 -->|after return| B69
B69 -->|call| B132
B69 -->|after return| B70
B119["Continue at B120 in section 12"]
B137["Continue at B138 in section 14"]
B109["Continue at B110 in section 11"]
B132["Continue at B133 in section 14"]
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

Return to the instruction following the active call.

```asm
ret
```

### B67

```asm
mov a, #80H
acall cmd
```

### B68

```asm
mov dptr, #VIPP
acall wstr
```

### B69

```asm
acall delay
```

### B70

```asm
acall clear
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 202 to 202"]
B71["B72: instructions - lines 204 to 204"]
B72["B73: instructions - lines 205 to 205"]
B73["B74: instructions - lines 207 to 207"]
B74["B75: ONLMESG - lines 210 to 211"]
B75["B76: instructions - lines 212 to 213"]
B76["B77: instructions - lines 214 to 214"]
B77["B78: instructions - lines 215 to 215"]
B78["B79: instructions - lines 216 to 216"]
B79["B80: instructions - lines 218 to 218"]
B70 -->|call| B90
B70 -->|after return| B71
B71 -->|call| B132
B71 -->|after return| B72
B72 -->|call| B96
B72 -->|after return| B73
B74 -->|call| B119
B74 -->|after return| B75
B75 -->|call| B137
B75 -->|after return| B76
B76 -->|call| B109
B76 -->|after return| B77
B77 -->|call| B132
B77 -->|after return| B78
B78 -->|call| B90
B78 -->|after return| B79
B79 -->|call| B132
B79 -->|after return| B80
B90["Continue at B91 in section 10"]
B132["Continue at B133 in section 14"]
B96["Continue at B97 in section 10"]
B119["Continue at B120 in section 12"]
B137["Continue at B138 in section 14"]
B109["Continue at B110 in section 11"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
acall menu2
```

### B72

```asm
acall clear
```

### B73

```asm
acall dura
```

### B74

Return to the instruction following the active call.

```asm
ret
```

### B75

```asm
mov a, #80H
acall cmd
```

### B76

```asm
mov dptr, #VIPP
acall wstr
```

### B77

```asm
acall delay
```

### B78

```asm
acall clear
```

### B79

```asm
acall menu2
```

### B80

```asm
acall clear
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 219 to 219"]
B81["B82: instructions - lines 220 to 220"]
B82["B83: REGMESG - lines 223 to 224"]
B83["B84: instructions - lines 225 to 226"]
B84["B85: instructions - lines 227 to 227"]
B85["B86: instructions - lines 228 to 228"]
B86["B87: instructions - lines 229 to 229"]
B87["B88: instructions - lines 231 to 231"]
B88["B89: instructions - lines 232 to 232"]
B89["B90: instructions - lines 233 to 233"]
B80 -->|call| B96
B80 -->|after return| B81
B82 -->|call| B119
B82 -->|after return| B83
B83 -->|call| B137
B83 -->|after return| B84
B84 -->|call| B109
B84 -->|after return| B85
B85 -->|call| B132
B85 -->|after return| B86
B86 -->|call| B90
B86 -->|after return| B87
B87 -->|call| B132
B87 -->|after return| B88
B88 -->|call| B96
B88 -->|after return| B89
B96["Continue at B97 in section 10"]
B119["Continue at B120 in section 12"]
B137["Continue at B138 in section 14"]
B109["Continue at B110 in section 11"]
B132["Continue at B133 in section 14"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
acall dura
```

### B82

Return to the instruction following the active call.

```asm
ret
```

### B83

```asm
mov a, #80H
acall cmd
```

### B84

```asm
mov dptr, #VIPP
acall wstr
```

### B85

```asm
acall delay
```

### B86

```asm
acall clear
```

### B87

```asm
acall menu2
```

### B88

```asm
acall clear
```

### B89

```asm
acall dura
```

### B90

Return to the instruction following the active call.

```asm
ret
```

## Section 10

```mermaid
flowchart TD
B90["B91: MENU2 - lines 236 to 237"]
B91["B92: instructions - lines 238 to 239"]
B92["B93: instructions - lines 241 to 242"]
B93["B94: instructions - lines 243 to 244"]
B94["B95: instructions - lines 245 to 245"]
B95["B96: instructions - lines 246 to 246"]
B96["B97: DURA - lines 249 to 250"]
B97["B98: instructions - lines 251 to 252"]
B98["B99: instructions - lines 254 to 255"]
B99["B100: instructions - lines 256 to 258"]
B90 -->|call| B119
B90 -->|after return| B91
B91 -->|call| B137
B91 -->|after return| B92
B92 -->|call| B119
B92 -->|after return| B93
B93 -->|call| B137
B93 -->|after return| B94
B94 -->|call| B109
B94 -->|after return| B95
B96 -->|call| B119
B96 -->|after return| B97
B97 -->|call| B137
B97 -->|after return| B98
B98 -->|call| B119
B98 -->|after return| B99
B99 -->|call| B114
B99 -->|after return| B100
B119["Continue at B120 in section 12"]
B137["Continue at B138 in section 14"]
B109["Continue at B110 in section 11"]
B114["Continue at B115 in section 12"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
mov a, #80H
acall cmd
```

### B92

```asm
mov dptr, #sel
acall wstr
```

### B93

```asm
mov a,#0c0h
acall cmd
```

### B94

```asm
mov dptr, #op2
acall wstr
```

### B95

```asm
acall delay
```

### B96

Return to the instruction following the active call.

```asm
RET
```

### B97

```asm
mov a, #80H
acall cmd
```

### B98

```asm
mov dptr, #dur
acall wstr
```

### B99

```asm
mov a,#0c0h
acall cmd
```

### B100

```asm
mov a,31h
add a,#30h
acall wchr
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 259 to 259"]
B101["B102: instructions - lines 261 to 261"]
B102["B103: PAYMENT - lines 264 to 265"]
B103["B104: instructions - lines 266 to 267"]
B104["B105: instructions - lines 269 to 270"]
B105["B106: instructions - lines 271 to 275"]
B106["B107: instructions - lines 276 to 278"]
B107["B108: instructions - lines 279 to 279"]
B108["B109: instructions - lines 281 to 281"]
B109["B110: DELAY - lines 285 to 285"]
B100 -->|call| B109
B100 -->|after return| B101
B102 -->|call| B119
B102 -->|after return| B103
B103 -->|call| B137
B103 -->|after return| B104
B104 -->|call| B119
B104 -->|after return| B105
B105 -->|call| B114
B105 -->|after return| B106
B106 -->|call| B114
B106 -->|after return| B107
B107 -->|call| B109
B107 -->|after return| B108
B109 -->|next| B110
B119["Continue at B120 in section 12"]
B137["Continue at B138 in section 14"]
B114["Continue at B115 in section 12"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
acall delay
```

### B102

Return to the instruction following the active call.

```asm
ret
```

### B103

```asm
mov a, #80H
acall cmd
```

### B104

```asm
mov dptr, #pay
acall wstr
```

### B105

```asm
mov a,#0c0h
acall cmd
```

### B106

```asm
mov a,32h
mov b,#0Ah
div ab
add a,#30h
acall wchr
```

### B107

```asm
mov a,b
add a,#30h
acall wchr
```

### B108

```asm
acall delay
```

### B109

Return to the instruction following the active call.

```asm
ret
```

### B110

```asm
MOV R1,#100
```

## Section 12

```mermaid
flowchart TD
B110["B111: HE2 - lines 286 to 286"]
B111["B112: HE - lines 287 to 287"]
B112["B113: instructions - lines 288 to 288"]
B113["B114: instructions - lines 289 to 289"]
B114["B115: WCHR - lines 293 to 297"]
B115["B116: instructions - lines 298 to 298"]
B116["B117: instructions - lines 299 to 301"]
B117["B118: instructions - lines 302 to 302"]
B118["B119: instructions - lines 303 to 305"]
B119["B120: CMD - lines 308 to 310"]
B110 -->|next| B111
B111 -->|condition true| B111
B111 -->|condition false| B112
B112 -->|condition true| B110
B112 -->|condition false| B113
B114 -->|call| B124
B114 -->|after return| B115
B115 -->|call| B130
B115 -->|after return| B116
B116 -->|call| B124
B116 -->|after return| B117
B117 -->|call| B130
B117 -->|after return| B118
B119 -->|call| B124
B119 -->|after return| B120
B124["Continue at B125 in section 13"]
B130["Continue at B131 in section 14"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV R0,#100
```

### B112

```asm
DJNZ R0,he
```

### B113

```asm
djnz r1,he2
```

### B114

Return to the instruction following the active call.

```asm
RET
```

### B115

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B116

```asm
ACALL LDELAY
```

### B117

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B118

```asm
ACALL LDELAY
```

### B119

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B120

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 311 to 311"]
B121["B122: instructions - lines 312 to 314"]
B122["B123: instructions - lines 315 to 315"]
B123["B124: instructions - lines 316 to 316"]
B124["B125: COMMON - lines 319 to 324"]
B125["B126: INLCD - lines 327 to 334"]
B126["B127: instructions - lines 335 to 343"]
B127["B128: instructions - lines 344 to 356"]
B128["B129: instructions - lines 357 to 367"]
B129["B130: instructions - lines 368 to 368"]
B120 -->|call| B130
B120 -->|after return| B121
B121 -->|call| B124
B121 -->|after return| B122
B122 -->|call| B130
B122 -->|after return| B123
B125 -->|call| B130
B125 -->|after return| B126
B126 -->|call| B130
B126 -->|after return| B127
B127 -->|call| B130
B127 -->|after return| B128
B128 -->|call| B130
B128 -->|after return| B129
B130["Continue at B131 in section 14"]
```

### B121

```asm
ACALL LDELAY
```

### B122

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B123

```asm
ACALL LDELAY
```

### B124

Return to the instruction following the active call.

```asm
RET
```

### B125

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B126

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

### B127

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

### B128

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

### B129

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

### B130

Return to the instruction following the active call.

```asm
RET
```

## Section 14

```mermaid
flowchart TD
B130["B131: LDELAY - lines 371 to 372"]
B131["B132: instructions - lines 373 to 373"]
B132["B133: CLEAR - lines 376 to 377"]
B133["B134: instructions - lines 378 to 378"]
B134["B135: WAIT - lines 379 to 379"]
B135["B136: instructions - lines 380 to 380"]
B136["B137: instructions - lines 381 to 381"]
B137["B138: WSTR - lines 384 to 384"]
B138["B139: CONT1 - lines 386 to 388"]
B139["B140: PRINT - lines 390 to 390"]
B130 -->|condition true| B130
B130 -->|condition false| B131
B132 -->|call| B119
B132 -->|after return| B133
B133 -->|next| B134
B134 -->|call| B130
B134 -->|after return| B135
B135 -->|condition true| B134
B135 -->|condition false| B136
B137 -->|next| B138
B138 -->|condition true| B141
B138 -->|condition false| B139
B139 -->|call| B114
B139 -->|after return| B140
B119["Continue at B120 in section 12"]
B141["Continue at B142 in section 15"]
B114["Continue at B115 in section 12"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
MOV R0, #50
DJNZ R0, $
```

### B132

Return to the instruction following the active call.

```asm
RET
```

### B133

```asm
MOV A,#01H
ACALL CMD
```

### B134

```asm
MOV R7,#14
```

### B135

```asm
ACALL LDELAY
```

### B136

```asm
DJNZ R7,WAIT
```

### B137

Return to the instruction following the active call.

```asm
ret
```

### B138

```asm
PUSH    ACC
```

### B139

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B140

```asm
ACALL    WCHR
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 391 to 392"]
B141["B142: EXIT1 - lines 393 to 394"]
B140 -->|jump| B138
B138["Continue at B139 in section 14"]
```

### B141

```asm
INC DPTR
AJMP    CONT1
```

### B142

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
