# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `org 0h` begins at B1.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 4 to 4"]
B1["B2: instructions - lines 7 to 7"]
B2["B3: instructions - lines 10 to 10"]
B3["B4: MAIN - lines 14 to 14"]
B4["B5: CHECK - lines 18 to 19"]
B5["B6: OP1 - lines 23 to 23"]
B6["B7: instructions - lines 26 to 27"]
B7["B8: DOWN1 - lines 29 to 29"]
B8["B9: instructions - lines 31 to 31"]
B9["B10: instructions - lines 32 to 32"]
B0 -->|call| B139
B0 -->|after return| B1
B1 -->|call| B30
B1 -->|after return| B2
B2 -->|call| B38
B2 -->|after return| B3
B3 -->|call| B46
B3 -->|after return| B4
B4 -->|condition true| B12
B4 -->|condition false| B5
B5 -->|call| B56
B5 -->|after return| B6
B6 -->|condition true| B7
B6 -->|condition false| B7
B7 -->|condition true| B10
B7 -->|condition false| B8
B8 -->|call| B82
B8 -->|after return| B9
B9 -->|jump| B5
B139["Continue at B140 in section 14"]
B30["Continue at B31 in section 4"]
B38["Continue at B39 in section 4"]
B46["Continue at B47 in section 5"]
B12["Continue at B13 in section 2"]
B56["Continue at B57 in section 6"]
B10["Continue at B11 in section 2"]
B82["Continue at B83 in section 9"]
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
acall main_menu
```

### B5

```asm
mov a, 30h
cjne a, #1, not1
```

### B6

```asm
acall enter_num
```

### B7

```asm
mov a, 40h
cjne a, #91h, down1
```

### B8

```asm
jc inrange_1
```

### B9

```asm
acall error
```

### B10

```asm
sjmp op1
```

## Section 2

```mermaid
flowchart TD
B10["B11: INRANGE_1 - lines 35 to 42"]
B11["B12: instructions - lines 43 to 43"]
B12["B13: NOT1 - lines 46 to 47"]
B13["B14: OP2 - lines 51 to 51"]
B14["B15: instructions - lines 54 to 55"]
B15["B16: DOWN2 - lines 57 to 57"]
B16["B17: instructions - lines 59 to 59"]
B17["B18: instructions - lines 60 to 60"]
B18["B19: INRANGE_2 - lines 63 to 65"]
B19["B20: BACK - lines 67 to 68"]
B10 -->|call| B92
B10 -->|after return| B11
B11 -->|jump| B3
B12 -->|condition true| B24
B12 -->|condition false| B13
B13 -->|call| B56
B13 -->|after return| B14
B14 -->|condition true| B15
B14 -->|condition false| B15
B15 -->|condition true| B18
B15 -->|condition false| B16
B16 -->|call| B82
B16 -->|after return| B17
B17 -->|jump| B13
B18 -->|next| B19
B19 -->|condition true| B21
B19 -->|condition false| B20
B92["Continue at B93 in section 10"]
B3["Continue at B4 in section 1"]
B24["Continue at B25 in section 3"]
B56["Continue at B57 in section 6"]
B82["Continue at B83 in section 9"]
B21["Continue at B22 in section 3"]
B20["Continue at B21 in section 3"]
```

### B11

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

### B12

```asm
ljmp main
```

### B13

```asm
mov a, 30h
cjne a, #2, not2
```

### B14

```asm
acall enter_num
```

### B15

```asm
mov a, 50h
cjne a, #91h, down2
```

### B16

```asm
jc inrange_2
```

### B17

```asm
acall error
```

### B18

```asm
sjmp op2
```

### B19

```asm
mov r0, #0
mov r1, #8
mov a, 50h
```

### B20

```asm
rrc a
jc skip
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 69 to 69"]
B21["B22: SKIP - lines 71 to 71"]
B22["B23: instructions - lines 72 to 74"]
B23["B24: instructions - lines 75 to 75"]
B24["B25: NOT2 - lines 78 to 79"]
B25["B26: OP3 - lines 81 to 81"]
B26["B27: instructions - lines 82 to 82"]
B27["B28: NOT3 - lines 85 to 85"]
B28["B29: instructions - lines 86 to 86"]
B29["B30: DONE - lines 90 to 90"]
B20 -->|next| B21
B21 -->|condition true| B19
B21 -->|condition false| B22
B22 -->|call| B100
B22 -->|after return| B23
B23 -->|jump| B3
B24 -->|condition true| B27
B24 -->|condition false| B25
B25 -->|call| B107
B25 -->|after return| B26
B26 -->|jump| B29
B27 -->|call| B113
B27 -->|after return| B28
B28 -->|jump| B3
B29 -->|jump| B29
B19["Continue at B20 in section 2"]
B100["Continue at B101 in section 11"]
B3["Continue at B4 in section 1"]
B107["Continue at B108 in section 11"]
B113["Continue at B114 in section 12"]
```

### B21

```asm
inc r0
```

### B22

```asm
djnz r1, back
```

### B23

```asm
mov a, r0
mov 51h, a
acall result_2
```

### B24

```asm
ljmp main
```

### B25

```asm
mov a, 30h
cjne a, #3, not3
```

### B26

```asm
acall exit_routine
```

### B27

```asm
sjmp done
```

### B28

```asm
acall invalid_choice
```

### B29

```asm
ljmp main
```

### B30

```asm
sjmp $
```

## Section 4

```mermaid
flowchart TD
B30["B31: WELCOME - lines 94 to 94"]
B31["B32: instructions - lines 95 to 96"]
B32["B33: instructions - lines 97 to 98"]
B33["B34: instructions - lines 99 to 100"]
B34["B35: instructions - lines 101 to 102"]
B35["B36: instructions - lines 103 to 103"]
B36["B37: instructions - lines 104 to 104"]
B37["B38: instructions - lines 105 to 105"]
B38["B39: NAME_ID - lines 109 to 109"]
B39["B40: instructions - lines 110 to 111"]
B30 -->|call| B139
B30 -->|after return| B31
B31 -->|call| B133
B31 -->|after return| B32
B32 -->|call| B146
B32 -->|after return| B33
B33 -->|call| B133
B33 -->|after return| B34
B34 -->|call| B146
B34 -->|after return| B35
B35 -->|call| B121
B35 -->|after return| B36
B36 -->|call| B151
B36 -->|after return| B37
B38 -->|call| B139
B38 -->|after return| B39
B39 -->|call| B133
B39 -->|after return| B40
B139["Continue at B140 in section 14"]
B133["Continue at B134 in section 14"]
B146["Continue at B147 in section 15"]
B121["Continue at B122 in section 13"]
B151["Continue at B152 in section 16"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
acall inlcd
```

### B32

```asm
mov a,#80h
acall cmd
```

### B33

```asm
mov dptr, #M11
acall wstr
```

### B34

```asm
mov a,#0c0h
acall cmd
```

### B35

```asm
mov dptr, #M12
acall wstr
```

### B36

```asm
acall delay
```

### B37

```asm
acall clear
```

### B38

Return to the instruction following the active call.

```asm
ret
```

### B39

```asm
acall inlcd
```

### B40

```asm
mov a,#80h
acall cmd
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 112 to 113"]
B41["B42: instructions - lines 114 to 115"]
B42["B43: instructions - lines 116 to 117"]
B43["B44: instructions - lines 118 to 118"]
B44["B45: instructions - lines 119 to 119"]
B45["B46: instructions - lines 120 to 120"]
B46["B47: MAIN_MENU - lines 124 to 124"]
B47["B48: instructions - lines 125 to 126"]
B48["B49: instructions - lines 127 to 128"]
B49["B50: instructions - lines 129 to 130"]
B40 -->|call| B146
B40 -->|after return| B41
B41 -->|call| B133
B41 -->|after return| B42
B42 -->|call| B146
B42 -->|after return| B43
B43 -->|call| B121
B43 -->|after return| B44
B44 -->|call| B151
B44 -->|after return| B45
B46 -->|call| B139
B46 -->|after return| B47
B47 -->|call| B133
B47 -->|after return| B48
B48 -->|call| B146
B48 -->|after return| B49
B49 -->|call| B133
B49 -->|after return| B50
B146["Continue at B147 in section 15"]
B133["Continue at B134 in section 14"]
B121["Continue at B122 in section 13"]
B151["Continue at B152 in section 16"]
B139["Continue at B140 in section 14"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
mov dptr, #M21
acall wstr
```

### B42

```asm
mov a,#0c0h
acall cmd
```

### B43

```asm
mov dptr, #M22
acall wstr
```

### B44

```asm
acall delay
```

### B45

```asm
acall clear
```

### B46

Return to the instruction following the active call.

```asm
ret
```

### B47

```asm
acall inlcd
```

### B48

```asm
mov a,#80h
acall cmd
```

### B49

```asm
mov dptr, #M31
acall wstr
```

### B50

```asm
mov a,#0c0h
acall cmd
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 131 to 132"]
B51["B52: instructions - lines 134 to 134"]
B52["B53: instructions - lines 135 to 135"]
B53["B54: instructions - lines 136 to 139"]
B54["B55: instructions - lines 140 to 140"]
B55["B56: instructions - lines 141 to 141"]
B56["B57: ENTER_NUM - lines 145 to 145"]
B57["B58: instructions - lines 146 to 147"]
B58["B59: instructions - lines 148 to 149"]
B59["B60: instructions - lines 150 to 151"]
B50 -->|call| B146
B50 -->|after return| B51
B51 -->|call| B156
B51 -->|after return| B52
B52 -->|call| B128
B52 -->|after return| B53
B53 -->|call| B121
B53 -->|after return| B54
B54 -->|call| B151
B54 -->|after return| B55
B56 -->|call| B139
B56 -->|after return| B57
B57 -->|call| B133
B57 -->|after return| B58
B58 -->|call| B146
B58 -->|after return| B59
B59 -->|call| B133
B59 -->|after return| B60
B146["Continue at B147 in section 15"]
B156["Continue at B157 in section 16"]
B128["Continue at B129 in section 13"]
B121["Continue at B122 in section 13"]
B151["Continue at B152 in section 16"]
B139["Continue at B140 in section 14"]
B133["Continue at B134 in section 14"]
B60["Continue at B61 in section 7"]
```

### B51

```asm
mov dptr, #M32
acall wstr
```

### B52

```asm
acall keypad
```

### B53

```asm
acall wchr
```

### B54

```asm
subb a, #30h
mov 30h, a
acall delay
```

### B55

```asm
acall clear
```

### B56

Return to the instruction following the active call.

```asm
ret
```

### B57

```asm
acall inlcd
```

### B58

```asm
mov a,#80h
acall cmd
```

### B59

```asm
mov dptr, #M41
acall wstr
```

### B60

```asm
mov a,#0c0h
acall cmd
```

## Section 7

```mermaid
flowchart TD
B60["B61: instructions - lines 152 to 153"]
B61["B62: instructions - lines 155 to 155"]
B62["B63: instructions - lines 156 to 156"]
B63["B64: instructions - lines 157 to 157"]
B64["B65: instructions - lines 158 to 158"]
B65["B66: instructions - lines 159 to 159"]
B66["B67: NO_STAR - lines 161 to 161"]
B67["B68: instructions - lines 162 to 162"]
B68["B69: instructions - lines 163 to 163"]
B69["B70: instructions - lines 164 to 164"]
B60 -->|call| B146
B60 -->|after return| B61
B61 -->|call| B156
B61 -->|after return| B62
B62 -->|call| B128
B62 -->|after return| B63
B63 -->|condition true| B66
B63 -->|condition false| B64
B64 -->|call| B82
B64 -->|after return| B65
B65 -->|jump| B56
B66 -->|condition true| B70
B66 -->|condition false| B67
B67 -->|call| B151
B67 -->|after return| B68
B68 -->|call| B82
B68 -->|after return| B69
B69 -->|jump| B56
B146["Continue at B147 in section 15"]
B156["Continue at B157 in section 16"]
B128["Continue at B129 in section 13"]
B82["Continue at B83 in section 9"]
B56["Continue at B57 in section 6"]
B70["Continue at B71 in section 8"]
B151["Continue at B152 in section 16"]
```

### B61

```asm
mov dptr, #M42
acall wstr
```

### B62

```asm
acall keypad
```

### B63

```asm
acall wchr
```

### B64

```asm
cjne a,#'*',no_star
```

### B65

```asm
acall error
```

### B66

```asm
sjmp enter_num
```

### B67

```asm
cjne a,#'#',no_hash
```

### B68

```asm
acall clear
```

### B69

```asm
acall error
```

### B70

```asm
sjmp enter_num
```

## Section 8

```mermaid
flowchart TD
B70["B71: NO_HASH - lines 166 to 169"]
B71["B72: instructions - lines 170 to 170"]
B72["B73: instructions - lines 171 to 171"]
B73["B74: instructions - lines 172 to 172"]
B74["B75: instructions - lines 173 to 173"]
B75["B76: instructions - lines 174 to 174"]
B76["B77: NO_STAR2 - lines 176 to 176"]
B77["B78: instructions - lines 177 to 177"]
B78["B79: instructions - lines 178 to 178"]
B79["B80: NO_HASH2 - lines 180 to 188"]
B70 -->|call| B156
B70 -->|after return| B71
B71 -->|call| B128
B71 -->|after return| B72
B72 -->|condition true| B76
B72 -->|condition false| B73
B73 -->|call| B151
B73 -->|after return| B74
B74 -->|call| B82
B74 -->|after return| B75
B75 -->|jump| B56
B76 -->|condition true| B79
B76 -->|condition false| B77
B77 -->|call| B82
B77 -->|after return| B78
B78 -->|jump| B56
B79 -->|call| B121
B79 -->|after return| B80
B156["Continue at B157 in section 16"]
B128["Continue at B129 in section 13"]
B151["Continue at B152 in section 16"]
B82["Continue at B83 in section 9"]
B56["Continue at B57 in section 6"]
B121["Continue at B122 in section 13"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
subb a, #30h
mov 41h, a
acall keypad
```

### B72

```asm
acall wchr
```

### B73

```asm
cjne a,#'*',no_star2
```

### B74

```asm
acall clear
```

### B75

```asm
acall error
```

### B76

```asm
sjmp enter_num
```

### B77

```asm
cjne a,#'#',no_hash2
```

### B78

```asm
acall error
```

### B79

```asm
sjmp enter_num
```

### B80

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

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 189 to 189"]
B81["B82: instructions - lines 190 to 190"]
B82["B83: ERROR - lines 194 to 194"]
B83["B84: instructions - lines 195 to 196"]
B84["B85: instructions - lines 197 to 198"]
B85["B86: instructions - lines 199 to 200"]
B86["B87: instructions - lines 201 to 202"]
B87["B88: instructions - lines 205 to 209"]
B88["B89: FR - lines 211 to 211"]
B89["B90: instructions - lines 212 to 212"]
B80 -->|call| B151
B80 -->|after return| B81
B82 -->|call| B139
B82 -->|after return| B83
B83 -->|call| B133
B83 -->|after return| B84
B84 -->|call| B146
B84 -->|after return| B85
B85 -->|call| B133
B85 -->|after return| B86
B86 -->|call| B146
B86 -->|after return| B87
B87 -->|next| B88
B88 -->|call| B121
B88 -->|after return| B89
B89 -->|condition true| B88
B89 -->|condition false| B90
B151["Continue at B152 in section 16"]
B139["Continue at B140 in section 14"]
B133["Continue at B134 in section 14"]
B146["Continue at B147 in section 15"]
B121["Continue at B122 in section 13"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
acall clear
```

### B82

Return to the instruction following the active call.

```asm
ret
```

### B83

```asm
acall inlcd
```

### B84

```asm
mov a,#80h
acall cmd
```

### B85

```asm
mov dptr, #M61
acall wstr
```

### B86

```asm
mov a,#0c0h
acall cmd
```

### B87

```asm
mov dptr, #M62
acall wstr
```

### B88

```asm
mov p1, #0ffh
clr p1.0
clr p1.3
clr p1.6
mov r6, #2
```

### B89

```asm
acall delay
```

### B90

```asm
djnz r6, fr
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 213 to 214"]
B91["B92: instructions - lines 215 to 215"]
B92["B93: RESULT_1 - lines 219 to 219"]
B93["B94: instructions - lines 220 to 221"]
B94["B95: instructions - lines 222 to 223"]
B95["B96: instructions - lines 225 to 229"]
B96["B97: instructions - lines 231 to 233"]
B97["B98: instructions - lines 235 to 235"]
B98["B99: instructions - lines 236 to 236"]
B99["B100: instructions - lines 237 to 237"]
B90 -->|call| B151
B90 -->|after return| B91
B92 -->|call| B139
B92 -->|after return| B93
B93 -->|call| B133
B93 -->|after return| B94
B94 -->|call| B146
B94 -->|after return| B95
B95 -->|call| B128
B95 -->|after return| B96
B96 -->|call| B128
B96 -->|after return| B97
B97 -->|call| B121
B97 -->|after return| B98
B98 -->|call| B151
B98 -->|after return| B99
B151["Continue at B152 in section 16"]
B139["Continue at B140 in section 14"]
B133["Continue at B134 in section 14"]
B146["Continue at B147 in section 15"]
B128["Continue at B129 in section 13"]
B121["Continue at B122 in section 13"]
```

### B91

```asm
mov p1, #0ffh
acall clear
```

### B92

Return to the instruction following the active call.

```asm
ret
```

### B93

```asm
acall inlcd
```

### B94

```asm
mov a,#80h
acall cmd
```

### B95

```asm
mov dptr, #M5
acall wstr
```

### B96

```asm
mov a, 41h
mov b, #10h
div ab
add a, #30h
acall wchr
```

### B97

```asm
mov a, b
add a, #30h
acall wchr
```

### B98

```asm
acall delay
```

### B99

```asm
acall clear
```

### B100

Return to the instruction following the active call.

```asm
ret
```

## Section 11

```mermaid
flowchart TD
B100["B101: RESULT_2 - lines 241 to 241"]
B101["B102: instructions - lines 242 to 243"]
B102["B103: instructions - lines 244 to 245"]
B103["B104: instructions - lines 247 to 249"]
B104["B105: instructions - lines 251 to 251"]
B105["B106: instructions - lines 252 to 252"]
B106["B107: instructions - lines 253 to 253"]
B107["B108: EXIT_ROUTINE - lines 257 to 257"]
B108["B109: instructions - lines 258 to 259"]
B109["B110: instructions - lines 260 to 261"]
B100 -->|call| B139
B100 -->|after return| B101
B101 -->|call| B133
B101 -->|after return| B102
B102 -->|call| B146
B102 -->|after return| B103
B103 -->|call| B128
B103 -->|after return| B104
B104 -->|call| B121
B104 -->|after return| B105
B105 -->|call| B151
B105 -->|after return| B106
B107 -->|call| B139
B107 -->|after return| B108
B108 -->|call| B133
B108 -->|after return| B109
B109 -->|call| B146
B109 -->|after return| B110
B139["Continue at B140 in section 14"]
B133["Continue at B134 in section 14"]
B146["Continue at B147 in section 15"]
B128["Continue at B129 in section 13"]
B121["Continue at B122 in section 13"]
B151["Continue at B152 in section 16"]
B110["Continue at B111 in section 12"]
```

### B101

```asm
acall inlcd
```

### B102

```asm
mov a,#80h
acall cmd
```

### B103

```asm
mov dptr, #M7
acall wstr
```

### B104

```asm
mov a, 51h
add a, #30h
acall wchr
```

### B105

```asm
acall delay
```

### B106

```asm
acall clear
```

### B107

Return to the instruction following the active call.

```asm
ret
```

### B108

```asm
acall inlcd
```

### B109

```asm
mov a,#80h
acall cmd
```

### B110

```asm
mov dptr, #M9
acall wstr
```

## Section 12

```mermaid
flowchart TD
B110["B111: instructions - lines 262 to 262"]
B111["B112: instructions - lines 263 to 263"]
B112["B113: instructions - lines 264 to 264"]
B113["B114: INVALID_CHOICE - lines 270 to 270"]
B114["B115: instructions - lines 271 to 272"]
B115["B116: instructions - lines 273 to 274"]
B116["B117: instructions - lines 277 to 281"]
B117["B118: FR2 - lines 283 to 283"]
B118["B119: instructions - lines 284 to 284"]
B119["B120: instructions - lines 285 to 286"]
B110 -->|call| B121
B110 -->|after return| B111
B111 -->|call| B151
B111 -->|after return| B112
B113 -->|call| B139
B113 -->|after return| B114
B114 -->|call| B133
B114 -->|after return| B115
B115 -->|call| B146
B115 -->|after return| B116
B116 -->|next| B117
B117 -->|call| B121
B117 -->|after return| B118
B118 -->|condition true| B117
B118 -->|condition false| B119
B119 -->|call| B151
B119 -->|after return| B120
B121["Continue at B122 in section 13"]
B151["Continue at B152 in section 16"]
B139["Continue at B140 in section 14"]
B133["Continue at B134 in section 14"]
B146["Continue at B147 in section 15"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
acall delay
```

### B112

```asm
acall clear
```

### B113

Return to the instruction following the active call.

```asm
ret
```

### B114

```asm
acall inlcd
```

### B115

```asm
mov a,#80h
acall cmd
```

### B116

```asm
mov dptr, #M10
acall wstr
```

### B117

```asm
mov p1, #0ffh
clr p1.0
clr p1.3
clr p1.6
mov r6, #2
```

### B118

```asm
acall delay
```

### B119

```asm
djnz r6, fr2
```

### B120

```asm
mov p1, #0ffh
acall clear
```

## Section 13

```mermaid
flowchart TD
B120["B121: instructions - lines 287 to 287"]
B121["B122: DELAY - lines 292 to 292"]
B122["B123: X3 - lines 293 to 293"]
B123["B124: X2 - lines 294 to 294"]
B124["B125: X1 - lines 295 to 295"]
B125["B126: instructions - lines 296 to 296"]
B126["B127: instructions - lines 297 to 297"]
B127["B128: instructions - lines 298 to 298"]
B128["B129: WCHR - lines 303 to 307"]
B129["B130: instructions - lines 308 to 308"]
B121 -->|next| B122
B122 -->|next| B123
B123 -->|next| B124
B124 -->|condition true| B124
B124 -->|condition false| B125
B125 -->|condition true| B123
B125 -->|condition false| B126
B126 -->|condition true| B122
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

Return to the instruction following the active call.

```asm
ret
```

### B122

```asm
mov r5, #2
```

### B123

```asm
mov r4, #200
```

### B124

```asm
mov r3, #150
```

### B125

```asm
djnz r3,x1
```

### B126

```asm
djnz r4,x2
```

### B127

```asm
djnz r5,x3
```

### B128

Return to the instruction following the active call.

```asm
ret
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
B130["B131: instructions - lines 309 to 311"]
B131["B132: instructions - lines 312 to 312"]
B132["B133: instructions - lines 313 to 315"]
B133["B134: CMD - lines 319 to 321"]
B134["B135: instructions - lines 322 to 322"]
B135["B136: instructions - lines 323 to 325"]
B136["B137: instructions - lines 326 to 326"]
B137["B138: instructions - lines 327 to 327"]
B138["B139: COMMON - lines 331 to 336"]
B139["B140: INLCD - lines 340 to 347"]
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
B140["B141: instructions - lines 348 to 356"]
B141["B142: instructions - lines 357 to 369"]
B142["B143: instructions - lines 370 to 380"]
B143["B144: instructions - lines 381 to 381"]
B144["B145: LDELAY - lines 385 to 386"]
B145["B146: instructions - lines 387 to 387"]
B146["B147: WSTR - lines 391 to 391"]
B147["B148: CONT1 - lines 393 to 395"]
B148["B149: PRINT - lines 397 to 397"]
B149["B150: instructions - lines 398 to 399"]
B140 -->|call| B144
B140 -->|after return| B141
B141 -->|call| B144
B141 -->|after return| B142
B142 -->|call| B144
B142 -->|after return| B143
B144 -->|condition true| B144
B144 -->|condition false| B145
B146 -->|next| B147
B147 -->|condition true| B150
B147 -->|condition false| B148
B148 -->|call| B128
B148 -->|after return| B149
B149 -->|jump| B147
B150["Continue at B151 in section 16"]
B128["Continue at B129 in section 13"]
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
PUSH ACC
```

### B148

```asm
CLR A
MOVC A,@A+DPTR
JZ Exit1
```

### B149

```asm
ACALL WCHR
```

### B150

```asm
INC DPTR
AJMP CONT1
```

## Section 16

```mermaid
flowchart TD
B150["B151: EXIT1 - lines 401 to 402"]
B151["B152: CLEAR - lines 406 to 407"]
B152["B153: instructions - lines 408 to 408"]
B153["B154: WAIT - lines 410 to 410"]
B154["B155: instructions - lines 411 to 411"]
B155["B156: instructions - lines 412 to 412"]
B156["B157: KEYPAD - lines 416 to 416"]
B157["B158: K1 - lines 417 to 420"]
B158["B159: K2 - lines 422 to 424"]
B159["B160: instructions - lines 425 to 425"]
B151 -->|call| B133
B151 -->|after return| B152
B152 -->|next| B153
B153 -->|call| B144
B153 -->|after return| B154
B154 -->|condition true| B153
B154 -->|condition false| B155
B156 -->|next| B157
B157 -->|condition true| B157
B157 -->|condition false| B158
B158 -->|condition true| B160
B158 -->|condition false| B159
B159 -->|jump| B158
B133["Continue at B134 in section 14"]
B144["Continue at B145 in section 15"]
B160["Continue at B161 in section 17"]
```

### B151

Return to the instruction following the active call.

```asm
POP ACC
RET
```

### B152

```asm
MOV A, #01H
ACALL CMD
```

### B153

```asm
MOV R7, #14
```

### B154

```asm
ACALL LDELAY
```

### B155

```asm
DJNZ R7, Wait
```

### B156

Return to the instruction following the active call.

```asm
RET
```

### B157

```asm
mov p0,#01110000b
```

### B158

```asm
mov p0,#01110000b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,k1
```

### B159

```asm
mov a,p0
anl a,#01110000b
cjne a,#01110000b,over1
```

### B160

```asm
sjmp k2
```

## Section 17

```mermaid
flowchart TD
B160["B161: OVER1 - lines 427 to 430"]
B161["B162: instructions - lines 431 to 434"]
B162["B163: instructions - lines 435 to 438"]
B163["B164: instructions - lines 439 to 442"]
B164["B165: instructions - lines 443 to 443"]
B165["B166: ROW_0 - lines 444 to 445"]
B166["B167: ROW_1 - lines 446 to 447"]
B167["B168: ROW_2 - lines 448 to 449"]
B168["B169: ROW_3 - lines 450 to 450"]
B169["B170: FIND - lines 452 to 452"]
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
mov p0,#01111110b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_0
```

### B162

```asm
mov p0,#01111101b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_1
```

### B163

```asm
mov p0,#01111011b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_2
```

### B164

```asm
mov p0,#01110111b
mov a,p0
anl a,#01110000b
cjne a,#01110000b,row_3
```

### B165

```asm
ljmp k2
```

### B166

```asm
mov dptr,#kcode0
sjmp find
```

### B167

```asm
mov dptr,#kcode1
sjmp find
```

### B168

```asm
mov dptr,#kcode2
sjmp find
```

### B169

```asm
mov dptr,#kcode3
```

### B170

```asm
rlc a
```

## Section 18

```mermaid
flowchart TD
B170["B171: FIND1 - lines 454 to 455"]
B171["B172: instructions - lines 456 to 457"]
B172["B173: MATCH - lines 458 to 460"]
B170 -->|condition true| B172
B170 -->|condition false| B171
B171 -->|jump| B170
```

### B171

```asm
rlc a
jnc match
```

### B172

```asm
inc dptr
sjmp find1
```

### B173

Return to the instruction following the active call.

```asm
clr a
movc a,@a+dptr
ret
```
