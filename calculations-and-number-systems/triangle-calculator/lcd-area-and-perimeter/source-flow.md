# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 2 to 2"]
B1["B2: instructions - lines 4 to 12"]
B2["B3: MENU - lines 16 to 16"]
B3["B4: instructions - lines 17 to 17"]
B4["B5: instructions - lines 18 to 19"]
B5["B6: instructions - lines 21 to 21"]
B6["B7: instructions - lines 22 to 22"]
B7["B8: instructions - lines 23 to 23"]
B8["B9: instructions - lines 24 to 24"]
B9["B10: instructions - lines 25 to 25"]
B0 -->|call| B131
B0 -->|after return| B1
B1 -->|call| B29
B1 -->|after return| B2
B2 -->|call| B37
B2 -->|after return| B3
B3 -->|call| B45
B3 -->|after return| B4
B4 -->|condition true| B10
B4 -->|condition false| B5
B5 -->|call| B51
B5 -->|after return| B6
B6 -->|call| B76
B6 -->|after return| B7
B7 -->|call| B23
B7 -->|after return| B8
B8 -->|call| B94
B8 -->|after return| B9
B9 -->|jump| B25
B131["Continue at B132 in section 14"]
B29["Continue at B30 in section 3"]
B37["Continue at B38 in section 4"]
B45["Continue at B46 in section 5"]
B10["Continue at B11 in section 2"]
B51["Continue at B52 in section 6"]
B76["Continue at B77 in section 8"]
B23["Continue at B24 in section 3"]
B94["Continue at B95 in section 10"]
B25["Continue at B26 in section 3"]
```

### B1

```asm
ACALL INLCD
```

### B2

```asm
MOV 30H, #1
MOV 40H, #3
MOV 41H, #4
MOV 42H, #2
MOV 43H, #3
MOV 44H, #4
MOV 50H, #0
MOV 51H, #0
ACALL WELCOME
```

### B3

```asm
ACALL Menuu
```

### B4

```asm
ACALL SELECTT
```

### B5

```asm
MOV A,30H
CJNE A,#1,OPERATION2
```

### B6

```asm
ACALL OPTIONN1
```

### B7

```asm
ACALL ENTER_DIM
```

### B8

```asm
ACALL AREAA
```

### B9

```asm
ACALL PRINT1
```

### B10

```asm
SJMP CONTINUE
```

## Section 2

```mermaid
flowchart TD
B10["B11: OPERATION2 - lines 28 to 28"]
B11["B12: instructions - lines 30 to 30"]
B12["B13: instructions - lines 31 to 31"]
B13["B14: instructions - lines 32 to 32"]
B14["B15: instructions - lines 33 to 33"]
B15["B16: instructions - lines 34 to 34"]
B16["B17: WRONG - lines 37 to 37"]
B17["B18: instructions - lines 38 to 38"]
B18["B19: EXIT - lines 41 to 41"]
B19["B20: instructions - lines 42 to 42"]
B10 -->|condition true| B16
B10 -->|condition false| B11
B11 -->|call| B55
B11 -->|after return| B12
B12 -->|call| B63
B12 -->|after return| B13
B13 -->|call| B24
B13 -->|after return| B14
B14 -->|call| B107
B14 -->|after return| B15
B15 -->|jump| B25
B16 -->|call| B59
B16 -->|after return| B17
B17 -->|jump| B2
B18 -->|call| B138
B18 -->|after return| B19
B19 -->|call| B115
B19 -->|after return| B20
B55["Continue at B56 in section 6"]
B63["Continue at B64 in section 7"]
B24["Continue at B25 in section 3"]
B107["Continue at B108 in section 11"]
B25["Continue at B26 in section 3"]
B59["Continue at B60 in section 6"]
B2["Continue at B3 in section 1"]
B138["Continue at B139 in section 14"]
B115["Continue at B116 in section 12"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
CJNE A,#2,WRONG
```

### B12

```asm
ACALL OPTIONN2
```

### B13

```asm
ACALL ENTER_SIDES
```

### B14

```asm
ACALL PERIMETER
```

### B15

```asm
ACALL PRINT2
```

### B16

```asm
SJMP CONTINUE
```

### B17

```asm
ACALL WRONGG
```

### B18

```asm
SJMP MENU
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
B20["B21: instructions - lines 43 to 44"]
B21["B22: instructions - lines 45 to 46"]
B22["B23: EE - lines 47 to 47"]
B23["B24: AREAA - lines 52 to 61"]
B24["B25: PERIMETER - lines 65 to 72"]
B25["B26: CONTINUE - lines 75 to 75"]
B26["B27: instructions - lines 76 to 77"]
B27["B28: instructions - lines 78 to 78"]
B28["B29: instructions - lines 79 to 79"]
B29["B30: WELCOME - lines 83 to 83"]
B20 -->|call| B125
B20 -->|after return| B21
B21 -->|call| B143
B21 -->|after return| B22
B22 -->|jump| B22
B25 -->|call| B87
B25 -->|after return| B26
B26 -->|condition true| B18
B26 -->|condition false| B27
B27 -->|jump| B2
B29 -->|call| B138
B29 -->|after return| B30
B125["Continue at B126 in section 13"]
B143["Continue at B144 in section 15"]
B87["Continue at B88 in section 9"]
B18["Continue at B19 in section 2"]
B2["Continue at B3 in section 1"]
B138["Continue at B139 in section 14"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
mov a, #80H
acall cmd
```

### B22

```asm
mov dptr, #THANKS
acall wstr
```

### B23

```asm
SJMP EE
```

### B24

Return to the instruction following the active call.

```asm
MOV A,40H
MOV B,41H
MUL AB
MOV B,#2
DIV AB
MOV 50H,A
MOV 51H,B
RET
```

### B25

Return to the instruction following the active call.

```asm
MOV A,42H
ADD A,43H
ADD A,44H
MOV 50H,A
RET
```

### B26

```asm
ACALL CON
```

### B27

```asm
MOV A,#2
CJNE A,#1,EXIT
```

### B28

```asm
SJMP MENU
```

### B29

Return to the instruction following the active call.

```asm
RET
```

### B30

```asm
ACALL CLEAR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 84 to 84"]
B31["B32: instructions - lines 85 to 86"]
B32["B33: instructions - lines 87 to 88"]
B33["B34: instructions - lines 90 to 91"]
B34["B35: instructions - lines 92 to 93"]
B35["B36: instructions - lines 94 to 94"]
B36["B37: instructions - lines 95 to 95"]
B37["B38: MENUU - lines 98 to 98"]
B38["B39: instructions - lines 99 to 99"]
B39["B40: instructions - lines 100 to 101"]
B30 -->|call| B115
B30 -->|after return| B31
B31 -->|call| B125
B31 -->|after return| B32
B32 -->|call| B143
B32 -->|after return| B33
B33 -->|call| B125
B33 -->|after return| B34
B34 -->|call| B143
B34 -->|after return| B35
B35 -->|call| B115
B35 -->|after return| B36
B37 -->|call| B138
B37 -->|after return| B38
B38 -->|call| B115
B38 -->|after return| B39
B39 -->|call| B125
B39 -->|after return| B40
B115["Continue at B116 in section 12"]
B125["Continue at B126 in section 13"]
B143["Continue at B144 in section 15"]
B138["Continue at B139 in section 14"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL DELAY
```

### B32

```asm
mov a, #80H
acall cmd
```

### B33

```asm
mov dptr, #NAME
acall wstr
```

### B34

```asm
mov a,#0c0h
acall cmd
```

### B35

```asm
mov dptr, #PROJECT
acall wstr
```

### B36

```asm
acall delay
```

### B37

Return to the instruction following the active call.

```asm
ret
```

### B38

```asm
ACALL CLEAR
```

### B39

```asm
ACALL DELAY
```

### B40

```asm
mov a, #80H
acall cmd
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 102 to 103"]
B41["B42: instructions - lines 105 to 106"]
B42["B43: instructions - lines 107 to 108"]
B43["B44: instructions - lines 109 to 109"]
B44["B45: instructions - lines 110 to 110"]
B45["B46: SELECTT - lines 113 to 113"]
B46["B47: instructions - lines 114 to 114"]
B47["B48: instructions - lines 115 to 116"]
B48["B49: instructions - lines 117 to 118"]
B49["B50: instructions - lines 119 to 121"]
B40 -->|call| B143
B40 -->|after return| B41
B41 -->|call| B125
B41 -->|after return| B42
B42 -->|call| B143
B42 -->|after return| B43
B43 -->|call| B115
B43 -->|after return| B44
B45 -->|call| B138
B45 -->|after return| B46
B46 -->|call| B115
B46 -->|after return| B47
B47 -->|call| B125
B47 -->|after return| B48
B48 -->|call| B143
B48 -->|after return| B49
B49 -->|call| B120
B49 -->|after return| B50
B143["Continue at B144 in section 15"]
B125["Continue at B126 in section 13"]
B115["Continue at B116 in section 12"]
B138["Continue at B139 in section 14"]
B120["Continue at B121 in section 13"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
mov dptr, #OP1
acall wstr
```

### B42

```asm
mov a,#0c0h
acall cmd
```

### B43

```asm
mov dptr, #OP2
acall wstr
```

### B44

```asm
acall delay
```

### B45

Return to the instruction following the active call.

```asm
ret
```

### B46

```asm
ACALL CLEAR
```

### B47

```asm
ACALL DELAY
```

### B48

```asm
mov a, #80H
acall cmd
```

### B49

```asm
mov dptr, #MSG
acall wstr
```

### B50

```asm
MOV A,30H
ADD A,#30H
ACALL WCHR
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 123 to 123"]
B51["B52: OPTIONN1 - lines 126 to 127"]
B52["B53: instructions - lines 128 to 129"]
B53["B54: instructions - lines 130 to 130"]
B54["B55: instructions - lines 131 to 131"]
B55["B56: OPTIONN2 - lines 134 to 135"]
B56["B57: instructions - lines 136 to 137"]
B57["B58: instructions - lines 138 to 138"]
B58["B59: instructions - lines 139 to 139"]
B59["B60: WRONGG - lines 142 to 143"]
B51 -->|call| B125
B51 -->|after return| B52
B52 -->|call| B143
B52 -->|after return| B53
B53 -->|call| B115
B53 -->|after return| B54
B55 -->|call| B125
B55 -->|after return| B56
B56 -->|call| B143
B56 -->|after return| B57
B57 -->|call| B115
B57 -->|after return| B58
B59 -->|call| B125
B59 -->|after return| B60
B125["Continue at B126 in section 13"]
B143["Continue at B144 in section 15"]
B115["Continue at B116 in section 12"]
B60["Continue at B61 in section 7"]
```

### B51

Return to the instruction following the active call.

```asm
RET
```

### B52

```asm
mov a,#0c0h
acall cmd
```

### B53

```asm
mov dptr, #MSG1
acall wstr
```

### B54

```asm
acall delay
```

### B55

Return to the instruction following the active call.

```asm
ret
```

### B56

```asm
mov a,#0c0h
acall cmd
```

### B57

```asm
mov dptr, #MSG2
acall wstr
```

### B58

```asm
acall delay
```

### B59

Return to the instruction following the active call.

```asm
ret
```

### B60

```asm
mov a,#0C0h
acall cmd
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 144 to 145"]
B61["B62: instructions - lines 146 to 146"]
B62["B63: instructions - lines 147 to 147"]
B63["B64: ENTER_SIDES - lines 150 to 150"]
B64["B65: instructions - lines 151 to 151"]
B65["B66: instructions - lines 152 to 153"]
B66["B67: instructions - lines 154 to 155"]
B67["B68: instructions - lines 157 to 158"]
B68["B69: instructions - lines 159 to 160"]
B69["B70: instructions - lines 161 to 163"]
B60 -->|call| B143
B60 -->|after return| B61
B61 -->|call| B115
B61 -->|after return| B62
B63 -->|call| B138
B63 -->|after return| B64
B64 -->|call| B115
B64 -->|after return| B65
B65 -->|call| B125
B65 -->|after return| B66
B66 -->|call| B143
B66 -->|after return| B67
B67 -->|call| B125
B67 -->|after return| B68
B68 -->|call| B143
B68 -->|after return| B69
B69 -->|call| B120
B69 -->|after return| B70
B143["Continue at B144 in section 15"]
B115["Continue at B116 in section 12"]
B138["Continue at B139 in section 14"]
B125["Continue at B126 in section 13"]
B120["Continue at B121 in section 13"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
mov dptr, #WRONGGG
acall wstr
```

### B62

```asm
acall delay
```

### B63

Return to the instruction following the active call.

```asm
ret
```

### B64

```asm
ACALL CLEAR
```

### B65

```asm
ACALL DELAY
```

### B66

```asm
mov a, #80H
acall cmd
```

### B67

```asm
mov dptr, #ENTERSIDES
acall wstr
```

### B68

```asm
mov a, #0C0H
acall cmd
```

### B69

```asm
mov dptr, #SIDEA
acall wstr
```

### B70

```asm
MOV A,42H
ADD A,#30H
ACALL WCHR
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 164 to 165"]
B71["B72: instructions - lines 166 to 168"]
B72["B73: instructions - lines 169 to 170"]
B73["B74: instructions - lines 171 to 173"]
B74["B75: instructions - lines 174 to 174"]
B75["B76: instructions - lines 175 to 175"]
B76["B77: ENTER_DIM - lines 179 to 179"]
B77["B78: instructions - lines 180 to 180"]
B78["B79: instructions - lines 181 to 182"]
B79["B80: instructions - lines 183 to 184"]
B70 -->|call| B143
B70 -->|after return| B71
B71 -->|call| B120
B71 -->|after return| B72
B72 -->|call| B143
B72 -->|after return| B73
B73 -->|call| B120
B73 -->|after return| B74
B74 -->|call| B115
B74 -->|after return| B75
B76 -->|call| B138
B76 -->|after return| B77
B77 -->|call| B115
B77 -->|after return| B78
B78 -->|call| B125
B78 -->|after return| B79
B79 -->|call| B143
B79 -->|after return| B80
B143["Continue at B144 in section 15"]
B120["Continue at B121 in section 13"]
B115["Continue at B116 in section 12"]
B138["Continue at B139 in section 14"]
B125["Continue at B126 in section 13"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
mov dptr, #SIDEB
acall wstr
```

### B72

```asm
MOV A,43H
ADD A,#30H
ACALL WCHR
```

### B73

```asm
mov dptr, #SIDEC
acall wstr
```

### B74

```asm
MOV A,44H
ADD A,#30H
ACALL WCHR
```

### B75

```asm
ACALL DELAY
```

### B76

Return to the instruction following the active call.

```asm
RET
```

### B77

```asm
ACALL CLEAR
```

### B78

```asm
ACALL DELAY
```

### B79

```asm
mov a, #80H
acall cmd
```

### B80

```asm
mov dptr, #ENTERSIDES
acall wstr
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 185 to 186"]
B81["B82: instructions - lines 187 to 188"]
B82["B83: instructions - lines 189 to 191"]
B83["B84: instructions - lines 192 to 193"]
B84["B85: instructions - lines 194 to 196"]
B85["B86: instructions - lines 197 to 197"]
B86["B87: instructions - lines 198 to 198"]
B87["B88: CON - lines 201 to 201"]
B88["B89: instructions - lines 202 to 202"]
B89["B90: instructions - lines 203 to 204"]
B80 -->|call| B125
B80 -->|after return| B81
B81 -->|call| B143
B81 -->|after return| B82
B82 -->|call| B120
B82 -->|after return| B83
B83 -->|call| B143
B83 -->|after return| B84
B84 -->|call| B120
B84 -->|after return| B85
B85 -->|call| B115
B85 -->|after return| B86
B87 -->|call| B138
B87 -->|after return| B88
B88 -->|call| B115
B88 -->|after return| B89
B89 -->|call| B125
B89 -->|after return| B90
B125["Continue at B126 in section 13"]
B143["Continue at B144 in section 15"]
B120["Continue at B121 in section 13"]
B115["Continue at B116 in section 12"]
B138["Continue at B139 in section 14"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
mov a, #0C0H
acall cmd
```

### B82

```asm
mov dptr, #SIDEB
acall wstr
```

### B83

```asm
MOV A,40H
ADD A,#30H
ACALL WCHR
```

### B84

```asm
mov dptr, #HIGHT
acall wstr
```

### B85

```asm
MOV A,41H
ADD A,#30H
ACALL WCHR
```

### B86

```asm
ACALL DELAY
```

### B87

Return to the instruction following the active call.

```asm
RET
```

### B88

```asm
ACALL CLEAR
```

### B89

```asm
ACALL DELAY
```

### B90

```asm
mov a, #80H
acall cmd
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 205 to 206"]
B91["B92: instructions - lines 207 to 208"]
B92["B93: instructions - lines 209 to 210"]
B93["B94: instructions - lines 211 to 211"]
B94["B95: PRINT1 - lines 214 to 214"]
B95["B96: instructions - lines 215 to 215"]
B96["B97: instructions - lines 216 to 217"]
B97["B98: instructions - lines 218 to 219"]
B98["B99: instructions - lines 220 to 224"]
B99["B100: instructions - lines 225 to 227"]
B90 -->|call| B143
B90 -->|after return| B91
B91 -->|call| B125
B91 -->|after return| B92
B92 -->|call| B143
B92 -->|after return| B93
B94 -->|call| B138
B94 -->|after return| B95
B95 -->|call| B115
B95 -->|after return| B96
B96 -->|call| B125
B96 -->|after return| B97
B97 -->|call| B143
B97 -->|after return| B98
B98 -->|call| B120
B98 -->|after return| B99
B99 -->|call| B120
B99 -->|after return| B100
B143["Continue at B144 in section 15"]
B125["Continue at B126 in section 13"]
B138["Continue at B139 in section 14"]
B115["Continue at B116 in section 12"]
B120["Continue at B121 in section 13"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
mov dptr, #CONT11
acall wstr
```

### B92

```asm
mov a, #0C0H
acall cmd
```

### B93

```asm
mov dptr, #CONT22
acall wstr
```

### B94

Return to the instruction following the active call.

```asm
RET
```

### B95

```asm
ACALL CLEAR
```

### B96

```asm
ACALL DELAY
```

### B97

```asm
mov a, #80H
acall cmd
```

### B98

```asm
mov dptr, #AAREA
acall wstr
```

### B99

```asm
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B100

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 228 to 228"]
B101["B102: instructions - lines 229 to 230"]
B102["B103: instructions - lines 231 to 232"]
B103["B104: instructions - lines 233 to 235"]
B104["B105: instructions - lines 236 to 236"]
B105["B106: instructions - lines 237 to 237"]
B106["B107: instructions - lines 239 to 239"]
B107["B108: PRINT2 - lines 242 to 242"]
B108["B109: instructions - lines 243 to 243"]
B109["B110: instructions - lines 244 to 245"]
B100 -->|call| B136
B100 -->|after return| B101
B101 -->|call| B125
B101 -->|after return| B102
B102 -->|call| B143
B102 -->|after return| B103
B103 -->|call| B120
B103 -->|after return| B104
B104 -->|call| B115
B104 -->|after return| B105
B105 -->|call| B115
B105 -->|after return| B106
B107 -->|call| B138
B107 -->|after return| B108
B108 -->|call| B115
B108 -->|after return| B109
B109 -->|call| B125
B109 -->|after return| B110
B136["Continue at B137 in section 14"]
B125["Continue at B126 in section 13"]
B143["Continue at B144 in section 15"]
B120["Continue at B121 in section 13"]
B115["Continue at B116 in section 12"]
B138["Continue at B139 in section 14"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
ACALL LDELAY
```

### B102

```asm
mov a, #0C0H
acall cmd
```

### B103

```asm
mov dptr, #REMINDER
acall wstr
```

### B104

```asm
MOV A,51H
ADD A,#30H
ACALL WCHR
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

Return to the instruction following the active call.

```asm
RET
```

### B108

```asm
ACALL CLEAR
```

### B109

```asm
ACALL DELAY
```

### B110

```asm
mov a, #80H
acall cmd
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 246 to 247"]
B111["B112: instructions - lines 249 to 253"]
B112["B113: instructions - lines 254 to 256"]
B113["B114: instructions - lines 257 to 257"]
B114["B115: instructions - lines 258 to 258"]
B115["B116: DELAY - lines 264 to 264"]
B116["B117: HE2 - lines 265 to 265"]
B117["B118: HE - lines 266 to 266"]
B118["B119: instructions - lines 267 to 267"]
B119["B120: instructions - lines 268 to 268"]
B110 -->|call| B143
B110 -->|after return| B111
B111 -->|call| B120
B111 -->|after return| B112
B112 -->|call| B120
B112 -->|after return| B113
B113 -->|call| B115
B113 -->|after return| B114
B115 -->|next| B116
B116 -->|next| B117
B117 -->|condition true| B117
B117 -->|condition false| B118
B118 -->|condition true| B116
B118 -->|condition false| B119
B143["Continue at B144 in section 15"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
mov dptr, #PPERIMETER
acall wstr
```

### B112

```asm
MOV A,50H
MOV B,#10
DIV AB
ADD A,#30H
ACALL WCHR
```

### B113

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B114

```asm
ACALL DELAY
```

### B115

Return to the instruction following the active call.

```asm
RET
```

### B116

```asm
MOV R1,#100
```

### B117

```asm
MOV R0,#10
```

### B118

```asm
DJNZ R0,he
```

### B119

```asm
djnz r1,he2
```

### B120

Return to the instruction following the active call.

```asm
RET
```

## Section 13

```mermaid
flowchart TD
B120["B121: WCHR - lines 272 to 276"]
B121["B122: instructions - lines 277 to 277"]
B122["B123: instructions - lines 278 to 280"]
B123["B124: instructions - lines 281 to 281"]
B124["B125: instructions - lines 282 to 284"]
B125["B126: CMD - lines 287 to 289"]
B126["B127: instructions - lines 290 to 290"]
B127["B128: instructions - lines 291 to 293"]
B128["B129: instructions - lines 294 to 294"]
B129["B130: instructions - lines 295 to 295"]
B120 -->|call| B130
B120 -->|after return| B121
B121 -->|call| B136
B121 -->|after return| B122
B122 -->|call| B130
B122 -->|after return| B123
B123 -->|call| B136
B123 -->|after return| B124
B125 -->|call| B130
B125 -->|after return| B126
B126 -->|call| B136
B126 -->|after return| B127
B127 -->|call| B130
B127 -->|after return| B128
B128 -->|call| B136
B128 -->|after return| B129
B130["Continue at B131 in section 14"]
B136["Continue at B137 in section 14"]
```

### B121

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B122

```asm
ACALL LDELAY
```

### B123

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B124

```asm
ACALL LDELAY
```

### B125

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B126

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B127

```asm
ACALL LDELAY
```

### B128

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B129

```asm
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
B130["B131: COMMON - lines 298 to 303"]
B131["B132: INLCD - lines 306 to 313"]
B132["B133: instructions - lines 314 to 322"]
B133["B134: instructions - lines 323 to 335"]
B134["B135: instructions - lines 336 to 346"]
B135["B136: instructions - lines 347 to 347"]
B136["B137: LDELAY - lines 350 to 351"]
B137["B138: instructions - lines 352 to 352"]
B138["B139: CLEAR - lines 355 to 356"]
B139["B140: instructions - lines 357 to 357"]
B131 -->|call| B136
B131 -->|after return| B132
B132 -->|call| B136
B132 -->|after return| B133
B133 -->|call| B136
B133 -->|after return| B134
B134 -->|call| B136
B134 -->|after return| B135
B136 -->|condition true| B136
B136 -->|condition false| B137
B138 -->|call| B125
B138 -->|after return| B139
B139 -->|next| B140
B125["Continue at B126 in section 13"]
B140["Continue at B141 in section 15"]
```

### B131

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B132

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

### B133

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

### B134

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

### B135

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

### B136

Return to the instruction following the active call.

```asm
RET
```

### B137

```asm
MOV R0, #50
DJNZ R0, $
```

### B138

Return to the instruction following the active call.

```asm
RET
```

### B139

```asm
MOV A,#01H
ACALL CMD
```

### B140

```asm
MOV R7,#14
```

## Section 15

```mermaid
flowchart TD
B140["B141: WAIT - lines 358 to 358"]
B141["B142: instructions - lines 359 to 359"]
B142["B143: instructions - lines 360 to 360"]
B143["B144: WSTR - lines 363 to 363"]
B144["B145: CONT1 - lines 365 to 367"]
B145["B146: PRINT - lines 369 to 369"]
B146["B147: instructions - lines 370 to 371"]
B147["B148: EXIT1 - lines 372 to 373"]
B140 -->|call| B136
B140 -->|after return| B141
B141 -->|condition true| B140
B141 -->|condition false| B142
B143 -->|next| B144
B144 -->|condition true| B147
B144 -->|condition false| B145
B145 -->|call| B120
B145 -->|after return| B146
B146 -->|jump| B144
B136["Continue at B137 in section 14"]
B120["Continue at B121 in section 13"]
```

### B141

```asm
ACALL LDELAY
```

### B142

```asm
DJNZ R7,WAIT
```

### B143

Return to the instruction following the active call.

```asm
ret
```

### B144

```asm
PUSH    ACC
```

### B145

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B146

```asm
ACALL    WCHR
```

### B147

```asm
INC DPTR
AJMP    CONT1
```

### B148

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
