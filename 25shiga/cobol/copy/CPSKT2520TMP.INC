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
      *    診療報酬請求書     COPY (CPSKT0710TMP.INC)              *
      *
      *  コピー句修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      ************************************************************
       01  SKT2520TMP-REC.
           03  SKT2520TMP-KEY.
               05  SKT2520TMP-SYUTURYOKU           PIC  9(02).
               05  SKT2520TMP-HKNJANUM             PIC  X(06).
               05  SKT2520TMP-HKNJANAME            PIC  X(16).
               05  SKT2520TMP-ZAITAKU              PIC  X(01).
               05  SKT2520TMP-KYURATE              PIC  9(03).
           03  SKT2520TMP-SEIKYU-TBL     OCCURS  11.
               05  SKT2520TMP-KENSU            PIC  9(06).
               05  SKT2520TMP-NISSU            PIC  9(06).
               05  SKT2520TMP-TENSU            PIC  9(10).
               05  SKT2520TMP-YKZFTN           PIC  9(10).
               05  SKT2520TMP-ITBFTN           PIC  9(10).
           03  SKT2520TMP-FUKUSI-TBL.
               05  SKT2520TMP-FKENSU            PIC  9(06).
               05  SKT2520TMP-FNISSU            PIC  9(06).
               05  SKT2520TMP-FTENSU            PIC  9(10).
               05  SKT2520TMP-FYKZFTN           PIC  9(10).
               05  SKT2520TMP-FITBFTN           PIC  9(10).
           03  SKT2520TMP-KOH-AREA.
               05  SKT2520TMP-KOH-TBL      OCCURS  20.
                   07  SKT2520TMP-KOHNUM       PIC  X(03).
                   07  SKT2520TMP-KKENSU       PIC  9(06).
                   07  SKT2520TMP-KNISSU       PIC  9(06).
                   07  SKT2520TMP-KTENSU       PIC  9(10).
                   07  SKT2520TMP-KYKZFTN      PIC  9(10).
                   07  SKT2520TMP-KITBFTN      PIC  9(10).
           03  SKT2520TMP-TYOKI-KENSU          PIC  9(04).
           03  SKT2520TMP-GENBK-KENSU          PIC  9(04).
