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
      *    診療報酬請求書     COPY (CPSKT4700TMP.INC)              *
      *
      *  コピー句修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      ************************************************************
       01  SKT4700TMP-REC.
           03  SKT4700TMP-KEY.
               05  SKT4700TMP-RECEKA                PIC  9(02).
           03  SKT4700TMP-HKN-TBL  OCCURS  17.
               05  SKT4700TMP-HKN-NYUGAI-TBL  OCCURS  2.
                   07  SKT4700TMP-KENSU             PIC  9(06).
               05  SKT4700TMP-GKENSU                PIC  9(06).
           03  SKT4700TMP-KOH-AREA.
               05  SKT4700TMP-KOH-TBL  OCCURS  20.
                   07  SKT4700TMP-KOHNUM            PIC  X(03).
                   07  SKT4700TMP-KOH-NYUGAI-TBL OCCURS 2.
                       09  SKT4700TMP-KKENSU        PIC  9(06).
           03  SKT4700TMP-GKKENSU                   PIC  9(06).
           03  SKT4700TMP-SKKENSU                   PIC  9(06).
