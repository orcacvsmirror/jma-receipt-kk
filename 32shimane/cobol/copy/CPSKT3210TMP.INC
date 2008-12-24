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
      *    診療報酬請求書     COPY (CPSKT2110TMP.INC)            *
      *
      *  コピー句修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      ************************************************************
       01  SKT3210TMP-REC.
           03  SKT3210TMP-KEY.
               05  SKT3210TMP-SYUTURYOKU          PIC  9(01).
               05  SKT3210TMP-HKNJANUM            PIC  X(06).
      ****2006/01/06 @@@@-BRAND  START
               05  SKT3210TMP-KENGAITAHO          PIC  9(01).
      ****2006/01/06 @@@@-BRAND  END
               05  SKT3210TMP-ZAI-FLG             PIC  X(01).
           03  SKT3210TMP-IPPAN-TBL  OCCURS  9.
               05  SKT3210TMP-NYUGAI-TBL  OCCURS  2.
                   07  SKT3210TMP-KENSU         PIC  9(06).
                   07  SKT3210TMP-NISSU         PIC  9(06).
                   07  SKT3210TMP-TENSU         PIC  9(10).
                   07  SKT3210TMP-YKZFTN        PIC  9(10).
                   07  SKT3210TMP-ITBFTN        PIC  9(07).
                   07  SKT3210TMP-TYOUKEN       PIC  9(03).
               05  SKT3210TMP-S-KENSU           PIC  9(06).
               05  SKT3210TMP-S-NISSU           PIC  9(06).
               05  SKT3210TMP-S-KINGAKU         PIC  9(10).
               05  SKT3210TMP-S-FTNGAKU         PIC  9(10).
           03  SKT3210TMP-KOH-TBL  OCCURS  20.
               05  SKT3210TMP-KOHNUM            PIC  X(03).
      *--- (2008/12/15) line add start monma --------------------------
               05  SKT3210TMP-KOHNAME           PIC  X(08).
      *--- (2008/12/15) line add end   monma --------------------------
               05  SKT3210TMP-KKENSU            PIC  9(06).
               05  SKT3210TMP-KNISSU            PIC  9(06).
               05  SKT3210TMP-KTENSU            PIC  9(10).
               05  SKT3210TMP-KYKZFTN           PIC  9(10).
               05  SKT3210TMP-KNJFTN            PIC  9(10).
               05  SKT3210TMP-S-KKENSU          PIC  9(06).
               05  SKT3210TMP-S-KKINGAKU        PIC  9(10).
               05  SKT3210TMP-S-KFTNGAKU        PIC  9(10).
           03  SKT3210TMP-RJN-TBL  OCCURS  2.
               05  SKT3210TMP-R-NYUGAI-TBL  OCCURS  2.
                   07  SKT3210TMP-RKENSU        PIC  9(06).
                   07  SKT3210TMP-RNISSU        PIC  9(06).
                   07  SKT3210TMP-RTENSU        PIC  9(10).
                   07  SKT3210TMP-RYKZFTN       PIC  9(10).
                   07  SKT3210TMP-RITBFTN       PIC  9(10).
                   07  SKT3210TMP-RTYOUKEN      PIC  9(03).
                   07  SKT3210TMP-RGENKEN       PIC  9(03).
               05  SKT3210TMP-S-RKENSU          PIC  9(06).
               05  SKT3210TMP-S-RNISSU          PIC  9(06).
               05  SKT3210TMP-S-RKINGAKU        PIC  9(10).
               05  SKT3210TMP-S-RFTNGAKU        PIC  9(10).
