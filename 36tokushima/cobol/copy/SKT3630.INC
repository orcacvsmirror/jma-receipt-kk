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
          01  SKT3630.
      *    診療年月
           03  SKT3630-SRYYM               PIC  X(16).
      *    医療機関コード
           03  SKT3630-HOSPCDN             PIC  X(20).
      *    保険者番号
           03  SKT3630-HKNJANUM            PIC  X(12).
      *    住所
           03  SKT3630-ADRS                PIC  X(100).
      *    医療機関名
           03  SKT3630-HOSPNAME            PIC  X(100).
      *    電話番号
           03  SKT3630-TEL                 PIC  X(15).
      *    開設者名
           03  SKT3630-KAISETUNAME         PIC  X(40).
      *    在総診・在医総
           03  SKT3630-ZAI1                PIC  X(02).
           03  SKT3630-ZAI2                PIC  X(02).
      *    ページ番号
           03  SKT3630-NO                  PIC  X(04).
      *    老人請求テーブル
           03  SKT3630-SEIKYU-TBL  OCCURS  2.
      *    入外テーブル
               05  SKT3630-NYUGAI-TBL  OCCURS  2.
      *    件数
                   07  SKT3630-KENSU       PIC  X(05).
      *    診療実日数
                   07  SKT3630-NISSU       PIC  X(05).
      *    点数
                   07  SKT3630-TENSU       PIC  X(09).
      *    一部負担金
                   07  SKT3630-ITBFTN      PIC  X(09).
      *    食事療養：件数
               05  SKT3630-SKENSU          PIC  X(05).
      *    食事療養：日数
               05  SKT3630-SNISSU          PIC  X(05).
      *    食事療養：金額
               05  SKT3630-SKINGK          PIC  X(09).
      *    食事療養：標準負担額
               05  SKT3630-SFTNGK          PIC  X(09).
      *
      *    公費請求テーブル
           03  SKT3630-KOUHI-TBL  OCCURS  4.
      *    入外テーブル
               05  SKT3630-KNYUGAI-TBL  OCCURS  2.
      *    件数
                   07  SKT3630-K-KENSU       PIC  X(05).
      *    診療実日数
                   07  SKT3630-K-NISSU       PIC  X(05).
      *    点数
                   07  SKT3630-K-TENSU       PIC  X(09).
      *    一部負担金
                   07  SKT3630-K-ITBFTN      PIC  X(09).
      *    公費名
               05  SKT3630-KOHNAME          PIC  X(10).
               05  SKT3630-HBTNUM           PIC  X(04).
      *    食事療養：件数
               05  SKT3630-K-SKENSU         PIC  X(05).
      *    食事療養：日数
               05  SKT3630-K-SNISSU         PIC  X(05).
      *    食事療養：金額
               05  SKT3630-K-SKINGK         PIC  X(09).
      *    食事療養：標準負担額
               05  SKT3630-K-SFTNGK         PIC  X(09).
