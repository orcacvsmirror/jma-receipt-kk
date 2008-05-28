        01  SKT2220.
            02  SKT2220-PRTYM   PIC X(16).
            02  SKT2220-HKNJANUM    PIC X(12).
            02  SKT2220-HKNJANAME   PIC X(26).
            02  SKT2220-ZAIMARU PIC X(2).
            02  SKT2220-ZAIMOJI PIC X(2).
            02  SKT2220-SEIYMD  PIC X(22).
            02  SKT2220-HOSPCD  PIC X(7).
            02  SKT2220-ADRS    PIC X(100).
            02  SKT2220-HOSPNAME    PIC X(100).
            02  SKT2220-KAISETUNAME PIC X(40).
            02  SKT2220-TEL PIC X(15).
            02  SKT2220-NO  PIC X(4).
            02  SKT2220-DATA1           OCCURS  2 TIMES.
              03  SKT2220-NYUGAI-TBL      OCCURS  2 TIMES.
                04  SKT2220-KENSU   PIC X(5).
                04  SKT2220-NISSU   PIC X(5).
                04  SKT2220-TENSU   PIC X(9).
                04  SKT2220-ITBFTN  PIC X(9).
              03  SKT2220-SKENSU  PIC X(5).
              03  SKT2220-SNISSU  PIC X(5).
              03  SKT2220-SKINGK  PIC X(9).
              03  SKT2220-SFTNGK  PIC X(9).
            02  SKT2220-DATA2           OCCURS  4 TIMES.
              03  SKT2220-KOHNAME PIC X(8).
              03  SKT2220-HBTNUM  PIC X(2).
              03  SKT2220-NYUGAIKBN       OCCURS  2 TIMES.
                04  SKT2220-K-KENSU PIC X(5).
                04  SKT2220-K-NISSU PIC X(5).
                04  SKT2220-K-TENSU PIC X(9).
                04  SKT2220-K-ITBFTN    PIC X(9).
              03  SKT2220-K-SKENSU    PIC X(5).
              03  SKT2220-K-SNISSU    PIC X(5).
              03  SKT2220-K-SKINGK    PIC X(9).
              03  SKT2220-K-SFTNGK    PIC X(9).
            02  SKT2220-TYOKI-TBL       OCCURS  2 TIMES.
              03  SKT2220-TYOKI   PIC X(7).
