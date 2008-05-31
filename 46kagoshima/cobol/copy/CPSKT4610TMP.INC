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
      *    ø«Œ≈ ÛΩ∑¿¡µ·ΩÒ     COPY (CPSKT4610TMP.INC)            *
      *
      *  •≥•‘°º∂ÁΩ§¿µÕ˙ŒÚ
      * Maj/Min/Rev  Ω§¿µº‘       ∆¸…’      ∆‚Õ∆
      *  01.00.01    ∞À∆£    08/04/24    ƒ¢…ºÕÕº∞§À»º§¶Ω§¿µ
      ************************************************************
       01  SKT4610TMP-REC.
           03  SKT4610TMP-KEY.
               05  SKT4610TMP-SYUTURYOKU          PIC  9(01).
               05  SKT4610TMP-KOUKI               PIC  9(01).
               05  SKT4610TMP-HKNJANUM            PIC  X(06).
               05  SKT4610TMP-ZAITAKU             PIC  X(01).
               05  SKT4610TMP-SRYYM               PIC  9(06).
               05  SKT4610TMP-KYURATE             PIC  9(03).
               05  SKT4610TMP-HENREIKBN           PIC  X(01).
           03  SKT4610TMP-PAGE-FLG2               PIC  9(01).
           03  SKT4610TMP-KOH-CNT                 PIC  9(02).
           03  SKT4610TMP-TBL             OCCURS  11.
               05  SKT4610TMP-NYUGAI-TBL  OCCURS  2.
                   07  SKT4610TMP-KENSU               PIC  9(06).
                   07  SKT4610TMP-NISSU               PIC  9(06).
                   07  SKT4610TMP-TENSU               PIC  9(10).
                   07  SKT4610TMP-ITBFTN              PIC  9(10).
               05  SKT4610TMP-SKENSU                  PIC  9(06).
               05  SKT4610TMP-SNISSU                  PIC  9(05).
               05  SKT4610TMP-SKINGK                  PIC  9(10).
               05  SKT4610TMP-SFTNGK                  PIC  9(10).
           03  SKT4610TMP-KOH-AREA.
               05  SKT4610TMP-KOH-TBL  OCCURS  20.
                   07  SKT4610TMP-KOHNUM              PIC  X(03).
                   07  SKT4610TMP-KOH-NYUGAI-TBL OCCURS 2.
                       09  SKT4610TMP-K-KENSU         PIC  9(05).
                       09  SKT4610TMP-K-NISSU         PIC  9(05).
                       09  SKT4610TMP-K-TENSU         PIC  9(09).
                       09  SKT4610TMP-K-ITBFTN        PIC  9(09).
                   07  SKT4610TMP-K-SKENSU            PIC  9(05).
                   07  SKT4610TMP-K-SNISSU            PIC  9(05).
                   07  SKT4610TMP-K-SKINGK            PIC  9(09).
                   07  SKT4610TMP-K-SFTNGK            PIC  9(09).
           03  SKT4610TMP-GENBK                      PIC  9(04).
      *---(01.00.01) LINE ADD START ------------------------------------
           03  SKT4610TMP-HKNNUM-S                    PIC  X(03).
      *---(01.00.01) LINE ADD END   ------------------------------------
