# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `org 0h` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18) · [Section 19](#section-19)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 4 to 4"]
B1["B2: instructions - lines 7 to 7"]
B2["B3: instructions - lines 10 to 10"]
B3["B4: instructions - lines 13 to 13"]
B4["B5: MAIN - lines 17 to 17"]
B5["B6: CHECK - lines 21 to 22"]
B6["B7: OP1 - lines 26 to 26"]
B7["B8: instructions - lines 29 to 30"]
B8["B9: DOWN1 - lines 32 to 32"]
B9["B10: instructions - lines 34 to 34"]
B0 -->|call| B151
B0 -->|after return| B1
B1 -->|call| B31
B1 -->|after return| B2
B2 -->|call| B39
B2 -->|after return| B3
B3 -->|call| B47
B3 -->|after return| B4
B4 -->|call| B58
B4 -->|after return| B5
B5 -->|condition true| B13
B5 -->|condition false| B6
B6 -->|call| B68
B6 -->|after return| B7
B7 -->|condition true| B8
B7 -->|condition false| B8
B8 -->|condition true| B11
B8 -->|condition false| B9
B9 -->|call| B94
B9 -->|after return| B10
B151["Continue at B152 in section 16"]
B31["Continue at B32 in section 4"]
B39["Continue at B40 in section 4"]
B47["Continue at B48 in section 5"]
B58["Continue at B59 in section 6"]
B13["Continue at B14 in section 2"]
B68["Continue at B69 in section 7"]
B11["Continue at B12 in section 2"]
B94["Continue at B95 in section 10"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
acall inlcd
```

### B2

```asm
acall welcome
```

### B3

```asm
acall name_id
```

### B4

```asm
acall intkey
```

### B5

```asm
acall main_menu
```

### B6

```asm
mov a, 30h
cjne a, #1, not1
```

### B7

```asm
acall enter_num
```

### B8

```asm
mov a, 40h
cjne a, #91h, down1
```

### B9

```asm
jc inrange_1
```

### B10

```asm
acall error
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 35 to 35"]
B11["B12: INRANGE_1 - lines 38 to 45"]
B12["B13: instructions - lines 46 to 46"]
B13["B14: NOT1 - lines 49 to 50"]
B14["B15: OP2 - lines 54 to 54"]
B15["B16: instructions - lines 57 to 58"]
B16["B17: DOWN2 - lines 60 to 60"]
B17["B18: instructions - lines 62 to 62"]
B18["B19: instructions - lines 63 to 63"]
B19["B20: INRANGE_2 - lines 66 to 68"]
B10 -->|jump| B6
B11 -->|call| B104
B11 -->|after return| B12
B12 -->|jump| B4
B13 -->|condition true| B25
B13 -->|condition false| B14
B14 -->|call| B68
B14 -->|after return| B15
B15 -->|condition true| B16
B15 -->|condition false| B16
B16 -->|condition true| B19
B16 -->|condition false| B17
B17 -->|call| B94
B17 -->|after return| B18
B18 -->|jump| B14
B19 -->|next| B20
B6["Continue at B7 in section 1"]
B104["Continue at B105 in section 11"]
B4["Continue at B5 in section 1"]
B25["Continue at B26 in section 3"]
B68["Continue at B69 in section 7"]
B94["Continue at B95 in section 10"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
sjmp op1
```

### B12

```asm
mov a, 40h
mov r0, a
inc r0
add a, r0
mov b, #2
div ab
mov 41h, a
acall result_1
```

### B13

```asm
ljmp main
```

### B14

```asm
mov a, 30h
cjne a, #2, not2
```

### B15

```asm
acall enter_num
```

### B16

```asm
mov a, 50h
cjne a, #91h, down2
```

### B17

```asm
jc inrange_2
```

### B18

```asm
acall error
```

### B19

```asm
sjmp op2
```

### B20

```asm
mov r0, #0
mov r1, #8
mov a, 50h
```

## Section 3

```mermaid
flowchart TD
B20["B21: BACK - lines 70 to 71"]
B21["B22: instructions - lines 72 to 72"]
B22["B23: SKIP - lines 74 to 74"]
B23["B24: instructions - lines 75 to 77"]
B24["B25: instructions - lines 78 to 78"]
B25["B26: NOT2 - lines 81 to 82"]
B26["B27: OP3 - lines 84 to 84"]
B27["B28: instructions - lines 85 to 85"]
B28["B29: NOT3 - lines 88 to 88"]
B29["B30: instructions - lines 89 to 89"]
B20 -->|condition true| B22
B20 -->|condition false| B21
B21 -->|next| B22
B22 -->|condition true| B20
B22 -->|condition false| B23
B23 -->|call| B112
B23 -->|after return| B24
B24 -->|jump| B4
B25 -->|condition true| B28
B25 -->|condition false| B26
B26 -->|call| B119
B26 -->|after return| B27
B27 -->|jump| B30
B28 -->|call| B125
B28 -->|after return| B29
B29 -->|jump| B4
B112["Continue at B113 in section 12"]
B4["Continue at B5 in section 1"]
B119["Continue at B120 in section 12"]
B30["Continue at B31 in section 4"]
B125["Continue at B126 in section 13"]
```

### B21

```asm
rrc a
jc skip
```

### B22

```asm
inc r0
```

### B23

```asm
djnz r1, back
```

### B24

```asm
mov a, r0
mov 51h, a
acall result_2
```

### B25

```asm
ljmp main
```

### B26

```asm
mov a, 30h
cjne a, #3, not3
```

### B27

```asm
acall exit_routine
```

### B28

```asm
sjmp done
```

### B29

```asm
acall invalid_choice
```

### B30

```asm
ljmp main
```

## Section 4

```mermaid
flowchart TD
B30["B31: DONE - lines 93 to 93"]
B31["B32: WELCOME - lines 97 to 97"]
B32["B33: instructions - lines 98 to 99"]
B33["B34: instructions - lines 100 to 101"]
B34["B35: instructions - lines 102 to 103"]
B35["B36: instructions - lines 104 to 105"]
B36["B37: instructions - lines 106 to 106"]
B37["B38: instructions - lines 107 to 107"]
B38["B39: instructions - lines 108 to 108"]
B39["B40: NAME_ID - lines 112 to 112"]
B30 -->|jump| B30
B31 -->|call| B151
B31 -->|after return| B32
B32 -->|call| B145
B32 -->|after return| B33
B33 -->|call| B158
B33 -->|after return| B34
B34 -->|call| B145
B34 -->|after return| B35
B35 -->|call| B158
B35 -->|after return| B36
B36 -->|call| B133
B36 -->|after return| B37
B37 -->|call| B163
B37 -->|after return| B38
B39 -->|call| B151
B39 -->|after return| B40
B151["Continue at B152 in section 16"]
B145["Continue at B146 in section 15"]
B158["Continue at B159 in section 16"]
B133["Continue at B134 in section 14"]
B163["Continue at B164 in section 17"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
sjmp $
```

### B32

```asm
acall inlcd
```

### B33

```asm
mov a,#80h
acall cmd
```

### B34

```asm
mov dptr, #M11
acall wstr
```

### B35

```asm
mov a,#0c0h
acall cmd
```

### B36

```asm
mov dptr, #M12
acall wstr
```

### B37

```asm
acall delay
```

### B38

```asm
acall clear
```

### B39

Return to the instruction following the active call.

```asm
ret
```

### B40

```asm
acall inlcd
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 113 to 114"]
B41["B42: instructions - lines 115 to 116"]
B42["B43: instructions - lines 117 to 118"]
B43["B44: instructions - lines 119 to 120"]
B44["B45: instructions - lines 121 to 121"]
B45["B46: instructions - lines 122 to 122"]
B46["B47: instructions - lines 123 to 123"]
B47["B48: INTKEY - lines 127 to 127"]
B48["B49: instructions - lines 128 to 129"]
B49["B50: instructions - lines 130 to 131"]
B40 -->|call| B145
B40 -->|after return| B41
B41 -->|call| B158
B41 -->|after return| B42
B42 -->|call| B145
B42 -->|after return| B43
B43 -->|call| B158
B43 -->|after return| B44
B44 -->|call| B133
B44 -->|after return| B45
B45 -->|call| B163
B45 -->|after return| B46
B47 -->|call| B151
B47 -->|after return| B48
B48 -->|call| B145
B48 -->|after return| B49
B49 -->|call| B158
B49 -->|after return| B50
B145["Continue at B146 in section 15"]
B158["Continue at B159 in section 16"]
B133["Continue at B134 in section 14"]
B163["Continue at B164 in section 17"]
B151["Continue at B152 in section 16"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
mov a,#80h
acall cmd
```

### B42

```asm
mov dptr, #M21
acall wstr
```

### B43

```asm
mov a,#0c0h
acall cmd
```

### B44

```asm
mov dptr, #M22
acall wstr
```

### B45

```asm
acall delay
```

### B46

```asm
acall clear
```

### B47

Return to the instruction following the active call.

```asm
ret
```

### B48

```asm
acall inlcd
```

### B49

```asm
mov a,#80h
acall cmd
```

### B50

```asm
mov dptr, #M23
acall wstr
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 132 to 133"]
B51["B52: instructions - lines 134 to 135"]
B52["B53: WAITINT - lines 137 to 137"]
B53["B54: instructions - lines 138 to 138"]
B54["B55: instructions - lines 139 to 139"]
B55["B56: instructions - lines 140 to 140"]
B56["B57: instructions - lines 141 to 141"]
B57["B58: instructions - lines 142 to 142"]
B58["B59: MAIN_MENU - lines 146 to 146"]
B59["B60: instructions - lines 147 to 148"]
B50 -->|call| B145
B50 -->|after return| B51
B51 -->|call| B158
B51 -->|after return| B52
B52 -->|call| B168
B52 -->|after return| B53
B53 -->|condition true| B52
B53 -->|condition false| B54
B54 -->|call| B140
B54 -->|after return| B55
B55 -->|call| B156
B55 -->|after return| B56
B56 -->|call| B163
B56 -->|after return| B57
B58 -->|call| B151
B58 -->|after return| B59
B59 -->|call| B145
B59 -->|after return| B60
B145["Continue at B146 in section 15"]
B158["Continue at B159 in section 16"]
B168["Continue at B169 in section 17"]
B140["Continue at B141 in section 15"]
B156["Continue at B157 in section 16"]
B163["Continue at B164 in section 17"]
B151["Continue at B152 in section 16"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
mov a,#0c0h
acall cmd
```

### B52

```asm
mov dptr, #M24
acall wstr
```

### B53

```asm
acall keypad
```

### B54

```asm
cjne a, #'#', waitint
```

### B55

```asm
acall wchr
```

### B56

```asm
acall ldelay
```

### B57

```asm
acall clear
```

### B58

Return to the instruction following the active call.

```asm
ret
```

### B59

```asm
acall inlcd
```

### B60

```asm
mov a,#80h
acall cmd
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 149 to 150"]
B61["B62: instructions - lines 151 to 152"]
B62["B63: instructions - lines 153 to 154"]
B63["B64: instructions - lines 156 to 156"]
B64["B65: instructions - lines 157 to 157"]
B65["B66: instructions - lines 158 to 161"]
B66["B67: instructions - lines 162 to 162"]
B67["B68: instructions - lines 163 to 163"]
B68["B69: ENTER_NUM - lines 167 to 167"]
B69["B70: instructions - lines 168 to 169"]
B60 -->|call| B158
B60 -->|after return| B61
B61 -->|call| B145
B61 -->|after return| B62
B62 -->|call| B158
B62 -->|after return| B63
B63 -->|call| B168
B63 -->|after return| B64
B64 -->|call| B140
B64 -->|after return| B65
B65 -->|call| B133
B65 -->|after return| B66
B66 -->|call| B163
B66 -->|after return| B67
B68 -->|call| B151
B68 -->|after return| B69
B69 -->|call| B145
B69 -->|after return| B70
B158["Continue at B159 in section 16"]
B145["Continue at B146 in section 15"]
B168["Continue at B169 in section 17"]
B140["Continue at B141 in section 15"]
B133["Continue at B134 in section 14"]
B163["Continue at B164 in section 17"]
B151["Continue at B152 in section 16"]
B70["Continue at B71 in section 8"]
```

### B61

```asm
mov dptr, #M31
acall wstr
```

### B62

```asm
mov a,#0c0h
acall cmd
```

### B63

```asm
mov dptr, #M32
acall wstr
```

### B64

```asm
acall keypad
```

### B65

```asm
acall wchr
```

### B66

```asm
subb a, #30h
mov 30h, a
acall delay
```

### B67

```asm
acall clear
```

### B68

Return to the instruction following the active call.

```asm
ret
```

### B69

```asm
acall inlcd
```

### B70

```asm
mov a,#80h
acall cmd
```

## Section 8

```mermaid
flowchart TD
B70["B71: instructions - lines 170 to 171"]
B71["B72: instructions - lines 172 to 173"]
B72["B73: instructions - lines 174 to 175"]
B73["B74: instructions - lines 177 to 177"]
B74["B75: instructions - lines 178 to 178"]
B75["B76: instructions - lines 179 to 179"]
B76["B77: instructions - lines 180 to 180"]
B77["B78: instructions - lines 181 to 181"]
B78["B79: NO_STAR - lines 183 to 183"]
B79["B80: instructions - lines 184 to 184"]
B70 -->|call| B158
B70 -->|after return| B71
B71 -->|call| B145
B71 -->|after return| B72
B72 -->|call| B158
B72 -->|after return| B73
B73 -->|call| B168
B73 -->|after return| B74
B74 -->|call| B140
B74 -->|after return| B75
B75 -->|condition true| B78
B75 -->|condition false| B76
B76 -->|call| B94
B76 -->|after return| B77
B77 -->|jump| B68
B78 -->|condition true| B82
B78 -->|condition false| B79
B79 -->|call| B163
B79 -->|after return| B80
B158["Continue at B159 in section 16"]
B145["Continue at B146 in section 15"]
B168["Continue at B169 in section 17"]
B140["Continue at B141 in section 15"]
B94["Continue at B95 in section 10"]
B68["Continue at B69 in section 7"]
B82["Continue at B83 in section 9"]
B163["Continue at B164 in section 17"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
mov dptr, #M41
acall wstr
```

### B72

```asm
mov a,#0c0h
acall cmd
```

### B73

```asm
mov dptr, #M42
acall wstr
```

### B74

```asm
acall keypad
```

### B75

```asm
acall wchr
```

### B76

```asm
cjne a,#'*',no_star
```

### B77

```asm
acall error
```

### B78

```asm
sjmp enter_num
```

### B79

```asm
cjne a,#'#',no_hash
```

### B80

```asm
acall clear
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 185 to 185"]
B81["B82: instructions - lines 186 to 186"]
B82["B83: NO_HASH - lines 188 to 191"]
B83["B84: instructions - lines 192 to 192"]
B84["B85: instructions - lines 193 to 193"]
B85["B86: instructions - lines 194 to 194"]
B86["B87: instructions - lines 195 to 195"]
B87["B88: instructions - lines 196 to 196"]
B88["B89: NO_STAR2 - lines 198 to 198"]
B89["B90: instructions - lines 199 to 199"]
B80 -->|call| B94
B80 -->|after return| B81
B81 -->|jump| B68
B82 -->|call| B168
B82 -->|after return| B83
B83 -->|call| B140
B83 -->|after return| B84
B84 -->|condition true| B88
B84 -->|condition false| B85
B85 -->|call| B163
B85 -->|after return| B86
B86 -->|call| B94
B86 -->|after return| B87
B87 -->|jump| B68
B88 -->|condition true| B91
B88 -->|condition false| B89
B89 -->|call| B94
B89 -->|after return| B90
B94["Continue at B95 in section 10"]
B68["Continue at B69 in section 7"]
B168["Continue at B169 in section 17"]
B140["Continue at B141 in section 15"]
B163["Continue at B164 in section 17"]
B91["Continue at B92 in section 10"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
acall error
```

### B82

```asm
sjmp enter_num
```

### B83

```asm
subb a, #30h
mov 41h, a
acall keypad
```

### B84

```asm
acall wchr
```

### B85

```asm
cjne a,#'*',no_star2
```

### B86

```asm
acall clear
```

### B87

```asm
acall error
```

### B88

```asm
sjmp enter_num
```

### B89

```asm
cjne a,#'#',no_hash2
```

### B90

```asm
acall error
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 200 to 200"]
B91["B92: NO_HASH2 - lines 202 to 210"]
B92["B93: instructions - lines 211 to 211"]
B93["B94: instructions - lines 212 to 212"]
B94["B95: ERROR - lines 216 to 216"]
B95["B96: instructions - lines 217 to 218"]
B96["B97: instructions - lines 219 to 220"]
B97["B98: instructions - lines 221 to 222"]
B98["B99: instructions - lines 223 to 224"]
B99["B100: instructions - lines 227 to 231"]
B90 -->|jump| B68
B91 -->|call| B133
B91 -->|after return| B92
B92 -->|call| B163
B92 -->|after return| B93
B94 -->|call| B151
B94 -->|after return| B95
B95 -->|call| B145
B95 -->|after return| B96
B96 -->|call| B158
B96 -->|after return| B97
B97 -->|call| B145
B97 -->|after return| B98
B98 -->|call| B158
B98 -->|after return| B99
B99 -->|next| B100
B68["Continue at B69 in section 7"]
B133["Continue at B134 in section 14"]
B163["Continue at B164 in section 17"]
B151["Continue at B152 in section 16"]
B145["Continue at B146 in section 15"]
B158["Continue at B159 in section 16"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
sjmp enter_num
```

### B92

```asm
subb a, #30h
mov 42h, a
mov a, 41h
swap a
add a, 42h
mov 40h, a
mov 50h, a
acall delay
```

### B93

```asm
acall clear
```

### B94

Return to the instruction following the active call.

```asm
ret
```

### B95

```asm
acall inlcd
```

### B96

```asm
mov a,#80h
acall cmd
```

### B97

```asm
mov dptr, #M61
acall wstr
```

### B98

```asm
mov a,#0c0h
acall cmd
```

### B99

```asm
mov dptr, #M62
acall wstr
```

### B100

```asm
mov p1, #0ffh
clr p1.0
clr p1.3
clr p1.6
mov r6, #2
```

## Section 11

```mermaid
flowchart TD
B100["B101: FR - lines 233 to 233"]
B101["B102: instructions - lines 234 to 234"]
B102["B103: instructions - lines 235 to 236"]
B103["B104: instructions - lines 237 to 237"]
B104["B105: RESULT_1 - lines 241 to 241"]
B105["B106: instructions - lines 242 to 243"]
B106["B107: instructions - lines 244 to 245"]
B107["B108: instructions - lines 247 to 251"]
B108["B109: instructions - lines 253 to 255"]
B109["B110: instructions - lines 257 to 257"]
B100 -->|call| B133
B100 -->|after return| B101
B101 -->|condition true| B100
B101 -->|condition false| B102
B102 -->|call| B163
B102 -->|after return| B103
B104 -->|call| B151
B104 -->|after return| B105
B105 -->|call| B145
B105 -->|after return| B106
B106 -->|call| B158
B106 -->|after return| B107
B107 -->|call| B140
B107 -->|after return| B108
B108 -->|call| B140
B108 -->|after return| B109
B109 -->|call| B133
B109 -->|after return| B110
B133["Continue at B134 in section 14"]
B163["Continue at B164 in section 17"]
B151["Continue at B152 in section 16"]
B145["Continue at B146 in section 15"]
B158["Continue at B159 in section 16"]
B140["Continue at B141 in section 15"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
acall delay
```

### B102

```asm
djnz r6, fr
```

### B103

```asm
mov p1, #0ffh
acall clear
```

### B104

Return to the instruction following the active call.

```asm
ret
```

### B105

```asm
acall inlcd
```

### B106

```asm
mov a,#80h
acall cmd
```

### B107

```asm
mov dptr, #M5
acall wstr
```

### B108

```asm
mov a, 41h
mov b, #10h
div ab
add a, #30h
acall wchr
```

### B109

```asm
mov a, b
add a, #30h
acall wchr
```

### B110

```asm
acall delay
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 258 to 258"]
B111["B112: instructions - lines 259 to 259"]
B112["B113: RESULT_2 - lines 263 to 263"]
B113["B114: instructions - lines 264 to 265"]
B114["B115: instructions - lines 266 to 267"]
B115["B116: instructions - lines 269 to 271"]
B116["B117: instructions - lines 273 to 273"]
B117["B118: instructions - lines 274 to 274"]
B118["B119: instructions - lines 275 to 275"]
B119["B120: EXIT_ROUTINE - lines 279 to 279"]
B110 -->|call| B163
B110 -->|after return| B111
B112 -->|call| B151
B112 -->|after return| B113
B113 -->|call| B145
B113 -->|after return| B114
B114 -->|call| B158
B114 -->|after return| B115
B115 -->|call| B140
B115 -->|after return| B116
B116 -->|call| B133
B116 -->|after return| B117
B117 -->|call| B163
B117 -->|after return| B118
B119 -->|call| B151
B119 -->|after return| B120
B163["Continue at B164 in section 17"]
B151["Continue at B152 in section 16"]
B145["Continue at B146 in section 15"]
B158["Continue at B159 in section 16"]
B140["Continue at B141 in section 15"]
B133["Continue at B134 in section 14"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
acall clear
```

### B112

Return to the instruction following the active call.

```asm
ret
```

### B113

```asm
acall inlcd
```

### B114

```asm
mov a,#80h
acall cmd
```

### B115

```asm
mov dptr, #M7
acall wstr
```

### B116

```asm
mov a, 51h
add a, #30h
acall wchr
```

### B117

```asm
acall delay
```

### B118

```asm
acall clear
```

### B119

Return to the instruction following the active call.

```asm
ret
```

### B120

```asm
acall inlcd
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 280 to 281"]
B121["B122: instructions - lines 282 to 283"]
B122["B123: instructions - lines 284 to 284"]
B123["B124: instructions - lines 285 to 285"]
B124["B125: instructions - lines 286 to 286"]
B125["B126: INVALID_CHOICE - lines 292 to 292"]
B126["B127: instructions - lines 293 to 294"]
B127["B128: instructions - lines 295 to 296"]
B128["B129: instructions - lines 299 to 303"]
B129["B130: FR2 - lines 305 to 305"]
B120 -->|call| B145
B120 -->|after return| B121
B121 -->|call| B158
B121 -->|after return| B122
B122 -->|call| B133
B122 -->|after return| B123
B123 -->|call| B163
B123 -->|after return| B124
B125 -->|call| B151
B125 -->|after return| B126
B126 -->|call| B145
B126 -->|after return| B127
B127 -->|call| B158
B127 -->|after return| B128
B128 -->|next| B129
B129 -->|call| B133
B129 -->|after return| B130
B145["Continue at B146 in section 15"]
B158["Continue at B159 in section 16"]
B133["Continue at B134 in section 14"]
B163["Continue at B164 in section 17"]
B151["Continue at B152 in section 16"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
mov a,#80h
acall cmd
```

### B122

```asm
mov dptr, #M9
acall wstr
```

### B123

```asm
acall delay
```

### B124

```asm
acall clear
```

### B125

Return to the instruction following the active call.

```asm
ret
```

### B126

```asm
acall inlcd
```

### B127

```asm
mov a,#80h
acall cmd
```

### B128

```asm
mov dptr, #M10
acall wstr
```

### B129

```asm
mov p1, #0ffh
clr p1.0
clr p1.3
clr p1.6
mov r6, #2
```

### B130

```asm
acall delay
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 306 to 306"]
B131["B132: instructions - lines 307 to 308"]
B132["B133: instructions - lines 309 to 309"]
B133["B134: DELAY - lines 314 to 314"]
B134["B135: X3 - lines 315 to 315"]
B135["B136: X2 - lines 316 to 316"]
B136["B137: X1 - lines 317 to 317"]
B137["B138: instructions - lines 318 to 318"]
B138["B139: instructions - lines 319 to 319"]
B139["B140: instructions - lines 320 to 320"]
B130 -->|condition true| B129
B130 -->|condition false| B131
B131 -->|call| B163
B131 -->|after return| B132
B133 -->|next| B134
B134 -->|next| B135
B135 -->|next| B136
B136 -->|condition true| B136
B136 -->|condition false| B137
B137 -->|condition true| B135
B137 -->|condition false| B138
B138 -->|condition true| B134
B138 -->|condition false| B139
B129["Continue at B130 in section 13"]
B163["Continue at B164 in section 17"]
```

### B131

```asm
djnz r6, fr2
```

### B132

```asm
mov p1, #0ffh
acall clear
```

### B133

Return to the instruction following the active call.

```asm
ret
```

### B134

```asm
mov r5, #2
```

### B135

```asm
mov r4, #200
```

### B136

```asm
mov r3, #150
```

### B137

```asm
djnz r3,x1
```

### B138

```asm
djnz r4,x2
```

### B139

```asm
djnz r5,x3
```

### B140

Return to the instruction following the active call.

```asm
ret
```

## Section 15

```mermaid
flowchart TD
B140["B141: WCHR - lines 325 to 329"]
B141["B142: instructions - lines 330 to 330"]
B142["B143: instructions - lines 331 to 333"]
B143["B144: instructions - lines 334 to 334"]
B144["B145: instructions - lines 335 to 337"]
B145["B146: CMD - lines 341 to 343"]
B146["B147: instructions - lines 344 to 344"]
B147["B148: instructions - lines 345 to 347"]
B148["B149: instructions - lines 348 to 348"]
B149["B150: instructions - lines 349 to 349"]
B140 -->|call| B150
B140 -->|after return| B141
B141 -->|call| B156
B141 -->|after return| B142
B142 -->|call| B150
B142 -->|after return| B143
B143 -->|call| B156
B143 -->|after return| B144
B145 -->|call| B150
B145 -->|after return| B146
B146 -->|call| B156
B146 -->|after return| B147
B147 -->|call| B150
B147 -->|after return| B148
B148 -->|call| B156
B148 -->|after return| B149
B150["Continue at B151 in section 16"]
B156["Continue at B157 in section 16"]
```

### B141

```asm
PUSH ACC
PUSH B
SETB P1.3
MOV B,A
ACALL COMMON
```

### B142

```asm
ACALL LDELAY
```

### B143

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B144

```asm
ACALL LDELAY
```

### B145

Return to the instruction following the active call.

```asm
POP B
POP ACC
RET
```

### B146

```asm
CLR P1.3
MOV B,A
ACALL COMMON
```

### B147

```asm
ACALL LDELAY
```

### B148

```asm
MOV A,B
SWAP A
ACALL COMMON
```

### B149

```asm
ACALL LDELAY
```

### B150

Return to the instruction following the active call.

```asm
RET
```

## Section 16

```mermaid
flowchart TD
B150["B151: COMMON - lines 353 to 358"]
B151["B152: INLCD - lines 362 to 369"]
B152["B153: instructions - lines 370 to 378"]
B153["B154: instructions - lines 379 to 391"]
B154["B155: instructions - lines 392 to 402"]
B155["B156: instructions - lines 403 to 403"]
B156["B157: LDELAY - lines 407 to 408"]
B157["B158: instructions - lines 409 to 409"]
B158["B159: WSTR - lines 413 to 413"]
B159["B160: CONT1 - lines 415 to 417"]
B151 -->|call| B156
B151 -->|after return| B152
B152 -->|call| B156
B152 -->|after return| B153
B153 -->|call| B156
B153 -->|after return| B154
B154 -->|call| B156
B154 -->|after return| B155
B156 -->|condition true| B156
B156 -->|condition false| B157
B158 -->|next| B159
B159 -->|condition true| B162
B159 -->|condition false| B160
B162["Continue at B163 in section 17"]
B160["Continue at B161 in section 17"]
```

### B151

Return to the instruction following the active call.

```asm
ANL a,#11110000B
ANL P1, #00001111B
ORL P1,A
SETB P1.2
CLR P1.2
RET
```

### B152

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

### B153

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

### B154

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

### B155

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

### B156

Return to the instruction following the active call.

```asm
RET
```

### B157

```asm
MOV R0, #50
DJNZ R0, $
```

### B158

Return to the instruction following the active call.

```asm
RET
```

### B159

```asm
PUSH ACC
```

### B160

```asm
CLR A
MOVC A,@A+DPTR
JZ Exit1
```

## Section 17

```mermaid
flowchart TD
B160["B161: PRINT - lines 419 to 419"]
B161["B162: instructions - lines 420 to 421"]
B162["B163: EXIT1 - lines 423 to 424"]
B163["B164: CLEAR - lines 428 to 429"]
B164["B165: instructions - lines 430 to 430"]
B165["B166: WAIT - lines 432 to 432"]
B166["B167: instructions - lines 433 to 433"]
B167["B168: instructions - lines 434 to 434"]
B168["B169: KEYPAD - lines 438 to 438"]
B169["B170: K1 - lines 439 to 442"]
B160 -->|call| B140
B160 -->|after return| B161
B161 -->|jump| B159
B163 -->|call| B145
B163 -->|after return| B164
B164 -->|next| B165
B165 -->|call| B156
B165 -->|after return| B166
B166 -->|condition true| B165
B166 -->|condition false| B167
B168 -->|next| B169
B169 -->|condition true| B169
B169 -->|condition false| B170
B140["Continue at B141 in section 15"]
B159["Continue at B160 in section 16"]
B145["Continue at B146 in section 15"]
B156["Continue at B157 in section 16"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
ACALL WCHR
```

### B162

```asm
INC DPTR
AJMP CONT1
```

### B163

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B164

```asm
MOV A, #01H
ACALL CMD
```

### B165

```asm
MOV R7, #14
```

### B166

```asm
ACALL LDELAY
```

### B167

```asm
DJNZ R7, Wait
```

### B168

Return to the instruction following the active call.

```asm
RET
```

### B169

```asm
mov p0,#01110000b
```

### B170

```asm
mov p0,#01110000b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,k1
```

## Section 18

```mermaid
flowchart TD
B170["B171: K2 - lines 444 to 446"]
B171["B172: instructions - lines 447 to 447"]
B172["B173: OVER1 - lines 449 to 452"]
B173["B174: instructions - lines 453 to 456"]
B174["B175: instructions - lines 457 to 460"]
B175["B176: instructions - lines 461 to 464"]
B176["B177: instructions - lines 465 to 465"]
B177["B178: ROW_0 - lines 466 to 467"]
B178["B179: ROW_1 - lines 468 to 469"]
B179["B180: ROW_2 - lines 470 to 471"]
B170 -->|condition true| B172
B170 -->|condition false| B171
B171 -->|jump| B170
B172 -->|condition true| B177
B172 -->|condition false| B173
B173 -->|condition true| B178
B173 -->|condition false| B174
B174 -->|condition true| B179
B174 -->|condition false| B175
B175 -->|condition true| B180
B175 -->|condition false| B176
B176 -->|jump| B170
B177 -->|jump| B181
B178 -->|jump| B181
B179 -->|jump| B181
B180["Continue at B181 in section 19"]
B181["Continue at B182 in section 19"]
```

### B171

```asm
mov a,p0
anl a,#01110000b
cjne a,#01110000b,over1
```

### B172

```asm
sjmp k2
```

### B173

```asm
mov p0,#01111110b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_0
```

### B174

```asm
mov p0,#01111101b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_1
```

### B175

```asm
mov p0,#01111011b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_2
```

### B176

```asm
mov p0,#01110111b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_3
```

### B177

```asm
ljmp k2
```

### B178

```asm
mov dptr,#kcode0
sjmp find
```

### B179

```asm
mov dptr,#kcode1
sjmp find
```

### B180

```asm
mov dptr,#kcode2
sjmp find
```

## Section 19

```mermaid
flowchart TD
B180["B181: ROW_3 - lines 472 to 472"]
B181["B182: FIND - lines 474 to 474"]
B182["B183: FIND1 - lines 476 to 477"]
B183["B184: instructions - lines 478 to 479"]
B184["B185: MATCH - lines 480 to 482"]
B180 -->|next| B181
B181 -->|next| B182
B182 -->|condition true| B184
B182 -->|condition false| B183
B183 -->|jump| B182
```

### B181

```asm
mov dptr,#kcode3
```

### B182

```asm
rlc a
```

### B183

```asm
rlc a
jnc match
```

### B184

```asm
inc dptr
sjmp find1
```

### B185

Return to the instruction following the active call.

```asm
clr a
movc a,@a+dptr
ret
```
