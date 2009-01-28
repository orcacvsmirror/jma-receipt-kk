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
      *    ¿ÇÎÅÊó½·ÀÁµá½ñ     COPY (CPSKT1310TMP.INC)              *
      *
      *  ¥³¥Ô¡¼¶ç½¤ÀµÍúÎò
      * Maj/Min/Rev  ½¤Àµ¼Ô  ÆüÉÕ      ÆâÍÆ
      *  01.00.01    µÈÀî    09/01/26  ¸øÈñÌ¾¾ÎÄÉ²Ã
      ************************************************************
       01  SKT1310TMP-REC.
           03  SKT1310TMP-KEY.
               05  SKT1310TMP-SYUTURYOKU           PIC  9(01).
               05  SKT1310TMP-NYUGAIKBN            PIC  X(01).
               05  SKT1310TMP-HKNJANUM             PIC  X(06).
               05  SKT1310TMP-ZAITAKU              PIC  X(01).
           03  SKT1310TMP-KYURATE                  PIC  9(03).
           03  SKT1310TMP-SEIKYU-TBL     OCCURS  12.
               05  SKT1310TMP-KENSU                PIC  9(06).
               05  SKT1310TMP-NISSU                PIC  9(06).
               05  SKT1310TMP-TENSU                PIC  9(10).
               05  SKT1310TMP-ITBFTN               PIC  9(10).
               05  SKT1310TMP-S-KENSU              PIC  9(06).
               05  SKT1310TMP-S-NISSU              PIC  9(06).
               05  SKT1310TMP-S-KINGK              PIC  9(10).
               05  SKT1310TMP-S-FTNGK              PIC  9(10).
           03  SKT1310TMP-KOH-AREA.
               05  SKT1310TMP-KOH-TBL      OCCURS  20.
                   07  SKT1310TMP-KOHNUM           PIC  X(03).
      *=== ¸øÈñÌ¾¾ÎÄÉ²Ã by Yoshikawa(2009/01/26) start
                   07  SKT1310TMP-KOHNAME          PIC  X(10).
      *=== ¸øÈñÌ¾¾ÎÄÉ²Ã by Yoshikawa(2009/01/26) end
                   07  SKT1310TMP-KKENSU           PIC  9(06).
                   07  SKT1310TMP-KNISSU           PIC  9(06).
                   07  SKT1310TMP-KTENSU           PIC  9(10).
                   07  SKT1310TMP-KITBFTN          PIC  9(10).
                   07  SKT1310TMP-S-KKENSU         PIC  9(06).
                   07  SKT1310TMP-S-KNISSU         PIC  9(06).
                   07  SKT1310TMP-S-KKINGK         PIC  9(10).
                   07  SKT1310TMP-S-KFTNGK         PIC  9(10).
