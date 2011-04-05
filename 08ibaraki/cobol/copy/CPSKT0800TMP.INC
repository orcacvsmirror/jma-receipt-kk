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
      ************************************************************
      *    ¿ÇÎÅÊó½·ÀÁµá½ñ     COPY (CPSKT0800TMP.INC)              *
      *
      *  ¥³¥Ô¡¼¶ç½¤ÀµÍúÎò
      * Maj/Min/Rev  ½¤Àµ¼Ô       ÆüÉÕ      ÆâÍÆ
      *  01.00.01       Ä¹²°   08/04/26    Ä¢É¼ÍÍ¼°¤ËÈ¼¤¦½¤Àµ
      *  01.00.02       µÈÀî   11/04/04    ÅìËÌÃÏÊýÂÀÊ¿ÍÎ²­ÃÏ¿ÌÂÐ±þ
      ************************************************************
       01  SKT0800TMP-REC.
           03  SKT0800TMP-KEY.
               05  SKT0800TMP-PREFKBN           PIC  X(01).
      *=== ºÒ³²ÂÐ±þ by Yoshikawa(2011/04/04) start
               05  SKT0800TMP-GENMEN            PIC  X(01).
      *=== ºÒ³²ÂÐ±þ by Yoshikawa(2011/04/04) end
      *---(01.00.01) LINE ADD START -----------------------------------
      *     03       SKT0800TMP-SEIKYU-TBL OCCURS 3.
           03       SKT0800TMP-SEIKYU-TBL OCCURS 4.
      *---(01.00.01) LINE ADD START -----------------------------------
                 05   SKT0800TMP-NYUGAI-TBL OCCURS 2.
                      07  SKT0800TMP-KENSU      PIC  9(07).
                      07  SKT0800TMP-TENSU      PIC  9(14).
                 05   SKT0800TMP-S-KENSU        PIC  9(07).
                 05   SKT0800TMP-S-KINGK        PIC  9(11).
           03  SKT0800TMP-SYOKBN-TBL OCCURS 2.
      *---(01.00.01) LINE ADD START -----------------------------------
      *           05    SKT0800TMP-KOH-TBL OCCURS 3.
                 05    SKT0800TMP-KOH-TBL OCCURS 5.
      *---(01.00.01) LINE ADD START -----------------------------------
                      07    SKT0800TMP-KKENSU        PIC  9(07).
                      07    SKT0800TMP-KTENSU        PIC  9(14).
