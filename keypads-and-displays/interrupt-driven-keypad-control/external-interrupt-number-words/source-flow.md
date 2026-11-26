# Program Control Flow

[Back to project](README.md)

Control-flow blocks are indexed by source line. Calls resume at the instruction following the call if the subroutine returns normally.

## Entry locations

- `ORG 0H` begins at B1.
- `ORG 0013H` begins at B2.

## Navigation

[Section 1](#section-1) · [Section 2](#section-2) · [Section 3](#section-3) · [Section 4](#section-4) · [Section 5](#section-5) · [Section 6](#section-6) · [Section 7](#section-7) · [Section 8](#section-8) · [Section 9](#section-9) · [Section 10](#section-10) · [Section 11](#section-11) · [Section 12](#section-12) · [Section 13](#section-13) · [Section 14](#section-14) · [Section 15](#section-15) · [Section 16](#section-16) · [Section 17](#section-17) · [Section 18](#section-18)

## Section 1

```mermaid
flowchart TD
B0["B1: instructions - lines 7 to 7"]
B1["B2: instructions - lines 11 to 11"]
B2["B3: instructions - lines 12 to 12"]
B3["B4: instructions - lines 13 to 14"]
B4["B5: instructions - lines 15 to 16"]
B5["B6: instructions - lines 17 to 18"]
B6["B7: instructions - lines 19 to 19"]
B7["B8: instructions - lines 20 to 21"]
B8["B9: instructions - lines 22 to 22"]
B9["B10: instructions - lines 23 to 24"]
B0 -->|jump| B110
B1 -->|call| B127
B1 -->|after return| B2
B2 -->|condition true| B12
B2 -->|condition false| B3
B3 -->|call| B163
B3 -->|after return| B4
B4 -->|call| B115
B4 -->|after return| B5
B5 -->|call| B115
B5 -->|after return| B6
B6 -->|call| B122
B6 -->|after return| B7
B7 -->|call| B115
B7 -->|after return| B8
B8 -->|call| B122
B8 -->|after return| B9
B9 -->|call| B115
B9 -->|after return| B10
B110["Continue at B111 in section 12"]
B127["Continue at B128 in section 13"]
B12["Continue at B13 in section 2"]
B163["Continue at B164 in section 17"]
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
B10["Continue at B11 in section 2"]
```

### B1

```asm
LJMP MAIN
```

### B2

```asm
ACALL KEY
```

### B3

```asm
CJNE A,#31H,N1
```

### B4

```asm
MOV A,#1
ACALL WRCMD
```

### B5

```asm
MOV A,#0DH
ACALL COUT
```

### B6

```asm
MOV A,#"O"
ACALL COUT
```

### B7

```asm
ACALL WRDATA
```

### B8

```asm
MOV A,#"N"
ACALL COUT
```

### B9

```asm
ACALL WRDATA
```

### B10

```asm
MOV A,#"E"
ACALL COUT
```

## Section 2

```mermaid
flowchart TD
B10["B11: instructions - lines 25 to 25"]
B11["B12: instructions - lines 26 to 26"]
B12["B13: N1 - lines 29 to 29"]
B13["B14: instructions - lines 30 to 31"]
B14["B15: instructions - lines 32 to 33"]
B15["B16: instructions - lines 34 to 35"]
B16["B17: instructions - lines 36 to 36"]
B17["B18: instructions - lines 37 to 38"]
B18["B19: instructions - lines 39 to 39"]
B19["B20: instructions - lines 40 to 41"]
B10 -->|call| B122
B10 -->|after return| B11
B11 -->|jump| B109
B12 -->|condition true| B22
B12 -->|condition false| B13
B13 -->|call| B163
B13 -->|after return| B14
B14 -->|call| B115
B14 -->|after return| B15
B15 -->|call| B115
B15 -->|after return| B16
B16 -->|call| B122
B16 -->|after return| B17
B17 -->|call| B115
B17 -->|after return| B18
B18 -->|call| B122
B18 -->|after return| B19
B19 -->|call| B115
B19 -->|after return| B20
B122["Continue at B123 in section 13"]
B109["Continue at B110 in section 11"]
B22["Continue at B23 in section 3"]
B163["Continue at B164 in section 17"]
B115["Continue at B116 in section 12"]
B20["Continue at B21 in section 3"]
```

### B11

```asm
ACALL WRDATA
```

### B12

```asm
LJMP  N9
```

### B13

```asm
CJNE A,#32H,N2
```

### B14

```asm
MOV A,#1
ACALL WRCMD
```

### B15

```asm
MOV A,#0DH
ACALL COUT
```

### B16

```asm
MOV A,#"T"
ACALL COUT
```

### B17

```asm
ACALL WRDATA
```

### B18

```asm
MOV A,#"W"
ACALL COUT
```

### B19

```asm
ACALL WRDATA
```

### B20

```asm
MOV A,#"O"
ACALL COUT
```

## Section 3

```mermaid
flowchart TD
B20["B21: instructions - lines 42 to 42"]
B21["B22: instructions - lines 43 to 43"]
B22["B23: N2 - lines 46 to 46"]
B23["B24: instructions - lines 47 to 48"]
B24["B25: instructions - lines 49 to 50"]
B25["B26: instructions - lines 51 to 52"]
B26["B27: instructions - lines 53 to 53"]
B27["B28: instructions - lines 54 to 55"]
B28["B29: instructions - lines 56 to 56"]
B29["B30: instructions - lines 57 to 58"]
B20 -->|call| B122
B20 -->|after return| B21
B21 -->|jump| B109
B22 -->|condition true| B36
B22 -->|condition false| B23
B23 -->|call| B163
B23 -->|after return| B24
B24 -->|call| B115
B24 -->|after return| B25
B25 -->|call| B115
B25 -->|after return| B26
B26 -->|call| B122
B26 -->|after return| B27
B27 -->|call| B115
B27 -->|after return| B28
B28 -->|call| B122
B28 -->|after return| B29
B29 -->|call| B115
B29 -->|after return| B30
B122["Continue at B123 in section 13"]
B109["Continue at B110 in section 11"]
B36["Continue at B37 in section 4"]
B163["Continue at B164 in section 17"]
B115["Continue at B116 in section 12"]
B30["Continue at B31 in section 4"]
```

### B21

```asm
ACALL WRDATA
```

### B22

```asm
AJMP  N9
```

### B23

```asm
CJNE A,#33H,N3
```

### B24

```asm
MOV A,#1
ACALL WRCMD
```

### B25

```asm
MOV A,#0DH
ACALL COUT
```

### B26

```asm
MOV A,#"T"
ACALL COUT
```

### B27

```asm
ACALL WRDATA
```

### B28

```asm
MOV A,#"H"
ACALL COUT
```

### B29

```asm
ACALL WRDATA
```

### B30

```asm
MOV A,#"R"
ACALL COUT
```

## Section 4

```mermaid
flowchart TD
B30["B31: instructions - lines 59 to 59"]
B31["B32: instructions - lines 60 to 61"]
B32["B33: instructions - lines 62 to 62"]
B33["B34: instructions - lines 63 to 64"]
B34["B35: instructions - lines 65 to 65"]
B35["B36: instructions - lines 66 to 66"]
B36["B37: N3 - lines 69 to 69"]
B37["B38: instructions - lines 70 to 71"]
B38["B39: instructions - lines 72 to 73"]
B39["B40: instructions - lines 74 to 75"]
B30 -->|call| B122
B30 -->|after return| B31
B31 -->|call| B115
B31 -->|after return| B32
B32 -->|call| B122
B32 -->|after return| B33
B33 -->|call| B115
B33 -->|after return| B34
B34 -->|call| B122
B34 -->|after return| B35
B35 -->|jump| B109
B36 -->|condition true| B48
B36 -->|condition false| B37
B37 -->|call| B163
B37 -->|after return| B38
B38 -->|call| B115
B38 -->|after return| B39
B39 -->|call| B115
B39 -->|after return| B40
B122["Continue at B123 in section 13"]
B115["Continue at B116 in section 12"]
B109["Continue at B110 in section 11"]
B48["Continue at B49 in section 5"]
B163["Continue at B164 in section 17"]
B40["Continue at B41 in section 5"]
```

### B31

```asm
ACALL WRDATA
```

### B32

```asm
MOV A,#"E"
ACALL COUT
```

### B33

```asm
ACALL WRDATA
```

### B34

```asm
MOV A,#"E"
ACALL COUT
```

### B35

```asm
ACALL WRDATA
```

### B36

```asm
AJMP  N9
```

### B37

```asm
CJNE A,#34H,N4
```

### B38

```asm
MOV A,#1
ACALL WRCMD
```

### B39

```asm
MOV A,#0DH
ACALL COUT
```

### B40

```asm
MOV A,#"F"
ACALL COUT
```

## Section 5

```mermaid
flowchart TD
B40["B41: instructions - lines 76 to 76"]
B41["B42: instructions - lines 77 to 78"]
B42["B43: instructions - lines 79 to 79"]
B43["B44: instructions - lines 80 to 81"]
B44["B45: instructions - lines 82 to 82"]
B45["B46: instructions - lines 83 to 84"]
B46["B47: instructions - lines 85 to 85"]
B47["B48: instructions - lines 86 to 86"]
B48["B49: N4 - lines 89 to 89"]
B49["B50: instructions - lines 90 to 91"]
B40 -->|call| B122
B40 -->|after return| B41
B41 -->|call| B115
B41 -->|after return| B42
B42 -->|call| B122
B42 -->|after return| B43
B43 -->|call| B115
B43 -->|after return| B44
B44 -->|call| B122
B44 -->|after return| B45
B45 -->|call| B115
B45 -->|after return| B46
B46 -->|call| B122
B46 -->|after return| B47
B47 -->|jump| B109
B48 -->|condition true| B60
B48 -->|condition false| B49
B49 -->|call| B163
B49 -->|after return| B50
B122["Continue at B123 in section 13"]
B115["Continue at B116 in section 12"]
B109["Continue at B110 in section 11"]
B60["Continue at B61 in section 7"]
B163["Continue at B164 in section 17"]
B50["Continue at B51 in section 6"]
```

### B41

```asm
ACALL WRDATA
```

### B42

```asm
MOV A,#"O"
ACALL COUT
```

### B43

```asm
ACALL WRDATA
```

### B44

```asm
MOV A,#"U"
ACALL COUT
```

### B45

```asm
ACALL WRDATA
```

### B46

```asm
MOV A,#"R"
ACALL COUT
```

### B47

```asm
ACALL WRDATA
```

### B48

```asm
AJMP  N9
```

### B49

```asm
CJNE A,#35H,N5
```

### B50

```asm
MOV A,#1
ACALL WRCMD
```

## Section 6

```mermaid
flowchart TD
B50["B51: instructions - lines 92 to 93"]
B51["B52: instructions - lines 94 to 95"]
B52["B53: instructions - lines 96 to 96"]
B53["B54: instructions - lines 97 to 98"]
B54["B55: instructions - lines 99 to 99"]
B55["B56: instructions - lines 100 to 101"]
B56["B57: instructions - lines 102 to 102"]
B57["B58: instructions - lines 103 to 104"]
B58["B59: instructions - lines 105 to 105"]
B59["B60: instructions - lines 106 to 106"]
B50 -->|call| B115
B50 -->|after return| B51
B51 -->|call| B115
B51 -->|after return| B52
B52 -->|call| B122
B52 -->|after return| B53
B53 -->|call| B115
B53 -->|after return| B54
B54 -->|call| B122
B54 -->|after return| B55
B55 -->|call| B115
B55 -->|after return| B56
B56 -->|call| B122
B56 -->|after return| B57
B57 -->|call| B115
B57 -->|after return| B58
B58 -->|call| B122
B58 -->|after return| B59
B59 -->|jump| B109
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
B109["Continue at B110 in section 11"]
```

### B51

```asm
MOV A,#0DH
ACALL COUT
```

### B52

```asm
MOV A,#"F"
ACALL COUT
```

### B53

```asm
ACALL WRDATA
```

### B54

```asm
MOV A,#"I"
ACALL COUT
```

### B55

```asm
ACALL WRDATA
```

### B56

```asm
MOV A,#"V"
ACALL COUT
```

### B57

```asm
ACALL WRDATA
```

### B58

```asm
MOV A,#"E"
ACALL COUT
```

### B59

```asm
ACALL WRDATA
```

### B60

```asm
AJMP  N9
```

## Section 7

```mermaid
flowchart TD
B60["B61: N5 - lines 109 to 109"]
B61["B62: instructions - lines 110 to 111"]
B62["B63: instructions - lines 112 to 113"]
B63["B64: instructions - lines 114 to 115"]
B64["B65: instructions - lines 116 to 116"]
B65["B66: instructions - lines 117 to 118"]
B66["B67: instructions - lines 119 to 119"]
B67["B68: instructions - lines 120 to 121"]
B68["B69: instructions - lines 122 to 122"]
B69["B70: instructions - lines 123 to 123"]
B60 -->|condition true| B70
B60 -->|condition false| B61
B61 -->|call| B163
B61 -->|after return| B62
B62 -->|call| B115
B62 -->|after return| B63
B63 -->|call| B115
B63 -->|after return| B64
B64 -->|call| B122
B64 -->|after return| B65
B65 -->|call| B115
B65 -->|after return| B66
B66 -->|call| B122
B66 -->|after return| B67
B67 -->|call| B115
B67 -->|after return| B68
B68 -->|call| B122
B68 -->|after return| B69
B69 -->|jump| B109
B70["Continue at B71 in section 8"]
B163["Continue at B164 in section 17"]
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
B109["Continue at B110 in section 11"]
```

### B61

```asm
CJNE A,#36H,N6
```

### B62

```asm
MOV A,#1
ACALL WRCMD
```

### B63

```asm
MOV A,#0DH
ACALL COUT
```

### B64

```asm
MOV A,#"S"
ACALL COUT
```

### B65

```asm
ACALL WRDATA
```

### B66

```asm
MOV A,#"I"
ACALL COUT
```

### B67

```asm
ACALL WRDATA
```

### B68

```asm
MOV A,#"X"
ACALL COUT
```

### B69

```asm
ACALL WRDATA
```

### B70

```asm
AJMP  N9
```

## Section 8

```mermaid
flowchart TD
B70["B71: N6 - lines 126 to 126"]
B71["B72: instructions - lines 127 to 128"]
B72["B73: instructions - lines 129 to 130"]
B73["B74: instructions - lines 131 to 132"]
B74["B75: instructions - lines 133 to 133"]
B75["B76: instructions - lines 134 to 135"]
B76["B77: instructions - lines 136 to 136"]
B77["B78: instructions - lines 137 to 138"]
B78["B79: instructions - lines 139 to 139"]
B79["B80: instructions - lines 140 to 141"]
B70 -->|condition true| B84
B70 -->|condition false| B71
B71 -->|call| B163
B71 -->|after return| B72
B72 -->|call| B115
B72 -->|after return| B73
B73 -->|call| B115
B73 -->|after return| B74
B74 -->|call| B122
B74 -->|after return| B75
B75 -->|call| B115
B75 -->|after return| B76
B76 -->|call| B122
B76 -->|after return| B77
B77 -->|call| B115
B77 -->|after return| B78
B78 -->|call| B122
B78 -->|after return| B79
B79 -->|call| B115
B79 -->|after return| B80
B84["Continue at B85 in section 9"]
B163["Continue at B164 in section 17"]
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
B80["Continue at B81 in section 9"]
```

### B71

```asm
CJNE A,#37H,N7
```

### B72

```asm
MOV A,#1
ACALL WRCMD
```

### B73

```asm
MOV A,#0DH
ACALL COUT
```

### B74

```asm
MOV A,#"S"
ACALL COUT
```

### B75

```asm
ACALL WRDATA
```

### B76

```asm
MOV A,#"E"
ACALL COUT
```

### B77

```asm
ACALL WRDATA
```

### B78

```asm
MOV A,#"V"
ACALL COUT
```

### B79

```asm
ACALL WRDATA
```

### B80

```asm
MOV A,#"E"
ACALL COUT
```

## Section 9

```mermaid
flowchart TD
B80["B81: instructions - lines 142 to 142"]
B81["B82: instructions - lines 143 to 144"]
B82["B83: instructions - lines 145 to 145"]
B83["B84: instructions - lines 146 to 146"]
B84["B85: N7 - lines 149 to 149"]
B85["B86: instructions - lines 150 to 151"]
B86["B87: instructions - lines 152 to 153"]
B87["B88: instructions - lines 154 to 155"]
B88["B89: instructions - lines 156 to 156"]
B89["B90: instructions - lines 157 to 158"]
B80 -->|call| B122
B80 -->|after return| B81
B81 -->|call| B115
B81 -->|after return| B82
B82 -->|call| B122
B82 -->|after return| B83
B83 -->|jump| B109
B84 -->|condition true| B98
B84 -->|condition false| B85
B85 -->|call| B163
B85 -->|after return| B86
B86 -->|call| B115
B86 -->|after return| B87
B87 -->|call| B115
B87 -->|after return| B88
B88 -->|call| B122
B88 -->|after return| B89
B89 -->|call| B115
B89 -->|after return| B90
B122["Continue at B123 in section 13"]
B115["Continue at B116 in section 12"]
B109["Continue at B110 in section 11"]
B98["Continue at B99 in section 10"]
B163["Continue at B164 in section 17"]
B90["Continue at B91 in section 10"]
```

### B81

```asm
ACALL WRDATA
```

### B82

```asm
MOV A,#"N"
ACALL COUT
```

### B83

```asm
ACALL WRDATA
```

### B84

```asm
AJMP  N9
```

### B85

```asm
CJNE A,#38H,N8
```

### B86

```asm
MOV A,#1
ACALL WRCMD
```

### B87

```asm
MOV A,#0DH
ACALL COUT
```

### B88

```asm
MOV A,#"E"
ACALL COUT
```

### B89

```asm
ACALL WRDATA
```

### B90

```asm
MOV A,#"I"
ACALL COUT
```

## Section 10

```mermaid
flowchart TD
B90["B91: instructions - lines 159 to 159"]
B91["B92: instructions - lines 160 to 161"]
B92["B93: instructions - lines 162 to 162"]
B93["B94: instructions - lines 163 to 164"]
B94["B95: instructions - lines 165 to 165"]
B95["B96: instructions - lines 166 to 167"]
B96["B97: instructions - lines 168 to 168"]
B97["B98: instructions - lines 169 to 169"]
B98["B99: N8 - lines 172 to 172"]
B99["B100: instructions - lines 173 to 174"]
B90 -->|call| B122
B90 -->|after return| B91
B91 -->|call| B115
B91 -->|after return| B92
B92 -->|call| B122
B92 -->|after return| B93
B93 -->|call| B115
B93 -->|after return| B94
B94 -->|call| B122
B94 -->|after return| B95
B95 -->|call| B115
B95 -->|after return| B96
B96 -->|call| B122
B96 -->|after return| B97
B97 -->|jump| B109
B98 -->|condition true| B109
B98 -->|condition false| B99
B99 -->|call| B163
B99 -->|after return| B100
B122["Continue at B123 in section 13"]
B115["Continue at B116 in section 12"]
B109["Continue at B110 in section 11"]
B163["Continue at B164 in section 17"]
B100["Continue at B101 in section 11"]
```

### B91

```asm
ACALL WRDATA
```

### B92

```asm
MOV A,#"G"
ACALL COUT
```

### B93

```asm
ACALL WRDATA
```

### B94

```asm
MOV A,#"H"
ACALL COUT
```

### B95

```asm
ACALL WRDATA
```

### B96

```asm
MOV A,#"T"
ACALL COUT
```

### B97

```asm
ACALL WRDATA
```

### B98

```asm
AJMP  N9
```

### B99

```asm
CJNE A,#39H,N9
```

### B100

```asm
MOV A,#1
ACALL WRCMD
```

## Section 11

```mermaid
flowchart TD
B100["B101: instructions - lines 175 to 176"]
B101["B102: instructions - lines 177 to 178"]
B102["B103: instructions - lines 179 to 179"]
B103["B104: instructions - lines 180 to 181"]
B104["B105: instructions - lines 182 to 182"]
B105["B106: instructions - lines 183 to 184"]
B106["B107: instructions - lines 185 to 185"]
B107["B108: instructions - lines 186 to 187"]
B108["B109: instructions - lines 188 to 188"]
B109["B110: N9 - lines 190 to 190"]
B100 -->|call| B115
B100 -->|after return| B101
B101 -->|call| B115
B101 -->|after return| B102
B102 -->|call| B122
B102 -->|after return| B103
B103 -->|call| B115
B103 -->|after return| B104
B104 -->|call| B122
B104 -->|after return| B105
B105 -->|call| B115
B105 -->|after return| B106
B106 -->|call| B122
B106 -->|after return| B107
B107 -->|call| B115
B107 -->|after return| B108
B108 -->|call| B122
B108 -->|after return| B109
B115["Continue at B116 in section 12"]
B122["Continue at B123 in section 13"]
```

### B101

```asm
MOV A,#0DH
ACALL COUT
```

### B102

```asm
MOV A,#"N"
ACALL COUT
```

### B103

```asm
ACALL WRDATA
```

### B104

```asm
MOV A,#"I"
ACALL COUT
```

### B105

```asm
ACALL WRDATA
```

### B106

```asm
MOV A,#"N"
ACALL COUT
```

### B107

```asm
ACALL WRDATA
```

### B108

```asm
MOV A,#"E"
ACALL COUT
```

### B109

```asm
ACALL WRDATA
```

### B110

Resume the interrupted program.

```asm
RETI
```

## Section 12

```mermaid
flowchart TD
B110["B111: MAIN - lines 196 to 198"]
B111["B112: instructions - lines 199 to 201"]
B112["B113: instructions - lines 202 to 203"]
B113["B114: LOOP - lines 206 to 206"]
B114["B115: SERIAL - lines 210 to 217"]
B115["B116: COUT - lines 220 to 220"]
B116["B117: WAAIT - lines 221 to 221"]
B117["B118: instructions - lines 222 to 223"]
B118["B119: CIN - lines 226 to 226"]
B119["B120: instructions - lines 227 to 229"]
B110 -->|call| B153
B110 -->|after return| B111
B111 -->|call| B114
B111 -->|after return| B112
B112 -->|call| B120
B112 -->|after return| B113
B113 -->|jump| B113
B115 -->|next| B116
B116 -->|condition true| B116
B116 -->|condition false| B117
B118 -->|condition true| B118
B118 -->|condition false| B119
B153["Continue at B154 in section 16"]
B120["Continue at B121 in section 13"]
```

### B111

```asm
SETB TCON.2
MOV IE, #84H
ACALL LCD_INI
```

### B112

```asm
MOV P1,#0FFH
SETB DAV
ACALL SERIAL
```

### B113

```asm
MOV A,#80H
ACALL WRCMD40
```

### B114

```asm
SJMP LOOP
```

### B115

Return to the instruction following the active call.

```asm
MOV A,PCON
SETB ACC.7
MOV PCON,A
MOV TH1,#-3
MOV TMOD,#20H
MOV SCON,#50H
SETB TR1
RET
```

### B116

```asm
MOV SBUF,A
```

### B117

```asm
JNB TI,waait
```

### B118

Return to the instruction following the active call.

```asm
CLR TI
RET
```

### B119

```asm
JNB  RI,CIN
```

### B120

Return to the instruction following the active call.

```asm
CLR TI
MOV SBUF,A
RET
```

## Section 13

```mermaid
flowchart TD
B120["B121: WRCMD40 - lines 232 to 236"]
B121["B122: instructions - lines 237 to 237"]
B122["B123: WRDATA - lines 240 to 244"]
B123["B124: instructions - lines 245 to 245"]
B124["B125: WT40 - lines 249 to 249"]
B125["B126: WT - lines 250 to 250"]
B126["B127: instructions - lines 251 to 251"]
B127["B128: KEY - lines 254 to 259"]
B128["B129: instructions - lines 260 to 260"]
B129["B130: CONV - lines 262 to 262"]
B120 -->|call| B124
B120 -->|after return| B121
B122 -->|call| B124
B122 -->|after return| B123
B124 -->|next| B125
B125 -->|condition true| B125
B125 -->|condition false| B126
B127 -->|call| B129
B127 -->|after return| B128
B129 -->|condition true| B131
B129 -->|condition false| B130
B131["Continue at B132 in section 14"]
B130["Continue at B131 in section 14"]
```

### B121

```asm
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WT40
```

### B122

Return to the instruction following the active call.

```asm
RET
```

### B123

```asm
MOV P2,A
SETB RS
SETB E
CLR E
ACALL WT40
```

### B124

Return to the instruction following the active call.

```asm
RET
```

### B125

```asm
MOV R0,#19
```

### B126

```asm
DJNZ R0,WT
```

### B127

Return to the instruction following the active call.

```asm
RET
```

### B128

```asm
CLR OE
NOP
MOV A,P1
SETB OE
ANL A,#0FH
ACALL CONV
```

### B129

Return to the instruction following the active call.

```asm
RET
```

### B130

```asm
cjne A, #0, k1
```

## Section 14

```mermaid
flowchart TD
B130["B131: instructions - lines 263 to 264"]
B131["B132: K1 - lines 266 to 266"]
B132["B133: instructions - lines 267 to 268"]
B133["B134: K2 - lines 270 to 270"]
B134["B135: instructions - lines 271 to 272"]
B135["B136: K4 - lines 274 to 274"]
B136["B137: instructions - lines 275 to 276"]
B137["B138: K5 - lines 278 to 278"]
B138["B139: instructions - lines 279 to 280"]
B139["B140: K6 - lines 282 to 282"]
B130 -->|jump| B152
B131 -->|condition true| B133
B131 -->|condition false| B132
B132 -->|jump| B152
B133 -->|condition true| B135
B133 -->|condition false| B134
B134 -->|jump| B152
B135 -->|condition true| B137
B135 -->|condition false| B136
B136 -->|jump| B152
B137 -->|condition true| B139
B137 -->|condition false| B138
B138 -->|jump| B152
B139 -->|condition true| B141
B139 -->|condition false| B140
B152["Continue at B153 in section 16"]
B141["Continue at B142 in section 15"]
B140["Continue at B141 in section 15"]
```

### B131

```asm
mov A, #'1'
jmp got_it
```

### B132

```asm
cjne A, #1, k2
```

### B133

```asm
mov A, #'2'
jmp got_it
```

### B134

```asm
cjne A, #2, k4
```

### B135

```asm
mov A, #'3'
jmp got_it
```

### B136

```asm
cjne A, #4, k5
```

### B137

```asm
mov A, #'4'
jmp got_it
```

### B138

```asm
cjne A, #5, k6
```

### B139

```asm
mov A, #'5'
jmp got_it
```

### B140

```asm
cjne A, #6, k8
```

## Section 15

```mermaid
flowchart TD
B140["B141: instructions - lines 283 to 284"]
B141["B142: K8 - lines 286 to 286"]
B142["B143: instructions - lines 287 to 288"]
B143["B144: K9 - lines 290 to 290"]
B144["B145: instructions - lines 291 to 292"]
B145["B146: K10 - lines 294 to 294"]
B146["B147: instructions - lines 295 to 296"]
B147["B148: K12 - lines 298 to 298"]
B148["B149: instructions - lines 299 to 301"]
B149["B150: K13 - lines 303 to 303"]
B140 -->|jump| B152
B141 -->|condition true| B143
B141 -->|condition false| B142
B142 -->|jump| B152
B143 -->|condition true| B145
B143 -->|condition false| B144
B144 -->|jump| B152
B145 -->|condition true| B147
B145 -->|condition false| B146
B146 -->|jump| B152
B147 -->|condition true| B149
B147 -->|condition false| B148
B148 -->|jump| B152
B149 -->|condition true| B151
B149 -->|condition false| B150
B152["Continue at B153 in section 16"]
B151["Continue at B152 in section 16"]
B150["Continue at B151 in section 16"]
```

### B141

```asm
mov A, #'6'
jmp got_it
```

### B142

```asm
cjne A, #8, k9
```

### B143

```asm
mov A, #'7'
jmp got_it
```

### B144

```asm
cjne A, #9, k10
```

### B145

```asm
mov A, #'8'
jmp got_it
```

### B146

```asm
cjne A, #10, k12
```

### B147

```asm
mov A, #'9'
jmp got_it
```

### B148

```asm
cjne A, #12, k13
```

### B149

```asm
mov A, #'*'
jmp got_it
```

### B150

```asm
cjne A, #13, k14
```

## Section 16

```mermaid
flowchart TD
B150["B151: instructions - lines 304 to 305"]
B151["B152: K14 - lines 307 to 307"]
B152["B153: GOT_IT - lines 309 to 309"]
B153["B154: LCD_INI - lines 313 to 313"]
B154["B155: instructions - lines 314 to 315"]
B155["B156: instructions - lines 316 to 317"]
B156["B157: instructions - lines 318 to 319"]
B157["B158: instructions - lines 320 to 321"]
B158["B159: instructions - lines 322 to 323"]
B159["B160: instructions - lines 324 to 325"]
B150 -->|jump| B152
B151 -->|next| B152
B153 -->|call| B165
B153 -->|after return| B154
B154 -->|call| B163
B154 -->|after return| B155
B155 -->|call| B163
B155 -->|after return| B156
B156 -->|call| B163
B156 -->|after return| B157
B157 -->|call| B163
B157 -->|after return| B158
B158 -->|call| B163
B158 -->|after return| B159
B159 -->|call| B163
B159 -->|after return| B160
B165["Continue at B166 in section 17"]
B163["Continue at B164 in section 17"]
B160["Continue at B161 in section 17"]
```

### B151

```asm
mov A, #'0'
jmp got_it
```

### B152

```asm
mov A, # '#'
```

### B153

Return to the instruction following the active call.

```asm
ret
```

### B154

```asm
ACALL WAIT
```

### B155

```asm
MOV A,#38H
ACALL WRCMD
```

### B156

```asm
MOV A,#038H
ACALL WRCMD
```

### B157

```asm
MOV A,#038H
ACALL WRCMD
```

### B158

```asm
MOV A,#038H
ACALL WRCMD
```

### B159

```asm
MOV A,#8
ACALL WRCMD
```

### B160

```asm
MOV A,#1
ACALL WRCMD
```

## Section 17

```mermaid
flowchart TD
B160["B161: instructions - lines 326 to 327"]
B161["B162: instructions - lines 328 to 329"]
B162["B163: instructions - lines 330 to 330"]
B163["B164: WRCMD - lines 333 to 337"]
B164["B165: instructions - lines 338 to 338"]
B165["B166: WAIT - lines 341 to 341"]
B166["B167: WT0 - lines 342 to 342"]
B167["B168: WT1 - lines 343 to 343"]
B168["B169: WT2 - lines 344 to 344"]
B169["B170: instructions - lines 345 to 345"]
B160 -->|call| B163
B160 -->|after return| B161
B161 -->|call| B120
B161 -->|after return| B162
B163 -->|call| B165
B163 -->|after return| B164
B165 -->|next| B166
B166 -->|next| B167
B167 -->|next| B168
B168 -->|condition true| B168
B168 -->|condition false| B169
B169 -->|condition true| B167
B169 -->|condition false| B170
B120["Continue at B121 in section 13"]
B170["Continue at B171 in section 18"]
```

### B161

```asm
MOV A,#6
ACALL WRCMD
```

### B162

```asm
MOV A,#0FH
ACALL WRCMD40
```

### B163

Return to the instruction following the active call.

```asm
RET
```

### B164

```asm
MOV P2,A
CLR RS
SETB E
CLR E
ACALL WAIT
```

### B165

Return to the instruction following the active call.

```asm
RET
```

### B166

```asm
MOV R5,#1
```

### B167

```asm
MOV R6,#28
```

### B168

```asm
MOV R7,#255
```

### B169

```asm
DJNZ R7,WT2
```

### B170

```asm
DJNZ R6,WT1
```

## Section 18

```mermaid
flowchart TD
B170["B171: instructions - lines 346 to 346"]
B171["B172: instructions - lines 347 to 347"]
B170 -->|condition true| B166
B170 -->|condition false| B171
B166["Continue at B167 in section 17"]
```

### B171

```asm
DJNZ R5,WT0
```

### B172

Return to the instruction following the active call.

```asm
RET
```
