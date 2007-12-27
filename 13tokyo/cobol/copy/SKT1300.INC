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
       01  SKT1300.
      *    診療年月
           03  SKT1300-SEIYM                   PIC X(16).
      *    住所
           03  SKT1300-ADRS                    PIC X(100).
      *    医療機関名
           03  SKT1300-HOSPNAME                PIC X(100).
      *    開設者名
           03  SKT1300-KAISETUNAME             PIC X(40).
      *    電話番号
           03  SKT1300-TEL                     PIC X(15).
           03  SKT1300-HOSPCD                  PIC X(20).
           03  SKT1300-ZIP-TBL.
               05  SKT1300-ZIP1                PIC X(06).
               05  SKT1300-ZIP2                PIC X(02).
               05  SKT1300-ZIP3                PIC X(02).
               05  SKT1300-ZIP4                PIC X(02).
               05  SKT1300-ZIP5                PIC X(02).
      *    在宅
           03  SKT1300-ZAI1                    PIC X(02).
           03  SKT1300-ZAI2                    PIC X(02).
      *    集計テーブル
           03  SKT1300-KEN-TBL OCCURS 2.
               05  SKT1300-KKENSU              PIC X(05).
               05  SKT1300-HKN-TBL OCCURS 4.
                   07  SKT1300-KENSU           PIC X(05).
                   07  SKT1300-TENSU           PIC X(14).
                   07  SKT1300-SKENSU          PIC X(05).
                   07  SKT1300-SKINGK          PIC X(14).
