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
      *  プログラム修正履歴
      * Maj/Min/Rev       修正者    日付          内容
      * 01.00.01          門間      08/09/25      診療年月の追加
      * 01.00.02          吉川      09/09/02      帳票様式の変更に伴う修正
      ********************************************************************
       01  SC07.
      * 01.00.01 診療年月追加 START MONMA --------------------------------
      *診療年月
         03  SC07-SRYYM            PIC  X(16).
      * 01.00.01 診療年月追加 END   MONMA --------------------------------
      *医療機関コード
         03  SC07-HOSPCD           PIC  X(07).
      *郵便番号
         03  SC07-POST             PIC  X(16).
      *住所
         03  SC07-ADRS             PIC  X(100).
      *医療機関名
         03  SC07-HOSPNAME         PIC  X(100).
      *開設者氏名
         03  SC07-KAISETUNAME      PIC  X(40).
      *電話番号
         03  SC07-TEL              PIC  X(15).
      *=== 帳票様式の変更 by Yoshikawa(2009/09/02) start
      *件数
      *   03  SC07-KENSU-TBL    OCCURS 2.
      *     05    SC07-KENSU        PIC  X(3).
      *点数表区分
         03  SC07-TENSUHYO         PIC  X(02)  OCCURS 3.
      *件数
         03  SC07-KENSU            PIC  X(03).
      *=== 帳票様式の変更 by Yoshikawa(2009/09/02) end
