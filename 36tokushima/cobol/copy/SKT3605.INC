        01  SKT3605.
            02  SKT3605-SRYYM   PIC X(16).
            02  SKT3605-SEIYMD  PIC X(22).
            02  SKT3605-HOSPCD  PIC X(20).
            02  SKT3605-POST    PIC X(8).
            02  SKT3605-ADRS    PIC X(100).
            02  SKT3605-HOSPNAME    PIC X(100).
            02  SKT3605-KAISETU PIC X(30).
            02  SKT3605-PREFKBN PIC X(8).
            02  SKT3605-ZAI1    PIC X(2).
            02  SKT3605-ZAI2    PIC X(2).
            02  SKT3605-SEIKYU          OCCURS  11 TIMES.
              03  SKT3605-NYUGAIKBN       OCCURS  2 TIMES.
                04  SKT3605-KENSU   PIC X(5).
                04  SKT3605-NISSU   PIC X(5).
                04  SKT3605-TENSU   PIC X(9).
                04  SKT3605-ITBFTN2 PIC X(10).
              03  SKT3605-ITBFTN  PIC X(9).
              03  SKT3605-SKENSU  PIC X(5).
              03  SKT3605-SNISSU  PIC X(5).
              03  SKT3605-SKINGK  PIC X(9).
              03  SKT3605-SFTNGK  PIC X(9).
            02  SKT3605-KOH-TBL         OCCURS  7 TIMES.
              03  SKT3605-KOHNAME PIC X(12).
              03  SKT3605-KOHNAME2 PIC X(20).
              03  SKT3605-K-NYUGAI        OCCURS  2 TIMES.
                04  SKT3605-K-KENSU PIC X(5).
                04  SKT3605-K-NISSU PIC X(5).
                04  SKT3605-K-TENSU PIC X(9).
                04  SKT3605-K-ITBFTN    PIC X(9).
              03  SKT3605-K-SKENSU    PIC X(5).
              03  SKT3605-K-SNISSU    PIC X(5).
              03  SKT3605-K-SKINGK    PIC X(9).
              03  SKT3605-K-SFTNGK    PIC X(9).
