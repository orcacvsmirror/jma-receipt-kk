      *******************************************************************
      * Project code name "ORCA"
      * 日医標準レセプトソフト（JMA standard receipt software）
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
       01  SKT1400.
              03  SKT1400-SEIYM               PIC  X(16).
              03  SKT1400-HOSPNAME            PIC  X(100).
              03  SKT1400-HOSPCD              PIC  X(20).
              03  SKT1400-SEIKYU.
                  05  SKT1400-HKNJASU         PIC  X(05).
                  05  SKT1400-N-KENSU         PIC  X(07).
                  05  SKT1400-N-TENSU         PIC  X(14).
                  05  SKT1400-G-KENSU         PIC  X(07).
                  05  SKT1400-G-TENSU         PIC  X(14).
                  05  SKT1400-KENSU-KEI       PIC  X(07).
                  05  SKT1400-TENSU-KEI       PIC  X(14).
                  05  SKT1400-S-KENSU         PIC  X(07).
                  05  SKT1400-S-MONEY         PIC  X(14).
                  05  SKT1400-UKETUKE-SU      PIC  X(07).
