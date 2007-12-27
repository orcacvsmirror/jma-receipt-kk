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
       01  SC05.
      *ø«Œ≈«Ø∑Ó
              03  SC05-PRTYM            PIC  X(16).
      * °ª„∞ÂŒ≈…È√¥º‘»÷πÊ
      ****2006/03/16 @@@@-BRAND  START
      *        03  SC05-FTNJANUM         PIC  X(08).
              03  SC05-FTNJANUM.
                05  SC05-FTNJANUM1      PIC  X(02).
                05  SC05-FTNJANUM2      PIC  X(02).
                05  SC05-FTNJANUM3      PIC  X(02).
                05  SC05-FTNJANUM4      PIC  X(02).
      *ª‘ƒÆ¬ºÃæ
      *       03  SC05-TOWNNAME	        PIC  X(14).
              03  SC05-TOWNNAME	        PIC  X(16).
      ****2006/03/16 @@@@-BRAND  END
      *¿¡µ·«Ø∑Ó∆¸
              03  SC05-SEIYMD           PIC  X(22).
      *∞ÂŒ≈µ°¥ÿ•≥°º•…
      ****2006/03/16 @@@@-BRAND  START
      *        03  SC05-HOSPCD           PIC  X(14).
              03  SC05-HOSPCD.
                05 SC05-HOSPCD1         PIC  X(02).
                05 SC05-HOSPCD2         PIC  X(02).
                05 SC05-HOSPCD3         PIC  X(02).
                05 SC05-HOSPCD4         PIC  X(02).
                05 SC05-HOSPCD5         PIC  X(02).
                05 SC05-HOSPCD6         PIC  X(02).
                05 SC05-HOSPCD7         PIC  X(02).
      ****2006/03/16 @@@@-BRAND  END
      *ΩªΩÍ
      ****2006/03/16 @@@@-BRAND  START
      *        03  SC05-ADRS             PIC  X(80).
              03  SC05-ADRS             PIC  X(100).
      ****2006/03/16 @@@@-BRAND  END
      *∞ÂŒ≈µ°¥ÿÃæ
      ****2006/03/16 @@@@-BRAND  START
      *        03  SC05-HOSPNAME         PIC  X(80).
              03  SC05-HOSPNAME         PIC  X(100).
      ****2006/03/16 @@@@-BRAND  END
      *¥…Õ˝º‘Ãæ
      ****2006/03/16 @@@@-BRAND  START
      *        03  SC05-KANRINAME        PIC  X(40).
              03  SC05-KANRINAME         PIC  X(30).
      ****2006/03/16 @@@@-BRAND  END
      *≈≈œ√»÷πÊ
      ****2006/03/16 @@@@-BRAND  START
              03  SC05-TEL         PIC  X(30).
      ****2006/03/16 @@@@-BRAND  END
      *πÁ∑◊
      ****2006/03/16 @@@@-BRAND  START
      *       03  SC05-GOUKEI-TBL       OCCURS  6.
             03  SC05-GOUKEI-TBL       OCCURS  2.
      ****2006/03/16 @@@@-BRAND  END
                  05  SC05-KENSU        PIC  X(5).
      ****2006/03/16 @@@@-BRAND  START
      *            05  SC05-GNISSU       PIC  X(5).
                  05  SC05-GNISSU       PIC  X(6).
      ****2006/03/16 @@@@-BRAND  END
                  05  SC05-GTENSU       PIC  X(9).
                  05  SC05-GYKZFTN      PIC  X(7).
      ****2006/03/16 @@@@-BRAND  START
      *            05  SC05-GKYUFUGAKU   PIC  X(9).
                  05  SC05-GKYUFU        PIC  X(9).
      ****2006/03/16 @@@@-BRAND  END
                  05  SC05-GKOUJO       PIC  X(9).
      ****2006/03/16 @@@@-BRAND  START
      *            05  SC05-GTYOKI       PIC  X(3).
                  05  SC05-GTYOKI       PIC  X(2).
      ****2006/03/16 @@@@-BRAND  END
      ****2006/03/16 @@@@-BRAND  START
              03  SC05-KOHBTNUM     PIC  X(02).
              03  SC05-KOHKENSU     PIC  X(05).
              03  SC05-KOHTENSU     PIC  X(09).
              03  SC05-KOHKYUFU     PIC  X(09).
              03  SC05-HYGOUKEI-TBL          OCCURS 3.
                  05  SC05-KBTNUM     PIC  X(02).
                  05  SC05-KKENSU      PIC  X(05).
                  05  SC05-KTENSU     PIC  X(09).
                  05  SC05-KKYUFU     PIC  X(09).
      ****2006/03/16 @@@@-BRAND  END
                  
      *¡ÌπÁ∑◊
              03  SC05-GKENSU           PIC  X(5).
      *∏ƒ Ã
      ****2006/03/16 @@@@-BRAND  START
      *            03  SC05-KOBETU-TBL       OCCURS  20.
                  03  SC05-KOBETU-TBL       OCCURS  16.
      ****2006/03/16 @@@@-BRAND  END
                  05  SC05-JKYSNUM      PIC  X(7).
      ****2006/03/16 @@@@-BRAND  START
      *           05  SC05-NAME	        PIC  X(14).
                  05  SC05-NAME	        PIC  X(20).
      *           05  SC05-HKNJANUM     PIC  X(8).
                  05  SC05-HKNJANUM     PIC  X(9).
      *            05  SC05-KIGONUM      PIC  X(14).
                  05  SC05-KIGONUM      PIC  X(36).
                  05  SC05-KOH1FTNJANUM    PIC  X(8).
                  05  SC05-KOH1JKYJANUM    PIC  X(7).
      ****2006/03/16 @@@@-BRAND  END
                  05  SC05-SRYYM        PIC  X(4).
                  05  SC05-NYUGAIKBN    PIC  X(1).
      ****2006/03/16 @@@@-BRAND  START
                  05  SC05-BIRTHDAY    PIC  X(9).
      ****2006/03/16 @@@@-BRAND  END
                  05  SC05-KYUFURATE    PIC  X(1).
                  05  SC05-TYOKI        PIC  X(2).
      *            05  SC05-KAMOKU      PIC  X(2).
      ****2006/03/16 @@@@-BRAND  START
                  05  SC05-ZAITAKU    PIC  X(1).
      ****2006/03/16 @@@@-BRAND  END
                  05  SC05-NISSU        PIC  X(2).
      ****2006/03/16 @@@@-BRAND  START
                  05  SC05-KOH1TEN    PIC  X(7).
                  05  SC05-FKSTEN     PIC  X(7).
                  05  SC05-FTNMONEY   PIC  X(7).
                  05  SC05-KOH1FTNKT  PIC  X(7).
      ****2006/03/16 @@@@-BRAND  END
                  05  SC05-KESEMARU     PIC  X(2).
                  05  SC05-TENSU        PIC  X(7).
                  05  SC05-YKZFTN       PIC  X(5).
                  05  SC05-KYUFUGAKU    PIC  X(7).
      ****2006/03/16 @@@@-BRAND  START
      *            05  SC05-KOUJO        PIC  X(7).
                  05  SC05-KOUJO        PIC  X(6).
      ****2006/03/16 @@@@-BRAND  END
