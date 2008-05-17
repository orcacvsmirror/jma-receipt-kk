        01  SKT2040.
            02  SKT2040-HKNJANUM    PIC X(12).
            02  SKT2040-HOSPCD  PIC X(14).
            02  SKT2040-ZAI1    PIC X(2).
            02  SKT2040-ZAI2    PIC X(2).
            02  SKT2040-NO  PIC X(4).
            02  SKT2040-KOH-TBL         OCCURS  7 TIMES.
              03  SKT2040-KOHNUM  PIC X(4).
              03  SKT2040-KOHNAME PIC X(12).
              03  SKT2040-K-NYUGAI-TBL            OCCURS  2 TIMES.
                04  SKT2040-K-KENSU PIC X(8).
                04  SKT2040-K-NISSU PIC X(8).
                04  SKT2040-K-TENSU PIC X(16).
                04  SKT2040-K-ITBFTN    PIC X(16).
              03  SKT2040-K-SKENSU    PIC X(8).
              03  SKT2040-K-SNISSU    PIC X(8).
              03  SKT2040-K-SKINGK    PIC X(16).
              03  SKT2040-K-SFTNGK    PIC X(16).
            02  SKT2040-TYOKI-TBL       OCCURS  3 TIMES.
              03  SKT2040-T-KENSU PIC X(6).
