        01  SKT0230.
            02  SKT0230-HOSPCDN PIC X(40).
            02  SKT0230-NO  PIC X(4).
            02  SKT0230-SEIKYU-TBL      OCCURS  2 TIMES.
              03  SKT0230-NYUGAI-TBL      OCCURS  2 TIMES.
                04  SKT0230-KENSU   PIC X(5).
                04  SKT0230-NISSU   PIC X(5).
                04  SKT0230-TENSU   PIC X(9).
                04  SKT0230-ITBFTN  PIC X(11).
              03  SKT0230-S-KENSU PIC X(5).
              03  SKT0230-S-NISSU PIC X(5).
              03  SKT0230-S-KINGAKU   PIC X(9).
              03  SKT0230-S-FTNGAKU   PIC X(9).
            02  SKT0230-KOH-TBL         OCCURS  8 TIMES.
              03  SKT0230-HBTNUM  PIC X(2).
              03  SKT0230-KOHNAME PIC X(10).
              03  SKT0230-K-NYUGAI-TBL            OCCURS  2 TIMES.
                04  SKT0230-KKENSU  PIC X(5).
                04  SKT0230-KNISSU  PIC X(5).
                04  SKT0230-KTENSU  PIC X(9).
                04  SKT0230-KITBFTN PIC X(9).
              03  SKT0230-S-KKENSU    PIC X(5).
              03  SKT0230-S-KNISSU    PIC X(5).
              03  SKT0230-S-KKINGAKU  PIC X(9).
              03  SKT0230-S-KFTNGAKU  PIC X(9).
