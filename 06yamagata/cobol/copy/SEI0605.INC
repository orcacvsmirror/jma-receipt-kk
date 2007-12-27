      *******************************************************************
      * Project code name "ORCA"
      * Æü°åÉ¸½à¥ì¥»¥×¥È¥½¥Õ¥È¡ÊJMA standard receipt software¡Ë
      * Copyright(C) 2002 JMA (Japan Medical Association)
      *
      * This program is part of "JMA standard receipt software".
      *
      *     This program is distributed in the hope that it will beuseful
      * for further advancement in medical care, according to JMA Open
      * Source License, but WITHOUT ANY WARRANTY.
      *     Everyone is granted permission to use, copy, modify and
      * redistribute this program, but only under the conditionsdescribed
      * in the JMA Open Source License. You should have received acopy of
      * this license along with this program. If not, stop using this
      * program and contact JMA, 2-28-16 Honkomagome, Bunkyo-ku,Tokyo,
      * 113-8621, Japan.
      ********************************************************************
      ************************************************************
      *      Ê¡»ã°åÎÅÈñÀÁµá½ñ                 COPY (SEI0603.INC) *
      ************************************************************
      ************************************************************
      *  ¥³¥Ô¡¼¶ç½¤ÀµÍúÎò
      * Maj/Min/Rev  ½¤Àµ¼Ô       ÆüÉÕ      ÆâÍÆ
      ************************************************************
      *01  MF100-REC.
           03  MF100-KEY.
      *»ÔÄ®Â¼ÈÖ¹æ
               05  MF100-CITYNUM         PIC  X(04).
      *¥Ç¡¼¥¿
           03  MF100-SEIKYU81-TBL       OCCURS  7 TIMES.
      *£¸£±¡§·ï¿ô
               05  MF100-KENSU81       PIC 9(5).
      *£¸£±¡§ÅÀ¿ô
               05  MF100-TENSU81       PIC 9(9).
           03  MF100-SEIKYU82-TBL       OCCURS  7 TIMES.
      *£¸£²¡§·ï¿ô
               05  MF100-KENSU82       PIC 9(5).
      *£¸£²¡§ÅÀ¿ô
               05  MF100-TENSU82       PIC 9(9).
      *£¸£²¡§°ìÉôÉéÃ´¶â
               05  MF100-ITBFTN82      PIC 9(9).
           03  MF100-SEIKYU83-TBL       OCCURS  2 TIMES.
      *£¸£³¡§·ï¿ô
               05  MF100-KENSU83       PIC 9(5).
      *£¸£³¡§ÅÀ¿ô
               05  MF100-TENSU83       PIC 9(9).
           03  MF100-SEIKYU84-TBL       OCCURS  2 TIMES.
      *£¸£´¡§·ï¿ô
               05  MF100-KENSU84       PIC 9(5).
      *£¸£´¡§ÅÀ¿ô
               05  MF100-TENSU84       PIC 9(9).
      *£¸£´¡§°ìÉôÉéÃ´¶â
               05  MF100-ITBFTN84      PIC 9(9).
           03  MF100-SEIKYU85-TBL       OCCURS  7 TIMES.
      *£¸£µ¡§·ï¿ô
               05  MF100-KENSU85       PIC 9(5).
      *£¸£µ¡§ÅÀ¿ô
               05  MF100-TENSU85       PIC 9(9).
