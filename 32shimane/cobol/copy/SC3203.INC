      *******************************************************************
      * Project code name "ORCA"
      * Æü°åÉ¸½à¥ì¥»¥×¥È¥½¥Õ¥È¡ÊJMA standard receipt software¡Ë
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
      *¿ÇÎÅÇ¯·î
              03  SC03-PRTYM	        PIC  X(16).
      *»ÔÄ®Â¼ÈÖ¹æ
              03  SC03-TOWNNUM	        PIC  X(8).
      *¸øÈñÉéÃ´¼ÔÈÖ¹æ
              03  SC03-KOHFTNJANUM      PIC  X(8).
      *°åÎÅµ¡´Ø¥³¡¼¥É
              03  SC03-HOSPCD           PIC  X(20).
      *ÅÀ¿ô¶èÊ¬É½¡§£±°å²Ê
              03  SC03-TENHYOKBN1       PIC  X(2).
      *ÅÀ¿ô¶èÊ¬É½¡§£³»õ²Ê
              03  SC03-TENHYOKBN2       PIC  X(2).
      *ÅÀ¿ô¶èÊ¬É½¡§£´Ä´ºÞ
              03  SC03-TENHYOKBN3       PIC  X(2).
      *»ÔÄ®Â¼Ì¾
              03  SC03-TOWNNAME	        PIC  X(14).
      *ÀÁµáÇ¯·îÆü
              03  SC03-SEIYMD           PIC  X(22).
      *½»½ê
              03  SC03-ADRS             PIC  X(100).
      *°åÎÅµ¡´ØÌ¾
              03  SC03-HOSPNAME	        PIC  X(100).
      *´ÉÍý¼ÔÌ¾
              03  SC03-KANRINAME        PIC  X(24).
      *ÅÅÏÃÈÖ¹æ
              03  SC03-TEL              PIC  X(30).
      *¹ç·×
              03  SC03-GOUKEI-TBL       OCCURS  2.
                  05  SC03-KENSU        PIC  X(5).
                  05  SC03-GNISSU       PIC  X(5).
                  05  SC03-GTENSU       PIC  X(9).
                  05  SC03-GTYO         PIC  X(2).
                  05  SC03-GKOUJO       PIC  X(9).
      *¸øÈñ"90"¹ç·×
              03  SC03-KOHISAIKEI90-TBL.
                  05  SC03-GKOHNUM           PIC  X(2).
                  05  SC03-GKKENSU           PIC  X(5).
                  05  SC03-GKTENSU           PIC  X(9).
                  05  SC03-GKFTNKG           PIC  X(9).
      *¸øÈñºÆ·Ç¹ç·×
              03  SC03-KOHISAIKEI-TBL   OCCURS  3.
                  05  SC03-KOHNUM           PIC  X(2).
                  05  SC03-KKENSU           PIC  X(5).
                  05  SC03-KTENSU           PIC  X(9).
                  05  SC03-KFTNKG           PIC  X(9).
      *Áí¹ç·×
              03  SC03-GKENSU           PIC  X(5).
      *¸ÄÊÌ
              03  SC03-KOBETU-TBL       OCCURS  14.
                  05  SC03-JKYSNUM      PIC  X(7).
                  05  SC03-NAME	        PIC  X(18).
                  05  SC03-HKNJANUM     PIC  X(8).
                  05  SC03-KIGONUM      PIC  X(36).
                  05  SC03-KOH1FTNJANUM  PIC  X(8).
                  05  SC03-KOH1JKYJANUM  PIC  X(7).
                  05  SC03-BIRTHDAY     PIC  X(9).
                  05  SC03-SRYYM        PIC  X(4).
                  05  SC03-NYUGAIKBN    PIC  X(1).
                  05  SC03-KYUFURATE    PIC  X(1).
                  05  SC03-TYOKI        PIC  X(2).
                  05  SC03-NISSU        PIC  X(2).
                  05  SC03-TENSU        PIC  X(7).
                  05  SC03-KOH1TEN      PIC  X(7).
                  05  SC03-NYUYOJITEN   PIC  X(7).
                  05  SC03-KOH1FTNKG    PIC  X(7).
                  05  SC03-KOUJO        PIC  X(7).
