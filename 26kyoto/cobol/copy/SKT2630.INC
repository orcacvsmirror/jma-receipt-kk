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
       01  SKT2630.
      *    ページ番号
           03  SKT2630-NO                 PIC  X(04).
      *    診療年月
           03  SKT2630-SRYYM              PIC  X(16).
      *    請求年月日
           03  SKT2630-SEIYMD             PIC  X(22).
      *    住所
           03  SKT2630-ADRS               PIC  X(100).
      *    医療機関名
           03  SKT2630-HOSPNAME           PIC  X(100).
      *    開設者名
           03  SKT2630-KAISETUNAME        PIC  X(40).
      *    電話番号
           03  SKT2630-TEL                PIC  X(15).
      *    保険者番号
           03  SKT2630-HKNJANUM           PIC  X(12).
      *    医療機関コード
           03  SKT2630-HOSPCD             PIC  X(14).
      *    在宅記号
           03  SKT2630-ZAI1               PIC  X(02).
           03  SKT2630-ZAI2               PIC  X(02).
      *    請求テーブル
           03  SKT2630-SEIKYU-TBL    OCCURS  12.
      *    入外テーブル
               05  SKT2630-NYUGAI-TBL    OCCURS  2.
      *    件数
                   07  SKT2630-KENSU      PIC  X(05).
      *    日数
                   07  SKT2630-NISSU      PIC  X(05).
      *    点数
                   07  SKT2630-TENSU      PIC  X(09).
      *    一部負担金
                   07  SKT2630-ITBFTN     PIC  X(09).
      *    食事療養：件数
               05  SKT2630-S-KENSU        PIC  X(05).
      *    食事療養：日数
               05  SKT2630-S-NISSU        PIC  X(05).
      *    食事療養：金額
               05  SKT2630-S-KINGAKU      PIC  X(09).
      *    食事療養：標準負担額
               05  SKT2630-S-FTNGAKU      PIC  X(09).
      *    公費テーブル
           03  SKT2630-KOH-TBL  OCCURS  2.
      *    公費名
               05  SKT2630-KOHNAME        PIC  X(10).
      *    入外テーブル
               05  SKT2630-K-NYUGAIKBN-TBL  OCCURS  2.
      *    件数
                   07  SKT2630-KKENSU     PIC  X(05).
      *    日数
                   07  SKT2630-KNISSU     PIC  X(05).
      *    点数
                   07  SKT2630-KTENSU     PIC  X(09).
      *    一部負担金
                   07  SKT2630-KITBFTN    PIC  X(09).
      *    食事療養：件数
               05  SKT2630-S-KKENSU       PIC  X(05).
      *    食事療養：日数
               05  SKT2630-S-KNISSU       PIC  X(05).
      *    食事療養：金額
               05  SKT2630-S-KKINGAKU     PIC  X(09).
      *    食事療養：標準負担額
               05  SKT2630-S-KFTNGAKU     PIC  X(09).
