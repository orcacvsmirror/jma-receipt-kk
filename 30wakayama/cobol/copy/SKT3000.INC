        01  SKT3000.
            02  SKT3000-PRTYM   PIC X(16).
            02  SKT3000-HKNJANUM    PIC X(12).
            02  SKT3000-HKNJANAME   PIC X(26).
            02  SKT3000-ZAIMARU PIC X(2).
            02  SKT3000-ZAIMOJI PIC X(2).
            02  SKT3000-SEIYMD  PIC X(22).
            02  SKT3000-HOSPCD  PIC X(7).
            02  SKT3000-ADRS    PIC X(80).
            02  SKT3000-HOSPNAME    PIC X(80).
            02  SKT3000-KAISETUNAME PIC X(40).
            02  SKT3000-TEL PIC X(15).
            02  SKT3000-NO  PIC X(4).
            02  SKT3000-DATA1           OCCURS  9 TIMES.
              03  SKT3000-NYUGAI-TBL      OCCURS  2 TIMES.
                04  SKT3000-KENSU   PIC X(5).
                04  SKT3000-NISSU   PIC X(5).
                04  SKT3000-TENSU   PIC X(9).
                04  SKT3000-ITBFTN  PIC X(9).
              03  SKT3000-SKENSU  PIC X(5).
              03  SKT3000-SNISSU  PIC X(5).
              03  SKT3000-SKINGK  PIC X(9).
              03  SKT3000-SFTNGK  PIC X(9).
            02  SKT3000-DATA2           OCCURS  8 TIMES.
              03  SKT3000-KOHNAME PIC X(8).
              03  SKT3000-HBTNUM  PIC X(2).
              03  SKT3000-NYUGAIKBN       OCCURS  2 TIMES.
                04  SKT3000-K-KENSU PIC X(5).
                04  SKT3000-K-NISSU PIC X(5).
                04  SKT3000-K-TENSU PIC X(9).
                04  SKT3000-K-ITBFTN    PIC X(9).
              03  SKT3000-K-SKENSU    PIC X(5).
              03  SKT3000-K-SNISSU    PIC X(5).
              03  SKT3000-K-SKINGK    PIC X(9).
              03  SKT3000-K-SFTNGK    PIC X(9).
            02  SKT3000-TYOKI-TBL       OCCURS  2 TIMES.
              03  SKT3000-TYOKI   PIC X(7).
            02  SKT3000-GOKEI-TBL       OCCURS  2 TIMES.
              03  SKT3000-GKENSU  PIC X(5).
              03  SKT3000-GKINGAKU    PIC X(9).
            02  SKT3000-NYUIN   PIC X(2).
            02  SKT3000-GAIRAI  PIC X(2).
