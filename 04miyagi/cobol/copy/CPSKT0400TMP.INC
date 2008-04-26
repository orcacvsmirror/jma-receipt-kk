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
      *    診療報酬請求書     COPY (CPSKT0110TMP.INC)            *
      *
      *  コピー句修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      ************************************************************
       01  SKT0400TMP-REC.
           03    SKT0400TMP-KEY.
               05    SKT0400TMP-KBN           PIC X(01).
      *
           03    SKT0400TMP-SEIKYU-TBL        OCCURS 17.
               05    SKT0400TMP-NYUGAI-TBL    OCCURS 2.
                 07    SKT0400TMP-KENSU       PIC 9(05).
                 07    SKT0400TMP-NISSU       PIC 9(05).
                 07    SKT0400TMP-TENSU       PIC 9(09).
               05    SKT0400TMP-S-KENSU        PIC 9(05).
               05    SKT0400TMP-S-NISSU        PIC 9(05).
               05    SKT0400TMP-S-KINGK        PIC 9(09).
               05    SKT0400TMP-S-FTNGK        PIC 9(09).
           03    SKT0400TMP-KOH-TBL.
               05    SKT0400TMP-KNYUGAI-TBL    OCCURS 2.
                 07    SKT0400TMP-KKENSU       PIC 9(05).
                 07    SKT0400TMP-KNISSU       PIC 9(05).
                 07    SKT0400TMP-KTENSU       PIC 9(09).
               05    SKT0400TMP-S-KKENSU        PIC 9(05).
               05    SKT0400TMP-S-KNISSU        PIC 9(05).
               05    SKT0400TMP-S-KKINGK        PIC 9(09).
               05    SKT0400TMP-S-KFTNGK        PIC 9(09).
           03    SKT0400TMP-GOKEI-TBL.
               05    SKT0400TMP-GNYUGAI-TBL OCCURS 2.
                 07    SKT0400TMP-GKENSU       PIC 9(05).
                 07    SKT0400TMP-GNISSU       PIC 9(05).
                 07    SKT0400TMP-GTENSU       PIC 9(09).
               05    SKT0400TMP-S-GKENSU        PIC 9(05).
               05    SKT0400TMP-S-GNISSU        PIC 9(05).
               05    SKT0400TMP-S-GKINGK        PIC 9(09).
               05    SKT0400TMP-S-GFTNGK        PIC 9(09).
