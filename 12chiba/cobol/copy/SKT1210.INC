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
       01  SKT1210.
      *    診療年月
           03  SKT1210-SRYYM                PIC  X(16).
      *    請求年月日
           03  SKT1210-SEIYMD               PIC  X(22).
      *    医療機関住所
           03  SKT1210-ADRS                 PIC  X(100).
      *    医療機関名
           03  SKT1210-HOSPNAME             PIC  X(100).
      *    電話番号
           03  SKT1210-TEL                  PIC  X(15).
      *    開設者名
           03  SKT1210-KAISETUNAME          PIC  X(40).
      *    保険者番号
           03  SKT1210-HKNJANUM             PIC  X(12).
      *    医療機関コード
           03  SKT1210-HOSPCD               PIC  X(14).
      *    給付割合
           03  SKT1210-KYURATE-TBL  OCCURS  3.
               05  SKT1210-KYURATE          PIC  X(02).
      **** 05/02/04 INS
      *    ページ番号
           03  SKT1210-NO                   PIC  X(04).
      ****
      *    請求テーブル
           03  SKT1210-SEIKYU-TBL     OCCURS  11.
      *    件数
               05  SKT1210-KENSU            PIC  X(05).
      *    実日数
               05  SKT1210-NISSU            PIC  X(05).
      *    点数
               05  SKT1210-TENSU            PIC  X(09).
      *    一部負担金
               05  SKT1210-ITBFTN           PIC  X(09).
      *    食事件数
               05  SKT1210-SKENSU           PIC  X(05).
      *    食事実日数
               05  SKT1210-SNISSU           PIC  X(05).
      *    食事金額
               05  SKT1210-SKINGK           PIC  X(09).
      *    食事標準負担額
               05  SKT1210-SFTNGK           PIC  X(09).
      *    公費テーブル
           03  SKT1210-KOH-TBL       OCCURS 5.
      *    公費名(法別番号)
               05  SKT1210-KOHNAME          PIC  X(08).
      ***** 05/06/24 INS
               05  SKT1210-K-KBN            PIC  X(04).
      *****
      *    件数
               05  SKT1210-K-KENSU          PIC  X(05).
      *    実日数
               05  SKT1210-K-NISSU          PIC  X(05).
      *    点数
               05  SKT1210-K-TENSU          PIC  X(09).
      *    一部負担金
               05  SKT1210-K-ITBFTN         PIC  X(07).
      *    公費分点数
               05  SKT1210-K-KOHTENSU       PIC  X(07).
      *    食事件数
               05  SKT1210-K-SKENSU         PIC  X(05).
      *    食事実日数
               05  SKT1210-K-SNISSU         PIC  X(05).
      *    食事金額
               05  SKT1210-K-SKINGK         PIC  X(09).
      *    食事標準負担額
               05  SKT1210-K-SFTNGK         PIC  X(09).

