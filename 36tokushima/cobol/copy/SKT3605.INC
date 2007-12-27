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
       01  SKT3605.
      *診療年月
           03  SKT3605-SRYYM               PIC  X(16).
      *請求年月日
           03  SKT3605-SEIYMD              PIC  X(22).
      *医療機関コード
           03  SKT3605-HOSPCD              PIC  X(20).
      *郵便番号
           03  SKT3605-POST                PIC  X(08).
      *医療機関所在地
           03  SKT3605-ADRS                PIC  X(100).
      *医療機関名称
           03  SKT3605-HOSPNAME            PIC  X(100).
      *開設者氏名
           03  SKT3605-KAISETU             PIC  X(30).
      *県内・県外
           03  SKT3605-PREFKBN             PIC  X(08).
      *在総・在医総
           03  SKT3605-ZAI1                PIC  X(02).
           03  SKT3605-ZAI2                PIC  X(02).
      *請求一覧
           03  SKT3605-SEIKYU  OCCURS 11.
      *入院・外来テーブル
               05  SKT3605-NYUGAIKBN   OCCURS  2.
      *療養の給付：件数
                   07  SKT3605-KENSU       PIC  X(05).
      *療養の給付：日数
                   07  SKT3605-NISSU       PIC  X(05).
      *療養の給付：点数
                   07  SKT3605-TENSU       PIC  X(09).
      *療養の給付：一部負担金
                   07  SKT3605-ITBFTN      PIC  X(09).
      *食事療養：件数
               05  SKT3605-SKENSU          PIC  X(05).
      *食事療養：日数
               05  SKT3605-SNISSU          PIC  X(05).
      *食事療養：金額
               05  SKT3605-SKINGK          PIC  X(09).
      *食事療養：標準負担金
               05  SKT3605-SFTNGK          PIC  X(09).
      *公費一覧
           03  SKT3605-KOH-TBL  OCCURS  6.
      *公費名
               05  SKT3605-KOHNAME         PIC  X(12).
      *入院・外来テーブル
               05  SKT3605-K-NYUGAI  OCCURS  2.
      *療養の給付：件数
                   07  SKT3605-K-KENSU     PIC  X(05).
      *療養の給付：日数
                   07  SKT3605-K-NISSU     PIC  X(05).
      *療養の給付：点数
                   07  SKT3605-K-TENSU     PIC  X(09).
      *療養の給付：一部負担金
                   07  SKT3605-K-ITBFTN    PIC  X(09).
      *食事療養：件数
               05  SKT3605-K-SKENSU        PIC  X(05).
      *食事療養：日数
               05  SKT3605-K-SNISSU        PIC  X(05).
      *食事療養：金額
               05  SKT3605-K-SKINGK        PIC  X(09).
      *食事療養：標準負担額
               05  SKT3605-K-SFTNGK        PIC  X(09).
