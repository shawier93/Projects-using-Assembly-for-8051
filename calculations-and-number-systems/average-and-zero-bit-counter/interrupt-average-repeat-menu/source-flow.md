# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.
- `ORG 0003H` begins at B2.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20) · [Section 21](#section-21) · [Section 22](#section-22)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 3 to 3"]
B1["B2: instructions - lines 5 to 5"]
B2["B3: X0 - lines 10 to 10"]
B3["B4: instructions - lines 11 to 11"]
B4["B5: instructions - lines 12 to 13"]
B5["B6: BEGINING - lines 17 to 17"]
B6["B7: instructions - lines 18 to 18"]
B7["B8: instructions - lines 20 to 20"]
B8["B9: instructions - lines 21 to 21"]
B9["B10: instructions - lines 22 to 23"]
B0 -->|jump| B2
B1 -->|jump| B64
B2 -->|call| B71
B2 -->|after return| B3
B3 -->|call| B199
B3 -->|after return| B4
B4 -->|next| B5
B5 -->|call| B206
B5 -->|after return| B6
B6 -->|call| B81
B6 -->|after return| B7
B7 -->|call| B206
B7 -->|after return| B8
B8 -->|call| B66
B8 -->|after return| B9
B9 -->|call| B193
B9 -->|after return| B10
B64["Continue at B65 in section 7"]
B71["Continue at B72 in section 8"]
B199["Continue at B200 in section 20"]
B206["Continue at B207 in section 21"]
B81["Continue at B82 in section 9"]
B66["Continue at B67 in section 7"]
B193["Continue at B194 in section 20"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
AJMP X0
```

### B2

```asm
LJMP EX0ISR
```

### B3

```asm
ACALL FLASH
```

### B4

```asm
ACALL INLCD
```

### B5

```asm
MOV IE,#10000001B
SETB IT0
```

### B6

```asm
acall clear
```

### B7

```asm
acall WRITE1
```

### B8

```asm
ACALL CLEAR
```

### B9

```asm
ACALL DELAY
```

### B10

```asm
mov a, #80H
acall cmd
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 24 to 25"]
B11["B12: instructions - lines 26 to 26"]
B12["B13: instructions - lines 27 to 28"]
B13["B14: HERE2 - lines 31 to 31"]
B14["B15: instructions - lines 32 to 32"]
B15["B16: instructions - lines 35 to 36"]
B16["B17: MIAN - lines 39 to 39"]
B17["B18: instructions - lines 41 to 41"]
B18["B19: instructions - lines 42 to 47"]
B19["B20: instructions - lines 48 to 48"]
B10 -->|call| B66
B10 -->|after return| B11
B11 -->|call| B211
B11 -->|after return| B12
B12 -->|next| B13
B13 -->|call| B85
B13 -->|after return| B14
B14 -->|call| B123
B14 -->|after return| B15
B15 -->|next| B16
B16 -->|condition true| B20
B16 -->|condition false| B17
B17 -->|call| B131
B17 -->|after return| B18
B18 -->|call| B102
B18 -->|after return| B19
B19 -->|jump| B34
B66["Continue at B67 in section 7"]
B211["Continue at B212 in section 22"]
B85["Continue at B86 in section 9"]
B123["Continue at B124 in section 13"]
B20["Continue at B21 in section 3"]
B131["Continue at B132 in section 14"]
B102["Continue at B103 in section 11"]
B34["Continue at B35 in section 4"]
```

### B11

```asm
mov dptr, #STR15
ACALL DELAY
```

### B12

```asm
ACALL WSTR
```

### B13

```asm
CLR P3.6
SETB P3.6
```

### B14

```asm
acall WRITE2
```

### B15

```asm
ACALL READ1
```

### B16

```asm
MOV 50H,#0FH
MOV 51H,#0
```

### B17

```asm
CJNE R1,#1,ZEROOS
```

### B18

```asm
ACALL READ2
```

### B19

```asm
MOV A,40H
ADD A,41H
MOV B,#2
DIV AB
MOV 42H,A
ACALL WRITE3
```

### B20

```asm
SJMP CHECK
```

## Section 3

```mermaid
flowchart TD
B20["B21: ZEROOS - lines 51 to 51"]
B21["B22: instructions - lines 52 to 52"]
B22["B23: instructions - lines 53 to 54"]
B23["B24: instructions - lines 55 to 56"]
B24["B25: instructions - lines 57 to 57"]
B25["B26: EXI - lines 60 to 60"]
B26["B27: instructions - lines 61 to 61"]
B27["B28: WRONG - lines 63 to 63"]
B28["B29: instructions - lines 64 to 64"]
B29["B30: instructions - lines 65 to 65"]
B20 -->|condition true| B25
B20 -->|condition false| B21
B21 -->|call| B144
B21 -->|after return| B22
B22 -->|call| B59
B22 -->|after return| B23
B23 -->|call| B155
B23 -->|after return| B24
B24 -->|jump| B34
B25 -->|condition true| B27
B25 -->|condition false| B26
B26 -->|jump| B53
B27 -->|call| B76
B27 -->|after return| B28
B28 -->|call| B66
B28 -->|after return| B29
B29 -->|call| B206
B29 -->|after return| B30
B144["Continue at B145 in section 15"]
B59["Continue at B60 in section 6"]
B155["Continue at B156 in section 16"]
B34["Continue at B35 in section 4"]
B53["Continue at B54 in section 6"]
B76["Continue at B77 in section 8"]
B66["Continue at B67 in section 7"]
B206["Continue at B207 in section 21"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
CJNE R1,#2, EXI
```

### B22

```asm
ACALL READ3
```

### B23

```asm
MOV A,50H
ACALL COUNT
```

### B24

```asm
MOV 30H,51H
ACALL WRITE4
```

### B25

```asm
SJMP CHECK
```

### B26

```asm
CJNE R1,#3, WRONG
```

### B27

```asm
SJMP EXITT
```

### B28

```asm
ACALL FLASHER
```

### B29

```asm
ACALL DELAY
```

### B30

```asm
ACALL CLEAR
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 66 to 67"]
B31["B32: instructions - lines 68 to 69"]
B32["B33: instructions - lines 70 to 70"]
B33["B34: instructions - lines 71 to 71"]
B34["B35: CHECK - lines 75 to 75"]
B35["B36: instructions - lines 76 to 76"]
B36["B37: instructions - lines 77 to 78"]
B37["B38: instructions - lines 79 to 80"]
B38["B39: instructions - lines 81 to 81"]
B39["B40: instructions - lines 82 to 83"]
B30 -->|call| B193
B30 -->|after return| B31
B31 -->|call| B211
B31 -->|after return| B32
B32 -->|call| B66
B32 -->|after return| B33
B33 -->|jump| B13
B34 -->|call| B66
B34 -->|after return| B35
B35 -->|call| B206
B35 -->|after return| B36
B36 -->|call| B193
B36 -->|after return| B37
B37 -->|call| B211
B37 -->|after return| B38
B38 -->|call| B66
B38 -->|after return| B39
B39 -->|call| B193
B39 -->|after return| B40
B193["Continue at B194 in section 20"]
B211["Continue at B212 in section 22"]
B66["Continue at B67 in section 7"]
B13["Continue at B14 in section 2"]
B206["Continue at B207 in section 21"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
mov a, #80H
acall cmd
```

### B32

```asm
mov dptr, #STR11
acall WSTR
```

### B33

```asm
ACALL DELAY
```

### B34

```asm
SJMP HERE2
```

### B35

```asm
ACALL DELAY
```

### B36

```asm
ACALL CLEAR
```

### B37

```asm
mov a, #80H
acall cmd
```

### B38

```asm
mov dptr, #STR13
acall WSTR
```

### B39

```asm
ACALL DELAY
```

### B40

```asm
mov a, #0C0H
acall cmd
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 84 to 85"]
B41["B42: instructions - lines 86 to 86"]
B42["B43: instructions - lines 87 to 87"]
B43["B44: instructions - lines 88 to 89"]
B44["B45: instructions - lines 90 to 90"]
B45["B46: LE - lines 92 to 92"]
B46["B47: instructions - lines 93 to 93"]
B47["B48: EE - lines 95 to 95"]
B48["B49: instructions - lines 96 to 96"]
B49["B50: instructions - lines 97 to 98"]
B40 -->|call| B211
B40 -->|after return| B41
B41 -->|call| B66
B41 -->|after return| B42
B42 -->|call| B171
B42 -->|after return| B43
B43 -->|condition true| B45
B43 -->|condition false| B44
B44 -->|jump| B13
B45 -->|condition true| B47
B45 -->|condition false| B46
B46 -->|jump| B53
B47 -->|call| B66
B47 -->|after return| B48
B48 -->|call| B206
B48 -->|after return| B49
B49 -->|call| B193
B49 -->|after return| B50
B211["Continue at B212 in section 22"]
B66["Continue at B67 in section 7"]
B171["Continue at B172 in section 18"]
B13["Continue at B14 in section 2"]
B53["Continue at B54 in section 6"]
B206["Continue at B207 in section 21"]
B193["Continue at B194 in section 20"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
mov dptr, #STR14
acall WSTR
```

### B42

```asm
ACALL DELAY
```

### B43

```asm
ACALL KEYPAD
```

### B44

```asm
SUBB A,#30H
CJNE A,#1,LE
```

### B45

```asm
LJMP HERE2
```

### B46

```asm
CJNE A,#2,EE
```

### B47

```asm
SJMP EXITT
```

### B48

```asm
ACALL DELAY
```

### B49

```asm
ACALL CLEAR
```

### B50

```asm
mov a, #80H
acall cmd
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 99 to 100"]
B51["B52: instructions - lines 101 to 101"]
B52["B53: instructions - lines 102 to 102"]
B53["B54: EXITT - lines 105 to 105"]
B54["B55: instructions - lines 106 to 106"]
B55["B56: instructions - lines 107 to 108"]
B56["B57: instructions - lines 109 to 110"]
B57["B58: instructions - lines 111 to 111"]
B58["B59: BACK - lines 112 to 112"]
B59["B60: COUNT - lines 115 to 116"]
B50 -->|call| B211
B50 -->|after return| B51
B51 -->|call| B66
B51 -->|after return| B52
B52 -->|jump| B34
B53 -->|call| B66
B53 -->|after return| B54
B54 -->|call| B206
B54 -->|after return| B55
B55 -->|call| B193
B55 -->|after return| B56
B56 -->|call| B211
B56 -->|after return| B57
B57 -->|call| B66
B57 -->|after return| B58
B58 -->|jump| B58
B59 -->|next| B60
B211["Continue at B212 in section 22"]
B66["Continue at B67 in section 7"]
B34["Continue at B35 in section 4"]
B206["Continue at B207 in section 21"]
B193["Continue at B194 in section 20"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
mov dptr, #STR11
acall WSTR
```

### B52

```asm
ACALL DELAY
```

### B53

```asm
SJMP CHECK
```

### B54

```asm
ACALL DELAY
```

### B55

```asm
ACALL CLEAR
```

### B56

```asm
mov a, #80H
acall cmd
```

### B57

```asm
mov dptr, #STR12
acall WSTR
```

### B58

```asm
ACALL DELAY
```

### B59

```asm
SJMP BACK
```

### B60

```asm
MOV A,50H
MOV R4,#8
```

## Section 7

```mermaid
flowchart TD
B60["B61: HERE - lines 118 to 121"]
B61["B62: instructions - lines 122 to 122"]
B62["B63: NO - lines 124 to 124"]
B63["B64: instructions - lines 126 to 126"]
B64["B65: EX0ISR - lines 129 to 131"]
B65["B66: instructions - lines 132 to 132"]
B66["B67: DELAY - lines 135 to 135"]
B67["B68: AGAIN - lines 136 to 136"]
B68["B69: AGAIN2 - lines 137 to 137"]
B69["B70: instructions - lines 138 to 138"]
B60 -->|condition true| B62
B60 -->|condition false| B61
B61 -->|next| B62
B62 -->|condition true| B60
B62 -->|condition false| B63
B64 -->|condition true| B64
B64 -->|condition false| B65
B66 -->|next| B67
B67 -->|next| B68
B68 -->|condition true| B68
B68 -->|condition false| B69
B69 -->|condition true| B67
B69 -->|condition false| B70
B70["Continue at B71 in section 8"]
```

### B61

```asm
MOV B,#2
DIV AB
MOV R0,B
CJNE R0,#0,NO
```

### B62

```asm
INC 51H
```

### B63

```asm
DJNZ R4,HERE
```

### B64

Return to the instruction following the active call.

```asm
RET
```

### B65

```asm
MOV A,P2
ANL A,#01000000B
CJNE A,#0,EX0ISR
```

### B66

Return to the instruction following the active call.

```asm
RET
```

### B67

```asm
MOV R0,#20
```

### B68

```asm
MOV R1,#90
```

### B69

```asm
DJNZ R1,AGAIN2
```

### B70

```asm
DJNZ R0,AGAIN
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 139 to 139"]
B71["B72: FLASH - lines 142 to 142"]
B72["B73: RR1 - lines 144 to 145"]
B73["B74: instructions - lines 146 to 147"]
B74["B75: instructions - lines 148 to 148"]
B75["B76: instructions - lines 149 to 149"]
B76["B77: FLASHER - lines 152 to 152"]
B77["B78: RR2 - lines 154 to 155"]
B78["B79: instructions - lines 156 to 157"]
B79["B80: instructions - lines 158 to 158"]
B71 -->|next| B72
B72 -->|call| B66
B72 -->|after return| B73
B73 -->|call| B66
B73 -->|after return| B74
B74 -->|condition true| B72
B74 -->|condition false| B75
B76 -->|next| B77
B77 -->|call| B66
B77 -->|after return| B78
B78 -->|call| B66
B78 -->|after return| B79
B79 -->|condition true| B77
B79 -->|condition false| B80
B66["Continue at B67 in section 7"]
B80["Continue at B81 in section 9"]
```

### B71

Return to the instruction following the active call.

```asm
RET
```

### B72

```asm
MOV R2,#4
```

### B73

```asm
SETB P1.2
ACALL DELAY
```

### B74

```asm
CLR P1.2
ACALL DELAY
```

### B75

```asm
DJNZ R2,RR1
```

### B76

Return to the instruction following the active call.

```asm
RET
```

### B77

```asm
MOV R2,#4
```

### B78

```asm
SETB P1.3
ACALL DELAY
```

### B79

```asm
CLR P1.3
ACALL DELAY
```

### B80

```asm
DJNZ R2,RR2
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 159 to 159"]
B81["B82: WRITE1 - lines 162 to 163"]
B82["B83: instructions - lines 164 to 165"]
B83["B84: instructions - lines 166 to 166"]
B84["B85: instructions - lines 168 to 168"]
B85["B86: WRITE2 - lines 172 to 172"]
B86["B87: instructions - lines 173 to 174"]
B87["B88: instructions - lines 175 to 176"]
B88["B89: instructions - lines 177 to 177"]
B89["B90: instructions - lines 179 to 180"]
B81 -->|call| B193
B81 -->|after return| B82
B82 -->|call| B211
B82 -->|after return| B83
B83 -->|call| B66
B83 -->|after return| B84
B85 -->|call| B206
B85 -->|after return| B86
B86 -->|call| B193
B86 -->|after return| B87
B87 -->|call| B211
B87 -->|after return| B88
B88 -->|call| B66
B88 -->|after return| B89
B89 -->|call| B193
B89 -->|after return| B90
B193["Continue at B194 in section 20"]
B211["Continue at B212 in section 22"]
B66["Continue at B67 in section 7"]
B206["Continue at B207 in section 21"]
B90["Continue at B91 in section 10"]
```

### B81

Return to the instruction following the active call.

```asm
RET
```

### B82

```asm
mov a, #80H
acall cmd
```

### B83

```asm
mov dptr, #STR1
acall WSTR
```

### B84

```asm
ACALL DELAY
```

### B85

Return to the instruction following the active call.

```asm
RET
```

### B86

```asm
ACALL CLEAR
```

### B87

```asm
mov a, #80H
acall cmd
```

### B88

```asm
mov dptr, #STR2
acall WSTR
```

### B89

```asm
ACALL DELAY
```

### B90

```asm
mov a, #0C0H
acall cmd
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 181 to 182"]
B91["B92: instructions - lines 183 to 183"]
B92["B93: instructions - lines 184 to 184"]
B93["B94: instructions - lines 185 to 185"]
B94["B95: instructions - lines 186 to 186"]
B95["B96: instructions - lines 187 to 187"]
B96["B97: instructions - lines 188 to 189"]
B97["B98: instructions - lines 190 to 191"]
B98["B99: instructions - lines 192 to 192"]
B99["B100: instructions - lines 194 to 195"]
B90 -->|call| B211
B90 -->|after return| B91
B91 -->|call| B66
B91 -->|after return| B92
B92 -->|call| B66
B92 -->|after return| B93
B93 -->|call| B206
B93 -->|after return| B94
B94 -->|call| B66
B94 -->|after return| B95
B95 -->|call| B66
B95 -->|after return| B96
B96 -->|call| B193
B96 -->|after return| B97
B97 -->|call| B211
B97 -->|after return| B98
B98 -->|call| B66
B98 -->|after return| B99
B99 -->|call| B193
B99 -->|after return| B100
B211["Continue at B212 in section 22"]
B66["Continue at B67 in section 7"]
B206["Continue at B207 in section 21"]
B193["Continue at B194 in section 20"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
mov dptr, #STR3
acall WSTR
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
ACALL CLEAR
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
Mov a, #80H
acall cmd
```

### B98

```asm
mov dptr, #STR3
acall WSTR
```

### B99

```asm
ACALL DELAY
```

### B100

```asm
mov a, #0C0H
acall cmd
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 196 to 197"]
B101["B102: instructions - lines 199 to 199"]
B102["B103: WRITE3 - lines 205 to 205"]
B103["B104: instructions - lines 206 to 207"]
B104["B105: instructions - lines 208 to 209"]
B105["B106: instructions - lines 210 to 210"]
B106["B107: instructions - lines 212 to 213"]
B107["B108: instructions - lines 214 to 218"]
B108["B109: instructions - lines 219 to 221"]
B109["B110: instructions - lines 222 to 222"]
B100 -->|call| B211
B100 -->|after return| B101
B102 -->|call| B206
B102 -->|after return| B103
B103 -->|call| B193
B103 -->|after return| B104
B104 -->|call| B211
B104 -->|after return| B105
B105 -->|call| B66
B105 -->|after return| B106
B106 -->|call| B193
B106 -->|after return| B107
B107 -->|call| B188
B107 -->|after return| B108
B108 -->|call| B188
B108 -->|after return| B109
B109 -->|call| B66
B109 -->|after return| B110
B211["Continue at B212 in section 22"]
B206["Continue at B207 in section 21"]
B193["Continue at B194 in section 20"]
B66["Continue at B67 in section 7"]
B188["Continue at B189 in section 19"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
mov dptr, #STR33
acall WSTR
```

### B102

Return to the instruction following the active call.

```asm
RET
```

### B103

```asm
ACALL CLEAR
```

### B104

```asm
mov a, #80H
acall cmd
```

### B105

```asm
mov dptr, #STR4
acall WSTR
```

### B106

```asm
ACALL DELAY
```

### B107

```asm
mov a, #0C0H
acall cmd
```

### B108

```asm
mov a,40H
mov b,#10
div ab
add a,#30h
acall wchr
```

### B109

```asm
mov a,b
add a,#30h
acall wchr
```

### B110

```asm
ACALL DELAY
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 224 to 225"]
B111["B112: instructions - lines 226 to 230"]
B112["B113: instructions - lines 231 to 233"]
B113["B114: instructions - lines 234 to 234"]
B114["B115: instructions - lines 236 to 236"]
B115["B116: instructions - lines 237 to 238"]
B116["B117: instructions - lines 239 to 240"]
B117["B118: instructions - lines 241 to 241"]
B118["B119: instructions - lines 243 to 244"]
B119["B120: instructions - lines 245 to 249"]
B110 -->|call| B193
B110 -->|after return| B111
B111 -->|call| B188
B111 -->|after return| B112
B112 -->|call| B188
B112 -->|after return| B113
B113 -->|call| B66
B113 -->|after return| B114
B114 -->|call| B206
B114 -->|after return| B115
B115 -->|call| B193
B115 -->|after return| B116
B116 -->|call| B211
B116 -->|after return| B117
B117 -->|call| B66
B117 -->|after return| B118
B118 -->|call| B193
B118 -->|after return| B119
B119 -->|call| B188
B119 -->|after return| B120
B193["Continue at B194 in section 20"]
B188["Continue at B189 in section 19"]
B66["Continue at B67 in section 7"]
B206["Continue at B207 in section 21"]
B211["Continue at B212 in section 22"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
mov a, #0C8H
acall cmd
```

### B112

```asm
mov a,41H
mov b,#10
div ab
add a,#30h
acall wchr
```

### B113

```asm
mov a,b
add a,#30h
acall wchr
```

### B114

```asm
ACALL DELAY
```

### B115

```asm
ACALL CLEAR
```

### B116

```asm
mov a, #80H
acall cmd
```

### B117

```asm
mov dptr, #STR6
acall WSTR
```

### B118

```asm
ACALL DELAY
```

### B119

```asm
mov a, #0C0H
acall cmd
```

### B120

```asm
mov a,42H
mov b,#10
div ab
add a,#30h
acall wchr
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 250 to 252"]
B121["B122: instructions - lines 253 to 253"]
B122["B123: instructions - lines 254 to 254"]
B123["B124: READ1 - lines 257 to 257"]
B124["B125: instructions - lines 258 to 259"]
B125["B126: instructions - lines 260 to 261"]
B126["B127: instructions - lines 262 to 262"]
B127["B128: instructions - lines 264 to 265"]
B128["B129: instructions - lines 266 to 266"]
B129["B130: instructions - lines 267 to 267"]
B120 -->|call| B188
B120 -->|after return| B121
B121 -->|call| B66
B121 -->|after return| B122
B123 -->|call| B206
B123 -->|after return| B124
B124 -->|call| B193
B124 -->|after return| B125
B125 -->|call| B211
B125 -->|after return| B126
B126 -->|call| B66
B126 -->|after return| B127
B127 -->|call| B193
B127 -->|after return| B128
B128 -->|call| B171
B128 -->|after return| B129
B129 -->|call| B188
B129 -->|after return| B130
B188["Continue at B189 in section 19"]
B66["Continue at B67 in section 7"]
B206["Continue at B207 in section 21"]
B193["Continue at B194 in section 20"]
B211["Continue at B212 in section 22"]
B171["Continue at B172 in section 18"]
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
ACALL DELAY
```

### B123

Return to the instruction following the active call.

```asm
RET
```

### B124

```asm
ACALL CLEAR
```

### B125

```asm
mov a, #80H
acall cmd
```

### B126

```asm
mov dptr, #STR7
acall WSTR
```

### B127

```asm
ACALL DELAY
```

### B128

```asm
MOV A, #0C8H
ACALL CMD
```

### B129

```asm
ACALL KEYPAD
```

### B130

```asm
ACALL WCHR
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 268 to 270"]
B131["B132: READ2 - lines 273 to 273"]
B132["B133: instructions - lines 274 to 275"]
B133["B134: instructions - lines 276 to 277"]
B134["B135: instructions - lines 278 to 278"]
B135["B136: instructions - lines 280 to 281"]
B136["B137: instructions - lines 282 to 282"]
B137["B138: instructions - lines 283 to 283"]
B138["B139: instructions - lines 284 to 286"]
B139["B140: instructions - lines 287 to 287"]
B131 -->|call| B206
B131 -->|after return| B132
B132 -->|call| B193
B132 -->|after return| B133
B133 -->|call| B211
B133 -->|after return| B134
B134 -->|call| B66
B134 -->|after return| B135
B135 -->|call| B193
B135 -->|after return| B136
B136 -->|call| B171
B136 -->|after return| B137
B137 -->|call| B188
B137 -->|after return| B138
B138 -->|call| B171
B138 -->|after return| B139
B139 -->|call| B188
B139 -->|after return| B140
B206["Continue at B207 in section 21"]
B193["Continue at B194 in section 20"]
B211["Continue at B212 in section 22"]
B66["Continue at B67 in section 7"]
B171["Continue at B172 in section 18"]
B188["Continue at B189 in section 19"]
B140["Continue at B141 in section 15"]
```

### B131

Return to the instruction following the active call.

```asm
SUBB A, #30H
MOV R1,A
RET
```

### B132

```asm
ACALL CLEAR
```

### B133

```asm
mov a, #80H
acall cmd
```

### B134

```asm
mov dptr, #STR8
acall WSTR
```

### B135

```asm
ACALL DELAY
```

### B136

```asm
MOV A, #0C1H
ACALL CMD
```

### B137

```asm
ACALL KEYPAD
```

### B138

```asm
ACALL WCHR
```

### B139

```asm
SUBB A, #30H
MOV 29H,A
ACALL KEYPAD
```

### B140

```asm
ACALL WCHR
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 288 to 300"]
B141["B142: instructions - lines 301 to 305"]
B142["B143: instructions - lines 306 to 308"]
B143["B144: instructions - lines 311 to 311"]
B144["B145: READ3 - lines 314 to 314"]
B145["B146: instructions - lines 315 to 315"]
B146["B147: instructions - lines 316 to 317"]
B147["B148: instructions - lines 318 to 319"]
B148["B149: instructions - lines 320 to 320"]
B149["B150: instructions - lines 321 to 322"]
B140 -->|call| B193
B140 -->|after return| B141
B141 -->|call| B188
B141 -->|after return| B142
B142 -->|call| B188
B142 -->|after return| B143
B144 -->|call| B206
B144 -->|after return| B145
B145 -->|call| B66
B145 -->|after return| B146
B146 -->|call| B193
B146 -->|after return| B147
B147 -->|call| B66
B147 -->|after return| B148
B148 -->|call| B211
B148 -->|after return| B149
B149 -->|call| B193
B149 -->|after return| B150
B193["Continue at B194 in section 20"]
B188["Continue at B189 in section 19"]
B206["Continue at B207 in section 21"]
B66["Continue at B67 in section 7"]
B211["Continue at B212 in section 22"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
SUBB A, #30H
MOV 2AH,A
MOV B,#10
MOV A,29H
MUL AB
ADD A,2AH
MOV 40H,A
DEC A
MOV 41H,A
MOV A, #0C8H
ACALL CMD
```

### B142

```asm
MOV A,41H
MOV B,#10H
DIV AB
ADD A,#30H
ACALL WCHR
```

### B143

```asm
MOV A,B
ADD A,#30H
ACALL WCHR
```

### B144

Return to the instruction following the active call.

```asm
RET
```

### B145

```asm
ACALL CLEAR
```

### B146

```asm
ACALL DELAY
```

### B147

```asm
mov a, #80H
acall cmd
```

### B148

```asm
mov dptr, #STR10
ACALL DELAY
```

### B149

```asm
ACALL WSTR
```

### B150

```asm
MOV A, #0C8H
ACALL CMD
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 323 to 323"]
B151["B152: instructions - lines 324 to 324"]
B152["B153: instructions - lines 325 to 327"]
B153["B154: instructions - lines 328 to 328"]
B154["B155: instructions - lines 329 to 336"]
B155["B156: WRITE4 - lines 339 to 339"]
B156["B157: instructions - lines 340 to 341"]
B157["B158: instructions - lines 342 to 343"]
B158["B159: instructions - lines 344 to 344"]
B159["B160: instructions - lines 346 to 347"]
B150 -->|call| B171
B150 -->|after return| B151
B151 -->|call| B188
B151 -->|after return| B152
B152 -->|call| B171
B152 -->|after return| B153
B153 -->|call| B188
B153 -->|after return| B154
B155 -->|call| B206
B155 -->|after return| B156
B156 -->|call| B193
B156 -->|after return| B157
B157 -->|call| B211
B157 -->|after return| B158
B158 -->|call| B66
B158 -->|after return| B159
B159 -->|call| B193
B159 -->|after return| B160
B171["Continue at B172 in section 18"]
B188["Continue at B189 in section 19"]
B206["Continue at B207 in section 21"]
B193["Continue at B194 in section 20"]
B211["Continue at B212 in section 22"]
B66["Continue at B67 in section 7"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
ACALL KEYPAD
```

### B152

```asm
ACALL WCHR
```

### B153

```asm
SUBB A, #30H
MOV 29H,A
ACALL KEYPAD
```

### B154

```asm
ACALL WCHR
```

### B155

Return to the instruction following the active call.

```asm
SUBB A, #30H
MOV 2AH,A
MOV B,#16
MOV A,29H
MUL AB
ADD A,2AH
MOV 50H,A
RET
```

### B156

```asm
ACALL CLEAR
```

### B157

```asm
mov a, #80H
acall cmd
```

### B158

```asm
mov dptr, #STR5
acall WSTR
```

### B159

```asm
ACALL DELAY
```

### B160

```asm
mov a, #0C0H
acall cmd
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 348 to 352"]
B161["B162: instructions - lines 353 to 355"]
B162["B163: instructions - lines 356 to 356"]
B163["B164: instructions - lines 359 to 359"]
B164["B165: instructions - lines 360 to 361"]
B165["B166: instructions - lines 362 to 363"]
B166["B167: instructions - lines 364 to 364"]
B167["B168: instructions - lines 366 to 367"]
B168["B169: instructions - lines 368 to 370"]
B169["B170: instructions - lines 371 to 371"]
B160 -->|call| B188
B160 -->|after return| B161
B161 -->|call| B188
B161 -->|after return| B162
B162 -->|call| B66
B162 -->|after return| B163
B163 -->|call| B206
B163 -->|after return| B164
B164 -->|call| B193
B164 -->|after return| B165
B165 -->|call| B211
B165 -->|after return| B166
B166 -->|call| B66
B166 -->|after return| B167
B167 -->|call| B193
B167 -->|after return| B168
B168 -->|call| B188
B168 -->|after return| B169
B169 -->|call| B66
B169 -->|after return| B170
B188["Continue at B189 in section 19"]
B66["Continue at B67 in section 7"]
B206["Continue at B207 in section 21"]
B193["Continue at B194 in section 20"]
B211["Continue at B212 in section 22"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
mov a,50H
mov b,#16
div ab
add a,#30h
acall wchr
```

### B162

```asm
mov a,b
add a,#30h
acall wchr
```

### B163

```asm
ACALL DELAY
```

### B164

```asm
ACALL CLEAR
```

### B165

```asm
mov a, #80H
acall cmd
```

### B166

```asm
mov dptr, #STR6
acall WSTR
```

### B167

```asm
ACALL DELAY
```

### B168

```asm
mov a, #0C0H
acall cmd
```

### B169

```asm
mov a,51H
add a,#30h
acall wchr
```

### B170

```asm
ACALL DELAY
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 372 to 372"]
B171["B172: KEYPAD - lines 375 to 375"]
B172["B173: K1 - lines 376 to 379"]
B173["B174: K2 - lines 381 to 383"]
B174["B175: instructions - lines 384 to 384"]
B175["B176: OVER1 - lines 386 to 389"]
B176["B177: instructions - lines 390 to 393"]
B177["B178: instructions - lines 394 to 397"]
B178["B179: instructions - lines 398 to 401"]
B179["B180: instructions - lines 402 to 402"]
B171 -->|next| B172
B172 -->|condition true| B172
B172 -->|condition false| B173
B173 -->|condition true| B175
B173 -->|condition false| B174
B174 -->|jump| B173
B175 -->|condition true| B180
B175 -->|condition false| B176
B176 -->|condition true| B181
B176 -->|condition false| B177
B177 -->|condition true| B182
B177 -->|condition false| B178
B178 -->|condition true| B183
B178 -->|condition false| B179
B179 -->|jump| B173
B180["Continue at B181 in section 19"]
B181["Continue at B182 in section 19"]
B182["Continue at B183 in section 19"]
B183["Continue at B184 in section 19"]
```

### B171

Return to the instruction following the active call.

```asm
RET
```

### B172

```asm
MOV P0,#01110000B
```

### B173

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B174

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B175

```asm
SJMP K2
```

### B176

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B177

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B178

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B179

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B180

```asm
LJMP K2
```

## Section 19

```mermaid
flowchart TD
B180["B181: ROW_0 - lines 403 to 404"]
B181["B182: ROW_1 - lines 405 to 406"]
B182["B183: ROW_2 - lines 407 to 408"]
B183["B184: ROW_3 - lines 409 to 409"]
B184["B185: FIND - lines 411 to 411"]
B185["B186: FIND1 - lines 413 to 414"]
B186["B187: instructions - lines 415 to 416"]
B187["B188: MATCH - lines 417 to 419"]
B188["B189: WCHR - lines 422 to 426"]
B189["B190: instructions - lines 427 to 427"]
B180 -->|jump| B184
B181 -->|jump| B184
B182 -->|jump| B184
B183 -->|next| B184
B184 -->|next| B185
B185 -->|condition true| B187
B185 -->|condition false| B186
B186 -->|jump| B185
B188 -->|call| B198
B188 -->|after return| B189
B189 -->|call| B204
B189 -->|after return| B190
B198["Continue at B199 in section 20"]
B204["Continue at B205 in section 21"]
B190["Continue at B191 in section 20"]
```

### B181

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

### B182

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B183

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B184

```asm
MOV DPTR,#KCODE3
```

### B185

```asm
RLC A
```

### B186

```asm
RLC A
JNC MATCH
```

### B187

```asm
INC DPTR
SJMP FIND1
```

### B188

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B189

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B190

```asm
ACALL LDELAY
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 428 to 430"]
B191["B192: instructions - lines 431 to 431"]
B192["B193: instructions - lines 432 to 434"]
B193["B194: CMD - lines 437 to 439"]
B194["B195: instructions - lines 440 to 440"]
B195["B196: instructions - lines 441 to 443"]
B196["B197: instructions - lines 444 to 444"]
B197["B198: instructions - lines 445 to 445"]
B198["B199: COMMON - lines 448 to 453"]
B199["B200: INLCD - lines 456 to 463"]
B190 -->|call| B198
B190 -->|after return| B191
B191 -->|call| B204
B191 -->|after return| B192
B193 -->|call| B198
B193 -->|after return| B194
B194 -->|call| B204
B194 -->|after return| B195
B195 -->|call| B198
B195 -->|after return| B196
B196 -->|call| B204
B196 -->|after return| B197
B199 -->|call| B204
B199 -->|after return| B200
B204["Continue at B205 in section 21"]
B200["Continue at B201 in section 21"]
```

### B191

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B192

```asm
ACALL LDELAY
```

### B193

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B194

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B195

```asm
ACALL LDELAY
```

### B196

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B197

```asm
ACALL LDELAY
```

### B198

Return to the instruction following the active call.

```asm
RET
```

### B199

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B200

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

## Section 21

```mermaid
flowchart TD
B200["B201: instructions - lines 464 to 472"]
B201["B202: instructions - lines 473 to 485"]
B202["B203: instructions - lines 486 to 496"]
B203["B204: instructions - lines 497 to 497"]
B204["B205: LDELAY - lines 500 to 501"]
B205["B206: instructions - lines 502 to 502"]
B206["B207: CLEAR - lines 505 to 506"]
B207["B208: instructions - lines 507 to 507"]
B208["B209: WAIT - lines 508 to 508"]
B209["B210: instructions - lines 509 to 509"]
B200 -->|call| B204
B200 -->|after return| B201
B201 -->|call| B204
B201 -->|after return| B202
B202 -->|call| B204
B202 -->|after return| B203
B204 -->|condition true| B204
B204 -->|condition false| B205
B206 -->|call| B193
B206 -->|after return| B207
B207 -->|next| B208
B208 -->|call| B204
B208 -->|after return| B209
B209 -->|condition true| B208
B209 -->|condition false| B210
B193["Continue at B194 in section 20"]
B210["Continue at B211 in section 22"]
```

### B201

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

### B202

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

### B203

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

### B204

Return to the instruction following the active call.

```asm
RET
```

### B205

```asm
MOV R0, #50
DJNZ R0, $
```

### B206

Return to the instruction following the active call.

```asm
RET
```

### B207

```asm
MOV A,#01H
ACALL CMD
```

### B208

```asm
MOV R7,#14
```

### B209

```asm
ACALL LDELAY
```

### B210

```asm
DJNZ R7,WAIT
```

## Section 22

```mermaid
flowchart TD
B210["B211: instructions - lines 510 to 510"]
B211["B212: WSTR - lines 513 to 513"]
B212["B213: CONT1 - lines 515 to 517"]
B213["B214: PRINT - lines 519 to 519"]
B214["B215: instructions - lines 520 to 521"]
B215["B216: EXIT1 - lines 522 to 523"]
B211 -->|next| B212
B212 -->|condition true| B215
B212 -->|condition false| B213
B213 -->|call| B188
B213 -->|after return| B214
B214 -->|jump| B212
B188["Continue at B189 in section 19"]
```

### B211

Return to the instruction following the active call.

```asm
ret
```

### B212

```asm
PUSH    ACC
```

### B213

```asm
CLR     A
MOVC    A,@A+DPTR
JZ Exit1
```

### B214

```asm
ACALL    WCHR
```

### B215

```asm
INC DPTR
AJMP    CONT1
```

### B216

Return to the instruction following the active call.

```asm
POP     ACC
RET
```
