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
       01  SKT0400.
      *    診療年月
           03  SKT0400-SRYYM             PIC  X(16).
      *    医療機関コード
           03  SKT0400-HOSPCDN           PIC  X(40).
      *    郵便番号
      *     03  SKT0400-POST              PIC  X(10).
      *    医療機関住所
           03  SKT0400-ADRS              PIC  X(100).
      *    医療機関名
           03  SKT0400-HOSPNAME          PIC  X(100).
      *    開設者氏名
           03  SKT0400-KAISETU           PIC  X(40).
      *    請求テーブル
           03  SKT0400-SEIKYU-TBL     OCCURS  17.
      *    入外テーブル
               05  SKT0400-NYUGAI-TBL      OCCURS   2.
      *    件数
                   07  SKT0400-KENSU     PIC  X(05).
      *    実日数
                   07  SKT0400-NISSU     PIC  X(05).
      *    点数
                   07  SKT0400-TENSU     PIC  X(09).
      *    食事療養：件数
               05  SKT0400-S-KENSU       PIC  X(05).
      *    食事療養：日数
               05  SKT0400-S-NISSU       PIC  X(05).
      *    食事療養：金額
               05  SKT0400-S-KINGK     PIC  X(09).
      *    食事療養：標準負担額
               05  SKT0400-S-FTNGK     PIC  X(09).
      *    公費請求テーブル
           03  SKT0400-KSEIKYU-TBL.
      *    入外テーブル
               05  SKT0400-KNYUGAI-TBL      OCCURS   2.
      *    件数
                   07  SKT0400-KKENSU     PIC  X(05).
      *    実日数
                   07  SKT0400-KNISSU     PIC  X(05).
      *    点数
                   07  SKT0400-KTENSU     PIC  X(09).
      *    食事療養：件数
               05  SKT0400-S-KKENSU       PIC  X(05).
      *    食事療養：日数
               05  SKT0400-S-KNISSU       PIC  X(05).
      *    食事療養：金額
               05  SKT0400-S-KKINGK       PIC  X(09).
      *    食事療養：標準負担額
               05  SKT0400-S-KFTNGK       PIC  X(09).
      *    合計テーブル
           03  SKT0400-GSEIKYU-TBL.
      *    入外テーブル
               05  SKT0400-GNYUGAI-TBL      OCCURS   2.
      *    件数
                   07  SKT0400-GKENSU     PIC  X(05).
      *    実日数
                   07  SKT0400-GNISSU     PIC  X(05).
      *    点数
                   07  SKT0400-GTENSU     PIC  X(09).
      *    食事療養：件数
               05  SKT0400-S-GKENSU       PIC  X(05).
      *    食事療養：日数
               05  SKT0400-S-GNISSU       PIC  X(05).
      *    食事療養：金額
               05  SKT0400-S-GKINGK       PIC  X(09).
      *    食事療養：標準負担額
               05  SKT0400-S-GFTNGK       PIC  X(09).
      *    平均テーブル
           03  SKT0400-HEIKIN-TBL.
      *    合計−入院平均点数
               05  SKT0400-N-HEIKIN      PIC  X(07).
      *    合計−外来平均点数
               05  SKT0400-G-HEIKIN      PIC  X(07).
