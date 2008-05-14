        01  SKT0210.
            02  SKT0210-HOSPCDN PIC X(40).
            02  SKT0210-SEIKYU-TBL      OCCURS  2 TIMES.
              03  SKT0210-NYUGAI-TBL      OCCURS  2 TIMES.
                04  SKT0210-KENSU   PIC X(5).
                04  SKT0210-NISSU   PIC X(5).
                04  SKT0210-TENSU   PIC X(9).
                04  SKT0210-ITBFTN  PIC X(11).
              03  SKT0210-S-KENSU PIC X(5).
              03  SKT0210-S-NISSU PIC X(5).
              03  SKT0210-S-KINGAKU   PIC X(9).
              03  SKT0210-S-FTNGAKU   PIC X(9).
            02  SKT0210-KOH-TBL         OCCURS  8 TIMES.
              03  SKT0210-KOHNAME PIC X(10).
              03  SKT0210-K-NYUGAI-TBL            OCCURS  2 TIMES.
                04  SKT0210-KKENSU  PIC X(5).
                04  SKT0210-KNISSU  PIC X(5).
                04  SKT0210-KTENSU  PIC X(9).
                04  SKT0210-KITBFTN PIC X(9).
              03  SKT0210-S-KKENSU    PIC X(5).
              03  SKT0210-S-KNISSU    PIC X(5).
              03  SKT0210-S-KKINGAKU  PIC X(9).
              03  SKT0210-S-KFTNGAKU  PIC X(9).
