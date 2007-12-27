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
       01  SKT3620.
      *診療年月
           03  SKT3620-SRYYM               PIC  X(16).
      *請求年月日
           03  SKT3620-SEIYMD              PIC  X(22).
      *医療機関コード
           03  SKT3620-HOSPCDN             PIC  X(20).
      *保険者番号
           03  SKT3620-HKNJANUM            PIC  X(12).
      *給付割合
           03  SKT3620-KYURATE             PIC  X(02) OCCURS 4.
      *医療機関所在地
           03  SKT3620-ADRS                PIC  X(100).
      *医療機関名称
           03  SKT3620-HOSPNAME            PIC  X(100).
      *電話番号
           03  SKT3620-TEL                 PIC  X(15).
      *開設者氏名
           03  SKT3620-KAISETUNAME         PIC  X(40).
      *在総・在医総
           03  SKT3620-ZAI1                PIC  X(02).
           03  SKT3620-ZAI2                PIC  X(02).
      *ページ番号
           03  SKT3620-NO                  PIC  X(04).
      *
      *請求一覧
           03  SKT3620-SEIKYU  OCCURS 9.
      *入院・外来テーブル
               05  SKT3620-NYUGAIKBN   OCCURS  2.
      *療養の給付：件数
                   07  SKT3620-KENSU       PIC  X(05).
      *療養の給付：日数
                   07  SKT3620-NISSU       PIC  X(05).
      *療養の給付：点数
                   07  SKT3620-TENSU       PIC  X(09).
      *療養の給付：一部負担金
                   07  SKT3620-ITBFTN      PIC  X(09).
      *食事療養：件数
               05  SKT3620-SKENSU          PIC  X(05).
      *食事療養：日数
               05  SKT3620-SNISSU          PIC  X(05).
      *食事療養：金額
               05  SKT3620-SKINGK          PIC  X(09).
      *食事療養：標準負担金
               05  SKT3620-SFTNGK          PIC  X(09).
