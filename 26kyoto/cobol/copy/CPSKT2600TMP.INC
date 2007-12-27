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
      *    総括一時ファイル     COPY (CPSKT2600TMP.INC)
      *
      *  コピー句修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      ************************************************************
       01  SKT2600TMP-REC.
           03  SKT2600TMP-KEY.
               05  SKT2600TMP-NYUGAIKBN        PIC  9(01).
           03  SKT2600TMP-DATA   OCCURS  8.
               05  SKT2600TMP-NYUGAI-TBL   OCCURS  2.
                   07  SKT2600TMP-KENSU        PIC  9(06).
                   07  SKT2600TMP-NISSU        PIC  9(06).
                   07  SKT2600TMP-TENSU        PIC  9(10).
                   07  SKT2600TMP-ITBFTN       PIC  9(10).
                   07  SKT2600TMP-TAKOH        PIC  9(02).
                   07  SKT2600TMP-TYOKI        PIC  9(02).
                   07  SKT2600TMP-GENBAKU      PIC  9(02).
                   07  SKT2600TMP-S-KENSU      PIC  9(06).
                   07  SKT2600TMP-S-NISSU      PIC  9(06).
                   07  SKT2600TMP-S-KINGAKU    PIC  9(10).
                   07  SKT2600TMP-S-FTNGAKU    PIC  9(10).
           03  SKT2600TMP-GENMEN-TBL.
               05  SKT2600TMP-G-KENSU          PIC  9(03).
               05  SKT2600TMP-G-TENSU          PIC  9(07).
           03  SKT2600TMP-GENBAKU              PIC  9(03).
           03  SKT2600TMP-TOKUBETU             PIC  9(03).
