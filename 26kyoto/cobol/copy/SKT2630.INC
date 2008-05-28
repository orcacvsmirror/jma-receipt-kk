        01  SKT2630.
            02  SKT2630-NO  PIC X(4).
            02  SKT2630-SRYYM   PIC X(16).
            02  SKT2630-SEIYMD  PIC X(22).
            02  SKT2630-ADRS    PIC X(100).
            02  SKT2630-HOSPNAME    PIC X(100).
            02  SKT2630-KAISETUNAME PIC X(40).
            02  SKT2630-TEL PIC X(15).
            02  SKT2630-HKNJANUM    PIC X(16).
            02  SKT2630-HOSPCD  PIC X(14).
            02  SKT2630-ZAI1    PIC X(2).
            02  SKT2630-ZAI2    PIC X(2).
            02  SKT2630-SEIKYU-TBL      OCCURS  14 TIMES.
              03  SKT2630-NYUGAI-TBL      OCCURS  2 TIMES.
                04  SKT2630-KENSU   PIC X(5).
                04  SKT2630-NISSU   PIC X(5).
                04  SKT2630-TENSU   PIC X(9).
                04  SKT2630-ITBFTN  PIC X(9).
              03  SKT2630-S-KENSU PIC X(5).
              03  SKT2630-S-NISSU PIC X(5).
              03  SKT2630-S-KINGAKU   PIC X(9).
              03  SKT2630-S-FTNGAKU   PIC X(9).
            02  SKT2630-KOH-TBL         OCCURS  2 TIMES.
              03  SKT2630-KOHNAME PIC X(10).
              03  SKT2630-K-NYUGAIKBN-TBL         OCCURS  2 TIMES.
                04  SKT2630-KKENSU  PIC X(5).
                04  SKT2630-KNISSU  PIC X(5).
                04  SKT2630-KTENSU  PIC X(9).
                04  SKT2630-KITBFTN PIC X(9).
              03  SKT2630-S-KKENSU    PIC X(5).
              03  SKT2630-S-KNISSU    PIC X(5).
              03  SKT2630-S-KKINGAKU  PIC X(9).
              03  SKT2630-S-KFTNGAKU  PIC X(9).
