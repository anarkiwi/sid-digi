1000  78           ?? 78h    x
1001  20           ?? 20h     
1002  48           ?? 48h    H
1003  10           ?? 10h
1004  A9           ?? A9h
1005  18           ?? 18h
1006  A0           ?? A0h
1007  10           ?? 10h
1008  8D           ?? 8Dh
1009  14           ?? 14h
100a  03           ?? 03h
100b  8C           ?? 8Ch
100c  15           ?? 15h
100d  03           ?? 03h
100e  E8           ?? E8h
100f  8E           ?? 8Eh
1010  0E           ?? 0Eh
1011  DC           ?? DCh
1012  E8           ?? E8h
1013  8E           ?? 8Eh
1014  1A           ?? 1Ah
1015  D0           ?? D0h
1016  58           ?? 58h    X
1017  60           ?? 60h    `
1018  EE           ?? EEh
1019  19           ?? 19h
101a  D0           ?? D0h
101b  20           ?? 20h     
101c  21           ?? 21h    !
101d  10           ?? 10h
101e  4C           ?? 4Ch    L
101f  31           ?? 31h    1
1020  EA           ?? EAh
entry_1021:
1021  A2 00        LDX #0x0
1023  CE 90 10     DEC 0x1090
1026  30 0C        BMI 0x1034
1028  20 26 12     JSR 0x1226
102b  20 25 12     JSR 0x1225
102e  4C 25 12     JMP 0x1225
1031  FF           ?? FFh
1032  FF           ?? FFh
1033  FF           ?? FFh
LAB_1034:
1034  A9 02        LDA #0x2
1036  8D 90 10     STA 0x1090
1039  20 40 10     JSR 0x1040
103c  20 3F 10     JSR 0x103f
SUB_103f:
103f  E8           INX
SUB_1040:
1040  DE 8A 10     DEC 0x108a,X
1043  30 4C        BMI 0x1091
1045  4C 26 12     JMP 0x1226
entry_1048:
1048  A9 1F        LDA #0x1f
104a  8D 18 D4     STA 0xd418
104d  A9 F0        LDA #0xf0
104f  8D 17 D4     STA 0xd417
1052  29 0F        AND #0xf
1054  8D 62 12     STA 0x1262
1057  A2 0F        LDX #0xf
LAB_1059:
1059  9D 81 10     STA 0x1081,X
105c  CA           DEX
105d  10 FA        BPL 0x1059
105f  A2 02        LDX #0x2
LAB_1061:
1061  BD B9 14     LDA 0x14b9,X
1064  85 FA        STA 0x00fa
1066  BD BC 14     LDA 0x14bc,X
1069  85 FB        STA 0x00fb
106b  A0 00        LDY #0x0
106d  B1 FA        LDA (0xfa),Y
106f  9D 8D 10     STA 0x108d,X
1072  C8           INY
1073  B1 FA        LDA (0xfa),Y
1075  9D E6 10     STA 0x10e6,X
1078  29 0F        AND #0xf
107a  9D E9 10     STA 0x10e9,X
107d  CA           DEX
107e  10 E1        BPL 0x1061
1080  60           RTS
1081  2B           ?? 2Bh    +
1082  17           ?? 17h
1083  00           ?? 00h
1084  41           ?? 41h    A
1085  41           ?? 41h    A
1086  41           ?? 41h    A
1087  00           ?? 00h
1088  00           ?? 00h
1089  02           ?? 02h
108a  00           ?? 00h
108b  00           ?? 00h
108c  04           ?? 04h
108d  02           ?? 02h
108e  01           ?? 01h
108f  00           ?? 00h
DAT_1090:
1090  02           ?? 02h
LAB_1091:
1091  BC 8D 10     LDY 0x108d,X
1094  C0 FE        CPY #0xfe
1096  D0 09        BNE 0x10a1
SUB_1098:
1098  BD 84 10     LDA 0x1084,X
109b  29 FE        AND #0xfe
109d  9D 84 10     STA 0x1084,X
10a0  60           RTS
LAB_10a1:
10a1  B9 6A 1A     LDA 0x1a6a,Y
10a4  85 FA        STA 0x00fa
10a6  B9 4E 1A     LDA 0x1a4e,Y
10a9  85 FB        STA 0x00fb
10ab  BC 81 10     LDY 0x1081,X
10ae  B1 FA        LDA (0xfa),Y
10b0  30 20        BMI 0x10d2
10b2  C9 60        CMP #0x60
10b4  90 43        BCC 0x10f9
LAB_10b6:
10b6  29 1F        AND #0x1f
10b8  9D 8A 10     STA 0x108a,X
10bb  A9 FE        LDA #0xfe
10bd  9D 31 10     STA 0x1031,X
10c0  20 98 10     JSR 0x1098
LAB_10c3:
10c3  4C 87 11     JMP 0x1187
10c6  00           ?? 00h
10c7  07           ?? 07h
10c8  0E           ?? 0Eh
10c9  1A           ?? 1Ah
10ca  3E           ?? 3Eh    >
10cb  32           ?? 32h    2
10cc  E2           ?? E2h
10cd  72           ?? 72h    r
10ce  48           ?? 48h    H
10cf  04           ?? 04h
10d0  2E           ?? 2Eh    .
10d1  13           ?? 13h
LAB_10d2:
10d2  C9 A0        CMP #0xa0
10d4  90 16        BCC 0x10ec
10d6  29 1F        AND #0x1f
10d8  9D 8A 10     STA 0x108a,X
10db  B0 E6        BCS 0x10c3
10dd  00           BRK
10de  00           ?? 00h
10df  01           ?? 01h
10e0  00           ?? 00h
10e1  00           ?? 00h
10e2  AF           ?? AFh
10e3  00           ?? 00h
10e4  00           ?? 00h
10e5  00           ?? 00h
10e6  53           ?? 53h    S
10e7  03           ?? 03h
10e8  00           ?? 00h
10e9  02           ?? 02h
10ea  02           ?? 02h
10eb  00           ?? 00h
LAB_10ec:
10ec  0A           ASL A
10ed  0A           ASL A
10ee  0A           ASL A
10ef  9D D9 13     STA 0x13d9,X
10f2  C8           INY
10f3  B1 FA        LDA (0xfa),Y
10f5  C9 60        CMP #0x60
10f7  B0 BD        BCS 0x10b6
LAB_10f9:
10f9  85 FC        STA 0x00fc
10fb  C8           INY
10fc  BD E6 10     LDA 0x10e6,X
10ff  4A           LSR A
1100  4A           LSR A
1101  4A           LSR A
1102  4A           LSR A
1103  18           CLC
1104  65 FC        ADC 0x00fc
1106  9D C9 10     STA 0x10c9,X
1109  84 FC        STY 0x00fc
110b  A8           TAY
110c  B9 37 14     LDA 0x1437,Y
110f  9D CC 10     STA 0x10cc,X
1112  9D E2 13     STA 0x13e2,X
1115  B9 C5 11     LDA 0x11c5,Y
1118  9D CF 10     STA 0x10cf,X
111b  9D B6 12     STA 0x12b6,X
111e  A4 FC        LDY 0x00fc
1120  B1 FA        LDA (0xfa),Y
1122  9D 41 11     STA 0x1141,X
1125  29 1F        AND #0x1f
1127  9D 8A 10     STA 0x108a,X
112a  B1 FA        LDA (0xfa),Y
112c  30 22        BMI 0x1150
112e  29 20        AND #0x20
1130  F0 45        BEQ 0x1177
1132  C8           INY
1133  B1 FA        LDA (0xfa),Y
1135  9D 47 11     STA 0x1147,X
1138  C8           INY
1139  B1 FA        LDA (0xfa),Y
113b  9D 4A 11     STA 0x114a,X
113e  4C 77 11     JMP 0x1177
1141  C1           ?? C1h
1142  41           ?? 41h    A
1143  5F           ?? 5Fh    _
1144  00           ?? 00h
1145  06           ?? 06h
1146  00           ?? 00h
1147  C0           ?? C0h
1148  A0           ?? A0h
1149  A0           ?? A0h
114a  FF           ?? FFh
114b  FF           ?? FFh
114c  FF           ?? FFh
114d  00           ?? 00h
114e  00           ?? 00h
114f  00           ?? 00h
LAB_1150:
1150  8E 62 12     STX 0x1262
1153  C8           INY
1154  B1 FA        LDA (0xfa),Y
1156  8D 66 12     STA 0x1266
1159  29 0F        AND #0xf
115b  0A           ASL A
115c  38           SEC
115d  E9 10        SBC #0x10
115f  8D A0 12     STA 0x12a0
1162  C8           INY
1163  B1 FA        LDA (0xfa),Y
1165  D0 07        BNE 0x116e
1167  A9 F0        LDA #0xf0
1169  8D 17 D4     STA 0xd417
116c  D0 09        BNE 0x1177
LAB_116e:
116e  8D 6B 12     STA 0x126b
1171  BD B3 12     LDA 0x12b3,X
1174  8D 17 D4     STA 0xd417
LAB_1177:
1177  A9 FF        LDA #0xff
1179  9D 31 10     STA 0x1031,X
117c  9D B9 12     STA 0x12b9,X
117f  A9 00        LDA #0x0
1181  9D DD 10     STA 0x10dd,X
1184  9D BD 12     STA 0x12bd,X
LAB_1187:
1187  C8           INY
1188  B1 FA        LDA (0xfa),Y
118a  C9 FF        CMP #0xff
118c  D0 32        BNE 0x11c0
118e  DE E9 10     DEC 0x10e9,X
1191  10 2B        BPL 0x11be
1193  BD B9 14     LDA 0x14b9,X
1196  85 FA        STA 0x00fa
1198  BD BC 14     LDA 0x14bc,X
119b  85 FB        STA 0x00fb
119d  BC 87 10     LDY 0x1087,X
11a0  C8           INY
11a1  C8           INY
11a2  B1 FA        LDA (0xfa),Y
11a4  C9 FF        CMP #0xff
11a6  D0 02        BNE 0x11aa
11a8  A0 00        LDY #0x0
LAB_11aa:
11aa  98           TYA
11ab  9D 87 10     STA 0x1087,X
11ae  B1 FA        LDA (0xfa),Y
11b0  9D 8D 10     STA 0x108d,X
11b3  C8           INY
11b4  B1 FA        LDA (0xfa),Y
11b6  9D E6 10     STA 0x10e6,X
11b9  29 0F        AND #0xf
11bb  9D E9 10     STA 0x10e9,X
LAB_11be:
11be  A0 00        LDY #0x0
LAB_11c0:
11c0  98           TYA
11c1  9D 81 10     STA 0x1081,X
11c4  60           RTS
11c5  01           ?? 01h
11c6  01           ?? 01h
11c7  01           ?? 01h
11c8  01           ?? 01h
11c9  01           ?? 01h
11ca  01           ?? 01h
11cb  01           ?? 01h
11cc  01           ?? 01h
11cd  01           ?? 01h
11ce  01           ?? 01h
11cf  01           ?? 01h
11d0  02           ?? 02h
11d1  02           ?? 02h
11d2  02           ?? 02h
11d3  02           ?? 02h
11d4  02           ?? 02h
11d5  02           ?? 02h
11d6  02           ?? 02h
11d7  03           ?? 03h
11d8  03           ?? 03h
11d9  03           ?? 03h
11da  03           ?? 03h
11db  03           ?? 03h
11dc  04           ?? 04h
11dd  04           ?? 04h
11de  04           ?? 04h
11df  04           ?? 04h
11e0  05           ?? 05h
11e1  05           ?? 05h
11e2  05           ?? 05h
11e3  06           ?? 06h
11e4  06           ?? 06h
11e5  06           ?? 06h
11e6  07           ?? 07h
11e7  07           ?? 07h
11e8  08           ?? 08h
11e9  08           ?? 08h
11ea  09           ?? 09h
11eb  09           ?? 09h
11ec  0A           ?? 0Ah
11ed  0A           ?? 0Ah
11ee  0B           ?? 0Bh
11ef  0C           ?? 0Ch
11f0  0D           ?? 0Dh
11f1  0D           ?? 0Dh
11f2  0E           ?? 0Eh
11f3  0F           ?? 0Fh
11f4  10           ?? 10h
11f5  11           ?? 11h
11f6  12           ?? 12h
11f7  13           ?? 13h
11f8  14           ?? 14h
11f9  15           ?? 15h
11fa  17           ?? 17h
11fb  18           ?? 18h
11fc  1A           ?? 1Ah
11fd  1B           ?? 1Bh
11fe  1D           ?? 1Dh
11ff  1F           ?? 1Fh
1200  20           ?? 20h     
1201  22           ?? 22h    "
1202  24           ?? 24h    $
1203  27           ?? 27h    '
1204  29           ?? 29h    )
1205  2B           ?? 2Bh    +
1206  2E           ?? 2Eh    .
1207  31           ?? 31h    1
1208  34           ?? 34h    4
1209  37           ?? 37h    7
120a  3A           ?? 3Ah    :
120b  3E           ?? 3Eh    >
120c  41           ?? 41h    A
120d  45           ?? 45h    E
120e  49           ?? 49h    I
120f  4E           ?? 4Eh    N
1210  52           ?? 52h    R
1211  57           ?? 57h    W
1212  5C           ?? 5Ch    \
1213  62           ?? 62h    b
1214  68           ?? 68h    h
1215  6E           ?? 6Eh    n
1216  75           ?? 75h    u
1217  7C           ?? 7Ch    |
1218  83           ?? 83h
1219  8B           ?? 8Bh
121a  93           ?? 93h
121b  9C           ?? 9Ch
121c  A5           ?? A5h
121d  AF           ?? AFh
121e  B9           ?? B9h
121f  C4           ?? C4h
1220  D0           ?? D0h
1221  DD           ?? DDh
1222  EA           ?? EAh
1223  F8           ?? F8h
1224  FD           ?? FDh
SUB_1225:
1225  E8           INX
SUB_1226:
1226  BC D9 13     LDY 0x13d9,X
1229  84 FC        STY 0x00fc
122b  BD 41 11     LDA 0x1141,X
122e  29 40        AND #0x40
1230  D0 5E        BNE 0x1290
1232  9D 44 11     STA 0x1144,X
1235  B9 86 1A     LDA 0x1a86,Y
1238  85 FA        STA 0x00fa
123a  B9 87 1A     LDA 0x1a87,Y
123d  BC C6 10     LDY 0x10c6,X
1240  99 06 D4     STA 0xd406,Y
1243  A5 FA        LDA 0x00fa
1245  99 05 D4     STA 0xd405,Y
1248  BD 84 10     LDA 0x1084,X
124b  29 FE        AND #0xfe
124d  99 04 D4     STA 0xd404,Y
1250  A4 FC        LDY 0x00fc
1252  B9 88 1A     LDA 0x1a88,Y
1255  9D 84 10     STA 0x1084,X
1258  B9 89 1A     LDA 0x1a89,Y
125b  9D DC 13     STA 0x13dc,X
125e  9D DF 13     STA 0x13df,X
1261  E0 00        CPX #0x0
1263  D0 0A        BNE 0x126f
1265  A9 08        LDA #0x8
1267  8D 9E 12     STA 0x129e
126a  A9 08        LDA #0x8
126c  8D 96 12     STA 0x1296
LAB_126f:
126f  A9 00        LDA #0x0
1271  9D E0 10     STA 0x10e0,X
1274  9D E3 10     STA 0x10e3,X
1277  B9 8B 1A     LDA 0x1a8b,Y
127a  4A           LSR A
127b  4A           LSR A
127c  4A           LSR A
127d  9D 4D 11     STA 0x114d,X
1280  BD 41 11     LDA 0x1141,X
1283  09 40        ORA #0x40
1285  9D 41 11     STA 0x1141,X
1288  B9 8D 1A     LDA 0x1a8d,Y
128b  95 FD        STA 0xfd,X
128d  4C 85 13     JMP 0x1385
LAB_1290:
1290  EC 62 12     CPX 0x1262
1293  D0 12        BNE 0x12a7
1295  A9 06        LDA #0x6
1297  F0 0E        BEQ 0x12a7
1299  CE 96 12     DEC 0x1296
129c  18           CLC
129d  A9 08        LDA #0x8
129f  69 00        ADC #0x0
12a1  8D 9E 12     STA 0x129e
12a4  8D 16 D4     STA 0xd416
LAB_12a7:
12a7  B5 FD        LDA 0xfd,X
12a9  29 0F        AND #0xf
12ab  F0 1A        BEQ 0x12c7
12ad  20 E5 13     JSR 0x13e5
12b0  4C 22 13     JMP 0x1322
12b3  F1           ?? F1h
12b4  F3           ?? F3h
12b5  F7           ?? F7h
12b6  04           ?? 04h
12b7  27           ?? 27h    '
12b8  13           ?? 13h
12b9  FF           ?? FFh
12ba  FF           ?? FFh
12bb  FF           ?? FFh
12bc  00           ?? 00h
12bd  00           ?? 00h
12be  00           ?? 00h
12bf  48           ?? 48h    H
12c0  00           ?? 00h
12c1  00           ?? 00h
12c2  00           ?? 00h
12c3  00           ?? 00h
12c4  01           ?? 01h
12c5  01           ?? 01h
12c6  00           ?? 00h
LAB_12c7:
12c7  BD 41 11     LDA 0x1141,X
12ca  29 20        AND #0x20
12cc  D0 54        BNE 0x1322
12ce  B5 FD        LDA 0xfd,X
12d0  29 10        AND #0x10
12d2  F0 4E        BEQ 0x1322
12d4  DE 4D 11     DEC 0x114d,X
12d7  10 49        BPL 0x1322
12d9  FE 4D 11     INC 0x114d,X
12dc  BD BD 12     LDA 0x12bd,X
12df  29 03        AND #0x3
12e1  A8           TAY
12e2  B9 C3 12     LDA 0x12c3,Y
12e5  D0 13        BNE 0x12fa
12e7  A4 FC        LDY 0x00fc
12e9  38           SEC
12ea  BD CC 10     LDA 0x10cc,X
12ed  F9 8C 1A     SBC 0x1a8c,Y
12f0  9D CC 10     STA 0x10cc,X
12f3  B0 18        BCS 0x130d
12f5  DE CF 10     DEC 0x10cf,X
12f8  D0 13        BNE 0x130d
LAB_12fa:
12fa  A4 FC        LDY 0x00fc
12fc  18           CLC
12fd  BD CC 10     LDA 0x10cc,X
1300  79 8C 1A     ADC 0x1a8c,Y
1303  9D CC 10     STA 0x10cc,X
1306  90 05        BCC 0x130d
1308  FE CF 10     INC 0x10cf,X
130b  B0 00        BCS 0x130d
LAB_130d:
130d  FE DD 10     INC 0x10dd,X
1310  B9 8B 1A     LDA 0x1a8b,Y
1313  29 0F        AND #0xf
1315  DD DD 10     CMP 0x10dd,X
1318  D0 08        BNE 0x1322
131a  A9 00        LDA #0x0
131c  9D DD 10     STA 0x10dd,X
131f  FE BD 12     INC 0x12bd,X
LAB_1322:
1322  A4 FC        LDY 0x00fc
1324  B9 8A 1A     LDA 0x1a8a,Y
1327  85 FC        STA 0x00fc
1329  B5 FD        LDA 0xfd,X
132b  29 40        AND #0x40
132d  F0 14        BEQ 0x1343
132f  18           CLC
1330  A5 FC        LDA 0x00fc
1332  7D DC 13     ADC 0x13dc,X
1335  9D DC 13     STA 0x13dc,X
1338  A5 FC        LDA 0x00fc
133a  7D DF 13     ADC 0x13df,X
133d  9D DF 13     STA 0x13df,X
1340  4C 85 13     JMP 0x1385
LAB_1343:
1343  B5 FD        LDA 0xfd,X
1345  29 20        AND #0x20
1347  F0 3C        BEQ 0x1385
1349  BD E3 10     LDA 0x10e3,X
134c  F0 10        BEQ 0x135e
134e  18           CLC
134f  BD DC 13     LDA 0x13dc,X
1352  65 FC        ADC 0x00fc
1354  9D DC 13     STA 0x13dc,X
1357  90 13        BCC 0x136c
1359  FE DF 13     INC 0x13df,X
135c  B0 0E        BCS 0x136c
LAB_135e:
135e  38           SEC
135f  BD DC 13     LDA 0x13dc,X
1362  E5 FC        SBC 0x00fc
1364  9D DC 13     STA 0x13dc,X
1367  B0 03        BCS 0x136c
1369  DE DF 13     DEC 0x13df,X
LAB_136c:
136c  FE E0 10     INC 0x10e0,X
136f  A5 FC        LDA 0x00fc
1371  29 0F        AND #0xf
1373  DD E0 10     CMP 0x10e0,X
1376  D0 0D        BNE 0x1385
1378  A9 00        LDA #0x0
137a  9D E0 10     STA 0x10e0,X
137d  BD E3 10     LDA 0x10e3,X
1380  49 01        EOR #0x1
1382  9D E3 10     STA 0x10e3,X
LAB_1385:
1385  BC C6 10     LDY 0x10c6,X
1388  BD 84 10     LDA 0x1084,X
138b  99 04 D4     STA 0xd404,Y
138e  BD DF 13     LDA 0x13df,X
1391  99 03 D4     STA 0xd403,Y
1394  BD DC 13     LDA 0x13dc,X
1397  99 02 D4     STA 0xd402,Y
139a  BD 41 11     LDA 0x1141,X
139d  29 20        AND #0x20
139f  F0 2B        BEQ 0x13cc
13a1  BD 47 11     LDA 0x1147,X
13a4  29 01        AND #0x1
13a6  F0 0A        BEQ 0x13b2
13a8  BD B9 12     LDA 0x12b9,X
13ab  49 FF        EOR #0xff
13ad  9D B9 12     STA 0x12b9,X
13b0  D0 1A        BNE 0x13cc
LAB_13b2:
13b2  18           CLC
13b3  BD E2 13     LDA 0x13e2,X
13b6  7D 47 11     ADC 0x1147,X
13b9  9D E2 13     STA 0x13e2,X
13bc  99 00 D4     STA 0xd400,Y
13bf  BD B6 12     LDA 0x12b6,X
13c2  7D 4A 11     ADC 0x114a,X
13c5  9D B6 12     STA 0x12b6,X
13c8  99 01 D4     STA 0xd401,Y
13cb  60           RTS
LAB_13cc:
13cc  BD CC 10     LDA 0x10cc,X
13cf  99 00 D4     STA 0xd400,Y
13d2  BD CF 10     LDA 0x10cf,X
13d5  99 01 D4     STA 0xd401,Y
13d8  60           RTS
13d9  00           ?? 00h
13da  10           ?? 10h
13db  18           ?? 18h
13dc  C1           ?? C1h
13dd  C4           ?? C4h
13de  71           ?? 71h    q
13df  C1           ?? C1h
13e0  C4           ?? C4h
13e1  20           ?? 20h     
13e2  E2           ?? E2h
13e3  10           ?? 10h
13e4  88           ?? 88h
SUB_13e5:
13e5  A8           TAY
13e6  B9 98 14     LDA 0x1498,Y
13e9  85 FA        STA 0x00fa
13eb  B9 A8 14     LDA 0x14a8,Y
13ee  85 FB        STA 0x00fb
13f0  BC 44 11     LDY 0x1144,X
13f3  B1 FA        LDA (0xfa),Y
13f5  3D 31 10     AND 0x1031,X
13f8  9D 84 10     STA 0x1084,X
13fb  C8           INY
13fc  B1 FA        LDA (0xfa),Y
13fe  30 04        BMI 0x1404
1400  18           CLC
1401  7D C9 10     ADC 0x10c9,X
LAB_1404:
1404  29 7F        AND #0x7f
1406  8D 29 14     STA 0x1429
1409  C8           INY
140a  B1 FA        LDA (0xfa),Y
140c  F0 03        BEQ 0x1411
140e  8D 9E 12     STA 0x129e
LAB_1411:
1411  C8           INY
1412  B1 FA        LDA (0xfa),Y
1414  C9 FE        CMP #0xfe
1416  90 0C        BCC 0x1424
1418  F0 04        BEQ 0x141e
141a  A0 00        LDY #0x0
141c  F0 06        BEQ 0x1424
LAB_141e:
141e  B5 FD        LDA 0xfd,X
1420  29 F0        AND #0xf0
1422  95 FD        STA 0xfd,X
LAB_1424:
1424  98           TYA
1425  9D 44 11     STA 0x1144,X
1428  A0 41        LDY #0x41
142a  B9 37 14     LDA 0x1437,Y
142d  9D CC 10     STA 0x10cc,X
1430  B9 C5 11     LDA 0x11c5,Y
1433  9D CF 10     STA 0x10cf,X
1436  60           RTS
1437  16           ?? 16h
1438  27           ?? 27h    '
1439  38           ?? 38h    8
143a  4B           ?? 4Bh    K
143b  5F           ?? 5Fh    _
143c  73           ?? 73h    s
143d  8A           ?? 8Ah
143e  A1           ?? A1h
143f  BA           ?? BAh
1440  D4           ?? D4h
1441  F0           ?? F0h
1442  0E           ?? 0Eh
1443  2D           ?? 2Dh    -
1444  4E           ?? 4Eh    N
1445  71           ?? 71h    q
1446  96           ?? 96h
1447  BD           ?? BDh
1448  E7           ?? E7h
1449  13           ?? 13h
144a  42           ?? 42h    B
144b  74           ?? 74h    t
144c  A9           ?? A9h
144d  E0           ?? E0h
144e  1B           ?? 1Bh
144f  5A           ?? 5Ah    Z
1450  9B           ?? 9Bh
1451  E2           ?? E2h
1452  2C           ?? 2Ch    ,
1453  7B           ?? 7Bh    {
1454  CE           ?? CEh
1455  27           ?? 27h    '
1456  85           ?? 85h
1457  E8           ?? E8h
1458  51           ?? 51h    Q
1459  C1           ?? C1h
145a  37           ?? 37h    7
145b  B4           ?? B4h
145c  37           ?? 37h    7
145d  C4           ?? C4h
145e  57           ?? 57h    W
145f  F5           ?? F5h
1460  9C           ?? 9Ch
1461  4E           ?? 4Eh    N
1462  09           ?? 09h
1463  D0           ?? D0h
1464  A3           ?? A3h
1465  82           ?? 82h
1466  6E           ?? 6Eh    n
1467  68           ?? 68h    h
1468  6E           ?? 6Eh    n
1469  88           ?? 88h
146a  AF           ?? AFh
146b  EB           ?? EBh
146c  39           ?? 39h    9
146d  9C           ?? 9Ch
146e  13           ?? 13h
146f  A1           ?? A1h
1470  46           ?? 46h    F
1471  04           ?? 04h
1472  DC           ?? DCh
1473  D0           ?? D0h
1474  DC           ?? DCh
1475  10           ?? 10h
1476  5E           ?? 5Eh    ^
1477  D6           ?? D6h
1478  72           ?? 72h    r
1479  38           ?? 38h    8
147a  26           ?? 26h    &
147b  42           ?? 42h    B
147c  8C           ?? 8Ch
147d  08           ?? 08h
147e  B8           ?? B8h
147f  A0           ?? A0h
1480  B8           ?? B8h
1481  20           ?? 20h     
1482  BC           ?? BCh
1483  AC           ?? ACh
1484  E4           ?? E4h
1485  70           ?? 70h    p
1486  4C           ?? 4Ch    L
1487  84           ?? 84h
1488  18           ?? 18h
1489  10           ?? 10h
148a  70           ?? 70h    p
148b  40           ?? 40h    @
148c  70           ?? 70h    p
148d  40           ?? 40h    @
148e  78           ?? 78h    x
148f  58           ?? 58h    X
1490  C8           ?? C8h
1491  E0           ?? E0h
1492  98           ?? 98h
1493  08           ?? 08h
1494  30           ?? 30h    0
1495  20           ?? 20h     
1496  2E           ?? 2Eh    .
1497  14           ?? 14h
1498  68           ?? 68h    h
1499  C5           ?? C5h
149a  DE           ?? DEh
149b  40           ?? 40h    @
149c  60           ?? 60h    `
149d  80           ?? 80h
149e  A0           ?? A0h
149f  C0           ?? C0h
14a0  E0           ?? E0h
14a1  1C           ?? 1Ch
14a2  20           ?? 20h     
14a3  40           ?? 40h    @
14a4  60           ?? 60h    `
14a5  F7           ?? F7h
14a6  A0           ?? A0h
14a7  35           ?? 35h    5
14a8  E0           ?? E0h
14a9  19           ?? 19h
14aa  19           ?? 19h
14ab  F3           ?? F3h
14ac  F3           ?? F3h
14ad  F3           ?? F3h
14ae  F3           ?? F3h
14af  F3           ?? F3h
14b0  F3           ?? F3h
14b1  1A           ?? 1Ah
14b2  F4           ?? F4h
14b3  F4           ?? F4h
14b4  F4           ?? F4h
14b5  19           ?? 19h
14b6  F4           ?? F4h
14b7  1A           ?? 1Ah
14b8  F4           ?? F4h
14b9  30           ?? 30h    0
14ba  9F           ?? 9Fh
14bb  14           ?? 14h
14bc  19           ?? 19h
14bd  18           ?? 18h
14be  18           ?? 18h
14bf  83           ?? 83h
14c0  32           ?? 32h    2
14c1  17           ?? 17h
14c2  34           ?? 34h    4
14c3  01           ?? 01h
14c4  32           ?? 32h    2
14c5  01           ?? 01h
14c6  30           ?? 30h    0
14c7  01           ?? 01h
14c8  32           ?? 32h    2
14c9  01           ?? 01h
14ca  34           ?? 34h    4
14cb  00           ?? 00h
14cc  35           ?? 35h    5
14cd  00           ?? 00h
14ce  34           ?? 34h    4
14cf  00           ?? 00h
14d0  35           ?? 35h    5
14d1  00           ?? 00h
14d2  34           ?? 34h    4
14d3  00           ?? 00h
14d4  35           ?? 35h    5
14d5  00           ?? 00h
14d6  34           ?? 34h    4
14d7  00           ?? 00h
14d8  35           ?? 35h    5
14d9  00           ?? 00h
14da  34           ?? 34h    4
14db  0F           ?? 0Fh
14dc  35           ?? 35h    5
14dd  03           ?? 03h
14de  37           ?? 37h    7
14df  03           ?? 03h
14e0  3A           ?? 3Ah    :
14e1  5F           ?? 5Fh    _
14e2  39           ?? 39h    9
14e3  5F           ?? 5Fh    _
14e4  BF           ?? BFh
14e5  32           ?? 32h    2
14e6  1F           ?? 1Fh
14e7  7F           ?? 7Fh    
14e8  FF           ?? FFh
14e9  81           ?? 81h
14ea  31           ?? 31h    1
14eb  01           ?? 01h
14ec  3D           ?? 3Dh    =
14ed  03           ?? 03h
14ee  31           ?? 31h    1
14ef  01           ?? 01h
14f0  3D           ?? 3Dh    =
14f1  01           ?? 01h
14f2  31           ?? 31h    1
14f3  01           ?? 01h
14f4  31           ?? 31h    1
14f5  01           ?? 01h
14f6  3D           ?? 3Dh    =
14f7  00           ?? 00h
14f8  3D           ?? 3Dh    =
14f9  00           ?? 00h
14fa  3D           ?? 3Dh    =
14fb  00           ?? 00h
14fc  3D           ?? 3Dh    =
14fd  00           ?? 00h
14fe  31           ?? 31h    1
14ff  01           ?? 01h
1500  31           ?? 31h    1
1501  01           ?? 01h
1502  31           ?? 31h    1
1503  03           ?? 03h
1504  25           ?? 25h    %
1505  03           ?? 03h
1506  31           ?? 31h    1
1507  01           ?? 01h
1508  FF           ?? FFh
1509  84           ?? 84h
150a  A1           ?? A1h
150b  26           ?? 26h    &
150c  01           ?? 01h
150d  28           ?? 28h    (
150e  01           ?? 01h
150f  26           ?? 26h    &
1510  01           ?? 01h
1511  29           ?? 29h    )
1512  01           ?? 01h
1513  26           ?? 26h    &
1514  01           ?? 01h
1515  2B           ?? 2Bh    +
1516  01           ?? 01h
1517  26           ?? 26h    &
1518  01           ?? 01h
1519  2D           ?? 2Dh    -
151a  01           ?? 01h
151b  26           ?? 26h    &
151c  01           ?? 01h
151d  2B           ?? 2Bh    +
151e  01           ?? 01h
151f  26           ?? 26h    &
1520  01           ?? 01h
1521  29           ?? 29h    )
1522  01           ?? 01h
1523  26           ?? 26h    &
1524  01           ?? 01h
1525  28           ?? 28h    (
1526  01           ?? 01h
1527  26           ?? 26h    &
1528  01           ?? 01h
1529  FF           ?? FFh
152a  82           ?? 82h
152b  32           ?? 32h    2
152c  01           ?? 01h
152d  3E           ?? 3Eh    >
152e  03           ?? 03h
152f  32           ?? 32h    2
1530  01           ?? 01h
1531  3E           ?? 3Eh    >
1532  01           ?? 01h
1533  32           ?? 32h    2
1534  01           ?? 01h
1535  32           ?? 32h    2
1536  01           ?? 01h
1537  3E           ?? 3Eh    >
1538  03           ?? 03h
1539  32           ?? 32h    2
153a  01           ?? 01h
153b  32           ?? 32h    2
153c  01           ?? 01h
153d  32           ?? 32h    2
153e  03           ?? 03h
153f  3E           ?? 3Eh    >
1540  01           ?? 01h
1541  26           ?? 26h    &
1542  03           ?? 03h
1543  FF           ?? FFh
1544  80           ?? 80h
1545  15           ?? 15h
1546  81           ?? 81h
1547  01           ?? 01h
1548  01           ?? 01h
1549  15           ?? 15h
154a  01           ?? 01h
154b  15           ?? 15h
154c  81           ?? 81h
154d  81           ?? 81h
154e  8F           ?? 8Fh
154f  15           ?? 15h
1550  01           ?? 01h
1551  21           ?? 21h    !
1552  81           ?? 81h
1553  11           ?? 11h
1554  1F           ?? 1Fh
1555  15           ?? 15h
1556  01           ?? 01h
1557  2D           ?? 2Dh    -
1558  81           ?? 81h
1559  31           ?? 31h    1
155a  3F           ?? 3Fh    ?
155b  21           ?? 21h    !
155c  01           ?? 01h
155d  2D           ?? 2Dh    -
155e  81           ?? 81h
155f  41           ?? 41h    A
1560  47           ?? 47h    G
1561  21           ?? 21h    !
1562  01           ?? 01h
1563  15           ?? 15h
1564  01           ?? 01h
1565  2D           ?? 2Dh    -
1566  81           ?? 81h
1567  F0           ?? F0h
1568  F0           ?? F0h
1569  21           ?? 21h    !
156a  01           ?? 01h
156b  15           ?? 15h
156c  81           ?? 81h
156d  08           ?? 08h
156e  08           ?? 08h
156f  21           ?? 21h    !
1570  23           ?? 23h    #
1571  C0           ?? C0h
1572  FF           ?? FFh
1573  FF           ?? FFh
1574  80           ?? 80h
1575  15           ?? 15h
1576  81           ?? 81h
1577  10           ?? 10h
1578  1F           ?? 1Fh
1579  15           ?? 15h
157a  01           ?? 01h
157b  21           ?? 21h    !
157c  81           ?? 81h
157d  20           ?? 20h     
157e  2F           ?? 2Fh    /
157f  15           ?? 15h
1580  03           ?? 03h
1581  21           ?? 21h    !
1582  81           ?? 81h
1583  30           ?? 30h    0
1584  3F           ?? 3Fh    ?
1585  2D           ?? 2Dh    -
1586  81           ?? 81h
1587  40           ?? 40h    @
1588  44           ?? 44h    D
1589  21           ?? 21h    !
158a  01           ?? 01h
158b  2D           ?? 2Dh    -
158c  81           ?? 81h
158d  10           ?? 10h
158e  11           ?? 11h
158f  21           ?? 21h    !
1590  03           ?? 03h
1591  2D           ?? 2Dh    -
1592  81           ?? 81h
1593  10           ?? 10h
1594  1F           ?? 1Fh
1595  21           ?? 21h    !
1596  01           ?? 01h
1597  15           ?? 15h
1598  81           ?? 81h
1599  FF           ?? FFh
159a  FF           ?? FFh
159b  21           ?? 21h    !
159c  23           ?? 23h    #
159d  C0           ?? C0h
159e  FF           ?? FFh
159f  FF           ?? FFh
15a0  80           ?? 80h
15a1  15           ?? 15h
15a2  81           ?? 81h
15a3  01           ?? 01h
15a4  11           ?? 11h
15a5  15           ?? 15h
15a6  01           ?? 01h
15a7  15           ?? 15h
15a8  81           ?? 81h
15a9  11           ?? 11h
15aa  12           ?? 12h
15ab  15           ?? 15h
15ac  01           ?? 01h
15ad  21           ?? 21h    !
15ae  81           ?? 81h
15af  22           ?? 22h    "
15b0  23           ?? 23h    #
15b1  15           ?? 15h
15b2  01           ?? 01h
15b3  2D           ?? 2Dh    -
15b4  81           ?? 81h
15b5  31           ?? 31h    1
15b6  34           ?? 34h    4
15b7  21           ?? 21h    !
15b8  01           ?? 01h
15b9  2D           ?? 2Dh    -
15ba  81           ?? 81h
15bb  41           ?? 41h    A
15bc  45           ?? 45h    E
15bd  21           ?? 21h    !
15be  01           ?? 01h
15bf  15           ?? 15h
15c0  01           ?? 01h
15c1  2D           ?? 2Dh    -
15c2  81           ?? 81h
15c3  F0           ?? F0h
15c4  F0           ?? F0h
15c5  21           ?? 21h    !
15c6  01           ?? 01h
15c7  15           ?? 15h
15c8  81           ?? 81h
15c9  08           ?? 08h
15ca  08           ?? 08h
15cb  21           ?? 21h    !
15cc  01           ?? 01h
15cd  15           ?? 15h
15ce  01           ?? 01h
15cf  FF           ?? FFh
15d0  83           ?? 83h
15d1  32           ?? 32h    2
15d2  1F           ?? 1Fh
15d3  B7           ?? B7h
15d4  34           ?? 34h    4
15d5  07           ?? 07h
15d6  35           ?? 35h    5
15d7  1F           ?? 1Fh
15d8  35           ?? 35h    5
15d9  63           ?? 63h    c
15da  50           ?? 50h    P
15db  00           ?? 00h
15dc  37           ?? 37h    7
15dd  47           ?? 47h    G
15de  35           ?? 35h    5
15df  0B           ?? 0Bh
15e0  37           ?? 37h    7
15e1  07           ?? 07h
15e2  FF           ?? FFh
15e3  83           ?? 83h
15e4  3E           ?? 3Eh    >
15e5  1F           ?? 1Fh
15e6  A3           ?? A3h
15e7  39           ?? 39h    9
15e8  03           ?? 03h
15e9  45           ?? 45h    E
15ea  03           ?? 03h
15eb  43           ?? 43h    C
15ec  03           ?? 03h
15ed  41           ?? 41h    A
15ee  03           ?? 03h
15ef  43           ?? 43h    C
15f0  07           ?? 07h
15f1  45           ?? 45h    E
15f2  03           ?? 03h
15f3  BF           ?? BFh
15f4  47           ?? 47h    G
15f5  67           ?? 67h    g
15f6  20           ?? 20h     
15f7  00           ?? 00h
15f8  48           ?? 48h    H
15f9  43           ?? 43h    C
15fa  47           ?? 47h    G
15fb  0B           ?? 0Bh
15fc  45           ?? 45h    E
15fd  03           ?? 03h
15fe  45           ?? 45h    E
15ff  63           ?? 63h    c
1600  40           ?? 40h    @
1601  FF           ?? FFh
1602  43           ?? 43h    C
1603  5F           ?? 5Fh    _
1604  A3           ?? A3h
1605  41           ?? 41h    A
1606  05           ?? 05h
1607  43           ?? 43h    C
1608  05           ?? 05h
1609  40           ?? 40h    @
160a  05           ?? 05h
160b  3C           ?? 3Ch    <
160c  05           ?? 05h
160d  35           ?? 35h    5
160e  03           ?? 03h
160f  34           ?? 34h    4
1610  00           ?? 00h
1611  35           ?? 35h    5
1612  00           ?? 00h
1613  34           ?? 34h    4
1614  00           ?? 00h
1615  35           ?? 35h    5
1616  00           ?? 00h
1617  34           ?? 34h    4
1618  00           ?? 00h
1619  35           ?? 35h    5
161a  00           ?? 00h
161b  34           ?? 34h    4
161c  00           ?? 00h
161d  35           ?? 35h    5
161e  00           ?? 00h
161f  34           ?? 34h    4
1620  00           ?? 00h
1621  35           ?? 35h    5
1622  00           ?? 00h
1623  34           ?? 34h    4
1624  00           ?? 00h
1625  35           ?? 35h    5
1626  00           ?? 00h
1627  34           ?? 34h    4
1628  00           ?? 00h
1629  35           ?? 35h    5
162a  00           ?? 00h
162b  34           ?? 34h    4
162c  00           ?? 00h
162d  35           ?? 35h    5
162e  00           ?? 00h
162f  34           ?? 34h    4
1630  00           ?? 00h
1631  35           ?? 35h    5
1632  00           ?? 00h
1633  34           ?? 34h    4
1634  00           ?? 00h
1635  35           ?? 35h    5
1636  00           ?? 00h
1637  34           ?? 34h    4
1638  00           ?? 00h
1639  35           ?? 35h    5
163a  00           ?? 00h
163b  34           ?? 34h    4
163c  00           ?? 00h
163d  35           ?? 35h    5
163e  00           ?? 00h
163f  34           ?? 34h    4
1640  00           ?? 00h
1641  35           ?? 35h    5
1642  00           ?? 00h
1643  34           ?? 34h    4
1644  00           ?? 00h
1645  35           ?? 35h    5
1646  00           ?? 00h
1647  34           ?? 34h    4
1648  00           ?? 00h
1649  35           ?? 35h    5
164a  00           ?? 00h
164b  34           ?? 34h    4
164c  00           ?? 00h
164d  35           ?? 35h    5
164e  00           ?? 00h
164f  34           ?? 34h    4
1650  0D           ?? 0Dh
1651  34           ?? 34h    4
1652  05           ?? 05h
1653  35           ?? 35h    5
1654  05           ?? 05h
1655  37           ?? 37h    7
1656  05           ?? 05h
1657  FF           ?? FFh
1658  67           ?? 67h    g
1659  FF           ?? FFh
165a  83           ?? 83h
165b  3A           ?? 3Ah    :
165c  05           ?? 05h
165d  39           ?? 39h    9
165e  05           ?? 05h
165f  37           ?? 37h    7
1660  03           ?? 03h
1661  35           ?? 35h    5
1662  1F           ?? 1Fh
1663  AB           ?? ABh
1664  35           ?? 35h    5
1665  03           ?? 03h
1666  35           ?? 35h    5
1667  05           ?? 05h
1668  34           ?? 34h    4
1669  05           ?? 05h
166a  35           ?? 35h    5
166b  63           ?? 63h    c
166c  40           ?? 40h    @
166d  00           ?? 00h
166e  34           ?? 34h    4
166f  57           ?? 57h    W
1670  32           ?? 32h    2
1671  07           ?? 07h
1672  31           ?? 31h    1
1673  17           ?? 17h
1674  2E           ?? 2Eh    .
1675  07           ?? 07h
1676  2D           ?? 2Dh    -
1677  1F           ?? 1Fh
1678  B7           ?? B7h
1679  FF           ?? FFh
167a  83           ?? 83h
167b  3A           ?? 3Ah    :
167c  01           ?? 01h
167d  3C           ?? 3Ch    <
167e  01           ?? 01h
167f  3A           ?? 3Ah    :
1680  01           ?? 01h
1681  39           ?? 39h    9
1682  01           ?? 01h
1683  FF           ?? FFh
1684  80           ?? 80h
1685  15           ?? 15h
1686  80           ?? 80h
1687  00           ?? 00h
1688  00           ?? 00h
1689  15           ?? 15h
168a  00           ?? 00h
168b  15           ?? 15h
168c  01           ?? 01h
168d  15           ?? 15h
168e  01           ?? 01h
168f  15           ?? 15h
1690  01           ?? 01h
1691  21           ?? 21h    !
1692  01           ?? 01h
1693  15           ?? 15h
1694  01           ?? 01h
1695  39           ?? 39h    9
1696  01           ?? 01h
1697  15           ?? 15h
1698  01           ?? 01h
1699  39           ?? 39h    9
169a  01           ?? 01h
169b  15           ?? 15h
169c  01           ?? 01h
169d  15           ?? 15h
169e  01           ?? 01h
169f  39           ?? 39h    9
16a0  01           ?? 01h
16a1  21           ?? 21h    !
16a2  01           ?? 01h
16a3  15           ?? 15h
16a4  01           ?? 01h
16a5  15           ?? 15h
16a6  23           ?? 23h    #
16a7  C0           ?? C0h
16a8  FF           ?? FFh
16a9  15           ?? 15h
16aa  00           ?? 00h
16ab  15           ?? 15h
16ac  00           ?? 00h
16ad  15           ?? 15h
16ae  01           ?? 01h
16af  15           ?? 15h
16b0  01           ?? 01h
16b1  15           ?? 15h
16b2  01           ?? 01h
16b3  21           ?? 21h    !
16b4  01           ?? 01h
16b5  15           ?? 15h
16b6  01           ?? 01h
16b7  39           ?? 39h    9
16b8  01           ?? 01h
16b9  15           ?? 15h
16ba  01           ?? 01h
16bb  39           ?? 39h    9
16bc  01           ?? 01h
16bd  15           ?? 15h
16be  01           ?? 01h
16bf  15           ?? 15h
16c0  01           ?? 01h
16c1  39           ?? 39h    9
16c2  01           ?? 01h
16c3  21           ?? 21h    !
16c4  01           ?? 01h
16c5  15           ?? 15h
16c6  01           ?? 01h
16c7  21           ?? 21h    !
16c8  00           ?? 00h
16c9  21           ?? 21h    !
16ca  00           ?? 00h
16cb  21           ?? 21h    !
16cc  01           ?? 01h
16cd  FF           ?? FFh
16ce  83           ?? 83h
16cf  2D           ?? 2Dh    -
16d0  1F           ?? 1Fh
16d1  BF           ?? BFh
16d2  FF           ?? FFh
16d3  83           ?? 83h
16d4  32           ?? 32h    2
16d5  1F           ?? 1Fh
16d6  B7           ?? B7h
16d7  32           ?? 32h    2
16d8  01           ?? 01h
16d9  34           ?? 34h    4
16da  01           ?? 01h
16db  32           ?? 32h    2
16dc  01           ?? 01h
16dd  30           ?? 30h    0
16de  01           ?? 01h
16df  39           ?? 39h    9
16e0  1B           ?? 1Bh
16e1  39           ?? 39h    9
16e2  01           ?? 01h
16e3  3B           ?? 3Bh    ;
16e4  01           ?? 01h
16e5  3C           ?? 3Ch    <
16e6  10           ?? 10h
16e7  3B           ?? 3Bh    ;
16e8  07           ?? 07h
16e9  37           ?? 37h    7
16ea  07           ?? 07h
16eb  39           ?? 39h    9
16ec  01           ?? 01h
16ed  37           ?? 37h    7
16ee  01           ?? 01h
16ef  39           ?? 39h    9
16f0  1A           ?? 1Ah
16f1  2D           ?? 2Dh    -
16f2  1F           ?? 1Fh
16f3  FF           ?? FFh
16f4  83           ?? 83h
16f5  34           ?? 34h    4
16f6  00           ?? 00h
16f7  35           ?? 35h    5
16f8  00           ?? 00h
16f9  34           ?? 34h    4
16fa  00           ?? 00h
16fb  35           ?? 35h    5
16fc  00           ?? 00h
16fd  34           ?? 34h    4
16fe  00           ?? 00h
16ff  35           ?? 35h    5
1700  00           ?? 00h
1701  34           ?? 34h    4
1702  00           ?? 00h
1703  35           ?? 35h    5
1704  00           ?? 00h
1705  34           ?? 34h    4
1706  01           ?? 01h
1707  35           ?? 35h    5
1708  41           ?? 41h    A
1709  34           ?? 34h    4
170a  01           ?? 01h
170b  34           ?? 34h    4
170c  01           ?? 01h
170d  35           ?? 35h    5
170e  41           ?? 41h    A
170f  37           ?? 37h    7
1710  41           ?? 41h    A
1711  39           ?? 39h    9
1712  41           ?? 41h    A
1713  3C           ?? 3Ch    <
1714  5F           ?? 5Fh    _
1715  A9           ?? A9h
1716  40           ?? 40h    @
1717  67           ?? 67h    g
1718  A0           ?? A0h
1719  00           ?? 00h
171a  45           ?? 45h    E
171b  5F           ?? 5Fh    _
171c  A7           ?? A7h
171d  43           ?? 43h    C
171e  41           ?? 41h    A
171f  41           ?? 41h    A
1720  41           ?? 41h    A
1721  43           ?? 43h    C
1722  41           ?? 41h    A
1723  41           ?? 41h    A
1724  41           ?? 41h    A
1725  40           ?? 40h    @
1726  41           ?? 41h    A
1727  41           ?? 41h    A
1728  41           ?? 41h    A
1729  40           ?? 40h    @
172a  41           ?? 41h    A
172b  3C           ?? 3Ch    <
172c  41           ?? 41h    A
172d  3E           ?? 3Eh    >
172e  1F           ?? 1Fh
172f  7F           ?? 7Fh    
1730  39           ?? 39h    9
1731  1F           ?? 1Fh
1732  39           ?? 39h    9
1733  1F           ?? 1Fh
1734  FF           ?? FFh
1735  83           ?? 83h
1736  34           ?? 34h    4
1737  1F           ?? 1Fh
1738  A7           ?? A7h
1739  34           ?? 34h    4
173a  03           ?? 03h
173b  32           ?? 32h    2
173c  03           ?? 03h
173d  34           ?? 34h    4
173e  03           ?? 03h
173f  35           ?? 35h    5
1740  03           ?? 03h
1741  34           ?? 34h    4
1742  03           ?? 03h
1743  35           ?? 35h    5
1744  03           ?? 03h
1745  37           ?? 37h    7
1746  1F           ?? 1Fh
1747  39           ?? 39h    9
1748  0B           ?? 0Bh
1749  3A           ?? 3Ah    :
174a  0B           ?? 0Bh
174b  39           ?? 39h    9
174c  07           ?? 07h
174d  FF           ?? FFh
174e  83           ?? 83h
174f  3A           ?? 3Ah    :
1750  13           ?? 13h
1751  35           ?? 35h    5
1752  03           ?? 03h
1753  3A           ?? 3Ah    :
1754  03           ?? 03h
1755  3C           ?? 3Ch    <
1756  03           ?? 03h
1757  3E           ?? 3Eh    >
1758  13           ?? 13h
1759  41           ?? 41h    A
175a  03           ?? 03h
175b  40           ?? 40h    @
175c  03           ?? 03h
175d  41           ?? 41h    A
175e  00           ?? 00h
175f  40           ?? 40h    @
1760  00           ?? 00h
1761  41           ?? 41h    A
1762  00           ?? 00h
1763  40           ?? 40h    @
1764  00           ?? 00h
1765  3E           ?? 3Eh    >
1766  17           ?? 17h
1767  3C           ?? 3Ch    <
1768  03           ?? 03h
1769  3C           ?? 3Ch    <
176a  63           ?? 63h    c
176b  C0           ?? C0h
176c  FF           ?? FFh
176d  3A           ?? 3Ah    :
176e  4B           ?? 4Bh    K
176f  3C           ?? 3Ch    <
1770  0B           ?? 0Bh
1771  3C           ?? 3Ch    <
1772  67           ?? 67h    g
1773  40           ?? 40h    @
1774  00           ?? 00h
1775  39           ?? 39h    9
1776  5F           ?? 5Fh    _
1777  BF           ?? BFh
1778  39           ?? 39h    9
1779  1F           ?? 1Fh
177a  BF           ?? BFh
177b  FF           ?? FFh
177c  80           ?? 80h
177d  13           ?? 13h
177e  83           ?? 83h
177f  16           ?? 16h
1780  1A           ?? 1Ah
1781  13           ?? 13h
1782  81           ?? 81h
1783  25           ?? 25h    %
1784  2B           ?? 2Bh    +
1785  13           ?? 13h
1786  81           ?? 81h
1787  34           ?? 34h    4
1788  3C           ?? 3Ch    <
1789  1F           ?? 1Fh
178a  83           ?? 83h
178b  43           ?? 43h    C
178c  4D           ?? 4Dh    M
178d  13           ?? 13h
178e  87           ?? 87h
178f  52           ?? 52h    R
1790  5E           ?? 5Eh    ^
1791  13           ?? 13h
1792  83           ?? 83h
1793  61           ?? 61h    a
1794  6F           ?? 6Fh    o
1795  FF           ?? FFh
1796  BF           ?? BFh
1797  FF           ?? FFh
1798  82           ?? 82h
1799  37           ?? 37h    7
179a  01           ?? 01h
179b  43           ?? 43h    C
179c  01           ?? 01h
179d  37           ?? 37h    7
179e  01           ?? 01h
179f  37           ?? 37h    7
17a0  01           ?? 01h
17a1  43           ?? 43h    C
17a2  01           ?? 01h
17a3  37           ?? 37h    7
17a4  01           ?? 01h
17a5  37           ?? 37h    7
17a6  01           ?? 01h
17a7  43           ?? 43h    C
17a8  03           ?? 03h
17a9  43           ?? 43h    C
17aa  01           ?? 01h
17ab  37           ?? 37h    7
17ac  01           ?? 01h
17ad  2B           ?? 2Bh    +
17ae  01           ?? 01h
17af  FF           ?? FFh
17b0  83           ?? 83h
17b1  43           ?? 43h    C
17b2  0B           ?? 0Bh
17b3  45           ?? 45h    E
17b4  0B           ?? 0Bh
17b5  48           ?? 48h    H
17b6  17           ?? 17h
17b7  46           ?? 46h    F
17b8  01           ?? 01h
17b9  45           ?? 45h    E
17ba  01           ?? 01h
17bb  46           ?? 46h    F
17bc  01           ?? 01h
17bd  43           ?? 43h    C
17be  1F           ?? 1Fh
17bf  BF           ?? BFh
17c0  79           ?? 79h    y
17c1  43           ?? 43h    C
17c2  03           ?? 03h
17c3  43           ?? 43h    C
17c4  63           ?? 63h    c
17c5  A0           ?? A0h
17c6  FF           ?? FFh
17c7  41           ?? 41h    A
17c8  43           ?? 43h    C
17c9  43           ?? 43h    C
17ca  03           ?? 03h
17cb  43           ?? 43h    C
17cc  63           ?? 63h    c
17cd  A0           ?? A0h
17ce  FF           ?? FFh
17cf  41           ?? 41h    A
17d0  43           ?? 43h    C
17d1  43           ?? 43h    C
17d2  03           ?? 03h
17d3  43           ?? 43h    C
17d4  63           ?? 63h    c
17d5  A0           ?? A0h
17d6  FF           ?? FFh
17d7  41           ?? 41h    A
17d8  43           ?? 43h    C
17d9  43           ?? 43h    C
17da  05           ?? 05h
17db  45           ?? 45h    E
17dc  05           ?? 05h
17dd  48           ?? 48h    H
17de  1F           ?? 1Fh
17df  AF           ?? AFh
17e0  46           ?? 46h    F
17e1  01           ?? 01h
17e2  45           ?? 45h    E
17e3  01           ?? 01h
17e4  46           ?? 46h    F
17e5  01           ?? 01h
17e6  43           ?? 43h    C
17e7  1F           ?? 1Fh
17e8  A9           ?? A9h
17e9  AF           ?? AFh
17ea  6F           ?? 6Fh    o
17eb  FF           ?? FFh
17ec  67           ?? 67h    g
17ed  FF           ?? FFh
17ee  77           ?? 77h    w
17ef  FF           ?? FFh
17f0  83           ?? 83h
17f1  43           ?? 43h    C
17f2  0B           ?? 0Bh
17f3  43           ?? 43h    C
17f4  63           ?? 63h    c
17f5  B0           ?? B0h
17f6  FF           ?? FFh
17f7  41           ?? 41h    A
17f8  1B           ?? 1Bh
17f9  3E           ?? 3Eh    >
17fa  03           ?? 03h
17fb  45           ?? 45h    E
17fc  07           ?? 07h
17fd  41           ?? 41h    A
17fe  03           ?? 03h
17ff  41           ?? 41h    A
1800  01           ?? 01h
1801  43           ?? 43h    C
1802  00           ?? 00h
1803  45           ?? 45h    E
1804  00           ?? 00h
1805  43           ?? 43h    C
1806  01           ?? 01h
1807  41           ?? 41h    A
1808  01           ?? 01h
1809  3E           ?? 3Eh    >
180a  1B           ?? 1Bh
180b  BF           ?? BFh
180c  6F           ?? 6Fh    o
180d  FF           ?? FFh
180e  7F           ?? 7Fh    
180f  FF           ?? FFh
1810  83           ?? 83h
1811  2D           ?? 2Dh    -
1812  1F           ?? 1Fh
1813  FF           ?? FFh
1814  03           ?? 03h
1815  50           ?? 50h    P
1816  00           ?? 00h
1817  00           ?? 00h
1818  09           ?? 09h
1819  00           ?? 00h
181a  03           ?? 03h
181b  30           ?? 30h    0
181c  00           ?? 00h
181d  00           ?? 00h
181e  09           ?? 09h
181f  00           ?? 00h
1820  03           ?? 03h
1821  10           ?? 10h
1822  00           ?? 00h
1823  00           ?? 00h
1824  09           ?? 09h
1825  00           ?? 00h
1826  03           ?? 03h
1827  00           ?? 00h
1828  03           ?? 03h
1829  00           ?? 00h
182a  05           ?? 05h
182b  00           ?? 00h
182c  00           ?? 00h
182d  00           ?? 00h
182e  05           ?? 05h
182f  00           ?? 00h
1830  00           ?? 00h
1831  00           ?? 00h
1832  06           ?? 06h
1833  00           ?? 00h
1834  07           ?? 07h
1835  00           ?? 00h
1836  09           ?? 09h
1837  0F           ?? 0Fh
1838  05           ?? 05h
1839  00           ?? 00h
183a  00           ?? 00h
183b  02           ?? 02h
183c  05           ?? 05h
183d  00           ?? 00h
183e  00           ?? 00h
183f  02           ?? 02h
1840  09           ?? 09h
1841  01           ?? 01h
1842  09           ?? 09h
1843  04           ?? 04h
1844  0A           ?? 0Ah
1845  00           ?? 00h
1846  03           ?? 03h
1847  50           ?? 50h    P
1848  00           ?? 00h
1849  01           ?? 01h
184a  03           ?? 03h
184b  70           ?? 70h    p
184c  00           ?? 00h
184d  01           ?? 01h
184e  03           ?? 03h
184f  81           ?? 81h
1850  03           ?? 03h
1851  70           ?? 70h    p
1852  00           ?? 00h
1853  01           ?? 01h
1854  03           ?? 03h
1855  50           ?? 50h    P
1856  00           ?? 00h
1857  01           ?? 01h
1858  09           ?? 09h
1859  03           ?? 03h
185a  0E           ?? 0Eh
185b  00           ?? 00h
185c  0F           ?? 0Fh
185d  00           ?? 00h
185e  10           ?? 10h
185f  00           ?? 00h
1860  13           ?? 13h
1861  00           ?? 00h
1862  14           ?? 14h
1863  05           ?? 05h
1864  15           ?? 15h
1865  00           ?? 00h
1866  16           ?? 16h
1867  00           ?? 00h
1868  0E           ?? 0Eh
1869  00           ?? 00h
186a  0F           ?? 0Fh
186b  00           ?? 00h
186c  10           ?? 10h
186d  00           ?? 00h
186e  13           ?? 13h
186f  00           ?? 00h
1870  14           ?? 14h
1871  05           ?? 05h
1872  15           ?? 15h
1873  00           ?? 00h
1874  16           ?? 16h
1875  00           ?? 00h
1876  0E           ?? 0Eh
1877  00           ?? 00h
1878  0F           ?? 0Fh
1879  00           ?? 00h
187a  10           ?? 10h
187b  00           ?? 00h
187c  13           ?? 13h
187d  00           ?? 00h
187e  14           ?? 14h
187f  05           ?? 05h
1880  15           ?? 15h
1881  00           ?? 00h
1882  16           ?? 16h
1883  00           ?? 00h
1884  09           ?? 09h
1885  01           ?? 01h
1886  17           ?? 17h
1887  0F           ?? 0Fh
1888  18           ?? 18h
1889  00           ?? 00h
188a  19           ?? 19h
188b  00           ?? 00h
188c  1A           ?? 1Ah
188d  01           ?? 01h
188e  18           ?? 18h
188f  00           ?? 00h
1890  19           ?? 19h
1891  00           ?? 00h
1892  1A           ?? 1Ah
1893  01           ?? 01h
1894  18           ?? 18h
1895  00           ?? 00h
1896  19           ?? 19h
1897  00           ?? 00h
1898  1A           ?? 1Ah
1899  01           ?? 01h
189a  09           ?? 09h
189b  00           ?? 00h
189c  0A           ?? 0Ah
189d  00           ?? 00h
189e  FF           ?? FFh
189f  01           ?? 01h
18a0  03           ?? 03h
18a1  04           ?? 04h
18a2  33           ?? 33h    3
18a3  04           ?? 04h
18a4  13           ?? 13h
18a5  01           ?? 01h
18a6  01           ?? 01h
18a7  04           ?? 04h
18a8  01           ?? 01h
18a9  01           ?? 01h
18aa  04           ?? 04h
18ab  04           ?? 04h
18ac  01           ?? 01h
18ad  01           ?? 01h
18ae  04           ?? 04h
18af  04           ?? 04h
18b0  01           ?? 01h
18b1  04           ?? 04h
18b2  33           ?? 33h    3
18b3  04           ?? 04h
18b4  11           ?? 11h
18b5  01           ?? 01h
18b6  00           ?? 00h
18b7  04           ?? 04h
18b8  00           ?? 00h
18b9  01           ?? 01h
18ba  00           ?? 00h
18bb  04           ?? 04h
18bc  30           ?? 30h    0
18bd  04           ?? 04h
18be  12           ?? 12h
18bf  01           ?? 01h
18c0  01           ?? 01h
18c1  09           ?? 09h
18c2  0B           ?? 0Bh
18c3  01           ?? 01h
18c4  01           ?? 01h
18c5  04           ?? 04h
18c6  01           ?? 01h
18c7  01           ?? 01h
18c8  04           ?? 04h
18c9  04           ?? 04h
18ca  03           ?? 03h
18cb  01           ?? 01h
18cc  04           ?? 04h
18cd  04           ?? 04h
18ce  03           ?? 03h
18cf  01           ?? 01h
18d0  00           ?? 00h
18d1  04           ?? 04h
18d2  30           ?? 30h    0
18d3  04           ?? 04h
18d4  10           ?? 10h
18d5  01           ?? 01h
18d6  00           ?? 00h
18d7  04           ?? 04h
18d8  01           ?? 01h
18d9  09           ?? 09h
18da  01           ?? 01h
18db  0B           ?? 0Bh
18dc  0F           ?? 0Fh
18dd  0B           ?? 0Bh
18de  03           ?? 03h
18df  01           ?? 01h
18e0  03           ?? 03h
18e1  01           ?? 01h
18e2  03           ?? 03h
18e3  04           ?? 04h
18e4  33           ?? 33h    3
18e5  04           ?? 04h
18e6  13           ?? 13h
18e7  01           ?? 01h
18e8  01           ?? 01h
18e9  04           ?? 04h
18ea  01           ?? 01h
18eb  01           ?? 01h
18ec  03           ?? 03h
18ed  04           ?? 04h
18ee  33           ?? 33h    3
18ef  04           ?? 04h
18f0  13           ?? 13h
18f1  01           ?? 01h
18f2  01           ?? 01h
18f3  04           ?? 04h
18f4  01           ?? 01h
18f5  01           ?? 01h
18f6  03           ?? 03h
18f7  04           ?? 04h
18f8  33           ?? 33h    3
18f9  04           ?? 04h
18fa  13           ?? 13h
18fb  01           ?? 01h
18fc  01           ?? 01h
18fd  04           ?? 04h
18fe  01           ?? 01h
18ff  01           ?? 01h
1900  03           ?? 03h
1901  04           ?? 04h
1902  33           ?? 33h    3
1903  04           ?? 04h
1904  13           ?? 13h
1905  01           ?? 01h
1906  01           ?? 01h
1907  04           ?? 04h
1908  01           ?? 01h
1909  01           ?? 01h
190a  03           ?? 03h
190b  04           ?? 04h
190c  33           ?? 33h    3
190d  04           ?? 04h
190e  13           ?? 13h
190f  01           ?? 01h
1910  01           ?? 01h
1911  04           ?? 04h
1912  01           ?? 01h
1913  01           ?? 01h
1914  03           ?? 03h
1915  04           ?? 04h
1916  33           ?? 33h    3
1917  04           ?? 04h
1918  13           ?? 13h
1919  01           ?? 01h
191a  01           ?? 01h
191b  04           ?? 04h
191c  01           ?? 01h
191d  09           ?? 09h
191e  01           ?? 01h
191f  12           ?? 12h
1920  0F           ?? 0Fh
1921  12           ?? 12h
1922  0F           ?? 0Fh
1923  12           ?? 12h
1924  0F           ?? 0Fh
1925  12           ?? 12h
1926  07           ?? 07h
1927  1A           ?? 1Ah
1928  01           ?? 01h
1929  18           ?? 18h
192a  00           ?? 00h
192b  19           ?? 19h
192c  00           ?? 00h
192d  09           ?? 09h
192e  01           ?? 01h
192f  FF           ?? FFh
1930  02           ?? 02h
1931  53           ?? 53h    S
1932  02           ?? 02h
1933  33           ?? 33h    3
1934  02           ?? 02h
1935  13           ?? 13h
1936  02           ?? 02h
1937  03           ?? 03h
1938  02           ?? 02h
1939  54           ?? 54h    T
193a  02           ?? 02h
193b  01           ?? 01h
193c  02           ?? 02h
193d  54           ?? 54h    T
193e  02           ?? 02h
193f  01           ?? 01h
1940  02           ?? 02h
1941  33           ?? 33h    3
1942  02           ?? 02h
1943  11           ?? 11h
1944  02           ?? 02h
1945  01           ?? 01h
1946  08           ?? 08h
1947  50           ?? 50h    P
1948  08           ?? 08h
1949  30           ?? 30h    0
194a  08           ?? 08h
194b  10           ?? 10h
194c  08           ?? 08h
194d  01           ?? 01h
194e  08           ?? 08h
194f  51           ?? 51h    Q
1950  08           ?? 08h
1951  53           ?? 53h    S
1952  02           ?? 02h
1953  33           ?? 33h    3
1954  08           ?? 08h
1955  13           ?? 13h
1956  02           ?? 02h
1957  03           ?? 03h
1958  02           ?? 02h
1959  54           ?? 54h    T
195a  02           ?? 02h
195b  03           ?? 03h
195c  02           ?? 02h
195d  54           ?? 54h    T
195e  02           ?? 02h
195f  03           ?? 03h
1960  02           ?? 02h
1961  50           ?? 50h    P
1962  02           ?? 02h
1963  30           ?? 30h    0
1964  02           ?? 02h
1965  10           ?? 10h
1966  02           ?? 02h
1967  02           ?? 02h
1968  09           ?? 09h
1969  01           ?? 01h
196a  0C           ?? 0Ch
196b  53           ?? 53h    S
196c  0C           ?? 0Ch
196d  33           ?? 33h    3
196e  0C           ?? 0Ch
196f  13           ?? 13h
1970  0C           ?? 0Ch
1971  33           ?? 33h    3
1972  0C           ?? 0Ch
1973  53           ?? 53h    S
1974  0C           ?? 0Ch
1975  53           ?? 53h    S
1976  0D           ?? 0Dh
1977  51           ?? 51h    Q
1978  0D           ?? 0Dh
1979  31           ?? 31h    1
197a  0D           ?? 0Dh
197b  11           ?? 11h
197c  0D           ?? 0Dh
197d  01           ?? 01h
197e  0D           ?? 0Dh
197f  51           ?? 51h    Q
1980  0D           ?? 0Dh
1981  31           ?? 31h    1
1982  0D           ?? 0Dh
1983  11           ?? 11h
1984  0D           ?? 0Dh
1985  01           ?? 01h
1986  16           ?? 16h
1987  00           ?? 00h
1988  0E           ?? 0Eh
1989  00           ?? 00h
198a  0F           ?? 0Fh
198b  00           ?? 00h
198c  10           ?? 10h
198d  00           ?? 00h
198e  13           ?? 13h
198f  00           ?? 00h
1990  14           ?? 14h
1991  05           ?? 05h
1992  15           ?? 15h
1993  00           ?? 00h
1994  0D           ?? 0Dh
1995  51           ?? 51h    Q
1996  0D           ?? 0Dh
1997  31           ?? 31h    1
1998  0D           ?? 0Dh
1999  11           ?? 11h
199a  0D           ?? 0Dh
199b  01           ?? 01h
199c  0D           ?? 0Dh
199d  51           ?? 51h    Q
199e  0D           ?? 0Dh
199f  31           ?? 31h    1
19a0  0D           ?? 0Dh
19a1  11           ?? 11h
19a2  0D           ?? 0Dh
19a3  01           ?? 01h
19a4  09           ?? 09h
19a5  01           ?? 01h
19a6  11           ?? 11h
19a7  C3           ?? C3h
19a8  11           ?? 11h
19a9  A3           ?? A3h
19aa  11           ?? 11h
19ab  81           ?? 81h
19ac  11           ?? 11h
19ad  71           ?? 71h    q
19ae  11           ?? 11h
19af  03           ?? 03h
19b0  11           ?? 11h
19b1  0F           ?? 0Fh
19b2  11           ?? 11h
19b3  03           ?? 03h
19b4  1A           ?? 1Ah
19b5  00           ?? 00h
19b6  18           ?? 18h
19b7  00           ?? 00h
19b8  19           ?? 19h
19b9  00           ?? 00h
19ba  1A           ?? 1Ah
19bb  01           ?? 01h
19bc  18           ?? 18h
19bd  00           ?? 00h
19be  19           ?? 19h
19bf  00           ?? 00h
19c0  1A           ?? 1Ah
19c1  00           ?? 00h
19c2  09           ?? 09h
19c3  01           ?? 01h
19c4  FF           ?? FFh
19c5  41           ?? 41h    A
19c6  03           ?? 03h
19c7  00           ?? 00h
19c8  41           ?? 41h    A
19c9  03           ?? 03h
19ca  00           ?? 00h
19cb  41           ?? 41h    A
19cc  08           ?? 08h
19cd  00           ?? 00h
19ce  41           ?? 41h    A
19cf  08           ?? 08h
19d0  00           ?? 00h
19d1  41           ?? 41h    A
19d2  08           ?? 08h
19d3  00           ?? 00h
19d4  41           ?? 41h    A
19d5  0A           ?? 0Ah
19d6  00           ?? 00h
19d7  41           ?? 41h    A
19d8  0A           ?? 0Ah
19d9  00           ?? 00h
19da  41           ?? 41h    A
19db  0A           ?? 0Ah
19dc  00           ?? 00h
19dd  FF           ?? FFh
19de  41           ?? 41h    A
19df  03           ?? 03h
19e0  00           ?? 00h
19e1  41           ?? 41h    A
19e2  03           ?? 03h
19e3  00           ?? 00h
19e4  41           ?? 41h    A
19e5  07           ?? 07h
19e6  00           ?? 00h
19e7  41           ?? 41h    A
19e8  07           ?? 07h
19e9  00           ?? 00h
19ea  41           ?? 41h    A
19eb  07           ?? 07h
19ec  00           ?? 00h
19ed  41           ?? 41h    A
19ee  0C           ?? 0Ch
19ef  00           ?? 00h
19f0  41           ?? 41h    A
19f1  0C           ?? 0Ch
19f2  00           ?? 00h
19f3  41           ?? 41h    A
19f4  0C           ?? 0Ch
19f5  00           ?? 00h
19f6  FF           ?? FFh
19f7  00           ?? 00h
19f8  00           ?? 00h
19f9  00           ?? 00h
19fa  00           ?? 00h
19fb  00           ?? 00h
19fc  00           ?? 00h
19fd  00           ?? 00h
19fe  00           ?? 00h
19ff  00           ?? 00h
1a00  00           ?? 00h
1a01  00           ?? 00h
1a02  00           ?? 00h
1a03  00           ?? 00h
1a04  00           ?? 00h
1a05  00           ?? 00h
1a06  00           ?? 00h
1a07  00           ?? 00h
1a08  00           ?? 00h
1a09  00           ?? 00h
1a0a  00           ?? 00h
1a0b  00           ?? 00h
1a0c  00           ?? 00h
1a0d  00           ?? 00h
1a0e  00           ?? 00h
1a0f  FE           ?? FEh
1a10  00           ?? 00h
1a11  00           ?? 00h
1a12  00           ?? 00h
1a13  00           ?? 00h
1a14  00           ?? 00h
1a15  00           ?? 00h
1a16  00           ?? 00h
1a17  00           ?? 00h
1a18  00           ?? 00h
1a19  00           ?? 00h
1a1a  00           ?? 00h
1a1b  00           ?? 00h
1a1c  00           ?? 00h
1a1d  00           ?? 00h
1a1e  00           ?? 00h
1a1f  00           ?? 00h
1a20  00           ?? 00h
1a21  00           ?? 00h
1a22  00           ?? 00h
1a23  00           ?? 00h
1a24  00           ?? 00h
1a25  00           ?? 00h
1a26  00           ?? 00h
1a27  00           ?? 00h
1a28  00           ?? 00h
1a29  00           ?? 00h
1a2a  00           ?? 00h
1a2b  00           ?? 00h
1a2c  00           ?? 00h
1a2d  00           ?? 00h
1a2e  00           ?? 00h
1a2f  00           ?? 00h
1a30  00           ?? 00h
1a31  00           ?? 00h
1a32  00           ?? 00h
1a33  00           ?? 00h
1a34  FE           ?? FEh
1a35  00           ?? 00h
1a36  00           ?? 00h
1a37  00           ?? 00h
1a38  00           ?? 00h
1a39  00           ?? 00h
1a3a  00           ?? 00h
1a3b  00           ?? 00h
1a3c  00           ?? 00h
1a3d  00           ?? 00h
1a3e  00           ?? 00h
1a3f  00           ?? 00h
1a40  00           ?? 00h
1a41  00           ?? 00h
1a42  00           ?? 00h
1a43  00           ?? 00h
1a44  00           ?? 00h
1a45  00           ?? 00h
1a46  00           ?? 00h
1a47  00           ?? 00h
1a48  00           ?? 00h
1a49  00           ?? 00h
1a4a  00           ?? 00h
1a4b  00           ?? 00h
1a4c  00           ?? 00h
1a4d  FE           ?? FEh
1a4e  17           ?? 17h
1a4f  15           ?? 15h
1a50  15           ?? 15h
1a51  16           ?? 16h
1a52  14           ?? 14h
1a53  16           ?? 16h
1a54  16           ?? 16h
1a55  14           ?? 14h
1a56  15           ?? 15h
1a57  18           ?? 18h
1a58  18           ?? 18h
1a59  15           ?? 15h
1a5a  15           ?? 15h
1a5b  16           ?? 16h
1a5c  15           ?? 15h
1a5d  17           ?? 17h
1a5e  17           ?? 17h
1a5f  17           ?? 17h
1a60  17           ?? 17h
1a61  15           ?? 15h
1a62  16           ?? 16h
1a63  16           ?? 16h
1a64  16           ?? 16h
1a65  17           ?? 17h
1a66  17           ?? 17h
1a67  17           ?? 17h
1a68  17           ?? 17h
1a69  00           ?? 00h
1a6a  96           ?? 96h
1a6b  2A           ?? 2Ah    *
1a6c  44           ?? 44h    D
1a6d  CE           ?? CEh
1a6e  E9           ?? E9h
1a6f  D3           ?? D3h
1a70  F4           ?? F4h
1a71  BF           ?? BFh
1a72  74           ?? 74h    t
1a73  0E           ?? 0Eh
1a74  10           ?? 10h
1a75  09           ?? 09h
1a76  A0           ?? A0h
1a77  84           ?? 84h
1a78  D0           ?? D0h
1a79  35           ?? 35h    5
1a7a  4E           ?? 4Eh    N
1a7b  7C           ?? 7Ch    |
1a7c  98           ?? 98h
1a7d  E3           ?? E3h
1a7e  7A           ?? 7Ah    z
1a7f  5A           ?? 5Ah    Z
1a80  58           ?? 58h    X
1a81  EE           ?? EEh
1a82  F0           ?? F0h
1a83  B0           ?? B0h
1a84  EC           ?? ECh
1a85  00           ?? 00h
1a86  0A           ?? 0Ah
1a87  8C           ?? 8Ch
1a88  41           ?? 41h    A
1a89  41           ?? 41h    A
1a8a  40           ?? 40h    @
1a8b  00           ?? 00h
1a8c  00           ?? 00h
1a8d  40           ?? 40h    @
1a8e  08           ?? 08h
1a8f  6C           ?? 6Ch    l
1a90  41           ?? 41h    A
1a91  44           ?? 44h    D
1a92  40           ?? 40h    @
1a93  00           ?? 00h
1a94  00           ?? 00h
1a95  41           ?? 41h    A
1a96  08           ?? 08h
1a97  6C           ?? 6Ch    l
1a98  41           ?? 41h    A
1a99  44           ?? 44h    D
1a9a  40           ?? 40h    @
1a9b  00           ?? 00h
1a9c  00           ?? 00h
1a9d  42           ?? 42h    B
1a9e  0A           ?? 0Ah
1a9f  AA           ?? AAh
1aa0  41           ?? 41h    A
1aa1  41           ?? 41h    A
1aa2  30           ?? 30h    0
1aa3  F2           ?? F2h
1aa4  40           ?? 40h    @
1aa5  30           ?? 30h    0
1aa6  0A           ?? 0Ah
1aa7  00           ?? 00h
1aa8  21           ?? 21h    !
1aa9  00           ?? 00h
1aaa  00           ?? 00h
1aab  00           ?? 00h
1aac  00           ?? 00h
1aad  00           ?? 00h
1aae  FF           ?? FFh
1aaf  FF           ?? FFh
1ab0  FF           ?? FFh
1ab1  FF           ?? FFh
1ab2  FF           ?? FFh
1ab3  FF           ?? FFh
1ab4  1A           ?? 1Ah
1ab5  1A           ?? 1Ah
1ab6  1A           ?? 1Ah
1ab7  1A           ?? 1Ah
1ab8  1A           ?? 1Ah
1ab9  1A           ?? 1Ah
1aba  1A           ?? 1Ah
1abb  1A           ?? 1Ah
1abc  1A           ?? 1Ah
1abd  1A           ?? 1Ah
1abe  1A           ?? 1Ah
1abf  1A           ?? 1Ah
1ac0  1A           ?? 1Ah
1ac1  1A           ?? 1Ah
1ac2  1A           ?? 1Ah
1ac3  1A           ?? 1Ah
1ac4  1A           ?? 1Ah
1ac5  1A           ?? 1Ah
1ac6  1A           ?? 1Ah
1ac7  1A           ?? 1Ah
1ac8  1A           ?? 1Ah
1ac9  1A           ?? 1Ah
1aca  1A           ?? 1Ah
1acb  1A           ?? 1Ah
1acc  1A           ?? 1Ah
1acd  1A           ?? 1Ah
1ace  1A           ?? 1Ah
1acf  1A           ?? 1Ah
1ad0  1A           ?? 1Ah
1ad1  1A           ?? 1Ah
1ad2  1A           ?? 1Ah
1ad3  1A           ?? 1Ah
1ad4  1A           ?? 1Ah
1ad5  1A           ?? 1Ah
1ad6  1A           ?? 1Ah
1ad7  1A           ?? 1Ah
1ad8  1A           ?? 1Ah
1ad9  1A           ?? 1Ah
1ada  1A           ?? 1Ah
1adb  1A           ?? 1Ah
1adc  1A           ?? 1Ah
1add  1A           ?? 1Ah
1ade  1A           ?? 1Ah
1adf  1A           ?? 1Ah
1ae0  1A           ?? 1Ah
1ae1  1A           ?? 1Ah
1ae2  1A           ?? 1Ah
1ae3  1A           ?? 1Ah
1ae4  1A           ?? 1Ah
1ae5  1A           ?? 1Ah
1ae6  1A           ?? 1Ah
1ae7  1A           ?? 1Ah
1ae8  1A           ?? 1Ah
1ae9  1A           ?? 1Ah
1aea  1A           ?? 1Ah
1aeb  1A           ?? 1Ah
1aec  1A           ?? 1Ah
1aed  1A           ?? 1Ah
1aee  1A           ?? 1Ah
1aef  1A           ?? 1Ah
1af0  1A           ?? 1Ah
1af1  1A           ?? 1Ah
1af2  1A           ?? 1Ah
1af3  1A           ?? 1Ah
1af4  1A           ?? 1Ah
1af5  1A           ?? 1Ah
1af6  1A           ?? 1Ah
1af7  1A           ?? 1Ah
1af8  1A           ?? 1Ah
1af9  1A           ?? 1Ah
1afa  1A           ?? 1Ah
1afb  1A           ?? 1Ah
1afc  1A           ?? 1Ah
1afd  1A           ?? 1Ah
