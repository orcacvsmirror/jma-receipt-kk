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
       01  SKT2500.
      *診療年月
           03  SKT2500-SRYYM               PIC  X(16).
      *医療機関コード
           03  SKT2500-HOSPCD              PIC  X(07).
      *レセプト記載
           03  SKT2500-RECE                PIC  X(02)  OCCURS 2.
      *医療機関所在地
           03  SKT2500-ADRS                PIC  X(100).
      *医療機関名称
           03  SKT2500-HOSPNAME            PIC  X(100).
      *開設者氏名
           03  SKT2500-KAISETU             PIC  X(80).
      *電話番号
           03  SKT2500-TEL                 PIC  X(15).
      *請求年月日
           03  SKT2500-SEIYMD              PIC  X(22).
      *請求一覧
           03  SKT2500-SEIKYU  OCCURS 32.
               05  SKT2500-KENSU           PIC  X(05).
      *他請求一覧
           03  SKT2500-ESEIKYU  OCCURS 6.
               05  SKT2500-EHKNJANAME      PIC  X(10).
               05  SKT2500-EHKNJANUM       PIC  X(06).
               05  SKT2500-EKENSU          PIC  X(05).
      *合計件数
           03  SKT2500-GKENSU              PIC  X(06).
