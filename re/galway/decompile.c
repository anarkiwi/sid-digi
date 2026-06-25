
/* WARNING: Possible PIC construction at 0x1028: Changing call to branch */
/* WARNING: Possible PIC construction at 0x1039: Changing call to branch */
/* WARNING: Possible PIC construction at 0x10c0: Changing call to branch */
/* WARNING: Removing unreachable block (RAM,0x102b) */
/* WARNING: Removing unreachable block (RAM,0x1225) */
/* WARNING: Removing unreachable block (RAM,0x103c) */
/* WARNING: Removing unreachable block (RAM,0x10dd) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry_1021(void)

{
  byte bVar1;
  byte bVar2;
  byte bVar3;
  char cVar4;
  byte bVar5;
  bool bVar6;
  
  bVar2 = bRAM10c6;
  bVar5 = 0;
  DAT_1090 = DAT_1090 + -1;
  if (-1 < DAT_1090) {
SUB_1226:
    DAT_00fc = bRAM13d9;
    if ((bRAM1141 & 0x40) == 0) {
      _DAT_00fa = CONCAT11(DAT_00fb,*(undefined1 *)(bRAM13d9 + 0x1a86));
      bRAM1144 = bRAM1141 & 0x40;
      (&SID_V1_SR)[bRAM10c6] = *(undefined1 *)(bRAM13d9 + 0x1a87);
      (&SID_V1_AD)[bVar2] = DAT_00fa;
      (&SID_V1_CTRL)[bVar2] = bRAM1084 & 0xfe;
      bRAM1084 = *(byte *)(DAT_00fc + 0x1a88);
      uRAM13dc = *(undefined1 *)(DAT_00fc + 0x1a89);
      uRAM129e = 8;
      cRAM1296 = '\b';
      uRAM10e0 = 0;
      uRAM10e3 = 0;
      bRAM114d = *(byte *)(DAT_00fc + 0x1a8b) >> 3;
      bRAM1141 = bRAM1141 | 0x40;
      bRAM00fd = *(byte *)(DAT_00fc + 0x1a8d);
      uRAM13df = uRAM13dc;
    }
    else {
      if (cRAM1262 == '\0') {
        cRAM1296 = cRAM1296 + -1;
        uRAM129e = 8;
        SID_FC_HI = 8;
      }
      if ((bRAM00fd & 0xf) == 0) {
        bVar2 = bRAM114d;
        if ((((bRAM1141 & 0x20) == 0) && ((bRAM00fd & 0x10) != 0)) &&
           (bVar2 = bRAM114d - 1, (char)(bRAM114d - 1) < '\0')) {
          if (((*(char *)((bRAM12bd & 3) + 0x12c3) != '\0') ||
              ((bVar3 = bRAM10cc - *(byte *)(bRAM13d9 + 0x1a8c), bVar2 = ~bRAM10cc, bRAM10cc = bVar3
               , ((*(byte *)(bRAM13d9 + 0x1a8c) & (bVar2 | bVar3) | bVar3 & bVar2) & 0x80) == 0 &&
               (cRAM10cf = cRAM10cf + -1, cRAM10cf == '\0')))) &&
             (bVar6 = CARRY1(bRAM10cc,*(byte *)(bRAM13d9 + 0x1a8c)),
             bRAM10cc = bRAM10cc + *(byte *)(bRAM13d9 + 0x1a8c), bVar6)) {
            cRAM10cf = cRAM10cf + '\x01';
          }
          bRAM10dd = bRAM10dd + 1;
          bVar2 = bRAM114d;
          if ((*(byte *)(bRAM13d9 + 0x1a8b) & 0xf) == bRAM10dd) {
            bRAM10dd = 0;
            bRAM12bd = bRAM12bd + 1;
          }
        }
      }
      else {
        func_0x13e5();
        bVar2 = bRAM114d;
      }
      bRAM114d = bVar2;
      DAT_00fc = *(byte *)(DAT_00fc + 0x1a8a);
      if ((*(byte *)(ushort)(byte)(bVar5 - 3) & 0x40) == 0) {
        if ((*(byte *)(ushort)(byte)(bVar5 - 3) & 0x20) != 0) {
          if (*(char *)(bVar5 + 0x10e3) == '\0') {
            bVar1 = *(byte *)(bVar5 + 0x13dc) - DAT_00fc;
            bVar2 = ~*(byte *)(bVar5 + 0x13dc);
            bVar3 = DAT_00fc & (bVar2 | bVar1);
            *(byte *)(bVar5 + 0x13dc) = bVar1;
            if (((bVar3 | bVar1 & bVar2) & 0x80) == 0) {
              *(char *)(bVar5 + 0x13df) = *(char *)(bVar5 + 0x13df) + -1;
            }
          }
          else {
            bVar6 = CARRY1(*(byte *)(bVar5 + 0x13dc),DAT_00fc);
            *(byte *)(bVar5 + 0x13dc) = *(byte *)(bVar5 + 0x13dc) + DAT_00fc;
            if (bVar6) {
              *(char *)(bVar5 + 0x13df) = *(char *)(bVar5 + 0x13df) + '\x01';
            }
          }
          *(char *)(bVar5 + 0x10e0) = *(char *)(bVar5 + 0x10e0) + '\x01';
          if ((DAT_00fc & 0xf) == *(byte *)(bVar5 + 0x10e0)) {
            *(undefined1 *)(bVar5 + 0x10e0) = 0;
            *(byte *)(bVar5 + 0x10e3) = *(byte *)(bVar5 + 0x10e3) ^ 1;
          }
        }
      }
      else {
        bVar6 = CARRY1(DAT_00fc,*(byte *)(bVar5 + 0x13dc));
        *(byte *)(bVar5 + 0x13dc) = DAT_00fc + *(byte *)(bVar5 + 0x13dc);
        *(byte *)(bVar5 + 0x13df) = DAT_00fc + *(char *)(bVar5 + 0x13df) + bVar6;
      }
    }
    bVar2 = *(byte *)(bVar5 + 0x10c6);
    (&SID_V1_CTRL)[bVar2] = *(undefined1 *)(bVar5 + 0x1084);
    (&SID_V1_PW_HI)[bVar2] = *(undefined1 *)(bVar5 + 0x13df);
    (&SID_V1_PW_LO)[bVar2] = *(undefined1 *)(bVar5 + 0x13dc);
    if (((*(byte *)(bVar5 + 0x1141) & 0x20) != 0) &&
       (((*(byte *)(bVar5 + 0x1147) & 1) == 0 ||
        (bVar3 = *(byte *)(bVar5 + 0x12b9) ^ 0xff, *(byte *)(bVar5 + 0x12b9) = bVar3, bVar3 == 0))))
    {
      bVar3 = *(byte *)(bVar5 + 0x13e2);
      bVar1 = *(byte *)(bVar5 + 0x1147);
      cVar4 = bVar3 + bVar1;
      *(char *)(bVar5 + 0x13e2) = cVar4;
      (&SID_V1_FREQ_LO)[bVar2] = cVar4;
      cVar4 = *(char *)(bVar5 + 0x12b6) + *(char *)(bVar5 + 0x114a) + CARRY1(bVar3,bVar1);
      *(char *)(bVar5 + 0x12b6) = cVar4;
      (&SID_V1_FREQ_HI)[bVar2] = cVar4;
      return;
    }
    (&SID_V1_FREQ_LO)[bVar2] = *(undefined1 *)(bVar5 + 0x10cc);
    (&SID_V1_FREQ_HI)[bVar2] = *(undefined1 *)(bVar5 + 0x10cf);
    return;
  }
  DAT_1090 = '\x02';
  bRAM108a = bRAM108a - 1;
  if (-1 < (char)bRAM108a) goto SUB_1226;
  if (bRAM108d != 0xfe) {
    _DAT_00fa = CONCAT11(*(undefined1 *)(bRAM108d + 0x1a4e),*(undefined1 *)(bRAM108d + 0x1a6a));
    bRAM108a = *(byte *)(_DAT_00fa + (ushort)bRAM1081);
    bVar2 = bRAM1081;
    if ((char)bRAM108a < '\0') {
      if (0x9f < bRAM108a) goto LAB_1187;
      bRAM13d9 = bRAM108a << 3;
      bRAM108a = *(byte *)(_DAT_00fa + (ushort)(byte)(bRAM1081 + 1));
      bVar2 = bRAM1081 + 1;
    }
    if (bRAM108a < 0x60) {
      DAT_00fc = bVar2 + 1;
      bRAM10c9 = (bRAM10e6 >> 4) + bRAM108a;
      bRAM10cc = *(byte *)(bRAM10c9 + 0x1437);
      cRAM10cf = *(char *)(bRAM10c9 + 0x11c5);
      bRAM1141 = *(byte *)(_DAT_00fa + (ushort)DAT_00fc);
      if ((char)*(byte *)(_DAT_00fa + (ushort)DAT_00fc) < '\0') {
        cRAM1262 = '\0';
        bRAM1266 = *(byte *)(_DAT_00fa + (ushort)(byte)(bVar2 + 2));
        cRAM12a0 = (bRAM1266 & 0xf) * '\x02' + -0x10;
        bRAM1081 = bVar2 + 3;
        if (*(char *)(_DAT_00fa + (ushort)bRAM1081) == '\0') {
          SID_RESFILT = 0xf0;
        }
        else {
          SID_RESFILT = uRAM12b3;
          cRAM126b = *(char *)(_DAT_00fa + (ushort)bRAM1081);
        }
      }
      else {
        bRAM1081 = DAT_00fc;
        if ((*(byte *)(_DAT_00fa + (ushort)DAT_00fc) & 0x20) != 0) {
          uRAM1147 = *(undefined1 *)(_DAT_00fa + (ushort)(byte)(bVar2 + 2));
          bRAM1081 = bVar2 + 3;
          uRAM114a = *(undefined1 *)(_DAT_00fa + (ushort)bRAM1081);
        }
      }
      uRAM1031 = 0xff;
      uRAM12b9 = 0xff;
      bRAM10dd = 0;
      bRAM12bd = 0;
      cRAM12b6 = cRAM10cf;
      bRAM13e2 = bRAM10cc;
      bRAM108a = bRAM1141;
LAB_1187:
      bRAM108a = bRAM108a & 0x1f;
      bRAM1081 = bRAM1081 + 1;
      if (*(char *)(_DAT_00fa + (ushort)bRAM1081) == -1) {
        bRAM10e9 = bRAM10e9 - 1;
        if ((char)bRAM10e9 < '\0') {
          _DAT_00fa = CONCAT11(uRAM14bc,uRAM14b9);
          bRAM1087 = bRAM1087 + 2;
          if (*(char *)(_DAT_00fa + (ushort)bRAM1087) == -1) {
            bRAM1087 = 0;
          }
          bRAM108d = *(byte *)(_DAT_00fa + (ushort)bRAM1087);
          bRAM10e6 = *(byte *)(_DAT_00fa + (ushort)(byte)(bRAM1087 + 1));
          bRAM10e9 = bRAM10e6 & 0xf;
        }
        bRAM1081 = 0;
      }
      return;
    }
    bRAM108a = bRAM108a & 0x1f;
    uRAM1031 = 0xfe;
  }
  bRAM1084 = bRAM1084 & 0xfe;
  return;
}



/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void entry_1048(void)

{
  byte bVar1;
  byte bVar2;
  
  SID_MODEVOL = 0x1f;
  SID_RESFILT = 0xf0;
  uRAM1262 = 0;
  bVar2 = 0xf;
  do {
    *(undefined1 *)(bVar2 + 0x1081) = 0;
    bVar2 = bVar2 - 1;
  } while (-1 < (char)bVar2);
  bVar2 = 2;
  do {
    _DAT_00fa = (undefined1 *)
                CONCAT11(*(undefined1 *)(bVar2 + 0x14bc),*(undefined1 *)(bVar2 + 0x14b9));
    *(undefined1 *)(bVar2 + 0x108d) = *_DAT_00fa;
    bVar1 = _DAT_00fa[1];
    *(byte *)(bVar2 + 0x10e6) = bVar1;
    *(byte *)(bVar2 + 0x10e9) = bVar1 & 0xf;
    bVar2 = bVar2 - 1;
  } while (-1 < (char)bVar2);
  return;
}


