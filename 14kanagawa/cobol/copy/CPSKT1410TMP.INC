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
      *    診療報酬請求書     COPY (CPSKT1410TMP.INC)              *
      *
      *  コピー句修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      ************************************************************
       01  SKT1410TMP-REC.
           03  SKT1410TMP-KEY.
               05  SKT1410TMP-SYUTURYOKU           PIC  9(01).
               05  SKT1410TMP-HKNJANUM             PIC  X(06).
               05  SKT1410TMP-ZAITAKU              PIC  X(01).
           03  SKT1410TMP-SEIKYU-TBL     OCCURS  15.
               05  SKT1410TMP-NYUGAI-TBL    OCCURS  2.
                   07  SKT1410TMP-KENSU            PIC  9(06).
                   07  SKT1410TMP-NISSU            PIC  9(06).
                   07  SKT1410TMP-TENSU            PIC  9(10).
      *             07  SKT1410TMP-YKZFTN           PIC  9(10).
                   07  SKT1410TMP-ITBFTN           PIC  9(10).
               05  SKT1410TMP-S-KENSU              PIC  9(06).
               05  SKT1410TMP-S-NISSU              PIC  9(06).
               05  SKT1410TMP-S-KINGAKU            PIC  9(10).
               05  SKT1410TMP-S-FTNGAKU            PIC  9(10).
      ****2006/01/13 @@@@-BRAND  START
      *     03  SKT1410TMP-KOH-TBL      OCCURS  24.
           03  SKT1410TMP-KOH-TBL      OCCURS  31.
      ****2006/01/13 @@@@-BRAND  END
               05  SKT1410TMP-K-KENSU              PIC  9(06).
      *         05  SKT1410TMP-K-TENSU              PIC  9(10).
      *         05  SKT1410TMP-K-YKZFTN             PIC  9(10).
      *         05  SKT1410TMP-K-ITBFTN             PIC  9(10).
