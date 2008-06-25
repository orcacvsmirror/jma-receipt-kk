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
        01  SKT1330.
      *    診療年月
            02  SKT1330-SEIYM   PIC X(16).
      *    住所
            02  SKT1330-ADRS    PIC X(100).
      *    医療機関名
            02  SKT1330-HOSPNAME    PIC X(100).
      *    開設者名
            02  SKT1330-KAISETUNAME PIC X(40).
      *    電話番号
            02  SKT1330-TEL PIC X(15).
            02  SKT1330-HOSPCD  PIC X(20).
            02  SKT1330-ZIP-TBL.
              03  SKT1330-ZIP1    PIC X(6).
              03  SKT1330-ZIP2    PIC X(2).
              03  SKT1330-ZIP3    PIC X(2).
              03  SKT1330-ZIP4    PIC X(2).
              03  SKT1330-ZIP5    PIC X(2).
      *    在宅
            02  SKT1330-ZAI1    PIC X(2).
            02  SKT1330-ZAI2    PIC X(2).
      *    集計テーブル
            02  SKT1330-SYUKEI-TBL      OCCURS  2 TIMES.
              03  SKT1330-HEIYOKEN    PIC X(5).
              03  SKT1330-HKN-TBL         OCCURS  4 TIMES.
                04  SKT1330-KENSU   PIC X(5).
                04  SKT1330-TENSU   PIC X(14).
                04  SKT1330-SKENSU  PIC X(5).
                04  SKT1330-SKINGK  PIC X(14).
      *    後期高齢者集計テーブル
            02  SKT1330-KOUKI-TRL       OCCURS  2 TIMES.
              03  SKT1330-KKENSU  PIC X(5).
              03  SKT1330-KTENSU  PIC X(14).
              03  SKT1330-KHEIYOKEN   PIC X(5).
              03  SKT1330-KSKENSU PIC X(5).
              03  SKT1330-KSKINGK PIC X(14).
