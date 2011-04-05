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
      *    ¿ÇÎÅÊó½·ÀÁµá½ñ     COPY (CPSKT1200TMP.INC)              *
      *
      *  ¥³¥Ô¡¼¶ç½¤ÀµÍúÎò
      * Maj/Min/Rev  ½¤Àµ¼Ô       ÆüÉÕ      ÆâÍÆ
      *  01.00.01    µÈÀî         11/04/04  ÅìËÌÃÏÊýÂÀÊ¿ÍÎ²­ÃÏ¿ÌÂÐ±þ
      ************************************************************
       01  SKT1200TMP-REC.
           03  SKT1200TMP-KEY.
               05  SKT1200TMP-RECEKA               PIC  X(02).
      *=== ºÒ³²ÂÐ±þ by Yoshikawa(2011/04/04) start
               05  SKT1200TMP-GENMEN               PIC  X(01).
      *=== ºÒ³²ÂÐ±þ by Yoshikawa(2011/04/04) end
           03  SKT1200TMP-SEIKYU-TBL  OCCURS 6.
               05  SKT1200TMP-KENSU                PIC  9(06).
               05  SKT1200TMP-TENSU                PIC  9(10).
               05  SKT1200TMP-SKENSU               PIC  9(06).
               05  SKT1200TMP-SKINGK               PIC  9(10).
               05  SKT1200TMP-SFTNGK               PIC  9(10).
