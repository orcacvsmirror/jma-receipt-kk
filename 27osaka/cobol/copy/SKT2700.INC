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
       01  SKT2700.
      *診療年月
           03  SKT2700-SRYYM               PIC  X(16).
      *保険者名
           03  SKT2700-HKNJANAME           PIC  X(20).
      *保険者番号
           03  SKT2700-HKNJANUM            PIC  X(06).
      *請求年月日
           03  SKT2700-SEIYMD              PIC  X(22).
      *医療機関コード
           03  SKT2700-HOSPCDN             PIC  X(20).
      *郵便番号
      *     03  SKT2700-POST                PIC  X(10).
      *医療機関所在地
           03  SKT2700-ADRS                PIC  X(100).
      *医療機関名称
           03  SKT2700-HOSPNAME            PIC  X(100).
      *開設者氏名
           03  SKT2700-KAISETUNAME         PIC  X(40).
      *電話番号
           03  SKT2700-TEL                 PIC  X(15).
      *割合
           03  SKT2700-KYURATE1            PIC  X(02).
           03  SKT2700-KYURATE2            PIC  X(02).
      ***** 05/03/09 yamaguchi DEL
      *ページ番号
      *      03  SKT2700-NO              PIC X(04).
      *****
      *請求一覧
           03  SKT2700-SEIKYU  OCCURS 31.
      *療養の給付：件数
               05  SKT2700-KENSU           PIC  X(05).
      *療養の給付：点数
               05  SKT2700-TENSU           PIC  X(09).
      *療養の給付：一部負担金（患者負担額）
               05  SKT2700-ITBFTN          PIC  X(09).
      *食事療養：件数
               05  SKT2700-S-KENSU         PIC  X(05).
      *食事療養：金額
               05  SKT2700-S-KINGAKU       PIC  X(09).
      *食事療養：標準負担額
               05  SKT2700-S-FTNGAKU       PIC  X(09).
      *備考欄（原爆）
               05  SKT2700-BIKO            PIC  X(02).
      *合計
           03  SKT2700-GOKEI.
      *療養の給付：件数
               05  SKT2700-GKENSU          PIC  X(05).
      *療養の給付：点数
               05  SKT2700-GTENSU          PIC  X(09).
      *療養の給付：一部負担金（患者負担額）
               05  SKT2700-GITBFTN         PIC  X(09).
      *食事療養：件数
               05  SKT2700-S-GKENSU        PIC  X(05).
      *食事療養：金額
               05  SKT2700-S-GKINGAKU      PIC  X(09).
      *食事療養：標準負担額
               05  SKT2700-S-GFTNGAKU      PIC  X(09).
      *備考欄
               05  SKT2700-GBIKO           PIC  X(03).

