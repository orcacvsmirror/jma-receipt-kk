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
      *    診療報酬請求書     COPY (CPSKT4300TMP.INC)              *
      *
      *  コピー句修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      ************************************************************
       01  SKT4300TMP-REC.
           03  SKT4300TMP-KEY.
               05  SKT4300TMP-SRYYM                 PIC  9(06).
               05  SKT4300TMP-HKNJANUM              PIC  X(06).
               05  SKT4300TMP-KYURATE               PIC  9(03).
           03  SKT4300TMP-HKN-TBL   OCCURS  11.
               05  SKT4300TMP-NYUGAIKBN  OCCURS 2.
                   07  SKT4300TMP-KENSU             PIC  9(04).
                   07  SKT4300TMP-TENSU             PIC  9(10).
               05  SKT4300TMP-SKINGK                PIC  9(10).
               05  SKT4300TMP-SFTNGK                PIC  9(10).
           03  SKT4300TMP-SSKENSU                PIC  9(04).
           03  SKT4300TMP-SSKINGK                PIC  9(10).
           03  SKT4300TMP-SSFTNGK                PIC  9(10).
           03  SKT4300TMP-SKYYM                  PIC  9(06).
