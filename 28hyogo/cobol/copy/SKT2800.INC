      *******************************************************************
      * Project code name "ORCA"
      * ∆¸∞Â…∏Ω‡•Ï•ª•◊•»•Ω•’•»° JMA standard receipt software°À
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
       01  SKT2800.
      *∞ı∫˛«Ø∑Ó
         03      SKT2800-SRYYM        PIC X(16).
      *…Ω Ã
         03      SKT2800-MARU1        PIC X(02).
         03      SKT2800-MARU2        PIC X(02).
         03      SKT2800-MARU3        PIC X(02).
      *ø«Œ≈≤ Ãæ
         03      SKT2800-SRYKAMEI     PIC X(34) OCCURS 3.
      *∞ÂŒ≈µ°¥ÿ•≥°º•…
         03      SKT2800-HOSPCD       PIC X(20).
      *Õπ ÿ»÷πÊ
         03      SKT2800-POST         PIC X(16).
      *∞ÂŒ≈µ°¥ÿΩªΩÍ
         03      SKT2800-ADRS         PIC X(100).
      *∞ÂŒ≈µ°¥ÿÃææŒ
         03      SKT2800-HOSPNAME     PIC X(100).
      *≥´¿ﬂº‘ª·Ãæ
         03      SKT2800-KAISETUNAME  PIC X(40).
      *≈≈œ√»÷πÊ
         03      SKT2800-TEL          PIC X(15).
      *∞ÂŒ≈µ°¥ÿ∂Ë ¨
         03      SKT2800-HOSPKBN      PIC X(02) OCCURS 5.
      *∑ÔøÙ
         03      SKT2800-KENSU-TBL    OCCURS 5.
           05    SKT2800-KENSU        PIC X(12).
      *≈¿øÙ
         03      SKT2800-TENSU-TBL    OCCURS 5.
           05    SKT2800-TENSU        PIC X(18).
      *¿¡µ·ΩÒÀÁøÙ
         03      SKT2800-SEIKYUSYO-TBL OCCURS 3.
           05    SKT2800-SEIKYUSYO    PIC X(06).
      *º“ › °ª„∞ÂŒ≈»Ò¿¡µ·∑ÔøÙ
         03      SKT2800-SYAHOSEIKYU  PIC X(06).
      ***** 05/06/30 INS
         03      SKT2800-SYAHOSEIKYU2 PIC X(06).
      *****
      *∏©≥∞ ›∏±º‘Ãæ
         03      SKT2800-KGIHKNJANAME-TBL  OCCURS  20.
           05    SKT2800-KGIHKNJANAME PIC X(20).
