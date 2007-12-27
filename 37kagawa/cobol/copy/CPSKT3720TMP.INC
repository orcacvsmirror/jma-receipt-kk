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
      ************************************************************
      *    ø«Œ≈ ÛΩ∑¿¡µ·ΩÒ     COPY (CPSKT3720TMP.INC)              *
      *
      *  •≥•‘°º∂ÁΩ§¿µÕ˙ŒÚ
      * Maj/Min/Rev  Ω§¿µº‘       ∆¸…’      ∆‚Õ∆
      ************************************************************
       01  SKT3720TMP-REC.
           03  SKT3720TMP-KEY.
      *∏©∆‚°¶∏©≥∞
               05  SKT3720TMP-PREFKBN           PIC  X(01).
      *
      *¿¡µ·•∆°º•÷•Î
           03  SKT3720TMP-HKN-AREA  OCCURS  11.
      *∑ÔøÙ
               05  SKT3720TMP-KENSU        PIC 9(05).
      *∂‚≥€
               05  SKT3720TMP-KINGK        PIC 9(09).
      *…∏Ω‡…È√¥≥€
               05  SKT3720TMP-FTNGK        PIC 9(09).
      *
      *∑Î≥À°¶¿∫ø¿
           03  SKT3720TMP-35-AREA.
      *∑Î≥À°ø∑ÔøÙ
               05  SKT3720TMP-35-KENSU     PIC 9(05).
      *∑Î≥À°ø∂‚≥€
               05  SKT3720TMP-35-KINGK     PIC 9(09).
      *∑Î≥À°ø…∏Ω‡…È√¥≥€
               05  SKT3720TMP-35-FTNGK     PIC 9(09).
      *
      *∏¯»Ò•∆°º•÷•Î
           03  SKT3720TMP-KOH-AREA  OCCURS  20.
      *∏¯»Ò»÷πÊ
               05  SKT3720TMP-KOHNUM      PIC X(03).
      *∏¯»Ò°ø∑ÔøÙ
               05  SKT3720TMP-KKENSU      PIC 9(05).
      *∏¯»Ò°ø∂‚≥€
               05  SKT3720TMP-KKINGK      PIC 9(09).
      *∏¯»Ò°ø…∏Ω‡…È√¥≥€
               05  SKT3720TMP-KFTNGK      PIC 9(09).
