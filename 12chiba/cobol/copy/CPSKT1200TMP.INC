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
      *    診療報酬請求書     COPY (CPSKT1200TMP.INC)              *
      *
      *  コピー句修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      ************************************************************
       01  SKT1200TMP-REC.
           03  SKT1200TMP-KEY.
               05  SKT1200TMP-RECEKA               PIC  X(02).
           03  SKT1200TMP-SEIKYU-TBL  OCCURS 3.
               05  SKT1200TMP-KENSU                PIC  9(06).
               05  SKT1200TMP-TENSU                PIC  9(10).
               05  SKT1200TMP-SKENSU               PIC  9(06).
               05  SKT1200TMP-SKINGK               PIC  9(10).
               05  SKT1200TMP-SFTNGK               PIC  9(10).
