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
       01  SC03.
      *表示年月
              03  SC03-PRTYM            PIC  X(16).
      *住所
              03  SC03-ADRS             PIC  X(100).
      *医療機関名
              03  SC03-HOSPNAME         PIC  X(100).
      *開設者名
              03  SC03-KAISETUNAME     	PIC  X(40).
      *診療テーブル
              03  SC03-SRYTBL           OCCURS  10.
      *受診者氏名
                  05  SC03-NAME         PIC  X(20).
      *受給者番号
                  05  SC03-JKYSNUM      PIC  X(09).
      *保険区分：社保
                  05  SC03-SYAHO        PIC  X(02).
      *保険区分：国保
                  05  SC03-KOKUHO       PIC  X(02).
      *総点数
                  05  SC03-TENSU        PIC  X(07).
      *個人負担割合
                  05  SC03-FTN1	        PIC  X(02).
                  05  SC03-FTN2         PIC  X(02).
                  05  SC03-FTN3	        PIC  X(02).
      *薬剤一部負担金
                  05  SC03-YKZFTN       PIC  X(06).
      *備考
              03  SC03-BIKO-TBL OCCURS 10.
                  05  SC03-BIKO         PIC  X(07).

