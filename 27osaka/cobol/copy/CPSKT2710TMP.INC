      *******************************************************************
      * Project code name "ORCA"
      * 日医標準レセプトソフト（JMA standard receipt software）
      * Copyright(C) 2002 JMA (Japan Medical Association)
      *
      * This program is part of "JMA standard receipt software".
      *
      *     This program is distributed in the hope that it will be useful
      * for further advancement in medical care, according to JMA Open
      * Source License, but WITHOUT ANY WARRANTY.
      *     Everyone is granted permission to use, copy, modify and
      * redistribute this program, but only under the conditions described
      * in the JMA Open Source License. You should have received a copy of
      * this license along with this program. If not, stop using this
      * program and contact JMA, 2-28-16 Honkomagome, Bunkyo-ku, Tokyo,
      * 113-8621, Japan.
      ********************************************************************
      ************************************************************
      *    診療報酬請求書     COPY (CPSKT2710TMP.INC)              *
      *
      *  コピー句修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      ************************************************************
       01  SKT2710TMP-REC.
           03  SKT2710TMP-KEY.
               05  SKT2710TMP-HKNJANUM              PIC  X(06).
               05  SKT2710TMP-ZAITAKU               PIC  X(01).
           03  SKT2710TMP-HKNJANUM2                 PIC  X(06).
           03  SKT2710TMP-HKN-AREA  OCCURS  12.
               05  SKT2710TMP-NYUGAI-TBL  OCCURS  2.
                   07  SKT2710TMP-KENSU             PIC  9(05).
                   07  SKT2710TMP-NISSU             PIC  9(05).
                   07  SKT2710TMP-TENSU             PIC  9(11).
                   07  SKT2710TMP-YKZFTN            PIC  9(09).
                   07  SKT2710TMP-FTNMONEY          PIC  9(07).
               05  SKT2710TMP-SKENSU               PIC  9(05).
               05  SKT2710TMP-SNISSU               PIC  9(05).
               05  SKT2710TMP-SKINGK             PIC  9(13).
               05  SKT2710TMP-SFTNGK             PIC  9(09).
           03  SKT2710TMP-GENBK-TBL  OCCURS  2.
               05  SKT2710TMP-GENBK-NYUGAI  OCCURS  2.
                   07  SKT2710TMP-GENBK-KENSU              PIC  9(03).
