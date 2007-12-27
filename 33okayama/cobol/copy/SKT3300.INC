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
       01  SKT3300.
      *    診療年月
           03       SKT3300-SEIYM                 PIC  X(16).
      *機関コード     
           03       SKT3300-HOSPCD                PIC  X(14).
      *標榜科目
           03       SKT3300-KAMOKU                PIC  X(26).

           
      *    住所
           03       SKT3300-ADRS                  PIC  X(100).
      *    医療機関名
           03       SKT3300-HOSPNAME              PIC  X(100).
      *    開設者名
           03       SKT3300-KAISETUNAME           PIC  X(40).
      *    電話番号
           03       SKT3300-TEL                   PIC  X(15).
      *    請求年月日
           03       SKT3300-SEIKYUYMD             PIC  X(22).
      *    集計エリア
           03       SKT3300-SYUKEI-TBL  OCCURS 3.
             05       SKT3300-NYUGAI-TBL  OCCURS 2.
               07       SKT3300-HKN-TBL     OCCURS 3. 
      *    件数
                 09       SKT3300-KENSU           PIC  X(05).
      *    点数
                 09       SKT3300-TENSU           PIC  X(09).
      *    食事療養
             05       SKT3300-KINGK               PIC  X(09).
             05       SKT3300-RKINGK              PIC  X(09).
