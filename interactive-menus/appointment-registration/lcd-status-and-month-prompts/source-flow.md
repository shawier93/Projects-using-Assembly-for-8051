# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 00H` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19) · [Section 20](#section-20)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 8 to 20"]
B1["B2: instructions - lines 21 to 21"]
B2["B3: instructions - lines 22 to 22"]
B3["B4: instructions - lines 23 to 23"]
B4["B5: START - lines 26 to 26"]
B5["B6: instructions - lines 28 to 29"]
B6["B7: LOOP - lines 32 to 32"]
B7["B8: instructions - lines 33 to 35"]
B8["B9: instructions - lines 36 to 36"]
B9["B10: instructions - lines 37 to 37"]
B0 -->|call| B95
B0 -->|after return| B1
B1 -->|call| B67
B1 -->|after return| B2
B2 -->|call| B95
B2 -->|after return| B3
B3 -->|call| B124
B3 -->|after return| B4
B4 -->|call| B131
B4 -->|after return| B5
B5 -->|condition true| B15
B5 -->|condition false| B6
B6 -->|call| B148
B6 -->|after return| B7
B7 -->|condition true| B10
B7 -->|condition false| B8
B8 -->|call| B23
B8 -->|after return| B9
B9 -->|jump| B20
B95["Continue at B96 in section 10"]
B67["Continue at B68 in section 7"]
B124["Continue at B125 in section 13"]
B131["Continue at B132 in section 14"]
B15["Continue at B16 in section 2"]
B148["Continue at B149 in section 15"]
B10["Continue at B11 in section 2"]
B23["Continue at B24 in section 3"]
B20["Continue at B21 in section 3"]
```

### B1

```asm
MOV 50H,#0
MOV 51H,#4
MOV 52H,#1
MOV 53H,#3
MOV 54H,#1
MOV 55H,#100
MOV 56H,#1
MOV 57H,#1
MOV 58H,#1
ACALL INLCD
```

### B2

```asm
ACALL FLASH
```

### B3

```asm
ACALL INLCD
```

### B4

```asm
ACALL WELCOMEMSG
```

### B5

```asm
ACALL MENUMSG
```

### B6

```asm
MOV A,57H
CJNE A,#1, EXIT
```

### B7

```asm
ACALL MES1
```

### B8

```asm
MOV A,#0
CJNE A,#0,op1
```

### B9

```asm
ACALL op2
```

### B10

```asm
SJMP AGAINN
```

## Section 2

```mermaid
flowchart TD
B10["B11: OP1 - lines 41 to 41"]
B11["B12: instructions - lines 42 to 42"]
B12["B13: instructions - lines 43 to 43"]
B13["B14: ERROR - lines 46 to 46"]
B14["B15: instructions - lines 47 to 47"]
B15["B16: EXIT - lines 51 to 51"]
B16["B17: instructions - lines 52 to 52"]
B17["B18: HEREE - lines 53 to 53"]
B18["B19: ERRORX - lines 56 to 56"]
B19["B20: instructions - lines 57 to 57"]
B10 -->|condition true| B13
B10 -->|condition false| B11
B11 -->|call| B39
B11 -->|after return| B12
B12 -->|jump| B20
B13 -->|call| B143
B13 -->|after return| B14
B14 -->|jump| B6
B15 -->|condition true| B18
B15 -->|condition false| B16
B16 -->|call| B138
B16 -->|after return| B17
B17 -->|jump| B17
B18 -->|call| B143
B18 -->|after return| B19
B19 -->|jump| B4
B39["Continue at B40 in section 4"]
B20["Continue at B21 in section 3"]
B143["Continue at B144 in section 15"]
B6["Continue at B7 in section 1"]
B138["Continue at B139 in section 14"]
B4["Continue at B5 in section 1"]
```

### B11

```asm
CJNE A,#1,ERROR
```

### B12

```asm
ACALL POS
```

### B13

```asm
SJMP AGAINN
```

### B14

```asm
ACALL ERROR1MSG
```

### B15

```asm
SJMP loop
```

### B16

```asm
CJNE A,#2,ERRORx
```

### B17

```asm
ACALL EXITMSG
```

### B18

```asm
SJMP HEREE
```

### B19

```asm
ACALL ERROR1MSG
```

### B20

```asm
SJMP START
```

## Section 3

```mermaid
flowchart TD
B20["B21: AGAINN - lines 60 to 60"]
B21["B22: instructions - lines 61 to 62"]
B22["B23: SS - lines 63 to 63"]
B23["B24: OP2 - lines 71 to 71"]
B24["B25: instructions - lines 72 to 73"]
B25["B26: instructions - lines 74 to 74"]
B26["B27: instructions - lines 75 to 76"]
B27["B28: SECONDDOZEE - lines 81 to 81"]
B28["B29: instructions - lines 82 to 82"]
B29["B30: instructions - lines 83 to 86"]
B20 -->|call| B188
B20 -->|after return| B21
B21 -->|condition true| B6
B21 -->|condition false| B22
B22 -->|jump| B22
B23 -->|call| B163
B23 -->|after return| B24
B24 -->|condition true| B27
B24 -->|condition false| B25
B25 -->|call| B175
B25 -->|after return| B26
B26 -->|jump| B37
B27 -->|condition true| B35
B27 -->|condition false| B28
B28 -->|call| B170
B28 -->|after return| B29
B29 -->|call| B59
B29 -->|after return| B30
B188["Continue at B189 in section 19"]
B6["Continue at B7 in section 1"]
B163["Continue at B164 in section 17"]
B175["Continue at B176 in section 18"]
B37["Continue at B38 in section 4"]
B35["Continue at B36 in section 4"]
B170["Continue at B171 in section 18"]
B59["Continue at B60 in section 6"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL MES5
```

### B22

```asm
MOV A,57H
CJNE A,#2,LOOP
```

### B23

```asm
SJMP SS
```

### B24

```asm
ACALL MES22
```

### B25

```asm
MOV A,52H
CJNE A,#0,SecondDozee
```

### B26

```asm
ACALL MES33
```

### B27

```asm
MOV 54H,#0
SJMP BACK3
```

### B28

```asm
CJNE A,#1,ERROR3
```

### B29

```asm
ACALL MES3
```

### B30

```asm
MOV R7,53H
MOV A,R7
ADD A,#2
ACALL CHEACK
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 87 to 89"]
B31["B32: instructions - lines 90 to 91"]
B32["B33: instructions - lines 92 to 95"]
B33["B34: instructions - lines 96 to 96"]
B34["B35: instructions - lines 97 to 97"]
B35["B36: ERROR3 - lines 100 to 100"]
B36["B37: instructions - lines 101 to 101"]
B37["B38: BACK3 - lines 104 to 104"]
B38["B39: instructions - lines 105 to 105"]
B39["B40: POS - lines 109 to 109"]
B30 -->|call| B84
B30 -->|after return| B31
B31 -->|call| B84
B31 -->|after return| B32
B32 -->|call| B84
B32 -->|after return| B33
B33 -->|call| B72
B33 -->|after return| B34
B34 -->|jump| B37
B35 -->|call| B143
B35 -->|after return| B36
B36 -->|jump| B23
B37 -->|call| B64
B37 -->|after return| B38
B39 -->|call| B156
B39 -->|after return| B40
B84["Continue at B85 in section 9"]
B72["Continue at B73 in section 8"]
B143["Continue at B144 in section 15"]
B23["Continue at B24 in section 3"]
B64["Continue at B65 in section 7"]
B156["Continue at B157 in section 16"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
MOV 54H,A
ADD A,#30H
ACALL WCHR
```

### B32

```asm
MOV A,#'/'
ACALL WCHR
```

### B33

```asm
MOV 55H,#4
MOV A,55H
ADD A,#30H
ACALL WCHR
```

### B34

```asm
ACALL DELAY
```

### B35

```asm
SJMP BACK3
```

### B36

```asm
ACALL ERROR1MSG
```

### B37

```asm
SJMP OP2
```

### B38

```asm
ACALL CONFIRM
```

### B39

Return to the instruction following the active call.

```asm
RET
```

### B40

```asm
ACALL MES2
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 110 to 112"]
B41["B42: instructions - lines 113 to 114"]
B42["B43: instructions - lines 116 to 116"]
B43["B44: instructions - lines 117 to 119"]
B44["B45: instructions - lines 120 to 122"]
B45["B46: instructions - lines 123 to 124"]
B46["B47: instructions - lines 125 to 128"]
B47["B48: instructions - lines 129 to 129"]
B48["B49: instructions - lines 130 to 130"]
B49["B50: SECONDDOZE - lines 133 to 133"]
B40 -->|call| B163
B40 -->|after return| B41
B41 -->|condition true| B49
B41 -->|condition false| B42
B42 -->|call| B170
B42 -->|after return| B43
B43 -->|call| B59
B43 -->|after return| B44
B44 -->|call| B84
B44 -->|after return| B45
B45 -->|call| B84
B45 -->|after return| B46
B46 -->|call| B84
B46 -->|after return| B47
B47 -->|call| B72
B47 -->|after return| B48
B48 -->|jump| B57
B49 -->|condition true| B57
B49 -->|condition false| B50
B163["Continue at B164 in section 17"]
B170["Continue at B171 in section 18"]
B59["Continue at B60 in section 6"]
B84["Continue at B85 in section 9"]
B72["Continue at B73 in section 8"]
B57["Continue at B58 in section 6"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
MOV R7,51H
ACALL MES22
```

### B42

```asm
MOV A,52H
CJNE A,#0,SecondDoze
```

### B43

```asm
ACALL MES3
```

### B44

```asm
MOV A,R7
ADD A,#3
ACALL CHEACK
```

### B45

```asm
MOV 54H,A
ADD A,#30H
ACALL WCHR
```

### B46

```asm
MOV A,#'/'
ACALL WCHR
```

### B47

```asm
MOV 55H,#1
MOV A,55H
ADD A,#30H
ACALL WCHR
```

### B48

```asm
ACALL DELAY
```

### B49

```asm
SJMP BACK1
```

### B50

```asm
CJNE A,#1,ERROR1
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 135 to 135"]
B51["B52: instructions - lines 136 to 138"]
B52["B53: instructions - lines 139 to 141"]
B53["B54: instructions - lines 142 to 143"]
B54["B55: instructions - lines 144 to 147"]
B55["B56: instructions - lines 148 to 148"]
B56["B57: instructions - lines 149 to 149"]
B57["B58: ERROR1 - lines 154 to 154"]
B58["B59: instructions - lines 156 to 156"]
B59["B60: CHEACK - lines 160 to 160"]
B50 -->|call| B170
B50 -->|after return| B51
B51 -->|call| B59
B51 -->|after return| B52
B52 -->|call| B84
B52 -->|after return| B53
B53 -->|call| B84
B53 -->|after return| B54
B54 -->|call| B84
B54 -->|after return| B55
B55 -->|call| B72
B55 -->|after return| B56
B56 -->|jump| B57
B57 -->|call| B64
B57 -->|after return| B58
B59 -->|condition true| B61
B59 -->|condition false| B60
B170["Continue at B171 in section 18"]
B84["Continue at B85 in section 9"]
B72["Continue at B73 in section 8"]
B64["Continue at B65 in section 7"]
B61["Continue at B62 in section 7"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
ACALL MES3
```

### B52

```asm
MOV A,R7
ADD A,#4
ACALL CHEACK
```

### B53

```asm
MOV 54H,A
ADD A,#30H
ACALL WCHR
```

### B54

```asm
MOV A,#'/'
ACALL WCHR
```

### B55

```asm
MOV 55H,#2
MOV A,55H
ADD A,#30H
ACALL WCHR
```

### B56

```asm
ACALL DELAY
```

### B57

```asm
SJMP BACK1
```

### B58

```asm
ACALL CONFIRM
```

### B59

Return to the instruction following the active call.

```asm
RET
```

### B60

```asm
CJNE A,#12,CONTINUE
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 161 to 161"]
B61["B62: CONTINUE - lines 163 to 163"]
B62["B63: instructions - lines 164 to 164"]
B63["B64: BACK2 - lines 167 to 167"]
B64["B65: CONFIRM - lines 171 to 171"]
B65["B66: instructions - lines 172 to 173"]
B66["B67: instructions - lines 175 to 175"]
B67["B68: FLASH - lines 178 to 178"]
B68["B69: T3 - lines 179 to 180"]
B69["B70: instructions - lines 181 to 182"]
B60 -->|jump| B63
B61 -->|condition true| B63
B61 -->|condition false| B62
B62 -->|next| B63
B64 -->|call| B181
B64 -->|after return| B65
B65 -->|condition true| B64
B65 -->|condition false| B66
B67 -->|next| B68
B68 -->|call| B72
B68 -->|after return| B69
B69 -->|call| B72
B69 -->|after return| B70
B181["Continue at B182 in section 19"]
B72["Continue at B73 in section 8"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
SJMP BACK2
```

### B62

```asm
JC BACK2
```

### B63

```asm
SUBB A,#12
```

### B64

Return to the instruction following the active call.

```asm
RET
```

### B65

```asm
ACALL MES4
```

### B66

```asm
MOV A,56H
CJNE A,#1,CONFIRM
```

### B67

Return to the instruction following the active call.

```asm
RET
```

### B68

```asm
MOV R6,#3
```

### B69

```asm
MOV P1,#0H
ACALL DELAY
```

### B70

```asm
MOV P1,#0fFH
ACALL DELAY
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 183 to 183"]
B71["B72: instructions - lines 184 to 184"]
B72["B73: DELAY - lines 188 to 188"]
B73["B74: X3 - lines 189 to 189"]
B74["B75: X2 - lines 190 to 190"]
B75["B76: X1 - lines 191 to 191"]
B76["B77: instructions - lines 192 to 192"]
B77["B78: instructions - lines 193 to 193"]
B78["B79: instructions - lines 194 to 194"]
B79["B80: CLEAR - lines 201 to 202"]
B70 -->|condition true| B68
B70 -->|condition false| B71
B72 -->|next| B73
B73 -->|next| B74
B74 -->|next| B75
B75 -->|condition true| B75
B75 -->|condition false| B76
B76 -->|condition true| B74
B76 -->|condition false| B77
B77 -->|condition true| B73
B77 -->|condition false| B78
B79 -->|call| B89
B79 -->|after return| B80
B68["Continue at B69 in section 7"]
B89["Continue at B90 in section 9"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
DJNZ R6,T3
```

### B72

Return to the instruction following the active call.

```asm
RET
```

### B73

```asm
MOV R5,#2
```

### B74

```asm
MOV R4,#20
```

### B75

```asm
MOV R3,#200
```

### B76

```asm
DJNZ R3,X1
```

### B77

```asm
DJNZ R4,X2
```

### B78

```asm
DJNZ R5,X3
```

### B79

Return to the instruction following the active call.

```asm
RET
```

### B80

```asm
MOV A,#01H
ACALL CMD
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 203 to 203"]
B81["B82: WAIT - lines 204 to 204"]
B82["B83: instructions - lines 205 to 205"]
B83["B84: instructions - lines 206 to 206"]
B84["B85: WCHR - lines 209 to 213"]
B85["B86: instructions - lines 214 to 214"]
B86["B87: instructions - lines 215 to 217"]
B87["B88: instructions - lines 218 to 218"]
B88["B89: instructions - lines 219 to 221"]
B89["B90: CMD - lines 226 to 228"]
B80 -->|next| B81
B81 -->|call| B117
B81 -->|after return| B82
B82 -->|condition true| B81
B82 -->|condition false| B83
B84 -->|call| B94
B84 -->|after return| B85
B85 -->|call| B117
B85 -->|after return| B86
B86 -->|call| B94
B86 -->|after return| B87
B87 -->|call| B117
B87 -->|after return| B88
B89 -->|call| B94
B89 -->|after return| B90
B117["Continue at B118 in section 12"]
B94["Continue at B95 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
MOV R5,#14
```

### B82

```asm
ACALL LDELAY
```

### B83

```asm
DJNZ R5,WAIT
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
B90["B91: instructions - lines 229 to 229"]
B91["B92: instructions - lines 230 to 232"]
B92["B93: instructions - lines 233 to 233"]
B93["B94: instructions - lines 234 to 234"]
B94["B95: COMMON - lines 239 to 244"]
B95["B96: INLCD - lines 248 to 255"]
B96["B97: instructions - lines 256 to 264"]
B97["B98: instructions - lines 265 to 277"]
B98["B99: instructions - lines 278 to 288"]
B99["B100: instructions - lines 289 to 289"]
B90 -->|call| B117
B90 -->|after return| B91
B91 -->|call| B94
B91 -->|after return| B92
B92 -->|call| B117
B92 -->|after return| B93
B95 -->|call| B117
B95 -->|after return| B96
B96 -->|call| B117
B96 -->|after return| B97
B97 -->|call| B117
B97 -->|after return| B98
B98 -->|call| B117
B98 -->|after return| B99
B117["Continue at B118 in section 12"]
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
B100["B101: KEYPAD - lines 293 to 293"]
B101["B102: K1 - lines 294 to 297"]
B102["B103: K2 - lines 299 to 301"]
B103["B104: instructions - lines 302 to 302"]
B104["B105: OVER1 - lines 304 to 307"]
B105["B106: instructions - lines 308 to 311"]
B106["B107: instructions - lines 312 to 315"]
B107["B108: instructions - lines 316 to 319"]
B108["B109: instructions - lines 320 to 320"]
B109["B110: ROW_0 - lines 321 to 322"]
B100 -->|next| B101
B101 -->|condition true| B101
B101 -->|condition false| B102
B102 -->|condition true| B104
B102 -->|condition false| B103
B103 -->|jump| B102
B104 -->|condition true| B109
B104 -->|condition false| B105
B105 -->|condition true| B110
B105 -->|condition false| B106
B106 -->|condition true| B111
B106 -->|condition false| B107
B107 -->|condition true| B112
B107 -->|condition false| B108
B108 -->|jump| B102
B109 -->|jump| B113
B110["Continue at B111 in section 12"]
B111["Continue at B112 in section 12"]
B112["Continue at B113 in section 12"]
B113["Continue at B114 in section 12"]
```

### B101

```asm
MOV P0,#01110000B
```

### B102

```asm
MOV P0,#01110000B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,K1
```

### B103

```asm
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,OVER1
```

### B104

```asm
SJMP K2
```

### B105

```asm
MOV P0,#01111110B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_0
```

### B106

```asm
MOV P0,#01111101B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_1
```

### B107

```asm
MOV P0,#01111011B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_2
```

### B108

```asm
MOV P0,#01110111B
MOV A,P0
ANL A,#01110000B
CJNE A,#01110000B,ROW_3
```

### B109

```asm
LJMP K2
```

### B110

```asm
MOV DPTR,#KCODE0
SJMP FIND
```

## Section 12

```mermaid
flowchart TD
B110["B111: ROW_1 - lines 323 to 324"]
B111["B112: ROW_2 - lines 325 to 326"]
B112["B113: ROW_3 - lines 327 to 327"]
B113["B114: FIND - lines 329 to 329"]
B114["B115: FIND1 - lines 331 to 332"]
B115["B116: instructions - lines 333 to 334"]
B116["B117: MATCH - lines 335 to 337"]
B117["B118: LDELAY - lines 341 to 342"]
B118["B119: instructions - lines 343 to 343"]
B119["B120: WSTR - lines 346 to 346"]
B110 -->|jump| B113
B111 -->|jump| B113
B112 -->|next| B113
B113 -->|next| B114
B114 -->|condition true| B116
B114 -->|condition false| B115
B115 -->|jump| B114
B117 -->|condition true| B117
B117 -->|condition false| B118
B119 -->|next| B120
B120["Continue at B121 in section 13"]
```

### B111

```asm
MOV DPTR,#KCODE1
SJMP FIND
```

### B112

```asm
MOV DPTR,#KCODE2
SJMP FIND
```

### B113

```asm
MOV DPTR,#KCODE3
```

### B114

```asm
RLC A
```

### B115

```asm
RLC A
JNC MATCH
```

### B116

```asm
INC DPTR
SJMP FIND1
```

### B117

Return to the instruction following the active call.

```asm
CLR A
MOVC A,@A+DPTR
RET
```

### B118

```asm
MOV R0, #50
DJNZ R0, $
```

### B119

Return to the instruction following the active call.

```asm
RET
```

### B120

```asm
PUSH ACC
```

## Section 13

```mermaid
flowchart TD
B120["B121: CONT1 - lines 348 to 350"]
B121["B122: PRINT - lines 352 to 352"]
B122["B123: instructions - lines 353 to 354"]
B123["B124: EXIT1 - lines 355 to 356"]
B124["B125: WELCOMEMSG - lines 360 to 361"]
B125["B126: instructions - lines 362 to 363"]
B126["B127: instructions - lines 364 to 364"]
B127["B128: instructions - lines 365 to 366"]
B128["B129: instructions - lines 367 to 368"]
B129["B130: instructions - lines 369 to 369"]
B120 -->|condition true| B123
B120 -->|condition false| B121
B121 -->|call| B84
B121 -->|after return| B122
B122 -->|jump| B120
B124 -->|call| B89
B124 -->|after return| B125
B125 -->|call| B119
B125 -->|after return| B126
B126 -->|call| B72
B126 -->|after return| B127
B127 -->|call| B89
B127 -->|after return| B128
B128 -->|call| B119
B128 -->|after return| B129
B129 -->|call| B72
B129 -->|after return| B130
B84["Continue at B85 in section 9"]
B89["Continue at B90 in section 9"]
B119["Continue at B120 in section 12"]
B72["Continue at B73 in section 8"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
CLR A
MOVC A,@A+DPTR
JZ Exit1
```

### B122

```asm
ACALL WCHR
```

### B123

```asm
INC DPTR
AJMP CONT1
```

### B124

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B125

```asm
MOV A,#80H
ACALL CMD
```

### B126

```asm
MOV DPTR,#ro1
ACALL WSTR
```

### B127

```asm
ACALL DELAY
```

### B128

```asm
MOV A,#0c0H
ACALL CMD
```

### B129

```asm
MOV DPTR,#ro2
ACALL WSTR
```

### B130

```asm
ACALL DELAY
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 370 to 370"]
B131["B132: MENUMSG - lines 373 to 373"]
B132["B133: instructions - lines 374 to 375"]
B133["B134: instructions - lines 376 to 377"]
B134["B135: instructions - lines 378 to 379"]
B135["B136: instructions - lines 380 to 381"]
B136["B137: instructions - lines 382 to 382"]
B137["B138: instructions - lines 384 to 384"]
B138["B139: EXITMSG - lines 387 to 387"]
B139["B140: instructions - lines 388 to 389"]
B131 -->|call| B79
B131 -->|after return| B132
B132 -->|call| B89
B132 -->|after return| B133
B133 -->|call| B119
B133 -->|after return| B134
B134 -->|call| B89
B134 -->|after return| B135
B135 -->|call| B119
B135 -->|after return| B136
B136 -->|call| B72
B136 -->|after return| B137
B138 -->|call| B79
B138 -->|after return| B139
B139 -->|call| B89
B139 -->|after return| B140
B79["Continue at B80 in section 8"]
B89["Continue at B90 in section 9"]
B119["Continue at B120 in section 12"]
B72["Continue at B73 in section 8"]
B140["Continue at B141 in section 15"]
```

### B131

Return to the instruction following the active call.

```asm
RET
```

### B132

```asm
ACALL CLEAR
```

### B133

```asm
MOV A,#80H
ACALL CMD
```

### B134

```asm
MOV DPTR,#ro3
ACALL WSTR
```

### B135

```asm
MOV A,#0C0H
ACALL CMD
```

### B136

```asm
MOV DPTR,#ro4
ACALL WSTR
```

### B137

```asm
ACALL DELAY
```

### B138

Return to the instruction following the active call.

```asm
RET
```

### B139

```asm
ACALL CLEAR
```

### B140

```asm
MOV A,#80H
ACALL CMD
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 390 to 391"]
B141["B142: instructions - lines 392 to 392"]
B142["B143: instructions - lines 393 to 393"]
B143["B144: ERROR1MSG - lines 397 to 397"]
B144["B145: instructions - lines 398 to 399"]
B145["B146: instructions - lines 400 to 401"]
B146["B147: instructions - lines 402 to 402"]
B147["B148: instructions - lines 403 to 403"]
B148["B149: MES1 - lines 406 to 406"]
B149["B150: instructions - lines 407 to 408"]
B140 -->|call| B119
B140 -->|after return| B141
B141 -->|call| B72
B141 -->|after return| B142
B143 -->|call| B79
B143 -->|after return| B144
B144 -->|call| B89
B144 -->|after return| B145
B145 -->|call| B119
B145 -->|after return| B146
B146 -->|call| B72
B146 -->|after return| B147
B148 -->|call| B79
B148 -->|after return| B149
B149 -->|call| B89
B149 -->|after return| B150
B119["Continue at B120 in section 12"]
B72["Continue at B73 in section 8"]
B79["Continue at B80 in section 8"]
B89["Continue at B90 in section 9"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
MOV DPTR,#ro6
acall wstr
```

### B142

```asm
ACALL DELAY
```

### B143

Return to the instruction following the active call.

```asm
RET
```

### B144

```asm
ACALL CLEAR
```

### B145

```asm
MOV A,#80H
ACALL CMD
```

### B146

```asm
MOV DPTR,#ro5
ACALL WSTR
```

### B147

```asm
ACALL DELAY
```

### B148

Return to the instruction following the active call.

```asm
RET
```

### B149

```asm
ACALL CLEAR
```

### B150

```asm
MOV A,#80H
ACALL CMD
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 409 to 410"]
B151["B152: instructions - lines 411 to 411"]
B152["B153: instructions - lines 412 to 413"]
B153["B154: instructions - lines 414 to 415"]
B154["B155: instructions - lines 416 to 416"]
B155["B156: instructions - lines 417 to 417"]
B156["B157: MES2 - lines 420 to 420"]
B157["B158: instructions - lines 421 to 422"]
B158["B159: instructions - lines 423 to 424"]
B159["B160: instructions - lines 425 to 426"]
B150 -->|call| B119
B150 -->|after return| B151
B151 -->|call| B72
B151 -->|after return| B152
B152 -->|call| B89
B152 -->|after return| B153
B153 -->|call| B119
B153 -->|after return| B154
B154 -->|call| B72
B154 -->|after return| B155
B156 -->|call| B79
B156 -->|after return| B157
B157 -->|call| B89
B157 -->|after return| B158
B158 -->|call| B119
B158 -->|after return| B159
B159 -->|call| B89
B159 -->|after return| B160
B119["Continue at B120 in section 12"]
B72["Continue at B73 in section 8"]
B89["Continue at B90 in section 9"]
B79["Continue at B80 in section 8"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
MOV DPTR,#ro7
ACALL WSTR
```

### B152

```asm
ACALL DELAY
```

### B153

```asm
MOV A,#0C0H
ACALL CMD
```

### B154

```asm
MOV DPTR,#ro11
ACALL WSTR
```

### B155

```asm
ACALL DELAY
```

### B156

Return to the instruction following the active call.

```asm
RET
```

### B157

```asm
ACALL CLEAR
```

### B158

```asm
MOV A,#80H
ACALL CMD
```

### B159

```asm
MOV DPTR,#ro8
ACALL WSTR
```

### B160

```asm
MOV A,#0C0H
ACALL CMD
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 427 to 428"]
B161["B162: instructions - lines 429 to 429"]
B162["B163: instructions - lines 430 to 430"]
B163["B164: MES22 - lines 433 to 433"]
B164["B165: instructions - lines 434 to 435"]
B165["B166: instructions - lines 436 to 437"]
B166["B167: instructions - lines 438 to 439"]
B167["B168: instructions - lines 440 to 441"]
B168["B169: instructions - lines 442 to 442"]
B169["B170: instructions - lines 443 to 443"]
B160 -->|call| B119
B160 -->|after return| B161
B161 -->|call| B72
B161 -->|after return| B162
B163 -->|call| B79
B163 -->|after return| B164
B164 -->|call| B89
B164 -->|after return| B165
B165 -->|call| B119
B165 -->|after return| B166
B166 -->|call| B89
B166 -->|after return| B167
B167 -->|call| B119
B167 -->|after return| B168
B168 -->|call| B72
B168 -->|after return| B169
B119["Continue at B120 in section 12"]
B72["Continue at B73 in section 8"]
B79["Continue at B80 in section 8"]
B89["Continue at B90 in section 9"]
```

### B161

```asm
MOV DPTR,#ro9
ACALL WSTR
```

### B162

```asm
ACALL DELAY
```

### B163

Return to the instruction following the active call.

```asm
RET
```

### B164

```asm
ACALL CLEAR
```

### B165

```asm
MOV A,#80H
ACALL CMD
```

### B166

```asm
MOV DPTR,#ro10
ACALL WSTR
```

### B167

```asm
MOV A,#0C0H
ACALL CMD
```

### B168

```asm
MOV DPTR,#ro11
ACALL WSTR
```

### B169

```asm
ACALL DELAY
```

### B170

Return to the instruction following the active call.

```asm
RET
```

## Section 18

```mermaid
flowchart TD
B170["B171: MES3 - lines 448 to 448"]
B171["B172: instructions - lines 449 to 450"]
B172["B173: instructions - lines 451 to 452"]
B173["B174: instructions - lines 453 to 454"]
B174["B175: instructions - lines 456 to 456"]
B175["B176: MES33 - lines 459 to 459"]
B176["B177: instructions - lines 460 to 461"]
B177["B178: instructions - lines 462 to 463"]
B178["B179: instructions - lines 464 to 465"]
B179["B180: instructions - lines 466 to 467"]
B170 -->|call| B79
B170 -->|after return| B171
B171 -->|call| B89
B171 -->|after return| B172
B172 -->|call| B119
B172 -->|after return| B173
B173 -->|call| B89
B173 -->|after return| B174
B175 -->|call| B79
B175 -->|after return| B176
B176 -->|call| B89
B176 -->|after return| B177
B177 -->|call| B119
B177 -->|after return| B178
B178 -->|call| B89
B178 -->|after return| B179
B179 -->|call| B119
B179 -->|after return| B180
B79["Continue at B80 in section 8"]
B89["Continue at B90 in section 9"]
B119["Continue at B120 in section 12"]
B180["Continue at B181 in section 19"]
```

### B171

```asm
ACALL CLEAR
```

### B172

```asm
MOV A,#80H
ACALL CMD
```

### B173

```asm
MOV DPTR,#ro12
ACALL WSTR
```

### B174

```asm
MOV A,#0C0H
ACALL CMD
```

### B175

Return to the instruction following the active call.

```asm
RET
```

### B176

```asm
ACALL CLEAR
```

### B177

```asm
MOV A,#80H
ACALL CMD
```

### B178

```asm
MOV DPTR,#ro12
ACALL WSTR
```

### B179

```asm
MOV A,#0C0H
ACALL CMD
```

### B180

```asm
MOV DPTR,#ro14
ACALL WSTR
```

## Section 19

```mermaid
flowchart TD
B180["B181: instructions - lines 468 to 468"]
B181["B182: MES4 - lines 471 to 471"]
B182["B183: instructions - lines 472 to 473"]
B183["B184: instructions - lines 474 to 475"]
B184["B185: instructions - lines 476 to 477"]
B185["B186: instructions - lines 478 to 479"]
B186["B187: instructions - lines 480 to 480"]
B187["B188: instructions - lines 481 to 481"]
B188["B189: MES5 - lines 484 to 484"]
B189["B190: instructions - lines 485 to 486"]
B181 -->|call| B79
B181 -->|after return| B182
B182 -->|call| B89
B182 -->|after return| B183
B183 -->|call| B119
B183 -->|after return| B184
B184 -->|call| B89
B184 -->|after return| B185
B185 -->|call| B119
B185 -->|after return| B186
B186 -->|call| B72
B186 -->|after return| B187
B188 -->|call| B79
B188 -->|after return| B189
B189 -->|call| B89
B189 -->|after return| B190
B79["Continue at B80 in section 8"]
B89["Continue at B90 in section 9"]
B119["Continue at B120 in section 12"]
B72["Continue at B73 in section 8"]
B190["Continue at B191 in section 20"]
```

### B181

Return to the instruction following the active call.

```asm
RET
```

### B182

```asm
ACALL CLEAR
```

### B183

```asm
MOV A,#80H
ACALL CMD
```

### B184

```asm
MOV DPTR,#ro13
ACALL WSTR
```

### B185

```asm
MOV A,#0C0H
ACALL CMD
```

### B186

```asm
MOV DPTR,#ro11
ACALL WSTR
```

### B187

```asm
ACALL DELAY
```

### B188

Return to the instruction following the active call.

```asm
RET
```

### B189

```asm
ACALL CLEAR
```

### B190

```asm
MOV A,#80H
ACALL CMD
```

## Section 20

```mermaid
flowchart TD
B190["B191: instructions - lines 487 to 488"]
B191["B192: instructions - lines 489 to 490"]
B192["B193: instructions - lines 491 to 492"]
B193["B194: instructions - lines 493 to 493"]
B194["B195: instructions - lines 494 to 494"]
B190 -->|call| B119
B190 -->|after return| B191
B191 -->|call| B89
B191 -->|after return| B192
B192 -->|call| B119
B192 -->|after return| B193
B193 -->|call| B72
B193 -->|after return| B194
B119["Continue at B120 in section 12"]
B89["Continue at B90 in section 9"]
B72["Continue at B73 in section 8"]
```

### B191

```asm
MOV DPTR,#ro15
ACALL WSTR
```

### B192

```asm
MOV A,#0C0H
ACALL CMD
```

### B193

```asm
MOV DPTR,#ro11
ACALL WSTR
```

### B194

```asm
ACALL DELAY
```

### B195

Return to the instruction following the active call.

```asm
RET
```
