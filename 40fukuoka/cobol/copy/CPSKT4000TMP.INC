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
      *    ¿ÇÎÅÊó½·ÀÁµá½ñ     COPY (CPSKT4000TMP.INC)              *
      *
      *  ¥³¥Ô¡¼¶ç½¤ÀµÍúÎò
      * Maj/Min/Rev  ½¤Àµ¼Ô       ÆüÉÕ      ÆâÍÆ
      * 01.00.01     ÆâÅÄ       09/10/14  Ãæ¹ñ¶å½£ËÌÉô¹ë±«ÂÐ±þ
      ************************************************************
       01  SKT4000TMP-REC.
           03  SKT4000TMP-KEY.
      *=== Ãæ¹ñ¶å½£ËÌÉô¹ë±«ÂÐ±þ by Uchida(2009/10/14) start
               05  SKT4000TMP-GENMEN                PIC  X(01).
      *=== Ãæ¹ñ¶å½£ËÌÉô¹ë±«ÂÐ±þ by Uchida(2009/10/14) end
               05  SKT4000TMP-SYUTURYOKU            PIC  9(01).
               05  SKT4000TMP-HKNJANUM              PIC  X(06).
           03  SKT4000TMP-NYUGAIKBN   OCCURS  2.
               05  SKT4000TMP-AREA      OCCURS  5.
                   07  SKT4000TMP-KENSU             PIC  9(06).
                   07  SKT4000TMP-TENSU             PIC  9(10).
           03  SKT4000TMP-KOH-AREA  OCCURS  2.
               05  SKT4000TMP-KOH-KENSU             PIC  9(06).
               05  SKT4000TMP-KOH-TENSU             PIC  9(10).
